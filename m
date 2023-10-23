Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C082C00A8F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 14:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ldEUxwW0Fy0mrzjboUPRF8EoX2iX0HxtTAw56Z0DCkc=; b=GF9fzLNZ2/YU2T02Q5/FRGxq9i
	Vr8WohT1ybJAoh2fgPNZp4JlBEy/PwCkF39AqIRU6NubZ2He9sCfmon6l/EXXUVhcroy4FYqkqjgx
	3o65q95pbvRRYy96m7dQLmD5NzMWf2QjOSPdj0YHCNXs26vf12tVztB+H00iV64/Tgj0oAYHpVvbJ
	EFVySI7Nrh3U21iKsJ5TWZSZrlJCOKW7vEOF+Q9d8jQQHlmFVM+HaPmJs048DD+q3N1OI9pgVKzNi
	67x7sMVm9SZs9puTcwFPgK2WAlu8NZNiBYxYmNHPEol6zrRZfsGeZ7RUEASO5+LArjmBgn9LalTDQ
	F/fHAdSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quw7t-007aTj-0e;
	Mon, 23 Oct 2023 14:41:53 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quw70-007Zj7-2W
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 14:41:00 +0000
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-4a4021adbc7so1237849e0c.2
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 07:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698072057; x=1698676857; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ldEUxwW0Fy0mrzjboUPRF8EoX2iX0HxtTAw56Z0DCkc=;
        b=x+7C27D9nGm4tq7FP9kiFD+M7FD7yUweUJiHpmx2N0bMS0wq/9/t4ENEeGvgMrHJc5
         ErbgFOWdtXGApGggGZG8/mJvI2lxpNpeBKQj5DeAptHGUOQfaDcFjB3OC+1kf8XJHUNE
         tPgwrZQFm9GACvw0xCTCTsQMmovNgrZ+4Wkf6t/Es/kScL0JhK35BENbeTOpd0flWYGq
         7/uCfzDqtB72BEicQpN4DEXbON7UvTZdTHYaBZtlNLuDOgXZ6Ifbpx5Q4tesCh4EkNA7
         0il6AP7dLw0qXEoZ/PjhGnA7KkkzCk5h+vJKHeUyye6jETXoZx7Ogp9FaDB9TelLW883
         djtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698072057; x=1698676857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ldEUxwW0Fy0mrzjboUPRF8EoX2iX0HxtTAw56Z0DCkc=;
        b=Tk6y3W8SU6xkU1CY9T76atMdQ7GjyuGTzBv9pxVtCx0ZlyLV0U3mC7aX1wHVG0LJOI
         4IMYUNtrKi4ITKnm5Bc17A4r09Oq9Uhsp/LEOYrYCp/zSb+KToQzhG4+naZfwEKW8Zb/
         Qg0kXBsttGfTMc9yQQvZ0OoV29gD0TgjCgebQ6PxyD7JGa7vdpKGFgQu3WzxGPEWaP5n
         QEhfUr3VCkED4/zbbcKxBPn2aJCL63q6VPoen9Z+TvAPELrdK5/41VKQ8scY//a2gB5z
         A5HSNYkqy0sJlIBnT/gcu5EeeeqVgjSQ7J8zCpicBMfBO15Ws11dmdlhVlM1eGn9vLl9
         UyrQ==
X-Gm-Message-State: AOJu0YyfMPcjaQiU6k1Zpt0XjGxw9dPfn09IhGH83Q/WgxBUKMVkUe/O
	hbL+SyTZIrrlLkFhzi3StUeJOQ==
X-Google-Smtp-Source: AGHT+IFLiGqYjYgkkmhbWIWlxZwOq0jwUvhrblN+PaMrfko4EvmObtO4ZiyTI0M3Yr+diwGb3WhYbg==
X-Received: by 2002:a67:b206:0:b0:44e:98d8:c62e with SMTP id b6-20020a67b206000000b0044e98d8c62emr8900193vsf.33.1698072056935;
        Mon, 23 Oct 2023 07:40:56 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f1-20020a05620a408100b007789a3499casm2725020qko.115.2023.10.23.07.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 07:40:56 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 23 Oct 2023 16:40:11 +0200
Subject: [PATCH 11/18] dt-bindings: pwm: add power-domains property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v1-11-5c860ed5c33b@baylibre.com>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
In-Reply-To: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>, 
 CK Hu <ck.hu@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1511; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=DODtQ3KKkKmSOKStztk0HQRraEPq6Af8qZra+9tlquw=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlNoXPErWn29tQPCf4oVzASO7FUbuxbsUhXSJzI3GY
 C7jeCR+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZTaFzwAKCRArRkmdfjHURXt/D/
 9MzVckTai5VFj0U2crACXdS3d85+cjns4FtKSUJrUj/WjckEkdp0JsdxKC1zFkNjWK0Ihsv/kw4yem
 CjzBSNb9MoorMzjySnhztrmePXHYs2TD7BKvHL3UzwQizLhHPUeK0tCLvMrfd3C+G3i//d5Im+GJ3v
 CPe74eH/Rt4ZHcSUt5BrjEeSfrCE+f5ge9YTMoV9VuuimUyfWf7CZnRzZdcDKZC8hkrn+f/17wtBMu
 R+oWl6HOInmMINApfqjKTEkiC6vMr1qcZPCT2DsKxjDoEFBacV1PVafe71gumjbFeRk215SA/PTx1/
 TH/xHn4Jwlrj94CzH1hUxoYbU74wGylMDpyjEAxRGamB/CBJMGOiksErFg4F4qCV58Q6E+DLMgSRM9
 qzBPT0RwgvjthxPYqCDZdm0LesHEhqcnu6q5IzWWAVF1x0uTl53lW58W0xjyGDQGfhgB50Q2wBQUAe
 ZyLLg1qCtnsSijsKnH7tmjpUGHyN3OTeaqztt5HgDvJBGOiuNyuA07yJIOB2gRt23IrtPo+wFZHtEX
 fLnYrGMi+HR8rtWvuWHDoUEPM3py0EML3ZNo5mOUBu28/m6ThGcgb87IVVXBJsybV0iJcia4VD1/Ox
 FjnvboSPmCb8+ILzMlww4Ln+u4fDTotP+vaGxPMNz4G5GF3MT+loseO0hexg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_074058_844202_6EF8AA17 
X-CRM114-Status: GOOD (  10.73  )
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

According to the Mediatek datasheet, the display PWM block has a power
domain.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
index 153e146df7d4..efe0cacf55b7 100644
--- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
+++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
@@ -53,6 +53,12 @@ properties:
       - const: main
       - const: mm
 
+  power-domains:
+    maxItems: 1
+    description: A phandle and PM domain specifier as defined by bindings of
+      the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
 required:
   - compatible
   - reg
@@ -67,6 +73,7 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/mt8173-clk.h>
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mt8173-power.h>
 
     pwm0: pwm@1401e000 {
         compatible = "mediatek,mt8173-disp-pwm";
@@ -75,4 +82,5 @@ examples:
         clocks = <&mmsys CLK_MM_DISP_PWM026M>,
                  <&mmsys CLK_MM_DISP_PWM0MM>;
         clock-names = "main", "mm";
+        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
     };

-- 
2.25.1


