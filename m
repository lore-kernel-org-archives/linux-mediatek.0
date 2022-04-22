Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91356C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 15:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TR9cTvaSXg/AGxAaSHVpElkobKh2VN01DonzvMiOZ3c=; b=Fxx8PXPcW41L92
	zHEEhkz/eAGfjE+u8Sud5nh4OkaIEkok5oOwxGHf6L2yMqhZS5YI7lIwOX/llRc+Z73pwyEBlr+xQ
	GCvUh/kpXfYiN+mUCKrJoKw4OwFzgtZGcHREZiCs6tNMU1kXfr4L5PDXthRiW9XOgG+3nX7LAA8mz
	7/mp69t8GUuFNqcIREMk/JdpvBY/ZjGI2MgSDYkKbVl2Ja2+gncyt7KbyFNR55nRfY7Q5irVXH06j
	v56x/IHGvhAUWGAfs4wgZ/I+k+wyxms5jEgTcDp9aqF7vAnvZ+8D+TgVQSnpp887sIP4DehF8seup
	dmDyucOOFI2pTX28q8Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhvQW-001Apu-Qz; Fri, 22 Apr 2022 15:42:32 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhvPz-001AeW-3M; Fri, 22 Apr 2022 15:42:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 86B16B8311D;
 Fri, 22 Apr 2022 15:41:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5979AC385A4;
 Fri, 22 Apr 2022 15:41:55 +0000 (UTC)
Date: Fri, 22 Apr 2022 11:41:53 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <mingo@redhat.com>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH v3 0/2] tracing: make tracer_init_tracefs initcall
 asynchronous
Message-ID: <20220422114153.113f4dac@gandalf.local.home>
In-Reply-To: <20220422092751.19386-1-mark-pk.tsai@mediatek.com>
References: <20220323152257.7871-1-mark-pk.tsai@mediatek.com>
 <20220422092751.19386-1-mark-pk.tsai@mediatek.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_084159_350680_E41AFEF4 
X-CRM114-Status: GOOD (  11.11  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 22 Apr 2022 17:27:51 +0800
Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:

> Could you please help to review this patch?
> Sorry to disturb you, I just want to make sure it has not been
> forgotten.

No problem. Sorry for not getting to it, but my queue is rather deep :-p

Hopefully I can get to it by next week. Feel free to remind me again in a
week in case you do not hear back from me. But it is in my local patchwork,
but so is a lot of other patches I need to review :-/

-- Steve

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
