Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53539C5AC67
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2026 12:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V0/BWpZ1mHkr6NJqOIKhKHqUTotk7EFya8FeeruKRfI=; b=rrQF1iLsxrqoFUHnpDyCuCPv6J
	Pojm4rnuMNwXBcSem81/niVfcBwy1cQyJdTz5wkEWp8TiKvU7eSQrixl7hVwfGJ8d9juQN6/q2ol8
	bXtGrGIEN/AWOZtjslobQRFJ+7XyaIrPxYYSbxPh4rvTfwU8+vXFa8hHw1r/iFB2VIq5V20yVUCuy
	vp9RySgVyL3E2MsRSvpo6D5PFtW0zf/rCErqeQ8Xr2F6hvkeba+MN7yIoq4CwvZV9Ww+9PKCU3UYz
	0EOCIDmRpNMa0EdaG2hpztcPI08b6kqSAJxv0whjLMdWxVYyCanAuozVM4QqAm0sS1VFFhm9ai4h0
	Cm/RIVew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlU1-0000000E0eX-49Lx;
	Tue, 11 Aug 2026 12:21:29 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlTk-0000000E0Oz-14tB
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Aug 2026 12:21:16 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-84f38f3b36eso2205090b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Aug 2026 05:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786450871; x=1787055671; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V0/BWpZ1mHkr6NJqOIKhKHqUTotk7EFya8FeeruKRfI=;
        b=nvXcQfZNC2Klng8uez+pPdplQ+rCb7dVRzua1LOdHi/7mLViiaJjfAy114fcNiUt+m
         yJ0kXPA+c3j8uCkJMF0uO40IM9bgjcWoakPeJkwrfNdUIi6DUuIzNqFLciRGEE5M0hYv
         cuGlkFCPpEqOHwUphXQJf+5fpX1gAeOr7Hgao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450871; x=1787055671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V0/BWpZ1mHkr6NJqOIKhKHqUTotk7EFya8FeeruKRfI=;
        b=VDAWnun+/jGNoIuVIKcd6Ut2GYUKqAIbTfjeVBqOBzp1rKUy+wQl79cBtLZ4GHGJaX
         cW3KcHWrtQzeopVaC+djcMIKVY82/TmJ1SQohGUy3xSyIgWCw/euRGZXEi0svHNENFNh
         6M+mXVBqRBbKOgK6UA0myXO541bAilJEKwRz/hf9BJjpaTlysPkPb7JDswVeW7YsVVfL
         yc6B9prfeQuzmQUFzKBWfzvFabnGtjumgHsPKpCEOhVtwLd5kQGXWLIzKuUGz4NXfTNo
         YTI0tvxg/SrWpjo6cXBBln0i3X+9ESoXP/NbJ26S+Y1H/jy3mlAKtV8l6bOMcSIse4BO
         HgBw==
X-Forwarded-Encrypted: i=1; AHgh+RpL1X/+yFsaCCiNQf3ViQLeIKpXAKGutGBhc+Uq3tBpXUaep69lgF0IFHGLd+qYjI1ApQJGq+ys+ZrI/3T4ow==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/QggSTUS08Zn/SvTrBmOTP3rPdx+RphrqOkUo63G8/8o430Ms
	6uE9UZ39GZXXgdAnrJBNKNw5L42uKfsrq/OwMeeAF8lKadPrUmrOTJ8qCg/n4tb4bw==
X-Gm-Gg: AR+sD11xJ+jmMrXQjZ3/RhILd+7vd8qkyh4l9E8i37aQfWxrPy5b5L5wjyEJAWQHd+i
	K9aKmvyugW5LvshKMlnb2He611LXFLLWhyXTbzz92zpjAk8MCnXE0Mz7OBb/vi/PsSZbe9Q8hl3
	NrdrZyCCXu7iFqGY/CSZfKOUTFJoAABrirxRSER6yphBX8QvguIpMfZKrn0Y8bdhNUVyJRnEK79
	riXbJfq1pn8+3ZW69t7SMkuZmYGohlQ4W0u27/z9A9hCQLMD6/xRNSlxK+6HB7LXtPEi/gG3znb
	gKcyP5JFeQ4lGi75ojFM7VWjYGKkMW43GaEAcL2M+poteD4aHCnGvNsKMp6TputU6c5gaxuP4vR
	UzBzxRfOJD5HHM+Wk3mrcAL3idQNBdF3pACs//qrpBYwWoEodfLBFpihRP7GUUw3aPDhoXxiX9t
	4L5pjw/snmIRxKwKAvlHB8sHzeMinmOz/OdTx4ObRHVhnMPEmlmO1U98wQgeWQEZ1BP7+tnZ6ze
	TfM6s7kRlBE8yOKLDAF6sIHU4VZnjYZ2PrI32lPn8cnWg==
X-Received: by 2002:a05:6a00:17aa:b0:848:2c2e:c79e with SMTP id d2e1a72fcca58-84fa86e19e7mr2769479b3a.12.1786450871439;
        Tue, 11 Aug 2026 05:21:11 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:12e1:df26:6add:1ea7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa9574e9dsm662454b3a.54.2026.08.11.05.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:21:10 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 8/9] arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad supply as always-on
Date: Tue, 11 Aug 2026 20:20:08 +0800
Message-ID: <20260811122011.3539250-9-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
In-Reply-To: <20260811122011.3539250-1-wenst@chromium.org>
References: <20260811122011.3539250-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_052114_658889_FCACF77D 
X-CRM114-Status: GOOD (  16.82  )
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
2.55.0.679.g6767b8d81c-goog


