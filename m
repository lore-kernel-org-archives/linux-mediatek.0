Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D20C6379F
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 15:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ux2XCuCi78DmCxhmj2ukCazKOuQq87GMBp4lF8TlRzI=; b=uCVQhNd9Mx+h5OqgveLnavldAJ
	lg8O+BpeuKj3U1FSJLWRlf1xsyJh+bfRYuGiFPoYBcxn+i+SBAelv5wavSupppDH01eFIPr/AtXfP
	Es6oOwTD+eRvs2qaUz9GNYtvF7zKUKbzn5EMGnZXzE0boLTVM0USEbYg/SIQZSiPG3WcS32Fsys59
	NC5nH4krDdSMitKDZSGatOCqmqVG3e+1kdA4EcxfFPeCpQ9OTftPODXSFBYatvVhcE+fh7Z0kL1Yj
	B/Xa6L2xLFd0kTdFtr+8KHfzYhwjD3me1hC+TfpsU5EhnCBMuma8JaAhdTCL3gL5I+umvvCtaVjOG
	Y+kQmr3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUUij-008iIj-UX; Tue, 21 Feb 2023 15:38:21 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUUiC-008hx2-LN; Tue, 21 Feb 2023 15:37:50 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CDB4166021CE;
	Tue, 21 Feb 2023 15:37:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676993866;
	bh=dYSlQLXMyB6AD5hy1+lsca8EHSPk5mj7QuNmBK+ZBoM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fruQtiaCFMTjf65J3alfeo62CbcoagqQqYvW554EK9LoXS9Jq6sdepSifhbe9eSCT
	 IAXo3KLtInJZRV1NQWbBeXKRWC0mWHT07qmVMNNv6WYiU4A7yrnesuAIc6oOhgmPM6
	 SbHmDPIjvKdhhEBGdJR3G35/PACkTxb/MnHm8twuGJhNia6fdirTD/65IEd3kcVju9
	 SxUTm+McN27gp5Z6FKgX9+DY+S6ra/n7qrN3gKTOZwWD9GNyTEObNyl/VRwK2VSDCy
	 O7VDCYayuQXWe/ABLKOnd3dhnuiYB/IR4RsdrNAYvLgGNOxXPYN/P6PqpKBPVvlInt
	 R6TyvdcMlrwzg==
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
Subject: [PATCH v2 02/10] dt-bindings: gpu: mali-bifrost: Split out MediaTek power-domains variation
Date: Tue, 21 Feb 2023 16:37:32 +0100
Message-Id: <20230221153740.1620529-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com>
References: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_073748_850846_F79ECCE7 
X-CRM114-Status: GOOD (  10.37  )
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

In preparation for adding new bindings for new MediaTek SoCs, split out
the power-domain-names and power-domainsvariation from the `else` in
the current mediatek,mt8183-mali conditional.

The sram-supply part is left in place to be disallowed for anything
that is not compatible with "mediatek,mt8183-mali" as this regulator
is MediaTek-specific and it is, and will ever be, used only for this
specific string due to the addition of the mediatek-regulator-coupler
driver.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 02699d389be1..ac174c17e25f 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -145,6 +145,18 @@ allOf:
         - power-domains
         - resets
         - reset-names
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - mediatek,mt8183-mali
+    then:
+      properties:
+        power-domains:
+          maxItems: 1
+        power-domain-names: false
   - if:
       properties:
         compatible:
@@ -166,9 +178,6 @@ allOf:
         - power-domain-names
     else:
       properties:
-        power-domains:
-          maxItems: 1
-        power-domain-names: false
         sram-supply: false
   - if:
       properties:
-- 
2.39.2


