Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72B1C61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 19:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PLcAztFgWUursA52wmlD2jf40Bmb4ZiQCGT0PizPSB4=; b=yF9InzFw5nerdiwiD/Yoim9HOE
	e49Bdpv5GCh7NFNb29+VpIyKFQ5N5pJvS9t4eTycrrUUYEFK7mL2iPyhF1Vj6Nrgt15fn0pm0pue0
	CVhM/qC/5xnmC3VNTe8MPb2gxh2wHyAmILEVi0e9FKF404JPAHkhPA5dY73vOn1PFh7NctzEPQMsc
	jK1OILucyWg4onakBByO9XCDniKzVt0zMMfyjEIjE+bESTXQDdAizb/P/KSIOxnfjdyzyyxEceiDc
	Be9FNNhJsEP7BB08fFcoJYd5me7w5mJi6oN+Szd//DMCUsYaL/P77OjzP6aocdDPXrWVET4s2+aUF
	Ceu0vNqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUufr-00Dp7f-17; Wed, 22 Feb 2023 19:21:07 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUufm-00Dp66-UV; Wed, 22 Feb 2023 19:21:04 +0000
Received: by mail-pl1-x62b.google.com with SMTP id q11so10348909plx.5;
        Wed, 22 Feb 2023 11:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PLcAztFgWUursA52wmlD2jf40Bmb4ZiQCGT0PizPSB4=;
        b=fZyXLUPiE4kw6WQeRU6MY4prH3y67vM2b3mdvJAichVGcePn7mOzwSwqqZqsDnIi+B
         oCI2VPjF6j3wnr3KmIi7Hjfxnq5GV6m5PRZ7UYE5Zl2Y7YOXFH4E3UO0GJpZGsL3orby
         2GDy7jk+pDEO7a1C/nZ9uKBVSsnZZlZrch5T0UZyD5YiSCDssGWpr9P/VWgv2x43dTcs
         YSM/86PLOypniQeF1qiHZGAmqbXwKc6E3NtmX3aD5oS69HMEFrwmeWsE1j4I5Bkf6LO2
         +ps2XnIPJpvyaM97dv4bJ+y/bbuSRbspaNYNYLKoOGeflbKGftMte5xtnVY1ffNSgTKw
         jSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PLcAztFgWUursA52wmlD2jf40Bmb4ZiQCGT0PizPSB4=;
        b=176E1dZkaJowBS1VPx8HkNQtUuI/mbB+BdrVTzgLTTtWFG/CL1dYlDk3NohjUeuC4T
         EUOfEoyp01gMerFLPWio86qVX0X0upVuFJjKtOKHvDc1SbxL+Fnr9GLlsrUBYyi9Ojjf
         AEUsv/7dL9IYmh00n72F5Ki9iGgxLndRIRTcBRBoRX+SOfCgGwWDvnHTfXcy15FpbOAU
         8xs3LNsDXTIu5R5twqYE0pBX6RwFd1abUR4B/iIpF0PEZCR1zIwV1fh0Tt8GpSgrREAX
         qx04aKaRKj+dhQUkGqZRI2pfWAnKVVb2aU+F58OS6S/NbJwcrFIQnQWXPE2udhSosP1t
         xInQ==
X-Gm-Message-State: AO0yUKWFIe48jFfavA9qOyvwU4jn8L0HmY96c8ZWOkWHTrIrsnr3PaLr
	Ca0LSulEpD6EdFgax780Zvk=
X-Google-Smtp-Source: AK7set8wAaTOtklU375O2ukRLvaDd0j7hswGqcDt2qm3lUDw62M6nbZXaAjlVk3zGZQQR2Svvz5L3A==
X-Received: by 2002:a17:902:fa8c:b0:19b:dcfe:5f4 with SMTP id lc12-20020a170902fa8c00b0019bdcfe05f4mr6520296plb.20.1677093660760;
        Wed, 22 Feb 2023 11:21:00 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id a7-20020a170902b58700b0019abd4ddbf2sm3579577pls.179.2023.02.22.11.20.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 11:20:59 -0800 (PST)
