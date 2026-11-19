Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C27606A320
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 03:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aomCqgFk;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mzAdEKK3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Y7DHeu4nEWkVzcf2sVY8OIlNAFB3fB9C0wQws70L76k=; b=aomCqgFkXM1LFU31sVTcTJFLsi
	axCSG1jwxyMh+9t9puJOLynkbgxWLEEFGfNVbiMJZs1wzsMnnfI9ykuAT/QCSMSzM0l0T+eOGnWv6
	UtCz20WKBIH9lXBVgwnlKElDzjzeK9h2sYSySlYpRhD21VJy5y7wEc4vOjCteONXt5RzoevWx53VV
	8Oi5fMYQKeKMgYVyR/KoZFVFpjUkHWiJRTTgJ4HpgeEOoLN4nHXhzE5DvPTs2INg4aS4NbtN0H+NK
	j+FIHXpahAIh6pTvRXp30U74J8MhqqFLZ7HlWNYuNFZTDmoiOeIS/Xn0bmcFfaSC5G9REBbh2Mb9C
	chTebt1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTtBC-0000000AnHo-3OyJ;
	Thu, 19 Nov 2026 03:51:22 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTtB9-0000000AnH0-3KGa
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Nov 2026 03:51:21 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-1b244fb7fffso1821981c88.1
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Nov 2026 19:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795060278; x=1795665078; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y7DHeu4nEWkVzcf2sVY8OIlNAFB3fB9C0wQws70L76k=;
        b=mzAdEKK3N5mIL3IixFnkBAUYV1XybS+kLQwDmrVZK6TqSoIslPC3kO6ApTGUVveqly
         p+Bx/4teWMr9akK1lJy3Qy3f1FcR30CU94o/N/cmhXwp7Ts8IwxjV/6QMGxhX50TWU1S
         qktdr8GvZ55RTx0Q0whX76+KF/tbfPjRe0C+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795060278; x=1795665078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y7DHeu4nEWkVzcf2sVY8OIlNAFB3fB9C0wQws70L76k=;
        b=gibp905lcW9INHTFiptqzWBIeIEtYDL/sYJcJUTPQmIbfGPcIvbpYEU6yNuUga2DqI
         WQXT5aWypvrEKGGlWcHXJhcwkh9OTRJcSo7TO7imD7QWLDX557IX0N1E1JFhNrLfml1U
         oNQIzsE95VMunsIgdGkaCXI4q180ETxX25dshLxErIrEL820D2YOPOM9RUpYFfq9GWPH
         XcPdxyv+dqXKOiMzuMppD8IOCCUkjd0ufsrTNFZyvFDQT6m60pqa4ZEA4JpJPhtyGRrz
         TKXB5/f/xrt1kyE0xF63goEGNRneRwpyq26GQw9ffAV96os4ovK3H1z8Vz0SyN1ijAdI
         o8lw==
X-Forwarded-Encrypted: i=1; AL+hErEqs/+IWJuST6sdfQaHR5T1ksUjnq9d1ZzlcuA17pVJ+3bAmZdcugKiyBwsdVe2ek9ciE9nQfLICFqhZKH/AQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8n3w122LKInBtDGWQd6cn0twienUdR85B2qTsGaVyL6CLondlO
	9DHueD80yyFsPz41OVz4cegQy+wT+VGgeJR43pLbc5M/uub1qrzGe0+NfSw++75IXA+70/p341O
	Z1mgoDg==
X-Gm-Gg: AYBFou1wwc1bJml784iJ5aFd1g18fId2IXkjKZQhFshOUnDSFIgCrxbIyoQdOErwSHF
	/tGQHAHiDFkJEU7DExUFc0Xw+aGh2JFm54HT8dSkG8ev2eeIrG+G4vHxgu+D/Y9euyhiXmt4xRl
	zPEMhF+g/rB4RBEqKTzcZJAuPceFZn2SvCRl3rbKpPvmca7comxpRdPIoXvI/uHbvcynvFsT1GX
	bFMz2ulLhjE9GX8A8Skkty3vIfxUTygwAKgs2txCaLNqc3q8dXR9eY9vL6t9Tv2h5l6yZ2QQHZ8
	iVM/baH2nJNiC/RcnIeqYAtuvotX1j/3dAUfmwNK6YpPM+YjI0zhwW6HL8i+gnDErUVHipqfCdV
	W+Q8Ub7yDwLxzQHpSvuYfVqAPketxtexXDn0B3akg9UFT0RNpOXu8ORToznCQhaoD4iTtGYH8Rb
	QcOLpyVVviKjNXWHARI0YobpGkLR15tdkAxAMMFiasEq4RTk7U33Y9eCHrjXePYuRGpl/ugFlW3
	zXrWyAFmIUN9THNBnraRaCVzLhQ3krz7cliN2L28Fe1KZpzG1j/gd+kQgvf78eDo3NP0a6HdJe6
	ttWQEP4tCWhpzgFH7qoyDoD3vgCG7ZH4n1faa8fPLD6hrwHEnf++SxBUdGkGPA==
