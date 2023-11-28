Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C24C07E98
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Nov 2023 08:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dxKs9xH99OQyNQM5ja7w5sBqIVdDZ2l2tkwooD9gc1c=; b=TXqpZOXf4xIYpRtzGD3jCMI/Ng
	EzFDIexR3pjxGZSO/6I1xSd+zMwhLrJFnTztqfewUVdtXvcIL8SIQGH2Nb+Zgd7acBTusHuWJKTfk
	q54iXpKsfp4l/KE3NEKQL5qHg1aDQtJHruYgiRNls+bWcriO1MmJ+TnscXGxAf6JUcbr7xha+SUjY
	iiY3EX2Stm7BAzoqnfhMndMcrphb/Z/RXwb6hC9N1CZTt+02VenCvOSVZcclfrT4oOzQ01FcL6YOI
	tcjlPyN7+HRezfmoNzfY3ru7n/qwhkKRiuh34+OrFeVW6IgdaOG5rw8Cxxuz2iMOC27DeW2JS5jZW
	jriYUOhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7tiq-004ZmH-0a;
	Tue, 28 Nov 2023 08:45:36 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7tih-004ZgF-0A
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Nov 2023 08:45:28 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1cff3a03d8eso4822305ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Nov 2023 00:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701161126; x=1701765926; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxKs9xH99OQyNQM5ja7w5sBqIVdDZ2l2tkwooD9gc1c=;
        b=RzxmEppw1YcodiweRwsf9YwsGZdleaDzs+9u3FZ00NYFTB730tvlITD5D84Dz8x5W+
         3xm3vtX3qRmPE54pxNcNKZTW8WjIfW9ypesj+VblQDQmw2uoaYDCWEsL5Lv1gagA2I93
         fyQCPJ3pzyGQC+xJNkhYNI1X+z9cLOEMabdWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701161126; x=1701765926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dxKs9xH99OQyNQM5ja7w5sBqIVdDZ2l2tkwooD9gc1c=;
        b=O16g4VONCgQgHDoYe8UHrMViNQ4+rQAUJdh1JEaiNQZYI4wmTZQq90xbv2Fo8Tao5S
         /Zb9Vrx0Mnwlzr0fJlr840OVtsfR1YKS5mltql9GDig/6Dqi0+TqzyYazcF0560iiNOo
         MFEWK2RPHT7i/DfHotME0KjGInxqQXMN5aOu3NI0FMZABe+vLiXWb/pDAJ2jVSM3j4M5
         OcQU1EBAtb8dFrh0ursTxvC9usxA3NtVKfGTiDjYyuFP3+ciyYRluswtCKvJFJGHi61y
         rZh/OMXT7wDTpfthCqV0dnpdkxuMoeBjW8nIsMHGTxhjDNNyLWW5T9SM7tzrUy3d7B/G
         4gQQ==
X-Gm-Message-State: AOJu0YxHOim+RqDB3sahjKpaUWNqtOZZ7zqytSUmk77trHVnVfGB4iH/
	UvfTDUj5FnNdTyRVJHYY/FHMeg==
X-Google-Smtp-Source: AGHT+IEHq/8o8TRy8LBy9PDIxcsp3BaVE1rQDjyRLP/di+1I1g3a9pBwAwe3ppG7Mgw8ZIdwK6eHKA==
X-Received: by 2002:a17:902:988b:b0:1cf:b130:e9af with SMTP id s11-20020a170902988b00b001cfb130e9afmr10074896plp.20.1701161126645;
        Tue, 28 Nov 2023 00:45:26 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:a990:1e95:a915:9c70])
        by smtp.gmail.com with ESMTPSA id j1-20020a170902c08100b001ab39cd875csm8358074pld.133.2023.11.28.00.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 00:45:26 -0800 (PST)
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
Subject: [RFC PATCH v3 5/5] arm64: dts: mediatek: mt8173-elm-hana: Add G2touch G7500 touchscreen
Date: Tue, 28 Nov 2023 16:42:34 +0800
Message-ID: <20231128084236.157152-6-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
In-Reply-To: <20231128084236.157152-1-wenst@chromium.org>
References: <20231128084236.157152-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_004527_086385_75809046 
X-CRM114-Status: GOOD (  10.41  )
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
source components, mark it as "failed-needs-probe".

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Drop class from status
---
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
index 1d68bc6834e4..216d8b43be05 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
@@ -31,6 +31,15 @@ touchscreen3: touchscreen@20 {
 		interrupts = <88 IRQ_TYPE_LEVEL_LOW>;
 		status = "fail-needs-probe";
 	};
+
+	touchscreen4: touchscreen@40 {
+		compatible = "hid-over-i2c";
+		reg = <0x40>;
+		hid-descr-addr = <0x0001>;
+		interrupt-parent = <&pio>;
+		interrupts = <88 IRQ_TYPE_LEVEL_LOW>;
+		status = "fail-needs-probe";
+	};
 };
 
 &i2c4 {
-- 
2.43.0.rc1.413.gea7ed67945-goog


