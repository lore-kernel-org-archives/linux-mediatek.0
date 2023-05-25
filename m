Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33934C77B7A
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 11:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tAoNejfZE+dwsccVf0dDFSIToLrNLGStTLZOenYXY40=; b=g6tUnG6Ma5jH7LEy4LC+jvGGAq
	hXDTDz7S/ZL3xlXtn1wyMxhJIFGoy1TQGBVV5e4abwkR22e/dPOBp1wDhRr+XH3um0p1pRG1R2LaW
	AducZfrDAkQvD377xBmxB2+tFEas1sUYVcp+clp/guVcAgNs3bUPwgJEzbSjBcv5C0rf9uYRbc2eu
	d2Vu2H1cRiiH4jHkAlf3PHV6xaZDZsfKnlFCRMwfU3yPBbAD5IbknWB6+wvydUaOfn4lgaq3606wK
	UxL8wNmNSH89PERbEzIpJFzp5Nfj42ffIRUmk+TyvBSrs9rMCL1h6/mStVcgDjVGmL9QjPeU4y27r
	qUfw6nUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q29Wo-00GYRt-1b;
	Thu, 25 May 2023 11:53:10 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q29Wk-00GYPc-0s;
	Thu, 25 May 2023 11:53:07 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1BDFB6605840;
	Thu, 25 May 2023 12:53:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685015583;
	bh=vq6ZQxb4poCfUCjWGmL6dXu84EQJb4PKabd/UNw0s4g=;
	h=From:To:Cc:Subject:Date:From;
	b=IzIYSl921YO0AOJdl8z6BMZLsgvTWMJrKKVbJfiHaPSiTEYM2zb04jVfCsrUWDx/K
	 3xs2TyOgF1WKRQtktDGxjmKwSUqkuzEHLYX8d0I0WQmnxjOznHhd2e0S/qHPMcTZIJ
	 b15yh5DW9/LHhH0hJQb3UP+x1Qeh7bO5rvtmHqBN7PXR3MbhOAnGy3pjbIqtBMbtRN
	 iIFu0RnzneEshocDt1mcnIT3aL1QG65+nD7xBcfiRHuXU5nVzA5Q8/ItPAg6ZW78AN
	 mOlkRuTjO8R3eQb8LbwP2asde/LTHy7bhcHi60xOFb41mDsRqvQMbXB5iFTGM79ku0
	 7FSzcgC1/I0vg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	chunfeng.yun@mediatek.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 0/3] MediaTek MIPI-DSI PHY: Cleanups
Date: Thu, 25 May 2023 13:52:55 +0200
Message-Id: <20230525115258.90091-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_045306_525989_4037DC61 
X-CRM114-Status: UNSURE (   7.27  )
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

This series performs some cleanups to the MediaTek mipi-dsi PHY, used in
various MediaTek SoCs; in particular, it's migrating this driver to
register its clock as clk_hw provider instead and makes use of the devm
function for the same, allowing to remove a pointer to struct clk and
the whole .remove_new() callback, as it's not needed anymore.
This also cleans up the of_device_id table.

Tested on MT8173, MT8192 Chromebooks, MT6795 Xperia M5 smartphone.

AngeloGioacchino Del Regno (3):
  phy: mediatek: mipi-dsi: Convert to register clk_hw
  phy: mediatek: mipi-dsi: Use devm variant for of_clk_add_hw_provider()
  phy: mediatek: mipi-dsi: Compress of_device_id match entries

 drivers/phy/mediatek/phy-mtk-mipi-dsi.c | 30 +++++++++----------------
 drivers/phy/mediatek/phy-mtk-mipi-dsi.h |  1 -
 2 files changed, 10 insertions(+), 21 deletions(-)

-- 
2.40.1


