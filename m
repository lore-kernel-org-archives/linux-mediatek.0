Return-Path: <SRS0=WQwL=LC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85486C47082
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 18:03:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 305AB61376
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 18:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 305AB61376
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2EMiMR7vQMzuomRVpVssXfMj7ecBYxrREJuLreAsQUU=; b=y6sNgv33R9hJxs
	vyUvPnh1WNgk/Rwhd7Upi9jmH9AthnkbqM9ysil33D313WkTHnMXTiccAetWjUe8wr06NJNqfMnFH
	29OIwgm/TyihJjFpoT6RjUUBC5qFg8/OGNpOf84GzJ4iVUxoLVbq7+UBeYpZqngCXUpScJPAGVX9R
	Th+p88wp0yRAIO5OD9EvRJUDZUH1NH+NTYutGCoddCD1qBtg0SBYYbUDlYp5A6t09MdRhkPU1YDrH
	dKfMGb6vjI4+W9rXKFqswBqZRQJ8cM0Lb/g9CPQhkJQGQVjvhU62FyXTUTbl/1Yrk2TH4byNOM51h
	mvZzn9kel5udLc+4AWNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqg3z-009qZG-0h; Tue, 08 Jun 2021 18:02:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqg3t-009qYS-0j; Tue, 08 Jun 2021 18:02:53 +0000
X-UUID: 93605195ffb846168e40f90a96b44540-20210608
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=stA00MJ73rqOyyq/pS6x1iICmVCuxw8Nr1Rdjg0z9jU=; 
 b=se/1VZ159lGdwccamDyyWqM8QkslSTRZJy6TJVFy/zGcXcB6MHMTLmRei4w2tZcrK4ZrIGpL907NYd3AgRqcPxTjeJueYXfII0HjWL5nyggwCcLWJe4Kcgx/lGEVNC8lgmQjIwWC/r/Uv897i7zyUiQYZ46sd5IfvQZPkH67FZU=;
X-UUID: 93605195ffb846168e40f90a96b44540-20210608
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 314645047; Tue, 08 Jun 2021 11:02:47 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 10:52:45 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Jun 2021 01:52:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 9 Jun 2021 01:52:37 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <matthias.bgg@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <mark-pk.tsai@mediatek.com>,
 <maz@kernel.org>, <tglx@linutronix.de>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH] irqchip/irq-mst: Use ARCH_MSTARV7 as default value for
 MST_IRQ
Date: Wed, 9 Jun 2021 01:52:37 +0800
Message-ID: <20210608175237.13596-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <90e2330d-4e7b-17ed-1c63-eafdf6db89fa@gmail.com>
References: <90e2330d-4e7b-17ed-1c63-eafdf6db89fa@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_110249_392075_2BE57618 
X-CRM114-Status: GOOD (  18.93  )
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



> On 07/06/2021 05:59, Mark-PK Tsai wrote:
> > Only TV SoCs of Mediatek products have this controller
> > which inherit from MStar TV SoCs.
> > Don't enable it by default if ARCH_MEDIATEK is selected.
> > Instead, use ARCH_MSTARV7 as default value.
> > 
> > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > ---
> >  drivers/irqchip/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> > index 62543a4eccc0..30f578e18a11 100644
> > --- a/drivers/irqchip/Kconfig
> > +++ b/drivers/irqchip/Kconfig
> > @@ -576,7 +576,7 @@ config LOONGSON_PCH_MSI
> >  config MST_IRQ
> >  	bool "MStar Interrupt Controller"
> >  	depends on ARCH_MEDIATEK || ARCH_MSTARV7 || COMPILE_TEST
> 
> We should also delete ARCH_MEDIATEK dependency.

Actually what I want to do is decouple the MST_IRQ from
ARCH_MEDIATEK, because there are only TV SoCs have this.
But if I remove the ARCH_MEDIATEK dependency, then all the
Mediatek TV SoCs kernel have to select ARCH_MSTARV7 too.
It's kind of weird.

Though it may ask some Mediatek users about MST_IRQ,
I just change the default config to prevent that all
the Mediatek kernel include this driver by default.

What would you suggest for this?

> 
> Regards,
> Matthias
> 
> > -	default ARCH_MEDIATEK
> > +	default ARCH_MSTARV7
> >  	select IRQ_DOMAIN
> >  	select IRQ_DOMAIN_HIERARCHY
> >  	help
> > 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
