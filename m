Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DDCC678D4
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 13:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k5uCqAl9Xm0flZG8lUpKb/HpU//1nqOzOmKaeoAToxY=; b=iUbmx6AYHPUkszqmZgt0sACrU3
	yIy21T98T3AT/Njn/mVhUktTzq7YCm5P3l3RFcwl5CnylPRUn3sqDNnTcdOdhxeKtFM+Y1eflysX0
	2nYjlVIQWQx9u73qToRNFtk+0CclkZuHps48UV8zKBm0u96BcVeuq5nP5mtVho9NUrZvgyGlgqAWo
	1JAtSbXkNuI8E/HL6MrDT9GUKc/8ilJ1vTF2WsEv7eEuGmKBoI7fzCZCYk6fGecLxXKVvdV3HQDnH
	/Kd6DC964jrZPU9nt3Qu0OsQoEH+V9vs37O77YTFa4yeatVG4IAq6CLEtglYDFvtVAqGM5Ua2EmN/
	Vw1UEx1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXIi-000MSV-GK; Tue, 07 Mar 2023 13:24:20 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXCh-000Jhq-11
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 13:18:13 +0000
Received: by mail-wm1-x32b.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso7194456wmo.0
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 05:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678195085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k5uCqAl9Xm0flZG8lUpKb/HpU//1nqOzOmKaeoAToxY=;
        b=eoHaLsmI32nf/88LfQMouZ9J44OMQowmwAf9N3TYZNYb5h8ZGdVne4cL8T3aBQQenP
         4zwiDZIzk2oBLZKfNAZ3cuAjlJCAx2bEDLaLjmUCb0pCa4PdVPQo7BFBHTJcu+7zqvS7
         sLSChTjUxbErjCOu5hs8ZrHsG0XVYJ+z8Ecr5gPKE2vrYDX/ElrQAg4ORBrD92k49Opn
         kiNHg/L5sH0nOKaejlBuTpG3RxrC/iRE5fbFvcF7kXlEKooTSi7XylXfHy/M353dYq47
         N5W0ndio300JJeRAZluYBa7qz43xVggXxk3qaljG9qgwbuvnS/NnvuS0X+fHCj5T5kAu
         ykZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678195085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k5uCqAl9Xm0flZG8lUpKb/HpU//1nqOzOmKaeoAToxY=;
        b=RwSxR7lXTpxXr78dYuysXtmQKwrmyOlGJroBxjPTUCNGNdnEd9RH1vuRPoIz/25m9m
         gMvqW48Za/qNeLmoUEe+y/nNCQThyYLSNnGKJxEu2nisyBJr1ikXtkFkWJkOwIQrj/kB
         rBjiS1BU56BaelmVIvLGu1M3+mIUbNPB8mqRkMiThImNv2fcoHfRSkHP+PXB14qynXd2
         fuIuY+veYwd0gedPWc8rtc8KVe1iT73regaua/eJDYCeWORKsLoTMuPJtYdtGuzgQNj8
         bR+Wf/vWBTLo1pgBNMY/+hraa2lxtUADJPHmfrFeeBwXLcqpD+GeBtyYhhulVwKgP1RD
         BX9g==
X-Gm-Message-State: AO0yUKUJZoD82OdJjDxJHK01utyVri4N94ydvm1ZZnBmC3yGveV7aaEW
	h4Xn3EhFGzBBWu4+//pwkZgAZQ==
X-Google-Smtp-Source: AK7set+sf48Z1x9Twjo4/UtYaCPq2n7WfqDECv3mA/FXOO2VBENeCoItSPjO+/l/llf9yD/Hfnrw+g==
X-Received: by 2002:a05:600c:1c9c:b0:3ea:4af0:3475 with SMTP id k28-20020a05600c1c9c00b003ea4af03475mr12625363wms.1.1678195085337;
        Tue, 07 Mar 2023 05:18:05 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id hu21-20020a05600ca29500b003eaee9e0d22sm12986242wmb.33.2023.03.07.05.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:18:04 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 07 Mar 2023 14:17:35 +0100
