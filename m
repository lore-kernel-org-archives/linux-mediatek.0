Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7BBC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Dec 2022 12:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9nWsiJvhIu+QaRysl15X7iMp/+TcCLiLeqJZNh5uFWw=; b=bNGzYkodBciF3ptwjYbtfg8vdH
	TbugHG6RHxkhmIcyUU9k7JDxsCEpAbewdLtE9meoWhrXG3HBUAI0i/DjBhAPd9fV0loYIieLkPniD
	ZE7YkKSIPfQ5SrcD/nCSkeRYjSCa7CxS41P6XW2I01x1qofcG6rEUb6Ax2lfpiNKVsPudf/dzwqW0
	wQtwNNiOlAk+oF4ffdyDJZXdYe6jW7b/ZQnUSTUaeOTTYwpnaPJOP1S07vD4UcPgmXvxx93HwOpqU
	LA0Kjf7sSVX1t79p5rvExE1NSPnVjxSOcMHfXXPHEnL8WcueOnnG+rlonLACq6L2St7xYVJhhb/aV
	fHdmL2vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8Kuk-00BzQP-4H; Thu, 22 Dec 2022 12:43:10 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8K4o-00BXKq-0S; Thu, 22 Dec 2022 11:49:36 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 477F26602CE1;
	Thu, 22 Dec 2022 11:49:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671709768;
	bh=rF3hBLkOZsynEmNhOfEqoI9STJG9ZGoO3ta3ZVKp34k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TATSnZz70zQP9qm/YH5U9NVFhIomKt/gFFrwEoxIduf/pGcM+EWgiPgwsS+zbAaCa
	 CXPLC4uhkaKQ3CDYg09FpaqjlvPFxPnK5gxKd083ZK6WDh0rW8C2sljQkQ/lkAZSkR
	 WVfosgwvqbVYXy/WOfKYolB62x0EOfWOq1vjH7r9YWlx87Ox3HVnhIVkt5Sb1RpMcb
	 Lu5noGZy2pt1weysQwuKx/avbtIsJYBXkJtw3eVuiQgWtgDrMkIOKyK0ICTt6sxjxZ
	 tGYfRR9NCA3nKmRNHIdvnp+yMjPEJAdjKa1Frkr0tYI7xe7+BPbZSdZm0T27aeJJTD
	 H15oRv5mNCWtA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	johnson.wang@mediatek.com,
	miles.chen@mediatek.com,
	fparent@baylibre.com,
	chun-jie.chen@mediatek.com,
	sam.shih@mediatek.com,
	y.oudjana@protonmail.com,
	nfraprado@collabora.com,
	rex-bc.chen@mediatek.com,
	ryder.lee@kernel.org,
	daniel@makrotopia.org,
	jose.exposito89@gmail.com,
	yangyingliang@huawei.com,
	pablo.sun@mediatek.com,
	msp@baylibre.com,
	weiyi.lu@mediatek.com,
	ikjn@chromium.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v1 08/25] dt-bindings: clock: mt8173: Add dummy clock ID
Date: Thu, 22 Dec 2022 12:48:40 +0100
Message-Id: <20221222114857.120060-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221222114857.120060-1-angelogioacchino.delregno@collabora.com>
References: <20221222114857.120060-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_034930_557864_B951F466 
X-CRM114-Status: UNSURE (   8.83  )
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

Some old MediaTek clock drivers are starting the clock count (so, the
clock ID) from one instead of zero and this is logically incorrect,
as we should start from 0.
During a cleanup an issue emerged due to that and the cleanest and
shortest way to keep devicetree backwards compatibility while still
performing the well deserved cleanup is to add a dummy clock where
needed, with ID 0.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 include/dt-bindings/clock/mt8173-clk.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/clock/mt8173-clk.h b/include/dt-bindings/clock/mt8173-clk.h
index 3d00c98b9654..86c298e8eb89 100644
--- a/include/dt-bindings/clock/mt8173-clk.h
+++ b/include/dt-bindings/clock/mt8173-clk.h
@@ -7,6 +7,9 @@
 #ifndef _DT_BINDINGS_CLK_MT8173_H
 #define _DT_BINDINGS_CLK_MT8173_H
 
+/* Dummy clock for backwards compatibility */
+#define CLK_DUMMY			0
+
 /* TOPCKGEN */
 
 #define CLK_TOP_CLKPH_MCK_O		1
-- 
2.39.0


