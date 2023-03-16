Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B37C6FD19
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Mar 2023 10:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VcAdjh5SkJV5JpElKyKUhRrN/itFLCu0Et5coQQ/bpI=; b=BgS4N3aTzR539cbPz7okIroYv+
	1w/Ud9Ye3HjquTauhthetreGMbVKPTFPs646h33Ce5iA6stqpuIkAQh54ZjDPuA2HHabZhEGJ4Sbk
	XczfLz748eY6fjot8s7ki1NTQUOCPV8GcMGUiNZXQzAkqYAf1OHtNY+rCeLBIAf5Y8vK+SOHrJXLT
	RZPst2kC/+F1Eiv+xoUlJPFEnJanr3rmt9S01Aq9gYGF9JMbepBaCRnSfhw1V2R57lIBirFnyZUBj
	kiAPp4p69E0HEw2vUlLODgg3ebK22ypaVzd6ANodmFhfFs5EnNXBocWYaCVjQxMlt58oc/y7pR6dK
	+DSRXAGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pckja-00G1C2-1L;
	Thu, 16 Mar 2023 10:21:22 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pckj4-00G0ok-2P;
	Thu, 16 Mar 2023 10:20:52 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CD3D966030A1;
	Thu, 16 Mar 2023 10:20:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678962049;
	bh=cvXpJ8LbxubJEtHvxk8Psw3/s85Oor+YdZdxHV1BvnA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kaRZ4u7T2R2eNSV5sEw9n2rokz8EIIh9g3ilN7C700K2R+bZ50POfJlz9WcqMNubk
	 7Km6JlWLgGcL7zZ13CMx4wVWRvFC+3vpXiXrW8e1Jo4i6nGcMsq0bsvUwBIeFlgOP9
	 pkMZSKHhW7xd0q7M1kJg8kJEqyVmhJ3ZZqlK+hdJnIbcx7gUT8RQisOeaCpBUTLzqt
	 V0pFeyDva4lz2iqPUO9UDjOGZLZ0MHS85N+mnaDDtYh91CYuM5saXaaKynjHhZ3hSm
	 ODxHBVVJIX76MhqWsS0pU+QVQS5q+Y1hysd2KmHVfcGfK+Ql+GB+kHCYOGOLzJ/ffp
	 9rLDEFBU0wAsQ==
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
Subject: [PATCH v5 04/12] dt-bindings: gpu: mali-bifrost: Add sub-schema for MT8192's power domains
Date: Thu, 16 Mar 2023 11:20:33 +0100
Message-Id: <20230316102041.210269-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316102041.210269-1-angelogioacchino.delregno@collabora.com>
References: <20230316102041.210269-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_032050_913146_BD5ABA83 
X-CRM114-Status: UNSURE (   7.87  )
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

MediaTek MT8192 (and similar) needs five power domains for the
Mali GPU and no sram-supply: change the binding to allow so by
also introducing power-domain-names in the generic binding;
while at it, also disallow the newly introduced power-domain-names
for all non-MediaTek bindings.

Fixes: 5d82e74a97c2 ("dt-bindings: Add compatible for Mali Valhall (JM)")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../bindings/gpu/arm,mali-bifrost.yaml        | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 7c61524aae26..9ede51427012 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -177,6 +177,25 @@ allOf:
     else:
       properties:
         sram-supply: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8192-mali
+    then:
+      properties:
+        power-domains:
+          minItems: 5
+        power-domain-names:
+          items:
+            - const: core0
+            - const: core1
+            - const: core2
+            - const: core3
+            - const: core4
+      required:
+        - power-domains
+        - power-domain-names
   - if:
       properties:
         compatible:
-- 
2.39.2


