Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37215C19F29
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 09:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p3g9EzZvah+Gtbwyip2cq8Rx7bbD/kksWxXGuqDH5TY=; b=e+BpyoAY71hlUFYKIxGmYex/8y
	JYXl+6WYF+fWg2nIwSO2ECv3fTEkmjNQu/pcNh4O3DpGkfPUEvP3bnHyiAxIKifW3p2Z2fN28hmb4
	c4ae0I4HrfOnKHT3pwBBr0jhJTTsrgdd/QXwaOthDjbQTrY38eQXaaT99ldPAEnZsFnu7lOV2iMcw
	TQ+hc9c4CBVrNMQswvVq7GK455xAYaB5M6w9GU9Dm0JfS01tjpxXmrNCvRQfUVbfYi23Pbh6ATUBI
	b0C/9F9HjQ1G7g7F3K0pWy4bElk5i8yOSluRPX0Ksg0ItJY8pYYbhjXLR3Ys2ab2p+Sqo38/x8p9k
	F1MG4TGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGdXQ-00Btxl-0I; Wed, 27 Jul 2022 09:41:08 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGdX2-00Btgy-NG
	for linux-mediatek@lists.infradead.org; Wed, 27 Jul 2022 09:40:46 +0000
Received: by mail-pg1-x52f.google.com with SMTP id f65so15449513pgc.12
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Jul 2022 02:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p3g9EzZvah+Gtbwyip2cq8Rx7bbD/kksWxXGuqDH5TY=;
        b=OLy9K64vZZHKw0I+myiumXXJ327EZ4fO3D1r2oechF169QBzjqFtMoDj48XCEzguWr
         Jf+Vw4UDazDGZvOY6ulcOQMnzjr3gM7TZ65azJMCxSOLoX0azoax7Mq01l2x97ykNL6a
         yCfBTrocZQzWSIkV5wODMg/0o8THtuU51HUO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p3g9EzZvah+Gtbwyip2cq8Rx7bbD/kksWxXGuqDH5TY=;
        b=Neath5Znett47yMvgpdNVCzjrCkMpuG28Cy3OhK99kXqBiUDsiJ0bCfZtCvWpcyeL5
         k9MeOKzJfrluj9FCHTBpdtGKplyQ8d6l7rCVnvAoboZnKiw9V9VFEmFfs+mrKKUuvwgU
         S7R4xIkp873gq2VLBISx5EYzmbwwUG4erqV2mx11SeYqibnnfNFI9OugI8zWATSELwHl
         9/LDmOE0dVGGv7zzTtPu+s501+c7O2UNRFEDD13wwVZlqqN/Y4hQR26+hUiqgqPYOLrs
         DJfZRnAoRfrRvjt+/MeJNOaio16gWvZifPStm1EXWKTnlWQdh4EaJwz6GbuBNQkL4oRV
         06JQ==
X-Gm-Message-State: AJIora8lzKwvfYc/iTEuWy5LU94lwyDrL+IMe3raG5MKPck0HZFhoaey
	mkktGoqPwBRBO6fqztPWWr6sqg==
X-Google-Smtp-Source: AGRyM1vGMx/eXGTZ84c6OPRVIy6bKdnF7BHfGiWW4X9zD6FGDwvusPvwvbJ1cKMBXJc6IoBM5UTbWw==
X-Received: by 2002:a63:6b83:0:b0:41a:8419:c20b with SMTP id g125-20020a636b83000000b0041a8419c20bmr17730751pgc.522.1658914841179;
        Wed, 27 Jul 2022 02:40:41 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:8dc7:aefe:3b5a:da1e])
        by smtp.gmail.com with ESMTPSA id e9-20020a170902784900b001678dcb4c5asm11775613pln.100.2022.07.27.02.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 02:40:40 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Eizan Miyamoto <eizan@chromium.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Evan Benn <evanbenn@chromium.org>,
	Pin-yen Lin <treapking@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2] arm64: dts: mt8173-oak: Switch to SMC watchdog
Date: Wed, 27 Jul 2022 17:40:34 +0800
Message-Id: <20220727094034.1372745-1-treapking@chromium.org>
X-Mailer: git-send-email 2.37.1.359.gd136c6c3e2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_024044_803634_4E49B13D 
X-CRM114-Status: GOOD (  10.80  )
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

Switch to SMC watchdog because we need direct control of HW watchdog
registers from kernel. The corresponding firmware was uploaded in
https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/3405.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

Changes in v2:
- Move the modifications to mt8173-elm.dtsi and add some comments.

 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index e21feb85d822..b2269770abc3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -161,6 +161,18 @@ hdmi_connector_in: endpoint {
 			};
 		};
 	};
+
+	soc {
+		/*
+		 * Disable the original MMIO watch dog and switch to the SMC watchdog,
+		 * which operates on the same MMIO.
+		 */
+		/delete-node/ watchdog@10007000;
+
+		watchdog {
+			compatible = "arm,smc-wdt";
+		};
+	};
 };
 
 &mfg_async {
-- 
2.37.1.359.gd136c6c3e2-goog


