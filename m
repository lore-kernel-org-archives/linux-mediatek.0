Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28788C04FFF
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 15:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aAexrd/46uwMAH6jYKwN+uUc2aBRy9RedyqD/mSslIk=; b=tqHd0tWv+qP+28kpiXKZUagMwK
	WlDaCnNbbcqJi6tpu+/YVFEtf/v1YoaYS7VdmCv8g4NsWEPNKkEpHBaCkhoaMwWUHuRCoiL1ITqKz
	eU9Y4JojoMZmUo5s40UZbwtubgttsk3Fouh5u4+qNNb2pRLbgIl49xv1EAZGGB3Aw+OrKYHCD6AJb
	6UL/hokHaIzwHKKNJLty6Rdq6M+nPseA0eanJnahTq3zVbNTnrHX+5l8501ev+rW5qKdHpzgq/6M+
	ufenom7K+NLErYN9rUnvfo5Nocn8hUwPYbbLZVb7aMlTZIAm0y5xlcx/tqJyx4wm+S+E2JDjQSlvy
	em+bYDJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwl8B-0000000Cr3G-1Mhg;
	Tue, 16 Apr 2024 15:53:59 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwl7g-0000000Cqc9-2iWK
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Apr 2024 15:53:30 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a526a200879so320898466b.1
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Apr 2024 08:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713282806; x=1713887606; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aAexrd/46uwMAH6jYKwN+uUc2aBRy9RedyqD/mSslIk=;
        b=jWfYyrecRltLkI99ic0hfxCWbeCbewRfVcFL5NKp6AVpc0/9LFZizV32WlOx1M197W
         Fz6tBQPyHa05F7fE9jLeE0JptS5ZmIiVbOVbXU6uVELIHD0CMEz0V1koxTjJoz68LcG3
         z085f+XIgkwDNGvcDSovHcW6xTmPFiiDbVaGuo2zeCmBecssJ0jeYkNxczq8cSk3RPN3
         LCvzKSZNypJZsyqH4WN1VEtPXXGDMaGPQ0wkrcnr30a7dNyhwfuC+my7yxsl7Pr30UFH
         MAq2mZqwVsfmpvCYnTTSwkRAVmuoLwx7f5Y/Zr5pYSWbZ/oMIbSDmmtNfJmm3GUlN5FD
         2kyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713282806; x=1713887606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aAexrd/46uwMAH6jYKwN+uUc2aBRy9RedyqD/mSslIk=;
        b=veSrYsIL3ROIr9ig+gGDyHu5+AlJAgX1fkt4UHLgSpp8hzveSblh9z25lwypP2qf1E
         hjZ6pcLf59T4ZALRcAEXPaUsey7tlFhoIuAxHg4RHhy9r3wd2+zuwf+FRCyxMWz4WmdY
         lvzsEe3JL4hD0M4b1MrAMGN4hClieTc6PqlRptb85Sj/tMQ+Tk4xvCrt8Cya/seAG9c5
         wMdOGyrshMN1Gkey+eTCz9aF8a3t0vbrp8fLoYE6SK6HTSVnkiD9vgO4BrIZYhqdxLH6
         dbqxQ4S62ApkvuuQzdXrgoq+oawfXsKKeYvEZGiN++VhWQ1C2z/ttwurqefZQNim574E
         Lw4g==
X-Forwarded-Encrypted: i=1; AJvYcCUNyLLEcJ4Q21LObPJl+6bYSd1HFCnAIUBWaR0D6zRPuCNDuBf4pE7K6+Kq4Ux+8E1Z4FgVs+yE5akCsMOJjMOcDxJAtBO1fhtODIf819Vp/YRV
X-Gm-Message-State: AOJu0YzrM6pbe+ZA+JIV7fJBBs9nyJA73jjPoWpRklCM/C7efdrD/ROl
	b/0A8atZn09Vpy8bpydZQ8esMi4+Oo/EmCw4jSvi/0UTAwHvu2w/olOz2VkFoLc=
X-Google-Smtp-Source: AGHT+IEX7zZn5a5jXK0yRc4ZNU3IRQE4xFEasuu6yFOPXdGGPigbQkHsv8LLTaPDrzx9MEJkztjv7A==
X-Received: by 2002:a17:906:eb43:b0:a52:6d2b:e8f7 with SMTP id mc3-20020a170906eb4300b00a526d2be8f7mr3458529ejb.12.1713282805879;
        Tue, 16 Apr 2024 08:53:25 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d12-20020a170906174c00b00a52567ca1b6sm4156691eje.94.2024.04.16.08.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 08:53:25 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 16 Apr 2024 17:53:06 +0200
Subject: [PATCH v2 05/18] dt-bindings: display: mediatek: dsi: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v2-5-33ce8864b227@baylibre.com>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
In-Reply-To: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=832; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=v9vBdfSwmyDVuprDi5U3tWTSEMiU4Zfz1GYaXHrP9lk=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmHp7qDH7y69korfmHarmHqyVoW084RPRM+0dGorYb
 06qx0OqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZh6e6gAKCRArRkmdfjHURZZbEA
 CFurBeZ8JWkQD63WKANfDU4sh9fFHov3vdAImDiE4y/61UBSlQJNDs4OGQopcGv3OhX6HNSpHCMSdt
 6jEbw1fR7SC2uO2Nzs6CeAsPJ2MvqMxdf8d4yuWQN6sSlFmGmeqWHugXb5LA7rZS/4hJEYIELYyT8E
 nXS6YXndtuypD2mCILIoW+tIMnzAx9ingmIu7m4tBuQ4l7wCzluY7C1g1enC/+ixeHXh+1yq+SKync
 Npx576SQ90X9YKgun1RZPSBPvWVrSDKF80VPxLw0S6f/KSMl03mIwULooPbo1bcX1UsmzNCkC//UAc
 vM6Lea5Srbr2hyen079yzpKzVR1a7KfosMKldpe0WUEW8XN6sYt/2rcMQyguwqpNb1jbd4pdWk4Ixi
 ykXFSkbdXziarDQhgWe6MInH869cD7xYasnAvtWyuxryZidSYx68CbbUnF/GGsome2AvewfrGD43Md
 MvyFso9OT4nXlPoJ6C2SUACtRyIuM6SvyWEylq0BRTjgaOO9atDRdoSynMK8vfT1b59Hytjg/C4RWy
 7+pfwqHi1fomk0+KMxL7XOxYEhNWkAfUawM5akvEoIqHX0UCuBSGc01ueRmyqX2n/EKO3sOWHFPiqb
 rA4zwq3KgSyIpiR/rAyZUI1wG1236xykviUnWQ6styY5xP2kLozze+jaYV2g==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_085328_845824_CD8AED95 
X-CRM114-Status: UNSURE (   9.41  )
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

Document the Display Serial Interface on MT8365, which is compatible
with that of the MT8183.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
index 8611319bed2e..a7aa8fcb0dd1 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
@@ -37,6 +37,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8195-dsi
+              - mediatek,mt8365-dsi
           - const: mediatek,mt8183-dsi
 
   reg:

-- 
2.25.1


