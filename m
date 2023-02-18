Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70C4C61DA4
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Feb 2023 17:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l5TcecXVCURep1MSR9EiprwDhRt0l/TZWUN/FWikQwM=; b=zwYMd4cLCskKPQ6NKDn9RHNVQ7
	tvVgFHs+CcuGFxdk2GC+Ur6v5+LSC/SPA+07Z3AtTexJ2kSrEN2S3ebFiFDMEWknOOkDUimXSPWd8
	eqva0y0NWJ88w4yCGvX9gaTiL4p1EY/58XgdMXMEQGQeyVrNYqaz9IAnilfFOEsl8KVSbK4Uj3Lkj
	XkjHsZZ6YwP7yimAsy7IGAtOz6UlvTJ/sV8W+H9hmuJjJThYXGWEwnBlTG1Nks4XfgpDXJddeqCmp
	INpjZq8gkk3a3BR5pqq+G2ltW2JnadbaWp6bXmGHAPeqAZjZjQDKPXBYeobh3/USUFcSNxfsz23pZ
	bnkYcLFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTR3h-00HME2-Mg; Sat, 18 Feb 2023 17:31:37 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTR3e-00HMDL-S4; Sat, 18 Feb 2023 17:31:36 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pTR3V-0006Kh-1H;
	Sat, 18 Feb 2023 18:31:25 +0100
Date: Sat, 18 Feb 2023 17:31:17 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: arinc9.unal@gmail.com
Cc: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	erkin.bozoglu@xeront.com
Subject: Re: [PATCH 1/2] pinctrl: mediatek: add missing options to
 PINCTRL_MT7981
Message-ID: <Y/ELZXqOb8VLWt93@makrotopia.org>
References: <20230218065108.8958-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230218065108.8958-1-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230218_093134_948664_94429846 
X-CRM114-Status: GOOD (  13.70  )
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

On Sat, Feb 18, 2023 at 09:51:06AM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> There are options missing from PINCTRL_MT7981 whilst being on every other
> pin controller. Add them.
> 

Acked-by: Daniel Golle <daniel@makrotopia.org>

> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  drivers/pinctrl/mediatek/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
> index f20c28334bcb..67818ba14d4e 100644
> --- a/drivers/pinctrl/mediatek/Kconfig
> +++ b/drivers/pinctrl/mediatek/Kconfig
> @@ -130,6 +130,8 @@ config PINCTRL_MT7622
>  config PINCTRL_MT7981
>  	bool "Mediatek MT7981 pin control"
>  	depends on OF
> +	depends on ARM64 || COMPILE_TEST
> +	default ARM64 && ARCH_MEDIATEK
>  	select PINCTRL_MTK_MOORE
>  
>  config PINCTRL_MT7986
> -- 
> 2.37.2
> 

