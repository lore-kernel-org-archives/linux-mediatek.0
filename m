Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5D2CCF2C4
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2026 05:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JtLvsWaFWzYJWx/3MHHGGwSOHm7+TdbDYilQ89Jl+VE=; b=pe0QMOB47bLfujRrE+k2aT1h5D
	Jpr9Tkmw+U1ma0s3ixW4eQjDL/44fpl4dsm3zs5o1xDj36g06TaRXTz3kVG2KNre29pBMNYP+VoMB
	5S6FtAJsKk78Rs1BWh+kpxk0gdfXLcadWHzpQ2cY+gfz//ng5Fe67o/2zZijmp6H2oxs/6Q6ZLOfe
	ANY5Yn9PjfEXlyVJ/5JMItTkAWxe25wLclNoxfQUniSEs6r41SL9ZC2duV4Ykwm4CTH9RjSbW9IKq
	1axr8v/K2zGJo4lCFedrdAzJ8sD90Zj1X0hW29npcA309UvzrOSe4FhzE/EAAsI1vcmnvBHmTS830
	lclShXGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJtQ-00000005atw-0JTZ;
	Sun, 18 Oct 2026 05:57:12 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJtL-00000005aqI-1m1I
	for linux-mediatek@lists.infradead.org;
	Sun, 18 Oct 2026 05:57:10 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3ac5b090d16so706505a91.0
        for <linux-mediatek@lists.infradead.org>; Sat, 17 Oct 2026 22:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792303027; x=1792907827; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JtLvsWaFWzYJWx/3MHHGGwSOHm7+TdbDYilQ89Jl+VE=;
        b=OGX+5E71NW9STyd/MXyFEUs6F4AYpMnFkgQwgVRT+xEhh00sZmYZzYNbdGrDu3So8Z
         kpAzf03ZSTjhK8BqDu+rnPneCEdabVBAOLPpCGiwvgkSblwzFK9dmISZYDvSy9TfKXjg
         DqQhb66oYAr4+alFRKU+KQ+0ysxv0j+dmnin2gBTAP+5VHTjlsNkQ64oM7q3X2ZHQ2ZI
         weUb8OkgipvxchNxHXp2C5fwHz+0zKs1jC+6ZH6l+qBn2JJxzuTVJJ+PGmyVAQgP7ULJ
         VOZllxA+F9c6vJM1/9w8hGObMgDv+g6P97oJ9X0C02Ee0DFMJ479ZzcURNkjaTlziVw1
         FLXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792303027; x=1792907827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JtLvsWaFWzYJWx/3MHHGGwSOHm7+TdbDYilQ89Jl+VE=;
        b=D562f2+os0TqWoQHlR1NqG1M2lOCpYfIFRN7gSZY1TMNxxmqBoc1acEUqmsM9nW5Da
         q88lVXio/fs2UdEMlQu2iRyRrWMNaextxMu5CBB4QHBWfI8XiCR5GkVaa3IHySJ9WvmK
         CChSCYL10Q0SrpFbFm/AdAHkTuWnLY/cbwqX/wPNghyRLdSfkHnaCMLxIyA3g/Mk+Ce3
         t4j2wgwtAXNdFmAUQqb9ZPrPE7iu1DeHeIBFeUHmcuV/RrsVuHZdg1ZEPe8HopoBOieW
         L33dU5/rUn/3E4+ZXjX9XQ9hvD2KLYz1TocggABlqIGVwmWL8d/ItSlsVB9rYnc3PB2W
         LXOg==
X-Forwarded-Encrypted: i=1; AKwUvBx1+t7qw5N2SB2Wohm41oDgHYeBTlWO636kxKjM5lpA7nUPYMmUg4GfXh0zfbqSQdXcBKnMCYNon6C4vbDQSQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYK3c8l4yy+7MnO3WOCaHguVoUdyzN/rQB21kKBQpcZJ7/YShDiA
	SD6W7SclELCt7crgbhjshwvO7LGAPku5w0HzBgN14vWPt0YO7s5tvLdw
X-Gm-Gg: AYBFou3e/KnPhCqEPXyyDt2i1pSypK/regiVJNpHERYMczlqv+0gAXNRctNoaiP4Arc
	YYOdmwGtzRP8xN/qqiX/Q7Qcr0lOqMbwKETW+ZkZ6B9yEjWXJHxcm54vkqrWZok6DUON4f0zpPO
	0lJbrDijzijpHPNBNv9kf02Os4teTFHsLJhV1M+8q9eVhqOQ1zKMuV6kYWggs84MYSSAJSThbn8
	DHus3hy/dAV91KNJAq5TsTqhKFbvgRzbS7CvlK/4NJIBfiEn4uxk9RMiKjMsx8OQzGBsvbC44/K
	fPnfTVfS5412wsJG9U6qcGvYVKT4OZgDaDvOq9IQ3xlrsNUn9lnPu4O6YteAXoHj7Gj08QeVO1K
	6UnqyLlmUduavtEXrC/ic9dU47IsG1MFDNxIif1rmOnmkTh5yln0J2fTKWC+U/owaUrBOOIDwBw
	FfIz9N51OocSU+xpTduVezZ19fL9LPGJpOxYPTD2LRwH+PKo4GB3nU+UnMixcj22LPRs7rbgU0o
	iyI5Qej79yD23hoHxdwpJL3fcmEdLG5QeEHfOzhH7FSN4va/e+L2plnHSFLxBIyThn4O+NYOMXp
	6K9JWHsfC2aLfRmPb48MTXXdhOjsYjHve8Rj/Ua6LVmQIQ==
X-Received: by 2002:a17:90b:574b:b0:3a2:bb9f:f87d with SMTP id 98e67ed59e1d1-3acef1455e2mr2608414a91.21.1792303026863;
        Sat, 17 Oct 2026 22:57:06 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:57:06 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:10 +1000
Subject: [PATCH v3 16/21] arm64: dts: apple: t8112-j473: Add
 speaker/headset jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-16-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1828;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=j0rOzFFEXjkMK4EG4U+SxX5aLvReXnNVPffFl/z+LCg=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4vk0WW5rpj6bePiVjcsp16Lfqzil65TuCy+bap0h8
 FSdsZW/YyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNVR9xn+Z0QrbdPOTf875YKM+dsJj+conv81Y/chW//Ml2FFBrda2hj+J3+ffyc
 oeWGv1wFtZbaWyhtMj7/sNUw98ZvN44//Moe5TAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_225708_981275_8638A035 
X-CRM114-Status: UNSURE (   9.46  )
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
2.56.0


