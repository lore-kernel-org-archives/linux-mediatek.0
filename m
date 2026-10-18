Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F610CCF2C9
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2026 05:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pMJIf3eDmeaMzHhnQzRW/7JZUIebuAdZzOruphxa9D8=; b=rlxubECoNAX5t/Ep03a7Zbaiyk
	R0SHrJ0ajausp83zdWTi6GFkLJ4PrHbJUchMXD9rg/JNDwl7QIaYyJOE2hP7lnKOptwjWF3QFcYfn
	w9I3FwrrIkltkSs+XggYy+C3EseaeT9VH5RFXKQW+teFONZIm1k6yoV3RZIxr3S4Yts7tSGpNgeWq
	sLK2HtPzfksyxMsPrvmWK5yASJ09VsbczyGewzNBfv1OOE1oHIdxfLtGszMQCJ8PdWmLmjQlT5PsM
	eKo+Ebjtz/S0vo8gocpOYXC3vtiuSOBYXQL1LZ5SVMgyZoR3/DCMXA/AAN/vIxd2RXo31wu8AaqS0
	7rqLbQEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJuC-00000005bSf-3BKA;
	Sun, 18 Oct 2026 05:58:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJuA-00000005bQJ-3P3T
	for linux-mediatek@bombadil.infradead.org;
	Sun, 18 Oct 2026 05:57:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=pMJIf3eDmeaMzHhnQzRW/7JZUIebuAdZzOruphxa9D8=; b=FLBPJxfW0fF+5vmft217TYntwH
	U4xTMXXdFZKWlB03uzbuUypv8QRPxrGRWDSV6+W75EWNFRF6gfI6WilstkTdEya3Erq7+N5lSwFdX
	PAMTwhcEy6Xvtg1va+03wsp1SIeqIzC8u1k76/dgWu7kVKI3jZHAkD+wP+wiRkd4DeUUW3rQNOj64
	iDbLeEb7/WKlpmCdiMyveoOWFYCnYIdgA3e4QUPOwkdFj7/H17TvtzwpxHG38hfq8m2RkJWF/VojZ
	35fTuegeYYTxjc4jkJKbBlE3lmNYeFlWyu6QtyTOlS70PIWNqHUXYMKIc0dKku+F2ycAzEWQnPv/C
	mJ2v+dZg==;
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xIJu7-00000002kM3-3ZLB
	for linux-mediatek@lists.infradead.org;
	Sun, 18 Oct 2026 05:57:57 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so1015547a91.2
        for <linux-mediatek@lists.infradead.org>; Sat, 17 Oct 2026 22:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792303074; x=1792907874; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pMJIf3eDmeaMzHhnQzRW/7JZUIebuAdZzOruphxa9D8=;
        b=luSfvi2WrraKI6FpcQtcWMbKoADsJHR9tiCnDGrB+xmGrGDtqao1Kmag91cZLkDRK+
         4SlJUxq0BTRwKjHskIykv4RGHSmbuIXkhrTuX8SV18MJFynsRPUe3u8oL1myiXLwdUiC
         9S4xJUEXia7katrgBuBIsCQW/VpdB8aR21KD+C4S5pW8wBJILGI+q9N3UeFAEtGrHybf
         7HbCE18/L3WJ3srcyLVVYw3WzMBBYzoQUfz0VU1PV0JsdsyK9Ta9YBZ2F977feKb8vpa
         hSwHeYhQG92Q+oU3P/FTh8CSrMrpQ+tEVqYoIN5PJIm2e3l8L/+LuVxsI+hANvMhxlbi
         Ly2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792303074; x=1792907874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pMJIf3eDmeaMzHhnQzRW/7JZUIebuAdZzOruphxa9D8=;
        b=fvSR9WtijdSYta5Gx78N+qk6oUcCynb3XLfbNqPGD4Dvpt/hAI09BE6inhdRJTz62O
         p/TnIP4fzCYafasR8ZJNbweMrWS1zkmLgvlOx1dHQAAoDcexXT8fT3oCU1oOzH/tiQ1E
         m0ewst6lVa5FqyECpggRrUUIuWgNvlJIUEoKo0kTMeNaB21LQW/gT0ufugRbRnFiF7+5
         A0fRCLP5RT12F8TMQRqpEu6CIHW0fP70HgvgXiUT0abFHlao3dw9ztFB3P/PKRULvCLB
         bYMvz+m+OhWvpZSaACyLemcBPgXZgmi5bC8G3axcGaOm4AVTMLBHWPBYA8GHGFN3wvl8
         OFrw==
X-Forwarded-Encrypted: i=1; AKwUvBwUl36jVJzgz20lT5jHgtiz2AI028Q9BAuIHnegaqqnd/2pTAY80Rf2C4XSyRkKQPiJs/BpNulXXH19IE+qFA==@lists.infradead.org
X-Gm-Message-State: AFq9FYIkoVK5jm0i90FZLMOCItAUzp0Av+tdXyQJEA2+3uIlt4YOBIQ9
	3CiAXwDt2gPDxoaIQq2gTbPIaBpyv9fJJVcMyb+Pqf3WPMkTxcsaerSb
