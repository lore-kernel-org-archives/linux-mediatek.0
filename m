Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E3CC77B61
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 01:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ww2WbDipjbsHyKx4S4ctUn9of1I0s5KqXnviuDGwF6k=; b=1LcH31Nu911Fli75vvoleo2tXE
	umPEz9YiVBGJzFqFRoRbuQrIKS1znM/8ZUXHjJ7iQSushAmBbWpCthuTKszYVkM/eL7bs0J0H5rkC
	ZBWVSzA42DmGQ3+zNTz8aHgbh6TObWOXV/jDdAUQjpuQ8iIzRut3rdmzh4zklZO1g6t8BjtVQyEe8
	60tFYXO6SyK4A0Be3KAw0BwGJccIuLCYuHDqv+WMHCK3eGyOTWqqLML1kk4a0Z94PyMwYc31cO3k/
	FoUCa2vOMbPBWOaRxi7LmC/mpY1TAfOvPRiQX2LETmfKIw/CjkPp39lHAN05QURQMaTYBwNTUym6c
	aAYSARYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prTqo-002Z9f-05;
	Wed, 26 Apr 2023 01:21:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prTqk-002Z93-1g;
	Wed, 26 Apr 2023 01:21:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 09F25625F4;
	Wed, 26 Apr 2023 01:21:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE775C433D2;
	Wed, 26 Apr 2023 01:21:35 +0000 (UTC)
Date: Tue, 25 Apr 2023 21:21:32 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Tze-nan.Wu" <Tze-nan.Wu@mediatek.com>
Cc: <mhiramat@kernel.org>, <bobule.chang@mediatek.com>,
 <cheng-jui.wang@mediatek.com>, <wsd_upstream@mediatek.com>,
 <stable@vger.kernel.org>, <npiggin@gmail.com>, AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, "Paul E. McKenney"
 <paulmck@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, John 'Warthog9' Hawley
 <warthog9@kernel.org>
Subject: Re: [PATCH v5] ring-buffer: Ensure proper resetting of atomic
 variables in ring_buffer_reset_online_cpus
Message-ID: <20230425212132.53789b24@gandalf.local.home>
In-Reply-To: <20230425211737.757208b3@gandalf.local.home>
References: <20230426010446.10753-1-Tze-nan.Wu@mediatek.com>
	<20230425211737.757208b3@gandalf.local.home>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_182138_596265_2C4E6072 
X-CRM114-Status: GOOD (  12.17  )
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

On Tue, 25 Apr 2023 21:17:37 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> For some reason, this email did not make it to
> linux-trace-kernel@vger.kernel.org, and therefore did not make it into
> patchwork?
> 

And the email was definitely Cc'd properly, as my reply made it to lore,
but not the original email.

 https://lore.kernel.org/linux-trace-kernel/20230425211737.757208b3@gandalf.local.home/

-- Steve

