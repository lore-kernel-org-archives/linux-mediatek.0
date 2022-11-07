Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD61C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 10:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7lexxXZ3I3hljvfG/MXh5XgWwfTCj6K6EGi2gwpMgRA=; b=qGxpajE+w7j5MGQjK0KnCusnm4
	1eK/sEgqQIWmU3CamhUysM7JSXWtqh2TNtiQU6jvC9X0rUkVxt5AhzJAauUEOSaPeAlUX56hxaJHu
	h66OdGvHxKngDy+AVesLG1ENhxLByH6wf37aZMnFgzDR1OQ+NS4Yd69uaE4BLzc/cud/Zj1QFd4SY
	1R3HimdsUvIoGNSkGGYlRinH/OGRGCr469XMcXlxtoXwvizcKJkYm/vogEGTePvWVcyyPg+6gdSFp
	olAJIKtJCXlffgKnapXg2JfMmfClPDKr+B/tvdJX4QQShB109MFgUGkCE8ADa/cPJzq0XQ2lnWvi6
	3MkS640w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orzr1-00Dw3C-TT; Mon, 07 Nov 2022 10:59:47 +0000
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25] helo=mx0b-001ae601.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orzqy-00Dvq0-SQ; Mon, 07 Nov 2022 10:59:46 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A78o4vV010393;
	Mon, 7 Nov 2022 04:58:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=7lexxXZ3I3hljvfG/MXh5XgWwfTCj6K6EGi2gwpMgRA=;
 b=MlOb16frReJltGone9fs4amjkqovcdEamnVC3FlFeoZZd6zluUCjkGf0ihnUMsqujkaA
 H8I/V07ZcrCtj3Me8MCnu1HzAT6c7SRFW+Hh/FVPBKLTBK0lkpQcAFdVVvECWHTUpo/L
 d/dE/5urYwZVfafPQWAGGipJxVMewDDaKcb60xAi4A8h4kLf4cmEFO87PvkJnkW7tfL0
 mbQIqr5S1dRUOd8T1/4MBzSMJ4Q4RIhkv/R5+HYlOfm7QbUPuCEQIfOD3fVC8gn6g8Oz
 NCISdICUUpF19kLQlfICj24QVNW5fiPzst1JOV1+w7Md+3AcASEfckm6g8vj5m1MRnhx Bg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3knn81j3vw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Nov 2022 04:58:26 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.15; Mon, 7 Nov
 2022 04:58:24 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.15 via Frontend Transport; Mon, 7 Nov 2022 04:58:23 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D68F1468;
	Mon,  7 Nov 2022 10:58:23 +0000 (UTC)
Date: Mon, 7 Nov 2022 10:58:23 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Maxime Ripard <maxime@cerno.tech>
CC: Stephen Boyd <sboyd@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>, Daniel Vetter
	<daniel@ffwll.ch>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Thierry
 Reding <thierry.reding@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Shawn
 Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Ulf Hansson
	<ulf.hansson@linaro.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Dinh Nguyen
	<dinguyen@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Chunyan Zhang
	<zhang.lyra@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andreas
 =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Jonathan Hunter
	<jonathanh@nvidia.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alessandro Zummo
	<a.zummo@towertech.it>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Orson
 Zhai <orsonzhai@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Samuel Holland
	<samuel@sholland.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Richard
 Fitzgerald <rf@opensource.cirrus.com>,
        Vinod Koul <vkoul@kernel.org>, NXP
 Linux Team <linux-imx@nxp.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Kishon Vijay
 Abraham I <kishon@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Takashi Iwai <tiwai@suse.com>, David Airlie <airlied@gmail.com>,
        Luca
 Ceresoli <luca.ceresoli@bootlin.com>,
        Jernej Skrabec
	<jernej.skrabec@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        David Lechner
	<david@lechnology.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Mark Brown
	<broonie@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
        <linux-phy@lists.infradead.org>, <linux-mips@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        <linux-actions@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        <patches@opensource.cirrus.com>, <linux-tegra@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 20/65] clk: wm831x: clkout: Add a determine_rate hook
Message-ID: <20221107105823.GF10437@ediswmail.ad.cirrus.com>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-20-f6736dec138e@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221018-clk-range-checks-fixes-v2-20-f6736dec138e@cerno.tech>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: q89X8q3_8G1HVgVOlyA9kAC4F9KyM1s_
X-Proofpoint-GUID: q89X8q3_8G1HVgVOlyA9kAC4F9KyM1s_
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_025944_948999_CEBA76B5 
X-CRM114-Status: GOOD (  28.58  )
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

On Fri, Nov 04, 2022 at 02:17:37PM +0100, Maxime Ripard wrote:
> The WM381x "clkout" clock implements a mux with a set_parent hook,
> but doesn't provide a determine_rate implementation.
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

Yeah I don't think there would be anything wrong with this clock
changing parents on a rate change, but as you say this can be
refined down the line if someone needs the behaviour. It's an
older part so probably better to stick roughly to the current
behaviour for now.

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

