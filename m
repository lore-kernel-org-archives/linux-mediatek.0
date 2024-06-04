Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82048C27C50
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 12:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bh5i0IFWNv+fwAP3lbIy6WaeaknCru5DjjB23tKZsyw=; b=Q7w8c5fNDWrdhDhLitlkL/oviS
	4cfJHYALc0PoXASwwn7TNYWCbsxVg7f2rshvsF6c8x89f+tXSa3O0lpvHxXm6W4OxMZuJcjLUMm8R
	cf+BqRW9V756uTf+kkDwoVr0VP/UFTNqNQf2U3aOOy9xLQkVaLI/J3DlUjznrfgYYvFjVMeHm1Wso
	ZzMUND6yrVrpdGwfSXbFuCGkpbostcVPy0zS9d+L619RbbSa+r7uuBfAAQZBqU2iWiOH8AKD1WDOy
	+RRbIuLlTx6qLUk3LVW5cOm1SI2dJKiOLB54pMT93dqMcAgbb09m8OV3nVb6V5zgYEAUCj4MAN631
	iXPbTXvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETJC-00000002Hp0-4C8y;
	Tue, 04 Jun 2024 12:30:35 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETIx-00000002Hgf-0lKk;
	Tue, 04 Jun 2024 12:30:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717504218;
	bh=J+OODm0wIrA4401PrNQAK4+hIQjVOMpoja1yNcRjEB4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y3u6b6nhuVviydEeQMze5zcUyK7shBy8vbhJkNbqjqLP3vjhy7quqXGjuGJ9IGGE3
	 YT43XegJBf56Dz+XFBwFdWb8aQDQ7Y9qcKEpDuxEwbORnZ3pV1JLNSXbf7oqM30OTQ
	 CCuugYGjo+906Iwuf/uBa+HJK6TzzwNhhrWJZqaXo7DRl5/1Tdf4gFqJf8rMLjN9iQ
	 uUGKqR2BvnvFN0rtw3uN5Gq+p1VVCQlPQtgiNVCYrge5V230VedlST9RuIfvJB17pj
	 SrunTHa/2aTYun3vbvnb8RqI2ldG60gJpkWt/3SR/E7GWQjt6QOWbP3iekijX7tRwC
	 yVtXw7hoMaPfA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7770C37821F4;
	Tue,  4 Jun 2024 12:30:16 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lee@kernel.org,
	andy@kernel.org,
	nuno.sa@analog.com,
	bigunclemax@gmail.com,
	dlechner@baylibre.com,
	marius.cristea@microchip.com,
	marcelo.schmitt@analog.com,
	fr0st61te@gmail.com,
	mitrutzceclan@gmail.com,
	mike.looijmans@topic.nl,
	marcus.folkesson@gmail.com,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	andy.shevchenko@gmail.com,
	kernel@collabora.com
Subject: [PATCH v2 2/5] dt-bindings: mfd: mediatek,mt6357: Describe Auxiliary ADC subdev
Date: Tue,  4 Jun 2024 14:30:05 +0200
Message-ID: <20240604123008.327424-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240604123008.327424-1-angelogioacchino.delregno@collabora.com>
References: <20240604123008.327424-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_053019_373733_230A6C18 
X-CRM114-Status: UNSURE (   8.18  )
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

Describe the PMIC-integrated Auxiliary Analog to Digital Converter
subdevice node.
Full description is available in the mediatek,mt6359-auxadc.yaml
binding relative to that hardware.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/mfd/mediatek,mt6357.yaml       | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
index 37423c2e0fdf..e3513cad25f6 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
@@ -37,6 +37,11 @@ properties:
   "#interrupt-cells":
     const: 2
 
+  adc:
+    type: object
+    $ref: /schemas/iio/adc/mediatek,mt6359-auxadc.yaml
+    unevaluatedProperties: false
+
   regulators:
     type: object
     $ref: /schemas/regulator/mediatek,mt6357-regulator.yaml
@@ -83,6 +88,11 @@ examples:
             interrupt-controller;
             #interrupt-cells = <2>;
 
+            pmic_adc: adc {
+                    compatible = "mediatek,mt6357-auxadc";
+                    #io-channel-cells = <1>;
+            };
+
             regulators {
                 mt6357_vproc_reg: buck-vproc {
                     regulator-name = "vproc";
-- 
2.45.1


