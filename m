Return-Path: <SRS0=JxBa=DV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72033C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 16:24:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E248E20B1F
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 16:24:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CoDg/kmM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="z4uKG0Ta"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E248E20B1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i9/MP46icqoo39JHF9KDg0t0PlHzTGpvMLYt+qoxu5M=; b=CoDg/kmMeO+ddCRaJVHfceGmJ
	DLmvPp0oJVnVGOsNe66xxlONb2DF+ZCSvhflfiI/tpqh5L/NtfeL4GkytEQfA6NChLX5SuJjkz9R7
	n+WRsXWpwGLZVtMAUkLl08Lf5VEIedyzyDMS3HwuNjJ1ez0PfAnlyt6qUqIdFdbYRQxv/EppIV6gc
	igvCtEidVzWOUcjGHA5WE461so/S36RmwUynNVomOxr2hCLK6aY+gs2Le8Z1i1MXGhFvSfCebQ3Mx
	QjIhNEFZ0MtOY1cxxgOrI3fZBckjILF6Z1q7p3/cSYA+ynk9ctZ3QNJm0JST2+y//SzKD5vHFK56Q
	4a7Aqk1wA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSjZw-0007Vp-9g; Wed, 14 Oct 2020 16:24:40 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSjZl-0007SP-2W
 for linux-mediatek@lists.infradead.org; Wed, 14 Oct 2020 16:24:31 +0000
Received: by mail-wm1-x344.google.com with SMTP id l15so107553wmh.1
 for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2020 09:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BaFCO6gd2Q1mLQwHFnqU3U26NuiKVA9TtHwt6ApIueE=;
 b=z4uKG0TaAnEUK/LOW7FQKsbgAlqV3bAVForRdnQloJOHZPjG1nEzA/5v4H7w5vHGM7
 vUN6Q5fMr+ZnHXhOI9GANlsYcH/LdlwtxI4NZjL1U6RixIjOmYo436hRk4FwmVLXaDu8
 s+qfQJ5m9tXNH8KirkktpfDxWYa587OdSB1JGHzmLwYUG7I+AllUPQ+iGNfig7lSLj6O
 S0I/ziaRhEMGq/hQ4Pp6jTbev5zGlQ0hYOZmgOVmpkU/o0j8Wlaj+q71ETFCUTyD604F
 S8OcPWoHOXiiirWszhsWBi3P/EivygmiJi51n1EXgQM6IDCEFa8ihKz6JzLewBd4xZPE
 Z+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BaFCO6gd2Q1mLQwHFnqU3U26NuiKVA9TtHwt6ApIueE=;
 b=tPu832jlVRzQJU1cWAzJjGfNKuwjbOIRGDujwETXQlyLSCKRxBFhVl6E+ovFzD40zw
 Ro0SKRUIK+G72GiUSYy1RpgLe5+RE2vePzare4YM2vg9qCCV/eGgXi/vBJNSvxJ9SO3B
 ehiiKHw4KKO5IugcJR0cvW8Njf7qtcJiPesn8UUch6dcuzXOl71/9pqFvoEnRUdEDspY
 SH+ga2aC9VvBUTCtViXiYpd+vNPIvQ8yKEx3HoLyr5H1XQuFgGVtLK0oVTY3i7toHmv9
 9HBFum1Wn+6YsJ+FsXc6j28MRxw09hsI28ot/174UQLsNDYyBuXPRxnm6rDdJ1s//t/5
 KevQ==
X-Gm-Message-State: AOAM531qwAX5agNJPEXXjJXBBNAy6VCeQIR92VwxkMopWMvSSKceEK7x
 AhfDpJ+AcXX2IFs+l41ZbYVaXQ==
X-Google-Smtp-Source: ABdhPJwQ+LmzARi1BWPfpNnEKf7mU0uno7dJMOjw1+8Rr/HNszFYvXvwi3TJxZuz3zGrR/DcFxhT5A==
X-Received: by 2002:a05:600c:2217:: with SMTP id
 z23mr209839wml.133.1602692667896; 
 Wed, 14 Oct 2020 09:24:27 -0700 (PDT)
Received: from localhost.localdomain (138.165.185.81.rev.sfr.net.
 [81.185.165.138])
 by smtp.gmail.com with ESMTPSA id x21sm206227wmi.3.2020.10.14.09.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 09:24:26 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: mediatek: mt8516: add usb1 node
Date: Wed, 14 Oct 2020 18:24:04 +0200
Message-Id: <20201014162404.1312544-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201014162404.1312544-1-fparent@baylibre.com>
References: <20201014162404.1312544-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201014_122429_180386_DA920895 
X-CRM114-Status: GOOD (  11.51  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: matthias.bgg@gmail.com, Fabien Parent <fparent@baylibre.com>,
 robh+dt@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The MT8516 has 2 USB instances. Add support for the second USB instance.
usb1 can only work in host mode.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8516.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index 50049b6c1ba7..eca7969e15ab 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -455,6 +455,20 @@ usb0: usb@11100000 {
 			status = "disabled";
 		};
 
+		usb1: usb@11190000 {
+			compatible = "mediatek,mtk-musb";
+			reg = <0 0x11190000 0 0x1000>;
+			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_LOW>;
+			interrupt-names = "mc";
+			phys = <&usb1_port PHY_TYPE_USB2>;
+			clocks = <&topckgen CLK_TOP_USB>,
+				 <&topckgen CLK_TOP_USBIF>,
+				 <&topckgen CLK_TOP_USB_1P>;
+			clock-names = "main","mcu","univpll";
+			dr_mode = "host";
+			status = "disabled";
+		};
+
 		usb_phy: usb@11110000 {
 			compatible = "mediatek,generic-tphy-v1";
 			reg = <0 0x11110000 0 0x800>;
@@ -469,6 +483,13 @@ usb0_port: usb-phy@11110800 {
 				clock-names = "ref";
 				#phy-cells = <1>;
 			};
+
+			usb1_port: usb-phy@11110900 {
+				reg = <0 0x11110900 0 0x100>;
+				clocks = <&topckgen CLK_TOP_USB_PHY48M>;
+				clock-names = "ref";
+				#phy-cells = <1>;
+			};
 		};
 
 		auxadc: adc@11003000 {
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
