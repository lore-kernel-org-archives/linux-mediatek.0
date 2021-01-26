Return-Path: <SRS0=aDjs=G5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33567C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 11:47:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA6BF2311A
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 11:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA6BF2311A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JqxVZShDg7bkQK2fXkZb+rIxQU19Z6rXTqfG4tGPYC4=; b=CYTbay+xGOIsmEhE1lBsW1zAU
	QCCFURDRDs55QhOB9A2pbUo4O3It7pMayrhruCOYYqEKKN3UN34ykml4W0LUdJ+KE/Q2+wGLvMqit
	IITx1XtD7n1PLXwOi6ahbTx8f1QCCxdwpdRRT9cyKtIUg2XkdiPS8p5UwRtI8SZZwbt5X7cGzJlBv
	d/2uxgRhIYG2lD8774NyYTw3NVAdLm49Qa2lZGFw+QJBZeThj3pAU87RdlLuzp9tV9jf8FQ7l/hct
	BSJLJ4zB1WwWMKrVAHoOSTcVQE77H7A44wX4Nbi/br5aoZ8cPs6h0m+ZdhQFbhDi2sFJCT2gH4b5p
	MsEaGbhYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4MoZ-0000L8-Dd; Tue, 26 Jan 2021 11:47:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4MoU-0000J6-Ep; Tue, 26 Jan 2021 11:47:15 +0000
X-UUID: c9dd543309ec49e5a5089c9cc3fb42a3-20210126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ubXBAWnixO4YxtuhUh1DiAeTDZZzaPG4feh7XdGCkaE=; 
 b=JfxGp6V1b8fbco8zdvweb7b0pKkQeRcu1RrE8rv+wYeHzfvHwX6ivQeE2drN+VAb3T7I5JzZWgAqca64Y8wggH6a5RaQclskbWZSv6EvLMFD+V5lT5ylxjBX3TL+pu/K/P0YeIHQMHFvnZq4m/Oh2mpGqmRcTn9oOOUAqWMhRIM=;
X-UUID: c9dd543309ec49e5a5089c9cc3fb42a3-20210126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 271460785; Tue, 26 Jan 2021 03:47:06 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Jan 2021 03:37:04 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 26 Jan 2021 19:37:00 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 26 Jan 2021 19:37:00 +0800
Message-ID: <1611661020.15158.4.camel@mhfsdcap03>
Subject: Re: [RESEND, V2] i2c: mediatek: Move suspend and resume handling to
 NOIRQ phase
From: Qii Wang <qii.wang@mediatek.com>
To: <wsa@the-dreams.de>
Date: Tue, 26 Jan 2021 19:37:00 +0800
In-Reply-To: <1610180990-23496-1-git-send-email-qii.wang@mediatek.com>
References: <1610180990-23496-1-git-send-email-qii.wang@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D2689A47C73DBFA32FCB9D08FDB02ABC14DCEABC9620876DA2B7C062BC0DFA232000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_064714_621105_AD6C4BBA 
X-CRM114-Status: GOOD (  14.95  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-i2c@vger.kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Wolfram,

On Sat, 2021-01-09 at 16:29 +0800, qii.wang@mediatek.com wrote:
> From: Qii Wang <qii.wang@mediatek.com>
> 
> Some i2c device driver indirectly uses I2C driver when it is now
> being suspended. The i2c devices driver is suspended during the
> NOIRQ phase and this cannot be changed due to other dependencies.
> Therefore, we also need to move the suspend handling for the I2C
> controller driver to the NOIRQ phase as well.
> 
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> ---
> 
> Changes in v2:
>         - Replied some comments
>         - Fixed the wrong spelling medaitek to mediatek
> 
>  drivers/i2c/busses/i2c-mt65xx.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 

I haven't seen any new comments, can it go into 5.11?

Thanks

	Qii
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
