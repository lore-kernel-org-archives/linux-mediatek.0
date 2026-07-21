Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A26AC4452D
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 07:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mpTQ+x9JRSQEI1YUOvflUoQb8hjimFA84CnTWedUkpQ=; b=lDC+jpVy5NtSNQyBQ7UFgG3jcu
	yrjK7ZIyj97mBEqghInqIyzWTmM3/twoNTN02k9HA1ASxGgaNtcTrRO59BJYDOHeuTID+GGrFJ/qa
	dvw2362/gUwgytNJPkYB0Ngh3TjQ9t9CoIpO+MFOCof6zimIPMQszPoJAe+IQsWXlvAmmVIe4xpgt
	RqJmYgAPf5Bqo3N6zjXlLp36mprqb31tfBPfxBzbicwBdzLcJbfHDsqWfsyoTPnQtk+i9L7YSzV9o
	Q8AqURV39GUjl4jYBToepAKnEpVjfXhUTYApKSq1Na/nfnPmhhd7kdHcQbXZ6r5U4B8iqyLdYIq9v
	wICrgRQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5JD-00000008iAT-1gJI;
	Tue, 21 Jul 2026 07:54:35 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5J7-00000008i37-1ZT1
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 07:54:30 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2ccdb73f0e1so70676855ad.3
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 00:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784620469; x=1785225269; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mpTQ+x9JRSQEI1YUOvflUoQb8hjimFA84CnTWedUkpQ=;
        b=JKLuidmJOnViu+/aO9T8nOn+PathyE79fSjHs6bgwxtl6PV9kndOcv1u+6W1tQ2598
         xm5C+fsuWByZLH5Qyn1Bn3NShtIhT7+dHQbuXm/Lb7X2OLWxcaLezPR7QezHVipEUwF0
         ID4qf7sZqqWBgI+ygCsD0o7r4kGHngdfX5/vw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620469; x=1785225269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mpTQ+x9JRSQEI1YUOvflUoQb8hjimFA84CnTWedUkpQ=;
        b=enh3C+I04yYgA4ypDy0xEQrClCKbxb0jvswZGRhD6BYkr9aV652FqBrkIRKwHfP1se
         ugEaPiOYgeV4wmNPifDtqsULdRvt7mPlAfzWiH8bwqXaARayABxyaJhG+hhFJDGGdBUN
         cTrMqhw2sXGNcbllD8tlyoz52Djgzq/wpS6zfcgayLv8ZYITujNdxjr+AOGJZg/kxBeU
         itiDohUxhKPcAsJywAiXIp/T1nyfLbh4e3nqmnZ4CqM0AxE/OMKN+1mRF+vbwLCncRod
         ChOgVLhHzVPxPX+w9vq8+Poy2314somOhD5nIG5ylFy5icKVvngcPwDk257OyvTV/fy+
         1hvg==
X-Forwarded-Encrypted: i=1; AHgh+RoEN2OcVeradCb8s4TOSmZyc0F0591fiorD03YLZeGlpcn8VV69xxzCnH+NNcFFxiuoJrcW0YxUB45SAKkd8w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5mYzL8mFL6O3uVwNe/4U4z9jqKFBw1BlKtbT9tO1DENWZ8nGB
	74OWVeXR7qqdUH/K/W26kRBFjKULwxCx1SWIFK3lftHrQ2ctk0gXjvbWLuA+8keDWA==
X-Gm-Gg: AR+sD10uSEGHIDz2dvXxSQZR8VJfY9zTpx03NdcaHrJZ43a0NjMPc2IKb83CumF6GAZ
	leN2nA+6ZS/HFm3I2Om9LIPZTeJYGC3qtAvoQU56EUVjYOfENPaR0XBwK8TfYt/8/pMclRy3/0j
	lkFWnCBGxyxtVC/pMqX52lLGbzVOAqKuEVyMz9lubCG6bF7mCUuaqpsE72PSRzC3x+9aXoO7u6/
	j3MylPma73hTdw10oLtR8oJq2ys3VkCH3Iy6MRy+K244lQNZRb0+83zWgQFep9y8KPxedeKsI74
	ZLiws3khr9+p9PyMqTIG4fH+D8IoGbkLXDGjfVIKtpPjztZWKTOuW9OQPmhT9et1bR1W6Md5/kV
	j5erqfi72i8YuOa/ts3ohFk7KIsMMzrnuqTc1Yg3X+35eFTbNAtEU1osuivi7zzWm5dws0IpGdv
	guTwQyeHHjX0000nRINjSKiFMXbX2lAOjxYs07LFDU9CT2pAETHCThVXL+Lcs=
X-Received: by 2002:a17:902:ce84:b0:2ce:d957:59c4 with SMTP id d9443c01a7336-2cf348369cfmr185433115ad.6.1784620468826;
        Tue, 21 Jul 2026 00:54:28 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448f705sm70724175ad.15.2026.07.21.00.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:54:28 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 8/9] arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad supply as always-on
Date: Tue, 21 Jul 2026 15:52:22 +0800
Message-ID: <20260721075226.2347933-9-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721075226.2347933-1-wenst@chromium.org>
References: <20260721075226.2347933-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_005429_432763_D507E9F2 
X-CRM114-Status: GOOD (  16.33  )
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

Up until now, the MT8173 elm/hana device tree has set the dedicated
regulator supplying the trackpad as always-on, simply because the Elan
driver was missing proper delays. As a result the delay for the
Synaptics trackpad was also omitted, as it was not strictly required
under such a model and delayed the availability of the trackpad to the
user.

The Elan driver recently gained proper delays after power up, with
opportunistic skipping of the delay when the regulator was originally
on. The I2C HID driver gained similar opportunistic delay skipping.
So has the I2C OF component prober library.

Now fix the device tree to have the regulator not be always on, and
let the I2C HID device have the correct post-power-on delay time.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi | 8 +-------
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi      | 1 -
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
index 1004eb8ea52c..b9e311fcd9a0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
@@ -62,13 +62,7 @@ trackpad2: trackpad@2c {
 		pinctrl-0 = <&trackpad_irq>;
 		reg = <0x2c>;
 		hid-descr-addr = <0x0020>;
-		/*
-		 * The trackpad needs a post-power-on delay of 100ms,
-		 * but at time of writing, the power supply for it on
-		 * this board is always on. The delay is therefore not
-		 * added to avoid impacting the readiness of the
-		 * trackpad.
-		 */
+		post-power-on-delay-ms = <100>;
 		vdd-supply = <&mt6397_vgp6_reg>;
 		wakeup-source;
 		status = "fail-needs-probe";
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index a0573bc359fb..6b9f47f515c7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -1093,7 +1093,6 @@ mt6397_vgp6_reg: ldo_vgp6 {
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-enable-ramp-delay = <218>;
-				regulator-always-on;
 			};
 
 			mt6397_vibr_reg: ldo_vibr {
-- 
2.55.0.229.g6434b31f56-goog


