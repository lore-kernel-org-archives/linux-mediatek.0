Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C48BC02198
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2025 20:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KeFm5uN/dcweRabrSluxP8oPq78OsF2hf9MOMtJHy/M=; b=kCAXjbY2Gw6jKJwiEIBKaluZRk
	eWv+qCBW0i07egMLKnZFE57s0SuCan+1Sj/kuLgo3B+uHGgGoFKgqAaz/An62dxL6WCJw/YnP8Wv/
	ydyCQt8DwF2JeKq4az8K5/ep3wzfrKGz+Avla2HngkdWOK7+lrTWy4Gxej0kMC6kkGsx22bzezaIN
	Co0wXeqSdAQTGCuboXLdI9ZKuvOnwou3fJ5MTXuPqzFevKXElFKMCaG/V+x2LfRICIG4Jox7vBRDH
	mqz7hZc/NwPeSyzrPLpWB8yBmrwFCn7SeR3DbuTbG35sW1fXMNQslB4erbEP0yLTpvW6D96CIX+j8
	zom0BcBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj2Ga-0000000GA4X-17DE;
	Fri, 14 Feb 2025 20:26:28 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizLq-0000000Ffx1-0YeR;
	Fri, 14 Feb 2025 17:19:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739553580;
	bh=mp9J76YP/HsVdMmLzZKcE6D8+8zelpiTKlZzw4q9iyA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DkS1ptnka7mTCYFzCt3C4eiZfK5/Fs4EOLoFJO0U41PpywCfMKAg3Pr0SRh1YfFF3
	 auBkT7X170y7/8M7Bg/XDOPQ5zGbgE185dqRq/vYhJp+NIOszHfEkcV3cZ2NzcH6KX
	 D3cyMpA4QWEW/OHg2fNWHls6kyqxv+F6z8HjrhEE7scfSDQFgFfx59004VR9biWlbJ
	 j9TJNcBWG/kR9FkSPIpMMRq+IGymWkCJOYX9U9L75KETufkN6vBs25XI4LBGNqNQQL
	 gAx24d/z6dOT70sK4rzsI2hqelWHdcabQezFkNV4rGDJHdq/xKNHrAGdFL2/L65VaB
	 xdlBCVBAKnTBg==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1003])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1287E17E0239;
	Fri, 14 Feb 2025 18:19:35 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 14 Feb 2025 14:18:36 -0300
Subject: [PATCH 05/13] ASoC: mediatek: mt6359-accdet: Implement EINT IRQ
 polarity configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250214-mt6359-accdet-dts-v1-5-677a151b9b4c@collabora.com>
References: <20250214-mt6359-accdet-dts-v1-0-677a151b9b4c@collabora.com>
In-Reply-To: <20250214-mt6359-accdet-dts-v1-0-677a151b9b4c@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Andrew Perepech <andrew.perepech@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_091942_317832_BF860FB5 
X-CRM114-Status: GOOD (  10.06  )
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

From: Andrew Perepech <andrew.perepech@mediatek.com>

The driver currently reads the EINT IRQ polarity from the
"mediatek,eint-level-pol" property but never actually configures the
hardware accordingly.

Implement the IRQ polarity configuration in hardware.

Signed-off-by: Andrew Perepech <andrew.perepech@mediatek.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/codecs/mt6359-accdet.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index 6f07db879c6a56ce4843954f51bb9602373e4aa5..eee676d1faef2076bc837a12a2ee3615216752b7 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -733,6 +733,22 @@ static void config_digital_init_by_mode(struct mt6359_accdet *priv)
 					   BIT(ACCDET_EINT1_INVERTER_SW_EN_SFT));
 		}
 	}
+
+	if (priv->data->eint_pol == IRQ_TYPE_LEVEL_LOW) {
+		/* EINT polarity normal */
+		regmap_update_bits(priv->regmap,
+				ACCDET_EINT_IN_INVERSE_ADDR,
+				ACCDET_EINT_IN_INVERSE_MASK_SFT,
+				0);
+	} else if (priv->data->eint_pol == IRQ_TYPE_LEVEL_HIGH) {
+		/* EINT polarity inverse */
+		regmap_update_bits(priv->regmap,
+				ACCDET_EINT_IN_INVERSE_ADDR,
+				ACCDET_EINT_IN_INVERSE_MASK_SFT,
+				BIT(ACCDET_EINT_IN_INVERSE_SFT));
+	} else {
+		dev_warn(priv->dev, "Unacceptable EINT level type, using default\n");
+	}
 }
 
 static void config_eint_init_by_mode(struct mt6359_accdet *priv)

-- 
2.48.1


