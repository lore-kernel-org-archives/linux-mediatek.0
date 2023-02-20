Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0540AC636CC
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Feb 2023 12:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Re6NLj3mYWi/PS1iVcG93D07BAspc2CGyOXyoSaH5I=; b=QNt9nnuTC/hqLELfsn7DNt8odu
	cGH/WygSRXxhUgD3uJm1XvG/dWjexdX/HHlxcDlS9mocl5fshQlwyy/1L3ATNuHhCTFEI2rH98ya2
	A7A8fScYymLg7j32hP2VZ//5CQvW+ma7qygNUkFYQIBOACrnL/L6fEIZoqPxzs+t9gGNZ9obuTUfU
	zg/cNKl62dK0FhCiQglwRZGxo9VJ3AToXJTfRNxdQWJ/v1As4BSpXfj9tyLaVESET3yp9kbNnPF4g
	/jl1XiZ9rQVWliCnBVIP1lB57Qq3zXtmmtPeeohbluM6lzR8TMec5zrXelw3vagIrHPgIJhBjpZcw
	H8Wv1B5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU58g-0040gT-9p; Mon, 20 Feb 2023 12:19:26 +0000
Received: from mail-qv1-f47.google.com ([209.85.219.47])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU58V-0040dg-QZ; Mon, 20 Feb 2023 12:19:18 +0000
Received: by mail-qv1-f47.google.com with SMTP id nf5so868234qvb.5;
        Mon, 20 Feb 2023 04:19:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Re6NLj3mYWi/PS1iVcG93D07BAspc2CGyOXyoSaH5I=;
        b=BHa3SIfROMMa8IHp6Y9+ADdSLOWIrSFYPqufv+tFt1SvOA28OeUiCYiEu+jAavlSXg
         aTlmvFsDh9jFkcjc3xF/sHegBCUnve05KtiLb3uYTpilMhTfqv5BOEe5p2rIUPaZUihB
         c9lI/ynw0YZxPKiDj1jisH/pvkwHSMo6AnaoLadys5+DH3DAby1QQzprZUsF72yXc8/w
         0zuXlfAUgzBxMkwZGAOqZ7chwl38AGorQGaMM0SnpuP/80DeCAnAuGgJAwDyr+Hd2Erv
         xX7UDiSpulFEHzm1cSHgDvfK/e1pNNCwipqQp3559eias9cE4h3pQgg8CNFl1DiGoirS
         2wJw==
X-Gm-Message-State: AO0yUKVSq51Uvm+F2PXkAWK4te0Wh+PwdLOvu3E9Z/cAjAWgJTMn/8x9
	q4biLQj1SokWbbz71bJO3/DkpDv/sAmpNRKr
X-Google-Smtp-Source: AK7set9pzVlie67nov5RUKxibIpAGEorhd3XToss3nf7HaE0gKWrjREYZCpU+6J/zIMMlfzcPvMJTA==
X-Received: by 2002:a05:6214:224a:b0:56e:9393:b1d5 with SMTP id c10-20020a056214224a00b0056e9393b1d5mr3208716qvc.39.1676895551396;
        Mon, 20 Feb 2023 04:19:11 -0800 (PST)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 128-20020a370b86000000b0073b59128298sm681704qkl.48.2023.02.20.04.19.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 04:19:10 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-536bf92b55cso6010537b3.12;
        Mon, 20 Feb 2023 04:19:10 -0800 (PST)
X-Received: by 2002:a81:8606:0:b0:52e:e6ed:308e with SMTP id
 w6-20020a818606000000b0052ee6ed308emr1847623ywf.526.1676895529736; Mon, 20
 Feb 2023 04:18:49 -0800 (PST)
MIME-Version: 1.0
References: <20230219143657.241542-1-daniel.lezcano@linaro.org>
 <20230219143657.241542-2-daniel.lezcano@linaro.org> <OS3PR01MB8460E7C2D1F9EEEDDC579FFEC2A49@OS3PR01MB8460.jpnprd01.prod.outlook.com>
In-Reply-To: <OS3PR01MB8460E7C2D1F9EEEDDC579FFEC2A49@OS3PR01MB8460.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Feb 2023 13:18:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWFn+LbKE=77mRBfGqSu3x5qsk3X-pQVeu3uZXEejyRRg@mail.gmail.com>
Message-ID: <CAMuHMdWFn+LbKE=77mRBfGqSu3x5qsk3X-pQVeu3uZXEejyRRg@mail.gmail.com>
Subject: Re: [PATCH v1 01/17] thermal/core: Add a thermal zone 'devdata' accessor
To: DLG Adam Ward <DLG-Adam.Ward.opensource@dm.renesas.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, "rafael@kernel.org" <rafael@kernel.org>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Len Brown <lenb@kernel.org>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Raju Rangoju <rajur@chelsio.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Ido Schimmel <idosch@nvidia.com>, 
	Petr Machata <petrm@nvidia.com>, Gregory Greenman <gregory.greenman@intel.com>, 
	Kalle Valo <kvalo@kernel.org>, Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Amit Kucheria <amitk@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Markus Mayer <mmayer@broadcom.com>, 
	Support Opensource <support.opensource@diasemi.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Thara Gopinath <thara.gopinath@gmail.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Heiko Stuebner <heiko@sntech.de>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Vasily Khoruzhick <anarsoul@gmail.com>, 
	Yangtao Li <tiny.windzz@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Talel Shenhar <talel@amazon.com>, 
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Stefan Wahren <stefan.wahren@i2se.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	ye xingchen <ye.xingchen@zte.com.cn>, Zheng Yongjun <zhengyongjun3@huawei.com>, 
	Tim Zimmermann <tim@linux4.de>, Yang Li <yang.lee@linux.alibaba.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
	Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, Jiang Jian <jiangjian@cdjrlc.com>, 
	Daniel Golle <daniel@makrotopia.org>, Balsam CHIHI <bchihi@baylibre.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	"open list:ACPI THERMAL DRIVER" <linux-acpi@vger.kernel.org>, 
	"open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" <linux-ide@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>, 
	"open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, 
	"open list:CXGB4 ETHERNET DRIVER (CXGB4)" <netdev@vger.kernel.org>, 
	"open list:INTEL WIRELESS WIFI LINK (iwlwifi)" <linux-wireless@vger.kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, 
	"open list:RENESAS R-CAR THERMAL DRIVERS" <linux-renesas-soc@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	"open list:TI BANDGAP AND THERMAL DRIVER" <linux-omap@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_041915_904057_58A150E6 
X-CRM114-Status: GOOD (  22.16  )
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

Hi Adam,

On Mon, Feb 20, 2023 at 12:14 PM DLG Adam Ward
<DLG-Adam.Ward.opensource@dm.renesas.com> wrote:
> On 19/02/23 14:37, Daniel Lezcano wrote:
> >The thermal zone device structure is exposed to the different drivers and obviously they access the internals while that should be restricted to the core thermal code.
> >
> >In order to self-encapsulate the thermal core code, we need to prevent the drivers accessing directly the thermal zone structure and provide accessor functions to deal with.
> >
> >Provide an accessor to the 'devdata' structure and make use of it in the different drivers.
> >No functional changes intended.
> >
> >Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> >---
>
> >drivers/thermal/da9062-thermal.c                 |  2 +-
>
> For da9062:
>
> Reviewed-by: Adam Ward <DLG-Adam.Ward.opensource@dm.renesas.com>

Looks like Daniel has found the new Dialog maintainer he was looking
for? Time to update MAINTAINERS?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

