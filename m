Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95296C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 09:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7HKr0YLC3iNxh1wxI2/sFkZykzid3bYRYszAQqVb/6k=; b=3g6OSF8bH8vzoT
	LH0lITutJTdb/jhX/spLnlalpu7Ulat8QbWQSnrzWF7T2w9sQggWZqPudCCpSQnpA5Ap/eKe8DVSH
	seSNOLF8+dpxnasNsUGi49iCiWvxHtL5l0KvEUXWx/vqlLGAr+8+IvVrmmAaQ/MaFOp8lWh1xg7rr
	arIIR8QY8/5MR8QIuJc5l9DFehib4Gc9C5hmgz6brGLNrT0fOFsjFkwq+fA5nlf2IgeR4S8pPdgpf
	Tu3bdGNZcynWJU3+/hfMO7uotQp3MdU7OXZLblf+dv/GijA4mOb5bG6FVehH2hJXJNOh0a0brlfgA
	uhLSU1Ij3MQ0xpGTEmrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrG9u-0016RS-8I; Wed, 18 May 2022 09:39:58 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrG6i-0014Wu-Md; Wed, 18 May 2022 09:36:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id CAE861F4245E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652866599;
 bh=qqSMX64oBzw5AUG70z0JfMK5uOuzZnT/sCD+YBRG804=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GbImY02IiZX3mxGSk3oCKDO+OMUszPOTL3+0M1TOG+l7opXMHuOT8pEuSXs2Vsica
 qIeUpwOiSM2RL4UVgzXhctyTSu77yv5S2fWYYUJokzaWQpfeKf/nuUQcxKP6X9oN85
 SPEcwl/0NBIV2TVBgmu3eaebirc3kTDvT5IMaeFopT0ajf8/hevNstvrFQwOJlNgAb
 PuwFGWFzNGapZmPmzU43K6joWZd3wVXBoW2A4lB/nqiji03IsP1yX+BC2VrlN4iGhO
 Is34zZ+TyJZ+1hljX4bqxwOZHAyRNgin1icit0bffH88rtH79iKFNXPMuOvwKF5sws
 ebXX9JLGcf+FQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, sboyd@kernel.org,
 chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com, wenst@chromium.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH v2 1/2] dt-bindings: arm: mtk-clock: Remove unnecessary
 'items' and fix formatting
