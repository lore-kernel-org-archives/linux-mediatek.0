Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CDDCCA480
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGUb9DmOvoGv8nh5rqV1xHbR9kL6IKYbqd/qwv1q+CA=; b=xF6B5FjLDwvB8ZQldMJlO9p+GC
	HqFfDS9U2uEi0UHD4CcOz1wXEqMGGH4CdiVkCKcve+EpATt5esT2ybX4gNAYPfxdWLaBFfhA+GCKo
	zU89Np8RtBvEP101Gp3nLg4UyU1unoIWSNpQ9Cv0oPIfSCkRXLhLEVQA9OPD0pBGGZAVybqzRHUX2
	bFfrBvTxtc5/HlmTrlWP/v+YFcXRpIFWvXZbhxPlAX0qEYSonnNUEwxC7YznJYwqhgE2H6Cu9S3XL
	HJvyCoCwwpWxJhWh+wvkQpSl4QWt5T5H0JagBauYi6CT5pleTCHtQ2pbZ8J5w6O+C1fJOTU2V4u1j
	j7mpWWSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEB1M-0075hp-UI; Wed, 20 Jul 2022 14:49:52 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEB0G-0074hk-0g
	for linux-mediatek@lists.infradead.org; Wed, 20 Jul 2022 14:48:47 +0000
Received: by mail-wr1-x429.google.com with SMTP id h8so3741490wrw.1
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Jul 2022 07:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:date:subject:mime-version:content-transfer-encoding:message-id
         :references:in-reply-to:to:cc;
        bh=VGUb9DmOvoGv8nh5rqV1xHbR9kL6IKYbqd/qwv1q+CA=;
        b=jRL5JcT9oKaeo7HwZrYobK/YmXLf7T2OTvQbB+5Tt4Ej73xiicgN2WuAV9zlw2rEKj
         gBD1wR+vAFAyQ36BarOC42aGFh0Z+CUVKmoz8jocS+Sr1oFSoZdpIpLnfx+p6ZO2A1ou
         AAcutHoNxH3HiLedSavddURbO+/DeoJdbuK1UKbsYvq/AEfupOK/Luj7ZiWHbwkOSZy2
         aHRgAVTfYYziWX4EbaYfxDteMDi0fDZibAkzqfnGLqb6TtdUDY9XJZimypikQHHkA/RS
         HwXgTHe4cGSkZD6UzZkh/rw9pNfYj2qyAa5Grv7CnZLvskr1FGDTqRsjvNQ4XaQ9hQ0Y
         SVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:subject:mime-version
         :content-transfer-encoding:message-id:references:in-reply-to:to:cc;
        bh=VGUb9DmOvoGv8nh5rqV1xHbR9kL6IKYbqd/qwv1q+CA=;
        b=jS7Qbghmw7lYgIM2VlqoiFeU6XHysL337d+vfqXfn89H6m0I62ybCFOZ2axsToCDs3
         TZhLaH/DNu+a6bpnLvOk7zS0vZGy2PtwviK9V+QnWAphVyYlYp5Ww08QjvdCBfewGNaz
         s07b7pW21FUqNlIDQ+8DwGsTNLTUXDqAOGpjjahPz6UgzuZe46TUP+EFrPXalA24n2WA
         LRlYuWjFW14l2iWyMqjzpim+Z77E56RKlSYazN6C+K+lqdLq59CFHCDZbiWjMnH9daug
         /V0TOk7XPJVNlU2hbE9VpFGv/18SP1C3EK6Pd991KlAgrwqzliruB/3CX1K569ppq9E8
         MBOw==
X-Gm-Message-State: AJIora9ZAv89lBZfb8brucRkepQGdwmfQpP9AJTGOZSxo9ZobRssa2qs
	5rA4qpm0ioO1fFDXCtpiVSbiSA==
X-Google-Smtp-Source: AGRyM1vTy640y2iV3Q5noFGBYMKVc349uYWye3eyUbUhWj27qZA/i9aPmd4vKm57vaVf4wNmnxmupw==
X-Received: by 2002:a5d:648a:0:b0:21d:b684:9c76 with SMTP id o10-20020a5d648a000000b0021db6849c76mr30956265wri.463.1658328522794;
        Wed, 20 Jul 2022 07:48:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb19:85e6:1900:c639:22f8:bed9:44dd])
        by smtp.gmail.com with ESMTPSA id f8-20020a05600c4e8800b003a31673515bsm3321121wmq.7.2022.07.20.07.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 07:48:42 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Date: Wed, 20 Jul 2022 16:48:41 +0200
Subject: [PATCH v1 5/6] arm64: dts: mediatek: mt8183: add keyboard node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220720-mt8183-keypad-v1-5-ef9fc29dbff4@baylibre.com>
References: <20220720-mt8183-keypad-v1-0-ef9fc29dbff4@baylibre.com>
In-Reply-To: <20220720-mt8183-keypad-v1-0-ef9fc29dbff4@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, Fabien Parent <parent.f@gmail.com>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.10.0-dev-54fef
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_074844_081586_E85DD792 
X-CRM114-Status: UNSURE (   6.19  )
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

From: Fabien Parent <fparent@baylibre.com>

MT8183 has an on-SoC keyboard controller commonly used for volume
up/down buttons.

List it in the SoC dts so that boards can enable/use it.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 9d32871973a2..9d8fdebaabe3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -943,6 +943,15 @@ pwrap: pwrap@1000d000 {
 			clock-names = "spi", "wrap";
 		};
 
+		keyboard: keyboard@10010000 {
+			compatible = "mediatek,mt6779-keypad";
+			reg = <0 0x10010000 0 0x1000>;
+			interrupts = <GIC_SPI 186 IRQ_TYPE_EDGE_FALLING>;
+			clocks = <&clk26m>;
+			clock-names = "kpd";
+			status = "disabled";
+		};
+
 		scp: scp@10500000 {
 			compatible = "mediatek,mt8183-scp";
 			reg = <0 0x10500000 0 0x80000>,

-- 
b4 0.10.0-dev-54fef