Message-ID: <187c2741-7545-6480-2d00-fd93a6f8e07e@gmail.com>
Date: Wed, 22 Feb 2023 11:20:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 01/16] thermal/core: Add a thermal zone 'devdata'
 accessor
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>, rafael@kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Mark Brown <broonie@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Balsam CHIHI <bchihi@baylibre.com>,
 Gregory Greenman <gregory.greenman@intel.com>,
 Adam Ward <DLG-Adam.Ward.opensource@dm.renesas.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jean Delvare <jdelvare@suse.com>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Raju Rangoju
 <rajur@chelsio.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Petr Machata <petrm@nvidia.com>,
 Kalle Valo <kvalo@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Amit Kucheria <amitk@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Markus Mayer <mmayer@broadcom.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Thara Gopinath <thara.gopinath@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
 Heiko Stuebner <heiko@sntech.de>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Orson Zhai <orsonzhai@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Vasily Khoruzhick
 <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Talel Shenhar <talel@amazon.com>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stefan Wahren <stefan.wahren@i2se.com>, ye xingchen
 <ye.xingchen@zte.com.cn>, Zheng Yongjun <zhengyongjun3@huawei.com>,
 Tim Zimmermann <tim@linux4.de>, Yang Li <yang.lee@linux.alibaba.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Jiang Jian <jiangjian@cdjrlc.com>, Daniel Golle <daniel@makrotopia.org>,
 Randy Dunlap <rdunlap@infradead.org>, Mikko Perttunen
 <mperttunen@nvidia.com>,
 "open list:ACPI THERMAL DRIVER" <linux-acpi@vger.kernel.org>,
 "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)"
 <linux-ide@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..."
 <linux-input@vger.kernel.org>,
 "open list:CXGB4 ETHERNET DRIVER (CXGB4)" <netdev@vger.kernel.org>,
 "open list:INTEL WIRELESS WIFI LINK (iwlwifi)"
 <linux-wireless@vger.kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "open list:QUALCOMM TSENS THERMAL DRIVER" <linux-arm-msm@vger.kernel.org>,
 "open list:RENESAS R-CAR THERMAL DRIVERS"
 <linux-renesas-soc@vger.kernel.org>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 "open list:TI BANDGAP AND THERMAL DRIVER" <linux-omap@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <20230221180710.2781027-1-daniel.lezcano@linaro.org>
 <20230221180710.2781027-2-daniel.lezcano@linaro.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230221180710.2781027-2-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_112103_012002_36E21AE2 
X-CRM114-Status: GOOD (  14.14  )
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

On 2/21/23 10:06, Daniel Lezcano wrote:
> The thermal zone device structure is exposed to the different drivers
> and obviously they access the internals while that should be
> restricted to the core thermal code.
> 
> In order to self-encapsulate the thermal core code, we need to prevent
> the drivers accessing directly the thermal zone structure and provide
> accessor functions to deal with.
> 
> Provide an accessor to the 'devdata' structure and make use of it in
> the different drivers.
> 
> No functional changes intended.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Acked-by: Guenter Roeck <linux@roeck-us.net> #hwmon
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se> #R-Car
> Acked-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Ido Schimmel <idosch@nvidia.com> #mlxsw
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> #MediaTek auxadc and lvts
> Reviewed-by: Balsam CHIHI <bchihi@baylibre.com> #Mediatek lvts
> Acked-by: Gregory Greenman <gregory.greenman@intel.com> #iwlwifi
> Reviewed-by: Adam Ward <DLG-Adam.Ward.opensource@dm.renesas.com> #da9062
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>  #spread
> Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com> #power_supply

Acked-by: Florian Fainelli <f.fainelli@gmail.com> #Broadcom
-- 
Florian


