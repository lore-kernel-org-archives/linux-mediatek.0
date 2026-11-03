Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355FC606A324
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 07:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zSu6pfTn;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=HrUNMqn1;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VyJEjFE9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=60XJaMYLbT/o6HXjRlwFTyr3vUVptClPltCAojDk0R0=; b=zSu6pfTnqLXknO
	vE418LZ+i+wnnEpYgDuLT/XVYz+g4Ibw3jVmzKRqgV+8AhR3F9/Sg3hKKZni83JJMQF3Zxc8KgXpt
	5dGqor2O/je1TNgUtAOpFivfb0m96hOAT07LzrQpCublzxAV0JS+zT8eJD7/Js9LtlTfJowMrAtpx
	5EPoQ3/pPFjiQYFRkqAgflSzhexpCEUU6OIZ6KPrFNqLDjeV+473nlscQ9uSVffixmg7sa3WOjm30
	282bhrQB9eNTd6e1wlm6qPfhBxVP4VEjygU/ik43jn6xf5uupSI7y4J1aoibVLqBCG+wWwzlYJ9d6
	6BnNRG3o4GOUhNTwRVXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9B6-00000001PF3-1WJK;
	Tue, 03 Nov 2026 07:43:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9As-00000001P0A-1Bqa
	for linux-mediatek@bombadil.infradead.org;
	Tue, 03 Nov 2026 07:43:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=60XJaMYLbT/o6HXjRlwFTyr3vUVptClPltCAojDk0R0=; b=HrUNMqn1qWtqxMaPufkIx32MsQ
	a/JfEQCYuicFE9xP0JB7j5PtaTnhH60fIpaQJ/dh03MNAe5PJP/FUNATYO1omB2ZOkN1dqZZNeXdj
	1tqGs9FzpGk829aHLGgm1qBz25UjO80DxPk+1xroBrOulEYo7NBl1yZr/O0C58EqiRDU4+cAuqUsF
	POMT2w4cL5sDPDULGT/hbbRJM22v+zfJp1vtml+XaXcgFSSWu/+OwryvIFfQ/go72i2ZabywElohG
	3T0MGIN4P7g2LTHKPnTnZQMm2sRrLdVcvhLTTwAt5+ErEG9CHC1C0Rw68YSLhLeJAgbNbNkpXPDm1
	9/6bYDIw==;
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9Ap-000000007tk-0mK9
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Nov 2026 07:43:16 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso1251781a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Nov 2026 23:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691793; x=1794296593; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=60XJaMYLbT/o6HXjRlwFTyr3vUVptClPltCAojDk0R0=;
        b=VyJEjFE900hUoaXpGX52Doh7qLb8RUEu2HtNr4+XFAMDf6yhiulsW16TdiQRY50iZE
         tOwoJ0fW24gw6CNwVasybMU/KpBPDIY2aQ1hrokFyDvoY0nyXB+22yNUEOSO/3PugREo
         AVnBM6n9k7j9AMEypiUq6VKYaZMYhqA0SCp5zA2mPSEHCsK7TFfqR9T+3selN12JlPR7
         hrhY0YPODdPx2JsWRkSh0PEQcV1SpgUdgjpzP9kJx7OLRWHcn9LGpFcKSEzO6sgkkSrI
         0ZWIpo478eOxzqfqxlUn+f0rvcfVZywJELYu3kj99bi8T6a0y+c/piS9FP3a+r5N3M+m
         P8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691793; x=1794296593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=60XJaMYLbT/o6HXjRlwFTyr3vUVptClPltCAojDk0R0=;
        b=oK8OjzhAAxLRk72rqPPjpBLRgPB7UfWe+o/rjgYvGzl4haTrmvfkBs21DfWi6dX0U3
         yufIyCFXw+UkM0NcQzIzX/wfGCL3PjtHOAzcajANWO4KxY4/cFyuPWQthRksPXWW5IxW
         5U/4B16GQnChiorL6Rq2xf0O92O8hHlpnb4HFw3as7Wg1jrPGSQT2xE+IIofW3ZQT9Ck
         /8h3MkNKcZfzCmzzB4r6mwygDXI5SoSrEKF46QebwsHVvfiqUcAhD79Ez4NHH7QEO45x
         IpbNvhe8RoN9RVrRgGdZVpylgXjywlG4LF4d4emrU/hrYYQ3p1Of7IQorNRgeNt9ZuHs
         KQmw==
