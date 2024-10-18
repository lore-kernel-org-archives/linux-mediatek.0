Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79644D30007
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 13:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+dRN7sp9adnaf0gmX/kygO9824Q5cpdY3njPLrCdXXs=; b=gPxixzeDhon8kKi9ti6TnJUDCy
	KIJ68o9w+FpPOhxk1crTPCgo0Hy8A8mrgKDqMEANY57iJlz6dMqIeqM3AtSfaHjtiY/aAwf/JQ2se
	WgqnM+8IFmon7LlliLFqqhTarrYDNdVNqK1xtM+0/GIwndQo/eK6Npl5qiAHMEtN+JTXcnf6objP0
	6vyRZEcBMkzGfeyrLJIcQSG999DzDfCGycYNgn93HS4oma11C/6b+TvXghiEbIvzKKanAdi0ux4w2
	rCbs+IxZqQzzovajUe+UKy+Z/kaFKIQa6EFAceg1P48d/q18b7a8N+WLbj6MGGCA8PtpLXp8Je9B+
	cYuEuZ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1msg-00000000rE2-22sc;
	Fri, 18 Oct 2024 13:19:02 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1mnl-00000000qLw-3u5U
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Oct 2024 13:13:59 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-71e4fa3ea7cso1703089b3a.0
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Oct 2024 06:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729257237; x=1729862037; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+dRN7sp9adnaf0gmX/kygO9824Q5cpdY3njPLrCdXXs=;
        b=HFWzybYy5CrOTVNhgoNlQd+pk58YdUbXD6q8ZRDYmdqcL71UEUpqEouHQygVLQKUH/
         yWydS/Kf30h8qLzC+VfE17y2sAlX3tCIZn4WXk33jJijufDfMLBjfXjsCJ2BMT7Z4ws+
         T+85owdS6YwrH4ir6Oak2Gj1bdYmo1ETDbt2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729257237; x=1729862037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+dRN7sp9adnaf0gmX/kygO9824Q5cpdY3njPLrCdXXs=;
        b=a4irAX26w0/HBKXQEahMxDc6AtN5At3gHh2/0QG8vK5oA1vykzUHUInD1ZbPlMhokU
         yyJHtDcrDUDuCDzljcM7It4vFTQOv43RFk83AsS2j9bkm1ftnsM/EjB/+aSxaP7g3Y0p
         CyXsE9LHfpZWDXhReN3GmJAnP5/34xqBo6xTv1GtOnN9Zj4oU4GI+rPaPL6DMv2MvVC+
         4Lrk7mWaG2lZFMzqVzAqSF9m9n0uyWECjCDpKzLshY0/IV23t/KyStXZ7cVyD4KQ1kzp
         5fOLGBeAcLIPIrQubJDoGGmWp8MoxfN2bfiYvqmzAan0MyjguRVJJTIxYI7uKzYztOtY
         7ZPg==
X-Forwarded-Encrypted: i=1; AJvYcCXmvJRCgSIWC4NJJwTScNH3xFDACDXmRLLLQ415JCJmllRRg7LY7bAYv5QEVMjA/gFt84jKqtV1N2uyIVMmhQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwA2Zi5jN4x/NbK/c8zZp9G57G6Fij08rRzZQM2+rfLxRlAlJ31
	p8Tz2JqcxmfvbgC68j+i/xV8zaf3UYvNfybZe+ecl9L3MTfEBOBqXXDtjCohcg==
X-Google-Smtp-Source: AGHT+IG28NlyG5rPtxLjr3QMID39Dq27Ev7Stc0ZZoqqQfbQBGFdiwKlYI1AT/T18xmyW3UlwwjAkA==
X-Received: by 2002:a05:6a21:4a4c:b0:1d8:fd01:52b7 with SMTP id adf61e73a8af0-1d92c4bac01mr3296386637.2.1729257236906;
        Fri, 18 Oct 2024 06:13:56 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com (176.220.194.35.bc.googleusercontent.com. [35.194.220.176])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eacc256cc8sm1120222a12.56.2024.10.18.06.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 06:13:56 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Fri, 18 Oct 2024 13:13:43 +0000
Subject: [PATCH v2 3/4] arm64: dts: mediatek: mt8183: kenzo: Support second
 source touchscreen
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241018-post-reset-v2-3-28d539d79e18@chromium.org>
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
X-CRM114-CacheID: sfid-20241018_061357_989485_073FE6B2 
X-CRM114-Status: UNSURE (   8.80  )
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

Some kenzo devices use second source touchscreen.

Fixes: 0a9cefe21aec ("arm64: dts: mt8183: Add kukui-jacuzzi-kenzo board")
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts
index e8241587949b2bc238ffa85f8fa6b6ca78b1d6f5..813e6bf65b62ee6742e52133f9adf7e83a6078c5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts
@@ -12,3 +12,15 @@ / {
 	chassis-type = "laptop";
 	compatible = "google,juniper-sku17", "google,juniper", "mediatek,mt8183";
 };
+
+&i2c0 {
+	touchscreen@40 {
+		compatible = "hid-over-i2c";
+		reg = <0x40>;
+
+		interrupts-extended = <&pio 155 IRQ_TYPE_LEVEL_LOW>;
+
+		post-power-on-delay-ms = <70>;
+		hid-descr-addr = <0x0001>;
+	};
+};

-- 
2.47.0.rc1.288.g06298d1525-goog


