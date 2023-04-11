Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7780C77B74
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 16:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fWK4Bz5iGOSi0GwnbXAUPP1TUbif3ui9q1niCs2wwDk=; b=1gdFQBsEO/EamugdARzf6ousKz
	N2z7cP9Wd5n4kUqN0PghxI25FSH4IA787bBOrfNdrTtRufrbOGZq/S18aZfbD2TI440eIQUX/i5PZ
	MQlpPp3vuACGQVeeDcW4x46jMC+4kCrXhgqVx8JMFpakPabTyWujeqO4QP0yhz/MLrdF8XX7IbQbM
	f3UgmE64UvfRYRbl6RTWxSSvvw7xpI8xW3oiEkcDdijLJtLGrVcA0I3N8D7SsNicaDx6VTJqUAk5N
	SaHihSkRuav+K57hgtUpNcuDHcu0oG509DLtsaCPQ/69CNDia3PhyFT43Z8sijgKNC4IsNTZHuXSp
	kpkp8srw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmHAd-000brT-0G;
	Tue, 11 Apr 2023 16:48:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmHAV-000bnW-06;
	Tue, 11 Apr 2023 16:48:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8577561F2A;
	Tue, 11 Apr 2023 16:48:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85416C433D2;
	Tue, 11 Apr 2023 16:48:28 +0000 (UTC)
Date: Tue, 11 Apr 2023 12:48:26 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
Cc: <mhiramat@kernel.org>, <bobule.chang@mediatek.com>,
 <wsd_upstream@mediatek.com>, <cheng-jui.wang@mediatek.com>,
 <npiggin@gmail.com>, <stable@vger.kernel.org>, AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, "Paul E. McKenney"
 <paulmck@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v3] ring-buffer: Prevent inconsistent operation on
 cpu_buffer->resize_disabled
Message-ID: <20230411124826.04d19759@gandalf.local.home>
In-Reply-To: <20230411124403.2a31e12d@gandalf.local.home>
References: <20230409024616.31099-1-Tze-nan.Wu@mediatek.com>
	<20230410073512.13362-1-Tze-nan.Wu@mediatek.com>
	<20230411124403.2a31e12d@gandalf.local.home>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_094831_119650_833CF69E 
X-CRM114-Status: GOOD (  12.11  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 11 Apr 2023 12:44:03 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> Please have each new patch be a new thread, and not a Cc to the previous

Should have been "reply to the previous" :-p

-- Steve

> version of the patch. As it makes it hard to find in INBOXs.


