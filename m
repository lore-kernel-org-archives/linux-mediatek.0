Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14B0C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 16:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UuHrT2Z8zmtEsn8ND5RV2xOahVhnawF/LU4Lhw48V1k=; b=sW8Vn/HphsliM5PLReQ+eQeHgm
	z7HOUGL6kxbtEIpZywvRjLjgaHeVK05HTaC9U7OathBvPrvvBC3OHcO02IO0u2O23Y8E0PTgI5ANT
	OTwabwwOs+9nksFgmWentIplW02ivBOmIm0xFvLZcjkBYFb643OnIFKRYCWGcIURI3RhJW05mSIaL
	HA+LohMKmjMc5IyMoYz+LIJ+O37O7/C0FG1w5MIM1xMbVMORRZLVLrlFds1Yv9M972HD2H3VH5KkI
	RbOh8plrIOHennmgoxUncz5enapl4/TpmpckwQmFJ/U9fAaRBOfXM58oT+jGar2ocg9FSyVQLIAMR
	eZBwTdNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olYL8-000I33-Bw; Thu, 20 Oct 2022 16:24:14 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olYII-000Gjy-GJ
	for linux-mediatek@lists.infradead.org; Thu, 20 Oct 2022 16:21:23 +0000
Received: by mail-wr1-x42d.google.com with SMTP id a3so35360304wrt.0
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Oct 2022 09:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UuHrT2Z8zmtEsn8ND5RV2xOahVhnawF/LU4Lhw48V1k=;
        b=8OPmn3lFErY9t9UOj/KgqUGRVdvyKkTkpcHBkVLA8LILmEyf4gPqMDnveg3TMcXrVX
         O4cweUMf2vYLMj5xpHt+co4IESLmSxfkfzFGpGFwxiHD0XrczP1xQdvFVNz+R/O9tXHi
         n2UFlaywxczhqDEBL/7UTXoaCgyWeixCTvP5b7PRPTKmoAd4FWvNv1IRl/cIuftc0Y9J
         YgQKLvtI2Z51xnK3rT4BvEIj2fqfrYkQh8jJkXHF/DRzqW+N3kGMI4WpmwUFXR0Uut3z
         hQ72N+Ra9G9GFLiJSCPIQaQMAZeue9BGYGhfWpWvIGYu2rFWoKW6ias80VPk0Sv1zUg6
         YTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UuHrT2Z8zmtEsn8ND5RV2xOahVhnawF/LU4Lhw48V1k=;
        b=Ox1bgWcRpSWbPcTTIslJ1he3dD/vXX5p1//6iu/joqNJRRMgkColUhF3vw09SCmvT6
         CCLYyIaDLZFjeuUn0HPfNbNEBEPP1cmjxwNWF7i1a0cujyHAJSEA1cyPDAEKZYJPOwmg
         EhtbsN1WkbZD43vraAfhi5AcGdaaMvasYlNs8zeb4UpQu9/XArjNiRwLxwUCplPndA41
         c8165yekEF9mUNDJBzeedv7tv1tXuE8kZOiIzBl+ZjUiSVxy90PA82jRrk+/UrTdG/Op
         s1WvQ3clmOJNy7S8U9KsIWABya8LpmgTYU7sxdrFD80E3RHMMlyxLoMry0ntKB6CBMel
         B+gQ==
X-Gm-Message-State: ACrzQf0+32lOl/pOI7v/TB/+6Z0Ezmz4BC0/gQarNHFX7C8cUG3wEa0i
	BuxKFqzvWeujDaqqXuTSd3IBrg==
X-Google-Smtp-Source: AMsMyM50xzWlRaXlK/g8fvh2gNEGY2lcNh5pv5g3Hn04yhJ4tSUHlV0zKVOv4iQuwOcw+G41WBuv4Q==
X-Received: by 2002:a05:6000:1786:b0:22e:3955:13a1 with SMTP id e6-20020a056000178600b0022e395513a1mr9260324wrg.624.1666282873049;
        Thu, 20 Oct 2022 09:21:13 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id m14-20020a05600c3b0e00b003b4fe03c881sm208028wms.48.2022.10.20.09.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 09:21:12 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 20 Oct 2022 18:20:47 +0200
