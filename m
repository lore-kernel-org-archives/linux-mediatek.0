Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D83CDB482
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Oct 2023 10:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SXErBJezvQ4EGU8lIz67VQ7q12wA911xVMUXzFYU9Dc=; b=GTtUQ4Q7NJIkocCdj4KDa6GsnO
	fJOha5pqWBzcbVAq1ar5dCUlU0Y19D1oxnRuYtOy4g2+LJ23V4i9E+dgPrHglDoamL+GQ4Vs0SV8D
	Ec5oph6C4Dw3CP7MFDJz/yV5nvImJ+A4JbOElrWEaK9za+dkU/GP+iyiCgLBQSpSsLRU+9FRSd1O7
	Ez5QQRSC213VT/Lk/NQtJJUWxIngLzuic6Qtwkn4Gmw5J7cjkkOD1K+nGV4hgvat07cEBOHA1/gwS
	5EWnumbXIGZ1rYORWJSmJFRWqfBR0lDzANcq2D6t03DOsydBRaBxjniOFYq6uLrINO79cCjCsNnvu
	aHrvgZ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt3uB-00ESFq-2C;
	Wed, 18 Oct 2023 10:35:59 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt3u7-00ESE8-0y;
	Wed, 18 Oct 2023 10:35:56 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EABEF66072F7;
	Wed, 18 Oct 2023 11:35:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697625353;
	bh=rgrq6lFblmtQKHs08zZJsf2wZX+fKwB97omH3vm95yg=;
	h=From:To:Cc:Subject:Date:From;
	b=oKMwVkZ5wT5CfuEMV6sfTfD0+oi3EnHYshpFpCaToMLS3rca1dLqMpXMCrQJz9wYD
	 MSZ3HWEVfw38wjWdlAUJX83CLG3nu58zC7ph5JIlW0k9kS0mYd5CnCpBE8tNBiFAaS
	 oXoJvLK7d9oJciv22j4ch9+T1ubcQnN6tZirvNRRMYf1iXEQExRdQHgpjLv/sH+csz
	 8iFMeF5lEh6K2Mc/V2gA6bmc6LtHWlzUc1ev38keShuwJNFTADaJI9ye6GsA41XMUC
	 0GGPLuNmXw66dlGMbgMqY5qYMxP3uLRtxzm+DmKs6lPGzlWBY6a/enf0fh17li1aXQ
	 b6MXtFLQiqxUA==
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
Subject: [PATCH v2 0/2] MediaTek clocks: Support mux indices list and 8195 DP
Date: Wed, 18 Oct 2023 12:35:44 +0200
Message-ID: <20231018103546.48174-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_033555_496355_7B93A672 
X-CRM114-Status: UNSURE (   9.43  )
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

AngeloGioacchino Del Regno (2):
  clk: mediatek: clk-mux: Support custom parent indices for muxes
  clk: mediatek: mt8195-topckgen: Refactor parents for top_dp/edp muxes

 drivers/clk/mediatek/clk-mt8195-topckgen.c | 22 +++++++----
 drivers/clk/mediatek/clk-mux.c             | 14 +++++++
 drivers/clk/mediatek/clk-mux.h             | 43 ++++++++++++++++++++--
 3 files changed, 67 insertions(+), 12 deletions(-)

-- 
2.42.0


