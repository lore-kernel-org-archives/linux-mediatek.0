Return-Path: <SRS0=PUi9=JC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91979C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Apr 2021 20:09:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22A8D613BE
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Apr 2021 20:09:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22A8D613BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4Wt3QECM9e2gCT/eSIcOaKSfo1LPCu7vuONwtLO7TN4=; b=YUuLcS5sL4g61RTYMiNr033JS
	PoR33qTPzdj6eQO0QtsnecWmIIhbGImwFJE5LjIkxuGW37JvHRA1QFHXlr+md4Hp4jWYZ13pYu561
	PTqQ8DxE8PWCKRBKEx5gWHnFBM+WsMrK9SlckppeqWAkWkzdjTdCQ2ZOjzqrR6cFusmgFXIbs5eSr
	1F2thISWl5jh7Tc7UvSxG3fAkc3KIpwizC6EglaLtA5w84Y4vR4/w1h6oTHsWRQHxrnBQCBX81+tv
	Kn2Y6w3D2YpRGRTp7X2Kww4yQl44CecRtSwQoFjP5i9iVYJ9rkw3pUkhn/TOoF69TWGA9qeFoTMNy
	I0t0MD+6Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTVWm-000YAY-4a; Mon, 05 Apr 2021 20:08:52 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTVWO-000Y1a-O1
 for linux-mediatek@lists.infradead.org; Mon, 05 Apr 2021 20:08:31 +0000
Received: by mail-wr1-x432.google.com with SMTP id x16so11879667wrn.4
 for <linux-mediatek@lists.infradead.org>; Mon, 05 Apr 2021 13:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HQjvCSuY3St5Kr8py6j3qL+C5LXPpboAqFQK0TU9PiQ=;
 b=R7cCRBNeaQvmb8IkPfmisOjsWT68xXtTAVsRDbMFzIPnHyCl7/8lSiczp8zLPlDeK0
 CIeI89vK102N877hxMU+u4wUJijhVgQe3HttbpYWFJ/KLVAgZ0S9G+9tM1FrfgQ0kiFW
 Iwe22p0tPxNbDLqmhGb/wNakVN19eYos40x1w/0EddzaYE4dYsUh4579T02OyXYKtG0x
 9pHuFwSCisK9v0DOrOgbu5yPnHcx/xVPYnKBDhiePi+K27OXDVfBI3UEcIp0T1e7GLRq
 T7PE82WeGcQBPraAtYLgAHZ/1IyjirvkhpKgkjtwg7CXGkxncS26b/oSNvjBSdFjv7ZD
 2sPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HQjvCSuY3St5Kr8py6j3qL+C5LXPpboAqFQK0TU9PiQ=;
 b=MBVcdcA8NOJETqk6Hngn8mEWN08/UfPKvzYzQuq7eYvKQ0ecW8tRR3Wq7oAyEyila8
 RXNHvI9auuGxqeO75S9vqmrpqykgvwFOoFc8TCID1i8MOspcQpJgUYJdFQkCqv32VySQ
 pEKEIO8stV1mX5fABtKoFt3mhmnjQtR+QlIfQiOGXrqMaC66VXoM1UsrDLRWwHbtOa5H
 UDJX4TKZJ8XFQ86ZQcWJNHOBq37UGPOYTjJTkQODMqjgmvnWGEOnDsdh+Z/2Eqic4x1F
 exZQ24hxTRwcz067FPEoOSDCU9x+bgtiVD0NkrZpNH/j7RJTl/q5cpnnBTwaYOfOvRRd
 bRRA==
X-Gm-Message-State: AOAM530rPxbTVsGgorqrnMsOr+aTr1HJEahM/+OB2u72GxrZvhoDTw6I
 3VUF3yIKmAu8Jz40DbgsCi/7mA==
X-Google-Smtp-Source: ABdhPJy4L/8IJtSpiQaFFtJCSbkReJXmhnkJ9qqX03CzIEk1YXCwDpR2G3qSjmqZ7jIVRDVVmzGlxA==
X-Received: by 2002:adf:ee0f:: with SMTP id y15mr6563507wrn.43.1617653307855; 
 Mon, 05 Apr 2021 13:08:27 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id v185sm609420wmb.25.2021.04.05.13.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 13:08:27 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] arm64: dts: mediatek: mt8167: add larb nodes
Date: Mon,  5 Apr 2021 22:08:19 +0200
Message-Id: <20210405200821.2203458-3-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210405200821.2203458-1-fparent@baylibre.com>
References: <20210405200821.2203458-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_210828_870715_EE1BA870 
X-CRM114-Status: UNSURE (   9.95  )
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

Add larb nodes for MT8167:
* larb0 is used for display (dsi and hdmi)
* larb1 is used for camera (csi)
* larb2 is used for the video hardware decoder

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index 4b951f81db9e..9b352031c5f6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -140,5 +140,38 @@ smi_common: smi@14017000 {
 			clock-names = "apb", "smi";
 			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
 		};
+
+		larb0: larb@14016000 {
+			compatible = "mediatek,mt8167-smi-larb";
+			reg = <0 0x14016000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			mediatek,larbid = <0>;
+			clocks = <&mmsys CLK_MM_SMI_LARB0>,
+				 <&mmsys CLK_MM_SMI_LARB0>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+		};
+
+		larb1: larb@15001000 {
+			compatible = "mediatek,mt8167-smi-larb";
+			reg = <0 0x15001000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			mediatek,larbid = <1>;
+			clocks = <&imgsys CLK_IMG_LARB1_SMI>,
+				 <&imgsys CLK_IMG_LARB1_SMI>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8167_POWER_DOMAIN_ISP>;
+		};
+
+		larb2: larb@16010000 {
+			compatible = "mediatek,mt8167-smi-larb";
+			reg = <0 0x16010000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			mediatek,larbid = <2>;
+			clocks = <&vdecsys CLK_VDEC_CKEN>,
+				 <&vdecsys CLK_VDEC_LARB1_CKEN>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8167_POWER_DOMAIN_VDEC>;
+		};
 	};
 };
-- 
2.31.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
