Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6492CCA5FE6
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Oct 2026 06:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LtNnhUCvwBmA1Pd0xS3AXh7wfPALnqbmv0yzoWp+gA0=; b=VNW5PDE7Rc7IdZpxLfaK2jhInJ
	h9MieyDrBfTAFZGbz947YQS4aDQjgWHvBSrN2TFrtoiU5oz4P4N1nz2s0MAgrE6TBKx5KfeMgSJsF
	TCMzzcnzC7WCTAurUwWr07KMSCJ57ubYgLX1XicW4yysNlP7C5CRngOgXf4q+PTCKhMFlg7CD6tpB
	Sb9JjsnCKunhr2SBx+l55eE1JV2XOHpYyXQtY0dikUX1Tg46i6pBmpDmFeWilVvvW0idKTy3v0nVV
	mO+qbvrGszmJ+BmZkcpIJw9RrzCqO+S10rpgw8cBk5flEHMNtLZb4hAm0kgU45JycEb4SXctoCo0b
	7INBlkWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFNW-0000000EPQd-1xzk;
	Sun, 04 Oct 2026 06:07:18 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFNN-0000000EPI5-0kzg
	for linux-mediatek@lists.infradead.org;
	Sun, 04 Oct 2026 06:07:17 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-398b3b189e0so218003a91.2
        for <linux-mediatek@lists.infradead.org>; Sat, 03 Oct 2026 23:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791094028; x=1791698828; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LtNnhUCvwBmA1Pd0xS3AXh7wfPALnqbmv0yzoWp+gA0=;
        b=dX91T00jyjfZS0T32vUIDB+TTEYiEwoXp0xdNcxrSbmAQOWAW31v84JBmGi2bdPJFV
         k46ThcEM4locd1y+OJ4xsNdH5TWtrNNLKuOXz0E0KWrni1O5rNjDIzRhyCML9rHEUv7u
         KU0v2EYdzrODPdcArm57Fr7y16L95oyb3F6oTqKeKKVlGukODL3sxX3xd74anFncWP89
         D5KFrM/0reppP56KzUeLCyAQ+uLpVKSdeI0Zdt6Se3XKleT+I+1uPww9QlBSQxdkvtCp
         muIXecCuvSUzGbybATYy1ghTplupJP5Ix0/UMqVPbkpHWO7FydAR55Ab2gwiKvFoOqvs
         cBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791094028; x=1791698828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LtNnhUCvwBmA1Pd0xS3AXh7wfPALnqbmv0yzoWp+gA0=;
        b=cPgjeChDzge+YxzmEFxHEBAfFO2jKNjnKBNFA195FUWG2DdOD21ddPy8r7KzzA6I/8
         Q6btylyJw7kynxurZDzXQNfkXIL0QFoWwPIY/T8dIbRRZ9KzwkPja9GwFFFkHYQIaLkm
         iRvNsYJctN4I1CG1t3SrLfJ8V4jyRZeMHVi0KU4yrgpCrWjMJSy1VaxfFROyUKzh5ise
         DLkW2H4YbPIA8zbXkJ9JR9WAx536AmGZvP0OhHtvxq/5iIRbdSJbPsbNEkLEbwyJIdTb
         +v9wDZbdA+d43P1vgGl8ak0gMPmV5HjyVEK/z6r0upBn9xfiFHeMHKRhuMIW520vlC5U
         WOrw==
X-Forwarded-Encrypted: i=1; AKwUvBzvpPldRXtV9CbknHoFP0hhXBoVsBQhXo+ZnqvqehhpyBBM9t7RAchO5UzoGUYA+OZy8gUMesA09+dL5EiOyQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYIP+yxtzZuXy1LQFVd88/2wr+t3maNU1jj+mqFd+mIgI9TZcwmv
	C/X3A3xH8VMRq92RIIAVud7NrBSE4Iw+R96VLjsF122QFdIQjBntGucW
X-Gm-Gg: AYBFou1uLrf/V1zBN5hVRerBY9aLKBt6ELjTH2VrS1CX1TyHwtME+D98m0lTcRwSCcB
	wyMriJhmtcxh7tcmh7dbW2iWtLg+V2GhyoWeNsgTsa0PtsgdCMu0ndPNfO7Ic3Bh3L0YFNzBMP/
	ohL4eJy7Y2lELDkt6xNECRh2Ovf9miXnr+rSB3Z89cUBj4vhTz08w2h8lGCW9uAY0ohqBDfJ+8/
	Kvw6PpzSq5fYqaZSD0DDjPVBrdtqpRd2DL32qnrQY1DcPTldRqTomJrSShm+03RE7BfVlZijtb0
	krfSxvnlX3DMi1pA2PC9Ocv4aSYlAOGEnMV9gzdyGxq+m6N5wW+ovL2QRZjWDFJGRhxBp6+t62A
	rSvswpiHA2Ff8dnA3ww94rruMbZm785foXrDCjBVWoeqR1qsD69sVMWUEqvDcL89BtoHve7g9nu
	qsI+PyuLe/Rl/oyNFJOjHf+xVuvy9sgv3fOSuPY3qj0+XgL+DOFXArfXIFwOUM+i9L+GF7EPKSK
	gc0hWZzlIl/te/nShqAHWZJMlP/8GN+ZfaajWlmdqLUGJUVEbDSfJ8iseMNbuS10r1v5/diSyBy
	iaGEMfSjlKMkAQhi43z4JYTG8JQ34LQExq8HVLsQNukOQTg=
