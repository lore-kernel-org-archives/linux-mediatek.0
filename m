Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D376E82CD0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Sep 2023 19:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZdrldCq/11jLKtSHJnC0CV3/MzVWic6Gg0opWfLdlIY=; b=P+hYwrH55aI4yGrgAtAZ8wAet+
	nKOfCAb7zDWZlSl1diWaC8FZrV7ADlTCjP1emr2NWa0vEU6zeHPcDVRsUgoOWdsN3IZhZTUgCc7vo
	dxLBhp0cHRuBkO6Z11/aHla6TvDqUGcTzAW9APQYrJ39d4YsFbpDS6HSylH2J6HmQTnZQboTYtc4A
	UBhySb2TMjRn/YBZ19o/XVx1FUVrDuNdc2VGUTvzQkWGKS5cX7LTmxs7uvIgmi7dncCRyS7jtO6xA
	q83dYPSgYhidufF60wLUMiVtzQA/qhTVMEFZ8Sw5bZPnuq3JRxJ5Xvb1ZABExi4hN8WEbquvOySIm
	b+uqE4pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlaTU-001gNj-1A;
	Wed, 27 Sep 2023 19:45:32 +0000
Received: from mail-oo1-f48.google.com ([209.85.161.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlaTP-001gMp-1K;
	Wed, 27 Sep 2023 19:45:28 +0000
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-57de3096e25so343576eaf.1;
        Wed, 27 Sep 2023 12:45:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695843925; x=1696448725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZdrldCq/11jLKtSHJnC0CV3/MzVWic6Gg0opWfLdlIY=;
        b=TyA2XO5YaFakuEiTQBfbrEBkR4GpZGM04jZND80l1TRCHD/Lq8sKzofsPY4GIwK21h
         zpu+joNzJ8BLvzBi6si6embldNTSz8KlQIK9PJ5LsbDkosneQ0u9UIipyLSbqisZeW91
         OqG+nS7y+cYxHJJkAC1mWOh4HI/ynWD51mgoJgHvo2ZnPdBSQBmlz1BuBJn6IOTOrbLh
         Hy97BKeIBuXsflDOztfDJ56iL0V4Xea0giKJrA5uHinhUJLyZfF4CqboN0vLevdNTdAs
         mFIYqSNKRc7vZXXxqtqhzSLeKa6WYAK1/r/rN7rdEPbgh0oC2JBKQJbe5DxIGay8ovqQ
         Vz9w==
X-Gm-Message-State: AOJu0Yy48HAc+glx6LrBw8Zh3uTReLm9KwBRET7kzHCYiORrwg2FS6HT
	i2IHys1CbkF7GFaGMW6qmdyejilf/W36Z0qtqaQ=
X-Google-Smtp-Source: AGHT+IGMlW6Putl8V3MXq3RkAqHyCPJSNsGyuWiCwQkEk43f5FSeBHFESqXka7uzLRnNc/5oUKZ3iepgewdBHpsbPHk=
X-Received: by 2002:a4a:e704:0:b0:57b:94b7:c6ba with SMTP id
 y4-20020a4ae704000000b0057b94b7c6bamr3501682oou.0.1695843925125; Wed, 27 Sep
 2023 12:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230927193736.2236447-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230927193736.2236447-1-u.kleine-koenig@pengutronix.de>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 27 Sep 2023 21:45:14 +0200
Message-ID: <CAJZ5v0guyQ-SpNHXYBG2F_WyCSvgjXocGBy61Ep1Cy5-H-MOsQ@mail.gmail.com>
Subject: Re: [PATCH 00/31] thermal: Convert to platform remove callback
 returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Guillaume La Roque <glaroque@baylibre.com>, 
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, kernel@pengutronix.de, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Heiko Stuebner <heiko@sntech.de>, ye xingchen <ye.xingchen@zte.com.cn>, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Balsam CHIHI <bchihi@baylibre.com>, Adam Ward <DLG-Adam.Ward.opensource@dm.renesas.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Support Opensource <support.opensource@diasemi.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
	Yang Yingliang <yangyingliang@huawei.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Chen Jiahao <chenjiahao16@huawei.com>, linux-mediatek@lists.infradead.org, 
	Thara Gopinath <thara.gopinath@gmail.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-arm-msm@vger.kernel.org, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Rob Herring <robh@kernel.org>, Minghao Chi <chi.minghao@zte.com.cn>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Johan Hovold <johan+linaro@kernel.org>, 
	linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>, 
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, linux-omap@vger.kernel.org, 
	Masami Hiramatsu <mhiramat@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_124527_457894_EBCBD585 
X-CRM114-Status: GOOD (  17.54  )
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

Hi,

On Wed, Sep 27, 2023 at 9:38=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Hello,
>
> this series converts all platform drivers below drivers/thermal to use
> .remove_new(). The motivation is to get rid of an integer return code
> that is (mostly) ignored by the platform driver core and error prone on
> the driver side.
>
> See commit 5c5a7680e67b ("platform: Provide a remove callback that
> returns no value") for an extended explanation and the eventual goal.
>
> There are no interdependencies between the patches. As there are still
> quite a few drivers to convert, I'm happy about every patch that makes
> it in. So even if there is a merge conflict with one patch until you
> apply or a subject prefix is suboptimal, please apply the remainder of
> this series anyhow.

I think I'll go ahead and apply all of this in one go (for 6.7).

Daniel, any objections?


> Uwe Kleine-K=C3=B6nig (31):
>   thermal: amlogic: Convert to platform remove callback returning void
>   thermal: armada: Convert to platform remove callback returning void
>   thermal: bcm2835: Convert to platform remove callback returning void
>   thermal: ns: Convert to platform remove callback returning void
>   thermal: da9062: Convert to platform remove callback returning void
>   thermal: dove: Convert to platform remove callback returning void
>   thermal: hisi: Convert to platform remove callback returning void
>   thermal: imx8mm: Convert to platform remove callback returning void
>   thermal: imx: Convert to platform remove callback returning void
>   thermal: int3400: Convert to platform remove callback returning void
>   thermal: int3401: Convert to platform remove callback returning void
>   thermal: int3402: Convert to platform remove callback returning void
>   thermal: int3403: Convert to platform remove callback returning void
>   thermal: int3406: Convert to platform remove callback returning void
>   thermal: k3_bandgap: Convert to platform remove callback returning void
>   thermal: k3_j72xx_bandgap: Convert to platform remove callback returnin=
g void
>   thermal: kirkwood: Convert to platform remove callback returning void
>   thermal: lvts: Convert to platform remove callback returning void
>   thermal: tsens: Convert to platform remove callback returning void
>   thermal: rcar_gen3: Convert to platform remove callback returning void
>   thermal: rcar: Convert to platform remove callback returning void
>   thermal: rockchip: Convert to platform remove callback returning void
>   thermal: rzg2l: Convert to platform remove callback returning void
>   thermal: exynos_tmu: Convert to platform remove callback returning void
>   thermal: spear: Convert to platform remove callback returning void
>   thermal: sprd: Convert to platform remove callback returning void
>   thermal: stm: Convert to platform remove callback returning void
>   thermal: soctherm: Convert to platform remove callback returning void
>   thermal: tegra-bpmp: Convert to platform remove callback returning void
>   thermal: ti-bandgap: Convert to platform remove callback returning void
>   thermal: uniphier: Convert to platform remove callback returning void
>
>  drivers/thermal/amlogic_thermal.c                    | 12 +++++-------
>  drivers/thermal/armada_thermal.c                     |  6 ++----
>  drivers/thermal/broadcom/bcm2835_thermal.c           |  6 ++----
>  drivers/thermal/broadcom/ns-thermal.c                |  6 ++----
>  drivers/thermal/da9062-thermal.c                     |  5 ++---
>  drivers/thermal/dove_thermal.c                       |  6 ++----
>  drivers/thermal/hisi_thermal.c                       |  6 ++----
>  drivers/thermal/imx8mm_thermal.c                     |  6 ++----
>  drivers/thermal/imx_thermal.c                        |  6 ++----
>  .../thermal/intel/int340x_thermal/int3400_thermal.c  |  5 ++---
>  .../thermal/intel/int340x_thermal/int3401_thermal.c  |  6 ++----
>  .../thermal/intel/int340x_thermal/int3402_thermal.c  |  6 ++----
>  .../thermal/intel/int340x_thermal/int3403_thermal.c  |  6 ++----
>  .../thermal/intel/int340x_thermal/int3406_thermal.c  |  5 ++---
>  drivers/thermal/k3_bandgap.c                         |  6 ++----
>  drivers/thermal/k3_j72xx_bandgap.c                   |  6 ++----
>  drivers/thermal/kirkwood_thermal.c                   |  6 ++----
>  drivers/thermal/mediatek/lvts_thermal.c              |  6 ++----
>  drivers/thermal/qcom/tsens.c                         |  6 ++----
>  drivers/thermal/rcar_gen3_thermal.c                  |  6 ++----
>  drivers/thermal/rcar_thermal.c                       |  6 ++----
>  drivers/thermal/rockchip_thermal.c                   |  6 ++----
>  drivers/thermal/rzg2l_thermal.c                      |  6 ++----
>  drivers/thermal/samsung/exynos_tmu.c                 |  6 ++----
>  drivers/thermal/spear_thermal.c                      |  6 ++----
>  drivers/thermal/sprd_thermal.c                       |  5 ++---
>  drivers/thermal/st/stm_thermal.c                     |  6 ++----
>  drivers/thermal/tegra/soctherm.c                     |  6 ++----
>  drivers/thermal/tegra/tegra-bpmp-thermal.c           |  6 ++----
>  drivers/thermal/ti-soc-thermal/ti-bandgap.c          |  6 ++----
>  drivers/thermal/uniphier_thermal.c                   |  6 ++----
>  31 files changed, 65 insertions(+), 123 deletions(-)
>
> base-commit: 18030226a48de1fbfabf4ae16aaa2695a484254f
> --
> 2.40.1
>

