Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCE8C636CC
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Feb 2023 17:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/eN5MOcP8VdErYraKZjEwvfQneSTdcxVsSzQVSYaYeA=; b=1AXJbo7YM6dGiX+eY1BwU2WXQd
	22CKRWl628/cyg74tuQUhtj9BHtna2zDIt+0G3Ye/EiLo0Aonb7uZQcJi+i7OapeegUU/pCX0HeP+
	N0A7uumYh8SMjmuAvD5iNmX3ZPy0hRZBReWr49FXBvhhHQ+k7RmQgiiiC1D0DNyNIDAdFOZ5M5yAW
	gNj6BdzHEQpdeKoNmoiQSYdRyOzs0yj48+ESiDBQfiYj4q2UeoBQnwuhIio4HGiVvc5CLqEXSbwHP
	yEeQSv0fdpF+R5sZtgQ6BjHSgPrAr+9gdYdlu3sQZDXVOvDp6zRSx5VDO1jLebT80snwp/V8T/ZGQ
	hlMqatMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTR4i-00HMPi-73; Sat, 18 Feb 2023 17:32:40 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTR4b-00HMOI-8M; Sat, 18 Feb 2023 17:32:37 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pTR4W-0006LT-1K;
	Sat, 18 Feb 2023 18:32:28 +0100
Date: Sat, 18 Feb 2023 17:32:26 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: arinc9.unal@gmail.com
Cc: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	erkin.bozoglu@xeront.com
Subject: Re: [PATCH 2/2] pinctrl: mediatek: fix naming inconsistency
Message-ID: <Y/ELqvXp5nfNWjOM@makrotopia.org>
References: <20230218065108.8958-1-arinc.unal@arinc9.com>
 <20230218065108.8958-2-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230218065108.8958-2-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230218_093236_122490_BD7CFDF3 
X-CRM114-Status: GOOD (  15.79  )
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

On Sat, Feb 18, 2023 at 09:51:07AM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Some options include "MediaTek", some "Mediatek". Rename all to "MediaTek"
> to address the naming inconsistency.
> 

Reviewed-by: Daniel Golle <daniel@makrotopia.org>

> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  drivers/pinctrl/mediatek/Kconfig | 42 ++++++++++++++++----------------
>  1 file changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
> index 67818ba14d4e..a71874fed3d6 100644
> --- a/drivers/pinctrl/mediatek/Kconfig
> +++ b/drivers/pinctrl/mediatek/Kconfig
> @@ -45,35 +45,35 @@ config PINCTRL_MTK_PARIS
>  
>  # For ARMv7 SoCs
>  config PINCTRL_MT2701
> -	bool "Mediatek MT2701 pin control"
> +	bool "MediaTek MT2701 pin control"
>  	depends on MACH_MT7623 || MACH_MT2701 || COMPILE_TEST
>  	depends on OF
>  	default MACH_MT2701
>  	select PINCTRL_MTK
>  
>  config PINCTRL_MT7623
> -	bool "Mediatek MT7623 pin control with generic binding"
> +	bool "MediaTek MT7623 pin control with generic binding"
>  	depends on MACH_MT7623 || COMPILE_TEST
>  	depends on OF
>  	default MACH_MT7623
>  	select PINCTRL_MTK_MOORE
>  
>  config PINCTRL_MT7629
> -	bool "Mediatek MT7629 pin control"
> +	bool "MediaTek MT7629 pin control"
>  	depends on MACH_MT7629 || COMPILE_TEST
>  	depends on OF
>  	default MACH_MT7629
>  	select PINCTRL_MTK_MOORE
>  
>  config PINCTRL_MT8135
> -	bool "Mediatek MT8135 pin control"
> +	bool "MediaTek MT8135 pin control"
>  	depends on MACH_MT8135 || COMPILE_TEST
>  	depends on OF
>  	default MACH_MT8135
>  	select PINCTRL_MTK
>  
>  config PINCTRL_MT8127
> -	bool "Mediatek MT8127 pin control"
> +	bool "MediaTek MT8127 pin control"
>  	depends on MACH_MT8127 || COMPILE_TEST
>  	depends on OF
>  	default MACH_MT8127
> @@ -88,33 +88,33 @@ config PINCTRL_MT2712
>  	select PINCTRL_MTK
>  
>  config PINCTRL_MT6765
> -	tristate "Mediatek MT6765 pin control"
> +	tristate "MediaTek MT6765 pin control"
>  	depends on OF
>  	depends on ARM64 || COMPILE_TEST
>  	default ARM64 && ARCH_MEDIATEK
>  	select PINCTRL_MTK_PARIS
>  
>  config PINCTRL_MT6779
> -	tristate "Mediatek MT6779 pin control"
> +	tristate "MediaTek MT6779 pin control"
>  	depends on OF
>  	depends on ARM64 || COMPILE_TEST
>  	default ARM64 && ARCH_MEDIATEK
>  	select PINCTRL_MTK_PARIS
>  	help
>  	  Say yes here to support pin controller and gpio driver
> -	  on Mediatek MT6779 SoC.
> +	  on MediaTek MT6779 SoC.
>  	  In MTK platform, we support virtual gpio and use it to
>  	  map specific eint which doesn't have real gpio pin.
>  
>  config PINCTRL_MT6795
> -	bool "Mediatek MT6795 pin control"
> +	bool "MediaTek MT6795 pin control"
>  	depends on OF
>  	depends on ARM64 || COMPILE_TEST
>  	default ARM64 && ARCH_MEDIATEK
>  	select PINCTRL_MTK_PARIS
>  
>  config PINCTRL_MT6797
> -	bool "Mediatek MT6797 pin control"
> +	bool "MediaTek MT6797 pin control"
>  	depends on OF
>  	depends on ARM64 || COMPILE_TEST
>  	default ARM64 && ARCH_MEDIATEK
> @@ -128,42 +128,42 @@ config PINCTRL_MT7622
>  	select PINCTRL_MTK_MOORE
>  
>  config PINCTRL_MT7981
> -	bool "Mediatek MT7981 pin control"
> +	bool "MediaTek MT7981 pin control"
>  	depends on OF
>  	depends on ARM64 || COMPILE_TEST
>  	default ARM64 && ARCH_MEDIATEK
>  	select PINCTRL_MTK_MOORE
>  
>  config PINCTRL_MT7986
> -	bool "Mediatek MT7986 pin control"
> +	bool "MediaTek MT7986 pin control"
>  	depends on OF
>  	depends on ARM64 || COMPILE_TEST
>  	default ARM64 && ARCH_MEDIATEK
>  	select PINCTRL_MTK_MOORE
>  
>  config PINCTRL_MT8167
> -	bool "Mediatek MT8167 pin control"
> +	bool "MediaTek MT8167 pin control"
>  	depends on OF
>  	depends on ARM64 || COMPILE_TEST
>  	default ARM64 && ARCH_MEDIATEK
>  	select PINCTRL_MTK
>  
>  config PINCTRL_MT8173
> -	bool "Mediatek MT8173 pin control"
> +	bool "MediaTek MT8173 pin control"
>  	depends on OF
>  	depends on ARM64 || COMPILE_TEST
>  	default ARM64 && ARCH_MEDIATEK
>  	select PINCTRL_MTK
>  
>  config PINCTRL_MT8183
> -	bool "Mediatek MT8183 pin control"
> +	bool "MediaTek MT8183 pin control"
>  	depends on OF
>  	depends on ARM64 || COMPILE_TEST
>  	default ARM64 && ARCH_MEDIATEK
>  	select PINCTRL_MTK_PARIS
>  
>  config PINCTRL_MT8186
> -	bool "Mediatek MT8186 pin control"
> +	bool "MediaTek MT8186 pin control"
>  	depends on OF
>  	depends on ARM64 || COMPILE_TEST
>  	default ARM64 && ARCH_MEDIATEK
> @@ -182,28 +182,28 @@ config PINCTRL_MT8188
>  	  map specific eint which doesn't have real gpio pin.
>  
>  config PINCTRL_MT8192
> -	bool "Mediatek MT8192 pin control"
> +	bool "MediaTek MT8192 pin control"
>  	depends on OF
>  	depends on ARM64 || COMPILE_TEST
>  	default ARM64 && ARCH_MEDIATEK
>  	select PINCTRL_MTK_PARIS
>  
>  config PINCTRL_MT8195
> -	bool "Mediatek MT8195 pin control"
> +	bool "MediaTek MT8195 pin control"
>  	depends on OF
>  	depends on ARM64 || COMPILE_TEST
>  	default ARM64 && ARCH_MEDIATEK
>  	select PINCTRL_MTK_PARIS
>  
>  config PINCTRL_MT8365
> -	bool "Mediatek MT8365 pin control"
> +	bool "MediaTek MT8365 pin control"
>  	depends on OF
>  	depends on ARM64 || COMPILE_TEST
>  	default ARM64 && ARCH_MEDIATEK
>  	select PINCTRL_MTK
>  
>  config PINCTRL_MT8516
> -	bool "Mediatek MT8516 pin control"
> +	bool "MediaTek MT8516 pin control"
>  	depends on OF
>  	depends on ARM64 || COMPILE_TEST
>  	default ARM64 && ARCH_MEDIATEK
> @@ -211,7 +211,7 @@ config PINCTRL_MT8516
>  
>  # For PMIC
>  config PINCTRL_MT6397
> -	bool "Mediatek MT6397 pin control"
> +	bool "MediaTek MT6397 pin control"
>  	depends on MFD_MT6397 || COMPILE_TEST
>  	depends on OF
>  	default MFD_MT6397
> -- 
> 2.37.2
> 

