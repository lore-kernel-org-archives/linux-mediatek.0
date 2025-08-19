Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933E7CA0EEB
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Aug 2025 16:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLzPPob4PWRr5o1X29idn583JxcMkCwzNQmuZnGLTE8=; b=RMBiS36YktXUOU/l61FIBpLMkh
	VRp5r2avBDc9BtKUINFBV3ayFm2H9FJSU+MUCn/T6vMHY4TRxCLmPFj9yNwbjGTYc5kP5LjMQq7b4
	RvYjcg8HUvt4/rcKoceBGwEFHL8mTcc1W2piPLcA9pilfAPdX0suuQDPchE0BAiL1fQxop7XWy7/H
	G7Kvf5oN3cUv//+DzzmNdqv1HcdQOH+iUfR/KIE8zIpbb6IyzbLZG9gVna9xVLN22E+znX0tjfYIF
	MnlaDCTwzghxoRzvDXpjCJXK7Iw9pCavOTgj4CGrnligR7elYEdvew2HNl9TmVeDd9Uvs8hynuF7G
	OU5ksjxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoOtj-0000000Ayh4-1BFk;
	Tue, 19 Aug 2025 16:09:19 +0000
Received: from mail.grinn-global.com ([77.55.128.204])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoM0Q-0000000AWP2-27mB;
	Tue, 19 Aug 2025 13:04:03 +0000
X-Virus-Scanned: by amavisd-new using ClamAV (9)
Received: from mateusz.int.grinn-global.com (f90-187.icpnet.pl [46.228.90.187])
	by server220076.nazwa.pl (Postfix) with ESMTP id 6D7DA1BE43A;
	Tue, 19 Aug 2025 15:03:59 +0200 (CEST)
From: Mateusz Koza <mateusz.koza@grinn-global.com>
To: angelogioacchino.delregno@collabora.com,
	robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	marcin.czarnecki@grinn-global.com,
	b.bilas@grinn-global.com,
	Mateusz Koza <mateusz.koza@grinn-global.com>
Subject: [PATCH v2 4/4] dt-bindings: arm: mediatek: Add grinn,genio-510-sbc
Date: Tue, 19 Aug 2025 15:02:31 +0200
Message-ID: <20250819130231.181571-5-mateusz.koza@grinn-global.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250819130231.181571-1-mateusz.koza@grinn-global.com>
References: <20250819130231.181571-1-mateusz.koza@grinn-global.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-NA-AI-Spam-Probability: 0.49
X-NA-AI-Is-Spam: no
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_060402_729447_DCA9985B 
X-CRM114-Status: UNSURE (   8.56  )
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

Add device tree bindings support for the Grinn GenioSBC-510, a
single-board computer based on the MediaTek Genio 510 SoC.

More details about the hardware:
- https://grinn-global.com/products/grinn-geniosom-510
- https://grinn-global.com/products/grinn-genioboard-edge-ai-sbc

Signed-off-by: Mateusz Koza <mateusz.koza@grinn-global.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 122af0bad141..468672b0296a 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -425,6 +425,7 @@ properties:
           - const: mediatek,mt8365
       - items:
           - enum:
+              - grinn,genio-510-sbc
               - mediatek,mt8370-evk
           - const: mediatek,mt8370
           - const: mediatek,mt8188
-- 
2.43.0


