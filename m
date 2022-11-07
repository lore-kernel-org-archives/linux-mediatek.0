Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFA1C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 10:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MTDWpx1hsSGPKEDqYGlpVHQIbEswPJLgPoSW4FILuto=; b=e/Xy/OlKhdn5TNjA3qVa9gxhrE
	cvfxpXxjiBah4Q9BOpS7tJUVvevAdqP3RlCvHaXnqgPuvGcoS66/K0LS1TckQJ2y9RHaBMUG8nCgK
	JIzpHM9FIljYa2PcZzMOrHRC7xUp+0XtjzkIH9lzHgqGjCsXPCihJKeymRCOLh3Fn2KP8w+LQUOsd
	2UOCkOZIS7XZkEzNbAtQ7cJa6CPLQqLsXzTa5mTSjr6fw4IJRoau5nySeM5mQOj5kHnqQu4IMQhm5
	6/3TK0bBSitimlha82j3EegAlW1O4YJWPVgcUNYazld3RoNjxY939I2Hk5BOXoaFq4iQc3wQFBNrP
	YFYIfjFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orzpY-00DtWH-M3; Mon, 07 Nov 2022 10:58:16 +0000
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orzpU-00DtO0-Ix; Mon, 07 Nov 2022 10:58:14 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A75n7uC030088;
	Mon, 7 Nov 2022 04:56:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=MTDWpx1hsSGPKEDqYGlpVHQIbEswPJLgPoSW4FILuto=;
 b=i917JrNjkH3z3a2XXOdwc3doHM6OAxz7LbDVUIm7C+E3Cwrb58ZxQpsKKdqXGk5Z9z+/
 hzIdNQ85JqsCyNGRwGzs83o+jomuHbPhAuHnJILygojPwEG6jpejkauG5tvHq+6Mjx1T
 10Yn1n9hWdF7kaZM8JMcssci6VZmHmvumMtu+EtvU3lJyidhtFDMwmr56awM5w5p+0ch
 stqQ4q3mYnrkiSj6po7T4la5GvjwlpX4RBmjPsI7iQ7y3uUL/hIt6CTV9TTf6ttWh4IS
 JztSITFuL9+F5l7b8BFUGCyo8869zZsKrryWoIr9+DG4ZaxCTT2UTGw8JJDMLIjOfV8b vg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3knm8pa27f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Nov 2022 04:56:54 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.15; Mon, 7 Nov
 2022 04:56:53 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.15 via Frontend
 Transport; Mon, 7 Nov 2022 04:56:53 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0BFD7468;
	Mon,  7 Nov 2022 10:56:53 +0000 (UTC)
Date: Mon, 7 Nov 2022 10:56:53 +0000
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
Subject: Re: [PATCH v2 65/65] clk: Warn if we register a mux without
 determine_rate
Message-ID: <20221107105653.GE10437@ediswmail.ad.cirrus.com>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-65-f6736dec138e@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221018-clk-range-checks-fixes-v2-65-f6736dec138e@cerno.tech>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: LEBapgZqMTQa_vVOLP8DsF0yYR6qduTv
X-Proofpoint-GUID: LEBapgZqMTQa_vVOLP8DsF0yYR6qduTv
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_025812_783009_9F0B9976 
X-CRM114-Status: GOOD (  26.78  )
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

On Fri, Nov 04, 2022 at 02:18:22PM +0100, Maxime Ripard wrote:
> The determine_rate hook allows to select the proper parent and its rate
> for a given clock configuration. On another hand, set_parent is there to
> change the parent of a mux.
> 
> Some clocks provide a set_parent hook but don't implement
> determine_rate. In such a case, set_parent is pretty much useless since
> the clock framework will always assume the current parent is to be used,
> and we will thus never change it.
> 
> This situation can be solved in two ways:
>   - either we don't need to change the parent, and we thus shouldn't
>     implement set_parent;
>   - or we don't want to change the parent, in this case we should set
>     CLK_SET_RATE_NO_REPARENT;
>   - or we're missing a determine_rate implementation.
> 
> The latter is probably just an oversight from the driver's author, and
> we should thus raise their awareness about the fact that the current
> state of the driver is confusing.
> 
> It's not clear at this point how many drivers are affected though, so
> let's make it a warning instead of an error for now.
> 

Commit message could probably use updated to make the new state
of the chain.

Thanks,
Charles

