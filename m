Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA709C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 15:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tdiyWctn2akWBPl8d4FNtydcuQcZYlSKN8pq4qmeUHk=; b=453H0eeSk6UaZeI/MRwlza815J
	paMo4ZBMq/V2MueRh2jAunNkHcsfK7SWKHFEa81n1nFxT+YYwbAQW/EE0fp5cx1rL8a95YFDtKPwb
	KqHCD6rx0j+kJQlE8KaUdeZga0QkUavEQ4Xx+FyrxP3F0hwsugTdfuGJvMzaxRJ/lrSvLK2L4GJlp
	5/KD+hIuTca6IC/f3cVP4chJiICrDWdY1WnTaBnLAQAiziHTsSt1FiNZzf3vZawwm3PbMHxqH3+lF
	mOfUz60rXYJKPgeUDrSp6K+pe4Ye+m0/5d7xyvgs1UlFJ/NBJkQHjeQPZgEflEI0CY7Dc4kRKTMvv
	FbPjWVkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6wBQ-000IyA-GO; Thu, 30 Jun 2022 15:34:20 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6wAa-000IVX-5E; Thu, 30 Jun 2022 15:33:30 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 37598660196B;
	Thu, 30 Jun 2022 16:33:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656603207;
	bh=/1I2RRywIXgcW9vN4SVk5tQI6QK5Mxljtoam1OZPAO0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g9jK9IbkQuyp0sdiAaGzO3IvmzNN3+pqA3KMB0VeJy0E0Tj5qcuqrUQXWely5HYMj
	 gvh1AmBdzIjBg4+6L77bi3OgoRJ2iQiCID/pcH1cC4guVRFCi6KnE0QxijeV0izH6H
	 GeOGrTIpa0TJUVOuqjf3GYoMvOuQ9I8IpQn5pdwbD7QOnd49uO2gmb2NbUjvbrlXum
	 edB/Ffpy9x2HpB6dDqaxA8Bq8PeqDOM+aHZFNy7U9TE6l/BQcDnsNCPFY4zqitmEtG
	 7xNEvBZdhlRMrhDE5RaVVbctV1TOVRd8HRf/06ROBcVvJSg9aAir8eaO496TjnV3F/
	 jlzK/1Wh5Ynrw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hsinyi@chromium.org,
	nfraprado@collabora.com,
	allen-kh.cheng@mediatek.com,
	gtk3@inbox.ru,
	luca@z3ntu.xyz,
	sam.shih@mediatek.com,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org
Subject: [PATCH 03/11] arm64: dts: mediatek: cherry: Assign interrupt line to MT6359 PMIC
Date: Thu, 30 Jun 2022 17:33:08 +0200
Message-Id: <20220630153316.308767-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220630153316.308767-1-angelogioacchino.delregno@collabora.com>
References: <20220630153316.308767-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_083328_389990_4367AA43 
X-CRM114-Status: UNSURE (   9.87  )
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

To allow MT6359 peripherals to trigger interrupts and the driver to
safely handle them, assign the right interrupt line for the Cherry
platform to the MT6359 PMIC node.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 7406d7bbf725..14f8f30b1eb3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -21,6 +21,10 @@ memory@40000000 {
 	};
 };
 
+&pmic {
+	interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
+};
+
 &uart0 {
 	status = "okay";
 };
-- 
2.35.1


