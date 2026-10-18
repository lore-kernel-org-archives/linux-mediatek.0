Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694BDCCF2CF
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2026 05:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pR7Mez/DUqjnbbfCLoSWMUQ3S2o+0i7McD9nYO6h91E=; b=sq24fbVGhviRAJiG8uMRZKF/UI
	Wq12FpvXj8AyRNR8yKWJKgBr1Cxx/YVCN8BwBxDuOuXVRxalvq4e4DRmvmEt//DRbjofHUg9ZgqgX
	derxhDuOHJdv4IViCtq1AaUZHcUyfVBFNClZM53Yn/oc1wPJm+6VK4ZzyoORK/Zn1d7r4LsxTOO6A
	MUMwL1N5+Yzk8NRLGAx61KmE/vsoItg5deCgq52gKibptu8OkisjbXBHi8ZhbQyQ7L7EiHB44Uoyx
	UIlWGwL9HYXbfbNAJOuGZVD3qqoDeRj/RgtE+o5SsjW+doInbZhqsyAQerWj7nzAYTdD/hWMM1ePD
	1voZw0XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJsz-00000005ahO-2po4;
	Sun, 18 Oct 2026 05:56:46 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJss-00000005adB-375G
	for linux-mediatek@lists.infradead.org;
	Sun, 18 Oct 2026 05:56:44 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3ab3260b35dso881946a91.1
        for <linux-mediatek@lists.infradead.org>; Sat, 17 Oct 2026 22:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302998; x=1792907798; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pR7Mez/DUqjnbbfCLoSWMUQ3S2o+0i7McD9nYO6h91E=;
        b=i+Dxa8bfy6xFqJsee1Suq4UQCBATDEzM1BsbihUtRicj/LZtdTN69qqBrKkmEIeFTl
         apqMKVKMHD9nG4tJu9LwGawwwGRjXiVOw4a/lLKXh+g2SmqJP/nYz3c27aTWal+0rxln
         YV2XNRYHtqnSCbPFS3vPzJJhTnwK1C2/kxS0L9bCjX47SaSoCTz7PuaKEy/ZntysgEu+
         DAy9uEbhI3FOpeghbVyZ0HJge3/0V26u20W7WhGH6UamvQHi6qRMVHx3QZAEO7SUyYE0
         bBL5jBih6xm+l+Mp9Oa95N5lalRabCZAS7k4+aoHJ61ujJi8AmGpdc6LOGIYiGsj+8r9
         fgJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302998; x=1792907798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pR7Mez/DUqjnbbfCLoSWMUQ3S2o+0i7McD9nYO6h91E=;
        b=CRwiwGQQuxmYxs2A35xOIb0EBoZLGpNjYHpgksmRR55bsQhJnoDzjeuHUvYphSuJPA
         QafYqzhURL+stbZuvlgGqQukN9+X29v3KDikaoFoWz3lXmWaPo35keoNjeH/v2Pgr6q2
         17N7af2L0kcJOZRajaAB2eDKhpeBZrEalZD7xkg5OXLHT9cRNFaddQC9e3gzSmP5yJ15
         mYGD/8K+qNe4i51FL1aewQNda1NjCqBtlEi0bOqlx4iAXkNIN44BRE25y91UJdBgTieY
         odRmVgGysIrBxr6SSclyRmbn2B/IfvB7/hWvJB27Iu9KZHGY/EgCu6ZvQvkHtSpcroU6
         S7RQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAiRwWYZJJkPQl4ieImwlnfvMen/EhUpE00yAT5AMVDIfD6SjpUH4Z23MR0xSQFoPSKTLjB+W1+MWFr3+lyA==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ67byOuacjtN6TuIzSxbYya0AkO+xByS8RCCiY65KtBVLB7FY3
	UkZWYQtScewDz9ZDHnrPb3zOb0RJ4krBl+kozvjbY54UZUkU/sZ1Fr5KKcsVbleB
