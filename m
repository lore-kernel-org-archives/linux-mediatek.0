Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE4DC6FD1F
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Mar 2023 10:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XS2y6CGN6DVpxAbUrW0cW/C8S3FCdAMdtsTDq7gPado=; b=0riXmwtsX/E0+PJMRtqfcLnz5f
	ZwlnojxfS+DNKGo3WXtuDxhPvcrZvHJ5j+vP5qT2goaPtHHyX0dE0M2DAZF/u94xuS1grqK8tKOZ9
	A2HV2fkN9NxuzHMvludZHQUIOwOlYhEf59x/pZhc7y9hv1FE3LT+jq6aq0PGDcRrkdLjvR+U7XoxU
	kXCReZMOhgF+aAf7yZNGSpQlvZwJM+GeV2Y6vieNs1rhbxn3B66fKzSIEaZEjS1aku5c83mYTh1cw
	xhx1w3uzyoCg8Mz4I0UOLY6beEM11F07bBS9/zPYvWF/q/46G0qd9QEGOlVdMm81czIR1PXRbEuM1
	0ZBNE7OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pckjp-00G1NY-09;
	Thu, 16 Mar 2023 10:21:37 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pckj6-00G0py-1c;
	Thu, 16 Mar 2023 10:20:53 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 96F2966030A2;
	Thu, 16 Mar 2023 10:20:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678962051;
	bh=uglCXCkWdTA8UQ8UzHMlW0QAy31JjzQ29lenVUc0QMI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JJNsD8RRoKeOsn+xdsXLRjM30aGTJrGpguskbdxgNVnCsVGyyi7RANKku2nXARYdJ
	 bRb//ChxE+qethj+tRWNauzSzq6hM0ayC1iy5Obr94nrbR7x+ObttT948WqSRhgjZ6
	 +1BBu5QHYgbhZRMcnuBFnNHUc6KsQd45bQXajV23WPDqfvo1kGSCp1D7/BbQrKYYnd
	 OzSLLzOYKozdGPaobdmDXcj0kBtLLoD6e7WoTiQjKZ+zDV6FQ4IzS2GynIBECnR8Yd
	 RdkqzzN9s7uXq2JDe12OkX3aDfTMeYr8+dM61MLUuHz8Sn5PTC2iY3iqXmlp05qf03
	 MkQmD4/4vD4PA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Cc: daniel@ffwll.ch,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	steven.price@arm.com,
	alyssa.rosenzweig@collabora.com,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v5 06/12] dt-bindings: gpu: mali-bifrost: Add support for MediaTek MT8186
Date: Thu, 16 Mar 2023 11:20:35 +0100
Message-Id: <20230316102041.210269-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316102041.210269-1-angelogioacchino.delregno@collabora.com>
References: <20230316102041.210269-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_032052_687416_D4495C37 
X-CRM114-Status: UNSURE (   7.95  )
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

MT8186 has a Mali-G52 MC2 2EE GPU (two cores): add a binding with
two power domains (one per core) for it.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/gpu/arm,mali-bifrost.yaml         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 63b993d5fd87..3d0d96913b1b 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -20,6 +20,7 @@ properties:
               - amlogic,meson-g12a-mali
               - mediatek,mt8183-mali
               - mediatek,mt8183b-mali
+              - mediatek,mt8186-mali
               - realtek,rtd1619-mali
               - renesas,r9a07g044-mali
               - renesas,r9a07g054-mali
@@ -196,6 +197,23 @@ allOf:
       required:
         - power-domains
         - power-domain-names
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8186-mali
+    then:
+      properties:
+        power-domains:
+          minItems: 2
+          maxItems: 2
+        power-domain-names:
+          items:
+            - const: core0
+            - const: core1
+      required:
+        - power-domains
+        - power-domain-names
   - if:
       properties:
         compatible:
-- 
2.39.2


