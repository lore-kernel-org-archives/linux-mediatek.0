Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F8BAC43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 08:43:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE58E2078E
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 08:43:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MonGIddv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ddx81Q20"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE58E2078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X5UZkuONZ+4itLWs9gvod+tPpKnbtpx0ZepXnpu6q4E=; b=MonGIddv83RRXAlLlCoggKjYLS
	CH6C1zTuB0XsPIpHw0cVEiDhnafzT/+dsmYidk/JUuS6dpOvDLv3PcdbrnDYfQJb/VAwff6kjxroW
	P4W4/A6Jtp/NpSCCvTB4An8uRcr1g+T417bA0ct0IJsHjeL6JjaE2HpPp6SgK+VyQ1aYLan1FgEkU
	0HMaqqR7JRbe+CNFLnCrpjqtk6ssmMlIX9CvBGD/zTdtzaYD+dTMx3K4S3wtSSMqDlATyWVOH74S0
	iIN0iqWnTyqw5cp2Sy1RgtgMl9zxrbOl95k/1pb1Zg6Vd+l7xkvT2fj44z7sfVCRvjSXWU24Gb5sQ
	sdkP8gqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGIAp-0000MC-Ow; Thu, 10 Sep 2020 08:43:20 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGIAk-0000Jd-FO
 for linux-mediatek@lists.infradead.org; Thu, 10 Sep 2020 08:43:15 +0000
Received: by mail-pl1-x644.google.com with SMTP id d16so564517pll.13
 for <linux-mediatek@lists.infradead.org>; Thu, 10 Sep 2020 01:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L/4Xswe1tVbEt+VyZpLZ8Ecncq7V2PHXxgjqAkpGaWM=;
 b=Ddx81Q2028XCjXda3WQUN/JfV+7gvnOmVq07tcxMEZuH5m2W9lTVzg1qfm/tui6/y8
 opDmSPbFMVgouFm7GUdLzZkvTwLlTiPQkxPk9Tr028N9kfVY3Tsz27OL8ndIU1KXI2ZX
 jqOQ8Bk4v6H040D3ts9qOQN/+ihrMvStIPOwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L/4Xswe1tVbEt+VyZpLZ8Ecncq7V2PHXxgjqAkpGaWM=;
 b=da02dG6wnxbd7eTu6vi+nzMQZXXMXHOJ2h1Hl/LU5EZ89nz0CDj9JWOCQZMWCHJWqJ
 EPCkswski5gwSh9+W4MiZiXA6Zo/1/sEDcGtsbsX3xnJZ1vBF7wJCAPlv4/TrrDBZ9Px
 xeoE5q1wpKAZcvDwecYqlXHhvgpe6Rg7LjRSfFgTgHgHqa7cDsx/Q8m3BhdvdSgj3q2/
 0X6XRLvhGDF/dfeubyqoSjPH7hY5NBPQzcWg4f56+lSJvtXOxM0qL/yU+gD3BlM1W+MZ
 BCKdXK82cTB9oi8HV6CCjp6WRo3UmXqq4WbFId2X6JNAPoQ1R/Zd8SQrS5qxuN70oqEb
 gQkw==
X-Gm-Message-State: AOAM530GdCFpFqAws9EniWS8aM1PSbu8pdtovrsZwgffOUNfF8eNfqgd
 AiOVSuD3XTdI25oxm17wOe7PR89PUQsNJckJ
X-Google-Smtp-Source: ABdhPJyEjD3DEgOoB0pkV8GVysZA4xYfdxxHJRksSsko7ICb4IzBqS75bczDOL25rNltJZ8HZ8ggmw==
X-Received: by 2002:a17:902:aa4b:b029:d0:cbe1:e739 with SMTP id
 c11-20020a170902aa4bb02900d0cbe1e739mr4891936plr.20.1599727392093; 
 Thu, 10 Sep 2020 01:43:12 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:1a60:24ff:fe89:3e93])
 by smtp.gmail.com with ESMTPSA id x29sm4357645pga.23.2020.09.10.01.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 01:43:11 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/2] arm64: dts: mt8173: Set uart to mmio32 iotype
Date: Thu, 10 Sep 2020 16:43:03 +0800
Message-Id: <20200910084304.3429494-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_044314_541065_E514FB1C 
X-CRM114-Status: GOOD (  10.48  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Set uart iotype to mmio32 to make earlycon work with stdout-path.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 5e046f9d48ce9..ca6ea71f5f435 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -613,6 +613,8 @@ uart0: serial@11002000 {
 			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&pericfg CLK_PERI_UART0_SEL>, <&pericfg CLK_PERI_UART0>;
 			clock-names = "baud", "bus";
+			reg-io-width = <4>;
+			reg-shift = <2>;
 			status = "disabled";
 		};
 
@@ -623,6 +625,8 @@ uart1: serial@11003000 {
 			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&pericfg CLK_PERI_UART1_SEL>, <&pericfg CLK_PERI_UART1>;
 			clock-names = "baud", "bus";
+			reg-io-width = <4>;
+			reg-shift = <2>;
 			status = "disabled";
 		};
 
@@ -633,6 +637,8 @@ uart2: serial@11004000 {
 			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&pericfg CLK_PERI_UART2_SEL>, <&pericfg CLK_PERI_UART2>;
 			clock-names = "baud", "bus";
+			reg-io-width = <4>;
+			reg-shift = <2>;
 			status = "disabled";
 		};
 
@@ -643,6 +649,8 @@ uart3: serial@11005000 {
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&pericfg CLK_PERI_UART3_SEL>, <&pericfg CLK_PERI_UART3>;
 			clock-names = "baud", "bus";
+			reg-io-width = <4>;
+			reg-shift = <2>;
 			status = "disabled";
 		};
 
-- 
2.28.0.526.ge36021eeef-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
