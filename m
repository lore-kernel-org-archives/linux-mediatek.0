Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4562CD1296
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 13:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IGsqJQWF1Ucte73TGgl0P2Cl+B2DHbp3lE/2oPwQwY0=; b=ph8wWwHjjVrYHTtyPcdSNytXNA
	spHSVlGjsQzQeHDOAfhO9DvTRQy9tjCvEtz4A1VYCH47V5xlg0usTiRypRh+VIDA4ssnxqNd4iP/1
	klF77qmmuf5X6TcurV9zv75hPCUA6cTVckPZHUZsRdzIQ9jR99O+dpj7fWa693a7kJUKIBvVlLJKv
	DcilAH8gJKet3bwI1e/P7RJXzLM/R7mdpZoaPx4+FSa+EKBD2c96erJ+mtTdLHfRxiYrhd/pqRfE2
	/g7vVRrWBe4OP1Uyjd+o1W7mHfRC8G/qHBUWV/OFU4Y95Y7n0Rd9WIGk4KAI11AczwD6D9Ttp+U6u
	HFXQGG5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBmM-00000002DrG-1NuL;
	Tue, 09 Apr 2024 13:44:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBkO-00000002CWP-42Xw
	for linux-mediatek@bombadil.infradead.org;
	Tue, 09 Apr 2024 13:42:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=IGsqJQWF1Ucte73TGgl0P2Cl+B2DHbp3lE/2oPwQwY0=; b=RNniikh1m4fOeVhWj1qqjIgd83
	bIaVScLckIl8yz85vEmNTkJkZ5tEqSq5aFvjbvbQQN44/fP5U291Yl5X7mQeKZj0b3lRzf8Q9XEhr
	k7YQxrBDjpMPSKOVZUmNPR2Qx9/jPLyp0wW07oRuUlNURvbaOtSk5HAoJUqaQx10xpm/xlYb4wVAy
	qn+MObECBc/khLvCft4RytwTaauGy0GGr3flRWQKSsEWzUnE/lqtgE1Z0Gd7+3z/WpM/l3gTu0r+g
	+hSkJKyN2GTd5XUdRXBukusRpucxcOT3ArpcoJ7TMgGkQCcY+a84hpD/vSIIwwEQdRNsdPVU0Nk/U
	UeC2rl9w==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBkJ-00000002E3M-1gcK
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Apr 2024 13:42:47 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-416923f05faso9840595e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Apr 2024 06:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712670160; x=1713274960; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IGsqJQWF1Ucte73TGgl0P2Cl+B2DHbp3lE/2oPwQwY0=;
        b=w1fTzqdd9hyrEZtU2aGm3FP8FY8g6BAOZX/cj1eaEn7E6g65t3IRyeLEwT5c6NtClI
         6C0EtZcsN2fzDBCMTSH/k3Zm5b1UavL1AcH6jJbh0EbhUQZsbkNKpPihb1qjcpV6mDGx
         QGKbOFfFXR5CsmQW+TUQjhjOpOrpbqN1n6slK2vi30R4vuRI4IDCxG9jeNesjxd9TIHl
         N/wY/yc6mjyOBJadDgnsjfDdLTKtKi1jh2lIMtYXVW5qd5aiZGG4iVQ0TqAe3nSCEHQ3
         yZBPym3EjWTBRtGdhwSHy07QcKdUXKyKog4ZLi3nNFvr7jEy87Y8qO8W0uYDZiEVxs/C
         NSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712670160; x=1713274960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IGsqJQWF1Ucte73TGgl0P2Cl+B2DHbp3lE/2oPwQwY0=;
        b=JdSznLAp9v6FbvrnVO3jVuVwZ+DMi1MK+r3SuuI3D5mT7oKs9s5zZdKybAdE/Aow5q
         JuXKehkbCiDMdKpi+RTHlwnEDETN8OSSmnpu5Vb5aDpoDQXXndX/KV/NF3tnsxZZxlXG
         qZqSTxdlLjcdxYnmcBp37H1tKoeReY9Cl7sUpg9ILWXHwe3Pv/uKPXb0QaoYwEmpU8Qm
         xANdRjiMsFe9vJ28a1PfIXT6yF2iGrZF5pnZq1wsNSE1F631ZBTkoOBtegNiRDRso2pq
         /ytLgyhNCEYIjiqTv+oTbnC1eKncaD/rSjXryc5ZSA70BYPgeQnLIJathzeoAartmkTB
         Aa4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWCoVTBLki3DCxywefw2hZQpK9AjYVcrm+96twijI9hi9LB8KscpWStLcapWLV4yVCgonUjUPHETcXGC9rh43odn1PNMQO8iwbnYcZ50JyCB9aw
