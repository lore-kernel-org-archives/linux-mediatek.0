Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F92FCAC58E
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Sep 2025 15:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rI6WcTEalAQk8pq1qEVklqk9hlyym9Zy0E+/hYJI8Qk=; b=pagyX+wHScMF82+7kIOtC6OvvT
	O+zXtHRWmesj7WWD2csBbl5ccYP1afJOd7+JhcGl1rmiTzZ06ZBbvu1xCDCY2yPEVciqivK5iIAcl
	WYhmKSLfdQKenZI4L/FpViHw7PdQimdpFBCGk31cpHrcZM973u9di1tyFdIA2fbbFm1Dop4CD0WLJ
	pQJUn9EB7hbv9Jo8tw9nu6nbH8PHI7N5xVYY7GAQf7hhDJO7zf7h4ORjSGtcDuq45VD0tDbjgTcCf
	vNPAdN7TEx7vbdP+cBpOgwFgamZ8RKW/yxZWDNwGfVVAeCcKs1RkvP6qEdRhViW45scBFNDVxJXub
	fyv1dlxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwj0I-00000003o5K-1TTy;
	Thu, 11 Sep 2025 15:14:30 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwj0F-00000003o44-3gSK;
	Thu, 11 Sep 2025 15:14:29 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1757603627; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=l9yVUxbnprKzKAH6i6S1etdnpW4Rwe9ZSe4Aneecn16CYwS0YuKfSrdZf/go4/7q8luTKRkR+u1b1ja0rEbKW4zqOnPJYLnlbNYWqR9NdE7xo7WRsA+wy7R6xXumEZwQ4OY++NgkytSAql1552V+arrzIBgqmbKVk8TlcyFoIHo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757603627; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rI6WcTEalAQk8pq1qEVklqk9hlyym9Zy0E+/hYJI8Qk=; 
	b=lEOOWXKBptumL7+0UcliD7SqsCzTaimH9Xn5N35wf3NOCSxuX6Sv2FPq2oDLCz/+gFKGiP59uIm5ThjDll4qJNvNp9TBr9/h/RM/eDa7D6okbrAQIbyQ3jL9GZvxRa58V7RlVogNiSgV8Y8yD3sEnD8NnQzwMKwDjL+CXq+QhyI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757603627;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=rI6WcTEalAQk8pq1qEVklqk9hlyym9Zy0E+/hYJI8Qk=;
	b=ZMo38IgKXGAmLLZcMtqxZbtw/C4dS2OHgfYuKZFZGiGhuRGIzTTFv/MIR4Dq0OWy
	TNG27CnntGme/rguaXSnDyzVQR+mmfAERHhU6yxfWdTUuOivGBdpFmd+oBL6vHKeDt5
	tcK2qn6cuuhUdWMQn9lpn+DKfeFzDKHRcFMzSxcM=
Received: by mx.zohomail.com with SMTPS id 1757603625234917.6573362587322;
	Thu, 11 Sep 2025 08:13:45 -0700 (PDT)
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
Subject: [PATCH v2 06/12] dt-bindings: display: mediatek,ufoe: Add mediatek,gce-client-reg property
Date: Thu, 11 Sep 2025 12:09:55 -0300
Message-ID: <20250911151001.108744-7-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_081427_939042_AC50C9BD 
X-CRM114-Status: GOOD (  10.38  )
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

Currently, users of Mediatek UFOe (Unified Frame Optimization engine) DT
bindings set mediatek,gce-client-reg node property, which is missing from
the DT schema.

For example, device tree arch/arm64/boot/dts/mediatek/mt8173.dtsi is
causing the following dtb check error:

```
$ make CHECK_DTBS=y mediatek/mt8173-elm.dtb
   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
   DTC [C] arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
[...]
arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: ufoe@1401a000
(mediatek,mt8173-disp-ufoe): 'mediatek,gce-client-reg' does not match
any of the regexes: '^pinctrl-[0-9]+$'
```

This commit adds the missing node property in the DT schema and updates the
example as well.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 .../bindings/display/mediatek/mediatek,ufoe.yaml  | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
index 61a5e22effbf2..036a66ed42e73 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
@@ -64,6 +64,18 @@ properties:
       - port@0
       - port@1
 
+  mediatek,gce-client-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: describes how to locate the GCE client register
+    items:
+      - items:
+          - description: Phandle reference to a Mediatek GCE Mailbox
+          - description:
+              GCE subsys id mapping to a client defined in header
+              include/dt-bindings/gce/<chip>-gce.h.
+          - description: offset for the GCE register offset
+          - description: size of the GCE register offset
+
 required:
   - compatible
   - reg
@@ -77,7 +89,9 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/gce/mt8173-gce.h>
     #include <dt-bindings/power/mt8173-power.h>
+
     soc {
         #address-cells = <2>;
         #size-cells = <2>;
@@ -88,5 +102,6 @@ examples:
             interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_LOW>;
             power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
             clocks = <&mmsys CLK_MM_DISP_UFOE>;
+            mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0xa000 0x1000>;
         };
     };
-- 
2.50.1


