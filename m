Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE30C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 13:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mqT3VAD11E9Jb9u7Ydy2F8EEDfqA9QbzAVg9N22YokM=; b=vCxFjgxjcT0m4wxHl3djh9SLZf
	KVVW3C/Accav/UQE85G0BXcWI1KwEva8ZH89PaXmvNSV0KF60GL6Qq3CbeSHZSF9HjY0vXD081SqR
	HNxqyQL+jI5RmGS0ImFeTalLQi3rJlDN32Mf6QqzWiHi5tyG8qr0yhu95sPuYDSYWCCDg3PhCrO7L
	7f+l7XvjluKnWs94/b8e7UFX8ZxOafzxNHIGcAreP5k0eNioBAz9BBJqLf4QpEuwAkXmvONUocW1a
	yTfAKkuJ3y6K1Kk5CbYyQY9LxuidMRqFq4IMihPTwpSR5UBsXm7mltyRM6mVzFRsP/nRaZgcA3p4P
	/WJ78rEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6u1Z-00HFqr-Ce; Thu, 30 Jun 2022 13:16:01 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6u1O-00HFoT-Fb; Thu, 30 Jun 2022 13:15:52 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 30561660193B;
	Thu, 30 Jun 2022 14:15:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656594948;
	bh=mXj0tGABrhs2twtkLJTs6KED1Ej73CKEqHJRlvIRmkQ=;
	h=From:To:Cc:Subject:Date:From;
	b=P2utmyG7OaeInNeQPLF5I3L8zASXrtlmlz7Gh2pENo0iUGqD7Xaq2wm9JhWybtmT/
	 UZhvCidCb3wDIkGJYdceOMgAy8JHx1gz7DdS7jqeSjouAtWXh+3w54VOIM662NefbW
	 7ctAinBcUWFp5X0q2I8Tw4EQSTniH7JsfTX3lTsZQdhjUE2Vo2QavgS0Djb5tQzgQA
	 SHf97WvIaPfx63+EI7EUr/0AKioAkrD6ZDdtq7GQ9f3Bl6JFOoZTOvJWk64RpSlQy1
	 3Fq7/r2ngpYhEUOios4dWrsm6NVQf6bZ/rxPn4jidC6xnplF/Kyb+tmlLWDQus41qi
	 4Un286oT62mQw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linus.walleij@linaro.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	sean.wang@mediatek.com,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nfraprado@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] dt-bindings: pinctrl: mt8195: Add and use drive-strength-microamp
Date: Thu, 30 Jun 2022 15:15:43 +0200
Message-Id: <20220630131543.225554-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_061550_697696_3E1B6FE5 
X-CRM114-Status: GOOD (  10.27  )
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

As was already done for MT8192 in commit b52e695324bb ("dt-bindings:
pinctrl: mt8192: Add drive-strength-microamp"), replace the custom
mediatek,drive-strength-adv property with the standardized pinconf
'drive-strength-microamp' one.

Similarly to the mt8192 counterpart, there's no user of property
'mediatek,drive-strength-adv', hence removing it is safe.

Fixes: 69c3d58dc187 ("dt-bindings: pinctrl: mt8195: Add mediatek,drive-strength-adv property")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/pinctrl/pinctrl-mt8195.yaml      | 27 ++-----------------
 1 file changed, 2 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
index b0fea44403e7..85e96a5e1708 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
@@ -100,31 +100,8 @@ patternProperties:
           drive-strength:
             enum: [2, 4, 6, 8, 10, 12, 14, 16]
 
-          mediatek,drive-strength-adv:
-            description: |
-              Describe the specific driving setup property.
-              For I2C pins, the existing generic driving setup can only support
-              2/4/6/8/10/12/14/16mA driving. But in specific driving setup, they
-              can support 0.125/0.25/0.5/1mA adjustment. If we enable specific
-              driving setup, the existing generic setup will be disabled.
-              The specific driving setup is controlled by E1E0EN.
-              When E1=0/E0=0, the strength is 0.125mA.
-              When E1=0/E0=1, the strength is 0.25mA.
-              When E1=1/E0=0, the strength is 0.5mA.
-              When E1=1/E0=1, the strength is 1mA.
-              EN is used to enable or disable the specific driving setup.
-              Valid arguments are described as below:
-              0: (E1, E0, EN) = (0, 0, 0)
-              1: (E1, E0, EN) = (0, 0, 1)
-              2: (E1, E0, EN) = (0, 1, 0)
-              3: (E1, E0, EN) = (0, 1, 1)
-              4: (E1, E0, EN) = (1, 0, 0)
-              5: (E1, E0, EN) = (1, 0, 1)
-              6: (E1, E0, EN) = (1, 1, 0)
-              7: (E1, E0, EN) = (1, 1, 1)
-              So the valid arguments are from 0 to 7.
-            $ref: /schemas/types.yaml#/definitions/uint32
-            enum: [0, 1, 2, 3, 4, 5, 6, 7]
+          drive-strength-microamp:
+            enum: [125, 250, 500, 1000]
 
           bias-pull-down:
             oneOf:
-- 
2.35.1


