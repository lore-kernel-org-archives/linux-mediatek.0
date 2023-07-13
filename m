Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E2CC001DE
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 07:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a9GgaFtTZGGyfOYvLebkUSqLntMcPOI7zotQS2ieCKk=; b=yyYAF04M8z36g1UXw8enbN6dcY
	y45MAX0z6lVOTwnbPPQbIxKOf4NPgEEtdXqFPLtQP2YjxKklM+Xz9nvqs0wS9rpSGWy0xPvHz3+5+
	X+N4mz1cAEGb4brbFByKfGgc87AIyCYO9eKnfbpk+SKobwl19zTUUN6Pm1nTlL5x/rzPqF4ZjHYy1
	J7RMHfOtm//29wQ34GnPmIIupsjpk2hBQQfapICV/WFDw/h/TYYyki3lSoFQrvuu63SPAwRPpcWr1
	rzCuM3QsLsy86Pg9gw88ExPQWuWWWzIgdVvidEUwHuJzA2cyFzbuF+neiIIIbIS6GJEHacyU0UsGP
	bnKKkVNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJqeE-002DNe-2D;
	Thu, 13 Jul 2023 07:21:58 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJqe8-002DLi-0a;
	Thu, 13 Jul 2023 07:21:56 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AA7636606FD8;
	Thu, 13 Jul 2023 08:21:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689232908;
	bh=zMZb8z3Quqx4Yg1JIfaRJ/qy2+8osqR3i/M/mk5GdyQ=;
	h=From:To:Cc:Subject:Date:From;
	b=on9reJewTonDQado0D0YcBUcsSR3WJYomX+k56gZ2dmscc1b1F0jXrD49uWoYejz5
	 qjLVIXIEljjhEiXQMNWPPVS170fSWxpeFnYXV2Tzk+ozUn/XXtYmrVHynGE/S1OIf4
	 b7KDL0Ys8hxABgXAwlL/Kn8poqfYFhQwdrCVxT7E0qRAGZPNBuzH88z/SCU9xjzCDL
	 E13/LYbfgykH+54YVu7BfQKWQufxEr1US/Fi3BzUY0AnMHgYXORTym3Oykk/6kOh/r
	 3K8YBFlaguevlGtINYDmEZS+ic90HwtXhk2INdtUMtS/keB2tNAbD6rqWKlXKToftm
	 43O9OcwSknJvQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: mturquette@baylibre.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	msp@baylibre.com,
	amergnat@baylibre.com,
	yangyingliang@huawei.com,
	u.kleine-koenig@pengutronix.de,
	miles.chen@mediatek.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 0/2] MediaTek clocks: Support mux indices list and 8195 DP
Date: Thu, 13 Jul 2023 09:21:36 +0200
Message-Id: <20230713072138.84117-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_002152_434056_0B327121 
X-CRM114-Status: UNSURE (   6.62  )
X-CRM114-Notice: Please train this message.
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

This series adds support to specify custom parent indices for MediaTek
MUX clocks, necessary to avoid setting the same parent PLL for MT8195's
top_dp and top_edp clocks, solving DP+eDP concurrent output issues.

No fixes tags are provided as the clk-mux commit introduces new logic
and the actual MT8195 fix depends on that.

This commit was tested on the Acer Tomato Chromebook (MT8195) with
dual concurrent display outputs (internal eDP panel and TypeC->DP->HDMI
adapter connected to Samsung UE40JU6400 4k TV); resolution switch on
DP was also tested; eDP output is not paused and internal display keeps
working as expected.

AngeloGioacchino Del Regno (2):
  clk: mediatek: clk-mux: Support custom parent indices for muxes
  clk: mediatek: mt8195-topckgen: Refactor parents for top_dp/edp muxes

 drivers/clk/mediatek/clk-mt8195-topckgen.c | 22 +++++++----
 drivers/clk/mediatek/clk-mux.c             | 14 +++++++
 drivers/clk/mediatek/clk-mux.h             | 43 ++++++++++++++++++++--
 3 files changed, 67 insertions(+), 12 deletions(-)

-- 
2.40.1


