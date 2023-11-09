Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682EFC4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 10:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SXvBziOOzPoe9p06qPekw9ojRyDCzXj55skHWBeOemE=; b=d3waN47nblMqOXTemnZvW2OCvR
	BMJ3j8pvvuLPGUwAodSzPyY2Xc2111syvMJxIfXLPNAqKVrJongTL/Y7cVsFDij2gJIqToFlLebiV
	/jA00Ekpzy+IaT1e9FkMbET24OsPczBDj7SCmwUjNJ4urJbpEJgdc07B6cifrc7TWtX8IcxbpXS2+
	cFo+s+456miV7BxMxdGqwa5GUWJdlVrIcnqGc3S4zdpAAweRaXqnc5vAB+scAS0lFbuk2gEyKYSiu
	sxPFpO4e1JFFu6AL4nIPviq/K58Pgipslxds2sqpWcSu/xWseexOpxpUMIXpcylP5xQsosdBrxyz/
	kHccDUAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r11wG-005rua-0x;
	Thu, 09 Nov 2023 10:07:04 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r11wB-005rq1-2U
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Nov 2023 10:07:02 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1cc0e78ec92so5214895ad.3
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Nov 2023 02:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699524419; x=1700129219; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXvBziOOzPoe9p06qPekw9ojRyDCzXj55skHWBeOemE=;
        b=d/b7PkYAX4gUyIgzqMc70WPGN5ry62AD+8kAuHWZGTvaZ7qSE0O0wb4Kc2MnfHvZkS
         4omcy/cG2bHZZLZ4ivHm2QYA1tMGEQ0CDw0d25V0PnuukJukKzrDr+IAzcRyS/1+n70+
         8fqcNaC7PK6OUjEGuzfUI48jbp1P1MydhX1p8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699524419; x=1700129219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SXvBziOOzPoe9p06qPekw9ojRyDCzXj55skHWBeOemE=;
        b=p4Vq1UafEM1pTdL77HjZwlbbSXZOAy1bywBA4+kNG7nk0hFJknuGfvmmYyzT7DOf5V
         d/TfHPPt/NInzY+PaFUCYxzI7XS4awwUMiCSyuRVw1Y1saQkaR5y82Y7x42t1ZdWxmHp
         I3GiGWtDsm8VBVO+BT9VPSuoV/proItWhi32S5+wUOBTmiDFEEB6MnmNBZmF/1qZilSx
         U3w2UVKzDUHEiKfhGMFmbr/zyEwCZLVGaKIQ+GqZkaMNKIbHEA8VltZJyzjwSddTQjgT
         NYa89duGzwAPZKqa++JcnqiusGwrR0xN51dDSOhQHI4+ICRwf1v9/WlsrrvA74YC3vj+
         k3/w==
X-Gm-Message-State: AOJu0Yw9FNjkxu6e67jdmJJNgp8UJEGCRRu4e+/pZV5c/zaVfoqL0IlT
	iNKErMzHG1YvxhdqbF45iQqEgQ==
X-Google-Smtp-Source: AGHT+IGjXFbBjSHLl5U/ebTbDrumNW0v2EVWcvyySgzvtZFdToUF1oRe0pnconHbHlzrFnCRFotkOA==
X-Received: by 2002:a17:903:234e:b0:1cc:50f6:7fcc with SMTP id c14-20020a170903234e00b001cc50f67fccmr5370038plh.55.1699524419209;
        Thu, 09 Nov 2023 02:06:59 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6f57:d4c:468c:5daf])
        by smtp.gmail.com with ESMTPSA id c13-20020a170902d48d00b001c60ba709b7sm3127511plg.125.2023.11.09.02.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 02:06:58 -0800 (PST)
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
Subject: [RFC PATCH v2 4/7] arm64: dts: mediatek: mt8173-elm-hana: Add G2touch G7500 touchscreen
Date: Thu,  9 Nov 2023 18:06:01 +0800
Message-ID: <20231109100606.1245545-5-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
In-Reply-To: <20231109100606.1245545-1-wenst@chromium.org>
References: <20231109100606.1245545-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_020659_810343_5C765A76 
X-CRM114-Status: GOOD (  10.22  )
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

This introduces yet another second-source touchscreen found on Hana.
This is a G2touch G7500 touchscreen, which is compatible with HID over
I2C.

Add a device node for it. In keeping with the new scheme for second
source components, mark it as "failed-needs-probe-touchscreen".

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
index 052109b0fa3b..d3f1277ac9b2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
@@ -31,6 +31,15 @@ touchscreen3: touchscreen@20 {
 		interrupts = <88 IRQ_TYPE_LEVEL_LOW>;
 		status = "fail-needs-probe-touchscreen";
 	};
+
+	touchscreen4: touchscreen@40 {
+		compatible = "hid-over-i2c";
+		reg = <0x40>;
+		hid-descr-addr = <0x0001>;
+		interrupt-parent = <&pio>;
+		interrupts = <88 IRQ_TYPE_LEVEL_LOW>;
+		status = "fail-needs-probe-touchscreen";
+	};
 };
 
 &i2c4 {
-- 
2.42.0.869.gea05f2083d-goog


