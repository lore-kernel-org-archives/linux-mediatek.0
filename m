Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FA1C25B74
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 May 2024 09:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lzbzoq5hN9MaqQ/OUhiUzLR45d0C1od3fcsmWTURFN8=; b=oFJdKHxhDjdhCZWjmO5/l+U79E
	t1VIjpUKcpoM/rNaxr6w/G7AUsWveaPce1syPQpdtCjhHQb7yz13MwFZIYg03zP86FD7HurkvKV81
	QW0ZMaYZLJ+U8TDAOgWIlt3S6qk4/Nujnq5m/uhSEB6bBSh8LtClKiD34V1i0H2k2zy7JmoOxqA7P
	1F95dYYqSikcYxcx+TnXOPpoHygq4NkeM7wwtkS/LrJWUiMCtHtkFI9WsKma6RPygY0bi/c0m/68W
	AUAxqZzh3mT2uKiFJpB8FnV+OMTCqlQvlO3Y84q80pSO1GiX10j3jJo3S7OL50EqlQWcwSOaKHPM5
	c12HXTzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCcBb-00000006qP7-2P8B;
	Thu, 30 May 2024 09:35:03 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCcB2-00000006qBP-38wG;
	Thu, 30 May 2024 09:34:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717061665;
	bh=o6pclbl/e4/rRME/1Dx7hlQDIRY5Zc8zYMH7xjMpS+4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MUrOZo2DOxB4ZvfQbU3ZxYYEGA78mjReY7PMoUgtb0yOcdeKid/SjMAhVZg8rbORY
	 4/koKuohCHMHlXnLZTIH69z6OMb1cRNB38ycMMcyQjpYfxr5GXoq6ifOvbOEcn3AmZ
	 Q3UZCb2SKRNpWWvNrxsqgCp45TLZO4Gy5Q+czpqcZj8t5lfidTFL4O3u3Lild80+dg
	 8p6Zs/T2B+Z67LYqyUpOBUln5ppWMsCAeW8BUmwYo17kPZYiVS/3mkYyIxlIrBsFY3
	 zllvshp9VggWuc79uc8vEFBhOPtsrfDjSMEcHwmfWe17B+gA7389OiQPwUMk/Qh8f4
	 Bq9v0X2siZmcQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D0DF637821AB;
	Thu, 30 May 2024 09:34:23 +0000 (UTC)
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
	kernel@collabora.com
Subject: [PATCH v1 1/4] dt-bindings: iio: adc: Add MediaTek MT6359 PMIC AUXADC
Date: Thu, 30 May 2024 11:34:07 +0200
Message-ID: <20240530093410.112716-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240530093410.112716-1-angelogioacchino.delregno@collabora.com>
References: <20240530093410.112716-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_023429_206390_6D4ABD75 
X-CRM114-Status: GOOD (  13.67  )
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

Add a new binding for the MT6350 Series (MT6357/8/9) PMIC AUXADC,
providing various ADC channels for both internal temperatures and
voltages, audio accessory detection (hp/mic/hp+mic and buttons,
usually on a 3.5mm jack) other than some basic battery statistics
on boards where the battery is managed by this PMIC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../iio/adc/mediatek,mt6359-auxadc.yaml       | 43 +++++++++++++++++++
 .../iio/adc/mediatek,mt6357-auxadc.h          | 21 +++++++++
 .../iio/adc/mediatek,mt6358-auxadc.h          | 22 ++++++++++
 .../iio/adc/mediatek,mt6359-auxadc.h          | 22 ++++++++++
 4 files changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
 create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6357-auxadc.h
 create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6358-auxadc.h
 create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6359-auxadc.h

diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
new file mode 100644
index 000000000000..dd6c331905cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/mediatek,mt6359-auxadc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6350 series PMIC AUXADC
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The Auxiliary Analog/Digital Converter (AUXADC) is an ADC found
+  in some MediaTek PMICs, performing various PMIC related measurements
+  such as battery and PMIC internal voltage regulators temperatures,
+  accessory detection resistance (usually, for a 3.5mm audio jack)
+  other than voltages for various PMIC internal components.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt6357-auxadc
+      - mediatek,mt6358-auxadc
+      - mediatek,mt6359-auxadc
+
+  "#io-channel-cells":
+    const: 1
+
+additionalProperties: false
+
+required:
+  - compatible
+  - "#io-channel-cells"
+
+examples:
+  - |
+    pmic {
+        pmic_adc: adc {
+            compatible = "mediatek,mt6359-auxadc";
+            #io-channel-cells = <1>;
+        };
+    };
+...
diff --git a/include/dt-bindings/iio/adc/mediatek,mt6357-auxadc.h b/include/dt-bindings/iio/adc/mediatek,mt6357-auxadc.h
new file mode 100644
index 000000000000..03ebb1d23953
--- /dev/null
+++ b/include/dt-bindings/iio/adc/mediatek,mt6357-auxadc.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+
+#ifndef _DT_BINDINGS_MEDIATEK_MT6357_AUXADC_H
+#define _DT_BINDINGS_MEDIATEK_MT6357_AUXADC_H
+
+/* ADC Channel Index */
+#define MT6357_AUXADC_BATADC		0
+#define MT6357_AUXADC_ISENSE		1
+#define MT6357_AUXADC_VCDT		2
+#define MT6357_AUXADC_BAT_TEMP		3
+#define MT6357_AUXADC_CHIP_TEMP		4
+#define MT6357_AUXADC_ACCDET		5
+#define MT6357_AUXADC_VDCXO		6
+#define MT6357_AUXADC_TSX_TEMP		7
+#define MT6357_AUXADC_HPOFS_CAL		8
+#define MT6357_AUXADC_DCXO_TEMP		9
+#define MT6357_AUXADC_VCORE_TEMP	10
+#define MT6357_AUXADC_VPROC_TEMP	11
+#define MT6357_AUXADC_VBAT		12
+
+#endif
diff --git a/include/dt-bindings/iio/adc/mediatek,mt6358-auxadc.h b/include/dt-bindings/iio/adc/mediatek,mt6358-auxadc.h
new file mode 100644
index 000000000000..efa08398fafd
--- /dev/null
+++ b/include/dt-bindings/iio/adc/mediatek,mt6358-auxadc.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+
+#ifndef _DT_BINDINGS_MEDIATEK_MT6358_AUXADC_H
+#define _DT_BINDINGS_MEDIATEK_MT6358_AUXADC_H
+
+/* ADC Channel Index */
+#define MT6358_AUXADC_BATADC		0
+#define MT6358_AUXADC_VCDT		1
+#define MT6358_AUXADC_BAT_TEMP		2
+#define MT6358_AUXADC_CHIP_TEMP		3
+#define MT6358_AUXADC_ACCDET		4
+#define MT6358_AUXADC_VDCXO		5
+#define MT6358_AUXADC_TSX_TEMP		6
+#define MT6358_AUXADC_HPOFS_CAL		7
+#define MT6358_AUXADC_DCXO_TEMP		8
+#define MT6358_AUXADC_VBIF		9
+#define MT6358_AUXADC_VCORE_TEMP	10
+#define MT6358_AUXADC_VPROC_TEMP	11
+#define MT6358_AUXADC_VGPU_TEMP		12
+#define MT6358_AUXADC_VBAT		13
+
+#endif
diff --git a/include/dt-bindings/iio/adc/mediatek,mt6359-auxadc.h b/include/dt-bindings/iio/adc/mediatek,mt6359-auxadc.h
new file mode 100644
index 000000000000..59826393ee7e
--- /dev/null
+++ b/include/dt-bindings/iio/adc/mediatek,mt6359-auxadc.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+
+#ifndef _DT_BINDINGS_MEDIATEK_MT6359_AUXADC_H
+#define _DT_BINDINGS_MEDIATEK_MT6359_AUXADC_H
+
+/* ADC Channel Index */
+#define MT6359_AUXADC_BATADC		0
+#define MT6359_AUXADC_BAT_TEMP		1
+#define MT6359_AUXADC_CHIP_TEMP		2
+#define MT6359_AUXADC_ACCDET		3
+#define MT6359_AUXADC_VDCXO		4
+#define MT6359_AUXADC_TSX_TEMP		5
+#define MT6359_AUXADC_HPOFS_CAL		6
+#define MT6359_AUXADC_DCXO_TEMP		7
+#define MT6359_AUXADC_VBIF		8
+#define MT6359_AUXADC_VCORE_TEMP	9
+#define MT6359_AUXADC_VPROC_TEMP	10
+#define MT6359_AUXADC_VGPU_TEMP		11
+#define MT6359_AUXADC_VBAT		12
+#define MT6359_AUXADC_IBAT		13
+
+#endif
-- 
2.45.1


