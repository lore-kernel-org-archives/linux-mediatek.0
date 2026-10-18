Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783FECCF2C9
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2026 05:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hF4JMWs272sSEGsqzXfRRdeL0HGexoAGbLW26/BzJH4=; b=s0ewbfhTKGK8GZoXZ++Jt5bWc/
	AcB6xs5YqH61bVKY7uqnLAXgiHnuxZe46H5HLmFd1oYN/4SqATmkz9Xnvidr/9X7SdWygfLKJTF7Z
	rbDnwJHquVk+VTA7/z2a2sfo8fwzXKio97rKarWtzq14J3ZXTwdlN2jNxWNs85Df4+7m399hUN6Fv
	tyjBblRegb+Hcv9RMAvDtnILidhvb5IN4ozKI/7ylYAFpWHugBAR7+N9Xu0xy9prRoGT6Oy2h3EHZ
	euKiJ2mblx9Du9rtaJSNfH53KW49qJPWrglGx7GcoOUFs3LkUl9GLdNCd90+N3nQLUAb+LkN/6EDN
	FqvtxKCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJsM-00000005aFd-1LMA;
	Sun, 18 Oct 2026 05:56:06 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJsH-00000005aCC-0tkf
	for linux-mediatek@lists.infradead.org;
	Sun, 18 Oct 2026 05:56:05 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3a4b9732d5aso1021229a91.3
        for <linux-mediatek@lists.infradead.org>; Sat, 17 Oct 2026 22:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302960; x=1792907760; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hF4JMWs272sSEGsqzXfRRdeL0HGexoAGbLW26/BzJH4=;
        b=sOAvbxgDFdbNYmGTbEgTI8h1aHNkYBqQM5eh36wUdF2yEj37NFZ8ztc3pLCGyyPTOm
         +fCmA9t/Rurd3EZciwdiCtt8P9e1dbJmR6tlCI4qyUIs2+ojMs3xw8hODN0QOwkOIYFJ
         Oswv2In9yHwo9Gk/J6Ovo/PQjYKN6vrYzM3un3aS5LpfcVJNXTx1xQ3oRcJEZSuL6M4/
         CmZxbzPTBYPav8qbZbM30GVJmQ7X+vO/74ju8+1t1/uls5t8fd9T4ntbBoipPvxmqGzx
         /YtBqELh2WGuYUZjdEHuOGyj0GgiX6WrKop0HAMojrRv+K4GiKhB5TFehSvrJmy1BpnJ
         QD8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302960; x=1792907760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hF4JMWs272sSEGsqzXfRRdeL0HGexoAGbLW26/BzJH4=;
        b=KDvCVYTzFnl5V3N5CfHzdI6asE14LlJA0tGif/Uh0NtK+oipT+5/edyUcyLtSm9kvM
         FxJu4YKHWr6HVwEsQ/V+q0LE4ulWde8Itzmmfak/mYMc5hxP5jDdLBkKemuvyvYSUrYk
         UQw7evAaLAB9YsKODHi9B4wX2q/vcdkESaRVYx6iMEJo6eouftmJyPeDLs0mgS5IjjYp
         iQvbaOkv//lGqUhcx+BhwakRDnfeEipmmUfvGiZyO0CHBLnBNo7pV82YqSZtISFDJbsJ
         6Hm/w9unhTppfzOUTEmmNYX6pPUftOUV3ADCsJ1C+165pjRRx+C21J3RFzQE1jtclWjG
         yhdw==
X-Forwarded-Encrypted: i=1; AKwUvBwEKYPp+O8biohzY3AZ9X9N4IyRx+cD4GzXTApYRBVt689Zs1mFgQcJjx238mxBwMWzCkMMX13taoZuxRaI2g==@lists.infradead.org
X-Gm-Message-State: AFq9FYJkGc6V3Ft5uDC8khcK6s1SLvtzBe95mePyXxwCNQh2zFYIYRZ0
	id8Cw7LkMNvCNKL6ozDCzw4O/o39jUlQmCjhdzSrXvelw/mhcNHWjF3x
