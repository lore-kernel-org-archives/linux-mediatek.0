Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F628C7619A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 11:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1YjsA4m7oQ9IqldPjQqXlpVdzhCNI99+mXskyH4fR/Q=; b=AP6U5YCDchxxdkKTL2+/2UnVPp
	/by9N4kF6ShH2as3OT+zEziQCQAIB9IvQpVeci07iu/qWjNH4ZNKcuxTR3M9AMCZAU5HevrJKq7B8
	Sm1Gwhw3EtCXNj8nuUEqrCqjyz+U0Ul8bOSlflQSaVj7JwrWim8aBKQ9XVpR/gCcx0fyG1OwxSU+Y
	ZhDkny6rcaFEm0WwDvOvtgkmFG+64XxW93tli7H6EMeOex49W7NsU6f+Bfg0fT2NIcTnLbwlrRaeh
	cR/cAWtgG6v9V1aqdgMw9HFk3bgIThsmItCHmbEzP5j4w9xAyPdcQoeCGSo6xLv3dQKR48phCQqwq
	PZvDBChQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYgh-002qXD-27;
	Wed, 12 Apr 2023 11:30:55 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYe8-002nzE-1C;
	Wed, 12 Apr 2023 11:28:18 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C6A0066058AD;
	Wed, 12 Apr 2023 12:28:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681298895;
	bh=GDKZQ67J0y6mdLDj0BABrBY5g8TxhLW2mBwCl/mxgGQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=USPyrLGQvib/VqoSxzNh1ByE6Zrr7sFSutJabzc9WhYYc/x/VpCTGKKAOEc0UMOuK
	 Rnt7i8WXOD5hJhzh1o95KJm9bkyeCFrDnxuskXkmJq4952fh+xYaJUDRHzuw8V1oHC
	 EUnmGBIayDtvV9txyr1hCII0h5UHXhlF1Vi5gW2deQlk1MD9MmlBcuOs/7BPpy7RRI
	 cjkKdSYHQ69s6yN4h+91GhmNywZq/EYwq5EvsT5TnkgPvy8QQ3FmqC2ZqDjR9iqM67
	 2j2McbHXbS4IiXpjR306aI3y39j5RSfy783/BSAU2LHTWjdinnUpXQ8DwjIJ5V4jIa
	 405BvuAl3FcFA==
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
Subject: [PATCH 21/27] arm64: dts: mediatek: mt6795: Add PMIC Wrapper node
Date: Wed, 12 Apr 2023 13:27:33 +0200
Message-Id: <20230412112739.160376-22-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_042816_577449_4CF400E9 
X-CRM114-Status: UNSURE (   8.22  )
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

Add the pwrap node: this is used to communicate with the PMIC(s).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index 50d9276d18c6..29ca9a7bf0b3 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -391,6 +391,17 @@ timer: timer@10008000 {
 			clocks = <&system_clk>, <&clk32k>;
 		};
 
+		pwrap: pwrap@1000d000 {
+			compatible = "mediatek,mt6795-pwrap";
+			reg = <0 0x1000d000 0 0x1000>;
+			reg-names = "pwrap";
+			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&infracfg MT6795_INFRA_RST0_PMIC_WRAP_RST>;
+			reset-names = "pwrap";
+			clocks = <&topckgen CLK_TOP_PMICSPI_SEL>, <&clk26m>;
+			clock-names = "spi", "wrap";
+		};
+
 		sysirq: intpol-controller@10200620 {
 			compatible = "mediatek,mt6795-sysirq",
 				     "mediatek,mt6577-sysirq";
-- 
2.40.0


