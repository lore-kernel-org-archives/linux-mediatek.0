Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D62C678D4
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 13:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qSqCsp4U2p6HoR4VD18alBPGLI3ktj1/QkrqdQr6Vy8=; b=cK63HGieFQABAQBwTSz6pUfe7Z
	3MBIxxOtv6VzoOx0r5be9VHebFYRxIeAU5d++txkaaI0gmhVvER+JflyXZpj+ms1zQgQZzZmkY2Gx
	L2Ogjv3yAi5N9V2pbvIneldpZpPJIEI/rYFjATIOvMFdnUB41kOKRB+8kflGfNiRGRPkw1fZ5Lav1
	5RF8w4HOTR0uQHGGDI7sXJ6dZmdA4wMcRJ7fDI2t6bzcDo6zgzDKPEdhYYCRrjFYjxiU/kvfGAA5j
	G/Ujo04ymx9a3gCpfhlpmIDN6lB8btPDlPZ/+6KKZrZJ4dsNVwi0NxpMLNMYnZHlRECgKxtnA+T41
	KOpyRfYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXEt-000KiG-3c; Tue, 07 Mar 2023 13:20:23 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXCf-000Jex-Pa
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 13:18:07 +0000
Received: by mail-wm1-x330.google.com with SMTP id j19-20020a05600c1c1300b003e9b564fae9so10386448wms.2
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 05:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678195082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qSqCsp4U2p6HoR4VD18alBPGLI3ktj1/QkrqdQr6Vy8=;
        b=1gj53rdnF7i6g6sgSSkij9TWRyTZ5D/CRJka3Ftu7hu1Kq865runibKK5aTLdBRab7
         bVlNJubavTvsberuobaDC7gip6F6K8JyEfOEpsMOZnYZHQKaOtBfZI8METTaqusYVFgw
         saUp1157OIRXw1J3WswU+J3bmaibs3y7SsVIoN0B/HAuWXDObDTIt7n2ZCm5dzpnUaJf
         rxvUFF5CYlRTI2CktuT+Ork1GdpsHFawMQQg8PfyK5AuIWp6/qiAmjB/YB9RTzob6SEv
         4Nhm8rYvDBDvWAz/otxBzfqhf8E/ChKXaRmG9PJ2cXdQpY6dWSeZanNFdM6hHQYUFgDy
         MBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678195082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qSqCsp4U2p6HoR4VD18alBPGLI3ktj1/QkrqdQr6Vy8=;
        b=HRaz4eNotOQsmE6VXOGXohhsbVsCiI+LTF5pkRrV5CSS3LtpFdDDlXUVcMWtx1qLqT
         cpOSKTwNEAvhgtY5jv4dvU6xIKUG4AWiPNSWmplaUod77mMc6NRxHN2ETSgqDN2dWHlo
         y4ejlnryy0Pfdr4uVrOsCk26LJXC2Dk0RWDYHF7Pr3/1p3jYFKSQV4HxZnf/t/D3+TAa
         maarbBiv3TzvaAPVPQPEbkFy6VfxmK81B/7kTVWls7GeFwZgCiEtoPbm5xozL6uqrS7E
         CTjATAZvrYq2JGfTlVA5kmcM+N0hNK/dFVblfxEJtz89+8AMlH1whNxo2UM4ibhTAcsR
         W5kg==
X-Gm-Message-State: AO0yUKV5QnHEqdyeNBYV7CRXT5J3GCdc7xAL4kHQURAtOdbsjAz5YWTP
	/gRp0MbG5MFOh57eDsNLtC5Srw==
X-Google-Smtp-Source: AK7set+fPQkBdDnqiCTrAz/SK/oL3IBrViHFO12rJoYnYBRVp1LaoZAHCZO8h+3WksMyOyZdN6YafQ==
X-Received: by 2002:a05:600c:198e:b0:3e2:1ef0:f585 with SMTP id t14-20020a05600c198e00b003e21ef0f585mr12302333wmq.2.1678195081846;
        Tue, 07 Mar 2023 05:18:01 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id hu21-20020a05600ca29500b003eaee9e0d22sm12986242wmb.33.2023.03.07.05.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:18:01 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 07 Mar 2023 14:17:32 +0100
Subject: [PATCH v2 03/18] dt-bindings: pinctrl: mediatek,mt8365-pinctrl: add drive
 strength property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230203-evk-board-support-v2-3-6ec7cdb10ccf@baylibre.com>
References: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>, Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linus.walleij@linaro.org>,
 Bernhard Rosenkränzer <bero@baylibre.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chaotian Jing <chaotian.jing@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Wenbin Mei <wenbin.mei@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mmc@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, devicetree@vger.kernel.org,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=982; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=gRuB+mei6hO7jvsCSd5DH6527NjS4W5hr4Eo8YesOQE=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkBzmEFhfO7f0pfn5wPiJAH0w3BHobSyRdql5CEJ1d
 74s7B4eJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAc5hAAKCRArRkmdfjHURdcPD/
 44vfRnBDslkOAxwB/gNaiLEGWxs35Gny/YbStzvCijktO2rTuhSujmkS8QAdviudQqS5TSXYqdAsNu
 LHnwNhBTGq+IoZCMpUBM2Zaw/Ro8mXgqW1i1Q52kmjUjLXn6dg1x+K4mKPdNOtsBKvhvi7jPwdbTrh
 XCUt4PXsrUXX3oCCri3oy3nLuyt/xxmWNaeK6Zdzr8ULeo4nuqNdG1fkvey691OcQ7T18P9t208rpa
 Jj8gYfkRGAqSIpybfrEqlSfEI+H9GOfhgrTZkhxqR2KulSUGo3SL8t15HcqdvLeEOx23Ur1DUU5sz9
 uBDo6u6myD2v3BFQjNQWTLWQcREld9ChOpmkpuCHc84CbYpqfT3NqJ5+KT2hmJQWohaltEzsfPPxgj
 BOmCEc8ztXVV/FIDOtmcPeW+raaB8yNnhcW8XsYL9xP0Tq9fMQp09tVS0rhjG7tluAkLkDd7Uh1YJV
 oWDCHSgeOK/ty24VzOMLhXTT9h849h5iKVAslMYoV2K/DqM7PgygpI00CPJtjWWRz/NsCfZFvVOb+C
 pV4//kV03qbcocU05kWmrCO31WESwuLKHRU9xK2JU1Xy99mAIa9T2nrHjveVeojaek5m1LOI85fxqK
 Rb35duhHDmrGcPspdyd4Zng9rzTLQyDp0AaNgaA1qR6PVAGgNGeCuCPzI3Kw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_051805_916102_20B9CE81 
X-CRM114-Status: UNSURE (   9.10  )
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

This SoC is able to drive the following output current:
- 2 mA
- 4 mA
- 6 mA
- 8 mA
- 10 mA
- 12 mA
- 14 mA
- 16 mA

Then drive-strength property is set with enum to reflect its HW capability.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
index 4b96884a1afc..101871ec6693 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
@@ -79,6 +79,9 @@ patternProperties:
 
           bias-pull-down: true
 
+          drive-strength:
+            enum: [2, 4, 6, 8, 10, 12, 14, 16]
+
           input-enable: true
 
           input-disable: true

-- 
b4 0.10.1

