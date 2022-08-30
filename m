Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6C9ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 10:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UCod0/HFGUKrf2p2FZSzQ0kgTIqag5Zo13Nui3Avcqk=; b=4GlHhmX8KXL0lZ8fzZM1M0/pkP
	1AnC7SNFitPgA4v+3cbC95M7fKtg5TAEh3K3GimkMno9G+Vh/9iVmLX/+ZAnjiYU++C7ozO/Tf4x8
	qZFUzX+fsOY6/k8o9WGV2mQl+0J+jjQ8C6qHHvAR8GIzjXhKHxlYWiCfYkemBA9rYkERBU055a1j8
	R328kXl5ZHbfTE4yPy6sCUVeNaedBIZ1yIVOMKykGL6NtMXZD6Ifj0ktEovvcRDC3u9g0f/MYk7gs
	4lvLREcCgjoI7ufvFpFWTqPyABz3mGYTBeVWFNWLTSkLGMvbGctVsOpt8/0rqbuWFHgRuHGbvOFmd
	381N9+mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSyoz-00GIAU-3t; Tue, 30 Aug 2022 10:50:17 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSyZm-00GCUT-2Y; Tue, 30 Aug 2022 10:34:35 +0000
Received: by mail-lj1-x232.google.com with SMTP id x10so10869510ljq.4;
        Tue, 30 Aug 2022 03:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc;
        bh=UCod0/HFGUKrf2p2FZSzQ0kgTIqag5Zo13Nui3Avcqk=;
        b=noyZtazLMxDeLMfMDx3LzywqrsR+b2bysTT2q3oiIa9pxwlngpzxZTDp13jqqd6dCX
         +iruMKgnQOuteRSP16gDFsiPCoF8X2cOaqV47Oqp+djtXyA+CjsWoKiOvMqp2+zFk3h9
         Edg/HiO1bLa3dtSePz0K6bXpcgaMOAAVybubczCy4zESHU8A6j4Hqk2cDHQlQPn1rgs4
         XjWKTmSKEr8NywzyeQvckAGZEvmrOO/3MjkfonVyUZXCRpxVZqkGHyc5QCbVn8ZWo7EK
         VLBl0XbKPSzOeoGKkV+mILUlAr43vEefx0LUkmTabu1Zku3CQcOxCE6s+FqLHeEIgwQW
         3wOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=UCod0/HFGUKrf2p2FZSzQ0kgTIqag5Zo13Nui3Avcqk=;
        b=GHuKe0D7Lieeg/HDa+qxRRRnytDxME6iN07PmwoPOu2P1QbUixwbQFAzKapzgN4psL
         7i8pHuFcj02/aPmiFfccDemFjV5wHkgfBUIrgvd4JhMp/D9BveLr8JcxJz6w6C770rJH
         cIFdd76kaiYph7pFBGIadRlCIbrCVEajsV72gZ18Yf49lK6DvQLbJRQ16aQt8xf1uMgJ
         DFaRh2znrS8btNVC/0d3ff1ymZUP9fqSNjKv0ZzCoAAnJ3O6/ghrQHHvm/z0kV62P6Tw
         gORqkQaW/UndgGrNrIaGE6Th9KMzdS/SO7fDuf7UBuyhds9TJD86xIvtsgcy6oT31g/N
         B1lQ==
X-Gm-Message-State: ACgBeo09OWHb0qtpCiWjUiMb8Uhp3og8G3+MDjZpTtEb7Mka4ScPb1ur
	gt9nznzHy/ZXQADGvgRkFxc=
X-Google-Smtp-Source: AA6agR42HvKOpgztKSbICMioabWyivzr6d0K3E8tGVuitdTRPJulyJHicb40e5bgT5czhA+yR45EiQ==
X-Received: by 2002:a05:651c:1993:b0:263:a41d:3d7b with SMTP id bx19-20020a05651c199300b00263a41d3d7bmr3523730ljb.63.1661855670682;
        Tue, 30 Aug 2022 03:34:30 -0700 (PDT)
Received: from ?IPV6:2001:14ba:16f3:4a00::1? (dc75zzyyyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::1])
        by smtp.gmail.com with ESMTPSA id e20-20020a196914000000b0048b17852938sm1099036lfc.162.2022.08.30.03.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 03:34:30 -0700 (PDT)
Message-ID: <8f501644-9793-214f-8a19-45ee8af3c907@gmail.com>
Date: Tue, 30 Aug 2022 13:34:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, jic23@kernel.org, lars@metafoo.de,
 deller@gmx.de, broonie@kernel.org, andriy.shevchenko@linux.intel.com
Cc: chiaen_wu@richtek.com, alice_chen@richtek.com, cy_huang@richtek.com,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-fbdev@vger.kernel.org, szunichen@gmail.com, andy.shevchenko@gmail.com
References: <20220830034042.9354-2-peterwu.pub@gmail.com>
 <20220830034042.9354-8-peterwu.pub@gmail.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: [PATCH v9 07/10] power: supply: mt6370: Add MediaTek MT6370
 charger driver
In-Reply-To: <20220830034042.9354-8-peterwu.pub@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_033434_205224_35FB628E 
X-CRM114-Status: GOOD (  14.23  )
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

On 8/30/22 06:40, ChiaEn Wu wrote:
> From: ChiaEn Wu <chiaen_wu@richtek.com>
> 
> MediaTek MT6370 is a SubPMIC consisting of a single cell battery charger
> with ADC monitoring, RGB LEDs, dual channel flashlight, WLED backlight
> driver, display bias voltage supply, one general purpose LDO, and the
> USB Type-C & PD controller complies with the latest USB Type-C and PD
> standards.
> 
> Add support for the MediaTek MT6370 Charger driver. The charger module
> of MT6370 supports High-Accuracy Voltage/Current Regulation,
> Average Input Current Regulation, Battery Temperature Sensing,
> Over-Temperature Protection, DPDM Detection for BC1.2.
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---
> 
> +
> +static const struct linear_range mt6370_chg_ranges[MT6370_RANGE_F_MAX] = {
> +	LINEAR_RANGE_IDX(MT6370_RANGE_F_IAICR, 100000, 0x0, 0x3F, 50000),
> +	LINEAR_RANGE_IDX(MT6370_RANGE_F_VOREG, 3900000, 0x0, 0x51, 10000),
> +	LINEAR_RANGE_IDX(MT6370_RANGE_F_VMIVR, 3900000, 0x0, 0x5F, 100000),
> +	LINEAR_RANGE_IDX(MT6370_RANGE_F_ICHG, 900000, 0x08, 0x31, 100000),
> +	LINEAR_RANGE_IDX(MT6370_RANGE_F_IPREC, 100000, 0x0, 0x0F, 50000),
> +	LINEAR_RANGE_IDX(MT6370_RANGE_F_IEOC, 100000, 0x0, 0x0F, 50000),
> +};

This looks good to me now :) Thanks for the linear-range improvement!

> +	INIT_DELAYED_WORK(&priv->mivr_dwork, mt6370_chg_mivr_dwork_func);
> +	ret = devm_add_action_or_reset(dev, mt6370_chg_cancel_mivr_dwork,
> +				       &priv->mivr_dwork);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to init mivr dwork\n");

I just noticed this. Maybe this could be done using 
devm_delayed_work_autocancel() ?

Yours
-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

