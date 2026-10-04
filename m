Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE14CA5FE6
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Oct 2026 06:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K9eRBqZKtThzspVubPXk6ZwkfjHPkOgXRwJNp+IkXIw=; b=JMuppT7Des0K+HrsoALkbl19xj
	vrL81wGcZyGUqVggZZWVVNH+VlHu0UyLOtj40cgZhk2sxyZq2tOmnv7BwXeg4h5Fh+8N8ZWU5865a
	076clhgHqoKJecw/Q9SOxTFxbA1EZzL0mSyDTajLSddKeQ3y3KDC1UN89DwsU/reDnbP2GAn56JIJ
	Oojs848sUtZZMEsr3tkvaxHerTyfK4A6HeeEKIeDQ4nASClssAvKHFlE7saxvh9K4SvH9mhXCaNi4
	wYeuod96Bnih8vq8fkhXdYam5nEokrWelP+S2CpGrmoiAOY1zYPn5NyCZIwhomAB+MX9640thqZ2L
	0NEvACzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFNI-0000000EPDG-3aWI;
	Sun, 04 Oct 2026 06:07:04 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFNF-0000000EP9r-3ghO
	for linux-mediatek@lists.infradead.org;
	Sun, 04 Oct 2026 06:07:03 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so297650a91.2
        for <linux-mediatek@lists.infradead.org>; Sat, 03 Oct 2026 23:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791094021; x=1791698821; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K9eRBqZKtThzspVubPXk6ZwkfjHPkOgXRwJNp+IkXIw=;
        b=Pv9jcpEppwC5KRaxgPKfcbyww8jGKlkvErXmvh/j5a/LZafbrf4kt7Th6zkTfh9Nu8
         JAqaFE+OSmYSrnde0F6VE+aJWUl3rO/ZcpQwhLRKFeHpobfpjIHfoDVnrVQZHOqhBntt
         hb7VS+aWtu1xk3xZOprGJcgXQRl22e3FERCBjltFgz0D+S6zEyRpku5tzmbhq26WM+j/
         NPfi6RLJavtcYQTb3QqW0w7CFQ7wTjyEcggdUv6VLQIejDZeIrkexcBHaRigL1Cwn2im
         o7oBtbp7btp5VpkoanGjyl7wEjMpGAIAfD/y5CKkgZ28xLDpjUqXxsuoL9NjWvWaZEyA
         n4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791094021; x=1791698821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K9eRBqZKtThzspVubPXk6ZwkfjHPkOgXRwJNp+IkXIw=;
        b=GxWw6TMljygf3zIULHSEdWb3/Q1H/Ymh4Re5OIIbng5OqG+I6QEjx61dfW1ysZp8OF
         W9DsFH6asB+Mx9XcMeN4FURm5Z0Qp+OXzynwDeDAXnsWYv1yRliCt4DzlTIGFZSEomlt
         klGjJWISDIIA/vwAj2a8avg+7esZtuCK1rgN53pgkOzIFPZbw+qGxA/+8eaWJVxegJLn
         lfgeuMiA9IUCYueaAJaw2KEviSmOxVBlRdvgHwpCGvnVYsOoxx0IXo9/soioTtmsIHVu
         9HHBr3xeE0nOBWcK4Sh3W5a1jjS5AkftCJpMRpD24S80e9VFkUw8Hz+Vq3Nicj7lFSDN
         fNUg==
X-Forwarded-Encrypted: i=1; AKwUvByddPRIueF+kPNlj61ajhhYj0AgcQj/JDhyt2rqD0CNvKNT71ybLlgqzyE29hHLPmV3JxBUEtHp7nTza89+Uw==@lists.infradead.org
X-Gm-Message-State: AFq9FYKwcuv4m/zaax0+Rx4whbS7/VZ0Vwi8SMGJ19RB4PsIz+wfQY2j
	h1nEBlc3ADfCMcxlowOuTm+tM0k50ffTeAgh1RNzSRnm+cSXRi8auM7v
