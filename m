Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71AD6C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 13:31:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FDDD20771
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 13:31:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yQXGhcRb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Mm7n4KSQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FDDD20771
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YpCH9ZRo5YdTmiLljtJ3gnPnwHWvKJ+Qey8vIsHLB4Q=; b=yQXGhcRbqXq1w3iEyybZBaDji
	jouAoTAG+/lYZXOV5Lh/JzaI7rK2g5KNjIoSgGrVRDU7mRsF4jhY04/7CsAQ5DHIXwQQyScg2kkp5
	p3v1ot69cXB4Ej0G6g0kmDasVypBRzVGsiuzizRnRYRzFRS2Q3sNp6NZ6j9YmNBD7LeXQ7lmCJ8gp
	XsWmi+rp8bOadh96O8hiYfyBPy2JrS/ewNqH8i5VDi73Jkw1atLhVqGlcIlvwv7LvkJko+3enYdmv
	POPains+5RguK/IVcCmfPt7cYaDK2C02UiAXFkj4RfKz8kqgJ45xVSFqZOnrpFQv474zHnmDClHHF
	+Tpn1sb1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juyXl-0000Xv-7d; Mon, 13 Jul 2020 13:30:53 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juyWi-0008Nh-WF
 for linux-mediatek@lists.infradead.org; Mon, 13 Jul 2020 13:29:56 +0000
Received: by mail-wr1-x443.google.com with SMTP id f7so16572753wrw.1
 for <linux-mediatek@lists.infradead.org>; Mon, 13 Jul 2020 06:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1L4Fd0ydGXB1tLJq49wHyxg/8oVp3tIdrwadCHK6MBc=;
 b=Mm7n4KSQrzuIzL5V5oAkygyQJZK8zxZPRPWSKVqHAT9JGioQsWMBEhYVvUKCdvZ5qk
 nLEktNB+4PQs+YC1AYQ40rQPY1h/mssBV76kXxTD9eS2QLXV4HhBsMuTNBI1KaNCq3nH
 ElPJHUjYX36UTba60MYN5rdXsYfuPYcBEzH5Zw+374d1AZ5YlG0ZqAawK1AgYum1b4e1
 XwIfBVLmSLzPzyGRur2HJh8m9v4Ri3z1GoUxesRy0e73/rvpIXw7LyWY/N8mif+ZuscX
 ypm/lS84F5l4VhYEeo49NcBQJ2dealR6xBuOF3ezU1P1edoaMRebYsEhc6eJldWcsEdS
 Kdbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1L4Fd0ydGXB1tLJq49wHyxg/8oVp3tIdrwadCHK6MBc=;
 b=GRgBM9RgEdq0IC1rF8dJ/muMnKgOQIJDZUuts4SyWDYUfnfBxz5/q1egcqZT3ymyYv
 +6GTpRaR/TzIa1p7RzvZ/ET+m+5uclh8MIZApR0xd5Tmgj4QDPkHim5OOCloZKA4JCkI
 mFOYyoS3yaSIPj4lKCVYoyiDzp9qLmalq1o5Yh56K1pDyxDlmD3+8psVI/hStmsnUAzG
 2XBqs6Dqu6V058d6fEj14B+ivWlH7mUoFGEjf0TA/R2mxppWOiFDCG38dkCzHdTLaiK/
 bQfZfbMy8KgKVNQWvLZew3XMm54GFx5t0DoywBn3lmMQ9nLU9cjHpbBqGNhQnuwsDc9m
 b25Q==
X-Gm-Message-State: AOAM532viomgJ5qSO1ExGAc7Nb2Z5gGyPn9/ftn2uUp6/5IQke1gELW3
 ir3/TKgblNt27R+ekvQEzDZsUA==
X-Google-Smtp-Source: ABdhPJwzZlcUKbMf7yvv/ipKPBNj0GCeAedKQcrzHWzFJjvtRWFrPMYVOGGBdMWDjOPRwHglztjNig==
X-Received: by 2002:adf:e90d:: with SMTP id f13mr75056890wrm.146.1594646986821; 
 Mon, 13 Jul 2020 06:29:46 -0700 (PDT)
Received: from linux.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id j14sm23896642wrs.75.2020.07.13.06.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 06:29:46 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH 6/6] ARM64: mt8183: Add support of APU to mt8183
Date: Mon, 13 Jul 2020 15:29:27 +0200
Message-Id: <20200713132927.24925-7-abailon@baylibre.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200713132927.24925-1-abailon@baylibre.com>
References: <20200713132927.24925-1-abailon@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_092949_187476_40ACA3B7 
X-CRM114-Status: UNSURE (   8.74  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Alexandre Bailon <abailon@baylibre.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This adds the support of APU to mt8183.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 42 ++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 1e03c849dc5d..6a2e9ee0b566 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -720,12 +720,54 @@ ipu_adl: syscon@19010000 {
 			#clock-cells = <1>;
 		};
 
+		vpu0: vpu@0x19100000 {
+			compatible = "mediatek,mt8183-apu";
+			reg = <0 0x19180000 0 0x14000>;
+			reg-names = "mmio";
+			interrupts = <GIC_SPI 292 IRQ_TYPE_LEVEL_LOW>;
+
+			iommus = <&iommu M4U_PORT_IMG_IPUO>,
+				 <&iommu M4U_PORT_IMG_IPU3O>,
+				 <&iommu M4U_PORT_IMG_IPUI>;
+
+			clocks = <&ipu_core0 CLK_IPU_CORE0_AXI>,
+				 <&ipu_core0 CLK_IPU_CORE0_IPU>,
+				 <&ipu_core0 CLK_IPU_CORE0_JTAG>;
+
+			clock-names = "axi", "ipu", "jtag";
+
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_VPU_CORE0>;
+			memory-region = <&vpu_ram>;
+		};
+
 		ipu_core0: syscon@19180000 {
 			compatible = "mediatek,mt8183-ipu_core0", "syscon";
 			reg = <0 0x19180000 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
+		vpu1: vpu@0x19200000 {
+			compatible = "mediatek,mt8183-apu";
+			reg = <0 0x19280000 0 0x14000>;
+			reg-names = "mmio";
+			interrupts = <GIC_SPI 293 IRQ_TYPE_LEVEL_LOW>;
+
+			iommus = <&iommu M4U_PORT_IMG_IPUO>,
+				 <&iommu M4U_PORT_IMG_IPU2O>,
+				 <&iommu M4U_PORT_IMG_IPU3O>,
+				 <&iommu M4U_PORT_IMG_IPUI>,
+				 <&iommu M4U_PORT_IMG_IPU2I>;
+
+			clocks = <&ipu_core0 CLK_IPU_CORE1_AXI>,
+				 <&ipu_core0 CLK_IPU_CORE1_IPU>,
+				 <&ipu_core0 CLK_IPU_CORE1_JTAG>;
+
+			clock-names = "axi", "ipu", "jtag";
+
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_VPU_CORE1>;
+			memory-region = <&vpu_ram>;
+		};
+
 		ipu_core1: syscon@19280000 {
 			compatible = "mediatek,mt8183-ipu_core1", "syscon";
 			reg = <0 0x19280000 0 0x1000>;
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
