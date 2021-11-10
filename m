Return-Path: <SRS0=x/8t=P5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A54C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 19:25:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B040861159
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 19:25:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B040861159
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N7O1c7iWVopCQuVeHgzLWKzdgzPBVsowOkpF9E9RjUw=; b=1YzucEBDUjnsIm
	SODp12fMXnINjiPS12Sl5VksawPxztv0BM716ZSyApA1lrkgrjmxvMAcHKqLkTRPjVTCZoPWHWtvG
	CU0m7OvRJQVtmPWwrJ6DtIQNSaRKniOSlzynhMRT2CPHlJXvDM3DTtAA1ZcwfmRC1bxBbV2plfTR6
	ZwtrrKhzP+07xnfttnaH+Whbd6vCqQk1gPGaFsZ2r5lXebaCflT6lVxr23BdPloUgH8yHkW5CAUcs
	vVHWjHioUUPmbAIvdMi71NRe0s618fQi4/KGLK0s1D4w2I5lDUGYjZXZe7dHxXGV7Lxx7wFgH8AhW
	XI8+wmFwM/yBZeLYVjXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mktDf-0068QC-QX; Wed, 10 Nov 2021 19:25:15 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mktD6-0068Ea-KX
 for linux-mediatek@lists.infradead.org; Wed, 10 Nov 2021 19:24:41 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 az33-20020a05600c602100b00333472fef04so4757013wmb.5
 for <linux-mediatek@lists.infradead.org>; Wed, 10 Nov 2021 11:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hGC5vbTP7eVhWvQa6obMxUPyW7fE6TkeuAmRY62poPc=;
 b=o8YgN3Yr2RJVNTOVw0QWOGogKTBQMT4+qFJOEYABx2bj6SGGv63pxe/SJ4WVcCC3jn
 S05I4wPHD8+z79WW8vHnLfVOVCRrvtfEbM0/n3C7vWEAhsPrY0b4qbqwJixF8XZ6zP5U
 t9iCkujPvC/hTFn2vw7e85oBE8a126iesSSEPM7b21YMhn2y7EXSS5A7k/Lm4H6EI3VQ
 D9NTMrB8kCHJgzWX/9+4BDtAepVPqgHEJBSpZGf6y6io+5o3D1ucoHi3oeUB8Ko8aXpy
 AMIRhMvdNEHXMpDoABTqi5nFy1ORDwR4ZjebDc2S0fEpdHIvzVLWIaQEBZb8sdP2GT1u
 eSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hGC5vbTP7eVhWvQa6obMxUPyW7fE6TkeuAmRY62poPc=;
 b=5DUBm7jmvcGcyrqVTfhuojUlhUcf8gig2DEhNanT9lLeZrk8VU51oKybmIPBCq0u04
 mjejPPG4J/k9ZboUVIp8N73E1n8ZMBDVLoO9XVD+3EOMyvofKwIZVeyB0Vpj+59XNtL+
 7IBOnslNiYPjA0FZofsuXNK/d4iyvwoO3kH1xguyKRcBzYAYe3OrCZzw6WS0p0+dOKJ3
 yD/YsTzB/vdAFmLtoBQhFAKMTiJ/6SewKNuTS4nP8mXWVh5xAOeKsXFYn6WU/D2CVKOM
 YlBfB/Y6Jh4u7JFc1YkDF06cMYsY1sqTks2dxBzy3TklinXffhiZ6A8Q8AM6t+hquCag
 coXw==
X-Gm-Message-State: AOAM532d9AfL8Eb+Cz+uBRXT7z0cCQQxuP4z9fk7hK+fOayl00oRQ05K
 7vH80LdEy2skCyZuxv9a8Or99KX54LwN4w==
X-Google-Smtp-Source: ABdhPJwaqqXQvPtpGCJMftdZKiPsBPV2gDWdi4b770EA4FIRU+mVpBnIMR/wI0wlnRlRhRDKVUbAUw==
X-Received: by 2002:a1c:3546:: with SMTP id c67mr1721206wma.43.1636572277143; 
 Wed, 10 Nov 2021 11:24:37 -0800 (PST)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id d16sm6250113wmb.37.2021.11.10.11.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 11:24:36 -0800 (PST)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: mediatek: mt8183-pumpkin: add USB host support
Date: Wed, 10 Nov 2021 20:24:17 +0100
Message-Id: <20211110192417.4177741-3-fparent@baylibre.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211110192417.4177741-1-fparent@baylibre.com>
References: <20211110192417.4177741-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_112440_698220_8FB59513 
X-CRM114-Status: UNSURE (   9.92  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The MT8183 Pumpkin board provides USB host support through 2 type-A
ports. In addition the board provides Ethernet support
with the LAN9512 IP connected on the USB bus.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 .../boot/dts/mediatek/mt8183-pumpkin.dts      | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
index d5a6628e9c5b..541b382c0e81 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
@@ -434,6 +434,18 @@ pins_gpio {
 				 <PINMUX_GPIO28__FUNC_GPIO28>;
 		};
 	};
+
+	usb_pins: usb-pins {
+		pins_usb {
+			pinmux = <PINMUX_GPIO42__FUNC_GPIO42>;
+			output-low;
+		};
+
+		pins_hub_rst {
+			pinmux = <PINMUX_GPIO9__FUNC_GPIO9>;
+			output-low;
+		};
+	};
 };
 
 &mfg {
@@ -496,3 +508,17 @@ dpi_out: endpoint {
 		};
 	};
 };
+
+&ssusb {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb_pins>;
+	maximum-speed = "high-speed";
+	dr_mode = "host";
+	vusb33-supply = <&mt6358_vusb_reg>;
+	status = "okay";
+};
+
+&usb_host {
+	vusb33-supply = <&mt6358_vusb_reg>;
+	status = "okay";
+};
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
