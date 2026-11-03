Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF72606A329
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 07:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H9tK9fFl;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=jP6BYZHQ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d+4xiQOj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pwoh0z95/GhzPxuFda/2Z71hW29wiXz/USZbZfeMSh4=; b=H9tK9fFlI+Srv1
	kGjQ5yZSHmwSOoABKrKWPBTzOVLLRnPGu7zot8LCOxkTWUQ2Z5X82S3aND3xDvFwzvoIWMXIG0Tbd
	3akRFA6TseHatA7cDxOz6QmzIuTUrE/5qVWwN/Rk6unUnN75/u3vdpJtde0LIFQO8loUFhKWAkOXO
	AxndfrfDipnYdsLVTRKynxLFS8HeaUWs+oJR5n0Q0H0++Zb7YWfega78dTrLME6naKD+9b+76YNHD
	hwMnJb4Nw5B4SxT88OEizHxE6PwEGlLm/5DRDmh+AgBsM2ZIs1GrscGWnnbw+4WUWa8EESIdesad2
	rdkK9QqshkAHCSFHvnmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9AS-00000001ORE-23hU;
	Tue, 03 Nov 2026 07:42:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO99s-00000001NfI-3BBC
	for linux-mediatek@bombadil.infradead.org;
	Tue, 03 Nov 2026 07:42:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=pwoh0z95/GhzPxuFda/2Z71hW29wiXz/USZbZfeMSh4=; b=jP6BYZHQGRwqid6vFFNqJI42aW
	9NGaMSw1C8pDdLgXC6GJpRlDF3s7SKjOhgDShisR55m8t8ag/ZBEe0FStdSsAcOgLOe3U25JXHrgt
	AQRKj0mzSNB0jGuRHxoISPl+6arhjPMoV7KDa9xmX18H2S/JS1FtEv7QNaghiOWXz/q7dqrQhyOLz
	elcvqsm0lb3RCup6uDrniDlwqRTj+IJgH7TOf0lEWflcdMOOG5Bzugg++k741o1NX0OeEnXcvtN5k
	W9YNefPVHg+E5aqp6+bj3dVIYUEM7UHX9kquCC+xQdC4wiqt+8N84kkv/g9FgWLvNPU6vpTWjyGQY
	G/CREKow==;
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO99l-000000007eL-22RB
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Nov 2026 07:42:15 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-cdb2893531bso1074637a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Nov 2026 23:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691724; x=1794296524; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pwoh0z95/GhzPxuFda/2Z71hW29wiXz/USZbZfeMSh4=;
        b=d+4xiQOj9QeURIAzneqM6iCGKCz02I+my+YQh4WLxCJ8CE1KNBLM4/2aztvS/4yBSJ
         ej6NsyedN5DqsiupCQORPRFUTTlVzpgG0Ryd9JzWZPbUP8fF+5PdSxcYgrhrh6rZi7j/
         VGnfnqYdWqZJ19EwVNc6VcuEOtC5ospcnHrRI+h0936VY3lYNo7olEVnz8pVc+mqmf5B
         nNAKzW1/NxafLUCu5nH9Ja67OVEdkJq5pZIDID5e1P1J+x32e5R5/x2FWJ7RhzRAiIRo
         0DdG7DEdU59kGj73OoqrpLtm81TUwh/vb2zjgf8WYuG9sVKqQbxl0hwk+eyjn5SHSLpF
         JMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691724; x=1794296524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pwoh0z95/GhzPxuFda/2Z71hW29wiXz/USZbZfeMSh4=;
        b=dcaQLrdTDQK4sWQI25s0rJSkTrvyHBmw7EIJgZ2UdxbIhPBISHm3ATiHDqUjUe95iT
         /7MmaqjV5rww3vPEqPWiPSFQkSMQOyp8FxC84XvA2kj95ObHgkHoRszq9JBL0rH6L5vx
         eK78AxaxAmmN/ekcxiFnzipAolMuLvELStBaL4nMP++tmEzPQKNqWm4Vm2khP/WMXwaj
         VFH1GTChpUVMJf5F635FOEPRatx4GQH2WOz9gUXHxnhAwqM/OmAncSRF1EMkH597Di0p
         gATWQysX2JIXHXXfAOXyQ9UerkW5RVlLkBSrkR/QNBmokX53b3uV+FV0GeJNAgnobTjO
         irsA==
