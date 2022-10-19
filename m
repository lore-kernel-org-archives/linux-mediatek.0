Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AED2C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Oct 2022 14:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jqr7mhmldmosAsnJUhepWkrYvRNHDwT8zl89bERS4z8=; b=gq3zJXLa68VoLxzbsuozxretyZ
	vLWqIUrFAqEE96wNpvCLCF45wa/VdHU7HlknL7JYmSgtpNYyODweVPfo4r8S9CEJLfxIaB/PLMged
	BXt831B+WkGSzqxCtjACcyLgFAtVM3iZEqRwmbw7YaTD8dLpB2C2UuxKDCmx0Jo210IbS1qhL2sR5
	yEWt9YYGfzuIsJQ8hk3Li0YQlm6Q2mc/F40FE1XFo81I7GMgRUBV9xxNHmmRZCoVIZ9RSKVDo0Z6L
	BKYT7wlJ38q8FwtD99W6k0EBunrnsV3Uu3EduUOi4+3D7lc5fdxaOqOdYKoGUtCiR/NU5/tYnbLKI
	W6xDO6sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olAVH-002x68-TG; Wed, 19 Oct 2022 14:57:07 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olADI-002peD-Fh; Wed, 19 Oct 2022 14:38:33 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1olAD8-0000na-7i; Wed, 19 Oct 2022 16:38:22 +0200
Date: Wed, 19 Oct 2022 15:38:15 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-iio@vger.kernel.org
Cc: Gwendal Grignou <gwendal@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: iio: adc: mediatek,mt2701-auxadc: new 32k
 clock
Message-ID: <dbe88fd2f7ea5b2f419dce6ecb48c20e96e2e634.1666190235.git.daniel@makrotopia.org>
References: <f98ed7f3fc15a0614443a57427d46ce17ec2e0cc.1666190235.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f98ed7f3fc15a0614443a57427d46ce17ec2e0cc.1666190235.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_073832_570992_EB4C42DE 
X-CRM114-Status: UNSURE (   9.70  )
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

Newer MediaTek SoCs need an additional clock to be brought up for
AUXADC to work. Add this new optional clock to
mediatek,mt2701-auxadc.yaml.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../bindings/iio/adc/mediatek,mt2701-auxadc.yaml          | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
index 7f79a06e76f596..c2a1813dd54152 100644
--- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
@@ -44,10 +44,14 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    maxItems: 2
+    minItems: 1
 
   clock-names:
-    const: main
+    items:
+      - const: main
+      - const: 32k
+    minItems: 1
 
   "#io-channel-cells":
     const: 1
-- 
2.37.3


