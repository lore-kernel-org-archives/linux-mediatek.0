Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4447FCD98CE
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2026 07:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XxNDmIjOo02FnryXUeGSfIeICYAKAZhZUNgYnH1QQ5E=; b=yJ51NmBGIvNZB6hICy5nfNrDqr
	Z/zN/iNrhQlTrF8LQR/wtUCJIjx7L3AMYrYI7EgrjGv4uw/M0OHpAFpKA5KTP8lmb3JgICSycPZ8+
	iQ4x607UkoEpLhGTB3041rWos9bDiFvgmtSqlfQZdmC493X9YSDhTHMbADIyoeXUNsZ4a0uoisxw0
	E60Y9Pe3kQ8H3dVb70vDkw7gLu76DVlwXTDjiuz88+nxl6TwsRr3jOA/EqZeqs46OoNhr0xIZL8DJ
	Nit1z2a34hic0zEZkA6rAQDgBGz5vxK0PBcQE3j3HHj1vsPJe/kmq3U/XiQPc3JxEacBhXwDBsEjQ
	vbYQv5bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1cp-0000000DmJ1-1Zk7;
	Mon, 15 Jun 2026 07:20:51 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1cm-0000000DmGa-1mCe
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Jun 2026 07:20:49 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-490afc47455so12270305e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Jun 2026 00:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781508047; x=1782112847; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxNDmIjOo02FnryXUeGSfIeICYAKAZhZUNgYnH1QQ5E=;
        b=ojQCqpEU5K0szPTqdtSPm6nWSGI42NicC9yZI6IxBamQctDLmCpaA+4j9qJPVioiXh
         IAUHkNSUgguZ2FkY77xDY/y4ZpZ3Lsn/CA9EqxR4nGCPUrUGDIwo+83dtUjv/GhcmdcK
         0YBUvS4DLiGP15OdlPK73Cn2QJN5MUu+SnwLTiTMtbkKJJ7Dbj/6a1kWk7UcTsm6D4Gb
         f/akJ4kZfNxyncKEaG2G6XSIbHQlI0Hh167Z2xRq0kKFPA6AeecPpToiiO1K3kh5SS4b
         59NSXbjpGlfi5rVcujJkXwsafaWvcbXuiQyJXyGAqbmNu6yvwN+wcRGWDjnp6aKQ6SnE
         EYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781508047; x=1782112847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XxNDmIjOo02FnryXUeGSfIeICYAKAZhZUNgYnH1QQ5E=;
        b=pwGid7iT3YeB9oGXWDqi5mTIvNbxykxF2d2/hoKPEU6whwubD15O2BGc4T4H/uKEWm
         RTusv2hmnZn/BSWarwSfdKKZ0DZp1IYelbnne3nebR5VGowpBl1DMjr9teOdOwcrZJCb
         juZE1NWsNMCFtRyw9uPuwwaFTl2BZzbNxY4pGjoZGiS6G0OwfB2wRifqgmx0GULs7PiY
         SoZd+h8i7sPbvQ3qLyXK8P9nhqDB/t0q1OUEJ9cHuzFeLBw48VIKY6BcWbceDYyhRY1x
         XMppJJJHYHwfk7NxVEaIA8YD/yeOKyjG0Rbp43lEerpDCRFZ6RTFhbpGfdULEH5iFCxM
         Xvow==
X-Gm-Message-State: AOJu0YywtoBQ5Vn3VbsdQ6L7zw9vZNeAjkNfygqShE9NmK8ervbm8/aS
	U2GtAu3a5RWkcK347g/q1g8C8YDMqO36lodP/m2+UudVPMT10rHF7EIEr9DRXlIe
