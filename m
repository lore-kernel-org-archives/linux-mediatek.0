Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BC5C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 16:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eUQUAdU8s5rttqBM7PCWLU90rveY3HOOI2yZDd455NM=; b=K6k3X8sTR0b3Y9gfWtBsCkb17k
	mEe2Da0XFYnwend5flkh6KYNyKfIAGg5awgDSaDMqAj9EkVsCVaPp1eZgDY9zc1JU8mFNnlqZUYXG
	4qlbYU2WElgYjlD/kMfcF6Q0QuJgSqJsJ/OMKf6sfbtbM/NzRFzPg4lktoVaQKSOPHb/JCEvQrGtM
	xHTPyPtUST6MgS+jVpHMzAW/V0izlGTlgf70Z5n1yyaWJ7Dzi/BrRguylYabNHrIIS8A+n3RGiVRq
	NBFi2HT2etHkIWW/0Y3K7a0dH1AitceL+x/3pEW+jbwIG6RPjWPxItyb7o/2cpN+1CangO4qJPSCm
	l5iqYOuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD62g-00CIlA-1R;
	Tue, 12 Dec 2023 16:55:34 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD62c-00CIj4-1S;
	Tue, 12 Dec 2023 16:55:31 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6d9d307a732so4453202a34.1;
        Tue, 12 Dec 2023 08:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702400126; x=1703004926; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eUQUAdU8s5rttqBM7PCWLU90rveY3HOOI2yZDd455NM=;
        b=k7W5M+T26T2jQfR05/2EhtVcTnwIGsz4q9iCh2p7oN7Xq+G1S2G2jfxY7yL7TBsP7D
         8Fjr2gA7IKukwc16N5GBFriDh2ItGj+EgoDZdlMFpdh/M23FCb7PRviqdAJtMIKIJEqg
         G3PxQNXQJJH5jkof3/D5O3eEjLieUBax/Nv4QaDDno+N/e9AK81yqwXXlt5tzoocw065
         RtmuHiNMtmEDGZqWPKpCsE9ZEFhCfi/HXZSILFftpb5fUFxsHZ4RRCkweliOZWvD5bWt
         dnbWpp8VWNp1xBoOdwjIBGx0GHc4LpHAqGQr3aYLnt7Gmun6+jTX3d+KAzQya3V8/Nxc
         3ZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702400126; x=1703004926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eUQUAdU8s5rttqBM7PCWLU90rveY3HOOI2yZDd455NM=;
        b=BDqYqF+jxgxnaLz+iPmwrRr7POHgJvOcGc1j77cK/3ilVBR1m/Zj0qF4XDfNig92RZ
         JnIJaW4W4OuZxovLsCzqWHnVG1Uvb6Ntmk3RDJafluvnnSOmFhM+Z6arz8y8+IG8FrV8
         YU4rGFGo8dDmxD98gznJ8aCHVeixW238vOT810Sp5e7MR3vD0KzA/R1B1dIbMhDfP3yE
         c4H/lTYO/8Uj05342KtK31M5+DJL0L1gjSW2q48U12rWMikTT7FNwq+Xc6hLRvBoSXN0
         9pOxr14Z6Wwd5Mpy1Ntwo6niOLpnjtd5SanzInNxmX2dddFMk9Kp6N6N6DLU5e5nRebc
         6Waw==
X-Gm-Message-State: AOJu0YxAhe36sWvVmwrMadEE0S+j+Zy4L7DOale5iPEQquDujf8ds4w4
	/HqJOfXZS9BwXrLqSVRa1u8=
X-Google-Smtp-Source: AGHT+IEygqoSnVmCrbpWnvz3FkfAJ5cZgdkB0GF6zDdFZ9rKyksX2qGzIhBOSSpCSaIJib3YEuQMxg==
X-Received: by 2002:a05:6870:ef0e:b0:1ea:2e2c:e9e7 with SMTP id qq14-20020a056870ef0e00b001ea2e2ce9e7mr7608515oab.59.1702400125615;
        Tue, 12 Dec 2023 08:55:25 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x5-20020a056830244500b006d9ac5f6606sm2286155otr.11.2023.12.12.08.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 08:55:25 -0800 (PST)
Date: Tue, 12 Dec 2023 08:55:24 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 2/2] watchdog: mediatek: mt7988: add wdt support
Message-ID: <c39a109b-a42d-4a86-a580-a3edc7d51e9a@roeck-us.net>
References: <e26a98fd0b7b7b431922405732275bac01eaf220.1699890006.git.daniel@makrotopia.org>
 <fc1c022551edc9ee2dfaa4c1dcf6b146b5b2aae5.1699890006.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc1c022551edc9ee2dfaa4c1dcf6b146b5b2aae5.1699890006.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_085530_491061_BC2ACC1E 
