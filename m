Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F961FB44C4
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Apr 2026 07:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+k21mzy1Q8IyL290m/XCuURamP2UyoHvl1hWQE5Pk/w=; b=fiuf6bBLDUzbWMSmagypOIq9ba
	B7DYLoDanVuV3L0gi1D+eWRsB62ExlPfOHIt2shf9xdCtThZbzVOzGt0KpLr1kgscLyIKSwx5OED8
	2cR7Vtj3A82gLfdwmxFXsjjmncBUS8O0AoF6nxEIkxByQEo73XY4P6moqzB3FGX9xGzMeMFQeNOjY
	lc/511SPbXKuB+yG7Z8p8IQoZyT1Lv1vgg7FtrgiZWmnmsYTNnkdN0LGq9tKScqdziQhgEyWhUIck
	UXckeyohFRqIJVf3oBj+YdvBcwB8/Vk6NNTT2zrmAmkstJKaxLcxpd3NvmWKF70ebNNO/RHdtIyw6
	mDpndOdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGBIy-0000000CpRj-157g;
	Fri, 24 Apr 2026 07:50:28 +0000
Received: from mail-vk1-f194.google.com ([209.85.221.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGBIv-0000000CpRD-2M6I
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Apr 2026 07:50:27 +0000
Received: by mail-vk1-f194.google.com with SMTP id 71dfb90a1353d-56a9c5cb48bso2665038e0c.0
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Apr 2026 00:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777017024; x=1777621824;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+k21mzy1Q8IyL290m/XCuURamP2UyoHvl1hWQE5Pk/w=;
        b=jQPZHbA+6EL+xoW9O9XoWbYTf4XOCyVcwQmXnZeTuMWqCdPrTXK6IlYQRv381t2ZmT
         xojAhA/ujkI+0CgTrXyD2bQNk3oFhbKOUCUAW1qDMKum5s60QB5ovk9fNceMZjByDWpf
         ijBNZlP0Nf03H7o9sog/zDLvgzdvwgskYm6vX+s40fEFH38Xc5Mq+MDPpTHv1taRp5ZS
         xQeMze34b6c+Izbh73pyb4er+Dq3HM0haSkvvd+Tk6NO+i1qYLed1/LWkasev5qfYmFW
         HiBhrRwK1mDNGn95q0PrNTJ0Mhw7IO6UW457oYrmlA16nwz6k32G0RfhKCTEMikdusD5
         8cIA==
X-Forwarded-Encrypted: i=1; AFNElJ//ru266nBAuLEX3qNO+NEoInGt2ubmGythaSRyfSWaQoKK5tU8caklwkhjiYgIBIKGgWw5ks4lEQl2RgCOzg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/4JFZk8Q/LCQ/w1IjvSngZNJbOzGDhs2lkJN1hmBca67XRa5o
	ls5J2H61Ru2/PSSVWh0FDMP7Lh6Ej9hyiRTgyACacmCvnz9IjKXu9u2lZhyjQTIjxdGFjw==
X-Gm-Gg: AeBDiesHv5o088bwlQ791O9wb6aw8E77zK3UQZvZ+mC6uZ2M/Mpi3aw1iJhlkTAv3Uj
	y5Ff5mKJz36EtAsWEujP3DoqaowSzdpOTvqmvR1+VoP7GwUs5ghjk+nOzTq2BLw+VNM1P04k3BU
	lPTzoj2li/yV29SlbYmXucilZlz0rEX+VoNqEy5HobREuvXIkjnOjqBF9S4IhH6ZWK3DYUGvixk
	XlFkBdDZzPUDn5BAQnXlYBj1SN+I6rJ8NQUPmu1VUBYO13gNOUMdI+vOqQSNBXI15U5031xCb1G
	r0YFpnxanWvfSElECRTmIT9uv6D/7/cLvP/xJQMvGViwFuWlmEHNfaCATqxvn9NgKCQ5SdMGeIc
	Q9iX0PRcwAemg4LdvUJrZUOwVGqvg+zm5tEHrI/ZLT0rJcZZzsD2z6OCR/LqQlXtdq5ZPRuQdeB
	7hGmnKzhSE4bGBsR/9D7ab9hG0jM8Fmj4D6u4iotTUA1yyYEAZfuhlrJ/dUn9ELMiPci7oAe8=
X-Received: by 2002:a05:6122:46a6:b0:56f:31e3:9445 with SMTP id 71dfb90a1353d-56fa55bedbdmr15691885e0c.0.1777017023549;
        Fri, 24 Apr 2026 00:50:23 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa93275f4sm12958483e0c.13.2026.04.24.00.50.23
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 00:50:23 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-610e2e8f57dso2704471137.0
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Apr 2026 00:50:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+f+anwKrunrwB5WVOpKuVgNyQm7hINMXZMJJkq2AO4gdFp6AmlULtiip6zcHMXoCmbezDEmC14b3hc1baggA==@lists.infradead.org
X-Received: by 2002:a05:6102:38cb:b0:5e8:1d93:921a with SMTP id
 ada2fe7eead31-616f772e968mr14645934137.15.1777017023068; Fri, 24 Apr 2026
 00:50:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
 <20260423115550.444930-7-luca.ceresoli@bootlin.com>
In-Reply-To: <20260423115550.444930-7-luca.ceresoli@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 09:50:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVbEV0b+MwCjqyc9Q0EjasD2hoN0rqWtjfmPPotZ19Lrw@mail.gmail.com>
X-Gm-Features: AQROBzASdrVB_Aky8lNaIViGqa4fIOoRKTkBEjNLF-nFJbKyYgy5oQezNNnYjKM
Message-ID: <CAMuHMdVbEV0b+MwCjqyc9Q0EjasD2hoN0rqWtjfmPPotZ19Lrw@mail.gmail.com>
Subject: Re: [PATCH v2 41/41] drm: renesas: shmobile: remove now-redundant
 call to drm_connector_attach_encoder()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sasha Finkelstein <fnkl.kernel@gmail.com>, Janne Grunau <j@jannau.net>, Liu Ying <victor.liu@nxp.com>, 
	Douglas Anderson <dianders@chromium.org>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Cercueil <paul@crapouillou.net>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Icenowy Zheng <zhengxingda@iscas.ac.cn>, Jingoo Han <jingoohan1@gmail.com>, 
	Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Marek Vasut <marex@denx.de>, 
	Stefan Agner <stefan@agner.ch>, Jyri Sarha <jyri.sarha@iki.fi>, Michal Simek <michal.simek@amd.com>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_005025_614709_99B5C964 
X-CRM114-Status: GOOD (  22.19  )
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

Hi Luca,

On Thu, 23 Apr 2026 at 13:59, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> shmob_drm_connector_create() can init the connector in two ways, based on
> the 'if (sdev->pdata)':
>
>  1. manually in shmob_drm_connector_create(), or
>  2. delegating to drm_bridge_connector_init()
>
> Whichever branch is taken, drm_connector_attach_encoder() is called
> immediately after to attach the connector to the encoder.
>
> Now drm_bridge_connector_init() calls drm_connector_attach_encoder() on the
> connector so it is not needed anymore in case 2 and should be removed, but
> it is still needed in case 1. Move drm_connector_attach_encoder() from the
> common path to inside shmob_drm_connector_create() in order to get back to
> a single drm_connector_attach_encoder() in both cases.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

For case 2:
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

As none of the old SH platform have been converted from
sh_mobile_lcdc_fb to shmob-drm yet, case 1 cannot be tested.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

