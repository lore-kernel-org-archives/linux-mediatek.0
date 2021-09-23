Return-Path: <SRS0=soVQ=ON=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8558FC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Sep 2021 09:13:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 278AC6124D
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Sep 2021 09:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 278AC6124D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sn8suK41wRDSTIQ0w+ZStcsI8szhkt/9b1w5qFwg0tQ=; b=EtjAvaolTd52dQ
	ugZ5uble8sZrwCJBB8k1IlPLSNrvWiVJ2KUcnQxpGRPKBW5mDu4ta0M/C5gawrSDP2YGaf3weAoTJ
	Qv7BzGKBBsJulsro1MCYbXXGLrGZLm2BI/5nz/khlsHGJuEr8C0Atms+VDHllkBtLJfw9BomQrsp1
	VB9ot4rJnz2NJ47SORxgQyCGxrsxITC4gdexz44Qn5nzgG0qUmlB1MD5Z386UHxxbCTP93C3pyeU1
	jvTYnayhDEpv5IJkrN0Fdoncfu738oRSRgxMmr9RvHO6Yrwj1zcWkmdBhRMlRo3YTdjaM3Q0BWwLz
	jay4SAcGRPMTb/tYu3XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTKmh-00Ak6R-JF; Thu, 23 Sep 2021 09:12:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTKmd-00Ak58-Dx; Thu, 23 Sep 2021 09:12:50 +0000
X-UUID: 22e43b19e01e447485171e54aeac8600-20210923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=/30howK7j/l7YGY93CiAwgCUFI2vv6zdM/0ApO7kiuo=; 
 b=We9c6Iwrv9Jqzzzaqx0HGUw0LYmV2mlIul47NPc3BdcH5GGT2iAqV8MJLHJRVuuJ5l1nuaxRg9LsEE5QAsCsaMzCJW4klSUWD6hrZFT9nibXCZv5Oz1o4Y6rnHeAugoGCB2CoviE8FA2+II17LSxpQLMhV9npogPNvVuCznLB3Y=;
X-UUID: 22e43b19e01e447485171e54aeac8600-20210923
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1634884345; Thu, 23 Sep 2021 02:12:44 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Sep 2021 02:02:42 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 23 Sep 2021 17:02:32 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Sep 2021 17:02:32 +0800
Message-ID: <cf5a0b929b9600ec3314f1370939a94ee43a5519.camel@mediatek.com>
Subject: Re: [PATCH] phy: mediatek: Kconfig: Add configuration menu for
 Mediatek phy drivers
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Cai Huoqing <caihuoqing@baidu.com>
CC: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 23 Sep 2021 17:02:34 +0800
In-Reply-To: <20210923025036.348-1-caihuoqing@baidu.com>
References: <20210923025036.348-1-caihuoqing@baidu.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9A3403D1E5A39C749996F7595B03727C5473FB5913C85F838A9D17F76712A9BE2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_021248_921804_A132474A 
X-CRM114-Status: GOOD (  13.79  )
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

On Thu, 2021-09-23 at 10:50 +0800, Cai Huoqing wrote:
> Adding a configuration menu to hold many Mediatek phy drivers
> helps to make the menu display more concise.
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/phy/mediatek/Kconfig | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/phy/mediatek/Kconfig
> b/drivers/phy/mediatek/Kconfig
> index 55f8e6c048ab..5da045813b5a 100644
> --- a/drivers/phy/mediatek/Kconfig
> +++ b/drivers/phy/mediatek/Kconfig
> @@ -2,9 +2,11 @@
>  #
>  # Phy drivers for Mediatek devices
>  #
> +menu "PHY drivers for Mediatek platforms"
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
> +
>  config PHY_MTK_TPHY
>  	tristate "MediaTek T-PHY Driver"
> -	depends on ARCH_MEDIATEK || COMPILE_TEST
>  	depends on OF && OF_ADDRESS
>  	depends on HAS_IOMEM
>  	select GENERIC_PHY
> @@ -18,7 +20,6 @@ config PHY_MTK_TPHY
>  
>  config PHY_MTK_UFS
>  	tristate "MediaTek UFS M-PHY driver"
> -	depends on ARCH_MEDIATEK || COMPILE_TEST
>  	depends on OF
>  	select GENERIC_PHY
>  	help
> @@ -29,7 +30,6 @@ config PHY_MTK_UFS
>  
>  config PHY_MTK_XSPHY
>  	tristate "MediaTek XS-PHY Driver"
> -	depends on ARCH_MEDIATEK || COMPILE_TEST
>  	depends on OF && OF_ADDRESS
>  	depends on HAS_IOMEM
>  	select GENERIC_PHY
> @@ -40,7 +40,6 @@ config PHY_MTK_XSPHY
>  
>  config PHY_MTK_HDMI
>  	tristate "MediaTek HDMI-PHY Driver"
> -	depends on ARCH_MEDIATEK || COMPILE_TEST
>  	depends on COMMON_CLK
>  	depends on OF
>  	select GENERIC_PHY
> @@ -49,9 +48,10 @@ config PHY_MTK_HDMI
>  
>  config PHY_MTK_MIPI_DSI
>  	tristate "MediaTek MIPI-DSI Driver"
> -	depends on ARCH_MEDIATEK || COMPILE_TEST
>  	depends on COMMON_CLK
>  	depends on OF
>  	select GENERIC_PHY
>  	help
>  	  Support MIPI DSI for Mediatek SoCs.
> +
> +endmenu

Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Thanks a lot

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
