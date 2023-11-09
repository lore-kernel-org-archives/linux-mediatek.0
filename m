Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D89C4167D
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 10:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WEwbem2dUlV4PdFvgxehEwFjO+wcgltSG0KbchvjnmI=; b=umfeObIke/8YUTvTiVc/ISlT+Y
	MrACu6nJWaARgqhe6bi9/UTZgJGu5k83aoJHCRGxDhro62ZqIEvL4DdPTaLVgbjyjv/rGBALM6jnO
	G8loqk00lSj8dbLEt3f8M6g0bkPKJYBAekl2wDpNbs/uwPZEsxL9tEDNKhAq+AHhPLJNHydLZq/zI
	OiM40mG1yoC49ytgglgu7jExH/UFGXOz9gBbCIlwD5ICRSJo1BIiBclzB0edFngaQD31pRM5SD6wO
	kI+JFbH/ZK2z39lN4JNWJYzkutftEUNH0EFIsxBJWOjonPjzIEVS1AmTEZWkvVX7psKVa/HCEVoNE
	PDNFqS4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r11wK-005ryB-2b;
	Thu, 09 Nov 2023 10:07:08 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r11wG-005rmB-02
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Nov 2023 10:07:05 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1cc9784dbc1so5852375ad.2
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Nov 2023 02:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699524414; x=1700129214; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEwbem2dUlV4PdFvgxehEwFjO+wcgltSG0KbchvjnmI=;
        b=Vgp2Z2+6fe+Ia8RVoSq7rXicSYNzuAS7ThcBOC2PQtCfAiI3TuEMFLN1MhGndLNX42
         PmAkk9xgnBAzMKoa+aVZcaVQKvCbJZaxCBvfAj90BkMr4dpx8UuF41JEOTSnbN2HSyWs
         NqJKOX0L6+/CLPNJ6O/xtvFTyQbPtKzd1w5dY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699524414; x=1700129214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEwbem2dUlV4PdFvgxehEwFjO+wcgltSG0KbchvjnmI=;
        b=YYNtcETbvDwWCnAKNVQs9KW1XNTmbn4Ek5CcxYQfZGYsa6/2aHD31gD9y0w+AMZIAl
         pf6O7IZPvPlYpq5rEqGsDis8F018zd3nb2HCNdxss03T/wR3eFNEnej2j4TW52KS4H3i
         J09qkE0rmn813UdFOwYLtwhmcjqUQqpIyfRLxbu2quPOOT5THIQPnnoPG2k2z+J0bdEj
         PRdPdM3Es3LYNisF/zeuRqm3qrmLhudTvh65/H8T0eLSFPLQ/1QUoLVAdE8JbK6lutFC
         pu71oYbvqaf59rbbajKfVdpE0ASH5NJFzdiV/vHFk9sAUlgamXAVInFoiucX/X7+h84c
         dPfQ==
X-Gm-Message-State: AOJu0YztL8UO7mAZmgqQqSkc+4qhqIV1zOQPuLKX4oLIeX3JGe8QoYKg
	6FtIl0GIqp7kSHrxNU3ziCgqtg==
X-Google-Smtp-Source: AGHT+IEqvxAt34/tbw9mX55Y4YBlm7iDQwp+MvYnRdV6qPSukdlOlKZvyMezlSiJe3j/GHyYqBRycw==
X-Received: by 2002:a17:902:8603:b0:1c9:e229:f5e2 with SMTP id f3-20020a170902860300b001c9e229f5e2mr4402418plo.34.1699524414545;
        Thu, 09 Nov 2023 02:06:54 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6f57:d4c:468c:5daf])
        by smtp.gmail.com with ESMTPSA id c13-20020a170902d48d00b001c60ba709b7sm3127511plg.125.2023.11.09.02.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 02:06:54 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>,
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
	petr.tesarik.ext@huawei.com,
	rafael@kernel.org,
	tglx@linutronix.de,
	Jeff LaBundy <jeff@labundy.com>,
	linux-input@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>
Subject: [RFC PATCH v2 3/7] arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and trackpads as fail
Date: Thu,  9 Nov 2023 18:06:00 +0800
Message-ID: <20231109100606.1245545-4-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
In-Reply-To: <20231109100606.1245545-1-wenst@chromium.org>
References: <20231109100606.1245545-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_020704_048958_764BFE97 
X-CRM114-Status: GOOD (  11.05  )
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

Instead of having them all available, mark them all as "fail-needs-probe-*"
and have the implementation try to probe which one is present.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
index bdcd35cecad9..052109b0fa3b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
@@ -15,6 +15,7 @@ touchscreen2: touchscreen@34 {
 		reg = <0x34>;
 		interrupt-parent = <&pio>;
 		interrupts = <88 IRQ_TYPE_LEVEL_LOW>;
+		status = "fail-needs-probe-touchscreen";
 	};
 
 	/*
@@ -28,6 +29,7 @@ touchscreen3: touchscreen@20 {
 		hid-descr-addr = <0x0020>;
 		interrupt-parent = <&pio>;
 		interrupts = <88 IRQ_TYPE_LEVEL_LOW>;
+		status = "fail-needs-probe-touchscreen";
 	};
 };
 
@@ -44,6 +46,7 @@ trackpad2: trackpad@2c {
 		reg = <0x2c>;
 		hid-descr-addr = <0x0020>;
 		wakeup-source;
+		status = "fail-needs-probe-trackpad";
 	};
 };
 
@@ -68,3 +71,11 @@ pins_wp {
 		};
 	};
 };
+
+&touchscreen {
+	status = "fail-needs-probe-touchscreen";
+};
+
+&trackpad {
+	status = "fail-needs-probe-trackpad";
+};
-- 
2.42.0.869.gea05f2083d-goog