Subject: [PATCH v3 3/5] dt-bindings: regulator: Add binding schema for mt6357
 regulators
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mt6357-support-v3-3-7e0bd7c315b2@baylibre.com>
References: <20221005-mt6357-support-v3-0-7e0bd7c315b2@baylibre.com>
In-Reply-To: <20221005-mt6357-support-v3-0-7e0bd7c315b2@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Chen Zhong <chen.zhong@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Fabien Parent <fabien.parent@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Fabien Parent <fparent@baylibre.com>,
 Rob Herring <robh@kernel.org>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=11303;
 i=amergnat@baylibre.com; h=from:subject:message-id;
 bh=plctMFbTpteSTokeqpxVZ32HEa7Isn+fN425sxg1Ae4=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjUXV0WyHLs0WhhvY6p0aII4VLUQtftmO9EAsY+s+i
 WaiFqJqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY1F1dAAKCRArRkmdfjHURdexD/
 0WJkvo5EzsC15GDdkMD/hTRM6pGXtwl1Jxi4Z1RGzwA8bjoExgVIdQV/uqZUM2opubYIPRqYHh7q3A
 4+PvoXpKMSZklE8zjvWDfRU40ttLhIXdtjNqmoGTY7Y45UUnDFlOmJF+EzkGc78Fc0rmTJhcuWt3f5
 ndZsPAkpvCJ+LEG4Qv3BBpdGH6JG955wsMK1OCvnftAtsxQNOM3AYsXU6PtviiVTkm+9dUC2iYIZqr
 PSNjTHWUtD6FU6TBLadsmIG2bB/x7Yi3/hdrltsARf/Ca1O/0LQ6kFlYvmE+NPNF68PiTDLhyZ8WsC
 ttwT6b1Br2tEyl7nhmTqTks+Hf4sh3AGOtMxaDTXohHKGKsIpGxeOYIuhtUPAv0jn2usAREG7tsMiP
 Gv0R52fVJznh411pjwhtiA8MoguWHltOOUh/+Y4VrkQhfZ3S12sDRnzaTtD8zN8pl7qbCyFUW7TG7B
 YqLcefB1q9x7oeAus+c+Hd3sOA7yb7aUwJ9gj0ZqEmyJa/2x+BJF1lPR1YPuKCxYqS6Qa7Ir45DUJW
 CqrujOmDoFVnhq0sI7SlJNuNwRgLcN+4VJKq78RQro8ylufUdRrUgi+SaRDgHmJZW+AD51IdulK0IX
 n8bL7Qns4bcb/NOrbEvlRMmvVV7lGrvmMXlhut2reoXipPBzhi0LgdQZfYQA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_092118_584841_EABE3981 
X-CRM114-Status: GOOD (  11.73  )
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

From: Fabien Parent <fparent@baylibre.com>

Add YAML schema for the MediaTek MT6357 regulators.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../regulator/mediatek,mt6357-regulator.yaml       | 292 +++++++++++++++++++++
 1 file changed, 292 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6357-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6357-regulator.yaml