X-CRM114-Status: GOOD (  25.30  )
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

On Mon, Nov 13, 2023 at 03:43:47PM +0000, Daniel Golle wrote:
> Add support for watchdog and reset generator unit of the MediaTek
> MT7988 SoC.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v2: call new toprgu_reset_sw_en_unlocked from toprgu_reset_update while
>     holding lock.
> 
>  drivers/watchdog/mtk_wdt.c | 40 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index b2330b16b497a..5a31a8746e954 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -58,6 +58,8 @@
>  #define WDT_SWSYSRST		0x18U
>  #define WDT_SWSYS_RST_KEY	0x88000000
>  
> +#define WDT_SWSYSRST_EN		0xfc
> +
>  #define DRV_NAME		"mtk-wdt"
>  #define DRV_VERSION		"1.0"
>  
> @@ -71,10 +73,12 @@ struct mtk_wdt_dev {
>  	struct reset_controller_dev rcdev;
>  	bool disable_wdt_extrst;
>  	bool reset_by_toprgu;
> +	bool has_swsysrst_en;
>  };
>  
>  struct mtk_wdt_data {
>  	int toprgu_sw_rst_num;
> +	bool has_swsysrst_en;
>  };
>  
>  static const struct mtk_wdt_data mt2712_data = {
> @@ -89,6 +93,11 @@ static const struct mtk_wdt_data mt7986_data = {
>  	.toprgu_sw_rst_num = MT7986_TOPRGU_SW_RST_NUM,
>  };
>  
> +static const struct mtk_wdt_data mt7988_data = {
> +	.toprgu_sw_rst_num = 24,
> +	.has_swsysrst_en = true,
> +};
> +
>  static const struct mtk_wdt_data mt8183_data = {
>  	.toprgu_sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
>  };
> @@ -109,6 +118,28 @@ static const struct mtk_wdt_data mt8195_data = {
>  	.toprgu_sw_rst_num = MT8195_TOPRGU_SW_RST_NUM,
>  };
>  
> +/**
> + * toprgu_reset_sw_en_unlocked() - enable/disable software control for reset bit
> + * @mtk_wdt: Pointer to instance of struct mtk_wdt_dev.
> + * @id: Bit number identifying the reset to be enabled or disabled.
> + * @enable: If true, enable software control for that bit, disable otherwise.
> + *
> + * Context: The caller must hold lock of struct mtk_wdt_dev.
> + */
> +static void toprgu_reset_sw_en_unlocked(struct mtk_wdt_dev *data,
> +					unsigned long id, bool enable)
> +{
> +	u32 tmp;
> +
> +	tmp = readl(data->wdt_base + WDT_SWSYSRST_EN);
> +	if (enable)
> +		tmp |= BIT(id);
> +	else
> +		tmp &= ~BIT(id);
> +
> +	writel(tmp, data->wdt_base + WDT_SWSYSRST_EN);
> +}
> +
>  static int toprgu_reset_update(struct reset_controller_dev *rcdev,
>  			       unsigned long id, bool assert)
>  {
> @@ -119,6 +150,9 @@ static int toprgu_reset_update(struct reset_controller_dev *rcdev,
>  
>  	spin_lock_irqsave(&data->lock, flags);
>  
> +	if (assert && data->has_swsysrst_en)
> +		toprgu_reset_sw_en_unlocked(data, id, true);
> +
>  	tmp = readl(data->wdt_base + WDT_SWSYSRST);
>  	if (assert)
>  		tmp |= BIT(id);
> @@ -127,6 +161,9 @@ static int toprgu_reset_update(struct reset_controller_dev *rcdev,
>  	tmp |= WDT_SWSYS_RST_KEY;
>  	writel(tmp, data->wdt_base + WDT_SWSYSRST);
>  
> +	if (!assert && data->has_swsysrst_en)
> +		toprgu_reset_sw_en_unlocked(data, id, false);
> +
>  	spin_unlock_irqrestore(&data->lock, flags);
>  
>  	return 0;
> @@ -406,6 +443,8 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>  						       wdt_data->toprgu_sw_rst_num);
>  		if (err)
>  			return err;
> +
> +		mtk_wdt->has_swsysrst_en = wdt_data->has_swsysrst_en;
>  	}
>  
>  	mtk_wdt->disable_wdt_extrst =
> @@ -444,6 +483,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
>  	{ .compatible = "mediatek,mt6589-wdt" },
>  	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
>  	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
> +	{ .compatible = "mediatek,mt7988-wdt", .data = &mt7988_data },
>  	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
>  	{ .compatible = "mediatek,mt8186-wdt", .data = &mt8186_data },
>  	{ .compatible = "mediatek,mt8188-wdt", .data = &mt8188_data },
> -- 
> 2.42.1

