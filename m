Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E54606A33B
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 07:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IYFPLt5S;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IsH39YCn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sZetKM+Ta3nWU+g4aVmYGtlY4mbrOL38eozs+DIfj3o=; b=IYFPLt5SUhTUCt
	MvHCCTstVLSN32b7YG88FvlpfjwvmGrsMUTucfUU+Y/TLrCL9F/17sgBIzWNK7ukTmXAUXa3T/61X
	Wr8QHLNa6eLLqiyzjq2+uGnvjtvhMyv0a1fFHhxUAwkQ4Xb8J+MXu9DOif/7on8WrWw9ITtTXMtlg
	xErvqxkHACBUj8PVF47izJjB4C9bUK8ZGrD1l9/ER4OP9e+ZQRlXzVNBEVOEU41Bz02qMTZjKRnPl
	NnsnZRMVbrUdn8GfVhHVNzzQXtqw29qU3Hkw1PohWjQuS0P8avbPmDuPd4RVAMuefNc2IFIIFqOv8
	VVYKO5BNO/+38fm0dIOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9Ao-00000001OuJ-1rT3;
	Tue, 03 Nov 2026 07:43:14 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9AN-00000001OHQ-3srl
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Nov 2026 07:43:00 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso2436339a91.1
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Nov 2026 23:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691767; x=1794296567; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sZetKM+Ta3nWU+g4aVmYGtlY4mbrOL38eozs+DIfj3o=;
        b=IsH39YCnUy6JZyopqcROBQAAAtIagWS+L3Mv7acn3a1iCMgvaymv1p46h0IIr3wSxd
         qWzPXJK2MvJjHRAN0uB/OeTd7D9m26jJQnanVLO/kyZisdCMG8nvTalSQAzS30yoy8gb
         1/gpPNm5HeyAKe3JLdwWL5EKVq+QHBQqJ+4H1WXgXaU4Y4veyfDyTXajY6m7hehe/E/q
         Spw8D6Oay5oFhvAdNBgPDf+wbk8mXPBI9yUM5+CsrpWt2WXT/4g3y344ODD9hEDPar3B
         oTHvKzJQrDYirDzPdq7Egjm3sT+qBT5YfdrbfH8E47kom6s5ZFrEeryM18RIuuqvCHpu
         J3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691767; x=1794296567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sZetKM+Ta3nWU+g4aVmYGtlY4mbrOL38eozs+DIfj3o=;
        b=yy3dws+KJhv8/BdUG4tf80n8w94ruqmTvzVCdRqlVc4QDLDl6KJs80dpAyBPaXVKgv
         HNg24aKJons3JA/XoMPxnE7QKc8IZHUS4xJ0hIyrZ/I9VKkTaXRLYYARiFfN60TXO/xy
         IE3KWbJ11p719QsvyUIlauTVORJGzkW9wgHxqyqfUaTa1TwYtMcMa0L/lRZK36EdukhK
         zwVQiSlwLXGpdP1fYztwgswLXcV+8fkKosW0nZk+jp2SFtaJ7Irh6fghSHJQ07bFRr/f
         uS8qWE4KQlBEK8VMs+SspL4Aabkjc9AcMHjQCaK8B0ylUzXijvFV1Ij/5HCPrFTSw7yO
         m9oA==
X-Forwarded-Encrypted: i=1; AKwUvByJlBfm7Ved1F71cQKZytJWCSJ9nH0U+JPpvHSHEbIR59J/+bmhQKCc32FiputDm9/VYIh3hLw8Gzo861FyAQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8gojRLRI6cYSR4/uiIYXLBpfMsI8xwRhe05wo1Pk7OFHaRQ9io
	XHNCcYonuvhS1OEg3lvsDVl/4/HXynkaFLSHsDPozSf13J6hzZba3d8o
