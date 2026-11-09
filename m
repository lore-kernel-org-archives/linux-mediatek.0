Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF33C606A33A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2026 14:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u0aXsBGS;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TJ5bOWAO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZuOsQOHsiS8QPwDnFYQbHYafUjBRSGU2wZy1UicFmfk=; b=u0aXsBGSr51F9l
	hosStxIxlkyAIOhaQyOJKNjRPg7zVLgao9FzGGVEWYHQndlZGbqiHYHED1SbzPnOwbqFj9NZVwdxw
	KhZQkf1nCyY2AzfPjr/EsLxfnkXSJWC6M0hhBA9eJ5p6NLdesCpCRnOAe4eetpBgiDgpgzqxC7xa/
	VNBsKqGtuwOw9yA/cgzu4lxFr52h7JEeJUokpkYTYBmwokNZN7WqogLV0t77O06vgZR+7J7PING30
	qF6zL+AyHjc1RnmU1Cf2pBLZHRPbiyvDZlKQv0llFqphcFDgyFq3Mc3Gvysa4XwJExZ+45+O8oyYA
	teNoMb5pv8V0pO4b3mpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQ7A-00000000uuw-1Lyr;
	Mon, 09 Nov 2026 14:12:53 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQ77-00000000usJ-2DCT
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Nov 2026 14:12:50 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-37071c0f42aso1749775eec.0
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Nov 2026 06:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794233568; x=1794838368; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZuOsQOHsiS8QPwDnFYQbHYafUjBRSGU2wZy1UicFmfk=;
        b=TJ5bOWAOPaO0/kJArIwvoY4oWo2mTAHQCDChccdV+sbfCfwHcUSjpWZYq+/7dybgKW
         LKHpxGJZi/Cp3ndsfqgELEMzvtXZm1YGXFbDDy/p+h4uLTv8T9peRdqGOiIneM8W+8J4
         cz/LZodqHnvZRzR2sJ5Oq2/uBsciYd2R4g/go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233568; x=1794838368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZuOsQOHsiS8QPwDnFYQbHYafUjBRSGU2wZy1UicFmfk=;
        b=L8mA8FenJZnn44f00mpkduNfJ4PkyH0VhGbjHDEBrpLsiCIdaAsCCoyi96klOkKBRF
         WZ0VBR82Q/FiO2IoI2m0AmGSHyJYmTZeF+kp3qZYnEtmmy7+mPZxoP8iO+2d0o+YP34y
         z4VwFPeGSlXzOAi1hf3LOTqAlMm1r90RsincZifuM6/5n7N8g1PwdtT77b3KhVI25Fzh
         dMClPt+kBmnBcqKFq/r+D0icW4+ptwyAxmzFblTQykQZPzDYhuRbszS8FlnC6QgwFBL8
         lKJ2omq0LGlH6g5Cg8rBY63Snmz8RrjBWXg5BVJxAMgTDerDAAXdwCq2PHatpRqr4fdt
         xACw==
X-Forwarded-Encrypted: i=1; AL+hErHFR7lPGgiRcLgee/pe+oLhvNeYFx7l3Vvi8iyKcP8OoUpN2XlLFefRjK5k8WkpcG4Ro8nJU2M0Lmxc66TUWw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8g5dl0wmm0ZLkdW7ntKpsj3gaDL9RMdfxdJuy238bTlpRU24o/
	SYEno0Y6uk7gGKKyx08c2cDk1n6KQHeFesLTr8qhNBqy9LGv0cmZeaQ8PQ0LsTV3ew==
X-Gm-Gg: AYBFou2iaqNr/IXAPrAR5JohHF9MEcI1Uqf+prYIa3yEBIBP40358xpdr7RnstBjcaS
	wPPHwAfcGbJkx5uqST6OyX/9UIdqQiTVNN2yY9Ts/l2sk3Re/Injih8Q8TEutceq70LmF8HWq/D
	Wt18r66DYclg9WG1zLaBJBO9VXRvN/gZtXtAYJGP4GxFb7yTIDX/JLHh1Dzk8Nmp8An/5NHbx6d
	BP3JxTHOw+e0CqbrH7u49mXVgT7vxnPenFcDZq9C6sGYq26Waro8L+k1/+ed+RFI7Y7wB5CznkE
	vUrN8d9pqSxnxqqR4mDRFuFTmONUSWl0hTqDowsyLeAsKmvtFDtCn7BzymDYqHwovE/hco3ULPR
	BSNKgztLwLr+PZathRzXXNEBZPjgauY0H9kisdQVW4Vhm3yYzwZjVSGdY1Haam5vqtLcS4qWiZX
	L8aksNH9VZ0w/U5Q5EXLOwAlmb38rBQ1DEsW+45WIcD1SCvIumAvQqCQ0vBftPIAwt5zck3U+Lm
	pm9axszEg96XHZB/iy2r9iRpFFVNOvXVEiuFhXIJ6oO1vhl31HFgg4bo2sDycVwiS0DYudum5mZ
	KXrD8RvMxbdjoGtMrXKacpMHjbrzatQ4OVBDXEnVdwGPjcTTP0NzauYbFJwp