X-Forwarded-Encrypted: i=1; AKwUvBwDDNLpZGWX7r6c+NMavXKyUBMxl4rWRII5NdR7rB+29beUUAwbJBvXcbOMTdSnPUz6TCW/8V2W2zarqnZwlQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8XkzepheU46uo8etw7er/QETX6gDMl3BlyGjgHXvus0uQAFXAO
	8YfFs0/3lWmN94oahfeSTYfRoDtmbv13VFtMOEPspwRG3j04a1rjDr1p
X-Gm-Gg: AYBFou1rqalPTanX6iNUED2vBbC6R8Wt7DUpPtMcZyu1AG3ZU9yBuFVG956bjoc0yMA
	h6Icc8yLc22crp8C8YOT9/xNEMCMLQwkMzQLSojTJPAOrOSfRUb8ynDETXQg+94MjQrH+r91dnx
	O9xABsmqQ4/emfJVWEPAMpiMlLWObbYlUSilyLwP9DARwzDK0X50PyPhv6U3DfmooeuS42LLoNB
	n8JmXnG1B2/mSBozEpLrKGCUTIhZ55x+l8SMF+5SnLh4FBzyE+jzUBsZ276dn+Sz7Yz24w3YiVj
	MPjQ7Av1EdxwjTOGrYr1zQ8eLGlpuS+fKY5DOtZA+DJIcwt1QcLN57zNlWUWFyGZIbSnGJqGsnW
	PLt4SC5g5wV8NlVx8/44xyEl70sAZcU+HwXH/+WiYSNB1LNqsMwuedL5JCMsrpH83YdiLCP0w7s
	CK/fn5VhOiYLEdQIiDAvy84QD/TnPFrGpe6MTswVmi7gJZ3768+zI9iw3rDk2KQjwXUJaZpRHk5
	2TL2kMOg4fAojbrj9zntQIyOeWmgSn17FVdSXBURSalYvsa4Fb0o9cCg71suy62xaGxRVp7ba7V
	kIUDGpQkBow93tN/oVKutYnEmj0R/lzDioTWRrZ9kQ2jaig1YTNrIdkrpg1CfrL9IjiwOT/wcZ8
	UdVppAYIa+QxgXEBY4koWmR0Xs3ejghKLwqEu9J/7YKtSIRTYHogcCSUWki6t6br38aYcn5ujYi
	W4crjwNQm+qF2P3pkutX0R1zS4
X-Received: by 2002:a17:90b:17cb:b0:3ac:9ed8:f309 with SMTP id 98e67ed59e1d1-3ae89736030mr10686171a91.29.1793691793151;
        Mon, 02 Nov 2026 23:43:13 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:43:12 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:09 +1000
Subject: [PATCH v4 21/22] arm64: dts: apple: t602x-j41x: Add
 speaker/headset jack nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-21-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3735;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Y5xIM4BZ0PHyivynw40OAddi1sDRIGnERSTTSJ+mmxQ=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+y9wRso3TUh9auS6Msk2fH98Z+jd93PUc9fpqf65K
 rjLdKdTx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKqNRBgZ/l1zC6o+0FBrukKdT0arUvvX43dRzcYnMjyW5bUY1ApOZ/jFXCG+ve/
 1Wrd0w8Dr8vOtLfWkeWfWpr8tnvh/bZh6Ix8jAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_074315_253618_24D6B97B 
X-CRM114-Status: GOOD (  10.22  )
X-Spam-Score: 0.1 (/)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The M2 Pro/Max MacBooks  integrate Apple-specific variants of
the TI TAS2764 and Cirrus CS42L42. Add these nodes and advertise
them to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t6020-j414s.dts      |  5 ++++
 arch/arm64/boot/dts/apple/t6020-j416s.dts      |  5 ++++
 arch/arm64/boot/dts/apple/t6021-j414c.dts      |  5 ++++
 arch/arm64/boot/dts/apple/t6021-j416c.dts      |  5 ++++
 arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi | 35 ++++++++++++++++++++++++++
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
2.56.0