X-Gm-Gg: AYBFou1Hh78ZcHAQdgzorr++Up1lvg/SWah646H2p3lQQdJcWCpW49GFNFdEsGSvLys
	OPuQFm2rmCEO8FTOUJ5WNXe9zd7qizYoEefAQsiXiXzSC8qM/DVtoVLucYi6h9EctldyOqAZQrm
	fX5PiSoW9CgSMFY3F+jziiO25dbCveaSU78iA7qTHLKZFxarbsxWygdG1rw3r9qQfYm9A/aTDR1
	3je+vhe0rd9z/Nxsa88SW4oqLrAdmR1m5ijgpXcxTPOetyKa+OJ+3YyMps+o4dodJLdMXBdvcrf
	h7/Axhzxsxqlstq7f55EyYBXQH+3RliZ2rdqZLckCeh104kAG7Mfs1Owe5WvV4dZcA7gPacU3w3
	rs5nfuM45gJoStJiIBD9oZ6LvMNg9rOrlZJ6amLbkXW0qfSE6PD9x0GyVHl7Ilkc0POFnoHG3aa
	l/hKgJlc/vKOobsusm0K5wy4LY04yYW3boGYVOMsu/kiUG4RidTJCvC7cocIVnBeYH54oo5Ij9J
	zEb7tZHkq56uSfFzS9F7mqJo7GPYKRG9nYF3ASrmED3V8KPtUyXedTj4eBtNguwrFRiImnYbfup
	U74s0ExcXahH9eIqF09CP9HP57KNbmyeBOCpVwOSSxfv6LhGRSxzs5vJQI1P914N780oVqMPkaK
	Ru2Q1k1Ug54kta3mC8MjX856LaSh9SqFE/5mXJ1vWZTiHbi0e/PAhf4MCFmS0SExWWineQD20pD
	ntSko=
X-Received: by 2002:a17:90b:5847:b0:3ac:17c:6e89 with SMTP id 98e67ed59e1d1-3ae89773f17mr9382729a91.19.1793691766813;
        Mon, 02 Nov 2026 23:42:46 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:42:46 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:06 +1000
Subject: [PATCH v4 18/22] arm64: dts: apple: t8112-j493: Add
 speaker/headset jack nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-18-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3235;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=8fzOK0BtAM9BKavKDtzvC9SkMIH3VaTohkyi9BTYOYQ=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+88bPdw7+8zxaeJR3g1PXwjIeS0/LufRYzbxXFvRF
 sbQSU8aOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFN9ajkjwzoGp3vpF83+FtboLflt1byU6xkrr57qIumIVLazKrVXdzH84Z7/WCp
 jd6xtRMr1hR8S35z10Ou0ZEixmRvEKzjfMmcCIwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_234248_111856_8C91FE6D 
X-CRM114-Status: UNSURE (   9.89  )
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

The M2 MacBook Pro integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j493.dts | 104 +++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index 7cea5c594810..832c18538cab 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -147,5 +147,109 @@ touchbar0: touchbar@0 {
 	};
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_rear: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Rear";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+
+	speaker_left_front: codec@39 {
+		compatible = "ti,sn012776";
+		reg = <0x39>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Front";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_rear: codec@3b {
+		compatible = "ti,sn012776";
+		reg = <0x3b>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Rear";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
+	};
+
+	speaker_right_front: codec@3c {
+		compatible = "ti,sn012776";
+		reg = <0x3c>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Front";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+
+	jack_codec: codec@4b {
+		compatible = "cirrus,cs42l84";
+		reg = <0x4b>;
+		interrupts-extended = <&pinctrl_ap 149 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 12 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j493-macaudio", "apple,j293-macaudio";
+		model = "MacBook Pro J493";
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
+			dai-tdm-idle-mode-2 = "zero";
+			dai-tdm-slot-tx-idle-mask-0 = <0xf0f0>;
+			dai-tdm-slot-tx-idle-mask-2 = <0x0f0f>;
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left_front>,
+					    <&speaker_left_rear>,
+					    <&speaker_right_front>,
+					    <&speaker_right_rear>;
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
 #include "hwmon-fan.dtsi"

-- 
2.56.0