X-Received: by 2002:a05:693c:41c7:10b0:368:7c2d:a612 with SMTP id 5a478bee46e88-37336acea27mr4873781eec.10.1794233568342;
        Mon, 09 Nov 2026 06:12:48 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:24d0:a2cf:66c5:ef86])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-372631df629sm13253988eec.1.2026.11.09.06.12.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:12:48 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/5] arm64: dts: mediatek: mt8173-elm: Fix DA9212 compatible, node names and labels
Date: Mon,  9 Nov 2026 22:12:29 +0800
Message-ID: <20261109141233.983830-3-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
In-Reply-To: <20261109141233.983830-1-wenst@chromium.org>
References: <20261109141233.983830-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_061249_580195_1CA35FE9 
X-CRM114-Status: GOOD (  13.51  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The CPU and GPU regulator on Elm and Hana is a DA9212, not a DA9211,
according to the schematics. The DA9212 has two dual-phase bucks,
which is what the device tree describes with BUCKA and BUCKB, while
the DA9211 has a single four-phase buck.

Change "da9211" to "da9212" in the compatible string, node names and
labels to match the actual part. Drop the unused label on the PMIC
node. While at it, change the PMIC node name to be more generic.

The mismatch against the schematics was flagged by an agent. Manually
tested on a Hana (Telesu) device.

Fixes: 689b937bedde ("arm64: dts: mediatek: add mt8173 elm and hana board")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index dd0373b45b56..be6e6fd7cd36 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -171,7 +171,7 @@ &watchdog {
 };
 
 &mfg_async {
-	domain-supply = <&da9211_vgpu_reg>;
+	domain-supply = <&da9212_vgpu_reg>;
 };
 
 &cec {
@@ -187,12 +187,12 @@ &cpu1 {
 };
 
 &cpu2 {
-	proc-supply = <&da9211_vcpu_reg>;
+	proc-supply = <&da9212_vcpu_reg>;
 	sram-supply = <&mt6397_vsramca7_reg>;
 };
 
 &cpu3 {
-	proc-supply = <&da9211_vcpu_reg>;
+	proc-supply = <&da9212_vcpu_reg>;
 	sram-supply = <&mt6397_vsramca7_reg>;
 };
 
@@ -307,13 +307,13 @@ &i2c1 {
 	clock-frequency = <1500000>;
 	status = "okay";
 
-	da9211: da9211@68 {
-		compatible = "dlg,da9211";
+	regulator@68 {
+		compatible = "dlg,da9212";
 		reg = <0x68>;
 		interrupts-extended = <&pio 15 IRQ_TYPE_LEVEL_LOW>;
 
 		regulators {
-			da9211_vcpu_reg: BUCKA {
+			da9212_vcpu_reg: BUCKA {
 				regulator-name = "VBUCKA";
 				regulator-min-microvolt = < 700000>;
 				regulator-max-microvolt = <1310000>;
@@ -325,7 +325,7 @@ da9211_vcpu_reg: BUCKA {
 							   DA9211_BUCK_MODE_AUTO>;
 			};
 
-			da9211_vgpu_reg: BUCKB {
+			da9212_vgpu_reg: BUCKB {
 				regulator-name = "VBUCKB";
 				regulator-min-microvolt = < 700000>;
 				regulator-max-microvolt = <1310000>;
@@ -658,7 +658,7 @@ pins-mux {
 	};
 
 	i2c1_pins_a: i2c1-pins {
-		pins-da9211 {
+		pins-da9212 {
 			pinmux = <MT8173_PIN_15_EINT15__FUNC_GPIO15>;
 			bias-pull-up;
 		};
-- 
2.56.0.455.g6c5a503b38-goog


