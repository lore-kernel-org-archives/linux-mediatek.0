Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B68C982CC
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Sep 2026 04:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N0g4srKdHMimAxZHAyfKwZ3cY0lFOq9OA24YFEe5Fn4=; b=zl4lfUF2iOL95OkXYf2vApmLKM
	gIdJlcooREkdJRWnywZ9l3WDCuJv7+QV3VaZUA1c6GJkoS7oswR0kqEFJvKTS8wyomXA51H9S8eqr
	PaHE7gbuYpZzl9Jq/uxNDa9zJaDAN2mff3T0YeiyXV5sIVGoWrmvZbUfhjSkPnKA8EVvgBiYJN9aH
	paV54J/smbvWsJZ6Mt22ybVv4k47P+LArVg4taFq/WZEieTFt8LiXhOJaDXv3mvJVGcsTZtjzeqwo
	tkAaRVdYgFV2bh6Pb0XbSvdMTHmwDmqx2X2+cW/sDsQXsZXh4TSMq3PCiLyhqf37EmR4QJJJYvCFz
	I4n3u7LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89d0-0000000GtwB-1k9M;
	Sun, 20 Sep 2026 04:58:14 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89cy-0000000Gtto-2hvs
	for linux-mediatek@lists.infradead.org;
	Sun, 20 Sep 2026 04:58:13 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2d747f066d8so6966005ad.1
        for <linux-mediatek@lists.infradead.org>; Sat, 19 Sep 2026 21:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880292; x=1790485092; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N0g4srKdHMimAxZHAyfKwZ3cY0lFOq9OA24YFEe5Fn4=;
        b=PvOAoYbLXlu5CrEhQWcX2FQe+GV2GfeVbnkzL/id7SsO5gzwMAQt3SBSoeqry5y1SG
         BDBPUHrwKeKsjnaUzudKklrSCU6EgQtoDa3eumM3Ei1x0O/z+UjZUEe/zz9bkLNwxzoS
         tmkhsF7rl7sTpDNyJUf2QAUL6UfXIzUnuZYln2nfKKugGOQ06WGBL3UOMcOUuPxqJOkg
         rTqJkNDJlgh1vdUquhR9riZtT71F5np4ekdLKzEOT1s5IaOutmKpnPL3tYIiqm0fsECu
         2yOujbwhckc3m+L5X7C8zxtHzRL3+flmscY3UDvMUS6Ff+l1pKr+N+R1RTTyvC1LDMxz
         GL6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880292; x=1790485092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N0g4srKdHMimAxZHAyfKwZ3cY0lFOq9OA24YFEe5Fn4=;
        b=QXotSN4D+ScZXzgvUZNIz3PRaC8Bt/Lf5VQixeRXNzb/Hc90IzvR8awrCRaIJJ/5md
         ITWY7Sb+6LNWyiXGyJxUOj970Dh1Q4N0SIGfiN0/qAnkZnH2mwpf4xLdQkb93pScOY/w
         rGzyNHO0qCNP5h43Y/0WV5CCvDONWgdn1DIcjrWsDT3vBXeBmwiTIqiP8fnpyIS0cFGq
         UgHs4G6LWN3HOUd4TpXmcTumS9fdv3z+GUkqAhCbxw9xMGkjMkGJdXWPLTEOALJ4nGm+
         WoGHttdCyP4vDL6uhF0dMWmQ/pDBM10dbxAjaY96s3agxaYUTLjlMooH26h+ibXPS/9b
         Vmvw==
X-Forwarded-Encrypted: i=1; AKwUvBxowkAhxJG3NINI6JgXXGu2Gt+3DVm9NQ4IvybrUjKI1fBaNR84BIl6T9J0no7t2gBvlLPs+Qg5ZpRX4GSJHw==@lists.infradead.org
X-Gm-Message-State: AFuF++ksRyFDt26pn2at16xNpDmVT0DO3EZkSvwdWPXHBtmIkV/Qy/Is
	j6AAcaLUUgM8YHhEOclqOW7f8QgVgquV9kWboeDAv+jOWSlfbDUaI9SJ
X-Gm-Gg: AYBFou2Z1OfpF92M4VA9Pld8nN0wG0IQZfs9A7Pk3xCLYbhTJN/TGltezPollufsmCV
	W6ALJPDLPl7C//anQTb0mL4vl6mKFZQm7BGnqL84qbYf/VypH0HzWDv9o43izHZenLo5OGVi3Aa
	5yJMMBq+D1H2jABFr5ghFB7O6I5R9svoNMnkNAMoZuXDVISWrllj2T9Z5Fto4u/m29caZKQeJF0
	1oqXcPWgrquRgyh7ME1cqufz5n5HW4B09eqE+W4YbZOhlN4alXxTC2yAZ5/PFwcArVS7uaEgJm6
	8D5DQnYTZ9IG/yecnIymAdSw+msgD4eUCb5aK6S/H4W0ShQjCtO3prez4uxtfwB8GXi3/Ep7Bt+
	yRmGm90PjxlU04PFvRP7BFfbw703dESO1dwu/pZJRqFn4pd2FqnK9uYHzZq8vp0/2gavx5wRHF6
	ugiPACiikRiki3MuU+d4vOsyteNfwuiUk+et4iKmfaSbPz40Gw5womccOxU86CtPm8wa+b5HXQ8
	e5FlEse3yOxVl4O4rHnjwrwBrreznvoRQI85jOAQ3qYnAQhLAykmK7yvqZ73KGQZXTpBAj5aPxG
	BnnAl3zxMnH71z5zJwtxahTzQxf5UowcsOr2XqHoi+fMIZlYp76K/w7Vug==
X-Received: by 2002:a17:903:38c7:b0:2dd:c100:2517 with SMTP id d9443c01a7336-2ddc10025aemr41443735ad.32.1789880292039;
        Sat, 19 Sep 2026 21:58:12 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:58:11 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:59 +1000
Subject: [PATCH 20/28] arm64: dts: apple: t8103-j45x: Add headset jack
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-20-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2387;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=smG/fh+zvKf45VDf3t0AAqeGFxv2Guj0oJz9KpBdYKk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr05VuyhvMW7Ds9h3dXNYauaI1fvENjrYLNloXfE7/+
 /9FwcL2joksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFT/msPIsGD6SeetzNUyV32e1hbMDmx9b/3btb5snUCd1rEgJq2buYwMVwW3aDW
 dXZGUEtGZUOsgVbG4d47hzTtOzj7lP3bJzRLjAQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215812_727645_16C50561 
X-CRM114-Status: GOOD (  11.22  )
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
 arch/arm64/boot/dts/apple/t8103-j456.dts | 33 +++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103-j457.dts | 33 +++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j456.dts b/arch/arm64/boot/dts/apple/t8103-j456.dts
index 090c97bb781b..41ec1398f981 100644
--- a/arch/arm64/boot/dts/apple/t8103-j456.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j456.dts
@@ -88,3 +88,36 @@ &pcie0_dart_1 {
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
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j456-macaudio", "apple,macaudio";
+		model = "iMac J456";
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
diff --git a/arch/arm64/boot/dts/apple/t8103-j457.dts b/arch/arm64/boot/dts/apple/t8103-j457.dts
index ebddde75455c..aa2a08cb22cb 100644
--- a/arch/arm64/boot/dts/apple/t8103-j457.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j457.dts
@@ -69,3 +69,36 @@ ethernet0: ethernet@0,0 {
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
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j457-macaudio", "apple,macaudio";
+		model = "iMac J457";
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

-- 
2.55.0


