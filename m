Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69D1C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jun 2022 08:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PCYG4BfCv0gEsfsJXfhqPWj3FytHJMcF0n0IOUPeRZ0=; b=lBf4uF2uU9O32TA8zShofBVlVA
	wsDJqFy9ogeCgQ6oIxjkcUQsB5DLf+4ZvHBABMNQx2h0/BrPHW43iInlCE/aHo4ezrRDf7IBee6g3
	1b0RJ8U/7CdtCT5UCJg3XNdIpoKa8tJJ3AlA2Tm2IEsrXolOSc/WlkvwgeU+1SqTfZbLbKlg4ykXR
	ygD/C4+Gy5xfPP5dUsT/PR/UM54wdCe/NQuY7puzoJYNxRWOETNdeSuvYqRJuLXTn11WmnalUF4x1
	onIx4dWR2xgbaBJDl8nA3RqmpoeKvFR3ys3pfemxF97/BiBTRoJuFWxd9zF24gPkBLgXzalwmvN2h
	twTWMklA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5kaK-00H4Gl-Pw; Mon, 27 Jun 2022 08:59:08 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5kY2-00H2kY-GQ; Mon, 27 Jun 2022 08:56:49 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A82006601844;
	Mon, 27 Jun 2022 09:56:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656320205;
	bh=M2e0ZrWkdh3RbPDwwXtVmUaEbwdMfwojrO66mYtNtOQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YjhYq4dDiwwoadzUiZjIDEWdvC1EOrGL5h2V6bbr4DZocm6aLN1MQ6+79DTxyRtb/
	 AvAJyRMNz8/9tRt0PRS/Wxnz4XIoL5lTZmPeBz/DwaU5UPoTeJLc4j1+EjvFFT3cxH
	 OQyLbvtHZjIOPRmQObr4DQwIK5CtdgfH/tVCtoBbGxPlOp/9FrfwtwkOmX2qdp1xBb
	 /ajZhXVczFkr/GKJDQWjhkShDakAkNKrM6qEkj4Y3kP0ZNsBvh6Gdg4xAOb+Hkap4S
	 brl/P+Up3lakKtEObpKBMq5Ab7y90i2Zp1vpA5U0x8kYhIJzAkqIggqN6SRJsaiT5r
	 EboqYGSIZlJqw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	y.oudjana@protonmail.com,
	angelogioacchino.delregno@collabora.com,
	jason-jh.lin@mediatek.com,
	ck.hu@mediatek.com,
	fparent@baylibre.com,
	rex-bc.chen@mediatek.com,
	tinghan.shen@mediatek.com,
	chun-jie.chen@mediatek.com,
	weiyi.lu@mediatek.com,
	ikjn@chromium.org,
	miles.chen@mediatek.com,
	sam.shih@mediatek.com,
	wenst@chromium.org,
	bgolaszewski@baylibre.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	konrad.dybcio@somainline.org,
	marijn.suijten@somainline.org,
	martin.botka@somainline.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	paul.bouchara@somainline.org,
	kernel@collabora.com,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v4 3/7] dt-bindings: reset: Add bindings for MT6795 Helio X10 reset controllers
Date: Mon, 27 Jun 2022 10:56:28 +0200
Message-Id: <20220627085632.23797-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220627085632.23797-1-angelogioacchino.delregno@collabora.com>
References: <20220627085632.23797-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_015646_743986_7ADF8610 
X-CRM114-Status: GOOD (  10.51  )
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

Add the reset controller bindings for MT6795.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 include/dt-bindings/reset/mt6795-resets.h | 50 +++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 include/dt-bindings/reset/mt6795-resets.h

diff --git a/include/dt-bindings/reset/mt6795-resets.h b/include/dt-bindings/reset/mt6795-resets.h
new file mode 100644
index 000000000000..0a6514884eae
--- /dev/null
+++ b/include/dt-bindings/reset/mt6795-resets.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2022 Collabora Ltd.
+ * Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT6795
+#define _DT_BINDINGS_RESET_CONTROLLER_MT6795
+
+/* INFRACFG resets */
+#define MT6795_INFRA_SCPSYS_RST			0
+#define MT6795_INFRA_PMIC_WRAP_RST		1
+
+/* MMSYS resets */
+#define MT6795_MMSYS_SW0_RST_B_SMI_COMMON	0
+#define MT6795_MMSYS_SW0_RST_B_SMI_LARB		1
+#define MT6795_MMSYS_SW0_RST_B_CAM_MDP		2
+#define MT6795_MMSYS_SW0_RST_B_MDP_RDMA0	3
+#define MT6795_MMSYS_SW0_RST_B_MDP_RDMA1	4
+#define MT6795_MMSYS_SW0_RST_B_MDP_RSZ0		5
+#define MT6795_MMSYS_SW0_RST_B_MDP_RSZ1		6
+#define MT6795_MMSYS_SW0_RST_B_MDP_RSZ2		7
+#define MT6795_MMSYS_SW0_RST_B_MDP_TDSHP0	8
+#define MT6795_MMSYS_SW0_RST_B_MDP_TDSHP1	9
+#define MT6795_MMSYS_SW0_RST_B_MDP_WDMA		10
+#define MT6795_MMSYS_SW0_RST_B_MDP_WROT0	11
+#define MT6795_MMSYS_SW0_RST_B_MDP_WROT1	12
+#define MT6795_MMSYS_SW0_RST_B_MDP_CROP		13
+
+/*  PERICFG resets */
+#define MT6795_PERI_NFI_SW_RST			0
+#define MT6795_PERI_THERM_SW_RST		1
+#define MT6795_PERI_MSDC1_SW_RST		2
+
+/* TOPRGU resets */
+#define MT6795_TOPRGU_INFRA_SW_RST		0
+#define MT6795_TOPRGU_MM_SW_RST			1
+#define MT6795_TOPRGU_MFG_SW_RST		2
+#define MT6795_TOPRGU_VENC_SW_RST		3
+#define MT6795_TOPRGU_VDEC_SW_RST		4
+#define MT6795_TOPRGU_IMG_SW_RST		5
+#define MT6795_TOPRGU_DDRPHY_SW_RST		6
+#define MT6795_TOPRGU_MD_SW_RST			7
+#define MT6795_TOPRGU_INFRA_AO_SW_RST		8
+#define MT6795_TOPRGU_MD_LITE_SW_RST		9
+#define MT6795_TOPRGU_APMIXED_SW_RST		10
+#define MT6795_TOPRGU_PWRAP_SPI_CTL_RST		11
+#define MT6795_TOPRGU_SW_RST_NUM		12
+
+#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT6795 */
-- 
2.35.1


