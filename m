Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9105C87FCF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jul 2025 09:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UDFLzYslvKv+6vW0NCFeInLE+K+lnXmYllfVO6jhb90=; b=gx1V07lhUBeL+9
	cnrvBkS5YTn75kQHIFZtt/ma3mtqyHagAPg1qgGPEdswNWyOLEs+LSLQGz3N13s6A/BNcyBsvoOvI
	iXI4pyaoYK2GjikRLq6ajfnkhT38Sy0xR6QNrzv9/zh/AuxrN1hs9xkZsakixYNpa0+R+OB1Mmt/n
	WOSb4NbS4cbxYScyaXwfB+0aX14exMgh1MtgWMtPor4EpOh4i7g20bEz3cSl3ofiT71MLirsH31ly
	NZeKnWpF7n3nGFSn7BARwILB6im39pKUyR9seKu7WX5qtcxmT/Z7dRvrPgT/OxHoTxPsHvDH62EiO
	hjWVpFfVUH/isOBlIVxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesYj-000000076Ln-3Mo4;
	Thu, 24 Jul 2025 09:48:17 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uerUP-00000006tLY-2f1i;
	Thu, 24 Jul 2025 08:39:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346384;
	bh=2Ol/rXh3JePROm0kGdOiJwqhaq28C241b3Z5h9WBx58=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C+91o06L67bZlF3uFLuTSAY5uiIfp+CXLEY6o9toNih2gZ1dZFnNGalpl0YULHlej
	 ed7B4UX98wAJvv0iAZ/7SBXv8QQXdrTq++9HvFn0oaP7Wu3WnCZX8dj0+6Hg1ekGQK
	 Y33VrP18aZV4JNB4gEruOO4BWO1cEHHmzh3ohVTY/T1jFpRb13+5hwKM83HdyiMsBm
	 22PauR22qAZRpeXO3arjJ36Z5IaSXzZshV17UF4IXuxQ0sJPW186pXj/H5+cW/Vzwo
	 RWZo7iOJK34hSkz8HRlV8G36UH5k3CY3z0u5JGhjFNTMk3MWd0Ss3n3b/cjucvV18j
	 8LQ8qI5Ouy1Lg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 918F617E1314;
	Thu, 24 Jul 2025 10:39:41 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	robh@kernel.org
Subject: [PATCH 07/38] dt-bindings: pinctrl: mediatek,mt7622-pinctrl: Add missing pwm_ch7_2
Date: Thu, 24 Jul 2025 10:38:43 +0200
Message-ID: <20250724083914.61351-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_013945_869244_67FD8D71 
X-CRM114-Status: UNSURE (   8.75  )
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
Cc: daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, granquet@baylibre.com, sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The MT7622 SoC has a PWM channel 7-2 group for the pwm7 IP: add
the missing pwm_ch7_2 group.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
index 9acca85184fa..57b19031925d 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
@@ -204,7 +204,7 @@ patternProperties:
                            pwm_ch2_2, pwm_ch3_0, pwm_ch3_1, pwm_ch3_2, pwm_ch4_0,
                            pwm_ch4_1, pwm_ch4_2, pwm_ch4_3, pwm_ch5_0, pwm_ch5_1,
                            pwm_ch5_2, pwm_ch6_0, pwm_ch6_1, pwm_ch6_2, pwm_ch6_3,
-                           pwm_ch7_0, pwm_0, pwm_1]
+                           pwm_ch7_0, pwm_ch7_2, pwm_0, pwm_1]
           - if:
               properties:
                 function:
-- 
2.50.1


