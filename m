Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA3C5C982D0
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Sep 2026 04:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nUzG28jusU/5HuPttslpkNc6ZhPjJK6W+gnFlb09Y7A=; b=ptCj5YK8a/0ixK4Oal1U328JFO
	/77lrpDPWgnC1YH2mwMTtzLnm3MnOfMQ4BkbQZ9JjyCkK5OiD2WxqXoO6XYg4wzbA+bQiUFGrzplh
	dTEgkyBKLTJaC29q1HCTyFN0tLVHYUa5VcKFSa1xjSVy4JUxc6W/q9VAfgVBZcIMOcGtn6pBPCAsd
	R1pT+CzUY+f36uRXzKn2AuHXLtVF5qdBxULjz0Y5UupYNVQCqtSt5sZKyYNoqKSX+WbS4UDytVFV8
	oJOGj/NvAY0zbqOJEW1tO5kylN8hUPL3OhseUOUF4G9tZQ0k2txOWNIgVonqZd1fz2fxZ/vCWxyp1
	+Y6/3ojA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89cb-0000000Gtd3-3HGv;
	Sun, 20 Sep 2026 04:57:49 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89cY-0000000GtZZ-18RQ
	for linux-mediatek@lists.infradead.org;
	Sun, 20 Sep 2026 04:57:47 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747f066d8so6965205ad.1
        for <linux-mediatek@lists.infradead.org>; Sat, 19 Sep 2026 21:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880266; x=1790485066; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nUzG28jusU/5HuPttslpkNc6ZhPjJK6W+gnFlb09Y7A=;
        b=ClusIA3DQfq8u+f2x5hM59d8YNeRID7LGx5SOAmaq9asyA77r4DPpiD2gRxCT4bbeQ
         ZNCBd5aEs7WynrBvNFqrxnuZ5Bj/iVHRQP2n/NCHcNEiYWZ6LAucwlGq8D9iaEGyeyYu
         0nHx8HX0OePhwG5WhrDj04OMHzw+JqxjKtDV+qy0oW3dSDxQRJpvH0QJhSJXnuCapcxs
         OXBDjFDKLPHLO3YeUbM/ydDr4MtxrDoSuvFivNfJdiiGia1ZUBbZinb9kmWzczvjiYGP
         cUnL6Nde1RokVUrm/iUdXeYxoHuVjOlbH+xV3JV0zx1R87NMM7+jMt4UFGOWtyfJrIMQ
         tkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880266; x=1790485066;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nUzG28jusU/5HuPttslpkNc6ZhPjJK6W+gnFlb09Y7A=;
        b=inEHLwmUEqN1RL8S7aLoPkdK6n/axhlGSN0Gw8VIw5oZeejimF43bjjqE/wk/2xkEh
         nJUrIFiEMbm+RXpip6/xH7gkWK8lD/1bJaYRPuBcUIn98Fbb6z+2ystADVo+9IYcJ7vo
         LHRaC7kgW3jqRmUr7/C5dEsKfYtT02xrs38qgT6OXJ9ggWbbTb/TbBfWDFgiCMGLrQE3
         Un8Fb/JHe/ywcZLqacpZkrfAZKAh8bBvLJ/7eUXP8ZMi0Tqu+RHUuwRNSnmODU4mbSew
         YOchLxsiSiV8o5DcvoQSTDk+Gs63wRzNPfRJjfa7jblr1qdmtuDBrEcfn1vyeQNEdm2o
         Hy7w==
X-Forwarded-Encrypted: i=1; AKwUvBz/oZfwL5J1mszeTbEFYFqOxjh0zUYmXQZfiq9lUz9C8qT9BOTVr1cxRIA5ShUQDrnRAvrxfTvqOSrvoKShDw==@lists.infradead.org
X-Gm-Message-State: AFuF++llOHU0BFzVu/dDZIR0JzbiI8NE1fquI0Un/OJnLErrkrKtFyFt
	f4FmoC09M/I82jkyIUGWKs9nzkAKixXi2PhfPDynq4vg8W7ef3L0iaOz
X-Gm-Gg: AYBFou3O58lbtbtl8TjKxUa2jkyEAyXpjQLFX40ra4K+wFog18ENHqzFmSGjaeZemX8
	fyOnstoM2qkcyghteQlJN+myv1Rm4rK717g7okBaewUgZZegL+Cj199XjoJ7GzwfCHQT5QWh9ry
	Bt6k3dUS2tlYXRB8D+NxB3ZN2DoR1JF4tU5ftVRRi0MUfXiyTiTIePoJ9s519abejWSyleeynNJ
	yLFkkiAyOCqktknuNaN6MJl+ktJVMIfprah6rqnlG+/fqgd0R/h8Z06jo9E4jfmKUpa/oYTVWYh
	MQktOufMqElBE9m9LNfsmls1db0Xq4fOBRhtHjvE5WyctjVw0+n16/82j8D7MT4Z/tYROZezU9W
	d9PAyafxrCRey4DeXBz3vAZYLcoIja1sZLqOzT9XMZ4luCL/2W9aZjkfLx88emSGi8l8rZ8tbZZ
	kGGJdslAbhiGfN8Uub/smBvjM1bzHbqj7jtG7kWXFEEcYd/qLi/S42uZ5qslBHHFz88Nsclalc+
	ZjrCMUZ6ON8uU3LsFZgLe/YoLciD453QSBBOgT27qSXq/1GGIfYMQAirtd9YDt5dRXvaGENTFcv
	W0Ls00XXPui+9JZ9PQiWdyzEb0CT5CpuTIPsjOz3l7+Hbmgd
X-Received: by 2002:a17:902:968d:b0:2dd:c100:2522 with SMTP id d9443c01a7336-2ddc10025c8mr27195935ad.43.1789880265641;
        Sat, 19 Sep 2026 21:57:45 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:57:44 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:56 +1000
Subject: [PATCH 17/28] arm64: dts: apple: t8103-j274: Add speaker/headset
 jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-17-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1821;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=8zNWdtKPfrMTot/trMqvbPPvlUGNanqtL8uZSqGwRp0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xXdco7N+HGOUWzOheZGiRfnWExFhb/cm2C20dHE7
 VzbsU+rOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFNtvpqRYf6XsGtTFtTf6XP59EMmqiisXvPxPqbFIjOKGw6XVD75d52R4bZnwxJ
 Fn0PT4412Hr2i9FaFwzzHdc0UvkJne44aZ/lbnAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215746_331725_E0E96F6B 
X-CRM114-Status: GOOD (  10.15  )
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

The M1 Mac mini integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j274.dts | 60 +++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
index 1212852251e0..4b30f08eaac0 100644
--- a/arch/arm64/boot/dts/apple/t8103-j274.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
@@ -75,4 +75,64 @@ &i2c2 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@31 {
+		compatible = "ti,tas5770l", "ti,tas2770";
+		reg = <0x31>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
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
+		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+		cirrus,ts-inv = <1>;
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j274-macaudio", "apple,macaudio";
+		model = "Mac mini J274";
+
+		dai-link@0 {
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