new file mode 100644
index 000000000000..8dc1245304be
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6357-regulator.yaml
@@ -0,0 +1,292 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6357-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6357 Regulators
+
+maintainers:
+  - Fabien Parent <fabien.parent@linaro.org>
+  - Alexandre Mergnat <amergnat@baylibre.com>
+
+description: |
+  The MT6357 PMIC provides 5 BUCK and 29 LDO.
+  Regulators and nodes are named according to the regulator type:
+  buck-<name> and ldo-<name>.
+  MT6357 regulators node should be sub node of the MT6397 MFD node.
+
+patternProperties:
+  "^buck-v(core|modem|pa|proc|s1)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single BUCK regulator.
+
+    required:
+      - regulator-name
+      - regulator-min-microvolt
+      - regulator-max-microvolt
+
+  "^ldo-v(aud28|aux18|cama|camd|cn18|cn28|cn33-bt|cn33-wifi|dram)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single LDO regulator.
+
+    required:
+      - regulator-name
+      - regulator-min-microvolt
+      - regulator-max-microvolt
+
+  "^ldo-v(efuse|emc|ibr|io18|io28|ldo28|mch|rf12|rf18)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single LDO regulator.
+
+    required:
+      - regulator-name
+      - regulator-min-microvolt
+      - regulator-max-microvolt
+
+  "^ldo-v(xo22|sim1,sim2|sram-others|sram-proc|usb33|xo22)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single LDO regulator.
+
+    required:
+      - regulator-name
+      - regulator-min-microvolt
+      - regulator-max-microvolt
+
+additionalProperties: false
+
+examples:
+  - |
+    pmic {
+      regulators {
+        mt6357_vproc_reg: buck-vproc {
+          regulator-name = "vproc";
+          regulator-min-microvolt = <518750>;
+          regulator-max-microvolt = <1312500>;
+          regulator-ramp-delay = <6250>;
+          regulator-enable-ramp-delay = <220>;
+          regulator-always-on;
+        };
+        mt6357_vcore_reg: buck-vcore {
+          regulator-name = "vcore";
+          regulator-min-microvolt = <518750>;
+          regulator-max-microvolt = <1312500>;
+          regulator-ramp-delay = <6250>;
+          regulator-enable-ramp-delay = <220>;
+          regulator-always-on;
+        };
+        mt6357_vmodem_reg: buck-vmodem {
+          regulator-name = "vmodem";
+          regulator-min-microvolt = <500000>;
+          regulator-max-microvolt = <1193750>;
+          regulator-ramp-delay = <6250>;
+          regulator-enable-ramp-delay = <220>;
+        };
+        mt6357_vs1_reg: buck-vs1 {
+          regulator-name = "vs1";
+          regulator-min-microvolt = <1200000>;
+          regulator-max-microvolt = <2200000>;
+          regulator-ramp-delay = <12500>;
+          regulator-enable-ramp-delay = <220>;
+          regulator-always-on;
+        };
+        mt6357_vpa_reg: buck-vpa {
+          regulator-name = "vpa";
+          regulator-min-microvolt = <500000>;
+          regulator-max-microvolt = <3650000>;
+          regulator-ramp-delay = <50000>;
+          regulator-enable-ramp-delay = <220>;
+        };
+        mt6357_vfe28_reg: ldo-vfe28 {
+          compatible = "regulator-fixed";
+          regulator-name = "vfe28";
+          regulator-min-microvolt = <2800000>;
+          regulator-max-microvolt = <2800000>;
+          regulator-enable-ramp-delay = <264>;
+        };
+        mt6357_vxo22_reg: ldo-vxo22 {
+          regulator-name = "vxo22";
+          regulator-min-microvolt = <2200000>;
+          regulator-max-microvolt = <2400000>;
+          regulator-enable-ramp-delay = <110>;
+        };
+        mt6357_vrf18_reg: ldo-vrf18 {
+          compatible = "regulator-fixed";
+          regulator-name = "vrf18";
+          regulator-min-microvolt = <1800000>;
+          regulator-max-microvolt = <1800000>;
+          regulator-enable-ramp-delay = <110>;
+        };
+        mt6357_vrf12_reg: ldo-vrf12 {
+          compatible = "regulator-fixed";
+          regulator-name = "vrf12";
+          regulator-min-microvolt = <1200000>;
+          regulator-max-microvolt = <1200000>;
+          regulator-enable-ramp-delay = <110>;
+        };
+        mt6357_vefuse_reg: ldo-vefuse {
+          regulator-name = "vefuse";
+          regulator-min-microvolt = <1200000>;
+          regulator-max-microvolt = <3300000>;
+          regulator-enable-ramp-delay = <264>;
+        };
+        mt6357_vcn33_bt_reg: ldo-vcn33-bt {
+          regulator-name = "vcn33-bt";
+          regulator-min-microvolt = <3300000>;
+          regulator-max-microvolt = <3500000>;
+          regulator-enable-ramp-delay = <264>;
+        };
+        mt6357_vcn33_wifi_reg: ldo-vcn33-wifi {
+          regulator-name = "vcn33-wifi";
+          regulator-min-microvolt = <3300000>;
+          regulator-max-microvolt = <3500000>;
+          regulator-enable-ramp-delay = <264>;
+        };
+        mt6357_vcn28_reg: ldo-vcn28 {
+          compatible = "regulator-fixed";
+          regulator-name = "vcn28";
+          regulator-min-microvolt = <2800000>;
+          regulator-max-microvolt = <2800000>;
+          regulator-enable-ramp-delay = <264>;
+        };
+        mt6357_vcn18_reg: ldo-vcn18 {
+          compatible = "regulator-fixed";
+          regulator-name = "vcn18";
+          regulator-min-microvolt = <1800000>;
+          regulator-max-microvolt = <1800000>;
+          regulator-enable-ramp-delay = <264>;
+        };
+        mt6357_vcama_reg: ldo-vcama {
+          regulator-name = "vcama";
+          regulator-min-microvolt = <2500000>;
+          regulator-max-microvolt = <2800000>;
+          regulator-enable-ramp-delay = <264>;
+        };
+        mt6357_vcamd_reg: ldo-vcamd {
+          regulator-name = "vcamd";
+          regulator-min-microvolt = <1000000>;
+          regulator-max-microvolt = <1800000>;
+          regulator-enable-ramp-delay = <264>;
+        };
+        mt6357_vcamio_reg: ldo-vcamio18 {
+          compatible = "regulator-fixed";
+          regulator-name = "vcamio";
+          regulator-min-microvolt = <1800000>;
+          regulator-max-microvolt = <1800000>;
+          regulator-enable-ramp-delay = <264>;
+        };
+        mt6357_vldo28_reg: ldo-vldo28 {
+          regulator-name = "vldo28";
+          regulator-min-microvolt = <2800000>;
+          regulator-max-microvolt = <3000000>;
+          regulator-enable-ramp-delay = <264>;
+        };
+        mt6357_vsram_others_reg: ldo-vsram-others {
+          regulator-name = "vsram-others";
+          regulator-min-microvolt = <518750>;
+          regulator-max-microvolt = <1312500>;
+          regulator-ramp-delay = <6250>;
+          regulator-enable-ramp-delay = <110>;
+          regulator-always-on;
+        };
+        mt6357_vsram_proc_reg: ldo-vsram-proc {
+          regulator-name = "vsram-proc";
+          regulator-min-microvolt = <518750>;
+          regulator-max-microvolt = <1312500>;
+          regulator-ramp-delay = <6250>;
+          regulator-enable-ramp-delay = <110>;
+          regulator-always-on;
+        };
+        mt6357_vaux18_reg: ldo-vaux18 {
+          compatible = "regulator-fixed";
+          regulator-name = "vaux18";
+          regulator-min-microvolt = <1800000>;
+          regulator-max-microvolt = <1800000>;
+          regulator-enable-ramp-delay = <264>;
+        };
+        mt6357_vaud28_reg: ldo-vaud28 {
+          compatible = "regulator-fixed";
+          regulator-name = "vaud28";
+          regulator-min-microvolt = <2800000>;
+          regulator-max-microvolt = <2800000>;
+          regulator-enable-ramp-delay = <264>;
+        };
+        mt6357_vio28_reg: ldo-vio28 {
+          compatible = "regulator-fixed";
+          regulator-name = "vio28";
+          regulator-min-microvolt = <2800000>;
+          regulator-max-microvolt = <2800000>;
+          regulator-enable-ramp-delay = <264>;
+        };
+        mt6357_vio18_reg: ldo-vio18 {
+          compatible = "regulator-fixed";
+          regulator-name = "vio18";
+          regulator-min-microvolt = <1800000>;
+          regulator-max-microvolt = <1800000>;
+          regulator-enable-ramp-delay = <264>;
+          regulator-always-on;
+        };
+        mt6357_vdram_reg: ldo-vdram {
+          regulator-name = "vdram";
+          regulator-min-microvolt = <1100000>;
+          regulator-max-microvolt = <1200000>;
+          regulator-enable-ramp-delay = <3300>;
+        };
+        mt6357_vmc_reg: ldo-vmc {
+          regulator-name = "vmc";
+          regulator-min-microvolt = <1800000>;
+          regulator-max-microvolt = <3300000>;
+          regulator-enable-ramp-delay = <44>;
+        };
+        mt6357_vmch_reg: ldo-vmch {
+          regulator-name = "vmch";
+          regulator-min-microvolt = <2900000>;
+          regulator-max-microvolt = <3300000>;
+          regulator-enable-ramp-delay = <44>;
+        };
+        mt6357_vemc_reg: ldo-vemc {
+          regulator-name = "vemc";
+          regulator-min-microvolt = <2900000>;
+          regulator-max-microvolt = <3300000>;
+          regulator-enable-ramp-delay = <44>;
+          regulator-always-on;
+        };
+        mt6357_vsim1_reg: ldo-vsim1 {
+          regulator-name = "vsim1";
+          regulator-min-microvolt = <1700000>;
+          regulator-max-microvolt = <3100000>;
+          regulator-enable-ramp-delay = <264>;
+        };
+        mt6357_vsim2_reg: ldo-vsim2 {
+          regulator-name = "vsim2";
+          regulator-min-microvolt = <1700000>;
+          regulator-max-microvolt = <3100000>;
+          regulator-enable-ramp-delay = <264>;
+        };
+        mt6357_vibr_reg: ldo-vibr {
+          regulator-name = "vibr";
+          regulator-min-microvolt = <1200000>;
+          regulator-max-microvolt = <3300000>;
+          regulator-enable-ramp-delay = <44>;
+        };
+        mt6357_vusb33_reg: ldo-vusb33 {
+          regulator-name = "vusb33";
+          regulator-min-microvolt = <3000000>;
+          regulator-max-microvolt = <3100000>;
+          regulator-enable-ramp-delay = <264>;
+        };
+      };
+    };
+...

-- 
b4 0.10.1

