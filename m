Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29828C44503
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2026 12:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dDAVArXAp+Rr3Nn4k3/lgtNVBHaZwzxNlLI9NvQKMts=; b=ByNKMkYBA5fJkwIb/KKlplxUeJ
	q29+imHG85mwHQj8aLDncoC5zpxDyJ3Qt3JY73+HSnZj5jFOx5rfOkpjZffHfP46hDTJ30hYVFQBc
	O5/Z6AR4y7rtNHRz65y8WFlFsnjsdyAja6DoCnFpMJL4RxGN3sNkJ7WEZ053wzAaSwRMjBnaAYuaY
	j3hZQX3a7J3MOjhD0cscUEjmew6O+kqof8lN1HZCKYA0TuvnnM/q4GXo5a8HDO8LbUOun/iSLKb8u
	chG4VlOwBOTvczqJD2f/uX4L7y/n0ZD8KdvlkObWTgV9WsuIbE8ykHyGad0qMVDfwrx7bPxGkm9DM
	h9OfEuJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetur-00000001pdM-1HzB;
	Wed, 01 Jul 2026 12:19:45 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetun-00000001pNa-2oPv;
	Wed, 01 Jul 2026 12:19:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908379;
	bh=6U8qyAtoRk6zfebFsCreBngXodNPxMwN+SziVE1Uwbs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dIFIZq4lbugLOkcJxlmXQ3IhxmmKoF0dhswwwCRmWrj+PxQN4ZtPH/WSHwcjsnz0s
	 N1kJ3QNKJAPB4hgxALKKBd/bk4bbXpk94EYSq7+AjO7uIflKUnomf/pQ16Rygpq61N
	 ALT9JdVs0Oy6R4WB1v1BaMnzCwXCTRKhLNIM4O5UstRojg5sfcnSFdtoa5+nSPaQlw
	 Hmn6hmgYln5R0vKwjuLDxJaAHWsL6LJDFTxuiwL8vXEmbii3yWb6+EqxWKzzpzpVB0
	 Ou0rNGB41Fx0wWSqatWiBA0Klp7dympLbSOY89vQ+h3MG6YwJVSEs63muhE8+bhGbT
	 56oeEqU9rQp0A==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 22D1D17E0CA2;
	Wed,  1 Jul 2026 14:19:39 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: p.zabel@pengutronix.de,
	chunkuang.hu@kernel.org,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	granquet@baylibre.com,
	justin.yeh@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 1/2] phy: mediatek: phy-mtk-hdmi-mt8195: Fix PLL calc divisor overflow
Date: Wed,  1 Jul 2026 14:19:35 +0200
Message-ID: <20260701121936.19407-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701121936.19407-1-angelogioacchino.delregno@collabora.com>
References: <20260701121936.19407-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_051941_857671_CDB03FA7 
X-CRM114-Status: GOOD (  10.37  )
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

When trying to calculate a PLL rate for target display resolutions
above 2560x1440, 24bpp, 30Hz, the pixel clock value will be more
than 32-bits long but the division to finally calculate the digital
clock divider is being done with div_u64(), which expects a 32bit
unsigned divisor.

Fix the overflow by using div64_u64() instead.

Fixes: 9d9ff3d2a4a5 ("phy: mediatek: hdmi: mt8195: fix wrong pll calculus")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
index 1426a2db984d..e6ee8e080022 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
@@ -290,7 +290,7 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
 	posdiv2 = 1;
 
 	/* Digital clk divider, max /32 */
-	digital_div = div_u64(ns_hdmipll_ck, posdiv1 * posdiv2 * pixel_clk);
+	digital_div = div64_u64(ns_hdmipll_ck, posdiv1 * posdiv2 * pixel_clk);
 	if (!(digital_div <= 32 && digital_div >= 1))
 		return -EINVAL;
 
-- 
2.54.0


