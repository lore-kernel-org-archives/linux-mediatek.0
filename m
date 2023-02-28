Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92F5C64ED6
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Feb 2023 10:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/wQJs05byhrrLM8BF/IW9SqNQZTG2r5owrQyzEoZjSg=; b=s70DbWv86UcS/02k5xuBrJeht9
	z/sdF5upsa8RpJdjtI7Ho6DCWHdnllg6Xx3ln9Y2OFM/nmMXBfAZRm7ZDqtwA1wDF/huSrwXigMUa
	1eGvCBsJPYXcrCdju3/8j9DqEijaNXDzq0vUzI91/4DKXnPa0P2vySGcfyHdX3J9R19iqj2y8kAvw
	+T+60yNONpeuDSzQNL+eoCiHiDzMjOCPw0beSIcfB3nsN+Wof/+7vZb0I3drsYw+kb77y+Ca5lO27
	cZblcuA/7kVotZcANkZI34teRtoimpTQpxxKn+RxJRt+awBY42ZrjaCL1bir3jLnIBrtRy4vJtacl
	SR4sxDIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxFS-00Cdr1-3x; Tue, 28 Feb 2023 10:30:18 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxCX-00Cc73-3a; Tue, 28 Feb 2023 10:27:20 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A91E06602FDE;
	Tue, 28 Feb 2023 10:27:13 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677580034;
	bh=bxtPSXtkYJhetgJR72HKbYbaXEEqIZSwJCftN/W21/Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CaJ6RRwqoHEFPQChKcPrJna+kHBLyaulH4Tnj5MYrHoZ/Mn2WE6E8r2yk1PSbODQR
	 PQs+LAenZVzbbSjDYacpUzx08upKuyQpQ9NOZtVALR8899NeM+Nnoc6BxKAV4yZVto
	 o1evuw9nFf0o+nEAMT6uiKeF9ZohB/4Bb5AUwtLdzGHcIgiztATlo/IKmwSYoV+L8q
	 EPgFRWjzmnQ4H9v2bMfK4AjwwE1F95k5TT0pTiWtnccZ//JAVPTb0+8Et8rUYD9CrI
	 BffdDsVpgN8wjN5yN3QQ7LIGqgJgwf9xdrtETmh+xtXLLdoe1dMLDWIR5KYyxAhU9t
	 NU+f3aYmxzZGg==
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
Subject: [PATCH v4 06/12] dt-bindings: gpu: mali-bifrost: Add support for MediaTek MT8186
Date: Tue, 28 Feb 2023 11:26:58 +0100
Message-Id: <20230228102704.708150-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_022717_374538_0CF2E366 
X-CRM114-Status: UNSURE (   8.00  )
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
---
 .../bindings/gpu/arm,mali-bifrost.yaml         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index cf24aaba70f2..9f3991b6deae 100644
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


