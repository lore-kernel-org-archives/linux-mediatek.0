Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8674ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 22:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9lf0+H+Lyxb3lTb0W28LZOfwl4eCR2cGKE01WzgOLhk=; b=lEHBlOWIEjRIEqYi13s+0oEhNs
	rVyP8x3KFZRVCEsTZKh31gCJ6wwfRwQndnLLn5JTumOJUeO6Vv5Jb4ZDGhuXpS53KuHEv4mcWFzAq
	OsIz+7az0JSNLBhgb9z3YtLRrrfFc3vGGQ+VZ3toB0lBUi32w8kQgvFju3KKidr0KBHBaaX7h0UDe
	6nIHsJk9UMPkgpZjo416CgjF07Nj++BDLGshrRne9M/JnexbGm8VJQrwxUP2iQBuSAM/h3g3GthSl
	1T2mJkKXzUQP6vV36rbbb9GbJXzaE/StiUfN3l/JxosHKl1hwPurnpTEsCytZX+jCle1kW6Y0XYi2
	GFBtJPpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opd5j-00G8AN-R2; Mon, 31 Oct 2022 22:17:11 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opd5Y-00G85E-Ru; Mon, 31 Oct 2022 22:17:02 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1opd5X-0000xS-Ac; Mon, 31 Oct 2022 23:16:59 +0100
Date: Mon, 31 Oct 2022 22:16:53 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: devicetree@vger.kernel.org, linux-pm@vger.kernel.or,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 2/2] dt-bindings: thermal: mediatek: add compatible string
 for MT7986 SoC
Message-ID: <1216e96b279d08230cb2aa61d536f44c1e9b800a.1667254476.git.daniel@makrotopia.org>
References: <136157bd1f94c64504f87ee2db6b3ed0a8dcc3de.1667254476.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <136157bd1f94c64504f87ee2db6b3ed0a8dcc3de.1667254476.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_151700_921110_647CBC60 
X-CRM114-Status: UNSURE (   7.94  )
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

Add compatible string 'mediatek,mt7986-thermal' for V3 thermal unit
found in MT7981 and MT7986 SoCs.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 Documentation/devicetree/bindings/thermal/mediatek-thermal.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt b/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
index 5c7e7bdd029abf..efc16ab5b22b5d 100644
--- a/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
+++ b/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
@@ -13,6 +13,7 @@ Required properties:
   - "mediatek,mt2701-thermal" : For MT2701 family of SoCs
   - "mediatek,mt2712-thermal" : For MT2712 family of SoCs
   - "mediatek,mt7622-thermal" : For MT7622 SoC
+  - "mediatek,mt7986-thermal" : For MT7981 and MT7986 SoC
   - "mediatek,mt8183-thermal" : For MT8183 family of SoCs
   - "mediatek,mt8516-thermal", "mediatek,mt2701-thermal : For MT8516 family of SoCs
 - reg: Address range of the thermal controller
-- 
2.38.1