Date: Wed, 18 May 2022 11:36:30 +0200
Message-Id: <20220518093631.25491-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220518093631.25491-1-angelogioacchino.delregno@collabora.com>
References: <20220518093631.25491-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_023641_035613_AB8DF51E 
X-CRM114-Status: UNSURE (   8.79  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

There's no need for 'items' when there's only one item; while at it,
also fix formatting by adding a blank line before specifying 'reg'.

Signed-off-by: AngeloGioacchino	Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../arm/mediatek/mediatek,mt8186-clock.yaml   | 28 ++++-----
 .../arm/mediatek/mediatek,mt8192-clock.yaml   | 45 +++++++-------
 .../arm/mediatek/mediatek,mt8195-clock.yaml   | 58 +++++++++----------
 3 files changed, 65 insertions(+), 66 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml
index cf1002c3efa6..371eace6780b 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml
@@ -21,20 +21,20 @@ description: |
 
 properties:
   compatible:
-    items:
-      - enum:
-          - mediatek,mt8186-imp_iic_wrap
-          - mediatek,mt8186-mfgsys
-          - mediatek,mt8186-wpesys
-          - mediatek,mt8186-imgsys1
-          - mediatek,mt8186-imgsys2
-          - mediatek,mt8186-vdecsys
-          - mediatek,mt8186-vencsys
-          - mediatek,mt8186-camsys
-          - mediatek,mt8186-camsys_rawa
-          - mediatek,mt8186-camsys_rawb
-          - mediatek,mt8186-mdpsys
-          - mediatek,mt8186-ipesys
+    enum:
+      - mediatek,mt8186-imp_iic_wrap
+      - mediatek,mt8186-mfgsys
+      - mediatek,mt8186-wpesys
+      - mediatek,mt8186-imgsys1
+      - mediatek,mt8186-imgsys2
+      - mediatek,mt8186-vdecsys
+      - mediatek,mt8186-vencsys
+      - mediatek,mt8186-camsys
+      - mediatek,mt8186-camsys_rawa
+      - mediatek,mt8186-camsys_rawb
+      - mediatek,mt8186-mdpsys
+      - mediatek,mt8186-ipesys
+
   reg:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
index c8c67c033f8c..bb410b178f33 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
@@ -14,29 +14,28 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - mediatek,mt8192-scp_adsp
-          - mediatek,mt8192-imp_iic_wrap_c
-          - mediatek,mt8192-imp_iic_wrap_e
-          - mediatek,mt8192-imp_iic_wrap_s
-          - mediatek,mt8192-imp_iic_wrap_ws
-          - mediatek,mt8192-imp_iic_wrap_w
-          - mediatek,mt8192-imp_iic_wrap_n
-          - mediatek,mt8192-msdc_top
-          - mediatek,mt8192-msdc
-          - mediatek,mt8192-mfgcfg
-          - mediatek,mt8192-imgsys
-          - mediatek,mt8192-imgsys2
-          - mediatek,mt8192-vdecsys_soc
-          - mediatek,mt8192-vdecsys
-          - mediatek,mt8192-vencsys
-          - mediatek,mt8192-camsys
-          - mediatek,mt8192-camsys_rawa
-          - mediatek,mt8192-camsys_rawb
-          - mediatek,mt8192-camsys_rawc
-          - mediatek,mt8192-ipesys
-          - mediatek,mt8192-mdpsys
+    enum:
+      - mediatek,mt8192-scp_adsp
+      - mediatek,mt8192-imp_iic_wrap_c
+      - mediatek,mt8192-imp_iic_wrap_e
+      - mediatek,mt8192-imp_iic_wrap_s
+      - mediatek,mt8192-imp_iic_wrap_ws
+      - mediatek,mt8192-imp_iic_wrap_w
+      - mediatek,mt8192-imp_iic_wrap_n
+      - mediatek,mt8192-msdc_top
+      - mediatek,mt8192-msdc
+      - mediatek,mt8192-mfgcfg
+      - mediatek,mt8192-imgsys
+      - mediatek,mt8192-imgsys2
+      - mediatek,mt8192-vdecsys_soc
+      - mediatek,mt8192-vdecsys
+      - mediatek,mt8192-vencsys
+      - mediatek,mt8192-camsys
+      - mediatek,mt8192-camsys_rawa
+      - mediatek,mt8192-camsys_rawb
+      - mediatek,mt8192-camsys_rawc
+      - mediatek,mt8192-ipesys
+      - mediatek,mt8192-mdpsys
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
index 17fcbb45d121..0189aa0e34d4 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
@@ -22,35 +22,35 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - mediatek,mt8195-scp_adsp
-          - mediatek,mt8195-imp_iic_wrap_s
-          - mediatek,mt8195-imp_iic_wrap_w
-          - mediatek,mt8195-mfgcfg
-          - mediatek,mt8195-vppsys0
-          - mediatek,mt8195-wpesys
-          - mediatek,mt8195-wpesys_vpp0
-          - mediatek,mt8195-wpesys_vpp1
-          - mediatek,mt8195-vppsys1
-          - mediatek,mt8195-imgsys
-          - mediatek,mt8195-imgsys1_dip_top
-          - mediatek,mt8195-imgsys1_dip_nr
-          - mediatek,mt8195-imgsys1_wpe
-          - mediatek,mt8195-ipesys
-          - mediatek,mt8195-camsys
-          - mediatek,mt8195-camsys_rawa
-          - mediatek,mt8195-camsys_yuva
-          - mediatek,mt8195-camsys_rawb
-          - mediatek,mt8195-camsys_yuvb
-          - mediatek,mt8195-camsys_mraw
-          - mediatek,mt8195-ccusys
-          - mediatek,mt8195-vdecsys_soc
-          - mediatek,mt8195-vdecsys
-          - mediatek,mt8195-vdecsys_core1
-          - mediatek,mt8195-vencsys
-          - mediatek,mt8195-vencsys_core1
-          - mediatek,mt8195-apusys_pll
+    enum:
+      - mediatek,mt8195-scp_adsp
+      - mediatek,mt8195-imp_iic_wrap_s
+      - mediatek,mt8195-imp_iic_wrap_w
+      - mediatek,mt8195-mfgcfg
+      - mediatek,mt8195-vppsys0
+      - mediatek,mt8195-wpesys
+      - mediatek,mt8195-wpesys_vpp0
+      - mediatek,mt8195-wpesys_vpp1
+      - mediatek,mt8195-vppsys1
+      - mediatek,mt8195-imgsys
+      - mediatek,mt8195-imgsys1_dip_top
+      - mediatek,mt8195-imgsys1_dip_nr
+      - mediatek,mt8195-imgsys1_wpe
+      - mediatek,mt8195-ipesys
+      - mediatek,mt8195-camsys
+      - mediatek,mt8195-camsys_rawa
+      - mediatek,mt8195-camsys_yuva
+      - mediatek,mt8195-camsys_rawb
+      - mediatek,mt8195-camsys_yuvb
+      - mediatek,mt8195-camsys_mraw
+      - mediatek,mt8195-ccusys
+      - mediatek,mt8195-vdecsys_soc
+      - mediatek,mt8195-vdecsys
+      - mediatek,mt8195-vdecsys_core1
+      - mediatek,mt8195-vencsys
+      - mediatek,mt8195-vencsys_core1
+      - mediatek,mt8195-apusys_pll
+
   reg:
     maxItems: 1
 
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