X-Gm-Gg: AYBFou2xCX9Ige5kWmXT2UJKbJrzQudn+JuldUSPO7PLJACddV6MoEdowZl1IvVwUBU
	T917Lk1jYXxJ6OrhxJ2BT9qmws50PdmukJkmirpxJWSexvLTDRvORllTb5EmaJc0NkvGloY+Cyf
	aD9Uqb49pv4ct4PNOIGVRbxwstzpjO0y4qm/tBGdN1bT7w5+WjUVmeeAaEef21Q1kLJvnPz4HeX
	wGZao7tnP7be/VoWC4HKXV/BiAh5avFqHHu8EwrrZUkcY8s/Ku6Zkv+cr30RDLN0HbXyFLw5HUd
	3hE1UIFhsVuG6X6Zth2qkb0uTjRnJVyZw49hDxw2cdePopIWsz5+1qj+qfIVJ8/UshddqPhiWeY
	dTSR4uELuabUIcpwWunqzPiOsEKt6D409zUtFGQS575J9BInCmU3FMrk7jd48F2c1GNtLXObQZc
	AHGIzmFyaV33j7mb1Cfbqis+rU7yDOyv9hOvTJs04LgG/+YExIoY/b/j+5pbI3n5tKsgrmXXDd0
	E8ERAumF9rFsq4hxzY5Dwzi+NvTUXHAhtPHNP+cA/HpNsexaaedAModeEtEfmzPydVaGlCtE++2
	/qzejYsiHYis/O4KlMikcZXCOUyGmsckxR+5LG1IDoUGEA==
X-Received: by 2002:a17:90b:5643:b0:3ac:95d7:2f9e with SMTP id 98e67ed59e1d1-3acef4e492fmr3874379a91.38.1792302960536;
        Sat, 17 Oct 2026 22:56:00 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:55:59 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:03 +1000
Subject: [PATCH v3 09/21] arm64: dts: apple: t8103-jxxx: Add regulators for
 CS42L83 power supply
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-9-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1782;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=KU3BimG1w/tGdivUHCFc4QDicVE1ue8ULpff7ZYuYZc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nkOfZBinBN/YGlX0O5SvnfvnwlviQh5vf3pG8Wow
 u1aYrPYOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFPtH8vwV0hFKrt3PdNppgyXZRkNSyQVK5OOKKUtnDtdWvvKqVv31RgZnvPLX/9
 g9pT3TfXN1ROaHBufK3Ku+GX6Y3bd+yu27Cw5TAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_225603_600116_42D381B0 
X-CRM114-Status: GOOD (  11.18  )
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

The CS42L83 codec found on M1 series Apple Silicon Macs gets its voltages
from fixed regulators managed by the platform. Add these to the template
Devicetree so that they can be referenced on the relevant devices.

We do not (officially) know how the power is delivered to the chip
(voltage rail names, commoned pins, physical regulators, etc.) so
the regulators expressed here are just stand-ins.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t8103-jxxx.dtsi | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
index 686fb1dd215d..7483fc5cbd20 100644
--- a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
@@ -38,6 +38,38 @@ memory@800000000 {
 		device_type = "memory";
 		reg = <0x8 0 0x2 0>; /* To be filled by loader */
 	};
+
+	/*
+	 * The CS42L83 found on all T8103 boards requires VA, VCP, VCP_FILT,
+	 * VL, VD and VP regulators. We don't (officially) know how power
+	 * gets to the codec, so these fixed regulators are stand-ins.
+	 */
+	jack_va_reg: regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-va";
+	};
+
+	/* CS42L83 VCP and VCP_FILT */
+	jack_vcp_reg: regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vcp";
+	};
+
+	jack_vl_reg: regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vl";
+	};
+
+	/* VD_FILT */
+	jack_vd_reg: regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vd";
+	};
+
+	jack_vp_reg: regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vp";
+	};
 };
 
 &serial0 {

-- 
2.56.0