Subject: [PATCH v2 06/18] arm64: dts: mediatek: add mt6357 device-tree
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230203-evk-board-support-v2-6-6ec7cdb10ccf@baylibre.com>
References: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>, Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linus.walleij@linaro.org>,
 Bernhard Rosenkränzer <bero@baylibre.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chaotian Jing <chaotian.jing@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Wenbin Mei <wenbin.mei@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mmc@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, devicetree@vger.kernel.org,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=8661; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=HYDSQjrzmppS4Sh8ePDV6mG17CdS6v+I0BsQmS8Sy2I=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkBzmE0WV3vAaIlul6oRjRlBoHjzA6uR25NKsRF4QU
 ybm0SpeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAc5hAAKCRArRkmdfjHURcpSEA
 CsvCOsugMZu6WROlsJvGW3k8kuI+0OawOXF0CvzMhJRB8ianWnGRxF2l5PP1Z7dvX3oFR+La5Icste
 8nwz7gHeqSdJP5T1USdB0llA1XRRPe9ISuCudGONf4/nsWh4AQwj6M0KlTQdtuvyzIrosTvWfzLL0G
 6hU+rw4q9AedFLDZgVwpCuxw3AtXlgxLSUt/xlFMCl76OzIOp6/T9m39yH+1r0BStOU7PsBcm8HCBc
 Yc9w3UdvE/9NaYq/rM1SNGNM8g2dV6Gc07oxDxDcJKNSQTklIpz3kjJoQ9LtTGfAs/Xo54H9Czpdah
 EXimfCObWbBoLZDvJhfi3sa5Qd1S5es52VpKytNp1KQQB7HuArCiOaZU+1NSFk2H036fRViGgNx6ZK
 pRL4TVIJ5gpS3qV9WbBhcdvFt0GSSB4/AcIJ+sMi20rF07+bB+KP+4IzSjlBiKUcQO6dtt2kgEWnoy
 Gk7cQlLXBzDXjn75pRN0AbEBjYgOf4U2GvU9z6KsFwcJbVZSG/FdwoJbD4SDbK5mprFjzR5Pi6nrFA
 e+8YnUeTTPuyBWvhBkUKVrp0QsUpgSrLc3TQ0f5wd18ER5xX1IzhcLrB8teJwL6uFn1Rhzcu5Ve+eH
 4ZY1BpaFJA2d0gWgSXXP1Bdmf1nFYMUeo0ZsEQcojQ+Atl8xDctnAEqSfdOw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_051807_190281_A98BE448 
X-CRM114-Status: GOOD (  11.57  )
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

This new device-tree add the regulators, rtc and keys support
for the MT6357 PMIC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt6357.dtsi | 282 +++++++++++++++++++++++++++++++
 1 file changed, 282 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6357.dtsi b/arch/arm64/boot/dts/mediatek/mt6357.dtsi
