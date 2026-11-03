Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4464606A32D
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 07:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Idlw6Cue;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=aarESbK+;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q1brqBxo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vHOHvCSXEoTo46NVws8vPtdQYLdsjWLGfWtQNeT/eIs=; b=Idlw6Cue5gCNor
	+e83YPVQkWrhb0xzLIJtU3GVqD2ov7OStFKKNxdpL4BBKQFYp3NcWlhBlf8YcZzFH7LoSqhzBhcym
	++3XnCl4Asea0/JY3z29s0p9Qj1qU6T6stD/XofUekbR0jgTZ+mFekb0o6V/JVhdcrW+iQr/UHZ/H
	8B5Jxao7yAy7cuyXSw0rjGOkwebqyTr3PPC2QPzoHBDRoGl2uIUPQqkAErhamuTAEuyQkoNNO8AXu
	mxToJjaM4VrUmv3XcTsdFiCg1pMLb2pYflYX5mgskW56Nl4D3HkvIUVAzzuDxkejhpDYLR6DOFlBl
	npBbnXRSeTHyJuz3cs6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9Ae-00000001Oe3-1pHU;
	Tue, 03 Nov 2026 07:43:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9A3-00000001Nqu-0HW8
	for linux-mediatek@bombadil.infradead.org;
	Tue, 03 Nov 2026 07:42:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=vHOHvCSXEoTo46NVws8vPtdQYLdsjWLGfWtQNeT/eIs=; b=aarESbK+ZkVFulHyKg67s5Gly3
	mxu1lpLyMWCceJFygtCA3bbNW4cePCL8PNjBhVBRWbd7LlgLM5shePb7+FlOhc5WmioPvDY2v0g0t
	jP6BQN5c7yLn0BMz1XklLLGdkWvxgcKn/tFBdlpvppSJ9xiMaZHPFVj6D5XAqjWePu9cZ+m2hw7EF
	RdIbXxbKStQzwQGFfBZk7RKINBAzNqAXfywlZQD3VyxrEGtjqVCUmWlV1abLcVhQmcdxAfZ2Rj0Bq
	434yPTGtKBCNgvmsEDX6vzI3Cj7QEMF6XyWUiaD4IujjJHn2yauc0hdL2oEhrclhzLUn2JXiCtDBv
	piBilJtg==;
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO99z-000000007jM-0tcp
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Nov 2026 07:42:25 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so1842741a12.3
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Nov 2026 23:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691741; x=1794296541; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vHOHvCSXEoTo46NVws8vPtdQYLdsjWLGfWtQNeT/eIs=;
        b=Q1brqBxoCqN4y7VUs+x+1d0MRPefsXSOSaPgwzKGbwUyFdyiIdIlVjgl86hZN+ER4S
         Fhyy+GuWm3nuw6BBCcr9qp1753+jR2gMBh8qN70Yz8pLIFd4Ni7wq3CMtIvDcSpriu+n
         UDsVZ9ilsNKwBuMDw1ScrZqpp0YhS9HmImZqSR6h6FFoqSzh43NWd5oNC1JA7G3Zapto
         v+DA+nVXKpSDLI6MQ8IyiCrU75x85GwENACvu486bcUVnqENhItoeUVJndZ8asijgWfE
         UIg0rMAR6wRvPQR3B7woXqNk+CmMY2HJaxdOksmmXg4fBnQvldv+Z6/zNITkCtUWUn70
         u0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691741; x=1794296541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vHOHvCSXEoTo46NVws8vPtdQYLdsjWLGfWtQNeT/eIs=;
        b=Z0f/W1+b39kgWm3Y7iuHO+lal0cc52fx+pGocm3WfXZ6A+b0XBXeGgQ4QxzO1i/n9p
         6/rXs5WZGMBnX+Nu3BLCEDNVhKYBG9d/97RdsvWt+Q0pr2Q2VS2cqARBqH3s5r2hgH4C
         3Qc0Trq6lv65O/1Uiat/6N1m4pQU830zzJT/ZxzPcOW2ceu7GAqLYNC6q6rYTqTDhcao
         LHbHLGh1WyYdVKNFd8Vw6qUIBAHdw1BnOTP8LwGqcovHQbhPNvw7DoeTgMBjse+6l2rw
         GEPdrf3swj5fdinuLaJLGdppFe1m4KcZuEte5G1TM2SQBU1wPX/3ASi4YYUi+KuHMljl
         o17g==
