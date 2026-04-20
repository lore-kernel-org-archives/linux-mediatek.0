Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F510F5A8BC
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Apr 2026 21:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXtK/Bb6scSWKAWFi8Dh0zrFz4wUjG5d2vtkn8qVfbU=; b=f089nMux+uqPQGJ89MrAHVeIcy
	YLkQzwL6e3+YTzFEfC68RaHO+fv29+FchtNLZyz2/eGTSmEDGA3GuhdHfKJtsNmZIHduUhQGrjvp6
	ou7pQZQnfHOrvKn50HVKkeEEmA+Nip6l31qKkE6qQIuY9ZSnlImMevKJdygfN4nFBEpqZdExnK8tN
	PhM0CHrblosDWn7hnGNH7Ble3cf2ASlnnEaeQpDPVqlFn/AHMoCz+ZBD6aw2P7DR+d/QlWcnXP5Yq
	wzV3mFnGEuxZxXzEXerl4MTUjTINiuT2PC/YEPW/xIs/BltmN7S38v35GQj2lFA47tvEIj8tT6Iyw
	JPZ0e43A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEwMP-00000007kw7-1IpY;
	Mon, 20 Apr 2026 21:40:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEwMN-00000007kvg-0UJk
	for linux-mediatek@bombadil.infradead.org;
	Mon, 20 Apr 2026 21:40:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=pXtK/Bb6scSWKAWFi8Dh0zrFz4wUjG5d2vtkn8qVfbU=; b=A7vq/cwU8jd+pOtnmt/fSsY/xi
	38tg9ovCOi3nuICQI3UndmcThBT3fJnBAvgpeYXL80oupIHXfV5QAC+EK0NX7o7BtbrwJqeApNjF8
	A1kWn46R+90j+VS6ag2zVs71cqztHW2RdL1DBqLl0b8njWPEscY1lAOoPne4yIJiAifm7xSM3qVNg
	CCbNb9BgZDL0ehi7TPktsfu52c3VHTuYQPygViqbrvMkPXYXsqG+GsknmJ6DlNby71W5kn0XcD7g4
	t3Jtf9XmgiHWPQhJk1ZtiUkudUtJ4CosUbULMibK2FrGlY2DYdTCGNaMgX5uPilHDGAckdVN4aVL7
	HAPfxkeA==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEwLh-00000008rta-0POW
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Apr 2026 21:40:46 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so55438975e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Apr 2026 14:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776721207; x=1777326007; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXtK/Bb6scSWKAWFi8Dh0zrFz4wUjG5d2vtkn8qVfbU=;
        b=CiZ5mpr3OC6hQwBuhi4OAMuF1PTWMumgazKJWSqRcFOyfto80ZiqsZ+isF8ROGzK8+
         ocKizVKKIbyzFAY1xVaLJD3EcJiomaGhl7ddaPjcHvJlab3Cad2WahvUUI88nWQjD6oS
         J+hb972lHQU2xk92yL/6xfp7cX1rAMwQHhbiIU2TSZ+0E70p812BVgb9dB/X/Z3F4Yju
         tGpMLuYGLc/7HRihdvjDJD3QeDmQPe/4i1fr9gy7UhS0LDUG0plDoR/3MCpzH0LQIYkj
         L/fQBLYk9xpncfI+K4F6XETfwk1VbAouDhWY/jeAwj3+hdEjGWAILoS7lzm6IGzzV+5h
         YP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776721207; x=1777326007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pXtK/Bb6scSWKAWFi8Dh0zrFz4wUjG5d2vtkn8qVfbU=;
        b=pM2i5idrYMLEOwqWT0oF95GjDhVCIiaPYwaZsgK7KgUk42ebYuJ1iHygNq92M9xTj+
         RSAkHif3PIKHnJ68KbjQ8nxw9kfeZxdEKhwml+Kx53TuQvmYwLaO7CZa+EuoqZQCH6NG
         6GNguexQxtGet0VGxyLzGgpre/YTwqOjsVjn6Wz1EFZzzgK8Dwn8oX+XhkXxWcYVPSkN
         LwLQHh0zE7Ww//XTsFDTkR/ZY42URaLpZR09bbfXWft7O/+uCP9f9Gajr9SIqRhspfqW
         Omb9TSx52sbJe3jqhdOllzBQuKndCqQBhW3VyQp1AfaEgXGokdjPy6d+0MbFSKdoJQRS
         K/mQ==
X-Gm-Message-State: AOJu0Ywk+K3+Qs+ezW2bST78F+2Jl2HNaQd7fD08VC9I/8BxSD5laHTZ
	kSNyRK0jDhnTpQfkhluWDjsUznGCkTKRwxNsxGF00rWA7K7gNzInWGaWXsqf8c3V
X-Gm-Gg: AeBDietUW/LMXpj6xXPATtMaIkOUiCFDLyMGfARZBKnmbBNDaspudG879Zk5OKfCrrc
	oSkA83xQ7rKu1fFC3yj5e6bRS7v6wmVJgvHrus2rT37ZearhOIPXhl0/066ku7cIhcySwHscJkB
	k2VSNcNDpzXUS/Zi89D6OFaSUij0lJ3rtgIIydVdDi/Knfvz7D6M93BDJVZyHuyKF6+Ik2xU1H7
	bgwXsWTdXIJSXk6+lY2/HBG75fuonDO2vELp+8egkZqrmC24F82UFSY4Mr9OPwN7pO2QqjosPZR
	sMPsiy1By26jXbA27jT1QwGXHkrYsTA6oYwwshVamhqCGmfGwEoXCVow8nzTgiw4/rsVE5Rirdu
	UIz+3kefky1kWB5R3Z3Z7/OiATDv0UQutlwoYVMm8wzHhSVacqkyEVKgWoVh+Gj97Et2TwqgJPb
	btIwP4hYvm1Er8Ekb6f2u1lcQEPwlsCA==
X-Received: by 2002:a05:600c:4f13:b0:489:1a65:dd6e with SMTP id 5b1f17b1804b1-4891a65de3emr105875175e9.8.1776721206634;
        Mon, 20 Apr 2026 14:40:06 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc140c82sm289500355e9.12.2026.04.20.14.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 14:40:06 -0700 (PDT)
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
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Gary Bisson <bisson.gary@gmail.com>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v5 9/9] arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi
Date: Mon, 20 Apr 2026 22:30:08 +0100
Message-ID: <20260420213529.1645560-10-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420213529.1645560-1-l.scorcia@gmail.com>
References: <20260420213529.1645560-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_224031_019934_6D26E57E 
X-CRM114-Status: GOOD (  13.66  )
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
 arch/arm64/boot/dts/mediatek/mt6392.dtsi | 73 ++++++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/mt6392.dtsi b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
new file mode 100644
index 000000000000..750ee9b2856f
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
@@ -0,0 +1,73 @@
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
+		compatible = "mediatek,mt6392", "mediatek,mt6323";
+		interrupt-controller;
+		#interrupt-cells = <2>;
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
+
+		pio6392: pinctrl {
+			compatible = "mediatek,mt6392-pinctrl";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		rtc {
+			compatible = "mediatek,mt6392-rtc",
+				"mediatek,mt6323-rtc";
+		};
+
+		mt6392regulators: regulators {
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


