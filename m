Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED871C678D4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 11:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9bnT5dHrb3iP7rA2GmhVzWGZn0Tzpt5CCED7hunNFB0=; b=VqWcAyWlJiE2+I1DR/13uQBcF2
	/3tpaML1nszBjnY6q9nm1vy+79yzYf6puzbEpAW17WuVpucMsIlpnns0Ll5WUmUtsl354uriX4Vp1
	PcvULIENpemRb2VumuBrr9NkYzSiggelFg8RnNZx+OSE59CK75d3aV7Y5Rui1TCYeI1Iwg2NdHr8Z
	IX77LlWqkaMQgnT5baRuoNi0onAGoSzeJDUm1PK1ENyXPDG1MQAnxXCC+Smz2x6Baag7eYDR/VpUS
	fe6V5I5CuzAGlZOdYUzqtXpnJaCwqpklugdwkhGowlP4gB60bcKMrdbzYVjjdEXuXvxAmcQ6zGxjR
	MBXTNZag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY40s-006ErQ-4R; Fri, 03 Mar 2023 11:55:50 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY40m-006EnI-HR
	for linux-mediatek@lists.infradead.org; Fri, 03 Mar 2023 11:55:47 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-536cb25982eso37902677b3.13
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Mar 2023 03:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bnT5dHrb3iP7rA2GmhVzWGZn0Tzpt5CCED7hunNFB0=;
        b=DRqakUUKFXRGm69WVxx9NWOsatykkvfkKUlzMq2OnyDSxa+HuTapR3hpbLFjBMU1Ch
         oO+smsduZUXVdTLTmfAPXLG2PV+/pD5wkOJUFXRjP45c2nKCPPFURmJHPArjevLQnbC7
         M2wu8VkpS73v/BuFvHXgJn7hEmaRYyzBsn00BfR/OWNvHOan3OsiAfd48cUjUsxcYDjD
         pQwV+rgMw6+vW4Vbmg5eD3vUBOWTIqXIitDhHzhusgo/C6u4I2yVSfpD/6kzCaw7wfwy
         qxYDi91GmTBUwD/olzh+a1uc2W+b+dBH77AYn4ERUY8Wi+MF2WaMmWLuGS8qMBw2JGDm
         zbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9bnT5dHrb3iP7rA2GmhVzWGZn0Tzpt5CCED7hunNFB0=;
        b=o6qpLqa/rLn/RVzuxpHvS0+E2voUhxlNYzeO+9DCGKY/0sF/bptsYrleLCPnJWqKTU
         kQPrf+QVUvyEOYSsyV/u/KXB0hwb5N5oYv/6yL9Ffc7wkgtEAJ5sPC9KcU5ZzM4hhWIs
         DKeakQazXARJSWik8NLQqm4L5NCuF1+JMQ+rsB6Xo+CiRjAWRvH5x1KFVJpOtdlMrLjb
         DUxtXzHhU3rs7EcctU21nJz5dWdol/tXG2bMol3pqO+HY1u2kQZc8z+vMSnrNI0XD+el
         gVjgH07Ce6S545mKdPoC4rlH93mRyZpIIVfgjK99/QuPH2BqAX+NjmyGGTUYPpHrqprj
         PxLg==
X-Gm-Message-State: AO0yUKV9QMBuT3P5J9neCfCWrWONzTnlyuSLjBYdOn5+Ojrv5At641eO
	N+EeYHxgzyTT/PPQ65BqnzYErpRDUMfbVcq8IDzTZw==
X-Google-Smtp-Source: AK7set9+g7CaZKhwb6dcWYW6BTUUJXUyZuISsu0waCwptFPvO2UJ6I2OocVeB/84RPaT8roh5mWcunV6iyn3UJDp/FU=
X-Received: by 2002:a81:a783:0:b0:533:9b80:a30e with SMTP id
 e125-20020a81a783000000b005339b80a30emr736607ywh.10.1677844542703; Fri, 03
 Mar 2023 03:55:42 -0800 (PST)
MIME-Version: 1.0
References: <20230301201446.3713334-1-daniel.lezcano@linaro.org> <20230301201446.3713334-3-daniel.lezcano@linaro.org>
In-Reply-To: <20230301201446.3713334-3-daniel.lezcano@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 3 Mar 2023 12:55:31 +0100
Message-ID: <CACRpkdYG59p5o0Te6LWmo3KBf7=v8ARRpb4kKgtm8Khv8Yfw1Q@mail.gmail.com>
Subject: Re: [PATCH v5 02/18] thermal/core: Use the thermal zone 'devdata'
 accessor in thermal located drivers
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: rafael@kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Balsam CHIHI <bchihi@baylibre.com>, Adam Ward <DLG-Adam.Ward.opensource@dm.renesas.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Dhruva Gole <d-gole@ti.com>, Guillaume La Roque <glaroque@baylibre.com>, Amit Kucheria <amitk@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Markus Mayer <mmayer@broadcom.com>, 
	Support Opensource <support.opensource@diasemi.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Heiko Stuebner <heiko@sntech.de>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Talel Shenhar <talel@amazon.com>, 
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Stefan Wahren <stefan.wahren@i2se.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, ye xingchen <ye.xingchen@zte.com.cn>, 
	Zheng Yongjun <zhengyongjun3@huawei.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Davidlohr Bueso <dave@stgolabs.net>, 
	Sumeet Pawnikar <sumeet.r.pawnikar@intel.com>, "Lee, Chun-Yi" <joeyli.kernel@gmail.com>, 
	Shang XiaoJing <shangxiaojing@huawei.com>, Tim Zimmermann <tim@linux4.de>, 
	Yang Li <yang.lee@linux.alibaba.com>, Jiang Jian <jiangjian@cdjrlc.com>, 
	Daniel Golle <daniel@makrotopia.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Ido Schimmel <idosch@nvidia.com>, Minghao Chi <chi.minghao@zte.com.cn>, 
	Johan Hovold <johan+linaro@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	"open list:THERMAL DRIVER FOR AMLOGIC SOCS" <linux-amlogic@lists.infradead.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:QUALCOMM TSENS THERMAL DRIVER" <linux-arm-msm@vger.kernel.org>, 
	"open list:RENESAS R-CAR THERMAL DRIVERS" <linux-renesas-soc@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	"open list:TI BANDGAP AND THERMAL DRIVER" <linux-omap@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_035544_669155_69BB2774 
X-CRM114-Status: GOOD (  12.43  )
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

On Wed, Mar 1, 2023 at 9:15 PM Daniel Lezcano <daniel.lezcano@linaro.org> w=
rote:

> The thermal zone device structure is exposed to the different drivers
> and obviously they access the internals while that should be
> restricted to the core thermal code.
>
> In order to self-encapsulate the thermal core code, we need to prevent
> the drivers accessing directly the thermal zone structure and provide
> accessor functions to deal with.
>
> Use the devdata accessor introduced in the previous patch.
>
> No functional changes intended.
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se=
> #R-Car
> Acked-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com> #MediaTek auxadc and lvts
> Reviewed-by: Balsam CHIHI <bchihi@baylibre.com> #Mediatek lvts
> Reviewed-by: Adam Ward <DLG-Adam.Ward.opensource@dm.renesas.com> #da9062
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>  #spread
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com> #sun8i_thermal
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com> #Broadcom
> Reviewed-by: Dhruva Gole <d-gole@ti.com> # K3 bandgap

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