X-Forwarded-Encrypted: i=1; AKwUvBxYr4vATcszt54Dh+vhnDGDlVMZtc/+Dkfk45RAk64+6UyzYdJ5nChhF4PBXwS/Ycm78+ho2XgJoopLM3ZAWA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+WhDqjlrA4v9eW73YUoBEVa8hO8ZrUC4Xe+wYEPPjRqFvfiMsW
	804dM9Y7n+suJ1lNv9Ts1RuF1r0ScTstxa8bRefB8479XODtnY9PMBo8
X-Gm-Gg: AYBFou1/v2Vga8K+js+Yx2wzfCvAMn64nGXB05GkrrPmGjUrmdhO9FRiAsxHVcPYNA2
	StBOcb4rXl1cDK3rMfWYo+jIZ4K1Wz1dDAaLG3tWQD6xRcyYgA3QIjUbM+xmrzdww1MfGzuj72P
	Axz2Z3aUvZQ15KKXAdR7x3VolhJl45fEjvFbzSxUVzy0yGhLlGg70nu3cviciqu0n1aO9iALA21
	szZ1whFsWwPlRQTVoSctKDzuoUrJt9MTOyDHfTqvrPau27534Lgz+7ZKkg+Hytzzkub/nNQivqV
	ikarK0w5m53zkGBFzC7bXQKUKoo0vA9S2ZQ+XUVVM6s735nLSwT/RA2nr3JhDtbhs9mLunrlI+o
	ZgW3KicyQ+8JvwfQqYHz2kCrQQP4fofb0+FtOf6hBQ2tCEU4SRUmyC34aKhRdceZm9X1JWGnUSz
	Wdv/Q2HiHzyMnhUKt8/CazQ2gf8uPadCxGdKYjbjARmFPopq5brHQ5uR4cRcvpKG9906wB4S65M
	7uEusZFbv/0Bv06MbymGvM3KE/W+lhG8P4LYxqH/sOO59yCupRXADm/wiFnUA8te6MGT0AwxiNM
	Rt0svUzbkeJKwAVJRSt4NlS2K6nhfExsZ46ph+al9E4pCTWd6uMpZ5VFo35VlQ0dyTzVeTMaEhy
	/CTuxcYm2u8WquugWYz/hDPal+8wNh4FP53cXBTnCBmw6yI9hqqAtNE+dVe7UcGDTpee8+8fygu
	wqC4A=
X-Received: by 2002:a17:90b:3d4b:b0:3a8:1a1a:7895 with SMTP id 98e67ed59e1d1-3ae8977640fmr7907935a91.18.1793691740953;
        Mon, 02 Nov 2026 23:42:20 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:42:20 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:03 +1000
Subject: [PATCH v4 15/22] arm64: dts: apple: t8112-j413: Add
 speaker/headset jack nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-15-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3189;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=5tHHgqd9nLG6wvk38A1iPKU89o+NzJ9eWA6n+JZ0CHs=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8/Pa69X5b1ifPf+kakJCX7iN8Vffb5ssE2q83HJ0
 4tNhRcfdkxkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKZa7hUjw/urKYw7es/HfhY599g8qmftTo4Td0T+bLPsjPq249yxI52MDCeFOBU
 D4tbsWsB3Wb7g7/biiTveJS1QmXeMk/2J6nxWLlYA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_074223_584514_79F2E00D 
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

The M2 MacBook Air integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j413.dts | 104 +++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j413.dts b/arch/arm64/boot/dts/apple/t8112-j413.dts
index 7ccfceb08093..62aba7a4d3c6 100644
--- a/arch/arm64/boot/dts/apple/t8112-j413.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j413.dts
@@ -92,4 +92,108 @@ &fpwm1 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_woof: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+
+	speaker_left_tweet: codec@39 {
+		compatible = "ti,sn012776";
+		reg = <0x39>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Tweeter";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_woof: codec@3b {
+		compatible = "ti,sn012776";
+		reg = <0x3b>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+
+	speaker_right_tweet: codec@3c {
+		compatible = "ti,sn012776";
+		reg = <0x3c>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Tweeter";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
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
+		compatible = "apple,j413-macaudio";
+		model = "MacBook Air J413";
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
+				sound-dai = <&speaker_left_woof>,
+					    <&speaker_left_tweet>,
+					    <&speaker_right_woof>,
+					    <&speaker_right_tweet>;
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