X-Gm-Gg: AYBFou2K+DJ0O04J7QTBRkzRsgwzs7dHhzLM1MVbEgf5VFTKcsaU5mJcZDmXz+VgAbE
	W+T2PPn3DHgX4l62YebvJO7MnM0mpymsYUyUunpcWYuVREQdjYylBTg0GCXFHv8ool3UWnsQkKz
	hE543SIdM6A6zotLVahr3RiAS4n8NuMQsWTbnflbytnSDLtcl/24IPfPcf13N5O5tJqqcuvU9AO
	O2kdbGUJyfXMeiuKXrVoWGlW2a084M6s48r2AOP6d/IMi5X5TQUUFpw7Da07rG6H3yWWHf24rXo
	pDkNnqk28VtaXUVHqwlojIfKj5Ua+UnZsmioPhQy9EgxkPMyPQ5BnbjVxjxN/luLVhnmTJ2z1bZ
	kmjFmEeo/PNNMQH+feHe2iPjmFPH7IevWPxwDsQYH3xmdmoyLurkTU+vpZx8/LkOix47HNhAPp8
	VxuE/9FO9YS1y1qZ0KjwWM2Dk1zwQom2ln+c2XOcVPX4nUmks2KrBb+0uIFUYxoiv+Pzr8RZqvD
	mvxrrld+LUB61fctpGeIfZ4K2SHfzbtj1o+0RobLtEYllfio57NEQB/P7DEVRgJ0o5X6HpA1yCm
	IKZ+I544t5c3+54+DuI4zR9xXPQeyiioJUd44iUSmPRECtOa2FecT3W0
X-Received: by 2002:a17:90b:1d4f:b0:3a0:ca1d:b40d with SMTP id 98e67ed59e1d1-3acef3ce33fmr3975115a91.55.1792303073667;
        Sat, 17 Oct 2026 22:57:53 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:57:53 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:15 +1000
Subject: [PATCH v3 21/21] arm64: dts: apple: t602x-j47x: Add
 speaker/headset jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-21-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2504;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=nr9+CGWG20c/KVGlppqHBL9R7cNwf/g9iBmeoDmHgmY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4vnkDzg9mCoWcqDjxoT0H5LPMpd8KQzJi39uzituw
 3EwIuRfxwQWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKonzGZkaH696/E3gdUNqtv36a7ffLLu7PqI1sLuRZn5AuecV22J9mH4seAo+80
 gXbd9iRv3zVguMP3KCd34U3KbTt6Ojz+emHaHFQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_065756_178253_82668A5D 
X-CRM114-Status: GOOD (  10.58  )
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

The M2 Pro/Max/Ultra Mac mini and Mac Studio integrate Apple-specific
variants of the TI TAS2764 and Cirrus CS42L42. Add these nodes and
advertise them to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t6020-j474s.dts |  5 +++++
 .../arm64/boot/dts/apple/t6021-j475c.dts |  5 +++++
 .../arm64/boot/dts/apple/t6022-j475d.dts |  5 +++++
 .../boot/dts/apple/t602x-j474-j475.dtsi  | 10 ++++++++++
 4 files changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6020-j474s.dts b/arch/arm64/boot/dts/apple/t6020-j474s.dts
index e3c2635d84fa..f39697490365 100644
--- a/arch/arm64/boot/dts/apple/t6020-j474s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j474s.dts
@@ -46,4 +46,9 @@ &pcie0 {
 			<0x300 &pcie0_dart_3 1 1>;
 };
 
+&sound {
+	compatible = "apple,j474-macaudio", "apple,j473-macaudio";
+	model = "Mac mini J474";
+};
+
 #include "hwmon-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6021-j475c.dts b/arch/arm64/boot/dts/apple/t6021-j475c.dts
index 9fe17f1f7f59..f8f776f9eb1e 100644
--- a/arch/arm64/boot/dts/apple/t6021-j475c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j475c.dts
@@ -36,4 +36,9 @@ &pcie0_dart_1 {
 	status = "okay";
 };
 
+&sound {
+	compatible = "apple,j475-macaudio", "apple,j375-macaudio";
+	model = "Mac Studio J475";
+};
+
 #include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6022-j475d.dts b/arch/arm64/boot/dts/apple/t6022-j475d.dts
index 32938a3bf96a..153899f1569b 100644
--- a/arch/arm64/boot/dts/apple/t6022-j475d.dts
+++ b/arch/arm64/boot/dts/apple/t6022-j475d.dts
@@ -73,3 +73,8 @@ &bluetooth0 {
 	compatible = "pci14e4,5f72";
 	brcm,board-type = "apple,canary";
 };
+
+&sound {
+	compatible = "apple,j475-macaudio", "apple,j375-macaudio";
+	model = "Mac Studio J475";
+};
diff --git a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
index 926bb4ab77af..7f1faefcf9bb 100644
--- a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
@@ -36,3 +36,13 @@ &hpm2 {
 &hpm3 {
 	interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
 };
+
+&speaker {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&jack_codec {
+	interrupts-extended = <&pinctrl_ap 59 IRQ_TYPE_LEVEL_LOW>;
+	reset-gpios = <&pinctrl_nub 8 GPIO_ACTIVE_HIGH>;
+};

-- 
2.56.0


