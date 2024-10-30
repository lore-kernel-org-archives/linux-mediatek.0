Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A126D74951
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Oct 2024 07:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p5E41YcKQMsnvd5Y3pXv00rVYjTkf8zP3kA/zd8g2Nw=; b=axj8kQXf+IEjxEmBE18We26vdl
	OS+m9CqKuLWSCWBSZIgNDRY4RiRttpGzWDoY3cLnezcT7e6Yn3eSktmyiU0OHtltrTVCQQ3fv68U/
	vEnQNW3gfo+Fv7p7fL8+jC0QQXiwUdXuAx4/ch8Jv9twFxLzWtZC2lqxm11tq0RC1hqV2ygL+LMYv
	m9DtusCn3z4AxEWBDSdjnffGr0/fozU9p0D0uIdeF7GFYTDQSwftN92zCuMRjO8earhhfBsJwMXpF
	sqrVwPdnx8H9yac6jfDY8leSAQbMWWBfjvhCmJVAtmLLkQaBdqG3BiegiZFEBJ1r4+8Y1TfQVIyyX
	aZwaCmqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t62pM-0000000H50L-12aH;
	Wed, 30 Oct 2024 07:09:12 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t62ix-0000000H48s-3PyF
	for linux-mediatek@lists.infradead.org;
	Wed, 30 Oct 2024 07:02:37 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-7ea7e250c54so4728138a12.0
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Oct 2024 00:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730271755; x=1730876555; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5E41YcKQMsnvd5Y3pXv00rVYjTkf8zP3kA/zd8g2Nw=;
        b=iXVTVtzd3yfrfL7+O3OeUjwTAn6xYUhlAXJzMy6EnRjM1gojqp0j5xfmlI4Gl4THy4
         HZIBvons3ox2A5eBT9arapw05LyybDGXOexc72cenwrCmqlz7enbhs5575qbKVZpVwqY
         8onxZ0zQXQ6Av1i3SBHRwazf54dUJJOmk8p1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730271755; x=1730876555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p5E41YcKQMsnvd5Y3pXv00rVYjTkf8zP3kA/zd8g2Nw=;
        b=mjeGQ6XxwEPhoC6a/dmNQQmTSjb56Qez8BIoECeA/v5Xr7NrjMVxYP8yM00t0SL2JQ
         M6xhYBxjIZoZAGB62NWkNQZrFIQSiPbJYS3RXrr9l5h6zud6mEqxZIiG7gZchtsF4MFB
         cnypbmiJbAIQgq3iW72pZKCW3vlFCSyF3rTpBoVnLiFn4CSrBqJMnaI+0N+l0X9o1AZY
         HiZn6CJAKdpBb8END3WezEzJhBlmOASbZs7rrFPocPf4memjPNwQFbkpPNCwOcjOHtby
         Sie2jeOxvzliZXGEdqVXU1h0hHag3eOJnh+zJWaZyKf+gnWQvmnxtImGNEj1V4lTftwE
         nyuA==
X-Forwarded-Encrypted: i=1; AJvYcCUCG8zNetmDm4W+pjXh/BvqxJ5y/sY8EyR6wQ2hPltUz/+v0CbKFT8bk6SmzMSkGcw+ygZUAhiw/o2/zC++Bw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOek24/LpBWV/Hs29IgIVN9RrJrd0CSVHSQNObFwDsgaDTpwzL
	77XQRMb8wco64hJ0p15MOEb8SS884Yaut8eQ9UQS0GNxUhN/D7Lmcx+8a2jNHw==
X-Google-Smtp-Source: AGHT+IFrSYRhWTI2J+yd+pm72XTyFxdk2kxo61HvPYmkLDKpokBYjWWPyujJdt4yASL5lBgrzTxGwA==
X-Received: by 2002:a05:6a21:7890:b0:1d9:c5e6:51af with SMTP id adf61e73a8af0-1d9c5e654aemr11950511637.3.1730271754788;
        Wed, 30 Oct 2024 00:02:34 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:d1f3:aa64:657f:d8a8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057931a94sm8635848b3a.68.2024.10.30.00.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 00:02:34 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: mediatek: mt8183-kukui-jacuzzi: Add supplies for fixed regulators
Date: Wed, 30 Oct 2024 15:02:22 +0800
Message-ID: <20241030070224.1006331-4-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241030070224.1006331-1-wenst@chromium.org>
References: <20241030070224.1006331-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_000235_867614_036B5973 
X-CRM114-Status: GOOD (  10.56  )
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

When the fixed regulators for the LCD panel and DP bridge were added,
their supplies were not modeled in. These, except for the 1.0V supply,
are just load switches, and need and have a supply.

Add the supplies for each of the fixed regulators.

Fixes: cabc71b08eb5 ("arm64: dts: mt8183: Add kukui-jacuzzi-damu board")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
index f540dcac74ea..80888bd4ad82 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
@@ -20,6 +20,7 @@ pp1000_mipibrdg: pp1000-mipibrdg {
 		regulator-boot-on;
 
 		gpio = <&pio 54 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&pp1800_alw>;
 	};
 
 	pp1800_mipibrdg: pp1800-mipibrdg {
@@ -32,6 +33,7 @@ pp1800_mipibrdg: pp1800-mipibrdg {
 		regulator-boot-on;
 
 		gpio = <&pio 36 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&pp1800_alw>;
 	};
 
 	pp3300_panel: pp3300-panel {
@@ -44,6 +46,7 @@ pp3300_panel: pp3300-panel {
 		regulator-boot-on;
 
 		gpio = <&pio 35 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&pp3300_alw>;
 	};
 
 	pp3300_mipibrdg: pp3300-mipibrdg {
@@ -56,6 +59,7 @@ pp3300_mipibrdg: pp3300-mipibrdg {
 		regulator-boot-on;
 
 		gpio = <&pio 37 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&pp3300_alw>;
 	};
 
 	volume_buttons: volume-buttons {
-- 
2.47.0.163.g1226f6d8fa-goog