X-Gm-Message-State: AOJu0YxjJx3Sr81OFHuHWBwd4Y4rLMh32ZYNarLqjcL9TZIZreo+cCw4
	0a1vhBkPMvDior7vnLlEo+yHE5+xRoFlWXMJX58kT1YP2lvt+J+ZJ3qdw4pdzBc=
X-Google-Smtp-Source: AGHT+IG/iRx5ir5/ovsIbMfS8mk5u5aphffFDwTLsfaRoOPMCr5c7spDQQ+GP6mftM7G0850xXAw/w==
X-Received: by 2002:a05:600c:4e0f:b0:416:7b2c:def5 with SMTP id b15-20020a05600c4e0f00b004167b2cdef5mr3740530wmq.2.1712670160253;
        Tue, 09 Apr 2024 06:42:40 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id j11-20020adff54b000000b003433bf6651dsm10753579wrp.75.2024.04.09.06.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 06:42:39 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 15:42:16 +0200
Subject: [PATCH v3 18/18] arm64: dts: mediatek: add audio support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v3-18-16bb2c974c55@baylibre.com>
References: <20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com>
In-Reply-To: <20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3971; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=rmUU5KQQDjsuNrCnoS100FfCSVwtHEsMKsd4Yeoncng=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFUWs/X4+9lZbZVVrgUXvJF36fOR5nf9HCXtFKmub
 Eojk7WmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhVFrAAKCRArRkmdfjHURc0wD/
 45bfDP54YfMymdYp1DrRTulxgf6GxTPMlbsmaYC/6cJOUqee8t+L9WtVMsNrp7t8LfGDU3lDY7DoRr
 6vNEioghcUnEv+Mc+SYl7wFoedQoAppu/BpfM70howwkJ2UVm+SUAzqgTjvtOwwEC4VY2h8X56zN2a
 LfJm6Zfjo5fE8H7XpUOf7F5E7EUR+eDKbDRrgA96OEuRy99jQrKasVCr+2ZDGx06J2yHrMAItWA7lb
 sR4Hy+3BRmHw710Xr0eta3e+SAHhqmDqcg9GQz8edgyqoFrmfhDzrsKuaRgVJksRLvo0/fyJhh8BWm
 ggJ6j0JO/EvFhhPG8VtKzyOpEtPw87GXwpdiBAHKbfVAGFgbK5oX6uA0oP78kar8WPv1YAloDpEsx+
 oT+0QUuFzIu5TZjr2P00CZGUA+c1VVw7I5E1v7M1a0OwqRmjxd2H52CWPX0pxnkYQ+ZWfJOWqaZEfP
 JXM3aiqQLbew/R2iwVrMQlh0VkmWg0D5y+oSaN/yZFTY6Z12MNzp+ylKx34w6s4Nuw8dpsS1At7YxO
 Y3NzNjq61mtNk2oI6AIFWkeDyXsCWAYYySPd52T6MeQ79lwvWkBgUBURjyZQ0LiXHZomCM5OOEkckg
 92hqaIi3kf8aFt6cxW2WzEKL1eAKxDEaYjMgHhcYn6CjpygtttRwko/+RTGw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_144243_528363_BCCAFFAC 
X-CRM114-Status: GOOD (  10.55  )
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

Add the sound node which is linked to the MT8365 SoC AFE and
the MT6357 audio codec.

Update the file header.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 98 +++++++++++++++++++++++++++--
 1 file changed, 94 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 50cbaefa1a99..eb0c5f076dd4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -1,9 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2021-2022 BayLibre, SAS.
- * Authors:
- * Fabien Parent <fparent@baylibre.com>
- * Bernhard Rosenkränzer <bero@baylibre.com>
+ * Copyright (c) 2024 BayLibre, SAS.
+ * Authors: Fabien Parent <fparent@baylibre.com>
+ *	    Bernhard Rosenkränzer <bero@baylibre.com>
+ *	    Alexandre Mergnat <amergnat@baylibre.com>
  */
 
 /dts-v1/;
@@ -86,6 +86,29 @@ optee_reserved: optee@43200000 {
 			reg = <0 0x43200000 0 0x00c00000>;
 		};
 	};
