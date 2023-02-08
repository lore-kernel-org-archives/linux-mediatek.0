Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1EEC636D3
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 10:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SWNmf2nLlhoisJn7hBQMZi0RyjThEJRFSKPxRhFbSpA=; b=kGnHsA4+/InE1khvpieMPrCfK1
	po7RfV0i/4maDMrxWuribCLRUDa377bLRg3QpXWSonPE8P5T8wcKKQaiFzSRRoPkUnYYicoslqHdj
	mIRbqbHNrdekB8AiPm1rLLCfQdC//c/+MctgunpInTu//hs/ir4fKEb+FSKdTrkQcq3HHNm0ofxRT
	3XD6yzOrMvzhDw3E+47o61EuY3REJsXDBtdxAsR5yjvpo/CQinkxzw77OilPXUcrbuuKbZThZGut4
	6azSatTOLy5bBNJUYnup/7OMO62hr12n4fuBP1sTjAFcTWbMqZy/bbRWSDk8AX1ada4ztofn1XX+G
	Ul2DY4Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPhpp-00FDsF-8e; Wed, 08 Feb 2023 10:37:53 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPhpP-00FDbJ-Dk; Wed, 08 Feb 2023 10:37:28 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7C5F56602091;
	Wed,  8 Feb 2023 10:37:25 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675852646;
	bh=9zKNAYGAIzYijQZ5yFYs1JqVdC6zxa+UlfAq3E44SFA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K7QoFPGpxVSP+tQKfGWuOebcnt6Sd7l0HgiIDDgqcEbc6Z9X2oX2CngfDWRQqfjL2
	 ttioKTdt5/tFqh19H6ZXV0irIqDpptMKjbJ6h2vKMVAYWmu1lp57CqO6i6QO4vr/+/
	 8ZITo3NG4Tu6PgU5CSyyGPkyNHVnS0c98xBydU5cCbfBfuqnS1mYh9ynOP2Lfr/DpG
	 DKWE5uTekG4YZIj4ym4iTzTPkIxwgLcidjyXfjVkwOhkLDWihddzEfsmBUWOP0Cl5r
	 iBTlQjk8u9Ie8TEN0zfTiYHOH2Tlg6ErACv7GNRDCqYCkGZcGi4WcmsmSMj+dEh3mo
	 hIVb/qvf5QvDQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Cc: daniel@ffwll.ch,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	tomeu.vizoso@collabora.com,
	steven.price@arm.com,
	alyssa.rosenzweig@collabora.com,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 1/9] dt-bindings: gpu: mali-bifrost: Don't allow sram-supply by default
Date: Wed,  8 Feb 2023 11:37:01 +0100
Message-Id: <20230208103709.116896-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
References: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_023727_614065_85B7DA28 
X-CRM114-Status: GOOD (  11.06  )
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

The sram-supply is MediaTek-specific, it is and will ever be used
only for the mediatek,mt8183-mali compatible due to the addition of
the mediatek-regulator-coupler driver: change the binding to add
this supply when mediatek,mt8183-mali is present as a compatible
instead of disabling it when not present.

This is done in preparation for adding new bindings for other
MediaTek SoCs, such as MT8192 and others.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 78964c140b46..69212f3b1328 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -57,8 +57,6 @@ properties:
 
   mali-supply: true
 
-  sram-supply: true
-
   operating-points-v2: true
 
   power-domains:
@@ -157,6 +155,7 @@ allOf:
             - const: core0
             - const: core1
             - const: core2
+        sram-supply: true
 
       required:
         - sram-supply
@@ -166,7 +165,6 @@ allOf:
       properties:
         power-domains:
           maxItems: 1
-        sram-supply: false
   - if:
       properties:
         compatible:
-- 
2.39.1


