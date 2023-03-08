Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8F4C678D5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 11:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xQ2WPTCbyvL+AflkQHfaPs3zDSYxWs314C3qyI21Pg8=; b=LNPoTLUvtdf4LuO9geh32souZz
	D42/wBfjALpOia3k2Ud0Damcs2i1+3jhJJPdizbQCjlOQcr/BwgOB7HeUNVVCxHSTCzqgqMs7i/I0
	8v5ljeSpVslPtulS1WufkVaZutgwOZC/8rCkxk6nPEfbJ6q+QFIWzNAYY9P4JRzal+NBKfCvyMFvx
	pwL0Xr3bqjHvq9xsOBCGdnW/Coew3SdzwLDOndC0z/kAohOg/gRTbcv+ftZQTmWJof5X/CW5dm5Ym
	82xmW3dOK9IuCpUObBKcM+ZaVm55KpQyI28XrSQ+ea8dOY3LXnJcyEMadcOBCPT9BiENIxIWO1z/q
	KnKWnoNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZsGZ-004gKy-R8; Wed, 08 Mar 2023 11:47:31 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZsGK-004gDd-73; Wed, 08 Mar 2023 11:47:17 +0000
Received: by mail-ot1-x32c.google.com with SMTP id e9-20020a056830200900b00694651d19f6so5919834otp.12;
        Wed, 08 Mar 2023 03:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678276033;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xQ2WPTCbyvL+AflkQHfaPs3zDSYxWs314C3qyI21Pg8=;
        b=oZKgWTqSSqyYfQCFROUhIb2dh/0EecoLK37VUFmfx66Qx3c35XmfcTSLta8BOAqQsM
         /UNfDYSdLG1NNcmMMe1bNlp+aWyEOx9HfkujHadpl13iCyHMNFS/myQ+YlusqnYGZ8Vk
         83fod6UtAVSm/Il7p3pj88jhCMCtFYYCxVxs9OF3fC+79o+Th4fCgd0Y43sLF1Adji01
         ToUdS3j42BHtTsuMu3fsHvA7MiPaJiaEy9ZRz5XA2ooF5cGjM8xoXtFFL+ieY/L6xFxh
         vb1mtoNV2P26MVT1/FVDhh+///BVFUTAQNXzxtNV0IvDRyTjnrIIYTAHndbdfzGVJcP+
         NXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678276033;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xQ2WPTCbyvL+AflkQHfaPs3zDSYxWs314C3qyI21Pg8=;
        b=gXwW8lIgQD7IJ4NwR/v4ZIhx2oMCbKWvx0pVXTd1p+GVVeVpz/C+JI6Rfo8Ui13jNQ
         aKnf/lV9Wc/Ya1CWDyI2odBO9O6H5a5fuphb1d+ZBgL9eTI3je0Bug4ZXm5twqekgXRd
         3+gFujrVtzRm60wtP0XzJyGckemycL2nYn5NtBLmc5psdINHHTf8C2YZMW190KJFVhlP
         Yjnqtj6OB0JM6uRJ/EwVyTzQ0rWFYhnb9gL5Qu9uLwvadp3vaWlFXMCUPq1Qm6uOCj4J
         GSa+I2ccNr7giXsie3iKw+vgx7cg+Iavxq12p4V0Of2slkYX+G9rA+7aEZTWdew+htEL
         W9uQ==
X-Gm-Message-State: AO0yUKVMpUmITJbxuKydNoWAJfWINH0oReRkvxmamZSOFZAg9bf7cryQ
	ommXkgfKlWW5Co3ydpT3xaA=
X-Google-Smtp-Source: AK7set8Sv7RnRI1MI5vDqZL0ZKir6hUO+x5gZ6uXumiuS5D2v3XSKRJz6I8R8rSMIAL3lGyMQs9PVw==
X-Received: by 2002:a05:6830:310b:b0:693:c424:185f with SMTP id b11-20020a056830310b00b00693c424185fmr11710236ots.36.1678276032556;
        Wed, 08 Mar 2023 03:47:12 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a26-20020a056830101a00b00693ea7bfdc2sm6277062otp.76.2023.03.08.03.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 03:47:12 -0800 (PST)
Message-ID: <e4dd46b6-3582-129b-e75b-085571abaf72@roeck-us.net>
Date: Wed, 8 Mar 2023 03:47:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230302124015.75546-1-y.oudjana@protonmail.com>
 <20230302124015.75546-3-y.oudjana@protonmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 2/2] watchdog: mtk_wdt: Add support for MT6735 WDT
In-Reply-To: <20230302124015.75546-3-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_034716_306581_B035C40A 
X-CRM114-Status: GOOD (  26.22  )
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

On 3/2/23 04:40, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add support for the watchdog timer/top reset generation unit found on MT6735.
> Disable WDT_MODE_IRQ_EN in mtk_wdt_restart in order to make TOPRGU assert
> the SYSRST pin instead of issuing an IRQ. This change may be needed in other
> SoCs as well.
> 

This is two functional changes in one patch. Also, the "may be needed"
is vague. It is either needed or it isn't.

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
> +

This is at the very least misleading. It appears to confuse
"reset" (which is triggered by writing a specific value into the
WDT_SWRST register) with the action to be taken when the watchdog
triggers. The code below does not trigger the watchdog; it is
supposed to trigger a soft reset, which should be independent
of the above.

So this needs more explanation than just "issue a system reset
instead of an IRQ", because that is presumably not supposed to
be what is happening when writing into the WDT_SWRST register.

The above also doesn't explain what is supposed to happen if
WDT_MODE_EXRST_EN is not set, adding more to the confusion.

Guenter

>   	while (1) {
>   		writel(WDT_SWRST_KEY, wdt_base + WDT_SWRST);
>   		mdelay(5);
> @@ -443,6 +454,7 @@ static int mtk_wdt_resume(struct device *dev)
>   static const struct of_device_id mtk_wdt_dt_ids[] = {
>   	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
>   	{ .compatible = "mediatek,mt6589-wdt" },
> +	{ .compatible = "mediatek,mt6735-wdt", .data = &mt6735_data },
>   	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
>   	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
>   	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },


