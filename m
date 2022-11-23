Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB75EC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Nov 2022 11:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jg6k2EBgIItsO1ImQVATwrquNffE9UfKIwGEVOtqEn8=; b=UTdDzotxrme3clwAeTIUQN09sc
	/9lG3NH2YWxny3HBiQnokw9q/ktOROfXZyPc6UcaTSANBZmcMWed68vzhn44bm669IKwiiHIameoA
	V2ZB7iYbDcwESMzA55gIMKbayhk6mGUEOnMfkWdTGspfPDvoLlkQsDJwYr7Ejzaxl3iAyET43AZu5
	6CaIBS9AuWm6436lk0i424Wxyc9vLgyJWyhl5bXw5f/M/+qi8D0m1yPmIXlpoB9jds4gRgxAi+si2
	KUWcwVoi5CJar5kPTV0O8noJmD0zUxLn6JQ+JWg8js4O2hiYxCq57+B6WAaDeGNM4p4VB/1/ETB7v
	xrauBfQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxnsw-00Ger6-Vh; Wed, 23 Nov 2022 11:25:46 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxnqL-00GdcX-Bu; Wed, 23 Nov 2022 11:23:06 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4C7426602AE2;
	Wed, 23 Nov 2022 11:23:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669202580;
	bh=SS5h0AcRIuCYZwAghSxIqcJiZsZkfQ+w6DNodr6pz3o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V20LmNqEDP+RZ0vAsiU/DQZGF5/FzpEzVBLshk46yMDkXxGYO4LWXx9JEi0+gutz8
	 7kkJmsbuS0HechadCgfeRB/dAcVA+ZGOHCZdkS6XOipqkEsbdkZ+W80o0YoLoZryIg
	 E+rNNVZNt9nbw0qBMh3Axy7Y0Do+7bzWppxD8u7S4leSJnC7gqdZFLMOZAKAx7RWo3
	 nzHCHgq83zmjzyDz+ettN+5uq7XAQBcTtioiPlt1XLAKPiDWkdLlfGEXmH1f2XU2m7
	 oVFRA55Z8wDuOJOMAzg/E+QXMHFj31rhFH7LxhejhrrflUQsKd/Y7jneWSXQLWo7tz
	 lvioMV7HT09qg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: tglx@linutronix.de
Cc: maz@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	youlin.pei@mediatek.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 4/4] irqchip: irq-mtk-cirq: Add support for System CIRQ on MT8192
Date: Wed, 23 Nov 2022 12:22:49 +0100
Message-Id: <20221123112249.98281-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221123112249.98281-1-angelogioacchino.delregno@collabora.com>
References: <20221123112249.98281-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_032305_564551_0629EFA4 
X-CRM114-Status: GOOD (  12.99  )
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

On some SoCs the System CIRQ register layout is slightly different,
as there are more registers per function and in some cases other
differences later in the layout: this is seen on at least MT8192,
but it's also valid for some other "contemporary" SoCs both for
Chromebooks and for smartphones.

Add the new "v2" register layout and use it if the compatible
"mediatek,mt8192-cirq" is found.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/irqchip/irq-mtk-cirq.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/irqchip/irq-mtk-cirq.c b/drivers/irqchip/irq-mtk-cirq.c
index 4d873d2ba0fd..57452d389b47 100644
--- a/drivers/irqchip/irq-mtk-cirq.c
+++ b/drivers/irqchip/irq-mtk-cirq.c
@@ -39,6 +39,18 @@ static const u32 mtk_cirq_regs_v1[] = {
 	[CIRQ_CONTROL]	= 0x300,
 };
 
+static const u32 mtk_cirq_regs_v2[] = {
+	[CIRQ_STA]	= 0x0,
+	[CIRQ_ACK]	= 0x80,
+	[CIRQ_MASK_SET]	= 0x180,
+	[CIRQ_MASK_CLR]	= 0x200,
+	[CIRQ_SENS_SET]	= 0x300,
+	[CIRQ_SENS_CLR]	= 0x380,
+	[CIRQ_POL_SET]	= 0x480,
+	[CIRQ_POL_CLR]	= 0x500,
+	[CIRQ_CONTROL]	= 0x600,
+};
+
 #define CIRQ_EN	0x1
 #define CIRQ_EDGE	0x2
 #define CIRQ_FLUSH	0x4
@@ -273,6 +285,7 @@ static const struct of_device_id mtk_cirq_of_match[] = {
 	{ .compatible = "mediatek,mt2701-cirq", .data = &mtk_cirq_regs_v1 },
 	{ .compatible = "mediatek,mt8135-cirq", .data = &mtk_cirq_regs_v1 },
 	{ .compatible = "mediatek,mt8173-cirq", .data = &mtk_cirq_regs_v1 },
+	{ .compatible = "mediatek,mt8192-cirq", .data = &mtk_cirq_regs_v2 },
 	{ /* sentinel */ }
 };
 
-- 
2.38.1


