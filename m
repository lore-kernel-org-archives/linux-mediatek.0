Return-Path: <SRS0=WQwL=LC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7F4DC47094
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 02:49:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A98CA6120F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 02:49:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A98CA6120F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SWlsZZIlqIU/2wmJdesLa7zWYIuC0s3/zO0vX1TCCOc=; b=jG9vBWI1MAFc1j
	42JGdJxO3XJ4W+3m16yx+evfCO+kmgZngc8ZYfS9YDsJCQeWWBlvqH6I9fauN0e1mnM4QvWzDDRNy
	MohajDdMo85auRWmb0rBPXmcYgs/jVIaQSzLxnnh1VCnEzRZvgy2GmIdDD+VyVafbARsZAjkQ2aML
	xXBzACUedIiACGUjhFqVQOUGTghRUl3wwKA1aW1VoBHrQjazVEMEejuR8HI3slceP35pY7inLuoVF
	q1B9P1A1vESp2lzQOYfWzRJDfYI1jITzfS021DOGPbbjSNvq+oTM7Z3CjfTwC4LtOpVQOcJ0ekvXw
	S+w+iw4TVtWkOcmDC0VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqRoH-0067T9-PY; Tue, 08 Jun 2021 02:49:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqRoB-0067R6-9l; Tue, 08 Jun 2021 02:49:43 +0000
X-UUID: efad0332126745d1a0914fd7d9d87b12-20210607
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=LMVOGsZyYn67G9S3b+1HAM+OGgCGD235eha41dx3cLw=; 
 b=FFi0dXfno8CIpp66lH1gW8qbwuviWzp4Jav4SO/StG+h1aGeL01K4x9Ye5A5CJv5riysedDNbjoQBGoUzqBzhqmgGyNsD1m34YZuHbl8/JQWPxe/ORkb6q0mwA3I9jGMKoo5PbfsSYPII0u7otWHdDaKJ6oqCr//I/NZEECmcIk=;
X-UUID: efad0332126745d1a0914fd7d9d87b12-20210607
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 540956556; Mon, 07 Jun 2021 19:49:33 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Jun 2021 19:49:32 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 10:49:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 8 Jun 2021 10:49:30 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <mark-pk.tsai@mediatek.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <maz@kernel.org>, <tglx@linutronix.de>, <yj.chiang@mediatek.com>,
 <daniel@thingy.jp>
Subject: [PATCH] irqchip/irq-mst: Use ARCH_MSTARV7 as default value for MST_IRQ
Date: Tue, 8 Jun 2021 10:49:30 +0800
Message-ID: <20210608024930.6491-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210607035943.30292-1-mark-pk.tsai@mediatek.com>
References: <20210607035943.30292-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_194939_388112_70FC5B2F 
X-CRM114-Status: GOOD (  14.20  )
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

+ Daniel

> Only TV SoCs of Mediatek products have this controller
> which inherit from MStar TV SoCs.
> Don't enable it by default if ARCH_MEDIATEK is selected.
> Instead, use ARCH_MSTARV7 as default value.
> 
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> ---
>  drivers/irqchip/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 62543a4eccc0..30f578e18a11 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -576,7 +576,7 @@ config LOONGSON_PCH_MSI
>  config MST_IRQ
>  	bool "MStar Interrupt Controller"
>  	depends on ARCH_MEDIATEK || ARCH_MSTARV7 || COMPILE_TEST
> -	default ARCH_MEDIATEK
> +	default ARCH_MSTARV7
>  	select IRQ_DOMAIN
>  	select IRQ_DOMAIN_HIERARCHY
>  	help
> -- 
> 2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
