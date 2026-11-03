Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D74606A32C
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 07:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2ozM+5UO;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kx/CIC3T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tfbhdXr+xU9IHzzXCCLrrQtJWTVcaGZ00j5M2dfE53A=; b=2ozM+5UOi4o0Qw
	AHJ4BuEPImhHZap3NdVQEuz17UC62ywNm6WOHcr688w2IDD6gU5K3ElemPJU40o3Or0AmsA/pBmfF
	HZ2iKnk27WqSfi5OW9y+YEIaKzRCplOUsOgOvR5xAa4PgeY1woa572nKOCUJ8RqiiYdfcqfgvEDtt
	gCp37w3en28/nNkGY3YIm8f/a96aeuKLrcjwl+u+XgOpad2yr+3Typp11F4nvPDg6fi19o2C5iy9U
	NNwTReIwO9YLs3pMHiSn+9Hx5pzebVmPpIq6BGSJVrYmwWRP1tHZiK90lqrrMcqdKvoMhR2umWiqd
	uRcgZQP9W/+wxRXd1LkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9AR-00000001OOT-1Fpq;
	Tue, 03 Nov 2026 07:42:51 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO99Z-00000001N8K-04ml
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Nov 2026 07:42:12 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so3016657a91.3
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Nov 2026 23:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691716; x=1794296516; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tfbhdXr+xU9IHzzXCCLrrQtJWTVcaGZ00j5M2dfE53A=;
        b=Kx/CIC3Tas2jnWjC0rUTwKH6X+TEJJRYzO4qSzZ8NTeaaI0weYbe0G7UV4aL8jTuPz
         bIwYZz5usSqsoJDvagrvCsu49r+Obvey2NqRMETNS2auyMPSeOwk2ePgK8Hpm/HNzIzy
         IKElgoiSEb50t4lIOvIzlcz9KXENmjgbyJHwjzqxo4U2cReTXFiuIsq8bJQvvOlMnGD4
         vWqom17DS1yFH5PhPY7ZUGeLzsVgvP3OHMXwWBg/cBDLDsQ9tUB6bHnMx9mkmFKVFSMR
         5uVHZjNdvsowk0vhS+zTDcOdZgC5EZWM2jR0fgB19ebvCdKclmJcrF6Wg2uuHCaMnmUH
         rBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691716; x=1794296516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tfbhdXr+xU9IHzzXCCLrrQtJWTVcaGZ00j5M2dfE53A=;
        b=mtQXqkCrNykddieW0BIe4dvs8+TQHmhh77ev7T54Om3vJPC2u3uiSwPYEm9R3/ylLo
         lqlpt9fw9fN8sJS2i33Lbzp5vALhS64UC3tQ3PbmABrpVPmftC9VuKjxE2BDvxlBMwtd
         Rpvj3Oordkv0SSk1l1GD5ycxIEzMZcyePjL6b3Brb7WVM61ulMoh7HkhddUsKvwosoFX
         yv6mvkQgA6WRYePGhACI0gb1O9bPP+qnNgSSZ9Ytn5Au/zxQTiOAiIG9FWWgMG+VfgNY
         oVYHCW6bqsTK2Xr3LrxhN7GI4rXOuAcvAYrkRBf2KsYx0fErC4GLtpbZvHMJs2147EMv
         h76Q==
X-Forwarded-Encrypted: i=1; AKwUvBzqkvomwdAEYQhIk2XatV8+qGDnetjhRgJBTNd8PO8wfRZmecxeDt4+TIaHNHbQAEhkLwJcKyupQihZMwRgRQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8jFvnjMUkvO97Xoees3RYE3I6dBPG/BjiEnIXBHeMA/W5PcwPz
	sdg2VE14uDbh2nITXx8PpQ0nm6WahBPFLkceaFzHdxA8XZi/gBSZmzkX78k1EA==