X-Gm-Gg: Acq92OEKbC3cwdXwTykbxk+Qt0bMfwkUx0x5UXqwRR1cctVeIcLdc/7eRBB26DXOylG
	nOdWq8DTMUsQVtXz2cmxgzO1cJBSl0jiy4WLUrdHIoB+FtR3q5h15h4DIaRTo+xGDO8HinRX8Fy
	BYWUQNFZZYTZ7ScPWEkUs/sO5yz3m46uuFy/rS3GDzr+i223zDpcm3mcAZ7OaOB7w4VzKMtNHPT
	ZEbYSXJAf1kHriWliJaNDBLVwzjUIO3Y19fIbUVvEs8GznL5wkaKCjSb7WSPPnATjR1YbnNqlLK
	tk/N/zEUR85llkaKZSnifiHLHiYA76CI2G8M4vGaIM05G+yMqZgacQ5NHpHQ1yX8OIMyMk54oiN
	hPPj679BueUls929BPYNCRiHooVFyJvtK3QGaOxFSiDs0IM3ntdqtKI55v4iPzBBsWAL5tfM+9q
	ROthCZt4iZYfvE0mZE
X-Received: by 2002:a05:600c:138e:b0:490:d354:bd00 with SMTP id 5b1f17b1804b1-490ec507db7mr173245075e9.25.1781508046667;
        Mon, 15 Jun 2026 00:20:46 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203c0801sm200181015e9.10.2026.06.15.00.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:20:46 -0700 (PDT)
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
	Linus Walleij <linusw@kernel.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v7 9/9] arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi
Date: Mon, 15 Jun 2026 09:16:15 +0200
Message-ID: <20260615071836.362883-10-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615071836.362883-1-l.scorcia@gmail.com>
References: <20260615071836.362883-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_002048_504466_E35D3EF9 
X-CRM114-Status: GOOD (  13.92  )
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

Add the dts to be included by all boards using the MT6392 PMIC,
providing support for regulator, keys, pinctrl and RTC.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt6392.dtsi | 75 ++++++++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/mt6392.dtsi b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
new file mode 100644
index 000000000000..81f15d76a05a
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Copyright (c) 2024 Val Packett <val@packett.cool>
+ * Copyright (c) 2026 Luca Leonardo Scorcia <l.scorcia@gmail.com>
+ */
+
+#include <dt-bindings/input/input.h>
+
+&pwrap {
+	pmic: pmic {
+		compatible = "mediatek,mt6392", "mediatek,mt6323";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		mt6392keys: keys {
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
+
+		mt6392pio: pinctrl {
+			compatible = "mediatek,mt6392-pinctrl";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		mt6392rtc: rtc {
+			compatible = "mediatek,mt6392-rtc", "mediatek,mt6323-rtc";
+		};
+
+		mt6392regulators: regulators {
+			compatible = "mediatek,mt6392-regulator";
+
+			/* Fixed supply defined in the data sheet */
+			avddldo-supply = <&mt6392_vsys_reg>;
+
+			mt6392_vcore_reg: vcore { };
+			mt6392_vproc_reg: vproc { };
+			mt6392_vsys_reg: vsys { };
+			mt6392_vaud28_reg: vaud28 { };
+			mt6392_vxo22_reg: vxo22 { };
+			mt6392_vaud22_reg: vaud22 { };
+			mt6392_vadc18_reg: vadc18 { };
+			mt6392_vcama_reg: vcama { };
+			mt6392_vcn35_reg: vcn35 { };
+			mt6392_vio28_reg: vio28 { };
+			mt6392_vusb_reg: vusb { };
+			mt6392_vmc_reg: vmc { };
+			mt6392_vmch_reg: vmch { };
+			mt6392_vemc3v3_reg: vemc3v3 { };
+			mt6392_vcamaf_reg: vcamaf { };
+			mt6392_vgp1_reg: vgp1 { };
+			mt6392_vgp2_reg: vgp2 { };
+			mt6392_vefuse_reg: vefuse { };
+			mt6392_vm25_reg: vm25 { };
+			mt6392_vdig18_reg: vdig18 { };
+			mt6392_vm_reg: vm { };
+			mt6392_vio18_reg: vio18 { };
+			mt6392_vcn18_reg: vcn18 { };
+			mt6392_vcamd_reg: vcamd { };
+			mt6392_vcamio_reg: vcamio { };
+			mt6392_vrtc_reg: vrtc {	};
+		};
+	};
+};
-- 
2.43.0


