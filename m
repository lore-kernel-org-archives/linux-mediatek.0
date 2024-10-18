Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22AC9D30007
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 13:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MP8TMQ/gJDNNcW5cvIQHPqEbDAINygwMqDzh7j0WvTc=; b=GFrJdTz5dqe78yoKXN0pFQjPft
	7hNwn5iOp/nSjQmgBpqBJP1Ua1wJwDm7Ofj/zACyAFsNaviQ8c0edJwuY2jewFbM7UXGSTYn3b2zf
	0rdvwgUPsRzZ7U5raGyPqWVOSIiIqXcF1QAK5PAh4gJeUcbG6mqrvYne9vkmhN3WfkTlbP+ImksU6
	onhIy075Onf89kPD/rMuojQbHDed+T6X98IKLkcr1eae5wr8ODU7Nv5bt9zsHZ0LgvlVmTpwTQ0EE
	/qhW1UzfJONz8NSvlVQDTFLbCiQcxjkVB7VD3xDpST2xr7OkSrm0yre/rxpsHWw7LEt24RYfCgs+n
	Aap57Q3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1mu7-00000000rRX-485C;
	Fri, 18 Oct 2024 13:20:31 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1mno-00000000qMl-2tnD
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Oct 2024 13:14:02 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-71e4e481692so1791393b3a.1
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Oct 2024 06:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729257240; x=1729862040; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MP8TMQ/gJDNNcW5cvIQHPqEbDAINygwMqDzh7j0WvTc=;
        b=CwF7KfGCIglyar2RSysYV6le0y4PdcMYW/FhwcBjLvqC3udqsPZ+fZLx/xjHF3avQs
         Xao+b4g2kuQSScmnxyflc5NEglZmeHVHrnmcDOeSE7diZU/I/65wI3eg+vFUZCVKIBzF
         d1Esgs41WnXJWLKxmyZwURmbPandwE2xoRlzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729257240; x=1729862040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MP8TMQ/gJDNNcW5cvIQHPqEbDAINygwMqDzh7j0WvTc=;
        b=hqFu7WeFhggNb2cnXkZ9Q0gTN5J0S8sRoUlelyHOFAB9BF8u9/dyjc7/xE76Bzunp+
         XkUnTqrvL8w7ZIL8uwqy15D+raNsdIkOYzOauMV1hlCmtMMl2uzA7CFgpt3u9fMt9dcD
         poDFdRSjGPibnzKc/xgwEL7EHVvAvRoVGS47yhVCxqoDJkuKmziur3Xc6FWch79dWmpo
         HwNkjzyoGw8EKOBBDc7dEBhSyL6YD6klAJVP+mZP0PeaT+kAFMPBe7XVUmj4l7PN/vZ4
         BV5qRnDkNRFM00K2Sm/qLYUcULXHMJNteinCM7vPq7Ra4TQd1PIyk882jMk4hX8E1NpG
         r4eA==
X-Forwarded-Encrypted: i=1; AJvYcCUhxGWM2PzAumrCWJIm/HtPKC+TE3XGv5p1TlxAjnxK1QmWhbllm6/N4qOuQcBApaQHw5l98d0YIQu1YxiOkg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzYjn+V/nUA0H/aZCahIE9ijxmCD1ZEcJLgez5QNXhjcmXU8Eoo
	0Qn43acgqXTLRL3wQd9KTFH2EyaJGJsYH1SOl1KINXqnIeJ26qgV1KvDTCpRqQ==
X-Google-Smtp-Source: AGHT+IGet2bY2MWfssxOfbEhS0VJ9OTuNI5+X2G2o3nzQ6wMgbpufEiy5menDVmJwJJAbGvW4570bg==
X-Received: by 2002:a05:6a21:6e41:b0:1d8:a208:f309 with SMTP id adf61e73a8af0-1d92c51fab0mr3397932637.27.1729257239635;
        Fri, 18 Oct 2024 06:13:59 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com (176.220.194.35.bc.googleusercontent.com. [35.194.220.176])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eacc256cc8sm1120222a12.56.2024.10.18.06.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 06:13:59 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Fri, 18 Oct 2024 13:13:44 +0000
Subject: [PATCH v2 4/4] arm64: dts: mediatek: mt8183: willow: Support
 second source touchscreen
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241018-post-reset-v2-4-28d539d79e18@chromium.org>
References: <20241018-post-reset-v2-0-28d539d79e18@chromium.org>
In-Reply-To: <20241018-post-reset-v2-0-28d539d79e18@chromium.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-7be4f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_061400_775489_D8E2EEEC 
X-CRM114-Status: UNSURE (   8.44  )
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

Some willow devices use second source touchscreen.

Fixes: f006bcf1c972 ("arm64: dts: mt8183: Add kukui-jacuzzi-willow board")
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts
index 813e6bf65b62ee6742e52133f9adf7e83a6078c5..e8241587949b2bc238ffa85f8fa6b6ca78b1d6f5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts
@@ -12,15 +12,3 @@ / {
 	chassis-type = "laptop";
 	compatible = "google,juniper-sku17", "google,juniper", "mediatek,mt8183";
 };
-
-&i2c0 {
-	touchscreen@40 {
-		compatible = "hid-over-i2c";
-		reg = <0x40>;
-
-		interrupts-extended = <&pio 155 IRQ_TYPE_LEVEL_LOW>;
-
-		post-power-on-delay-ms = <70>;
-		hid-descr-addr = <0x0001>;
-	};
-};

-- 
2.47.0.rc1.288.g06298d1525-goog