X-Gm-Gg: AYBFou2KkKWk3r4y4xZXGjXVAz+6+6EiaHUGSdXygemAuZl+ajVRUAzeuo+5RIf1c7D
	4vqupWfd0pri9VXcq/1sNCJXIxUaygvJerWlxmjuvDqGWxbZEenBzLNbtMW/k1K7xB9LEz+LWQ2
	1SGzdAzvT9NnPY+ErW6fdg2dRyupCrCTe1LSjQp6H6s3Qtn+u9c2ZJ0a+PwrGsFRibRjr3S5Fjx
	W8+lcDSD+2APT/2EaMaPkcX3ZH9ZRyuRjEpyZ3FB89vCpY9gID0v6LpVaypoC+jmrcbXs3+XGRF
	cfZyJdWxDiYdO9jDBDO58lyryUemi7aAZlolXGqbnqeYkDA1OuGTjPN97yh7eKjBB5yMJXhCHLa
	IrE3PMS6jqRKwBF4dItWLbNiMUfxhOKP5xxjxmr0BsRYGTQhHQxPV30JL1/LHWd9Vp7j+HY+U5c
	Ow0UsBbHs+LmuTOBgf3lDgLW5BCtUDWJSsSvG7oR2tH8DW54j5XbID7baBNavgVGFjpkbhYYkDM
	sAvR5GQ5uimUWZClH8Inu6oaSo6lTjCsEHEX7FFX4yccWHy4A9aSLs5ExoEr3JQoE5WZ/h0ZYPG
	nELRglP2LOrShfgYXL5OmLhFc4jZOoEHq9DHRVdA0ZH7Y8MddaQkQtufzXso54goQhYj0CVHpxl
	YQ5NgmAJ9A5e+56Y0F2cMWMlrDNuSHtXT9Ksw4aOoBscgqe8K+Ab/UmAfKt8Com8BkPsTeXknIM
	wnfGw=
X-Received: by 2002:a17:90b:570c:b0:3a8:2c7e:8986 with SMTP id 98e67ed59e1d1-3ae897c8820mr11559333a91.17.1793691715180;
        Mon, 02 Nov 2026 23:41:55 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:41:54 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:00 +1000
Subject: [PATCH v4 12/22] arm64: dts: apple: t8103-j313: Add
 speaker/headset jack nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-12-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2524;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=5HKyFCsuZAaYnH07XINXm4pOIg/VsCVnTKPu6wyChjU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8+v45h1uUCPY0rCtPuamc+e3xb9dDx4p/h/1bLYQ
 4rqZ3v/d0xkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKaa5zgjwzPGSSEL1Dcw92rcS622su/eaLvyVK7rFWHex0oz5Rc3T2FkmHHyR8Y
 RlQduJ2s6U7+IJa5tnFLfq8544XXu+R17O25f4QUA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_234157_883379_217FBB93 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The M1 MacBook Air integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j313.dts | 85 ++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
index f8b2b1637b9d..36c47734a1dc 100644
--- a/arch/arm64/boot/dts/apple/t8103-j313.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
@@ -55,4 +55,89 @@ &typec1 {
 	label = "USB-C Left-front";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left: codec@31 {
+		compatible = "ti,tas5770l";
+		reg = <0x31>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right: codec@34 {
+		compatible = "ti,tas5770l";
+		reg = <0x34>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+
+	jack_codec: codec@48 {
+		compatible = "cirrus,cs42l83";
+		reg = <0x48>;
+		VA-supply = <&jack_va_reg>;
+		VCP-supply = <&jack_vcp_reg>;
+		VD_FILT-supply = <&jack_vd_reg>;
+		VL-supply = <&jack_vl_reg>;
+		VP-supply = <&jack_vp_reg>;
+
+		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
+
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+		cirrus,ts-inv = <1>;
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j313-macaudio";
+		model = "MacBook Air J313";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		headphone-dai-link {
+			link-name = "Headphone Jack";
+
+			codec {
+				sound-dai = <&jack_codec>;
+			};
+
+			cpu {
+				sound-dai = <&mca 2>;
+			};
+		};
+
+		speaker-dai-link {
+			dai-tdm-idle-mode-0 = "zero";
+			dai-tdm-idle-mode-1 = "zero";
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left>, <&speaker_right>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>, <&mca 1>;
+			};
+		};
+	};
+};
+
 #include "hwmon-laptop.dtsi"

-- 
2.56.0


