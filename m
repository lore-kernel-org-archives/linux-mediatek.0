Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4CDC4828C
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jan 2024 05:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vVKi+G1fpq2+7XfP8vYeCq0vVLccczG/DfMxQszMzg0=; b=Fdwt/hgfPstk8FLfaL1tOIS/Pp
	en/7ETrInh4joW+i7WSexL4kr1SXejw7vcqpYRRQap6s2pE2QxWwIGk4dDvjtLyyZz+rm/RY7s2DA
	qBbdla8h+oFd2W9VB1fbShMhk+CUVdAOw5FyGBPJZJtsoRa3V+6Ul1CTNdfCEl4eoQ4aEoGerRTsj
	DYkAhnuz7R3p6yUkGtdBMDFDNqIIUzW2ClP2k9vPCQL0QD/yMEoIbmd9QuzeSS+1l80gi3TpOXXfn
	iNQpEu8P7G6Qy5cnJvpK0+4c3ZGMEKGFKIQm3NC7r0Sgd/yvzytfNnCGYKCf6RftR2BLHdvcLXKpL
	NVJy+u+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV2yd-00000001W7s-3E31;
	Wed, 31 Jan 2024 05:17:35 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV2yb-00000001W72-0BGN;
	Wed, 31 Jan 2024 05:17:34 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rV2yM-0001i0-0l;
	Wed, 31 Jan 2024 05:17:18 +0000
Date: Wed, 31 Jan 2024 05:17:14 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Frank Wunderlich <linux@fw-web.de>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
	Amit Kucheria <amitk@kernel.org>, stable@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Zhang Rui <rui.zhang@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] thermal/drivers/mediatek: Fix control buffer enablement
 on MT7896
Message-ID: <ZbnX2vfcalNL3yRV@makrotopia.org>
References: <20230907112018.52811-1-linux@fw-web.de>
 <20230913083529.3bgjl6rvfmixgjnd@blmsp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230913083529.3bgjl6rvfmixgjnd@blmsp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_211733_101463_3F41982F 
X-CRM114-Status: GOOD (  20.37  )
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

Hi everyone!

On Wed, Sep 13, 2023 at 10:35:29AM +0200, Markus Schneider-Pargmann wrote:
> On Thu, Sep 07, 2023 at 01:20:18PM +0200, Frank Wunderlich wrote:
> > From: Frank Wunderlich <frank-w@public-files.de>
> > 
> > Reading thermal sensor on mt7986 devices returns invalid temperature:
> > 
> > bpi-r3 ~ # cat /sys/class/thermal/thermal_zone0/temp
> >  -274000
> > 
> > Fix this by adding missing members in mtk_thermal_data struct which were
> > used in mtk_thermal_turn_on_buffer after commit 33140e668b10.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 33140e668b10 ("thermal/drivers/mediatek: Control buffer enablement tweaks")
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> 
> Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>

Reviewed-by: Daniel Golle <daniel@makrotopia.org>
Tested-by: Daniel Golle <daniel@makrotopia.org>

Kind ping to thermal and mediatek maintainers, please merge this patch.

https://patchwork.kernel.org/project/linux-pm/patch/20230907112018.52811-1-linux@fw-web.de/

https://patchwork.kernel.org/project/linux-mediatek/patch/20230907112018.52811-1-linux@fw-web.de/

> 
> Thanks for fixing!
> 
> Best,
> Markus
> 
> > ---
> >  drivers/thermal/mediatek/auxadc_thermal.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/mediatek/auxadc_thermal.c
> > index 843214d30bd8..967b9a1aead4 100644
> > --- a/drivers/thermal/mediatek/auxadc_thermal.c
> > +++ b/drivers/thermal/mediatek/auxadc_thermal.c
> > @@ -690,6 +690,9 @@ static const struct mtk_thermal_data mt7986_thermal_data = {
> >  	.adcpnp = mt7986_adcpnp,
> >  	.sensor_mux_values = mt7986_mux_values,
> >  	.version = MTK_THERMAL_V3,
> > +	.apmixed_buffer_ctl_reg = APMIXED_SYS_TS_CON1,
> > +	.apmixed_buffer_ctl_mask = GENMASK(31, 6) | BIT(3),
> > +	.apmixed_buffer_ctl_set = BIT(0),
> >  };
> >  
> >  static bool mtk_thermal_temp_is_valid(int temp)
> > -- 
> > 2.34.1
> > 
> > 
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

