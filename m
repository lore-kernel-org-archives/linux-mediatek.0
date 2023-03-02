Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D40CC7EE2F
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Mar 2023 15:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gs43fjO/PE0waZNljXxshUgVcldMsmXR/gfKNDIlw84=; b=HbM7u8i8KtjBTvzQ3GwjzbVlBG
	z+7ugFigf5GBsI7vWOroZnNrzaW/3AGG1VHiTLweuM10ItBWxcaY5jfjbbkQdlPEOxD2sCchlqVnU
	HH6neoyeQPgE5VOO2x3bj6M8MKCHypZsMzGdZWYPJ8mVLHhvuMuU49e9HmZ5A+JxZTUHD7WLwKH8r
	8CmD/5SNyxYAHki3wIZLyqVARD7kzuKpm2h1865KGdJ1IW1HysTovwh9dzqzqn7JnyAE/QTuWmyZR
	8RfwoIgpW/rBK8KxQIAeJUI25ip0MPYMPZ4DG01UAUl6zihK7KxoKXarMP1/TZ/mItMG1HFuW0GJc
	GHYvobQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXker-002cCb-Ch; Thu, 02 Mar 2023 15:15:49 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXkeY-002c5g-V7; Thu, 02 Mar 2023 15:15:32 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2FF8966018CA;
	Thu,  2 Mar 2023 15:15:25 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677770125;
	bh=XDztbEfmSsWdhvyNwXpUvERVe2JxCB34x7YGEA1gAxQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hIWmhALVlRXTtzN+QFo5val3tRedI0IU+GM0t7eJZpQRWLt27+PIJs5zhXny57c56
	 nb3DIulazp6wc9jOoxwUoI6EKCIzZ/isv10f7oEDbfg5sFw/13ajH4fEiLbr37Z9Ak
	 7vfKqzVVq8vkuTkYKVpalIpsf0FRlxBdhCLcfaHZyPIytkFmCyqBQSwsSHIHlJO4J2
	 WExHtCvzGOMr7LNNJG7hOuw/jIRlF/Ic8cNNHohI/kcw+MJzOXzlqaQ0H+Ncck9j8/
	 v4X10skRDtTLXplMx3hzzr6o46n68XPc6N/8slULvetHRPziojT/ni9cIeMuXtPyD1
	 IPHdia+fnJMTw==
Message-ID: <0398e95e-dbb8-2e41-7b36-12e36b8729f0@collabora.com>
Date: Thu, 2 Mar 2023 16:15:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] watchdog: mtk_wdt: Add support for MT6735 WDT
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230302124015.75546-1-y.oudjana@protonmail.com>
 <20230302124015.75546-3-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230302124015.75546-3-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_071531_180225_39B49E91 
X-CRM114-Status: GOOD (  21.24  )
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

Il 02/03/23 13:40, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add support for the watchdog timer/top reset generation unit found on MT6735.
> Disable WDT_MODE_IRQ_EN in mtk_wdt_restart in order to make TOPRGU assert
> the SYSRST pin instead of issuing an IRQ. This change may be needed in other
> SoCs as well.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>   drivers/watchdog/mtk_wdt.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index a9c437598e7e..5a7a7b2b3727 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -10,6 +10,7 @@
>    */
>   
>   #include <dt-bindings/reset/mt2712-resets.h>
> +#include <dt-bindings/reset/mediatek,mt6735-wdt.h>
>   #include <dt-bindings/reset/mediatek,mt6795-resets.h>
>   #include <dt-bindings/reset/mt7986-resets.h>
>   #include <dt-bindings/reset/mt8183-resets.h>
> @@ -82,6 +83,10 @@ static const struct mtk_wdt_data mt2712_data = {
>   	.toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
>   };
>   
> +static const struct mtk_wdt_data mt6735_data = {
> +	.toprgu_sw_rst_num = MT6735_TOPRGU_RST_NUM,
> +};
> +
>   static const struct mtk_wdt_data mt6795_data = {
>   	.toprgu_sw_rst_num = MT6795_TOPRGU_SW_RST_NUM,
>   };
> @@ -187,9 +192,15 @@ static int mtk_wdt_restart(struct watchdog_device *wdt_dev,
>   {
>   	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
>   	void __iomem *wdt_base;
> +	u32 reg;
>   
>   	wdt_base = mtk_wdt->wdt_base;
>   
> +	/* Enable reset in order to issue a system reset instead of an IRQ */
> +	reg = readl(wdt_base + WDT_MODE);
> +	reg &= ~WDT_MODE_IRQ_EN;
> +	writel(reg | WDT_MODE_KEY, wdt_base + WDT_MODE);

This is unnecessary and already done in mtk_wdt_start().
If you think you *require* this snippet, you most likely misconfigured the
devicetree node for your device :-)

Please remove this snippet.

Regards,
Angelo

