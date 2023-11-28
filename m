Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCAAC4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Nov 2023 08:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Y9ycKtKFTX/BTOyRnkXgZtClc28FDD42zjunKgTjuA=; b=gMIQ95e8ff9D2iJxpEFswKMdtX
	FhkIqiQl8S4dhvA3t17KEhgrMZIuPMG7rCQ04GiqSaJY3TV+r9eWRAZR9TMdOoZjonb5TYXnu4Swv
	xkOvqGQGkBxWgPm5o3uJTqIWQ610xRaWr5pd8uasz1/+i6eleQphR+Omvl40j2HfWFO/JmJYW298T
	ik/8Svv3n2z3GQwW08NP2/Xcc50gSwcms6Sp/1wwDZEIek0b/emB7wf5GUytQR9xxE9xTXIB4Lhkc
	8PYcjfkb4zfy5AMuthHqziD8L58NEgY1UUhLncjyuQRpatgVopUvuP415owOvguEqenhrBWi/bydu
	kTPf9TBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7tip-004Zlv-2X;
	Tue, 28 Nov 2023 08:45:35 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7tid-004Zcc-03
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Nov 2023 08:45:24 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1cfd78f8a12so14293995ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Nov 2023 00:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701161121; x=1701765921; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Y9ycKtKFTX/BTOyRnkXgZtClc28FDD42zjunKgTjuA=;
        b=oakLmCdvVAVDGCs/01XRZab/oznKEjoY4Ilvc24zJVfvobbu43ouPT8eYXTcXGpEyk
         sNh1dn3mL/2tfIbqFTuI5jmREyru77ytLGZV2Jchk5Nk5qNOUqeLVTakA6MJK/cyazB8
         MWq6R+6k+kJRcyFh+Vw5T/wjeqob7ggnsoLdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701161121; x=1701765921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Y9ycKtKFTX/BTOyRnkXgZtClc28FDD42zjunKgTjuA=;
        b=imdEkv6/LAsGfIJeJojU4GKTEBTvc18b+i+ZaWb9tbIYgE61HgsIDMIHJSYqdspLNW
         6t6MifweW6ijPpk/kPxnXUtueEg1fAWzleFVX6wJJTlh+iNSmP0n1DQXWpWnTucnj0Dp
         /GBmheGrhYJikQVSKVnCE0bQIUAkWb+VvwEjdcu2/ocpS9hcEXRoGRBfK79m4913uai5
         b9WDbpokCF0CCCEOrTHQxDvpJNvssZ1S02a0SDuLs0+gHlYO48b0kIbF9Mc4jhHB9ZEI
         gBtqJACgumVKDiTUlZxyJibbWuCtBdRZnOvaf4r6z+J160R/PrDXPvY1ZHGmul/MeNqg
         MQOA==
X-Gm-Message-State: AOJu0Yz/CeZ4PXcKr3sABQUJM93r8GnCMZqm9g7EtZPPwjDn4nSq1AMQ
	AtkR7aPUwzsrpISkW5dYvnuqgg==
X-Google-Smtp-Source: AGHT+IH69IcUw69JVhOmNdkKKnr/r6NBV02lgRCYBJhyyb9MW19+XXMSc7tXlITs3/tx986s7x1SPg==
X-Received: by 2002:a17:902:f54d:b0:1cf:b3d2:5f18 with SMTP id h13-20020a170902f54d00b001cfb3d25f18mr13659883plf.56.1701161121540;
        Tue, 28 Nov 2023 00:45:21 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:a990:1e95:a915:9c70])
        by smtp.gmail.com with ESMTPSA id j1-20020a170902c08100b001ab39cd875csm8358074pld.133.2023.11.28.00.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 00:45:21 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	andriy.shevchenko@linux.intel.com,
	Jiri Kosina <jikos@kernel.org>,
	linus.walleij@linaro.org,
	broonie@kernel.org,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	james.clark@arm.com,
	james@equiv.tech,
	keescook@chromium.org,
	rafael@kernel.org,
	tglx@linutronix.de,
	Jeff LaBundy <jeff@labundy.com>,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [RFC PATCH v3 4/5] arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and trackpads as fail
Date: Tue, 28 Nov 2023 16:42:33 +0800
Message-ID: <20231128084236.157152-5-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
In-Reply-To: <20231128084236.157152-1-wenst@chromium.org>
References: <20231128084236.157152-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_004523_071448_0D2A8DDA 
X-CRM114-Status: GOOD (  11.34  )
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

Instead of having them all available, mark them all as "fail-needs-probe"
and have the implementation try to probe which one is present.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Drop class from status
---
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
index bdcd35cecad9..1d68bc6834e4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
@@ -15,6 +15,7 @@ touchscreen2: touchscreen@34 {
 		reg = <0x34>;
 		interrupt-parent = <&pio>;
 		interrupts = <88 IRQ_TYPE_LEVEL_LOW>;
+		status = "fail-needs-probe";
 	};
 
 	/*
@@ -28,6 +29,7 @@ touchscreen3: touchscreen@20 {
 		hid-descr-addr = <0x0020>;
 		interrupt-parent = <&pio>;
 		interrupts = <88 IRQ_TYPE_LEVEL_LOW>;
+		status = "fail-needs-probe";
 	};
 };
 
@@ -44,6 +46,7 @@ trackpad2: trackpad@2c {
 		reg = <0x2c>;
 		hid-descr-addr = <0x0020>;
 		wakeup-source;
+		status = "fail-needs-probe";
 	};
 };
 
@@ -68,3 +71,11 @@ pins_wp {
 		};
 	};
 };
+
+&touchscreen {
+	status = "fail-needs-probe";
+};
+
+&trackpad {
+	status = "fail-needs-probe";
+};
-- 
2.43.0.rc1.413.gea7ed67945-goog


