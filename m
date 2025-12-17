Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9D6D65530
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Dec 2025 10:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bawckMDOduaiJ7N2ZcTQbXJiFhTgy7i0mMYm8/eIrUo=; b=1HYTwzUFvf6PbxYDd8L3TQgcNT
	v+unvQR+C0++2p5h/xB1Yoaa/sSeLD9DZ1OSTPOCEDF1qK8EVpWp7pfJBsSqgnp+deqhkiFywZKqT
	qVc4HS4s8XGpvHcIp+CXZPKbSok7PE9XY1O+5dUJ9wUSaKi6D4S/Pe+vbntaRK7EcClcA5mUOgrQR
	2QcD0o9xymIWF8ePlReWIM+Jq5TRnv8gp8ivbpaiKNlfifrTxkyFj+bk2zCikfzV4aBwTCYU8e/8O
	gxi2ZYk2hDY6Db0JQ50RDjqkn+59E6HLvZ1oF8P2OZVPnp/8n3moA/CRDqSsCi74l8s7evg1roUDq
	Pqg+cI1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVodl-00000006bna-1QCY;
	Wed, 17 Dec 2025 10:20:17 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVodG-00000006bEA-2EoH;
	Wed, 17 Dec 2025 10:19:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765966782;
	bh=2xZJiA/e2yEWce3nDQEQ2ahixaohi3k6n/fEjJnLDVQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OntNhfF7d9lV2N8GLUJ/sKPfqS18zk1FNNbdcsr3NaP4B/eskj4Zg/Hizy617XaGK
	 cjdiFqWj8euh3B2en13vjdHrYf6u2HazSNAhuUs9aGjgNkYz4ScxsTlWpvVcRRnJ5Q
	 aK+nwrcXdHPHCUAUG1H3Jv/WrIi8VtZ9F4SmSrYGdQuKACZj0ZkYKeJeIZ21fm0Ujz
	 IifuSDv+j5ghFc+1P0adzxZRPxYhHEXa2NlCRFo9Q1g3tZWAbJIFmrEeT83jd9HFdv
	 t2WYmpHXWO8cN4SlZ/OO31QbMN1fxzo76MQsvUu9iujHBpi0WwHJqV8sVwZdfCKMLA
	 TzjXL9FomjBHg==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 207F517E1520;
	Wed, 17 Dec 2025 11:19:42 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 17 Dec 2025 11:19:06 +0100
Subject: [PATCH v2 07/12] arm64: dts: mediatek: mt8390-genio-common: Add
 HDMI sound output support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-mtk-genio-evk-hdmi-support-v2-7-a994976bb39a@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765966775; l=863;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=2xZJiA/e2yEWce3nDQEQ2ahixaohi3k6n/fEjJnLDVQ=;
 b=5oLNUsgnudzEFOCOy/+7qSe/udDuBy0OSLq5nT64aFW/Rov1ttaxPA8DSnJ3n1tZC05S5cNnh
 2eruY8CsG8zB2GStAjB7GtX516pwXIA7N2h6kGUgbxkFKIAdEERXZet
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_021946_958717_3CA6DCAC 
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

Add in the sound node a new dai-link for ETDM3_OUT_BE to add the sound
output support through the HDMI connector.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 5fa1f5fbad18f2bf9b153ae9a029829641e43023..2062506f6cc523d7797adc8b7e74732be9320201 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -1344,6 +1344,15 @@ codec {
 			sound-dai = <&dmic_codec>;
 		};
 	};
+
+	dai-link-2 {
+		link-name = "ETDM3_OUT_BE";
+
+		codec {
+			sound-dai = <&hdmi 0>;
+		};
+	};
+
 };
 
 &spi2 {

-- 
2.52.0