new file mode 100644
index 000000000000..3330a03c2f74
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6357.dtsi
@@ -0,0 +1,282 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ * Copyright (c) 2023 BayLibre Inc.
+ */
+
+#include <dt-bindings/input/input.h>
+
+&pwrap {
+	mt6357_pmic: pmic {
+		compatible = "mediatek,mt6357";
+
+		regulators {
+			mt6357_vproc_reg: buck-vproc {
+				regulator-name = "vproc";
+				regulator-min-microvolt = <518750>;
+				regulator-max-microvolt = <1312500>;
+				regulator-ramp-delay = <6250>;
+				regulator-enable-ramp-delay = <220>;
+				regulator-always-on;
+			};
+
+			mt6357_vcore_reg: buck-vcore {
+				regulator-name = "vcore";
+				regulator-min-microvolt = <518750>;
+				regulator-max-microvolt = <1312500>;
+				regulator-ramp-delay = <6250>;
+				regulator-enable-ramp-delay = <220>;
+				regulator-always-on;
+			};
+
+			mt6357_vmodem_reg: buck-vmodem {
+				regulator-name = "vmodem";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1193750>;
+				regulator-ramp-delay = <6250>;
+				regulator-enable-ramp-delay = <220>;
+			};
+
+			mt6357_vs1_reg: buck-vs1 {
+				regulator-name = "vs1";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <2200000>;
+				regulator-ramp-delay = <12500>;
+				regulator-enable-ramp-delay = <220>;
+				regulator-always-on;
+			};
+
+			mt6357_vpa_reg: buck-vpa {
+				regulator-name = "vpa";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3650000>;
+				regulator-ramp-delay = <50000>;
+				regulator-enable-ramp-delay = <220>;
+			};
+
+			mt6357_vfe28_reg: ldo-vfe28 {
+				compatible = "regulator-fixed";
+				regulator-name = "vfe28";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6357_vxo22_reg: ldo-vxo22 {
+				regulator-name = "vxo22";
+				regulator-min-microvolt = <2200000>;
+				regulator-max-microvolt = <2400000>;
+				regulator-enable-ramp-delay = <110>;
+			};
+
+			mt6357_vrf18_reg: ldo-vrf18 {
+				compatible = "regulator-fixed";
+				regulator-name = "vrf18";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-enable-ramp-delay = <110>;
+			};
+
+			mt6357_vrf12_reg: ldo-vrf12 {
+				compatible = "regulator-fixed";
+				regulator-name = "vrf12";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-enable-ramp-delay = <110>;
+			};
+
+			mt6357_vefuse_reg: ldo-vefuse {
+				regulator-name = "vefuse";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6357_vcn33_bt_reg: ldo-vcn33-bt {
+				regulator-name = "vcn33-bt";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3500000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6357_vcn33_wifi_reg: ldo-vcn33-wifi {
+				regulator-name = "vcn33-wifi";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3500000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6357_vcn28_reg: ldo-vcn28 {
+				compatible = "regulator-fixed";
+				regulator-name = "vcn28";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6357_vcn18_reg: ldo-vcn18 {
+				compatible = "regulator-fixed";
+				regulator-name = "vcn18";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6357_vcama_reg: ldo-vcama {
+				regulator-name = "vcama";
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6357_vcamd_reg: ldo-vcamd {
+				regulator-name = "vcamd";
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6357_vcamio_reg: ldo-vcamio18 {
+				compatible = "regulator-fixed";
+				regulator-name = "vcamio";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6357_vldo28_reg: ldo-vldo28 {
+				regulator-name = "vldo28";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <3000000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6357_vsram_others_reg: ldo-vsram-others {
+				regulator-name = "vsram-others";
+				regulator-min-microvolt = <518750>;
+				regulator-max-microvolt = <1312500>;
+				regulator-ramp-delay = <6250>;
+				regulator-enable-ramp-delay = <110>;
+				regulator-always-on;
+			};
+
+			mt6357_vsram_proc_reg: ldo-vsram-proc {
+				regulator-name = "vsram-proc";
+				regulator-min-microvolt = <518750>;
+				regulator-max-microvolt = <1312500>;
+				regulator-ramp-delay = <6250>;
+				regulator-enable-ramp-delay = <110>;
+				regulator-always-on;
+			};
+
+			mt6357_vaux18_reg: ldo-vaux18 {
+				compatible = "regulator-fixed";
+				regulator-name = "vaux18";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6357_vaud28_reg: ldo-vaud28 {
+				compatible = "regulator-fixed";
+				regulator-name = "vaud28";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6357_vio28_reg: ldo-vio28 {
+				compatible = "regulator-fixed";
+				regulator-name = "vio28";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6357_vio18_reg: ldo-vio18 {
+				compatible = "regulator-fixed";
+				regulator-name = "vio18";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-enable-ramp-delay = <264>;
+				regulator-always-on;
+			};
+
+			mt6357_vdram_reg: ldo-vdram {
+				regulator-name = "vdram";
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-enable-ramp-delay = <3300>;
+			};
+
+			mt6357_vmc_reg: ldo-vmc {
+				regulator-name = "vmc";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <44>;
+			};
+
+			mt6357_vmch_reg: ldo-vmch {
+				regulator-name = "vmch";
+				regulator-min-microvolt = <2900000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <44>;
+			};
+
+			mt6357_vemc_reg: ldo-vemc {
+				regulator-name = "vemc";
+				regulator-min-microvolt = <2900000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <44>;
+				regulator-always-on;
+			};
+
+			mt6357_vsim1_reg: ldo-vsim1 {
+				regulator-name = "vsim1";
+				regulator-min-microvolt = <1700000>;
+				regulator-max-microvolt = <3100000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6357_vsim2_reg: ldo-vsim2 {
+				regulator-name = "vsim2";
+				regulator-min-microvolt = <1700000>;
+				regulator-max-microvolt = <3100000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6357_vibr_reg: ldo-vibr {
+				regulator-name = "vibr";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <44>;
+			};
+
+			mt6357_vusb33_reg: ldo-vusb33 {
+				regulator-name = "vusb33";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3100000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+		};
+
+		rtc {
+			compatible = "mediatek,mt6357-rtc";
+		};
+
+		keys {
+			compatible = "mediatek,mt6357-keys";
+
+			key-power {
+				linux,keycodes = <KEY_POWER>;
+				wakeup-source;
+			};
+
+			key-home {
+				linux,keycodes = <KEY_HOME>;
+				wakeup-source;
+			};
+
+		};
+	};
+};

-- 
b4 0.10.1

