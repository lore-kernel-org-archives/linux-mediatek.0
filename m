Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528F9C77B71
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Apr 2023 12:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=37ZnYlOisKX4N3pVgU3H1NeKDJY0H7/Pi7+GWqdOf34=; b=wTakulAY/O7ue097/W3emR7iZI
	qM1yru9NhnupKuWwcuYjGx414AjWt/PTVs+Civ1hsdj490Pooa3Tl/7NmUqxJrh1dPem/lvGdpeD0
	QVMW1Wwlzjvp0FYSVBCPylpdOZiU7r2T1QS1gpd4j+sctPY7W/HH0h3sJV9bGaqc8GISPd3/diRMs
	ORoMO01BfpLWAn6TkuhNwS45RXRtTylCxzm3b2GOY9ly80duLfUX1E2l8mY82YX8zlR0lB9qkYMVJ
	CrDONnbebGZsy+tG13WBlqAdBubIdQg9DUcFXYO2h7WzlGnVdWGAmRROhpgKQSKuzm0VlEnN633TB
	7emGddgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjfrs-001HlT-1e;
	Tue, 04 Apr 2023 12:34:32 +0000
Received: from new3-smtp.messagingengine.com ([66.111.4.229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjfro-001Hh6-0G;
	Tue, 04 Apr 2023 12:34:29 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id 65B9B58219E;
	Tue,  4 Apr 2023 08:34:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 04 Apr 2023 08:34:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1680611667; x=1680618867; bh=37ZnYlOisKX4N3pVgU3H1NeKDJY0H7/Pi7+
	GWqdOf34=; b=TJu6GaZwKsCve0YEbCsr4Arx+aXqtcRZK+YyYfT0lU+pHbvI1AN
	+/dXspmhATtroDSrs/SRy83vPekH0DfemY9aA2HtUDpOum5JggXMM9X17WOBB9tH
	hnlK4rpoUWyYia4I+Xd4d00H7S1Zk0eycs9/MbOwvndzvifllphIB44nmwr1bRke
	6M9cijkWa/rPRPCxwjdbnsMfmZqge1Y+yN96hV1em3iRKuTQuyQbuHDhOv6OZ2GJ
	LVXBsYtLKq81bsUv6RyMp/2pHim3RXcCNf8/nrtbQeMSz34IOJJQhIC/u0tkZ1i7
	kNcZ7bxGIauhi0GV5JiUbGzs5ItJuRs61RA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680611667; x=1680618867; bh=37ZnYlOisKX4N3pVgU3H1NeKDJY0H7/Pi7+
	GWqdOf34=; b=qtOKfHNEfLupwHyvb8KalGVdi/udsh6kjhZSP2S1V6EcYSSfBlL
	7KFCSphhirLCdKDvDcgAqT9COg6MUZzbPse60vsSOcMFhM0IxLxPw33pwXlrC7pa
	47+fMUh+YVuirhh2TqtV8E2sfy+SD43PFxnXR48SZQFdegtJDFwjKJk1nxSPKXua
	0dZH9hoAeLQnlY+YfheQAuO7AcmtIiSWNA9Ogvdb/bSbOqy65PgZXldagsuLa7p6
	Uwoscc2MJlFIuizR8wvov5VCjhwKAXl94oJXEXSuKGZ3i3roE+YFnbefa2OGJR2L
	f4nZOFjiLO2XU5rHcCLTHBHTppeCbKeWKFA==
X-ME-Sender: <xms:UxksZP8yOBI7LjiJ2QZVoStqqIbYCj2Zwu0Q8UkfcMkkHXA4EW8uRw>
    <xme:UxksZLvsyKxSv5ilRLpUmJkyT2IDRmdrE2li41j0U5ro9zt_GHs-KO7NSO73qoGh1
    xsTBRvH6j5kd4Rqml8>
X-ME-Received: <xmr:UxksZNAlAXRQfM5VqANExZTCZZlJgX7uRwWoaJmdj1OWOc90qUgPWP2XexednMcQTNio3b0x_xrERUHiP_zf2bSv6nJ4wx8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:UxksZLdlGe0TTunepus5_00BkaCxER8KxFFj01d3rV34h9OehodbNA>
    <xmx:UxksZEN9KnhM5JYzPq9Uuja0NTxmgSA8FKgwFF8bMcYlEsK4JYJHbw>
    <xmx:UxksZNkjTGtt68eOk8pp3JjCmupCok0Yc1UAOCZYrkKezVtjYWuT7g>
    <xmx:UxksZJ6Tvo-K2eg4nHrynuNPxzh3aDXurDhwr4Qkh3TfzV4jLDLf8A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 08:34:25 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:09 +0200
Subject: [PATCH v3 19/65] clk: vc5: clkout: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-19-9a1358472d52@cerno.tech>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
To: Michael Turquette <mturquette@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,
  =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
  Manivannan Sadhasivam <mani@kernel.org>,
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
  Jonathan Hunter <jonathanh@nvidia.com>,
  Ulf Hansson <ulf.hansson@linaro.org>,
  Linus Walleij <linus.walleij@linaro.org>,
 David Airlie <airlied@gmail.com>,  Daniel Vetter <daniel@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>,
  Kishon Vijay Abraham I <kishon@kernel.org>,
  Alessandro Zummo <a.zummo@towertech.it>, Chen-Yu Tsai <wens@csie.org>,
  Jernej Skrabec <jernej.skrabec@gmail.com>,
  Samuel Holland <samuel@sholland.org>,
 Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>,
 Paul Cercueil <paul@crapouillou.net>,  Orson Zhai <orsonzhai@gmail.com>,
  Baolin Wang <baolin.wang@linux.alibaba.com>,
  Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
 patches@opensource.cirrus.com, linux-stm32@st-md-mailman.stormreply.com, 
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-phy@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, alsa-devel@alsa-project.org, 
 linux-mips@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2918; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Y8uVno82wvk5mR9JsqAa6ruYT31FhgK95LjSEVVIHWc=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37cKe2pMandRvx3/5XT7AtHyYuO1NnZqQpXndvXJSIuy
 a8zuKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwEQmLGX4H3fLmsl9o3GssOEsS3Nfz0
 Ocy/+e5Fh2+WpiweS9lhum7GRkePX1/P5jgvvt3ievftOhxLqcjcU9/NRHt8MVVS2/Zy9oZwYA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_053428_190588_FA531588 
X-CRM114-Status: GOOD (  18.81  )
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

The Versaclock5 "clkout" clock implements a mux with a set_parent hook,
but doesn't provide a determine_rate implementation.

This is a bit odd, since set_parent() is there to, as its name implies,
change the parent of a clock. However, the most likely candidate to
trigger that parent change is a call to clk_set_rate(), with
determine_rate() figuring out which parent is the best suited for a
given rate.

The other trigger would be a call to clk_set_parent(), but it's far less
used, and it doesn't look like there's any obvious user for that clock.

So, the set_parent hook is effectively unused, possibly because of an
oversight. However, it could also be an explicit decision by the
original author to avoid any reparenting but through an explicit call to
clk_set_parent().

The latter case would be equivalent to setting the flag
CLK_SET_RATE_NO_REPARENT, together with setting our determine_rate hook
to __clk_mux_determine_rate(). Indeed, if no determine_rate
implementation is provided, clk_round_rate() (through
clk_core_round_rate_nolock()) will call itself on the parent if
CLK_SET_RATE_PARENT is set, and will not change the clock rate
otherwise. __clk_mux_determine_rate() has the exact same behavior when
CLK_SET_RATE_NO_REPARENT is set.

And if it was an oversight, then we are at least explicit about our
behavior now and it can be further refined down the line.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk-versaclock5.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index 4b68d919f75b..71e955429234 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -726,6 +726,7 @@ static int vc5_clk_out_set_parent(struct clk_hw *hw, u8 index)
 static const struct clk_ops vc5_clk_out_ops = {
 	.prepare	= vc5_clk_out_prepare,
 	.unprepare	= vc5_clk_out_unprepare,
+	.determine_rate	= __clk_mux_determine_rate,
 	.set_parent	= vc5_clk_out_set_parent,
 	.get_parent	= vc5_clk_out_get_parent,
 };
@@ -1113,7 +1114,7 @@ static int vc5_probe(struct i2c_client *client)
 	init.name = kasprintf(GFP_KERNEL, "%pOFn.out0_sel_i2cb",
 			      client->dev.of_node);
 	init.ops = &vc5_clk_out_ops;
-	init.flags = CLK_SET_RATE_PARENT;
+	init.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT;
 	init.parent_names = parent_names;
 	parent_names[0] = clk_hw_get_name(&vc5->clk_mux);
 	init.num_parents = 1;
@@ -1139,7 +1140,7 @@ static int vc5_probe(struct i2c_client *client)
 		init.name = kasprintf(GFP_KERNEL, "%pOFn.out%d",
 				      client->dev.of_node, idx + 1);
 		init.ops = &vc5_clk_out_ops;
-		init.flags = CLK_SET_RATE_PARENT;
+		init.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT;
 		init.parent_names = parent_names;
 		init.num_parents = 2;
 		vc5->clk_out[n].num = idx;

-- 
2.39.2


