Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D34C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Mar 2023 10:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8i1b+In4P2ZDdE63oCFDs3nvPPETwQFuU0JBMLBGs0Q=; b=WpxYzrADAq1hy7obt0hsqEJVxX
	XD8wxkT7wUcqR/xzX1UWnUPJ3X9YZCdxSvjTqKPMBcZa1jnWZrfvobjsy7CUtOdJqnXdn4RV8IbxL
	KB7f/uZE2LeVeJUrIn/VNwaQNtQUUMPtflLXGtKVBdpVB361n5aRuBNuGS172yrglYFcHJS7oUVP3
	4oIt9LbUxSJKI2QeDvWEq+cfFen8wcm1qQ9QskqQfRGcabBX+BNVxNO6zx7+3Wo+KoND8rgh5AlVk
	sjwoppAgIurtWfkBS5rX/WgX4ADv5Q7W6XfVUrkRFfdQlcSioTE32W2K3ZVe6P3mzj3Gx6P46MGAw
	LpMIQqJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pckj7-00G0rJ-19;
	Thu, 16 Mar 2023 10:20:53 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pckj3-00G0oB-0c;
	Thu, 16 Mar 2023 10:20:50 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 110C8660309F;
	Thu, 16 Mar 2023 10:20:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678962047;
	bh=0AQ+gCHdVFTNhiJx165qPUL/6q3xPgjQ71jCDBHRJbM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XZDAjq3y2FnChbx/QaN5W8qWibNZXqFSx+bE4yxNo3mFhqkC7puUiGzFrqJ5720we
	 v276dVUUfq1cEPXmL24DQ4EhnCiJsU25pvEEIvRp3r/vhHJbgczulchcoecA+QwABQ
	 B1HOy+tPc/AkhUEuqiFocFMS+vZeq5umSPFkuuheU3xiOtZYibBpfGg/ajB8vdAruC
	 4R7RsK/EAaaGdSde/s04W54Jf6mYSi8f0QMZIPtMAI5KdYR2Pc6Yb27G3iEgE81+XC
	 CySRPOBKTfHPlH+BVgy45OGeCYPm+Yxj95Ynox8lSxDadnVcD/twx2DodOuI9ckKhQ
	 2H7AMk+HJ9iqg==
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
Subject: [PATCH v5 02/12] dt-bindings: gpu: mali-bifrost: Set power-domains maxItems to 5
Date: Thu, 16 Mar 2023 11:20:31 +0100
Message-Id: <20230316102041.210269-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316102041.210269-1-angelogioacchino.delregno@collabora.com>
References: <20230316102041.210269-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_032049_359735_2A2335E4 
X-CRM114-Status: UNSURE (   8.60  )
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

In preparation for adding (and fixing) power-domain-names and MediaTek
MT8192 bindings, allow up to five items for power-domains.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 7e110751353e..5b7f1c9d2b30 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -63,7 +63,7 @@ properties:
 
   power-domains:
     minItems: 1
-    maxItems: 3
+    maxItems: 5
 
   resets:
     minItems: 1
@@ -157,6 +157,7 @@ allOf:
       properties:
         power-domains:
           minItems: 3
+          maxItems: 3
         power-domain-names:
           items:
             - const: core0
-- 
2.39.2