X-Received: by 2002:a17:90a:dfd0:b0:3a4:bc68:310e with SMTP id 98e67ed59e1d1-3a6ce7f684amr5172343a91.39.1791094028414;
        Sat, 03 Oct 2026 23:07:08 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:07:08 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:47 +1000
Subject: [PATCH v2 20/21] arm64: dts: apple: t602x-j41x: Add
 speaker/headset jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-20-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3704;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=gcEmnx4AWZiPV2AjRp0zlkie8hCkMFmgpjBnY4FNmw4=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+RHeG2cdUNOvI+5MOZVKn+MVrvVx4OTZhY9W+sw1
 zhwynKjjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFQfX8fIcNHTODT83Aq+rLku32+9V2lzY+za66QQt6UuLm12cvnh9YwMHR3d36K
 upVVnf9232mbCnOgoM5NJFSfvCcT+3bzyZFQcCwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_230709_224086_7C651DAD 
X-CRM114-Status: UNSURE (   8.79  )
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

The M2 Pro/Max MacBooks  integrate Apple-specific variants of
the TI TAS2764 and Cirrus CS42L42. Add these nodes and advertise
them to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t6020-j414s.dts |  5 ++++
 .../arm64/boot/dts/apple/t6020-j416s.dts |  5 ++++
 .../arm64/boot/dts/apple/t6021-j414c.dts |  5 ++++
 .../arm64/boot/dts/apple/t6021-j416c.dts |  5 ++++
 .../boot/dts/apple/t602x-j414-j416.dtsi  | 35 +++++++++++++++++++++++++
 5 files changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6020-j414s.dts b/arch/arm64/boot/dts/apple/t6020-j414s.dts
index 631c54c5f03d..2df6a39c719d 100644
--- a/arch/arm64/boot/dts/apple/t6020-j414s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j414s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,tokara";
 };
+
+&sound {
+	compatible = "apple,j414-macaudio", "apple,j314-macaudio";
+	model = "MacBook Pro J414";
+};
diff --git a/arch/arm64/boot/dts/apple/t6020-j416s.dts b/arch/arm64/boot/dts/apple/t6020-j416s.dts
index c277ed5889a2..7f3f0d6eee87 100644
--- a/arch/arm64/boot/dts/apple/t6020-j416s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j416s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,amami";
 };
+
+&sound {
+	compatible = "apple,j416-macaudio", "apple,j316-macaudio";
+	model = "MacBook Pro J416";
+};
diff --git a/arch/arm64/boot/dts/apple/t6021-j414c.dts b/arch/arm64/boot/dts/apple/t6021-j414c.dts
index cdcf0740714d..ec4050ec0ecf 100644
--- a/arch/arm64/boot/dts/apple/t6021-j414c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j414c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,tokara";
 };
+
+&sound {
+	compatible = "apple,j414-macaudio", "apple,j314-macaudio";
+	model = "MacBook Pro J414";
+};
diff --git a/arch/arm64/boot/dts/apple/t6021-j416c.dts b/arch/arm64/boot/dts/apple/t6021-j416c.dts
index 6d8146b94170..0037346959a5 100644
--- a/arch/arm64/boot/dts/apple/t6021-j416c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j416c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,amami";
 };
+
+&sound {
+	compatible = "apple,j416-macaudio", "apple,j316-macaudio";
+	model = "MacBook Pro J416";
+};
diff --git a/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi b/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
index 0e806d8ddf81..852fbcd6277a 100644
--- a/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
@@ -43,3 +43,38 @@ &wifi0 {
 &bluetooth0 {
 	compatible = "pci14e4,5f72";
 };
+
+&speaker_left_tweet {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_left_woof1 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_left_woof2 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_right_tweet {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_right_woof1 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_right_woof2 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&jack_codec {
+	interrupts-extended = <&pinctrl_ap 59 IRQ_TYPE_LEVEL_LOW>;
+	reset-gpios = <&pinctrl_nub 8 GPIO_ACTIVE_HIGH>;
+};

-- 
2.55.0


