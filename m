Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8ABEC110E
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Feb 2026 17:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cjndx/viWwHPLwXhm0pJTNs0ZpyDgThJGXcIfdXyo2Y=; b=YeVEHPzTsIhSzIvYPwtxbgLoZV
	Ld5d2kNlAGAlU57L0bh/Fv3w30tEl99bqoQNkdantGci/RLxmod6VW+xA9sPOHpSbtixlaWEtQxLD
	rP6W7ni2LLnbGmzwWHJBerq1NFM+3P5ueG+y/El6jrbeykIUpDDdEtLg0yjC1PVemGHQkw/TdUvyT
	0p0iwmZz+kE0PiISX5vfhHHu1dcvLO1SDTZbg9kkuYcyOGq5JwK33mKM62EWRIYIwG6m8nkLsr/LF
	ILAt17gFETl9mOLjI1ImaUidCHG7hhpH38ao+LjUJy4ordgA10r3h6tNE++fJHnI9+i26JNSz8/u0
	E82SxQTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZa1-00000000kb1-2kiJ;
	Mon, 23 Feb 2026 17:18:45 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZZy-00000000kXV-3egc
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Feb 2026 17:18:45 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-43591b55727so4505561f8f.3
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 09:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771867121; x=1772471921; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cjndx/viWwHPLwXhm0pJTNs0ZpyDgThJGXcIfdXyo2Y=;
        b=nTQKPuqCQbgyrdI+nr36MYzlMulef8y/RCIdb6ncPEfyjgs+wg/FrPjtqQ143rF/VF
         4UTCP8AlPo16VoJ8wUpsDaih1vFNhrHzJdnD9xivgqb9B4BQfCWcKcT+5xcIqyKziek4
         6G5Lzd1RlqOvcQduMFJOfq0nKUHDlRZ+6SOJaoCC1lk37BZagMUlQ2lHswSu6dFJPzaZ
         rm8QaATt7rpWxQ/64z/3Xw/QhhCdezKl3DvYFM4XH8uomUWrce6U+pOw2RHXgACDB6DN
         wMyPid6N+4HOcXz8zhZLdaVRi8sl9BGiGkXCV6b0ZY7npd5vIRHCs5RQermNB33UE9lb
         kjBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771867121; x=1772471921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cjndx/viWwHPLwXhm0pJTNs0ZpyDgThJGXcIfdXyo2Y=;
        b=vrQupPBHXlAH1sHAy0C796VZo00IhJ7+rHz0T9t5aePtS0f+aye0LsabEAnPGiTEkQ
         JjYEoWa4QmLMZ0D6e+xflzTk/bY2Mdgc6EXX6sKZMLjnDE42HIHbIxf7Lla1kl4/y2o2
         3dSlmg4ud2yy3fIpvS6olBftmqwEOPbQAe3RKKnk85QkbIU2JHE7b7BUZMyUTA/7LF0w
         GBlC7y4Su59KXjtrCPn3c6BCi62+Dl2di054qxiGhA6tBTDuYpglHcWplltYBy+ebOle
         DGp7Y5yw+WDWR88oNrbiJYpc+pebOOtw/lEUkezE51+jeRvxByFgn7GUZEMahQdj2Ia/
         DJdQ==
X-Gm-Message-State: AOJu0Ywck1ZGUESCAJLEWuuTAAk1hTH+Yyojc6rsBWwpFs4B9Rk3ipqr
	AlZ64iqfOgmJvGIkckL4BUKiYKFjfW2G78ZwuDAJE0BgE+4CnEtVJ5s0+UfaOw==
X-Gm-Gg: ATEYQzw/xnPVboCM9NtJR0uY64ii3+TF5kqXIwUY9BHYgb8hPpsTNKS8kdWkreaCMKP
	vMiHtF6JuSsvb5JppC+v091BYW8WC3yF+VYdB0kFxRRt+wIfwo1pp6sG5imeiKT8dBOxMhkajMV
	TpeNFOEYSBJ9BliTbkCf5TkZH1ZlTpszRmfb0dt2IF2JGf2N/CikgKJGb0dJkbtxVt4mXVBiD4n
	eHcQfNfqcm3khDBXpK+qFsTlYaIWpEBj3ZhHtg4AxJHc2P5AaOfZrXk+VC5ol461ZcSB46ETVIk
	qXlVvRmEK1eAn6vncLcBir6Qka1lRCH2Wgf0jSRHxYe8HwJx2/zxYcd5kLPc+UrKpjHjfvoK2Bt
	kN7q28z+N7vzCKaMPPQ2TwJSxvsf1303iENQvrjnor+IPk9+C5TrThbSyNfYx7Z26YKXPqZ2d0R
	t9/AinixOTpfHASBKBM/4=