X-Received: by 2002:a05:7022:ea8d:b0:1ae:59d6:91cd with SMTP id a92af1059eb24-1b543d0cb92mr4257326c88.38.1795060278321;
        Wed, 18 Nov 2026 19:51:18 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:5ec1:f878:4926:ab53])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b5447c5b02sm10392500c88.6.2026.11.18.19.51.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 19:51:17 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] arm64: dts: mediatek: mt8173-elm: Clean up unused MT6397 regulators
Date: Thu, 19 Nov 2026 11:51:12 +0800
Message-ID: <20261119035113.4046607-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_195119_877660_AEE097F2 
X-CRM114-Status: GOOD (  12.91  )
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

Several MT6397 (MT6391) PMIC regulator nodes in mt8173-elm.dtsi are
not actually used on either Elm or Hana according to the board
schematics. They may have been copied from the EVB dts.

- buck_vgpu: Output pins are unconnected; GPU power is supplied by an
  external DA9212 buck regulator instead.
- ldo_va28: Only connected to a decoupling capacitor for the PMIC's
  internal audio codec and fuel gauge ADC blocks, both of which are
  unused as both boards use an external ALC5650 codec and EC-managed
  smart battery.
- ldo_vgp4: Only routed to a test point on Elm and an unpopulated
  resistor on Hana.
- ldo_vibr: Output pins are unconnected.

Keep these regulator nodes in place so that the regulator core still
considers them constrained and can disable any unused rails left on at
power-up (such as ldo_va28), but drop all their properties and unused
labels. This is meant to preserve prior behavior.

Checking the regulator nodes against the schematics, drafting the change
and reviewing it were done by an agent. Manually tested on a Hana
(Telesu) device.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Rebased (so "arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad
  supply as always-on" is not applied)

 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 26 ++++++--------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 1b8f1b6fd788..ac5e9e387294 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -988,12 +988,8 @@ mt6397_vcore_reg: buck_vcore {
 				regulator-always-on;
 			};
 
-			mt6397_vgpu_reg: buck_vgpu {
-				regulator-name = "vgpu";
-				regulator-min-microvolt = < 700000>;
-				regulator-max-microvolt = <1350000>;
-				regulator-ramp-delay = <12500>;
-				regulator-enable-ramp-delay = <115>;
+			buck_vgpu {
+				/* unused */
 			};
 
 			mt6397_vdrm_reg: buck_vdrm {
@@ -1017,8 +1013,8 @@ mt6397_vtcxo_reg: ldo_vtcxo {
 				regulator-always-on;
 			};
 
-			mt6397_va28_reg: ldo_va28 {
-				regulator-name = "va28";
+			ldo_va28 {
+				/* unused */
 			};
 
 			mt6397_vcama_reg: ldo_vcama {
@@ -1079,11 +1075,8 @@ mt6397_vgp3_reg: ldo_vgp3 {
 				regulator-enable-ramp-delay = <218>;
 			};
 
-			mt6397_vgp4_reg: ldo_vgp4 {
-				regulator-name = "vgp4";
-				regulator-min-microvolt = <1200000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-enable-ramp-delay = <218>;
+			ldo_vgp4 {
+				/* unused */
 			};
 
 			mt6397_vgp5_reg: ldo_vgp5 {
@@ -1101,11 +1094,8 @@ mt6397_vgp6_reg: ldo_vgp6 {
 				regulator-always-on;
 			};
 
-			mt6397_vibr_reg: ldo_vibr {
-				regulator-name = "vibr";
-				regulator-min-microvolt = <1300000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-enable-ramp-delay = <218>;
+			ldo_vibr {
+				/* unused */
 			};
 		};
 
-- 
2.56.1.708.g77570a6a1d-goog


