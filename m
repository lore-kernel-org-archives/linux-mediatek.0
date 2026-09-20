Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADC3C982D0
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Sep 2026 04:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ojaG0e/MC0OxeKJgMYBSONXy+QRcCdaW5zg7jxOvgg=; b=LYfbmr7miwcgrYQnQT5jKwg9y7
	HQKwbbrN/zfyKepzQ3p9M62A5q7lZC0ikG9/FD1SHUlC0cIGCK0ZiBHWjads2LUWpIkfg33uwpKOa
	wZC+7mrhUOQqpfo9qq9b8jy14CItB2fWyqCvQFD+FQ+vfw+zRXwHPdyW6lMztoFq3/HMd5/3dyJKz
	bYRVHA2AUB/mPJU39TNJ7kKoDCs6QFV+OziX18lHp8f0dV6umuH3BwxYxK9pVHm/I7mKFtryZtnf1
	t6ZEWfs5fuE+tVm/YXMC94XD1n+nEIsQtcX5D0hNqod5Ano21PtEkRMfxj36PlFSGNwUhDFVWV4NE
	Y2rPlJUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89dU-0000000GuGp-0bpl;
	Sun, 20 Sep 2026 04:58:44 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89dQ-0000000GuDz-1lpI
	for linux-mediatek@lists.infradead.org;
	Sun, 20 Sep 2026 04:58:42 +0000
Received: by mail-pj2-x0f.google.com with SMTP id d9443c01a7336-2d93ff61046so19907815ad.3
        for <linux-mediatek@lists.infradead.org>; Sat, 19 Sep 2026 21:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880320; x=1790485120; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ojaG0e/MC0OxeKJgMYBSONXy+QRcCdaW5zg7jxOvgg=;
        b=tJHEsu16cyPRJNUA+B5TWgwEwafWotRAVwF1EvSgXH7WkTF9l4vOkUXmiqsTrdhPiX
         gY+NSX/hRvOK8INROKSGUzJCtNG2zrtS4xeDl9mKDil9Wyu+Mbdc/Y/Erz2qX2D3hMQA
         PJ6ug06iJPfaTTOKIrc3c+aT79hZw0waK3Z8fRxgCK+W2MbT1ze1AXk0lBuVGk6XzmqB
         IZRvitLGMT3ny70AS8iRaDgcvKxyTJw95gLZG/GxKuPc8SrMsMO6dW7QPpSKOQk9BecO
         7kQFONE318DgRzN/+3azzCJ/VcMNpeK1Oxn9sOK5QcMtLtde4X/kU+VNWltTCs3+sW8F
         CNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880320; x=1790485120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ojaG0e/MC0OxeKJgMYBSONXy+QRcCdaW5zg7jxOvgg=;
        b=NWHS1N4jKT8/dKM+fAHRyrTIzLeM3Txxz9ri13UXW+DI3GgUYM+o44GIbM6NhpuTb0
         V/qwUj+1XzUz0gg5cyHqPwKoNMxy8/6Fs77okTgQfwsQB3CKRY0c8XeN76kMySoEbGSi
         C6/Hjo2bXYTl1wLAxrpd5kNR4QIm5dwQSgWU/zIlI3yAhon66ZWHo5pZ8GMkQr3cOO6Z
         sxYUr1umj0HYM4yqPsLGxNda6XWEOWtam3mlN1km+YNjg0R2IFBizqX1ZH7N9QMh7Fhn
         8kPnXfR6q4h6vHDgjABj5EfbaNWnXq/hmK2bicxY/vNXCcT9FJhUwFRynHp4jNZqZg/w
         BGWw==
X-Forwarded-Encrypted: i=1; AKwUvBykKIJcg9PdWKiUBJ/VsrIDSbLuVNKX8qTDEOAgs1NzsPEWO4s1LD3Ja++KMsyX5QbDQaEo/zidBwf3REfXRg==@lists.infradead.org
X-Gm-Message-State: AFuF++nIKfCBdrApkJNzCAGVCm+TcdJXmhPYhsufidSkhzG0XAOSBb6+
	iwNmEiYM2j/NN9katSdi8zyoNjPgZThZ4QtT8xZzN42LCUKo0hKA2Z3b
X-Gm-Gg: AYBFou1saIyWQLQ9cgWqs/QCDUxZRCoic8rcUuHPXL8iNilUd/RgvKN6tgEZ63pjkLe
	Htafq+h/xhyLgmLKIaF8OJrLW7FIjJI46zhfV4c4aCciuiGrhym+kBHwJJOwjHY7/9EI0tTunDO
	WQIhkxsk2IB9Gx/sEmQ5bR78dSAXnz60ZJXVuxwGO0Yq75AUYDXXuuaA4Cw7Oc/nXt8oHW9MrQU
	v3Ui3B/h4mhm901nLAmF96jKvH+erc5qKMzFQ7O5xNCXeQ3YLbcEgCDrY1JoKzDvYj6OFaeaEZc
	+wAQZ7C+gORph2in+BUsx/mv7Fm0YzV30uczB+nCYDYLhXDFZMGCP+Wi/PhdrC/wC8erTQZKfZv
	AXAmNePKhlstKKez7IY/veC3Dh47wfgQTC2I+dJsyK0jnrGEj0uHYXGvLY62qxN2AQ2LR8qUADV
	qNLXYNcWzwk2b3bNuslJA0qzAS4S/5hQE3PQGVukm1J7iY8aJipE8YDOB4+rWxObhGobXSd33x+
	jlPNelwCyPdQnJRR0b9p59o1rYgwdiwgu4ymDMlfsdpJ4qXOcuzbYcf0leqSWTkWzym6mmD/7jp
	pP2vcMpC2g7RP8kowJTL+eeloRWr8zU0uK+tllN0kmO/Ryk=
X-Received: by 2002:a17:902:728c:b0:2dd:ad74:ac1f with SMTP id d9443c01a7336-2ddb1bb26e7mr76373875ad.26.1789880319821;
        Sat, 19 Sep 2026 21:58:39 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:58:39 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:54:02 +1000
Subject: [PATCH 23/28] arm64: dts: apple: t8112-j473: Add speaker/headset
 jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-23-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1770;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=CU9srHz2GgdK9c8dFe4loM4R0cHA8ZEmrmM8hXKxyBM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr05VcxLh0uAQ6FiSlzpQTeSvnrh373E/mvGIyzzXm2
 3z983M7JrIwiHExWIopsmxoEvKYbcR2s1+kci/MHFYmkCHSIg0MQMDCwJebmFdqpGOkZ6ptqGdo
 pGOsY8TAxSkAUz3rDsM/ZaXESME8nayVqaKSDUuiH7OXfN39fW9z/Qe1+UohogezGBmOzPm6p4P
 dwPaF7e1y78Xaonw8ektLpG0KnYNSTkqcXcYEAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215840_535118_05509508 
X-CRM114-Status: GOOD (  10.03  )
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
 arch/arm64/boot/dts/apple/t8112-j473.dts | 55 +++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index 105a9d118980..50088283f2e8 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -85,4 +85,59 @@ &typec1 {
 	label = "USB-C Back-right";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@38 {
+		compatible = "ti,sn012776", "ti,tas2764";
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
+		compatible = "apple,j473-macaudio", "apple,macaudio";
+		model = "Mac mini J473";
+
+		dai-link@0 {
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


