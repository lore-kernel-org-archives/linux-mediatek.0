Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC5FC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 10:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IgEF+zWeC6KL6rQFOe8sAbihEwGvF1EIWouVxzA23kc=; b=VfhCYNhF8BhGvm
	AAytp3WxxGwjlZV+C7s+uYiL5DH+LOX6t8Hmapax0rJwSkAp+KAkr0GWbZTBH0vWBGiGHmL2gR6SR
	4N2jSsjd6ShCPAw91L2AglX/Qt52+KQkgGcUog0heR/MeR6Brztjldl4e2X9bgxnztJK9DB6jvpiZ
	+UTURMGGI9CKV8EaD52eIOrT8kwD90wBOMqxfk+dy1QYK9qEayESsp72ZAjS3rPvPJxVAFe6uxW+i
	tqtv77dS1iPJtpLoAHSsuKs8R+jUoVBy2ua2x7XFsBfkZUbmBSP4ULTbMbBQDyMsNzcu9bRe94FDt
	Z3kYo+4sPLGxRa5BJIWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nquGU-00D0TH-Al; Tue, 17 May 2022 10:17:18 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nquEd-00CzN4-3F; Tue, 17 May 2022 10:15:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 4C0F11F443BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652782521;
 bh=pzo1+dtMa6njW2GpA6/MtdlSKfPgcIWtCqftoMrICX8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W6N19vRG6Rm/G2l/YpJFs1T+FepNZFi3TVkSjVWPM8PXAFdX0z6HfSUJzWPYJFRzf
 xuu8gWtUfSgQF2bIOZijOFeO01erxA7kzxdMdH4Nzq1DPer9oXoVajWX6xt0ZIQ7eF
 SQp+UzqYV0SMleKnVwMWwNvcM9Wni4wII37NHQwmjun9Z9sK51nWZ5Jklc2i7Rc8QL
 DYjLpGxEyethfeeFtZ/J80mma214UPI3Xua0w5DtNDQrvbIrvikfJDKN5ZjRcugIn+
 1qCWOH/82zLISVg+TR1UCrDl8hoU3gMLg0MzTC3NTj7IBV+aQzjSGLjSveZ87kLtwH
 jSNek9H5C7Ltw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, sboyd@kernel.org,
 chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com, wenst@chromium.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] dt-bindings: arm: mt8195-clock: Remove unnecessary
 'items' and fix formatting
Date: Tue, 17 May 2022 12:15:11 +0200
Message-Id: <20220517101514.21639-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220517101514.21639-1-angelogioacchino.delregno@collabora.com>
References: <20220517101514.21639-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_031523_310383_B8E36ADC 
X-CRM114-Status: UNSURE (   8.04  )
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

Fixes: 34d3ed3b9a00 ("dt-bindings: ARM: Mediatek: Add new document bindings of MT8195 clock")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../arm/mediatek/mediatek,mt8195-clock.yaml   | 58 +++++++++----------
 1 file changed, 29 insertions(+), 29 deletions(-)

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
