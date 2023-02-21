Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17B5C61DA3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 18:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dWBuZuItO82IFqyz0MCKd6UQRtN+LPDLboXi20Lorqc=; b=32c7DDG4f5TBueqQOac4gzSD05
	cFh05z20CWU5AL7I4zKL69oW9ChdV3baD3EZMz2djoF/MI3fqyIUFgQ53jscb7FbZU+DKaG/STjf7
	HkNc9k+5/VPVQ0N0Qw4kPoJWVX2/6zEsfVx9nJz9Yq6Fp+udugR9X/F5w6lEWw9coYW5YXgBcrhZ3
	p8td3v4lTgq4xpx1dwcJ6kdGsG96kYpITgYpgXitClSezKvZ7zxpe+4bquZuojxxokBGu/5bsJsQ+
	X3GA8jUwSh3oemmdLWOdhTeuqt98hQFCXRA7ncfuBdV93DG8lrET6hM2V5/vrt+rEqZvpdZJuCSEb
	wNvr+72Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUXIC-009ML5-U9; Tue, 21 Feb 2023 18:23:08 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUXI2-009MI9-4o; Tue, 21 Feb 2023 18:22:59 +0000
Received: by mail-ed1-x532.google.com with SMTP id ee7so5819588edb.2;
        Tue, 21 Feb 2023 10:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWBuZuItO82IFqyz0MCKd6UQRtN+LPDLboXi20Lorqc=;
        b=nHxfMRu41wzUAs9PMVxmCTZM+TTzDTKp6U8xb3FCFk8OCHPjt0O/eHNa+0iXdsMjze
         fw0AK2OeVI0wt+Wxrk0mLbc+JHeEo0Y9rAMUnzYHJ45WIA7nS5GmcfYlMhPD6eLhzEbs
         /03ULvS4qjrv80E3qAv72cLm83yyFAV7GckeDgAgU2gOcChGvbgMKYOgJmAtzuMvs8qe
         1rugqInJKPI2dPHXBOjdHpSf3EnfxiXv6rbaXRYMwvxtemLT9NAOzZLO4CQouNdHO1Ny
         EFU2g8Qb6p6UWUDeIED19Oqy6Faq2uJZ18mohAJeGIzW60Vl6EiqtTwe102l/joXzyOs
         w/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWBuZuItO82IFqyz0MCKd6UQRtN+LPDLboXi20Lorqc=;
        b=Nsg6s6Yk5hu6Fhw7y8M3eTh3nLFI+LnsTQYm4jkEg0WwNNWIdUJB1S2irdXI4P+Wqs
         g7cbHDMQzxhfoGM3G08cjptx9WCUY6iteOt4BVgwTDO8DId1kWdC7fWmr4bMjWlCj1By
         10A1fNticwCC6zwd4bYbZHwoI/qaxNznZDIHT1TKBU6icTLMqRJT0BcfhHQ0JyCxURUy
         V7/y6xxjGKYwF+Hty32/x4K5zpPK/5f/44m0eXyk82pv3XhEsxZZt6uuN1kQniHRiF9G
         21Yp9xwVTDbDh46Q7tVXk5/+W5ZQbtZXI7OEPmNZ0Z7sFgvsPMEfgEpdkGi1IgT9JT7g
         otBg==
X-Gm-Message-State: AO0yUKVIfnxK3730M0Oa3iKB2hZaefxxO3WdDLN2edBBCWnsc1jmDh1U
	LHrZ645yL3yb92mdCHxTv0c=
X-Google-Smtp-Source: AK7set9RRyalSHH8Rnrhw+wG3j5tvzZjg2pF8az9E56fflvH6AQziI48YwaJ9r11hqsK2UbALLkZKg==
X-Received: by 2002:a05:6402:35c1:b0:49e:1f0e:e209 with SMTP id z1-20020a05640235c100b0049e1f0ee209mr5617045edc.10.1677003775806;
        Tue, 21 Feb 2023 10:22:55 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id i14-20020a50d74e000000b004acbde59e64sm3031509edj.8.2023.02.21.10.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 10:22:55 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: rafael@kernel.org, daniel.lezcano@linaro.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Guillaume La Roque <glaroque@baylibre.com>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Balsam CHIHI <bchihi@baylibre.com>, Daniel Golle <daniel@makrotopia.org>,
 Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 ye xingchen <ye.xingchen@zte.com.cn>, Randy Dunlap <rdunlap@infradead.org>,
 Adam Ward <DLG-Adam.Ward.opensource@dm.renesas.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Mark Brown <broonie@kernel.org>,
 "open list:THERMAL DRIVER FOR AMLOGIC SOCS"
 <linux-amlogic@lists.infradead.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 "open list:TI BANDGAP AND THERMAL DRIVER" <linux-omap@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
Subject:  Re: [PATCH v2 05/16] thermal/hwmon: Use the right device for
 devm_thermal_add_hwmon_sysfs()
Date: Tue, 21 Feb 2023 19:22:53 +0100
Message-ID: <4462258.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20230221180710.2781027-6-daniel.lezcano@linaro.org>
References:  <20230221180710.2781027-1-daniel.lezcano@linaro.org>
 <20230221180710.2781027-6-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_102258_223074_1BA09542 
X-CRM114-Status: GOOD (  14.07  )
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

Dne torek, 21. februar 2023 ob 19:06:59 CET je Daniel Lezcano napisal(a):
> The devres variant of thermal_add_hwmon_sysfs() only takes the thermal
> zone structure pointer as parameter.
> 
> Actually, it uses the tz->device to add it in the devres list.
> 
> It is preferable to use the device registering the thermal zone
> instead of the thermal zone device itself. That prevents the driver
> accessing the thermal zone structure internals and it is from my POV
> more correct regarding how devm_ is used.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> #amlogic_thermal ---
>  drivers/thermal/amlogic_thermal.c                  | 2 +-
>  drivers/thermal/imx8mm_thermal.c                   | 2 +-
>  drivers/thermal/imx_sc_thermal.c                   | 2 +-
>  drivers/thermal/k3_bandgap.c                       | 2 +-
>  drivers/thermal/mediatek/auxadc_thermal.c          | 2 +-
>  drivers/thermal/qcom/qcom-spmi-adc-tm5.c           | 2 +-
>  drivers/thermal/qcom/qcom-spmi-temp-alarm.c        | 2 +-
>  drivers/thermal/qcom/tsens.c                       | 2 +-
>  drivers/thermal/qoriq_thermal.c                    | 2 +-
>  drivers/thermal/sun8i_thermal.c                    | 2 +-

For sun8i_thermal:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  drivers/thermal/tegra/tegra30-tsensor.c            | 2 +-
>  drivers/thermal/thermal_hwmon.c                    | 4 ++--
>  drivers/thermal/thermal_hwmon.h                    | 4 ++--
>  drivers/thermal/ti-soc-thermal/ti-thermal-common.c | 2 +-
>  14 files changed, 16 insertions(+), 16 deletions(-)




