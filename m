Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25BAD65533
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Dec 2025 10:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lhbGlrrkCvQnkV9qAipiOxr7Kf0BEAjHL+cjbnUYcxc=; b=Rs6+e1CZKikmB5Ro9FyR3QTGuC
	9j8e+3OAGYTMGULLVSGnI0OtsWTzc7+8w/a6hyQimRE9eN81boCXmGVlw6dH34+luggdf4nUolWS/
	qxuY9WIyk9obYSeeipgS4ih9PDGt0RxImFIUwmAolWin18Iw0O1TnNKmR7ybFabLREePaFhozRVXR
	k2FgUpuNY+y9R5z7xog0JI8zagsa50dHJLRaVS0Ft4EhFYjg0FjykY+iirc8c3m9YOKZUfrL4Z4pE
	2vdMEJOuRgjqtVln81x3DkarCClEZ+nfN96VsAcSkadc2ERXNWaWg6wGcMOdupD20bCdlle+oGhU1
	OM/RiJ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVodm-00000006bpG-0vzL;
	Wed, 17 Dec 2025 10:20:18 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVodH-00000006bFq-1ZXt;
	Wed, 17 Dec 2025 10:19:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765966784;
	bh=GKcOSBIVFDnp+GUxDrITE/MDL4om5/OvUq+7HaEF0uc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Mob26nBGj2lGKXDvE1y8Np9K1zSpPZSgbfLTHCDdhXW0DO6LKQEPodSUDHxGXRWo1
	 MnGo1UIxAYaHLNiA56cLZHfyRlr1SyPs5Wdq21bfyRDrir633a/llyWa87scqg9xpI
	 Px0W5/On43wgZWSjYco2DvDpNOY5LlLgt2TOEC0Gj5unwFqzQaUce2fgDh/95lZ36g
	 3KwYEaacRPqNf1O34tPF+Rl+y5L8rHZc/XlfCRiGrLj6tlo/n5WxvSr6s00iLyoAcq
	 JAg0iIVF/xY2mOXjkNHeaKEeThDBQmQ2UFH5K2Q+poez2lcU6WUvZefREDjt8q9Ax/
	 vWrZh5YfagyKg==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D79A617E0506;
	Wed, 17 Dec 2025 11:19:43 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 17 Dec 2025 11:19:08 +0100
Subject: [PATCH v2 09/12] arm64: dts: mediatek: mt8395-radxa-nio-12l: Add
 HDMI sound output support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-mtk-genio-evk-hdmi-support-v2-9-a994976bb39a@collabora.com>
References: <20251217-mtk-genio-evk-hdmi-support-v2-0-a994976bb39a@collabora.com>
In-Reply-To: <20251217-mtk-genio-evk-hdmi-support-v2-0-a994976bb39a@collabora.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Guillaume Ranquet <granquet@baylibre.com>
Cc: kernel@collabora.com, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765966775; l=861;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=GKcOSBIVFDnp+GUxDrITE/MDL4om5/OvUq+7HaEF0uc=;
 b=DiWsci2ktePoDxP4wOEu5rgVoipXQeW7ZXO1Rys/kmVajV/S3m8/lF0QSCb0eEyQ/4eAeLXC9
 sKBZ9hONNeWAivruooZMPJRyB12pju0dy9/F5wG4WakejxhhocYgYe4
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_021947_696519_99793153 
X-CRM114-Status: UNSURE (   8.29  )
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

Add in the sound node a new dai-link for ETDM3_OUT_BE to add the sound
output support through the HDMI TX connector.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index b0e18876bd5d2341c6f17f47e9f11433be807ccd..1cd4b84e98615be6c5cb13d01b7baed0e017c3be 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -1072,6 +1072,14 @@ codec {
 			sound-dai = <&pmic 0>;
 		};
 	};
+
+	hdmi-dai-link {
+		link-name = "ETDM3_OUT_BE";
+
+		codec {
+			sound-dai = <&hdmi 0>;
+		};
+	};
 };
 
 &spi1 {

-- 
2.52.0