X-Gm-Gg: AYBFou3sICbfKoMzHJATv0ebLklLpTjl1bOQJDkehjhxC5Ca9eUEN9Iu3junCVdILgL
	JpNRsQMZMriWCk+sLEyhqmPd11k3xNuvhqVlp/M5xHTJv1Y5RM3wQzi2er0vzAyi3X4k4CM+kXZ
	V/m8z+FdjMQWFQ550mZDkIetJxx4EAp/xXEYpJa/CfHFuYcpMSr3nhwQIWe/9bFQ6RZ26YNem1i
	9odDN8SBLQYN/MLN64y2sld0ox67x/J98OV5OrkA1RNXZYegR8I1XJoSNyXa002KrNOHP5Ugnox
	DwAaprheqb2CXE1+rbZBbbG0VoxdlfKw96RfNVOTmBkVA8vRzj1UJwcSPiMtWFIbAsfZKCJ4h3x
	je9+syzNhp6ztZ9KbCMDmgNk+MpgTLvPrn8oknc+clzf4Up25oRzEniAm/P8p+Pu+U6X6jEsK8u
	YGHpOOaUy5D7HXt+xv9VvXp1+CwR13g6U5Va2RXSg90WLE3FfjERhm37lPW/9dZrNjOovNi4rNg
	ZIs2xwDrK57yr3Lw6TzFmjN5QLpcEz1hT5DBpFDRf/lZt9mWGrBZrSAWCicqm6f7QUjY6xdGfKy
	K8tYdvGvRDoaeUWKv0haxh9yJucbGpx8T3pV1sHtgjZ/OpE=
X-Received: by 2002:a17:90b:3889:b0:3a4:c11d:b78b with SMTP id 98e67ed59e1d1-3a7871846cdmr2805455a91.22.1791094020938;
        Sat, 03 Oct 2026 23:07:00 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:07:00 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:46 +1000
Subject: [PATCH v2 19/21] arm64: dts: apple: t600x-j375: Add
 speaker/headset jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-19-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2977;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=USmIbIxNd8CqGfdxvcD6LlyT9J8+ju7yBuayKmryPMY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+R3zmUMuv0m3bzStIRRUaPBfw7vqY5lc39fP9q69
 GiQ0rOlHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKk2L2VkeLNmctGcwpI73e6/d0ZHPr/JbVZpJrXj04UazzW753Gf6GH4Hyg70+V
 tm82UkPQJjimL7NavrqsOn8xtLhGybFao409bLgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_230701_921072_16B04CC3 
X-CRM114-Status: GOOD (  10.34  )
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

The M1 Max/Ultra Mac Studio integrates Apple-specific variants of
the TI TAS2764 and Cirrus CS42L42. Add these nodes and advertise
them to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t6001-j375c.dts |  5 ++
 .../arm64/boot/dts/apple/t6002-j375d.dts |  5 ++
 .../arm64/boot/dts/apple/t600x-j375.dtsi | 65 +++++++++++++++++++++++++
 3 files changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6001-j375c.dts b/arch/arm64/boot/dts/apple/t6001-j375c.dts
index 08276114c1d8..2e544f43b085 100644
--- a/arch/arm64/boot/dts/apple/t6001-j375c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j375c.dts
@@ -25,4 +25,9 @@ &bluetooth0 {
 	brcm,board-type = "apple,okinawa";
 };
 
+&sound {
+	compatible = "apple,j375-macaudio";
+	model = "Mac Studio J375";
+};
+
 #include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6002-j375d.dts b/arch/arm64/boot/dts/apple/t6002-j375d.dts
index e6eb6b6c386d..dfdf90fb1825 100644
--- a/arch/arm64/boot/dts/apple/t6002-j375d.dts
+++ b/arch/arm64/boot/dts/apple/t6002-j375d.dts
@@ -184,6 +184,11 @@ atcphy5_usb3: endpoint {
 	};
 };
 
+&sound {
+	compatible = "apple,j375-macaudio";
+	model = "Mac Studio J375";
+};
+
 #include "hwmon-fan-dual.dtsi"
 
 /* delete unused USB nodes on die 1 */
diff --git a/arch/arm64/boot/dts/apple/t600x-j375.dtsi b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
index 8a1494949e4c..6c34fc86af74 100644
--- a/arch/arm64/boot/dts/apple/t600x-j375.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
@@ -179,6 +179,34 @@ typec3_connector_ss: endpoint {
 	};
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	jack_codec: codec@4b {
+		compatible = "cirrus,cs42l84";
+		reg = <0x4b>;
+		interrupts-extended = <&pinctrl_ap 180 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 4 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+	};
+};
+
 /* USB controllers */
 &dwc3_0 {
 	ports {
@@ -410,4 +438,41 @@ &pcie0_dart_3 {
 	status = "okay";
 };
 
+/ {
+	sound: sound {
+		/* Compatible is set for each machine */
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
+			link-name = "Speaker";
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
 #include "spi1-nvram.dtsi"

-- 
2.55.0


