Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B34C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 20:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PzeO+21Z96RoKN4XNIkxUgA/OiGCMaww/LNM7uG1354=; b=kAWwyXwJ03N7/l
	xjJHAZyuNATIVcbfX5OPjQ4z3G8DNQxMXTOA2CT/VMHEvX15xQ/f/NPJEEtjFaJrocSf464ze30Qp
	gck9XkBGzNekxiZTk4EiPK0wqk/4uroxk29QGV2/QCFM8jPsusbcWgUhRgCuoxZe8JZzZ3A9vWcbe
	1bVb4uWFB2sgUkcxzZv1+pewWOL7W9HJIXUuQXez8E8wWtm0PEYKvN5SHVOh/y2q8G+I7k6cZPnM+
	KF6mbYgxAG/tT4dzAKl/M2jWT1gKwxBSLsZiyd25kCpKrOARsA0JuBfy9H7Tm8QBxKEgjWh4PJ76r
	GG0pFli0x+klHM50q45w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvltk-008BxL-NP; Mon, 30 May 2022 20:21:56 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvltg-008Buk-Tl
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 20:21:55 +0000
Received: by mail-wm1-x329.google.com with SMTP id c5-20020a1c3505000000b0038e37907b5bso165932wma.0
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 13:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eiDOJFzaInCJhnUpiGhTUeinv2gyCwbF/a7PS9tPsw8=;
        b=GGLTks7z+Cu2sD67ItYjIkSDBnPFbXlry0Yr2hBSF7OQkd9rKRwnYFKllacNxl2clO
         jWHHOCWRt3kxSiYR5U8LKYbDItbOm17Myh6fQPHght6fxMCiy8WPnyuQfqXiN0teNpjJ
         6TpUF6rm3KWf64/X882oAL/sIwnxRDF8w3VwkUWFYx755AxKaLVLTGpTOXQ8i7LsSMYx
         7mzkX6zpqpUTcc4ilmGiuAEnAgtOWEXfl2cJre2phoWZmTy7Uy9Hz0t18CM3WF2b/mBh
         wAe+zJhJJj9rsXLXTbkOT8W1F71HrBAjoTvICAXgTHNJ5CM3mbqVBujloyWQh8SlM7x7
         W5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eiDOJFzaInCJhnUpiGhTUeinv2gyCwbF/a7PS9tPsw8=;
        b=1UZ8aAcTvlvxvrJ7RaVGQ56Mgf9zWwSRmXVLdgcLmxYODLWYQRsRfDeQ8MYtLhGdtX
         gPmrA+oIz59vyy0+5TU3W9CmiG0PtAztyYxWaZiBmZG2hTzPfWWC5iz2u/wxZXM1wgC+
         tObUyfHdmKw+CF9XUIAO+XewcpsRpkBR63PgsD5PbxFLueiHrdftphZG0CVixFqsXjuc
         OsFKg1yPugp7robPvpd1n4OutakXKhBLGBMTKRtMXDj+s8pcJuqJxfMrgVPh1Z0QzzLF
         oigxrKECSEB7tqhZaNQMuq76k7rFGoBxOjbHYhiCXAk2HBGtklqX5S9g0JYxqz+KcVRR
         2WtQ==
X-Gm-Message-State: AOAM530gV5ECD9b/2JYXn19dFRTStZAcB4znllUqsKIGESx0t437vQPf
	cwZnJM1QUGC+e7aZ/w6tCiG7Pg==
X-Google-Smtp-Source: ABdhPJxAETeJdaqhq72lFl2LUU+Ioc+InFtkW1WnYu123vrwlMVWG/bC/IKO0H+s9HT4NX5FMo8g+w==
X-Received: by 2002:a05:600c:48aa:b0:397:55ba:adb3 with SMTP id j42-20020a05600c48aa00b0039755baadb3mr20239263wmp.73.1653942110348;
        Mon, 30 May 2022 13:21:50 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id q9-20020a1cf309000000b0039754d1d327sm261860wmq.13.2022.05.30.13.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 13:21:49 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Lee Jones <lee.jones@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: pwm: add MT8365 SoC binding
Date: Mon, 30 May 2022 22:21:34 +0200
Message-Id: <20220530202136.906407-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_132153_053089_AFEDE811 
X-CRM114-Status: GOOD (  11.25  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add binding documentation for the MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/pwm/pwm-mediatek.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
index 25ed214473d7..ac5c58bbb22d 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
+++ b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
@@ -8,6 +8,7 @@ Required properties:
    - "mediatek,mt7628-pwm": found on mt7628 SoC.
    - "mediatek,mt7629-pwm": found on mt7629 SoC.
    - "mediatek,mt8183-pwm": found on mt8183 SoC.
+   - "mediatek,mt8365-pwm": found on mt8365 SoC.
    - "mediatek,mt8516-pwm": found on mt8516 SoC.
  - reg: physical base address and length of the controller's registers.
  - #pwm-cells: must be 2. See pwm.yaml in this directory for a description of
@@ -17,6 +18,7 @@ Required properties:
                 has no clocks
    - "top": the top clock generator
    - "main": clock used by the PWM core
+   - "pwm1-3": the five per PWM clocks for mt8365
    - "pwm1-8": the eight per PWM clocks for mt2712
    - "pwm1-6": the six per PWM clocks for mt7622
    - "pwm1-5": the five per PWM clocks for mt7623
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
