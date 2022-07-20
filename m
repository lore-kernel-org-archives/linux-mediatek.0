Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF99C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 10:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sW5XlyimBlOdtgj1NXEyTZGsuKUCOV0JAUj1aN3PNzA=; b=tG5YVRdV6LSZ9EXRiZXRjHEEVf
	puciUIsUwNSlCmxs/tJv6jiC3YwUt146EtNo6QOs2ynJ0++Z67zJUwOMoISrWqvy5EeTgBQ+CuMht
	TVytgGQlVy7v2IS0f8nbG9p73WfjtMk4Od86AFJKec0R4FB3RfW1uZopTZ6b9cICDX0PCIM6WZ58v
	lc3wrFkChWycqvMGpT1AN8lDl+jWojpzCFltcaEm1GGKY0fR86BCJ5KEydwT9ubxgmyC7OsCgVdnG
	S+G3nAyy4ehNGxq6VbNrv/PzwXaZToN376yZeFSmXTyQnjzTBlb/YCeoNPhJOKq2totEIHd4XI14R
	Mx9aunFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE6x6-0043Wi-Ht; Wed, 20 Jul 2022 10:29:12 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE6wV-0042dh-9d; Wed, 20 Jul 2022 10:28:36 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F154E6601A56;
	Wed, 20 Jul 2022 11:28:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658312910;
	bh=BnFrL3fAmMZM58jLVM0qi6FjJFvFVKJ01t/0qCtXjLE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZoVOhXojlkLtRRZKUa3g7ks0wAd9pmmkSlMhw0ti/sB8K4fybJlGMza50IuSxrw4A
	 96su7qg98OwGwWlsIqeLz5m2ZmexKJLcm1UkJKBkCSJNWC8v1IzJ2VcOqViJ5ORXJz
	 +8CvsPsSTmXvT0eRy8yxTteFpsqQEecJTn45IUtrhlY3Tn3CXhUu4N2rmYBb+pkDyO
	 6Le6g1DTqKG6wjYS2TkPYcWullp9WbQkbSfLG6M4ZohT2+lVb6bNfIS/SwwmUAS21p
	 SXCPEZ3QSP6OrovZwhUVVraoqA9uANYoU45MONuniDNONrSN+rvgQP3bJNpVIL5OYj
	 lmjUjYWamOgfQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	matthias.bgg@gmail.com,
	p.zabel@pengutronix.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com,
	chun-jie.chen@mediatek.com,
	wenst@chromium.org,
	nfraprado@collabora.com,
	rex-bc.chen@mediatek.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: reset: mt8195: Add resets for USB/PCIe t-phy port 1
Date: Wed, 20 Jul 2022 12:28:16 +0200
Message-Id: <20220720102817.237483-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220720102817.237483-1-angelogioacchino.delregno@collabora.com>
References: <20220720102817.237483-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_032835_533992_3B6BEEC6 
X-CRM114-Status: UNSURE (   8.45  )
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

Add the reset index for USBSIF P1 (T-PHY port 1), used as either USB
or PCI-Express PHY reset.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 include/dt-bindings/reset/mt8195-resets.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/reset/mt8195-resets.h b/include/dt-bindings/reset/mt8195-resets.h
index 5471468c43b7..e61660438d61 100644
--- a/include/dt-bindings/reset/mt8195-resets.h
+++ b/include/dt-bindings/reset/mt8195-resets.h
@@ -33,6 +33,7 @@
 #define MT8195_INFRA_RST4_THERM_CTRL_MCU_SWRST 2
 #define MT8195_INFRA_RST2_PCIE_P0_SWRST        3
 #define MT8195_INFRA_RST2_PCIE_P1_SWRST        4
+#define MT8195_INFRA_RST2_USBSIF_P1_SWRST      5
 
 /* VDOSYS1 */
 #define MT8195_VDOSYS1_SW0_RST_B_SMI_LARB2                     0
-- 
2.35.1


