Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695FBC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Nov 2022 11:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQy/AVpcf6nocqEPr2r2lilyVn9dXFeimCksJLoRHuc=; b=Palsxr8vr/Eetfy5GPDdH0kVue
	cQSvIQU2F5AS7yHpFIS8yxQhIxB9jpHGCwEmQusSpzr55/yUNkyD7ieirjzAG+dyR29p9L07S2yrM
	DfZ2J27GghLs0nPetP/bv18Tu0dZ/MU+JC9MvCDWXvQqpNWRQBM18SRg3oqxsw4VI7UpiG1cHMYg4
	KZnXwsxPq+5apfhpO/I8Holxf38ZV6UvCRCFyGDnio71trFiJcF3vUWhCcu8rhG8CqKjah1bX4M3I
	zjbAhqrsapon1qFRo7tIZf8i2Nrwk8p42iWE8czRCs3Vv+gsVFu965fCyjOloh9LP3wh4Y5sZF/gi
	uDizocfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxnqi-00Gdis-TB; Wed, 23 Nov 2022 11:23:28 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxnqH-00Gdbk-M7; Wed, 23 Nov 2022 11:23:03 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C0EA86602AA1;
	Wed, 23 Nov 2022 11:22:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669202579;
	bh=NwKmpaNcpbD7LP5LEcTP4r+ZafVpwkZH2doF2FPT2FA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IEO4VhcCJqOVvSnNfKrgM/79lZKPBHuXXAjSFloFJTCeQRCN7qhCP7cMj//jK8Cxl
	 E+CSWnWfFosMFC0zYkWwidESQ51LlagQYHo2jKcCbjEYwuQgLM5X69YdxwofqIOX/x
	 VSJ6qrW5/0h1HEdYixVM5EpdjcqE5xCJElopRDNaR6cCHZXyjO24ikD5Jqpdyj96Xa
	 GjAjz/1kw8YduVJ3gNhelUhd+a6eVnel8nLOBbbwjPcX15fCVhdLPCAT5F6fHrsuqJ
	 YrIfxQWj8zr7H/vSmqy6m9NM56xaRKt5GrzwYd3Ouu7mGH1kXU4wbLBeAZbdwN8NM0
	 n9D1ohwg4uf5A==
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
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/4] dt-bindings: interrupt-controller: mediatek,cirq: Document MT8192
Date: Wed, 23 Nov 2022 12:22:47 +0100
Message-Id: <20221123112249.98281-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221123112249.98281-1-angelogioacchino.delregno@collabora.com>
References: <20221123112249.98281-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_032301_871993_7AE3C5CA 
X-CRM114-Status: UNSURE (   7.71  )
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/interrupt-controller/mediatek,mtk-cirq.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,mtk-cirq.yaml b/Documentation/devicetree/bindings/interrupt-controller/mediatek,mtk-cirq.yaml
index 4f1132c077ff..fdcb4d8db818 100644
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