+
+	sound: sound {
+		compatible = "mediatek,mt8365-mt6357";
+		pinctrl-names = "default",
+				"dmic",
+				"miso_off",
+				"miso_on",
+				"mosi_off",
+				"mosi_on";
+		pinctrl-0 = <&aud_default_pins>;
+		pinctrl-1 = <&aud_dmic_pins>;
+		pinctrl-2 = <&aud_miso_off_pins>;
+		pinctrl-3 = <&aud_miso_on_pins>;
+		pinctrl-4 = <&aud_mosi_off_pins>;
+		pinctrl-5 = <&aud_mosi_on_pins>;
+		mediatek,platform = <&afe>;
+		status = "okay";
+	};
+};
+
+&afe {
+	mediatek,dmic-mode = <1>;
+	status = "okay";
 };
 
 &cpu0 {
@@ -174,6 +197,12 @@ &mmc1 {
 	status = "okay";
 };
 
+&mt6357_codec {
+	mediatek,micbias0-microvolt = <1900000>;
+	mediatek,micbias1-microvolt = <1700000>;
+	mediatek,vaud28-supply = <&mt6357_vaud28_reg>;
+};
+
 &mt6357_pmic {
 	interrupts-extended = <&pio 145 IRQ_TYPE_LEVEL_HIGH>;
 	interrupt-controller;
@@ -181,6 +210,67 @@ &mt6357_pmic {
 };
 
 &pio {
+	aud_default_pins: audiodefault-pins {
+		pins {
+		pinmux = <MT8365_PIN_72_CMDAT4__FUNC_I2S3_BCK>,
+			 <MT8365_PIN_73_CMDAT5__FUNC_I2S3_LRCK>,
+			 <MT8365_PIN_74_CMDAT6__FUNC_I2S3_MCK>,
+			 <MT8365_PIN_75_CMDAT7__FUNC_I2S3_DO>;
+		};
+	};
+
+	aud_dmic_pins: audiodmic-pins {
+		pins {
+		pinmux = <MT8365_PIN_117_DMIC0_CLK__FUNC_DMIC0_CLK>,
+			 <MT8365_PIN_118_DMIC0_DAT0__FUNC_DMIC0_DAT0>,
+			 <MT8365_PIN_119_DMIC0_DAT1__FUNC_DMIC0_DAT1>;
+		};
+	};
+
+	aud_miso_off_pins: misooff-pins {
+		pins {
+		pinmux = <MT8365_PIN_53_AUD_CLK_MISO__FUNC_GPIO53>,
+			 <MT8365_PIN_54_AUD_SYNC_MISO__FUNC_GPIO54>,
+			 <MT8365_PIN_55_AUD_DAT_MISO0__FUNC_GPIO55>,
+			 <MT8365_PIN_56_AUD_DAT_MISO1__FUNC_GPIO56>;
+		input-enable;
+		bias-pull-down;
+		drive-strength = <MTK_DRIVE_2mA>;
+		};
+	};
+
+	aud_miso_on_pins: misoon-pins {
+		pins {
+		pinmux = <MT8365_PIN_53_AUD_CLK_MISO__FUNC_AUD_CLK_MISO>,
+			 <MT8365_PIN_54_AUD_SYNC_MISO__FUNC_AUD_SYNC_MISO>,
+			 <MT8365_PIN_55_AUD_DAT_MISO0__FUNC_AUD_DAT_MISO0>,
+			 <MT8365_PIN_56_AUD_DAT_MISO1__FUNC_AUD_DAT_MISO1>;
+		drive-strength = <MTK_DRIVE_6mA>;
+		};
+	};
+
+	aud_mosi_off_pins: mosioff-pins {
+		pins {
+		pinmux = <MT8365_PIN_49_AUD_CLK_MOSI__FUNC_GPIO49>,
+			 <MT8365_PIN_50_AUD_SYNC_MOSI__FUNC_GPIO50>,
+			 <MT8365_PIN_51_AUD_DAT_MOSI0__FUNC_GPIO51>,
+			 <MT8365_PIN_52_AUD_DAT_MOSI1__FUNC_GPIO52>;
+		input-enable;
+		bias-pull-down;
+		drive-strength = <MTK_DRIVE_2mA>;
+		};
+	};
+
+	aud_mosi_on_pins: mosion-pins {
+		pins {
+		pinmux = <MT8365_PIN_49_AUD_CLK_MOSI__FUNC_AUD_CLK_MOSI>,
+			 <MT8365_PIN_50_AUD_SYNC_MOSI__FUNC_AUD_SYNC_MOSI>,
+			 <MT8365_PIN_51_AUD_DAT_MOSI0__FUNC_AUD_DAT_MOSI0>,
+			 <MT8365_PIN_52_AUD_DAT_MOSI1__FUNC_AUD_DAT_MOSI1>;
+		drive-strength = <MTK_DRIVE_6mA>;
+		};
+	};
+
 	ethernet_pins: ethernet-pins {
 		phy_reset_pins {
 			pinmux = <MT8365_PIN_133_TDM_TX_DATA1__FUNC_GPIO133>;

-- 
2.25.1