X-Received: by 2002:a05:6000:2dca:b0:431:369:e7b with SMTP id ffacd0b85a97d-4396f157e6bmr19371413f8f.18.1771867120734;
        Mon, 23 Feb 2026 09:18:40 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c982sm20871454f8f.31.2026.02.23.09.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 09:18:40 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Fabien Parent <parent.f@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH 9/9] arm64: dts: mt6392: add mt6392 PMIC dtsi
Date: Mon, 23 Feb 2026 17:12:48 +0000
Message-ID: <0eaee8c3be8dc848314b2e9aaac9303659fc2a49.1771865015.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771865014.git.l.scorcia@gmail.com>
References: <cover.1771865014.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_091842_939295_649A7DA8 
X-CRM114-Status: GOOD (  12.65  )
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

From: Val Packett <val@packett.cool>

Add the dts to be included by all boards using the MT6392 PMIC.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt6392.dtsi | 133 +++++++++++++++++++++++
 1 file changed, 133 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/mt6392.dtsi b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
new file mode 100644
index 000000000000..d0d86ae0f073
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Copyright (c) 2024 Val Packett <val@packett.cool>
+ */
+
+#include <dt-bindings/input/input.h>
+
+&pwrap {
+	pmic: pmic {
+		compatible = "mediatek,mt6392";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		regulators {
+			compatible = "mediatek,mt6392-regulator";
+
+			mt6392_vproc_reg: buck_vproc {
+				regulator-name = "vproc";
+			};
+
+			mt6392_vsys_reg: buck_vsys {
+				regulator-name = "vsys";
+			};
+
+			mt6392_vcore_reg: buck_vcore {
+				regulator-name = "vcore";
+			};
+
+			mt6392_vxo22_reg: ldo_vxo22 {
+				regulator-name = "vxo22";
+			};
+
+			mt6392_vaud22_reg: ldo_vaud22 {
+				regulator-name = "vaud22";
+			};
+
+			mt6392_vcama_reg: ldo_vcama {
+				regulator-name = "vcama";
+			};
+
+			mt6392_vaud28_reg: ldo_vaud28 {
+				regulator-name = "vaud28";
+			};
+
+			mt6392_vadc18_reg: ldo_vadc18 {
+				regulator-name = "vadc18";
+			};
+
+			mt6392_vcn35_reg: ldo_vcn35 {
+				regulator-name = "vcn35";
+			};
+
+			mt6392_vio28_reg: ldo_vio28 {
+				regulator-name = "vio28";
+			};
+
+			mt6392_vusb_reg: ldo_vusb {
+				regulator-name = "vusb";
+			};
+
+			mt6392_vmc_reg: ldo_vmc {
+				regulator-name = "vmc";
+			};
+
+			mt6392_vmch_reg: ldo_vmch {
+				regulator-name = "vmch";
+			};
+
+			mt6392_vemc3v3_reg: ldo_vemc3v3 {
+				regulator-name = "vemc3v3";
+			};
+
+			mt6392_vgp1_reg: ldo_vgp1 {
+				regulator-name = "vgp1";
+			};
+
+			mt6392_vgp2_reg: ldo_vgp2 {
+				regulator-name = "vgp2";
+			};
+
+			mt6392_vcn18_reg: ldo_vcn18 {
+				regulator-name = "vcn18";
+			};
+
+			mt6392_vcamaf_reg: ldo_vcamaf {
+				regulator-name = "vcamaf";
+			};
+
+			mt6392_vm_reg: ldo_vm {
+				regulator-name = "vm";
+			};
+
+			mt6392_vio18_reg: ldo_vio18 {
+				regulator-name = "vio18";
+			};
+
+			mt6392_vcamd_reg: ldo_vcamd {
+				regulator-name = "vcamd";
+			};
+
+			mt6392_vcamio_reg: ldo_vcamio {
+				regulator-name = "vcamio";
+			};
+
+			mt6392_vm25_reg: ldo_vm25 {
+				regulator-name = "vm25";
+			};
+
+			mt6392_vefuse_reg: ldo_vefuse {
+				regulator-name = "vefuse";
+			};
+		};
+
+		rtc {
+			compatible = "mediatek,mt6392-rtc";
+		};
+
+		keys {
+			compatible = "mediatek,mt6392-keys";
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
+		};
+	};
+};
-- 
2.43.0


