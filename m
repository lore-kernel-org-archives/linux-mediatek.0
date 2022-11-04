Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E3FDC4321E
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Nov 2022 13:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gulfUfzWxrSqI04EuTpJI31rPi0/dfB3rbjvrNMKjxY=; b=QEBVYga/h0w6I1kBlpvzByIF0s
	zcRte192/qHqD/7fNzVIIGeaSLgZYkvhRepEwvYIryXFXwQxM962z7x5T1uX7F8vZ3aosEkIQcCX+
	AfunsspOZXa7dX4R1indtpKNmLUZfDv2vo4jOk8pyXzxbDO3tRUXMhmVyS97MgIm1idiMBcTkXB3M
	TgvBdhdaFltQcaH8J8wPpZIEYybNENvPeyxFNjEt/QHJup1+zNKN24Leuv/1MWIq1fWd3//XuzvtK
	h5wAL79sh6wr92Sd4GeJJ4zFxag8WVzsG9KQ8oijSMKyTQaLG2hAL36GxrK+CRGuShwvVWkdt714u
	v8x4vnvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqwaD-003cVj-9K; Fri, 04 Nov 2022 13:18:05 +0000
Received: from new1-smtp.messagingengine.com ([66.111.4.221])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqwa3-003cOn-1Y; Fri, 04 Nov 2022 13:17:58 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailnew.nyi.internal (Postfix) with ESMTP id 695D7580452;
	Fri,  4 Nov 2022 09:17:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 04 Nov 2022 09:17:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1667567874; x=
	1667575074; bh=gulfUfzWxrSqI04EuTpJI31rPi0/dfB3rbjvrNMKjxY=; b=j
	xHzL7Cnzjfiw0PGk2c3HMN+PyHDbxOM2uEnKzwVGPtCzb8g3bu3Eiz3Xyexsc//I
	eS6k5W3Op9rsyni8gj3FUiKo46O6VmY+Yn+cedj2E5AkZw35yhxickPQS1dFkcwS
	7EpQk9j3L3hPZdNPSx2Tp4hp1NrDRw/6EuAzr0GkUDXHnkg+KVB8+VHBCa3OIeN6
	HiG97KbdXWEXAER1UyuUfycgukhpXo9yKoP4RlJMZkyD8CQ3w5MF2ZyHA9/+4DMz
	tNwzP+OTA1J8obKlrIJe1slYiwet0dc569CunTXqgx0e27uXxEHFKpAWFs/jJsjT
	skp6xRiKzC6uH3PY8iMdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567874; x=
	1667575074; bh=gulfUfzWxrSqI04EuTpJI31rPi0/dfB3rbjvrNMKjxY=; b=N
	cXu9Kys9Bj+Vx2D3rQoRZS89rl6OSuwEoxKU2uDggMYLKsUEucWr/xdkTEuyTfLe
	4Gbh55NY0v1hs1/44EUfw0UXk/dmYaTUr4AgQB8nwcW6SVUYRVot0WUnfS4goOf6
	VLMYeVNlx/xsVsQTya7UMOgN8U7yPZ13sQh8oyV+CzIThamJ2BSErys5KdaqJ5aK
	Z6wLTHi0EDHZhcvFRVjlKGLtSQjeAkuLiDNUpGh5C9l00gV62N43kkIAZ1LfEjmf
	B1xjczzbpL8i7prAlCCeW0o1e+X40do+K4XyW4DrEjJGhG/mTUtfvXbjWdq3i6uR
	+UPBng6rPnYVVYBl25z0g==
X-ME-Sender: <xms:AhFlY2upIJH4koeKBnyORuAyopysOCx1QQdNGaFQSMdQklGEL9G-jw>
    <xme:AhFlY7dguGM17fNL2Qe0GfYw38EHIAKgQp6Rm45ssTq-S5uvXXxZQXJOKv0259d-h
    9vzACvOadcd9CNsYLw>
X-ME-Received: <xmr:AhFlYxzwee7TPE_98QdN1jV-I24svtraitIzkZPJZ92NZSG18zv4Rapo-C8BPA8cKr9wZ2XIQbe4Lt_FNzvL37V31J2m6mV-y0rVF5onMbkpNw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdegkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
    ledtveenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:AhFlYxPQV_4qB6R4mzBNbeL7NAYAufQMtB-TbqThpR4udegkpdtFng>
    <xmx:AhFlY29uHLh6-Z-tuSmGv6CKZ_FISqEF0Jo7m9aFW0ToawVxdzWfWg>
    <xmx:AhFlY5VbjYAJM1uy8LyXbQBHDCvC7AgbUHikgCRZGpozfiB1_em7Ew>
    <xmx:AhFlY8cYP60TDPBp7WfFEjkPffC2RAHTjqLvJIr6zruG64eFPNAOfA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:17:53 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:20 +0100
Subject: [PATCH v2 03/65] clk: nodrv: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-3-f6736dec138e@cerno.tech>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
To: Stephen Boyd <sboyd@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Daniel Vetter <daniel@ffwll.ch>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Andreas Färber <afaerber@suse.de>,
 Jonathan Hunter <jonathanh@nvidia.com>, Abel Vesa <abelvesa@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Orson Zhai <orsonzhai@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Samuel Holland <samuel@sholland.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Vinod Koul <vkoul@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Sekhar Nori <nsekhar@ti.com>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Takashi Iwai <tiwai@suse.com>,
 David Airlie <airlied@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 David Lechner <david@lechnology.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-stm32@st-md-mailman.stormreply.com, alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-mips@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
 linux-renesas-soc@vger.kernel.org, linux-actions@lists.infradead.org, linux-clk@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, patches@opensource.cirrus.com,
 linux-tegra@vger.kernel.org, linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=1157; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=cTvG3Ny7vbFY5Q42sItsaJ9Su6ls/B3daI8QtRhhdSg=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAp8+C5Y88qpojMj6IcW27fC9ExOEC2IMTjbY8smt4mCY
 VtvVUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIns+sLIsOpSyRUbDrOeLQs+e1bEvz
 CNs3t1tfW627PaiTti9lwrsWf4Z9VzwsL9v+szkaxnq5uC5LtaWAyKmXWOvb6a9Ex7+88TXAA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_061755_290803_A340A9D3 
X-CRM114-Status: GOOD (  11.17  )
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

The nodrv clock implements a mux with a set_parent hook, but doesn't
provide a determine_rate implementation.

Even though it's a mock clock and the missing function is harmless,
we'll start to require a determine_rate implementation when set_parent
is set, so let's fill it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index d4a74759fe29..495d7497cc43 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4257,11 +4257,18 @@ static int clk_nodrv_set_parent(struct clk_hw *hw, u8 index)
 	return -ENXIO;
 }
 
+static int clk_nodrv_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
+{
+	return -ENXIO;
+}
+
 static const struct clk_ops clk_nodrv_ops = {
 	.enable		= clk_nodrv_prepare_enable,
 	.disable	= clk_nodrv_disable_unprepare,
 	.prepare	= clk_nodrv_prepare_enable,
 	.unprepare	= clk_nodrv_disable_unprepare,
+	.determine_rate	= clk_nodrv_determine_rate,
 	.set_rate	= clk_nodrv_set_rate,
 	.set_parent	= clk_nodrv_set_parent,
 };

-- 
b4 0.11.0-dev-99e3a

