Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A6C2C05027
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Feb 2023 17:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3VEydMb61qXjyUuHx50DS5MjqkMWbNi7p/BGphDgb7g=; b=RdM1K26LwLpSJQSOfPgVesUOc9
	Ay6Guyhy6+6/uFUMNGQROD1AjN416lGNvl9CsnSB+IRSVZr+JhGBnCs0S4c0HSTV9v4Eq+CVR6MkK
	N9LGYLCdzvp0uEYI9b01ExtTvDGmvLoq0xJZnoaf2NlhHkH9wwcmIKq/RT5kjOMVYUGDcEK1k4hEx
	FZn5QUqOUsb0e6tu/02cNTuGz/L07ZRuYK5muBkUfTXaqryDbZ09Utx1EpetyGM46BCVR/b5u0OAq
	Wg8TfLQA9N9zDULX/lMOHKpQYcGd8+1mv4eZdr2k24kMTA029K2wa1PihPOng/TcOzS4B5VeKOyAx
	Xn5ZB/lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTnSa-0021Ae-IF; Sun, 19 Feb 2023 17:26:48 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTnSO-00218M-GH; Sun, 19 Feb 2023 17:26:37 +0000
Received: by mail-ed1-x52e.google.com with SMTP id eg19so4464153edb.0;
        Sun, 19 Feb 2023 09:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3VEydMb61qXjyUuHx50DS5MjqkMWbNi7p/BGphDgb7g=;
        b=BTDQKmDAUpCMrOaZ65GdSbOPIMPVt9MrMM2yyDYjGh5NttUwebWMfZRJKk/aym79M2
         krwJSPLEjjSVd9ZxQ6t0eajf+A8F/FAe88qsZtN8cFlgeBZJP49ICI+U72C61KNSnutg
         iFLNp91+zfOuoFggFt6d/n+4QpJ5RKV2nkxoTVMm6zz7PUzmrksewDw9XE1EjJPtW3bK
         KVZrLOB+N3FfD17qI3V+oyqT49P3K9DrnzL4BKxkf4Fm3rcQkFEd8UA1sV7GFlqeRo80
         I3OKYEM7d4YiM0WiuyRG8lEqETnSubptt9k6JL7CvzICu0BvKe34O/Ykn1FXp7/3upTB
         uRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3VEydMb61qXjyUuHx50DS5MjqkMWbNi7p/BGphDgb7g=;
        b=YEiq10CTbYmF7RlFctv8JES0PSfLi2jX43Qtx/AKpxa0itRC0rU9od1xUGGg7N0ymJ
         0y6+/vWmXfOnoFnH/txTGFsYOXx4yvcClHM+FLofm5dMcdatnY047rtIThoN96MyL9fW
         JbzSx8iau6x4OjePKCa1pt/0AT5B1hIFV/LViuiax9pYM34FnqBNk3LB8LswpY88T/e7
         CMLj1ACjie/Sjtg35v6a8ifL+x4HltvvMwweC4JvBnQImf0mKvYFPdcn3Ba3/2cRcWkX
         O/lx96aBq886UZ8T9j14o53zJaay6MJ6lNcaIPaBW9bGUCrSAdhOXr362ffpl5YA4pPP
         CLiQ==
X-Gm-Message-State: AO0yUKVsq1ZnSkLyn0nk2GRxRPR8+bUfMCR5rrBsfpSd/gZU00hjY69i
	5c+uE8TVkNG4nqRO3VmqWKHucM85cMtZMJu13AQ=
X-Google-Smtp-Source: AK7set+HJ8ugf54hyVxoMHuivdcoWWsyfiGwYdZMNvgLG69WPq5tKTBVZni7iBuMPHyMZ4Z10CLK8MHIDK89J3oADnI=
X-Received: by 2002:a17:906:c5b:b0:8cf:bb36:1486 with SMTP id
 t27-20020a1709060c5b00b008cfbb361486mr448990ejf.6.1676827593334; Sun, 19 Feb
 2023 09:26:33 -0800 (PST)
MIME-Version: 1.0
References: <20230219143657.241542-1-daniel.lezcano@linaro.org> <20230219143657.241542-6-daniel.lezcano@linaro.org>
In-Reply-To: <20230219143657.241542-6-daniel.lezcano@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 19 Feb 2023 18:26:22 +0100
Message-ID: <CAFBinCAm+pFuuJEL3_2B3o3ZaLWxb-JqHhxY0vJfb8ZfxKOieQ@mail.gmail.com>
Subject: Re: [PATCH v1 05/17] thermal/hwmon: Use the right device for devm_thermal_add_hwmon_sysfs()
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: rafael@kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Guillaume La Roque <glaroque@baylibre.com>, Amit Kucheria <amitk@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Daniel Golle <daniel@makrotopia.org>, ye xingchen <ye.xingchen@zte.com.cn>, 
	Randy Dunlap <rdunlap@infradead.org>, Balsam CHIHI <bchihi@baylibre.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	"open list:THERMAL DRIVER FOR AMLOGIC SOCS" <linux-amlogic@lists.infradead.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:QUALCOMM TSENS THERMAL DRIVER" <linux-arm-msm@vger.kernel.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	"open list:TI BANDGAP AND THERMAL DRIVER" <linux-omap@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230219_092636_549401_513C76B8 
X-CRM114-Status: GOOD (  13.79  )
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

On Sun, Feb 19, 2023 at 3:38 PM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
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
> ---
>  drivers/thermal/amlogic_thermal.c                  | 2 +-
For amlogic_thermal.c:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

