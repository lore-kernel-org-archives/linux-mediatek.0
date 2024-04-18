Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5ABC04FFE
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Apr 2024 15:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qSFnuWZU02Pj+jNQxOwjPB7Yh5V2Ct2ICa/Ty3dFlQI=; b=UqB0xn+kDE8LUIKVf5b1P9hggx
	4OtVVHruDecPzAtg/hj4AkViv+CBwWiaKpMa6gVqL5UEq820k86SiPtTBiLx+sDAxzr7+j1pijlAp
	FDU+B85dskAZSjLXEoI75xYv9t6DU+9eZ4YNI7wp3iKX2rKNXPw+tnA54ybeZDlnLL+wdG4+EVvMN
	4X0qVwv6s/XVyD+XMs6K3c6/DpSLh7o4CkuYrB8dvxm0xMvDz0wVgR8+E1NkFqM03Cz6ae/YemC+8
	MPnwK1U6St+RC5tJ3h+ondh0OMtImaht8n2Dag1eFKmGnaqcRxbkANfbWQ7sxL6QiU3t2ZIYX3h9K
	/rvB9LaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxTjM-00000002nZO-1o1b;
	Thu, 18 Apr 2024 15:31:20 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSZg-00000002YWX-1tcV
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Apr 2024 14:17:24 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-418e06c0ef4so8026265e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Apr 2024 07:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449830; x=1714054630; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qSFnuWZU02Pj+jNQxOwjPB7Yh5V2Ct2ICa/Ty3dFlQI=;
        b=D2hQMiUtv1eOwBVICHZMo0qNIED+f+24bHAXVnkScyOCnEYAIhF9IyMf2A5qlOcuWn
         7C6Ux8SXthnvR7BCgs4nNQBZ3mKY5+cCpEJbGS6ut5IP6vCOVuplPRHvSw8ez288sR6W
         6ibPRQXpM+kZqbASwJp5/u11LP5Dbhrjt7hzuu2pyMyUWKUUPAYDdQzznTne1sdR33SH
         kOdUoSPejNu0V1BczMpRdYqasOibQEN0l18orwJw0Zs7dwE//KM+/iDIAdJ4qPW0dcXW
         ZlwahVcN/zkC5JT2JWq4jDxp4J/YAk7kt5pXTZGhJYj/Rgs/0Cmk39OJqeizWuwo1w3o
         03lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713449830; x=1714054630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qSFnuWZU02Pj+jNQxOwjPB7Yh5V2Ct2ICa/Ty3dFlQI=;
        b=YxSGlPG7KjyxwSCd+B3XNVCyVAcH/nGT4W4AC5OUAdai9HJ5tCHPh7iws9Ra+J/2WW
         F+rFVhWJV9DT9ygDGQvHH40p4c4My3Yj5LmkLBTcBg5ZE1E9Pfy9Hg7yCRgvgooKcsxS
         T7RiQGyjoapWVJccQHvQ/UFdCq+zBtsWYs34hq3ayzwBmZ59kqAfL3xzQErlKBz2UInM
         ymxoXhhzHF6b5gQ0bvZjzW09oKlA9psshF3oSMj5LTNKGG8Mfq1JQCds+udkXjkMwTFz
         vdiM7BM397TVqzskwo8CP0JAkW2XR1fP34492WE4uV6QRaVlDb+M3YLkxsQbrYecQaDP
         KAXw==
X-Forwarded-Encrypted: i=1; AJvYcCV9IXp2QvHM2gHWwHcKNIDbbex8+Jh61+yY7vczzdPgts1Ql1DziFp2B9DiiDz0GcxWufD0m2302lS4JNGdwuModsgDr1b1DCUEcTV1yOoPOTCG
X-Gm-Message-State: AOJu0YxvdzUAnjqs3/E6in+VVnHEio/Fs5OFLslTmo11ODdTizZHKznp
	BWb3G85fPt7QgNJeFrRDhY72sJYHD4k71F1fjQ2/iZfF8i5syCsRD6cvysvBg8g=
X-Google-Smtp-Source: AGHT+IFH5zwg0DYunY8MHTPUkoUZW6jYQiwpcrjw84bDm8QBlcdfSqPva29r1m6tFBZKlPW0GU48tg==
X-Received: by 2002:a05:600c:3ba4:b0:418:f6b7:429a with SMTP id n36-20020a05600c3ba400b00418f6b7429amr730099wms.27.1713449830604;
        Thu, 18 Apr 2024 07:17:10 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id i9-20020a05600c354900b004180c6a26b4sm6267510wmq.1.2024.04.18.07.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 07:17:09 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 18 Apr 2024 16:16:49 +0200
Subject: [PATCH v3 01/17] dt-bindings: display: mediatek: aal: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v3-1-53388f3ed34b@baylibre.com>
References: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
In-Reply-To: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Fabien Parent <fparent@baylibre.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1032; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=k+btns924mgO0ndeMmYcNT303bVziMBQNLMXrYRxVa0=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmIStiwjjQsGMtkIBC4BIIe8mmC5l4Gh+lOg1h4Dhy
 Wl9VXL+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZiErYgAKCRArRkmdfjHURUjxD/
 4g49trsbsJN/Y0FHB0Xht+mvp/FZBOgNuCfI+SZcbNnEti9L32hez80bpcp3eUQFn+6zjwkUYkOhUt
 xnKm8fkxFakHCTmmKVpP5PzjrJEi35Vs183xIQGs21+HCLShJuyamUu2PwMx2eEPKjuzeOdYch1pDV
 KWmwe79GtpBowp9iLGCh8tfwd6TzXFSnJw/LvGPNl4WaQ+v9kbzF8d6lAkp9QvLG92ZePSrWlNaqFs
 6HsyhyFT/nIFIUiJyxp7buN5jj/XEYQdo5IcXE4fsYvsTXyI2UPvgf2DSCawfMAhy9W0HGB1cpxOfg
 Sde0gOULET2QSf3qIHvyis2FYE8sLn9Qy6n6eDWqusXKelWS2S+mj7q1zbjLiibDDYuNzdw2L7I3de
 /akgPlmPvmQxMqkSmxj2CvCF/NkzfBLxva0rXJPwtGbk0vJ8scPqofhiA53B7qSO1I5xDD8BEQsHoT
 TM8XStsqw6o2O542hSJ5wXolsYXc7O7LT1XVr8dqgSMVel2XaYiLi3MDSUkx8QxWJfRbQukUNHWimz
 i16o0brEt4WAu9rjERbWeT0Vd+cDN4mz34E6XqY5IxqJd3GMin99psmzCT+x7jGOFy45XxpVKX9IZi
 oh9FtNak9KhKad/TRYV+tzdn5WpciFi53tMAlBmJE1k7idYTGlXzuscWMagg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_071716_606647_5AC662EB 
X-CRM114-Status: UNSURE (   9.35  )
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

Document the display Adaptive Ambient Light on MT8365, which is compatible
with that of the MT8183.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index b4c28e96dd55..cf24434854ff 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -36,6 +36,7 @@ properties:
               - mediatek,mt8188-disp-aal
               - mediatek,mt8192-disp-aal
               - mediatek,mt8195-disp-aal
+              - mediatek,mt8365-disp-aal
           - const: mediatek,mt8183-disp-aal
 
   reg:

-- 
2.25.1


