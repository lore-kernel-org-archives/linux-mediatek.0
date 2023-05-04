Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9140BC7EE21
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 May 2023 13:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zEWDZRH16IxZH8jYRpv51rOx+oio62y+XziPw6IiJ1w=; b=Pc3op1hxQAARMpIC5Cpz2S0XG+
	xY9+WfaEU1qjAJGF/P0uuM98t5Ey9LpVJ5deFvVcs2qryFMhJ6I/To7A5q+nsx1dX4m2mfCGmGHh5
	ppd2RwvomQqPYY/7ei7iHzhoIJ8V1rfp/cJxqetEQptXZew09uZdheX/wsqXjVJN1ikj1LdAuoPkM
	lZlR1qKq0WUOLCt12t42KznMFeOycqz/tTdsqlOmQJOhdgUnaDSxXPLCFxKMaP9ItWJipPsbTAkRH
	CdxZdcgOvzT8mec7vjZLVJn85/Fno8464FivYBwDnrcZYGDuT//LS1um9VI1RqNCcLZzdbUxoYlN+
	lFFIlgLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puZCd-007zPM-2d;
	Thu, 04 May 2023 13:40:59 +0000
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puZCa-007zNt-0F;
	Thu, 04 May 2023 13:40:57 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3445DKX5028271;
	Thu, 4 May 2023 08:39:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=zEWDZRH16IxZH8jYRpv51rOx+oio62y+XziPw6IiJ1w=;
 b=L9OXVtBpZ1h2EQYPU9fS+CdLeJbQogB3ovHqBxHZV93tB0yyeToDCRKM+3p1Z+XcLFZz
 DhnfCDaIAxZdN2kEgqy91hT0ZkrDGwKDxWYOZyY84Bl71CaNzT/kQ6H7HeGti1LPjN2A
 1C53tmN+15LZY4Xx0LsXz3jdPfYj804ASLi4vP04knaO2fZRiDoRcGlVawsjF8dnEBef
 /SeuYP9ruq4TACIUkQ8hZ4rHae8zIGOhnmbirZT1jFR/3kSOYyRRGhG6Ds8kk3q2z9qA
 m1ycJOjn8GapD45ROvo5FEKeAAyqeD0ftMxijnIycmgOTyr7CJvQgOt/JbzSOHf7FjX0 fg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3q8ynqxxwk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 May 2023 08:39:26 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Thu, 4 May
 2023 08:39:24 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 4 May 2023 08:39:24 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E168D11AA;
	Thu,  4 May 2023 13:39:23 +0000 (UTC)
Date: Thu, 4 May 2023 13:39:23 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Maxime Ripard <maxime@cerno.tech>
CC: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>,
        Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Nicolas Ferre
	<nicolas.ferre@microchip.com>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        Claudiu Beznea
	<claudiu.beznea@microchip.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Richard
 Fitzgerald <rf@opensource.cirrus.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Lechner
	<david@lechnology.com>, Sekhar Nori <nsekhar@ti.com>,
        Abel Vesa
	<abelvesa@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer
	<s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Peter De
 Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter
	<jonathanh@nvidia.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I
	<kishon@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>, Chen-Yu Tsai
	<wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland
	<samuel@sholland.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Orson Zhai
	<orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan
 Zhang <zhang.lyra@gmail.com>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-actions@lists.infradead.org>, <patches@opensource.cirrus.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-phy@lists.infradead.org>,
        <linux-rtc@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
        <alsa-devel@alsa-project.org>, <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v3 14/65] clk: lochnagar: Add a determine_rate hook
Message-ID: <20230504133923.GE68926@ediswmail.ad.cirrus.com>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
 <20221018-clk-range-checks-fixes-v3-14-9a1358472d52@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221018-clk-range-checks-fixes-v3-14-9a1358472d52@cerno.tech>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: Q2sbiD7_m7STQAOdv3OM1SrTnrP4amce
X-Proofpoint-ORIG-GUID: Q2sbiD7_m7STQAOdv3OM1SrTnrP4amce
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_064056_255956_5D575C72 
X-CRM114-Status: GOOD (  26.80  )
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

On Tue, Apr 04, 2023 at 12:11:04PM +0200, Maxime Ripard wrote:
> The lochnagar clocks implement a mux with a set_parent hook, but
> doesn't provide a determine_rate implementation.
> 
> This is a bit odd, since set_parent() is there to, as its name implies,
> change the parent of a clock. However, the most likely candidate to
> trigger that parent change is a call to clk_set_rate(), with
> determine_rate() figuring out which parent is the best suited for a
> given rate.
> 
> The other trigger would be a call to clk_set_parent(), but it's far less
> used, and it doesn't look like there's any obvious user for that clock.
> 
> So, the set_parent hook is effectively unused, possibly because of an
> oversight. However, it could also be an explicit decision by the
> original author to avoid any reparenting but through an explicit call to
> clk_set_parent().
> 
> The latter case would be equivalent to setting the flag
> CLK_SET_RATE_NO_REPARENT, together with setting our determine_rate hook
> to __clk_mux_determine_rate(). Indeed, if no determine_rate
> implementation is provided, clk_round_rate() (through
> clk_core_round_rate_nolock()) will call itself on the parent if
> CLK_SET_RATE_PARENT is set, and will not change the clock rate
> otherwise. __clk_mux_determine_rate() has the exact same behavior when
> CLK_SET_RATE_NO_REPARENT is set.
> 
> And if it was an oversight, then we are at least explicit about our
> behavior now and it can be further refined down the line.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Tested-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

