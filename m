Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38703D31A31
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jan 2026 09:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=raSq7QGEUhVHtaVWgQ9mKoAQ+G0ozyI9AkFxNN8FvA4=; b=32VIWH3A4PfK6ukw4Kl0sKE3Do
	LSJ9GU+XNiZh41XSW/+lNMuYCxXfJ/wyp03j9BSWrj2O7PU1Ef7n3ntwjzLqAp93tnKw0FuWfwz6M
	iDk6YdHqqk2sPUHHodFXS7CEWxVgPGDCez1NZNoShb5BWCZLOIarSRiOXp9Fakrn7+N4pWggo3rD6
	tWEIN3uAKmp1DqR50SW0zr1cLiqWFNMISdZmHsN7GPW3Ky8mQTdypS6YnfMquUC2aNZQze6Vc19PF
	VD2KBpRDq3lg32hqjxxd4WLku+mac5OaaqUEjIJwmEMOoO6FDFLEX1r1zDee0gLkgAh2oD34pZ0Mt
	UG+fYzgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfx8s-00000008XUx-27qO;
	Wed, 14 Jan 2026 09:26:18 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfx8m-00000008XQm-0DXg
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Jan 2026 09:26:13 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c1e4a9033abso4423001a12.3
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Jan 2026 01:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768382771; x=1768987571; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=raSq7QGEUhVHtaVWgQ9mKoAQ+G0ozyI9AkFxNN8FvA4=;
        b=NG0EsgvKlozywlleFpi9J0Ndw39tgmMY4bxidXocwVqToK7Zoycu4cmjFp27bo5pug
         Z2UBUgRP+3/vRJeFzoFpX0U8798sOpWESD0weO3qC+hDScuHvg7AC45Ml7+fitDAz7I1
         m6q2zmfH9mw2u0LVSSWgUXHmHyjxTnzlGoI7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768382771; x=1768987571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=raSq7QGEUhVHtaVWgQ9mKoAQ+G0ozyI9AkFxNN8FvA4=;
        b=LCcQ9eiPGWPlvJTI2H/qLKxAA4ffV1TpOHlyxEOXWFSEu72+jJQDYDmyoQma3Qkp6f
         /UzXfEb5jKDa4utAkLo0pIoNYVRys6ICbLR5HWeEYjl8zNTS/U/PK3D7jKG5AcP0G3yB
         7OxSylGDHnBL5q6s3offvMXEKha4W+bMkg+0WA8RmLgdf0pNZ3pJQ6e/1emg0rIHErK8
         grabQ8sRQbpaCwe1LjInkgtd044eY7lPPgVGjRvinyDs/6YrIw9ItAf5Q7lHgJT2pFQc
         cJGOhABcXt0DkGfaHBr3UmTb63ldllN0aUNk0cN0ZbaxPQwVz98Io2pPffwhqKNAOQ1G
         Z0nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUg31mFLB0jjFLRDUGum21dJTGwc/2PQQ/kKVQUYPVr/R3/pW52ZdovfRN6rU8QnzECouaRmWng/GDLzC75wA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzE4ig7YLQrHKs4P7bq+ZvMDzme6xHNakwy56NnL2xSL/jH2jj3
	tC16lsxBDLGOgAsyMYttWMSTGnTqzzOru0OQ7c7AB4DiiInms2fpaD2Vu6J53DCTNQ==
X-Gm-Gg: AY/fxX4DpDmEeSTyUKo7pSj4RMXTCjCNfBwd0dcuOLFcUzlNoErcls8MXlxUxqSUStu
	mGUXx+crbFmdvdJaOFHQuZgFr0QFqlZZ+3hP6myxEp2NpQjr/qUyg9B1K6Ei35bFKt+kDu+xPhw
	S+6PP/PuEgCTsZs/srYeOldRNZahgKKQU04d8eh96h2cRkgcs7g18fHEZqK4CUP5O0dqsemyEdd
	dFj1bAy16dc8pRP1rCnSVXlWVpEuacyFoQE9E4XNK0QkkGJq5Lpn4BWnsKQ3cveZZWUgYebpHPe
	elk1miveZum2Zph3o34sN8FsLq1tzxGaGl42pkMT7adngB+vloYj/WMaBdcXExWnp4WNxA5M9t7
	Fl0VsKHqtFPipyNkthDYMO6aDEn+EjBxT+bWH3JX4DlVDkf6DVPRyQTMhH654h2h8oGdhdt+by7
	RY8SIl2CdXUQtMQbFhhnliKUrBVQVx5ORvDa2YZ+e0CSgxANmEOaUjUXxjLK+YZgXJcbVc
X-Received: by 2002:a05:6a20:3c8e:b0:387:5daf:b302 with SMTP id adf61e73a8af0-38bed1f4c9dmr2354200637.65.1768382771115;
        Wed, 14 Jan 2026 01:26:11 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:c346:2298:451a:a3f3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cca06b2edsm22131136a12.32.2026.01.14.01.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 01:26:10 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: mediatek: mt8183-kukui: Clean up IT6505 regulator supply
Date: Wed, 14 Jan 2026 17:26:04 +0800
Message-ID: <20260114092605.3916367-1-wenst@chromium.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_012612_128794_A318BE13 
X-CRM114-Status: GOOD (  10.70  )
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

Align the name of the regulator with the design schematic. Also fix up
the gpio property to the new "gpios" property name, and add the
GPIO_ACTIVE_HIGH flag. The flag is actively ignored in Linux in favor of
the old "enable-active-high" property; nevertheless it is the correct
description.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Just a small cleanup. Not sure if you want the regulator node name also
fixed?

 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 4b87d4940c8c..a8e257b21a88 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -44,10 +44,10 @@ clk32k: oscillator1 {
 		clock-output-names = "clk32k";
 	};
 
-	it6505_pp18_reg: regulator0 {
+	pp1800_it6505: regulator0 {
 		compatible = "regulator-fixed";
-		regulator-name = "it6505_pp18";
-		gpio = <&pio 178 0>;
+		regulator-name = "pp1800_it6505";
+		gpios = <&pio 178 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&pp1800_alw>;
 	};
-- 
2.52.0.457.g6b5491de43-goog


