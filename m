Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF025C021B2
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Feb 2025 10:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iXOAYxnUw9TxW+8GOBFrlSm0OG7j/OtGl1u0/o1Ujzw=; b=EVFSfqxVEPl/0fP86ZN+2NCrZD
	SumsP2oBiBDn2eYuomMvdXX+8nMne0VJCQnWDGwtRy8UGGo6SGFbIW6gL7iXk13pq0S5s4NUMkqKC
	YS6cCGCCTF11Ol7m26hkefPzptm742rvy386zSDkoCoCiVNKmO1cre0QoSGl8C5V8h6pR1bz4KiSh
	h9KlrAAUGtCK++eiuy8XVrrJUvbuhtuu7H0d0GO6SIRXo5Bcg7G2bE8AUnBvhuxr56at05HCOngSl
	T5iwqwuB2/3a0zFlwNoIKF1PSCzYCfxbTeYSn+k/8hAoT3KdEYu/uXiqApF4quVLNi/7SwVYVXOtP
	wrcl8/8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl4GW-00000000Pt8-3bOw;
	Thu, 20 Feb 2025 10:58:48 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl4Da-00000000P2C-0Mqf;
	Thu, 20 Feb 2025 10:55:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740048944;
	bh=f2rxjrxNyDjW9jW41agW0DUC3PfepPxgabZ7lkxtmWA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IbJbv7Zdchqyk4XjqtZbLFVggpFmVfCDpPkJVFyi1wyOhbJBWyei11xfOcnIlIqxw
	 Jwgfi0kc9GBaHYj5p84rT99IFlADPJrnFr96N7R9ak0Uln3q357Gk7L3AeIy2WT64O
	 +c1RTjKkQmTV8JQ+7Gu+P1/Oa5DJ2h6e9PP9lvo+KDVow8Zsic5LKOF7vfbbaOTx6y
	 K1g4Acaui0mCOizaIJVQ9mHkSQfBfGmpU7/Y3QeggBY+dpcXKrFVAAXl1m8Q/PahNH
	 2wgkVvHDrOWHGzjlfOo9kITL0CbS8ZzzJkkGoBOBfhky52ZgIn4AdwfMMpq7pVdFU+
	 qLWfq3/4J/qpQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A12F717E1569;
	Thu, 20 Feb 2025 11:55:43 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	pablo.sun@mediatek.com
Subject: [PATCH v3 1/3] dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP
Date: Thu, 20 Feb 2025 11:55:12 +0100
Message-ID: <20250220105514.43107-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220105514.43107-1-angelogioacchino.delregno@collabora.com>
References: <20250220105514.43107-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_025546_293402_B53E8DD4 
X-CRM114-Status: UNSURE (   9.39  )
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

Add a port used to connect the SuperSpeed output endpoint to a
Type-C connector.

Note that the MediaTek XHCI controllers are always in front of a
different controller handling the USB HS (usually, MTU3), so the
only port that this controller provides is SuperSpeed, while the
HighSpeed one comes from elsewhere.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index ef3143f4b794..004d3ebec091 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -106,6 +106,10 @@ properties:
       - description: USB3/SS(P) PHY
       - description: USB2/HS PHY
 
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: Super Speed (SS) Output endpoint to a Type-C connector
+
   vusb33-supply:
     description: Regulator of USB AVDD3.3v
 
-- 
2.48.1


