Return-Path: <SRS0=Vpwr=D2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FBC7C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 14:08:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E37F22263
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 14:08:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UzvM6USj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="0lEqMP1O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E37F22263
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IHWty2Joe/QUInmSod55xQ/pAdpJ/YsrCsnqTXfFrJ4=; b=UzvM6USj+w189vWGn6sv0p2l2
	obDiDmcSySROB6SYZo0DXBqEm0AWP0LCqyOEY8neAAowypdXF8RHXqWUZ9Lx3S/9vINP020clEFxA
	bgAg6LM8AKqiGd9yOweOIAXCJK0e1fJivEy4k0YbwQhBpBiyhcpU9dMF3xyyumk3gE0YS77j5htiy
	Sh+rBUI9ogxo4lL9iwB39EwUGex6cwlPxGashsV99n3NGS0dnUJdG0dXiNVnrk1W9cnswyske7+DP
	9P9rLN7/yzuNV/dr1lavS/I9GT678ix57UNcDABfsYes/nLXy4/PO4u+obUvMODDJCqT3EVL8yUKV
	smlAcQnTw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUVpf-0004hS-Am; Mon, 19 Oct 2020 14:08:15 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUVok-0004G0-Lo
 for linux-mediatek@lists.infradead.org; Mon, 19 Oct 2020 14:07:23 +0000
Received: by mail-wm1-x343.google.com with SMTP id d81so10457993wmc.1
 for <linux-mediatek@lists.infradead.org>; Mon, 19 Oct 2020 07:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/BDpR1YjUQuY5B8x3jMFdrl3UVJs1R891gJ2IPtuaQ0=;
 b=0lEqMP1OyKzxt7fV7571VcjYQLxRQ2VNoXPJESQG7F42ZYRvzihHztjGqNMIQ+eYI/
 jH7adWvQ9zLvDy+UAT0b9PwZQceZ+VgC/fEDuiKTKKzFj7lhZP7rCJA2eE1yP3ZZEqfk
 sy2APczlrHlQLe+BovWVdn+dkeC5/RiHaySlG0gvCdDLfnnHYSPuIHd2YETKXxoxvbCH
 Q93gK4uPgY00NcAW0ByjB2+W+y9mxNf2WpwDTHZyrifDi/chi9vWsvNvr6hLxW8CZdTX
 f0gVHbsdSn5SoBil1b0Z1/RYlLu0LpwyzMS6KDDfCCTZX8/d4yx24Uj0tDB69iOf+EWu
 ka+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/BDpR1YjUQuY5B8x3jMFdrl3UVJs1R891gJ2IPtuaQ0=;
 b=kOGm7UdgQM+mUQXmXaXsk/ZQGDrubk4GA5uWeoXoyZlyOekbH9khWcdOLVcnuSev+W
 NLMGLlcRVEPymztT8mtfXA9rmYCL7B/sBkXUQlN0a7lywnDDHB5Zoqs9EQxkblVRtGKj
 LEdR5+w1vfD7y9E48K+vynkC5fvzfPDJ2PrMJ+w43Hsk0e2/g964echlvkArIRjMe8PY
 hp0w7VUFkbpX3Q7TVbfzzs2okjSo6CEcg22pDN2LWqgwIG9gLb4wXTo5W+gPU7psAHKp
 5MGaQeGDI7R8dF6y4wHdPXllgqXF9fOJOxsv/NGBsfhwHrcKTB9CI8ILuYqMsMTjbSgw
 YwVg==
X-Gm-Message-State: AOAM533z3GCw3aJuc19pI/vd+9W8otrh2ulhJkUWEAemabYdkJ9vuI3C
 zxyBSIVcPUvy5jACTvVKa4LsGqt9TmF4zg==
X-Google-Smtp-Source: ABdhPJyOozw+yL0LyWF9Z/iMPXXfzuXa/dhpJm3XAGEMIK3TXLDZAceOfnhXl9WQi/FFmA+HB0P8Mw==
X-Received: by 2002:a7b:c4c3:: with SMTP id g3mr10922769wmk.127.1603116436493; 
 Mon, 19 Oct 2020 07:07:16 -0700 (PDT)
Received: from localhost.localdomain (26.167.185.81.rev.sfr.net.
 [81.185.167.26])
 by smtp.gmail.com with ESMTPSA id a3sm114182wmb.46.2020.10.19.07.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 07:07:15 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pwm@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: mediatek: mt8183: add pwm node
Date: Mon, 19 Oct 2020 16:07:04 +0200
Message-Id: <20201019140705.1518822-5-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201019140705.1518822-1-fparent@baylibre.com>
References: <20201019140705.1518822-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_100719_232774_68377389 
X-CRM114-Status: GOOD (  11.28  )
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
Cc: robh+dt@kernel.org, Fabien Parent <fparent@baylibre.com>,
 thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 matthias.bgg@gmail.com, lee.jones@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MT8183 SoC has 4 PWMs. Add the pwm node in order to support them.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 9a3cf95676e1..290d15dd9490 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -709,6 +709,20 @@ mmc1: mmc@11240000 {
 			status = "disabled";
 		};
 
+		pwm0: pwm@11006000 {
+			compatible = "mediatek,mt8183-pwm";
+			reg = <0 0x11006000 0 0x1000>;
+			#pwm-cells = <2>;
+			clocks = <&infracfg CLK_INFRA_PWM>,
+				 <&infracfg CLK_INFRA_PWM_HCLK>,
+				 <&infracfg CLK_INFRA_PWM1>,
+				 <&infracfg CLK_INFRA_PWM2>,
+				 <&infracfg CLK_INFRA_PWM3>,
+				 <&infracfg CLK_INFRA_PWM4>;
+			clock-names = "top", "main", "pwm1", "pwm2", "pwm3",
+				      "pwm4";
+		};
+
 		efuse: efuse@11f10000 {
 			compatible = "mediatek,mt8183-efuse",
 				     "mediatek,efuse";
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
