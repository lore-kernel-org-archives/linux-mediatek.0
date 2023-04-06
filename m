Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C679C7618D
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Apr 2023 15:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o77iL/oa9+UaptZYirM6y8kPFM2IJe9glWZiAM1gLTg=; b=e2JGUF8JvTioXQp1Ltm0utZvgV
	Z4NhZBIVzHZrpDgGC6f/pXsCYkCnz7DXyrSGyGQlyDPm3ofYKGhqW4k4aJvJOI2OHi67bKntFjYlJ
	dwNGEycaxOpkZZhPgQz/N6NhuUyYoMy65fal/vCVaP08dwBEydhY6NB1UxgXgpCt7niMgUhUkNH/i
	VisloafzTFhxSLAFsuCVg0hAZwTxCmJRb8CR+nRNBrixK6L7ORrr8o7LpAnSPcZfVuI+M811Wo6By
	Eb3sSqTJcMV0y3GQ/hnGp5QDAimFmmNsAFa+Rk+/SHFB/1+p2e37FLcWcidZ3o8ZdgcD8wFfQCUnv
	IwWD90pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkRQb-007nId-2v;
	Thu, 06 Apr 2023 15:21:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkRQY-007nGP-0V;
	Thu, 06 Apr 2023 15:21:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D72F1169E;
	Thu,  6 Apr 2023 08:22:08 -0700 (PDT)
Received: from [10.2.7.51] (stinger.cambridge.arm.com [10.2.7.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ADE653F762;
	Thu,  6 Apr 2023 08:21:17 -0700 (PDT)
Message-ID: <a54a4ea0-f9f5-6869-9629-747c3889a1de@arm.com>
Date: Thu, 6 Apr 2023 16:21:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 36/65] clk: versatile: sp810: Add a determine_rate hook
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, =?UTF-8?Q?Andreas_F=c3=a4rber?=
 <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Lechner <david@lechnology.com>, Sekhar Nori <nsekhar@ti.com>,
 Abel Vesa <abelvesa@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Alessandro Zummo <a.zummo@towertech.it>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Paul Cercueil <paul@crapouillou.net>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org,
 patches@opensource.cirrus.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-phy@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, alsa-devel@alsa-project.org,
 linux-mips@vger.kernel.org
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
 <20221018-clk-range-checks-fixes-v3-36-9a1358472d52@cerno.tech>
From: Pawel Moll <pawel.moll@arm.com>
In-Reply-To: <20221018-clk-range-checks-fixes-v3-36-9a1358472d52@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_082130_288221_C575051A 
X-CRM114-Status: GOOD (  16.75  )
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

On 04/04/2023 11:11, Maxime Ripard wrote:
> The Versatile sp810 "timerclken" clock implements a mux with a
> set_parent hook, but doesn't provide a determine_rate implementation.
> 
> This is a bit odd, since set_parent() is there to, as its name implies,
> change the parent of a clock. 

Explanation of this mystery is pretty simple - the original patch:

	commit 6e973d2c438502dcf956e76305258ba7d1c7d1d3
	Author: Pawel Moll <pawel.moll@arm.com>
	Date:   Thu Apr 18 18:23:22 2013 +0100

	    clk: vexpress: Add separate SP810 driver

predates introduction of determine_rate to clk_ops...

	commit 71472c0c06cf9a3d1540762ea205654c584e3bc4
	Author: James Hogan <jhogan@kernel.org>
	Date:   Mon Jul 29 12:25:00 2013 +0100

	    clk: add support for clock reparent on set_rate

and clearly no one (the author included ;-) bothered to have another
look at this side of the driver.

> And if it was an oversight, then we are at least explicit about our
> behavior now and it can be further refined down the line.

It's been one hell of a memory lane trip, but my recollection suggest
that the main goal of the driver was simply initialisation of the mux
to select the 1MHz parent, because the other option - 32kHz - just
didn't make any sense whatsoever. And that would be the case on every
single platform using SP810 I know (or at least: knew), so it's seems
to me that making the state permanent, as you're suggesting (or I
think you're suggesting?) it's the right thing to do.

Thanks!

Paweł

