Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAB2ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 07:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KErCqDwK6lDXZ8y18rAO/bAQui6ImnuDw44pctbgrKc=; b=nywRhxxU5YvTOYBKb4SMKhV79f
	P6xYo8GGzgDaaaXHzgHrRYrhIKICob67yVqTHtd2HlXQrRIrrSFDQc8KfNp8fqpwYS7Ci24ujhRBc
	OVDcUjKa4M3xzwX35pEZYRV1Dths8oik6RkIG++Jtr9wElpzS6Xo8HaqEViVXJKMd4k+9aHL54cnw
	JWVMVgKrHlj4h0AEWU5URQLwutyHLoypF9ur8/qHUhboEYNuap1nKkR4eQnWV3YRQmshbO+7xz6ZU
	MxSKNuzhqt3WVmZ6iiIDqg85Aq+6cKgvbv7Zp0mjswztY+f5gbzi82D85JrbvOBjama7X4AORrNIx
	R/iq4aLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYjJ9-002meD-VH; Thu, 15 Sep 2022 07:29:12 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYjFJ-002j8B-7k; Thu, 15 Sep 2022 07:25:15 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B1B076601FF1;
	Thu, 15 Sep 2022 08:25:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663226711;
	bh=U0W/o4wRU8Wehp4YXbC2Ill8pHldHdAIiV0c7iykL4s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WncQq0NUEBwVuR0en5cOVJreTJbFEHZ08D6FApbOmyxKEyVx2rHcdCOg7l2Ip4pRP
	 OUPSF25gh2mfwh3KRo+Pi2YZMee++b3Y4La3dT9xdSYMgisFqJPJR0eyaYvs3kiO4C
	 bwHV9OlpkjbvzPNgiRb+Im7uOGRGft8z0mXnNFgCX7LM24as4MUVLUlBMdCmyHWRsB
	 LwmtpsH4gQgiKompQP8nRfhay3i83vo9WtIditYsWRXxMKiGF+FPUqNZMqe5xpyM3W
	 LaMtu/g87OfQWfE2TlluRQGsIlA/23buM954kwSI1/E30/uS1mAynVn3A2iW0ZMZ3b
	 UGzx+r718T+CA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	miles.chen@mediatek.com,
	rex-bc.chen@mediatek.com,
	nfraprado@collabora.com,
	chun-jie.chen@mediatek.com,
	jose.exposito89@gmail.com,
	drinkcat@chromium.org,
	weiyi.lu@mediatek.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v2 05/10] clk: mediatek: clk-mt8195-mfg: Reparent mfg_bg3d and propagate rate changes
Date: Thu, 15 Sep 2022 09:24:53 +0200
Message-Id: <20220915072458.18232-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220915072458.18232-1-angelogioacchino.delregno@collabora.com>
References: <20220915072458.18232-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_002513_452794_CF816A22 
X-CRM114-Status: GOOD (  11.52  )
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

The MFG_BG3D is a gate to enable/disable clock output to the GPU,
but the actual output is decided by multiple muxes; in particular:
mfg_ck_fast_ref muxes between "slow" (top_mfg_core_tmp) and
"fast" (MFGPLL) clock, while top_mfg_core_tmp muxes between the
26MHz clock and various system PLLs.

This also implies that "top_mfg_core_tmp" is a parent of the
"mfg_ck_fast_ref" mux (and not vice-versa), so reparent the
MFG_BG3D gate to the latter and add the CLK_SET_RATE_PARENT
flag to it: this way we ensure propagating rate changes that
are requested on MFG_BG3D along its entire clock tree.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt8195-mfg.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8195-mfg.c b/drivers/clk/mediatek/clk-mt8195-mfg.c
index 9411c556a5a9..c94cb71bd9b9 100644
--- a/drivers/clk/mediatek/clk-mt8195-mfg.c
+++ b/drivers/clk/mediatek/clk-mt8195-mfg.c
@@ -17,10 +17,12 @@ static const struct mtk_gate_regs mfg_cg_regs = {
 };
 
 #define GATE_MFG(_id, _name, _parent, _shift)			\
-	GATE_MTK(_id, _name, _parent, &mfg_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+	GATE_MTK_FLAGS(_id, _name, _parent, &mfg_cg_regs,	\
+		       _shift, &mtk_clk_gate_ops_setclr,	\
+		       CLK_SET_RATE_PARENT)
 
 static const struct mtk_gate mfg_clks[] = {
-	GATE_MFG(CLK_MFG_BG3D, "mfg_bg3d", "top_mfg_core_tmp", 0),
+	GATE_MFG(CLK_MFG_BG3D, "mfg_bg3d", "mfg_ck_fast_ref", 0),
 };
 
 static const struct mtk_clk_desc mfg_desc = {
-- 
2.37.2