X-Forwarded-Encrypted: i=1; AKwUvBxlukef9cZDTnRGH1g14b8vgphPMsJ+XOTFDFeA/fexodKPBvGOfQE4zS1QDskmzaKgvhUmYsNySE+Fr/MoMQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/+e+T0ZWQ0aLiVWDsvNj1UEGRxqwdwBwPMStR6rUCdkoYQ/WQt
	1g21Fl4By0Qfkr8ES5u1AT1K+6d/Ut/pHCRWkwS/7noou9cDYmcnO/Lx
X-Gm-Gg: AYBFou0e4S4O5iTgS7ha8CTNZdqS96/m8k+pYjSIwkUvojjr2jUTCl1YHdJDQsVHdKH
	JJ32Skzj4O44xMufK7qUVhhG4KaQJBi5R6/JhrGQB3MZwa+MNwfbS3AsUbsahpusgrIppnhEWHt
	wc8Scr9ucxRRT18ilnck5nbi2mYs4DIEaaAt9MdOm2/pOz2HAPcIZmPXvy9isR2E23wGVOslJc0
	Bzry8KEaoCumUD1N35jDl5o6FSAyfJV+CrErCOul4A4hB/LMLuCF2z0DWhUrN1oQk/pjy53q0uZ
	MGrTBR8uUCOnJuwbx2Bo34ZqCkGnZedsf+XbcW8bjjQADdYRiyRg6xsjXfBFlSDnei3gZUW8g6j
	PxJuDWVDJXZWAvPcuygScwnVYXo9b8LoKo58+Lc4yL7KvSf3FZYORb6OITlNcQleZt92I33+BrT
	WsTzJ7TjWcXRJAvVYhHMh21/ABJNITTkXGa+mymUzPcThlRYaE78fmWJsIAnOEyDftV9kc80bEH
	zvEmvsjYudQruvUj5Zs28I1dZY56kJf64FLL5eIE5dW1YB8UShkcpo+fTjN6Xl3qoWOa+bfX9lI
	veQHDQefAQDWqsljRMxDu5yGjoKPmOZ5fVJlmP3BHv9VGw4jEPde3moGqENyePvtzkeoxSVFXpJ
	A+eD+7ZiMGEfM8bor68DHpibI/T7EsqvbsJlkryZIUVK55xMy4yX+3Rb+bEADunKTKRQUzABIej
	Q19yA=
X-Received: by 2002:a17:90b:1188:b0:3ad:b7d1:8631 with SMTP id 98e67ed59e1d1-3ae897eb75bmr7420951a91.17.1793691723756;
        Mon, 02 Nov 2026 23:42:03 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:42:03 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:01 +1000
Subject: [PATCH v4 13/22] arm64: dts: apple: t8103-j293: Add
 speaker/headset jack nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-13-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3383;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=AKNOO7q0vuQyr2QN1X38WMsoOdMQ1mDEzPGmlv8YRhk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8/7xJ/SVIuv/ng2cm7unSdmjQsFFy4sW1xg0fKwz
 tpI4L1px0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKr7ehn+u3b5/9eXOif15smaL7cXx6RvyDn2UaP4otCkj+8tfm06xcDIcOMpj9C
 VLdt9JdY+WBvIsCKR+XTLh6Pmmq7PQvty9yoeZgIA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_074210_785380_3EA9516B 
X-CRM114-Status: GOOD (  10.74  )
X-Spam-Score: 0.1 (/)
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

The M1 MacBook Pro integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j293.dts | 114 +++++++++++++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 1d074b9e6018..6980247b94e5 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -133,5 +133,119 @@ &displaydfr_dart {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_rear: codec@31 {
+		compatible = "ti,tas5770l";
+		reg = <0x31>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Rear";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+
+	speaker_left_front: codec@32 {
+		compatible = "ti,tas5770l";
+		reg = <0x32>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Front";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
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
+&i2c3 {
+	status = "okay";
+
+	speaker_right_rear: codec@34 {
+		compatible = "ti,tas5770l";
+		reg = <0x34>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Rear";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
+	};
+
+	speaker_right_front: codec@35 {
+		compatible = "ti,tas5770l";
+		reg = <0x35>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Front";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j293-macaudio";
+		model = "MacBook Pro J293";
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
+			dai-tdm-idle-mode-0 = "pulldown";
+			dai-tdm-idle-mode-2 = "pulldown";
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


