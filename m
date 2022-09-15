Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0BCECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 07:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pfS6VfbrB2hhKB3MP/E2QySNmwkMTvwsYKUzykDeyHs=; b=SgxGi9naEzT3yEnwBFwIT0Hbg5
	CU5oCmpPkvrr/qjDLSxdGJM5poIF+ol8TNSpvALMk1plOy3xqXfRUG2u6ngqckb4lydAGCdzE0zYd
	3sX0DD6mYMUmhRBLSMgXngpq7ykyv1Ddd57v1l3djS+Bh5jjxLQlT6hWPHiDnaWfPLCszEFHPvAjt
	A9vR1HbDBhlaxXx0J+9f5hzOgl/rewGwYUkszBbfZ8Zf6f6hsK6wDOJDcVG0G4TdZcFkmGdKWPOkT
	9Cj8TCBs5zwOJ9FrX08FoAeQxFFQahuhzX7SzIEM7HLwGC1Wnob0wMuCLL7/fhKQgu15aXCv+DNU0
	MwNz+IHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYjM4-002pCT-Bm; Thu, 15 Sep 2022 07:32:12 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYjFN-002jCE-BX; Thu, 15 Sep 2022 07:25:18 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 291116602028;
	Thu, 15 Sep 2022 08:25:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663226716;
	bh=HrCKKc/4oHF8ameggu4aG6O2V2G7VX/dsz8S56XbbxA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PKXnkr9ANPWLDeqFhge/1hiyFppl+Bbmo8/nkfhfWR9Pta7wSp2UdReVjLkwI/KNn
	 SJ9iga+A0Lw4u3QUH+lANyaE2jzYmScRpjNko4JQhMGBPvT9cfvspsX5/WK0K+pSVt
	 ALjnhBgJosa2lSqDK4F4rSp4yJfw55Cfs+j/hndBxL3sQ5sLT6/kFYNKpImVyq4XYG
	 nPfLPbI2MRcCkVvdzxyf4Dcltvgaxtg6CX7G6XNudue0B97BeZpbHFzJOfiQIWHxaX
	 cuutD+viTxyun4A8q6kVwRLS020NQmVADoLo9x2KOj0qaAm/HlwR2zm+HQpkZdQyyA
	 ifdoo3O8eC5wQ==
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
Subject: [PATCH v2 09/10] clk: mediatek: clk-mt8192-mfg: Propagate rate changes to parent
Date: Thu, 15 Sep 2022 09:24:57 +0200
Message-Id: <20220915072458.18232-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220915072458.18232-1-angelogioacchino.delregno@collabora.com>
References: <20220915072458.18232-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_002517_557883_11FD1D4C 
X-CRM114-Status: GOOD (  10.22  )
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

Following what was done on MT8183 and MT8195, also propagate the rate
changes to MFG_BG3D's parent on MT8192 to allow for proper GPU DVFS.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt8192-mfg.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8192-mfg.c b/drivers/clk/mediatek/clk-mt8192-mfg.c
index 3bbc7469f0e4..8ea5acdf832c 100644
--- a/drivers/clk/mediatek/clk-mt8192-mfg.c
+++ b/drivers/clk/mediatek/clk-mt8192-mfg.c
@@ -18,8 +18,10 @@ static const struct mtk_gate_regs mfg_cg_regs = {
 	.sta_ofs = 0x0,
 };
 
-#define GATE_MFG(_id, _name, _parent, _shift)	\
-	GATE_MTK(_id, _name, _parent, &mfg_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+#define GATE_MFG(_id, _name, _parent, _shift)			\
+	GATE_MTK_FLAGS(_id, _name, _parent, &mfg_cg_regs,	\
+		       _shift, &mtk_clk_gate_ops_setclr,	\
+		       CLK_SET_RATE_PARENT)
 
 static const struct mtk_gate mfg_clks[] = {
 	GATE_MFG(CLK_MFG_BG3D, "mfg_bg3d", "mfg_pll_sel", 0),
-- 
2.37.2