X-Gm-Gg: AYBFou1NfY7v3Bdu/CfSAZb7zsX0KOLY0JHzVO55sdrP/NiKxlxC+kVK5O4/LkG2fpz
	GsbHWPjmJm5kv6SrJVlIpmhU0npDRDUbSBGmA+GPY6EfMD/olHP6HLh93BwcPSQftiGNx134K3C
	infAA/S3fUe/EKzLU3e5UvSOXv4Egx75ubVMGivV9zNS5iNHRCszIPvPoWZ6Y1aksc/6dwzf5nt
	Pak8L0RVJkGn++e8M+pzumDfHJFNArApQ/iL7g1NtubJwZ5ofiFdBPYOvPVOZ0ERaYGdIkm1gT1
	YhRAn15aewe5PjAnrU+ejsc9dK1mlI5TfnkQCeJ7txWfbq2YeQsbX47lRstkJSAt2TqO+GTt6m/
	o2UP8yXGOz4RvGLTWYz/zc+i1HJMeaVEILg+ttXybtQe1LwRJQSAZzb4qELruHiEZT8lgDjSGh9
	8/dr04UOD/2HcMjGSx4O4Rx/y01oJaQ6PffN0GxnyAhY3bSPffJNufYrH+FLkkNRJJSusmPT93w
	zh4jcN4g92kYyZpjhKCNKNZMZ1MO+z9ZszoO12PEm0Br1YpbmnSFDgUpf7bpG7gUqnTZChH9lRu
	IaKwM/bTIo4YcUplzmotQ+8ZBWQGo4jTfRbIUM5UJ382mpY=
X-Received: by 2002:a17:90b:2701:b0:3a7:3474:b1ee with SMTP id 98e67ed59e1d1-3acef11c1b5mr3627242a91.60.1792302998052;
        Sat, 17 Oct 2026 22:56:38 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:56:37 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:07 +1000
Subject: [PATCH v3 13/21] arm64: dts: apple: t8103-j45x: Add headset jack
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-13-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
In-Reply-To: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2850;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=zDYarNXpwu0fUg9Z/Q5DjYa8aciZr7oQNJE40M6audE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nl7jjpbrPtfq/B2r8mC0i2v87d9qLkfoL1488r+7
 rk28cW8HRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKlu5Gf4p9x7XHTL5v7PhRMnxF01lBF4q3B0R8kZNlO+RrZ5irn5cxkZjlYts+l
 3+W1fKeeq+m6vnGKG0iGW7KC/y1+wzt+7UPUFEwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_225642_629315_71AF56B8 
X-CRM114-Status: GOOD (  10.36  )
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

The M1 iMacs integrate Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Since it is not yet safe to expose the speakers
on these machines, add the headset jack nodes and advertise them
to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j456.dts | 43 +++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103-j457.dts | 43 +++++++++++++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j456.dts b/arch/arm64/boot/dts/apple/t8103-j456.dts
index 090c97bb781b..91da90b37089 100644
--- a/arch/arm64/boot/dts/apple/t8103-j456.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j456.dts
@@ -88,3 +88,46 @@ &pcie0_dart_1 {
 &pcie0_dart_2 {
 	status = "okay";
 };
+
+&i2c1 {
+	status = "okay";
+
+	jack_codec: codec@48 {
+		compatible = "cirrus,cs42l83";
+		reg = <0x48>;
+		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+		cirrus,ts-inv = <1>;
+		VA-supply = <&jack_va_reg>;
+		VP-supply = <&jack_vp_reg>;
+		VCP-supply = <&jack_vcp_reg>;
+		VD_FILT-supply = <&jack_vd_reg>;
+		VL-supply = <&jack_vl_reg>;
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j456-macaudio";
+		model = "iMac J456";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
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
diff --git a/arch/arm64/boot/dts/apple/t8103-j457.dts b/arch/arm64/boot/dts/apple/t8103-j457.dts
index ebddde75455c..3e8d7648b3ac 100644
--- a/arch/arm64/boot/dts/apple/t8103-j457.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j457.dts
@@ -69,3 +69,46 @@ ethernet0: ethernet@0,0 {
 &pcie0_dart_2 {
 	status = "okay";
 };
+
+&i2c1 {
+	status = "okay";
+
+	jack_codec: codec@48 {
+		compatible = "cirrus,cs42l83";
+		reg = <0x48>;
+		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+		cirrus,ts-inv = <1>;
+		VA-supply = <&jack_va_reg>;
+		VP-supply = <&jack_vp_reg>;
+		VCP-supply = <&jack_vcp_reg>;
+		VD_FILT-supply = <&jack_vd_reg>;
+		VL-supply = <&jack_vl_reg>;
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j457-macaudio", "apple,j456-macaudio";
+		model = "iMac J457";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
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

-- 
2.56.0


