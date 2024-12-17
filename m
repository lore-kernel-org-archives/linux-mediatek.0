Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE1DE7717F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Dec 2024 11:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qsiwteq3OE1nMIvPHi8yzQ7rx0AYl8f4JaOkmoloyhE=; b=0QwrxBKwicdNStdzlV14c24y2Y
	pS2GrmXygCpj2R0Wn//O547hFFHltcTkwGUQ0C1MKaUTioMjo/eQ/oVMexfyY9HbtoU3r5oCmIq3D
	McfJQ4t4OQN9GrzIjhsolrMtHvsBooiIzMkFVyEAAhNjiTZZA1tFZoz+RN+Xs1aaI1Pic+SHzmBfQ
	4/6yQE0EVYsrIdJhxVolAXCXMtlHXN1ryyyZbKdGtWbR86hNH2hUVJVfxb398yJQs/WJzu2JWTuqj
	PJQhVfJntOpLem3kBXOx76dqYEgeNYxXQZWJ0ERA1vb8LdlsvDbSGTO/QG4FHwB3WnuSX7aXt5i1K
	rn3a/oBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNVM1-0000000DCiA-44xc;
	Tue, 17 Dec 2024 11:03:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNVKv-0000000DCZZ-3Zz2;
	Tue, 17 Dec 2024 11:01:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6FFEA1063;
	Tue, 17 Dec 2024 03:02:23 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE4E93F528;
	Tue, 17 Dec 2024 03:01:47 -0800 (PST)
Date: Tue, 17 Dec 2024 11:01:40 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Yiting Deng <yiting.deng@amlogic.com>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Support Opensource <support.opensource@diasemi.com>, Paul Cercueil
 <paul@crapouillou.net>, Vladimir Zapolskiy <vz@mleia.com>, Piotr
 Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, Chanwoo Choi
 <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Eddie Huang
 <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Orson Zhai
 <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan
 Zhang <zhang.lyra@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Vincent
 Shih <vincent.sunplus@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Michal
 Simek <michal.simek@amd.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] rtc: use boolean values with device_init_wakeup()
Message-ID: <20241217110140.22c92138@donnerap.manchester.arm.com>
In-Reply-To: <20241217071331.3607-2-wsa+renesas@sang-engineering.com>
References: <20241217071331.3607-2-wsa+renesas@sang-engineering.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_030157_990701_D365261B 
X-CRM114-Status: GOOD (  14.28  )
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

On Tue, 17 Dec 2024 08:13:26 +0100
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> device_init_wakeup() second argument is a bool type. Use proper boolean
> values when calling it to match the type and to produce unambiguous code
> which is easier to understand.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Verified via regexps that it's indeed this pattern: 1 => true, 0 => false.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
> Created with a coccinelle script. I opted for a single patch because the change
> is rather trivial. I can break out per driver if this is desired. If you
> like the change at all, that is.
> 
>  drivers/rtc/rtc-88pm80x.c       | 2 +-
>  drivers/rtc/rtc-88pm860x.c      | 2 +-
>  drivers/rtc/rtc-amlogic-a4.c    | 6 +++---
>  drivers/rtc/rtc-armada38x.c     | 2 +-
>  drivers/rtc/rtc-as3722.c        | 2 +-
>  drivers/rtc/rtc-at91rm9200.c    | 2 +-
>  drivers/rtc/rtc-at91sam9.c      | 2 +-
>  drivers/rtc/rtc-cadence.c       | 2 +-
>  drivers/rtc/rtc-cmos.c          | 2 +-
>  drivers/rtc/rtc-cpcap.c         | 2 +-
>  drivers/rtc/rtc-cros-ec.c       | 2 +-
>  drivers/rtc/rtc-da9055.c        | 2 +-
>  drivers/rtc/rtc-ds3232.c        | 2 +-
>  drivers/rtc/rtc-isl1208.c       | 2 +-
>  drivers/rtc/rtc-jz4740.c        | 2 +-
>  drivers/rtc/rtc-loongson.c      | 4 ++--
>  drivers/rtc/rtc-lp8788.c        | 2 +-
>  drivers/rtc/rtc-lpc32xx.c       | 2 +-
>  drivers/rtc/rtc-max77686.c      | 2 +-
>  drivers/rtc/rtc-max8925.c       | 2 +-
>  drivers/rtc/rtc-max8997.c       | 2 +-
>  drivers/rtc/rtc-meson-vrtc.c    | 2 +-
>  drivers/rtc/rtc-mpc5121.c       | 2 +-
>  drivers/rtc/rtc-mt6397.c        | 2 +-
>  drivers/rtc/rtc-mv.c            | 4 ++--
>  drivers/rtc/rtc-mxc.c           | 2 +-
>  drivers/rtc/rtc-mxc_v2.c        | 2 +-
>  drivers/rtc/rtc-omap.c          | 2 +-
>  drivers/rtc/rtc-palmas.c        | 2 +-
>  drivers/rtc/rtc-pic32.c         | 2 +-
>  drivers/rtc/rtc-pm8xxx.c        | 2 +-
>  drivers/rtc/rtc-pxa.c           | 2 +-
>  drivers/rtc/rtc-rc5t583.c       | 2 +-
>  drivers/rtc/rtc-rc5t619.c       | 2 +-
>  drivers/rtc/rtc-renesas-rtca3.c | 2 +-
>  drivers/rtc/rtc-rk808.c         | 2 +-
>  drivers/rtc/rtc-s3c.c           | 2 +-
>  drivers/rtc/rtc-s5m.c           | 2 +-
>  drivers/rtc/rtc-sa1100.c        | 2 +-
>  drivers/rtc/rtc-sc27xx.c        | 4 ++--
>  drivers/rtc/rtc-sh.c            | 2 +-
>  drivers/rtc/rtc-spear.c         | 4 ++--
>  drivers/rtc/rtc-sun6i.c         | 2 +-
>  drivers/rtc/rtc-sunplus.c       | 4 ++--
>  drivers/rtc/rtc-tegra.c         | 2 +-
>  drivers/rtc/rtc-test.c          | 2 +-
>  drivers/rtc/rtc-tps6586x.c      | 2 +-
>  drivers/rtc/rtc-tps65910.c      | 2 +-
>  drivers/rtc/rtc-twl.c           | 2 +-
>  drivers/rtc/rtc-wm831x.c        | 2 +-
>  drivers/rtc/rtc-wm8350.c        | 2 +-
>  drivers/rtc/rtc-xgene.c         | 4 ++--
>  drivers/rtc/rtc-zynqmp.c        | 4 ++--
>  53 files changed, 62 insertions(+), 62 deletions(-)
> 

