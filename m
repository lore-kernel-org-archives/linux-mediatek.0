Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43C0C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Nov 2023 10:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DZdIyikMfnrodPEHNt5aGKcjoSWgjnIKhJ0XKLuZw7s=; b=DL4LrEboQR+u3cEa/FkSZK2NM/
	TVoMuovrM1aSWm8rYo8oEu5Nnws1vnJejHP+evP7qigcewXK9EFw+ML8wSM2bP32Kp9q7viApgySK
	f2suFdmAzgZuIjAuEfktc0rZBT55x41BFMnBfoXQ5S5rF2n8gjXXoYBaI1pDp2XWirZZ1B0p+gZT6
	WV+08XfVI/MPhC2uwCOozkW9gzG9u757aLeIQsWZ2bOGMiEjgWJWpdHPlI2kHejRkdDt32ALTrLbl
	d76oqyUkq+rMoQtYWDQqsjVNGOq0cAOQ97QAKdpHmtExOVr6RpPZ9cc9jMcj1SPLIkRdXptz4SS4W
	O8sPgrzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyrNA-00B7CY-0f;
	Fri, 03 Nov 2023 10:25:52 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyrN3-00B7Av-0V;
	Fri, 03 Nov 2023 10:25:49 +0000
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D8F1D66073DD;
	Fri,  3 Nov 2023 10:25:37 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699007138;
	bh=t7bVxWTHowbVZgsQgpfEarvJNLmrYsIn0CaEB3pSMdM=;
	h=From:To:Cc:Subject:Date:From;
	b=CHZN2KFUpjDkfC6IPrjt7KsQRoxk8bJY/VPr5xcU6AEm8ggzikFi6+ADOQ7Jze/mE
	 dzppBNmE3fPZWukPx8/n6GXc7dCrlxoWDXAf7LmwKKaZfob2Tl/HiTwSs2fYYIyp1S
	 PJy2B1+JGLnKZWJE/YeRFNTr4t/5ekX/9fnXWoHjDQ1pN8YT7w96gb8PyaR5fALIsy
	 kzxw0QRq1J7x2CsDOO2IPkPZyZqyHaXuMaZ5gIopvaWoBuC2fXFIChuFJNJGqbsmnF
	 nRROdTTVHAd+bLrtoDO9aAkshAPIwc2xOBJeFgvPDp0gzQAhHDKChu0sbs/7bFcD9G
	 ZZCNc9W/C5X5g==
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
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v3 0/3] MediaTek clocks: Support mux indices list and 8195 DP
Date: Fri,  3 Nov 2023 11:25:30 +0100
Message-ID: <20231103102533.69280-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_032545_396474_7084A3A2 
X-CRM114-Status: UNSURE (   9.49  )
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

Changes in v3:
 - Rebased on next-20231025
 - Added comment in the code explaining why the dp/edp parents lists
   are split in one PLL per interface
 - Added a commit performing the same reparenting on MT8188 as well

Changes in v2:
 - Rebased on next-20231018

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


After feedback on v1 of this series (effectively the same as v2, except
for the rebase), I looked for an alternative solution with using
clk_set_rate_exclusive() as proposed. Couldn't find any, as that still
doesn't give any guarantee about selecting the same PLL that the driver
was manipulating before setting the right divider MUX, hence that still
wouldn't work correctly.

For more context, please look at the conversation at [1].

Cheers!

[1] https://lore.kernel.org/linux-arm-kernel/20230713072138.84117-1-angelogioacchino.delregno@collabora.com

AngeloGioacchino Del Regno (3):
  clk: mediatek: clk-mux: Support custom parent indices for muxes
  clk: mediatek: mt8195-topckgen: Refactor parents for top_dp/edp muxes
  clk: mediatek: mt8188-topckgen: Refactor parents for top_dp/edp muxes

 drivers/clk/mediatek/clk-mt8188-topckgen.c | 27 +++++++-------
 drivers/clk/mediatek/clk-mt8195-topckgen.c | 27 ++++++++++----
 drivers/clk/mediatek/clk-mux.c             | 14 +++++++
 drivers/clk/mediatek/clk-mux.h             | 43 ++++++++++++++++++++--
 4 files changed, 86 insertions(+), 25 deletions(-)

-- 
2.42.0


