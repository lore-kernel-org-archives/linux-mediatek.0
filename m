Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DE6CAC587
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Sep 2025 15:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pUtxZbvlNIi4H5EeFTGaoT/G6bLVLSFgmTvDYT5R3gQ=; b=rP8wx2+YxJYl8+kUW1gxyEIyNj
	wS15u6ucz2MwjQRcOm02jnH2srQ2uFxTHj2P9kVezgUEmG5uyqIbzGBjUZhIyjpfBYIf1Sg0V6Uzu
	HaYhQsyaKAt021xLgWNM4xp6y2zdia7E01wPM5sl8wDc/nF6cFPjuHJEdInL4pGeaH/7A3L8b5BD2
	+cQd1sY6P5wpiyfZbQ37c5yS8cDMk4EvxN8yUr0ApCdNWow0RQUwq8Yo95t8EQx2gtFQd7+pAIwUs
	9KDRrz/mI5FfWN5UDSWhudeZSCPyQhwi7qa/PbLSwKg1AnHGIqTAAtxnZr8sf20W48q8ounCIWwVL
	bnCKPYtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwj1W-00000003odz-08hQ;
	Thu, 11 Sep 2025 15:15:46 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwj1T-00000003ocp-2mB7;
	Thu, 11 Sep 2025 15:15:44 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1757603699; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RfQQ/M6Tm+6OaYTlB7FKmVd0qTVEJfQBVE3+fZ4Pa3hwCrsDZb9vqtwn3dRmZS9ScyCktZluwjSwUkEtrQoUSoyCzyDxdG2ChPP7mHlUKAiqUcIIThtaNjiZPKFB6zz48lC780EDMZyUxXSA1lQB2UvVwzqZbvRJflLK12iZmMQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757603699; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pUtxZbvlNIi4H5EeFTGaoT/G6bLVLSFgmTvDYT5R3gQ=; 
	b=XzzTiLYGaQts1yoxDScBtoi4FMPDx3Q275Hd5ugIxyelpYN69Zzr+Iylz8OwUlShOzzHEL/+hJANMdbBmtIbIonrnMqnRkXK/mrDEeIe1hjXz26wCq0NnJvPn7DaIk3AAppziFizntQOvca3f4w+PyoJTHihWtAddSyPGJs0fyo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757603699;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=pUtxZbvlNIi4H5EeFTGaoT/G6bLVLSFgmTvDYT5R3gQ=;
	b=UG+iT4YBQ9kxlpgN7Ojj4kZaWQKaVMN6VD1IQcR4bXOhvQs5ZJgQoPF+GhByeHqi
	S7DNO141+WLxOLF1wdGAwz++Bl2BOEYHb8YBy6pOk6U5YpC57Kpemxf03bkRINgZokA
	genKNirerdwk3In3ZcuWUJV6JM7z2gC1YxCvRmb4=
Received: by mx.zohomail.com with SMTPS id 1757603698448103.94183972441317;
	Thu, 11 Sep 2025 08:14:58 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: airlied@gmail.com,
	amergnat@baylibre.com,
	andrew+netdev@lunn.ch,
	andrew-ct.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	ariel.dalessandro@collabora.com,
	broonie@kernel.org,
	chunkuang.hu@kernel.org,
	conor+dt@kernel.org,
	davem@davemloft.net,
	dmitry.torokhov@gmail.com,
	edumazet@google.com,
	flora.fu@mediatek.com,
	heiko@sntech.de,
	houlong.wei@mediatek.com,
	jeesw@melfas.com,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	kuba@kernel.org,
	lgirdwood@gmail.com,
	linus.walleij@linaro.org,
	louisalexis.eyraud@collabora.com,
	luiz.dentz@gmail.com,
	maarten.lankhorst@linux.intel.com,
	marcel@holtmann.org,
	matthias.bgg@gmail.com,
	mchehab@kernel.org,
	minghsiu.tsai@mediatek.com,
	mripard@kernel.org,
	p.zabel@pengutronix.de,
	pabeni@redhat.com,
	robh@kernel.org,
	sean.wang@kernel.org,
	simona@ffwll.ch,
	support.opensource@diasemi.com,
	tiffany.lin@mediatek.com,
	tzimmermann@suse.de,
	yunfei.dong@mediatek.com
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v2 11/12] dt-bindings: soc: mediatek: pwrap: Add power-domains property
Date: Thu, 11 Sep 2025 12:10:00 -0300
Message-ID: <20250911151001.108744-12-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_081543_756103_B1CA72E1 
X-CRM114-Status: UNSURE (   6.81  )
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

Currently, the DT bindings for Mediatek PMIC Wrapper is missing the
power-domains property, which is used in the MT8173 E1 evaluation board as
it needs USB power domain.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/soc/mediatek/mediatek,pwrap.yaml     | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
index 4737e5f45d541..54c0cd64d3094 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
@@ -98,6 +98,9 @@ properties:
       - const: pwrap
       - const: pwrap-bridge
 
+  power-domains:
+    maxItems: 1
+
   pmic:
     type: object
 
@@ -126,6 +129,18 @@ allOf:
         clock-names:
           minItems: 4
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8173-pwrap
+    then:
+      properties:
+        power-domains: true
+    else:
+      properties:
+        power-domains: false
+
 additionalProperties: false
 
 examples:
-- 
2.50.1


