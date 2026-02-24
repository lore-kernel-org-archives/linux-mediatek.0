Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58E9EFB7F9
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Feb 2026 07:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G/Mt3Ra+5yhEMXBUYKmVnriP9LLAY3r66sMCycefNDI=; b=g9Gl/ANS5MvXJY8liaRprSEE38
	bzNBB7v1EFPRZS0N5C/8T/csMvYNLmMErFkRgj6E335eI/eReYhOtJaD8kxUSpTr3cr4Awr5k1aXI
	XutLVkgO+FtFLc9j2s45iHl/Ih+eLl9eyyEgzNnXUpt12U/ykTTWAXmqvCjgQs47Drf03WDAyXQB4
	rMqXWJ6X8Hn+jpeh6xEN+bXI4CgwiXgc+lzL5gVn8wXDXvMyt5lEWlPNyO8GrPQCr5rClJEBEIkbu
	s6A1ffCnQpNrrUvBP3F0eSjA7vlSoRb/4Iap+GrMtgsMBe9eAmrmnLzOuptRU3NWQ9lP14OZk0Aeg
	C34/QRBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vumS1-00000001YWP-2jIE;
	Tue, 24 Feb 2026 07:03:21 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vumRy-00000001YVV-3T0P
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Feb 2026 07:03:19 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8230c33f477so2225261b3a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 23:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1771916597; x=1772521397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G/Mt3Ra+5yhEMXBUYKmVnriP9LLAY3r66sMCycefNDI=;
        b=U4t9G+yViEnf35xDRFPPY55dSq5m8p+4JWG3XgJtJwaXomssg4kqB6cOTbmBtRvsEI
         9+pS1EYOp5Xyh9zLsRriEfnci8dDNPOa8aRXY8NPWERAUpr39GPtZPVuBJPWA77YzQ5Q
         c170D4jxeQMvhw9ZXrYcWSWW/3Ffhks7g8J3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771916597; x=1772521397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/Mt3Ra+5yhEMXBUYKmVnriP9LLAY3r66sMCycefNDI=;
        b=l/GVLDMpfKgrL5NH6tVjs4NxqpIpWMourYtXIZeEg4ff5i/ysMgSEPO48ZyfKkWrVx
         WoZCjZ5YtIP+PnEnJbEC6c7S0TFOunT5Fp6l8CsEplRNKZopl/LCAYI0vVtnALgRSduf
         fzKvU5lEdED4Jbx5/l7cLJMkG8aeBfcRE6IX8OUwYAn8myFIyraGraobAKW/6R64NOci
         Py1BGMxvVC790hEgOS3mF6dgln94521AuJRe9eOyr2Ebky5W7T55RqivIqDY+a6SwBpM
         OqK2hADpdciz0Ou6fvSfIPftjLSoqp1f3BIK2JrXQqEgkyOFxSA7mqmAyrpcXgKLUfoj
         UNWg==
X-Forwarded-Encrypted: i=1; AJvYcCXzmU3FF3fyo9nIPjrCn4GQ94eIjYVdAYnOPaBBOVMQb5okMyz0b9LMLuGpDUYle6IJXwSdMbFBJvKkU8lW7g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9zF0P+hRWIfbUa65rkth/D5GEEnYiCevDvK5sGlEqgaOpIJtF
	BfoFwIsChzCGW0s7KJPZRKezhLXHFjCuyHtwzdWRR4SnTDNs+BF2kiVnd9gQWnz+cQ==
X-Gm-Gg: ATEYQzw9wntJ8CybDbMgWhS5HOVCtkiCwUWWqOs7RS6KqI/YoiAzHOrRkkQcnjzf+5g
	M5fvMncG/k5Gyf9zKAs9OoyHoOXGLkpd9noDKh2OQFubZEjQL44Glg6ZkddI+dBONAl0MLSBgiD
	+MfDTnMcF/yd2t3e4n+ZcHUuSPCxjwrKGhMS6ZuKBca9cjw9EuzkySucVi8G+oGkplvJ1KC7QdC
	Akkv0ii04Cqybk8X0M06fVeMuf5RG8Vku47WB8Y92K2X8Q7W0slDpW7ajlqkQ5JK7L8+ZNbUbC3
	Ns0tPyXyo0GlApPTiJ9DGoG0gjwwFcB9HKeEBVw0ml4cOzt0j/rS5fxilnVmFOBpVKxOZflFRIO
	mRZeEow738JhEyPpA33+fTIqQ9scZuJdTCY75tnaHkjDFbVboRVfpBP3Nr8o+cjfMKf2CU2uAgw
	Ybm71xgCM0CzVc/5Ojb/uWKEMTK6GybfD98gKE47veiPoqRw8kZ0/RJFUufNj/SJtLV9uBojj86
	1lqtl9I
X-Received: by 2002:a05:6a00:330a:b0:81f:9986:9205 with SMTP id d2e1a72fcca58-826daab0281mr12440056b3a.57.1771916597314;
        Mon, 23 Feb 2026 23:03:17 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:752d:3fd0:786d:ab57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd873263sm10007748b3a.33.2026.02.23.23.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 23:03:16 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: mediatek: mt8195-cherry: Disable xhci1 completely
Date: Tue, 24 Feb 2026 15:03:05 +0800
Message-ID: <20260224070306.2650182-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.371.g1d285c8824-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_230318_953928_68448D05 
X-CRM114-Status: UNSURE (   9.28  )
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

There is nothing connected to xhci1 in this design, nor in the actual
end devices.

Disable xhci1. Keep the USB PHY enabled, as it is a shared PHY and used
for pcie1.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index b3761b80cac7..6e99122c65ac 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1495,6 +1495,7 @@ &u3phy0 {
 };
 
 &u3phy1 {
+	/* shared between xhci1 and pcie1. */
 	status = "okay";
 };
 
@@ -1563,16 +1564,6 @@ &xhci0 {
 	vbus-supply = <&usb_vbus>;
 };
 
-&xhci1 {
-	status = "okay";
-
-	phys = <&u2port1 PHY_TYPE_USB2>;
-	rx-fifo-depth = <3072>;
-	vusb33-supply = <&mt6359_vusb_ldo_reg>;
-	vbus-supply = <&usb_vbus>;
-	mediatek,u3p-dis-msk = <1>;
-};
-
 &xhci2 {
 	status = "okay";
 	vbus-supply = <&usb_vbus>;
-- 
2.53.0.371.g1d285c8824-goog


