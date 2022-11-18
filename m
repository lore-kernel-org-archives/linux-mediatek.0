Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0DBC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 10:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Is1I9QvdchYKZWyGHMi0IpOc1aZGN19Qo5L5H3hW9g=; b=Y2zQzMtwU5XQbVWOuX68at6ou6
	5YQ2auTD9kqEEUa/FPU3WHHyRMZ+2h3H/FiFXQvgBq+TreaZmYXJSBaQR3ENda8oJ4BNb1KICsn7K
	6z1LKjurvUxZrJYxFFikxuNiykoa8sjNWIvS4QOrPSNnkqskfkTfZU7kIujYQMskYLRoKJq4KGN9V
	k/5tyPzpJA483WSV+XciumToyWysbcHdjhVIGtbZswoRfWKqISFONqp7CQ47WaXvsajf73Qva9Cpe
	1k4oMeBIywv+sMSPIQbd2cIiJ9z/p5Lk4Y8FvIH5CsvBxLKUoMicspAq//66ITUuQPQiTKKIjEA0T
	cm4K/izw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovyHD-003Hzm-W0; Fri, 18 Nov 2022 10:07:15 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovyGr-003HtS-Uw; Fri, 18 Nov 2022 10:06:55 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4D8C66602AA7;
	Fri, 18 Nov 2022 10:06:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668766009;
	bh=HIRKl9LLbNCciqN5hCbiOvtTOlM19cvE0E9kI4/8XXQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CCLOXKSmWgktENVJ9T9gHm9n//U1kSSjxnX81IK0Sx/sinEjJVZK0HHHD/PLpeBSY
	 w/2pwcvjtcuIhzm+IhjJEXjYj5mBNN3cOaSHUirxj4nuINv6JT6FgA55nNrekIVUg7
	 3JnGNMBAOsGs/8gkz/TjWGwC9/AMQV9hOomsWpDX/BMYYLONptCk1DJWtH4T7ZSOop
	 myCKrDkLRIlx/LkIFWDJMu4mzfy1510i55BH5J2tU5DLOOGCG4Xn8qMkOGmySiw4n1
	 OCfdMLxWzP6eLtuH2sQ7aput/WPPwXmi85iBo/dhqqG0DMe9PX54cF01u24do0i4mu
	 qRU4y/dtX4ufQ==
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
Subject: [PATCH v1 2/4] dt-bindings: interrupt-controller: mediatek,cirq: Document MT8192
Date: Fri, 18 Nov 2022 11:06:37 +0100
Message-Id: <20221118100639.33704-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118100639.33704-1-angelogioacchino.delregno@collabora.com>
References: <20221118100639.33704-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_020654_251462_F1B41F1D 
X-CRM114-Status: UNSURE (   7.35  )
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

Add compatible to support the SYS_CIRQ controller found on MT8192.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/interrupt-controller/mediatek,mtk-cirq.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,mtk-cirq.yaml b/Documentation/devicetree/bindings/interrupt-controller/mediatek,mtk-cirq.yaml
index 21e709169907..e0d483d3b1fb 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mediatek,mtk-cirq.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,mtk-cirq.yaml
@@ -26,6 +26,7 @@ properties:
           - mediatek,mt2701-cirq
           - mediatek,mt8135-cirq
           - mediatek,mt8173-cirq
+          - mediatek,mt8192-cirq
       - const: mediatek,mtk-cirq
 
   reg:
-- 
2.38.1


