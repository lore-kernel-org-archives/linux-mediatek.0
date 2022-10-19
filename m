Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89980C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Oct 2022 16:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QPBVcim80ZEA2cpucSN5geGdm9XZKu9ZntbpN9+CTng=; b=YynMuZVxlKPzbALwwrayndFGCg
	AR92m7Ky7vuItNU80bE25VWwhGPbQMd6zDom2orVnhbAIMwzZHWfRySCdljsC2MnUInIpktANloSf
	lnIcgKmnVh2hG4Ncw1RhWB7etT4MhQzcPMm8tda1/8Y8e3e1EnPG72XUqXR25IFkm84yvge7dFSs7
	YokawT0wIODUvXYmwA+q/l/gj+glNfer4Oiq7lXZD06mNUsQT59jE5LI8mtLBNSy+C2UBbmG4XGhW
	O2HgqqhxwdJH86uP5iz76/piGEMtcft1NrM6v18PkQwqYSnBxeRJT+3gsb44dic65/Ng5MV0gTCen
	noS9Gk5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olBU4-003c9Z-F9; Wed, 19 Oct 2022 15:59:56 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olB9G-003M9k-9N; Wed, 19 Oct 2022 15:38:27 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1olB9A-000167-Pv; Wed, 19 Oct 2022 17:38:20 +0200
Date: Wed, 19 Oct 2022 16:38:14 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: phy: mediatek: tphy: add compatible for
 tphy-v4
Message-ID: <07c5d962515c4f675f076bb91d69eaf651b187c6.1666193782.git.daniel@makrotopia.org>
References: <df51b63add2830d91b527db64fba6ffdb7765f5d.1666193782.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df51b63add2830d91b527db64fba6ffdb7765f5d.1666193782.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_083826_406050_702F25CE 
X-CRM114-Status: UNSURE (   9.78  )
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

V4 can be found in MT7986 and MT7981 SoCs, it supports PCIe with two
lanes.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
index 5613cc5106e32f..851e3dda7b638b 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
@@ -89,6 +89,11 @@ properties:
               - mediatek,mt8188-tphy
               - mediatek,mt8195-tphy
           - const: mediatek,generic-tphy-v3
+      - items:
+          - enum:
+              - mediatek,mt7981-tphy
+              - mediatek,mt7986-tphy
+          - const: mediatek,generic-tphy-v4
       - const: mediatek,mt2701-u3phy
         deprecated: true
       - const: mediatek,mt2712-u3phy
@@ -99,7 +104,7 @@ properties:
     description:
       Register shared by multiple ports, exclude port's private register.
       It is needed for T-PHY V1, such as mt2701 and mt8173, but not for
-      T-PHY V2/V3, such as mt2712.
+      T-PHY V2/V3/V4, such as mt2712.
     maxItems: 1
 
   "#address-cells":
-- 
2.37.3


