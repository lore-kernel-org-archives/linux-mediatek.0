Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54833C61DA3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 15:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HE1nmL/pK+99rwUcEZBSlqoNXqs5jByJDekHuPe79dk=; b=pCi6N/vOQfQYCFhmjEDpRXS89G
	4ABuobHilZkQiYKxK5wG4DQdFui8ymgNPXaZJW4Gi0C///8piOXbyyNsLwtSiBFppfOux0OUQHI2p
	FiungSA1zwe/ozwiNZA1QFzomDQ+ymSIHh5jH5en4oNQm8dKBRRUzOjjAV/fyZO7xrkB9Zkc6AVej
	MoWbuslaN1Sd8xnSFmoFlpqcrrIlDN96H5hpT8iBXMrXqgnr9MdT68XcipRznTXrUksMzNBcl3Ilt
	9kTxz90VqwxkwOjIq8uvVyHnIXku3j/L+YyIlojT8YFMMv1UkznYbwtxvfvbjW044kTqihLTj4Cjj
	lLzww2YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUUjV-008ikz-Lu; Tue, 21 Feb 2023 15:39:09 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUUiD-008hxc-Fx; Tue, 21 Feb 2023 15:37:50 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9794866021CF;
	Tue, 21 Feb 2023 15:37:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676993868;
	bh=jFlvEa9umviwW9HdtIpX7rwDDrEbdIW1Lu37fWHY6Jc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gfe+P9SfLlXPyMbQFKsRZfLfQUoASqM8Xd1PfVHy1vDH89/Xf6AtO0RuqccLgxEJe
	 vAiI8yo1geE6uP7y2N9e4mQ9OBZYmPinmLEIfORujDQH6GxR1qKVxezCTDtMbvQ62Z
	 PKLq5Sd1UWOsYFJ3jxuHmXScJpJ4u/0YFnrxpiYjZANmWVZO/1tum+4+0xJ+0O/PXt
	 sMti7CxG9DjsQ79cTw2HMnmswEUxweNgezxPLfgS9aOodn8BYo+7/VI4u3jMqfE8uv
	 PEfkxIyNThGnZKVsHiQ/TDEn2xUgxl1VIp+LsLovhFewfVcNexOoQvHaunFSl4Jh5Q
	 55qCAZ2ere6Sw==
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
Subject: [PATCH v2 04/10] dt-bindings: gpu: mali-bifrost: Add compatible for MT8195 SoC
Date: Tue, 21 Feb 2023 16:37:34 +0100
Message-Id: <20230221153740.1620529-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com>
References: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_073749_678831_57A8383A 
X-CRM114-Status: UNSURE (   8.38  )
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

The MediaTek MT8195 SoC has a Mali G57 MC5 (Valhall-JM) and has the
same number of power domains and requirements as MT8192 in terms of
bindings.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 65fe139ceb83..4d9ab4702582 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -25,6 +25,11 @@ properties:
               - rockchip,px30-mali
               - rockchip,rk3568-mali
           - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
+      - items:
+          - enum:
+              - mediatek,mt8195-mali
+          - const: mediatek,mt8192-mali
+          - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision is fully discoverable
       - items:
           - enum:
               - mediatek,mt8192-mali
-- 
2.39.2


