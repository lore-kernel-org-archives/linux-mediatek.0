Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75297C7619A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 11:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CEcHCPUa/PN8LoqmEZKjsUsJdx7L5WQNMInklQQIUqI=; b=LVFxrlSWBsw3IFK0e4vh9dnh5+
	kzfbUZ6+NEsCZ92gZvRhUEaJBpH4JySaeUZ0mMWwL9NWW58Svoss8ifeXQR8DvDBBInKWa2javlJY
	jCE9dcUkPVunNJg5cPIF2KzJHV5lC0/nUa8LvQ054i0NOqcbfgsIAO0ZKMYZMBjHPRwVRTut23w1P
	Uce8aHOfPywAaVJAQUjUmQcu8LmKBefTUHXJDdVj//LQJERrssbUeNKWVr7YqLAcGSU2g5ATqCOz+
	qI9t6u6u0aW7P1q2toR3ysnre7cDDbSpertJMIgID5nrXt9qTdoWAWeJu+4CJU59kTgxqRTOvTcok
	R0NrfcGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYg5-002puz-25;
	Wed, 12 Apr 2023 11:30:17 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYe2-002ns0-2N;
	Wed, 12 Apr 2023 11:28:12 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 384476603268;
	Wed, 12 Apr 2023 12:28:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681298889;
	bh=BO9urXruQyNuXF4nM/TgzD/wYwtIsG4Yokws6tMujbw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SAt2DXz8F3hUnNbs1pp9rHQ81rEQD746/hrjZ+757Vgsd3quG/18wOKvcJh9CMrfR
	 zFA0yyWVbUIv4aoYlO85o2PAfLDduFdgi0GiHUxAx3nT140GZszMd8nI22Yjcf7EnO
	 iaOLVZWUhVcp30tMJjFUZ72anzKnBvKo+u2PUKZY3Dluhm89b0KJyswrxuT5V7uDV5
	 IJhdAZBDnQ1Htpq5HSVv5jJqxKmxoJn9TU3gHEwOM9lspc///2HsP/HVdI6a+MG0uH
	 BfR86FPxhq8CW6ua4VFQV++ehaJlPnm14ijxwaH1Nivonbo1dYFCefonMilDODEcWK
	 HobBtNylv+OZA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	jassisinghbrar@gmail.com,
	chunfeng.yun@mediatek.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de,
	chunkuang.hu@kernel.org,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	xinlei.lee@mediatek.com,
	houlong.wei@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	kernel@collabora.com,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 17/27] arm64: dts: mediatek: mt6795: Add MMSYS node for multimedia clocks
Date: Wed, 12 Apr 2023 13:27:29 +0200
Message-Id: <20230412112739.160376-18-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_042810_944315_700418F1 
X-CRM114-Status: UNSURE (   8.32  )
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

Add the MultiMedia System node, providing clocks for the multimedia
hardware blocks and their IOMMU/SMIs.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index 99cc4918e6ba..a8b2c4517e79 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -635,6 +635,19 @@ mmc3: mmc@11260000 {
 			status = "disabled";
 		};
 
+		mmsys: syscon@14000000 {
+			compatible = "mediatek,mt6795-mmsys", "syscon";
+			reg = <0 0x14000000 0 0x1000>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			assigned-clocks = <&topckgen CLK_TOP_MM_SEL>;
+			assigned-clock-rates = <400000000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
+				 <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
+		};
+
 		vdecsys: clock-controller@16000000 {
 			compatible = "mediatek,mt6795-vdecsys";
 			reg = <0 0x16000000 0 0x1000>;
-- 
2.40.0


