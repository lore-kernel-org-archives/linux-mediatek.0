Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00DBCA5FE6
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Oct 2026 06:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wzE/M5oT5vPZI1AJYKVf4l348+q+qKtnsytokZ7nT6A=; b=TYaYiBFU4ekIhVzAe6Z2hEKhMo
	hBQeuoGm7aYgkCA7OV/lhb4n31uW5ldMKGRCCJ4nHqaG4H0I/Xb2rRWCsRkozcqvnL5qWRIPIjPpB
	VzAYtHs4icZGxMX73YZBH7DTtBuR28G1Cer0H2a2QfW1Ruu2RIDjJR6c+h0jjtCG/WxU0tkKx8uJg
	xo2S4thTNatSZw3IOJeUS82Ilb2wJK/DCeNJ8zMSRGrYkTX3y8DOE5NYqs9zAF/qNlM8fnaSxwrgz
	sH5+tZ3ggR6u9xd+Q6ZioeNF1YctNtJnJ0JLME3L8rm4MUgF1vCLUg8kIXUus5d8ZtpI16S76wDPX
	/dWDtLwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFN0-0000000EOtU-2Nue;
	Sun, 04 Oct 2026 06:06:46 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFMs-0000000EOkp-2hmg
	for linux-mediatek@lists.infradead.org;
	Sun, 04 Oct 2026 06:06:45 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so459166a91.0
        for <linux-mediatek@lists.infradead.org>; Sat, 03 Oct 2026 23:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093998; x=1791698798; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wzE/M5oT5vPZI1AJYKVf4l348+q+qKtnsytokZ7nT6A=;
        b=D1KLbGbsD8xiv/5ExHE163ORHb7AtnmchCbyLa9+rRhZ34IuGnDPb+fVtjniDRmLsR
         cM9F6g0RZb0C5/0j8NQbBHR7fXpbdCOVgAEXAuK9qRaul7GXdUoJNYHlh3X87kCCSuMi
         GG6MX6Sj/QhIFFYJFBs2VrtRfmZnzKteTnbMOc67hUDSy1eHVD8uCsZItRYDjAzjgSU8
         np9hXVKOBTCPSelmzFGHEcWjY/5Yg7ojZf9cFjsYbdk/xuebHFkywUQdVcyWRTJtj2Vh
         u1TWCfWESW8FWNYeyYkb0+jyh9/3b5Oc3WEViAg2Zr23Wfzo6DVdJroHpGniX/FZzrU9
         lQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093998; x=1791698798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wzE/M5oT5vPZI1AJYKVf4l348+q+qKtnsytokZ7nT6A=;
        b=zDHJ08facPoeBBLtsn1U/7TXrgFM3UzPYUj5nfCwBw5jpRkkiirXI16ByFwauO8C2n
         TFNM4bplR0INSsm++M1FkY4jeOxvlcqzDhjyy6k2l/eQdcJMrpyfwyxpR9l7LLk9AvyZ
         3f7Z6xTuhTasUPrkBqmmYbXuxT+rWqlVw3oqZbA/TPtJHlhb3oOXfNl8z2rbxUii/1kH
         n8glm2XYJRGApMJLDa97YWyCI6zuFd02nj8AMtqrPxXjQE2xJbGYGS9El2jvjfIrSFdF
         OcFqv6ycIgNvoOfQ5A4Q4wXPHZUl1OAEFsRfvOlXg8yt+dKQnVNNdth26eYt2qigJOpD
         pLUA==
X-Forwarded-Encrypted: i=1; AKwUvBwDgasXTCSLTpX5Df294da3GbcIdizwwR5X6bnAXlh2iJtptmgbzVvfC3Ld3x9QoAha0XXaUICh2rLSrOXdQw==@lists.infradead.org
X-Gm-Message-State: AFq9FYJh4j8HrwMgfl6av7gZjiFsPkVIb+c7gWkg6mFM0h3twkYecpMY
	IGXi/YydwWjOfnzF7BvZUjHavPdUtgPASyuKCH/0jyFtsKY8PiOmviUV
X-Gm-Gg: AYBFou2VmudO/BQ5v/1rHoqQ6emKqB7OsxCLexDBz7rDBRih6tvpgq9p+Ey/ghcI+Ad
	lwArP+ALZ5oqwfQY+5BYOdr5FEtSIpf2bY7ak5WRdZmkNnDIEFlt++mNJAjS8WVhxACjyCoWxZd
	6/BsjuppUoO/ikZHUmUEB5kg4/T1YA6pR4noBQLdI8zk0SwUy52bGZpO5NOyvz7H31QSAhXT7cH
	n2cRbBtBUOV32Cggaz9Lc4JqwY3gGJqN/VZSbCom90M9TTNRdxdXcJA9lZQJgZm5AyRrMInRfCL
	VDk7e59zggVBqogR/PLSd/w5U+Ts0hSGT9vh4DtuDTuSv9R3Ne8A1n3J3p+PBylDg81aTOWenAb
	pjYpXXuMC27zXH8ttaltqzoxOgr6LQ2QhliN15qpalyl9dx+B+jtmJbUe66pn/XZ2JQS3RMqf7/
	WhL1UF56xVYyE1Bbyg2dG6Zav80qQeUEgHm8rmx96hhhqxpGvfo/HB6pWnx+KZ+f/TAh6Q7fSNr
	pGZG+gpG7vFufIyEUOK38CZjSm1u97VjP6h3jWk5UnqZUJyMO6LGu79OUdgAJ3BMa9s9kbbVRLZ
	VicoR/Z+SUZIlNqvgdEnZMojxm0cMGrA3fIIiS77bNnWX1Q=
X-Received: by 2002:a17:90b:4b83:b0:3a5:1c7:c2f with SMTP id 98e67ed59e1d1-3a6ce986288mr6844237a91.59.1791093997815;
        Sat, 03 Oct 2026 23:06:37 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:06:37 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:43 +1000
Subject: [PATCH v2 16/21] arm64: dts: apple: t8112-j473: Add
 speaker/headset jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-16-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
In-Reply-To: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1828;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=10CNjE6ELuFX66IXNrkb7f+2daPg1AbLL4enNg5zaBc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+SpT/mn9Yw/NPxbgufaM0+qi9NObXvIvuFI4oOQW
 a4ZNSyTOyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFNdL8fIsO7XQYO6x03LbdPLE0oNPZ9W2QWKF4vWiTFNfTf5Jv8OYUaGLS7Obd+
 uv1v7zKW2L1qITXhHtfRz6+jmpDrmOtk7O1dyAQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_230638_730452_00E03B34 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
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

The M2 Mac mini integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j473.dts | 62 +++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index 105a9d118980..36f06c6e385d 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -85,4 +85,66 @@ &typec1 {
 	label = "USB-C Back-right";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
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
+		compatible = "apple,j473-macaudio";
+		model = "Mac mini J473";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>;
+			};
+		};
+
+		dai-link@1 {
+			reg = <1>;
+
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
+	};
+};
+
 #include "hwmon-mini.dtsi"

-- 
2.55.0


