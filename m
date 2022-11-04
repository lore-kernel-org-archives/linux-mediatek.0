Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2475C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Nov 2022 13:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IZ9UQ4DbVzbIJsLd1t+7sQBLMSQknh79wDggweQ8Tfw=; b=qSiZ154oLdU3aIzFA0aC6ERacI
	n+LpVLAz2iMIewKT8sFcoPQequ3tgoDClMXwYVrTgH/HL3IYkrg2pjj2ZWvIh+Muhxv2fqEuMWaUl
	dR4uLX6P2lScm9FDBh1VWfnBHgC3NYHo77C3KbI9qxiPPgmF6HlIuiQODVd8Dj5RKTj+wCjWS7MZK
	uYd3hDVIYUc0B9cKS3eRkiUpjlGHpDaoyvw5strw4Uidzm7KR05iVcOQh4ZYAHJJ7ehJRBxDzK0jR
	z1cuJL0qWr/QaJCSlm1ue4brmMJVca8FiINhRg1AddeNhVKdAg6Q9IVp90aFrINUK9U5snUh9/mDe
	/dqumK+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqwbb-003dWk-9O; Fri, 04 Nov 2022 13:19:31 +0000
Received: from new1-smtp.messagingengine.com ([66.111.4.221])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqwaO-003ceQ-Sq; Fri, 04 Nov 2022 13:18:20 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailnew.nyi.internal (Postfix) with ESMTP id 2559C5804B7;
	Fri,  4 Nov 2022 09:18:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 04 Nov 2022 09:18:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1667567896; x=
	1667575096; bh=IZ9UQ4DbVzbIJsLd1t+7sQBLMSQknh79wDggweQ8Tfw=; b=H
	E9+GFigRxmJ0btH19cuEF1I+Q7oSyo2VB5yjUzcKpwPw6+hgNZssum7qye/gfJXD
	oI1LVsmfkuX1QxODfaM6D/fBolvl2JJZE3GG2YY4120499IyiZhQ/zZHEeyzql+G
	EHFEX0WSOgf83/dH4VWUEcPcdoEQWJPYaN1ZO/u7cKqHYraZnfidoD6VyixptwRl
	oRECi31IwUGxrMoGE6yxPw+n9SsBdtMG0eSB6/KYQQz1dO6cnsRK0BpmdDMit3f/
	puOZmH4v7PuvPJRmPPVQhSNbiguZ4IEUuG6c0tZv339equzgA3yLprb/2vQVNQH6
	uYstgbrwCZzIZNR6dJnzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567896; x=
	1667575096; bh=IZ9UQ4DbVzbIJsLd1t+7sQBLMSQknh79wDggweQ8Tfw=; b=h
	8f/i8gyuyu426UDXEklkTY33MOqF0cm6Q2e3NUACnLO/Gvy1hKqFyetHdmpF+mJR
	kwlIqEBI9vvMrZZ07BA8CYO4l/+jWb281w0FmNHoulubbktqTtoiWBHc+aG9yO2R
	vzfvfU24V7E/IRWWy7cbkyNJJr48uX6w+wzFByTpGUzrF+JydvMncB9v5Tzg7jiL
	PaOym40VVFsCRmcxXt6C2VrNRll49V+3Ju1+pnOsDYt+3Zbk43td+kekTjG3OypV
	DEUAVaU/Tqww/rI6GuIKA64x9g7nI9guZGNtuV0aGi48kMUJpTJu0AiovAeZ0Qgy
	xy6lSlyu7kGVVeiDfp9wA==
X-ME-Sender: <xms:FxFlY6xzxWw1KTM1-JK-YpMrD-GmKMhd11ZzDrdioMVhi0q2564GZA>
    <xme:FxFlY2TkhMhX9MXoKdxN_Y59CtRwRXl7yUc0ZUwIDVbE_O580Swtaux1zNSXZ5TiI
    30cpHnsAyDel3GoeJ0>
X-ME-Received: <xmr:FxFlY8VuVwGxLoBe-zCD0POUao6810PwWDcRFumCdEGvclWoOMGKJg5zQ_V673XmDfOmP2bxE4SWWjGljbPT5r_k4N_1Pp7np6Q20iLe5h1i0Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdegkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
    ledtveenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:FxFlYwiUPlgMVVdq7ScRhFtUXpvqvRacN7JF9UXvhsxiMiBPAVXjAw>
    <xmx:FxFlY8D7R2-9733wxJXNm15zZ--qURF7uj0GxFist4o5yokiqhfPuw>
    <xmx:FxFlYxJNuyPF80-pHicN0eIf1famH6qmcHnMJjCZpIgdrSU7rdNQ1A>
    <xmx:GBFlYwxUFtOgWE5dNUKGZwxb4kgYvHzzSjla-7XedLudEJRE79vKFA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:18:15 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:30 +0100
Subject: [PATCH v2 13/65] clk: lmk04832: clkout: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-13-f6736dec138e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2171; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Qcdipb0o2ae/N8jSEKXNaEcjkI/bera5lXalhrYMenQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAp91ojkiNA5wfu7ViHnF/fB8QWK6wK6jDjnn/55cf5Nt
 Rc/XjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEwkSJjhn2GvrJd9wuOtbOyub4KEai
 3/bmF26akq352iUJadl1BixMhwfa7Pj9S2Fya3301mOn58f8HWXxOWGCh3Ln5xR8xn0RI3TgA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_061817_148023_630E6DB8 
X-CRM114-Status: GOOD (  17.12  )
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

The LKM04832 "CLKOUT" clock implements a mux with a set_parent hook, but
doesn't provide a determine_rate implementation.

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

Since the CLK_SET_RATE_NO_REPARENT flag was already set though, it seems
unlikely.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk-lmk04832.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-lmk04832.c b/drivers/clk/clk-lmk04832.c
index f416f8bc2898..f68bb0affdad 100644
--- a/drivers/clk/clk-lmk04832.c
+++ b/drivers/clk/clk-lmk04832.c
@@ -1281,6 +1281,7 @@ static const struct clk_ops lmk04832_clkout_ops = {
 	.is_enabled = lmk04832_clkout_is_enabled,
 	.prepare = lmk04832_clkout_prepare,
 	.unprepare = lmk04832_clkout_unprepare,
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent = lmk04832_clkout_set_parent,
 	.get_parent = lmk04832_clkout_get_parent,
 };

-- 
b4 0.11.0-dev-99e3a

