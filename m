Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A5AC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 10:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R+/iav0fb1kas0rxUSbjeIeZPCUARZNPjASb4/JDyOY=; b=VdjscxvEdTiEGRxzKhkDParaUc
	9ltfrqpAnEZSDlvcLdYXCfxFGsLgMFBd2W36TeO5NRNbrzNOSEaJ0s6HfdU4IRYuzoHgx1GEdt2Bj
	yyhknep18Ujd7Sm63SktFoSH54OPYEDNoGiQw/TlnCu6tShpeZ6U3xaXH5AgsE60QBt4lq5rrT6LA
	6W5CQnabRVysM7BzbXXacubWWNWEKJ2Rm/TlfFPyQomCk+/vyo1K84Jszf/LuSynmXPlXKegjGIpP
	y3mBH5tvG64LtnaiPQeCwQaZ4UkOW/v7dRVmllEqiiGsLmVP3RM48l3BloRJJWL9vaLsliH25RsSe
	YDOm6fLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCIax-006M3T-O7; Fri, 15 Jul 2022 10:30:51 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCIam-006M0b-RP; Fri, 15 Jul 2022 10:30:42 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E9BC86601A54;
	Fri, 15 Jul 2022 11:30:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657881036;
	bh=dCWvFXNI2rIY5yBkfjhQbWu/2lwIl+50fVwcfisytEU=;
	h=From:To:Cc:Subject:Date:From;
	b=VMXBCUuenjDeMlHlJ/LcKhsNYLtz7OrbcEnGYXzDF9OzwDi8txzxX30LInO6OlyuO
	 8lfcUPs3tlaI0FXkN/euk048aFe+qIO75+HKm7smmo7wkPN6zNxJScqX4UCasS7zm+
	 gHe7lINPLlfLagCf8elXNEFL9nhVInxizV1w3y+Y970RMnbjH49GUW1fzfeNLDDjbj
	 iARmCY+C53JdG5IHgR74mc+7dUdVWr0P0n/O9z6ACbJD8uAUzrBRO8ZkM/s2VNuoB0
	 GS2x1gOIlnBUfhG9PwdhT9T04UAfoPeapGo74kllbcki2mtYgRVo1XfSpYt7NF1MdT
	 /66HTbEX/FPdQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linus.walleij@linaro.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	sean.wang@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	nfraprado@collabora.com,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: pinctrl: mt8195: Use drive-strength-microamp in examples
Date: Fri, 15 Jul 2022 12:30:29 +0200
Message-Id: <20220715103029.204500-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_033041_042954_F697202E 
X-CRM114-Status: UNSURE (   9.37  )
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

The property mediatek,drive-strength-adv was deprecated: change the
example for i2c0-pins to use drive-strength-microamp.

Fixes: b6d9af2c6b69 ("dt-bindings: pinctrl: mt8195: Add and use drive-strength-microamp")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
index 85e96a5e1708..66fe17e9e4d3 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
@@ -281,7 +281,7 @@ examples:
           pinmux = <PINMUX_GPIO8__FUNC_SDA0>,
                    <PINMUX_GPIO9__FUNC_SCL0>;
           bias-disable;
-          mediatek,drive-strength-adv = <7>;
+          drive-strength-microamp = <1000>;
         };
       };
     };
-- 
2.35.1


