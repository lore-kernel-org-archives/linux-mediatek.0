Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA322C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 11:22:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C8FE619E5
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 11:22:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C8FE619E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=civ5PCGM80zYUj7DIjFGU/ubQkkufFP1cDTtA95iP7g=; b=V7ul97drdnarBW
	3iXA0tdhiIaHIn2Jhtzw8sOu5KgMxWMdYTEwZQAlqG44ZW+cZpQOAX5dlJks0aBmkfs+C3MX68/6i
	njXTf2EbfqWkSn6J8i+FcvjY1QrF9KXV44lH14TMKH0EC1TRYlr2EmuL6aiZtyaO+OLdIxNxILly4
	ve8ZObFmEGXJr8GbwTGXnKg1oF1KC//LrSpxnAJow3eFXvzE9db2eWQ23K3LIoqYBL8/riVYDyqu+
	96qVJ/0x3+bkIAW70GqyitunnJ77WqHGDslOyqLSNSYXTk9wC7Ts6VF6AcbUQftEEWGqz7ZwiZARB
	nCuUKRFJvZPyUIuV8flw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8LAF-00Ecad-GW; Tue, 27 Jul 2021 11:22:23 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8LA7-00EcXU-OB
 for linux-mediatek@lists.infradead.org; Tue, 27 Jul 2021 11:22:17 +0000
Received: by mail-pl1-x62c.google.com with SMTP id c16so9808596plh.7
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Jul 2021 04:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7I/jF2S0x4GNrJTMatkqZ5v2AExG75w8sw95n03TZZ0=;
 b=PqCGjDl0ZDJC6BzPx1oirKsbbPKW0TT0QoNZEJ5bgaUHxNW2pP0EjwwbnRgprztDqb
 BEn6zo6NOK4y1DgVh5S9XW+su4WkiyxAGq2tH16BQ26TyZZep208NdTgIfaVkUv+aGo6
 c359te2EWFAgsQ15StoybDeaVCYRnApyYGWh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7I/jF2S0x4GNrJTMatkqZ5v2AExG75w8sw95n03TZZ0=;
 b=hX4WkQ96ci1+J9F57gPPnhR/JmFNWGpKsXg9NSSIrdUZXnjgr69olbAxqJuxkfrfOO
 bqawCU33wxkOiMEtvxVaNCUHzUFS0isr7FKFCjiHHPGeI7kRvvvnjAJlKg63/YiuUtRF
 kVFYVp/zkiyn488s4X39aBdml9ZfwXrs6NkNAyc8XVPD1+PymrnI7+iKJi8NRTFcf9Bh
 PbWIH9njNk4Vf8bpRMPTmbn4lySKwBm6WxG4l1K+yTgxEkNGYrxLtWqaTjEM36wW//HY
 T7eSHuNu1/nJR0O/LZY3l5nwPouCzooKY7aXhedZJ7dDcWbzWyJqJxbf02cFtQOdoOJs
 F63w==
X-Gm-Message-State: AOAM530H5eFiJiJfoTE2PJyr2F+lE38ipXLKYhjnLegb9WQ/UrHMD11u
 y6u3gq9bFHJ/fNbw/KmI/la5Pg==
X-Google-Smtp-Source: ABdhPJxO2igEEqSKLOzbj7utbR/KZmD++/50YFoHbGgBIVgwGez26YNeYy09LVDcdVm7+GbWPGivmA==
X-Received: by 2002:a63:f515:: with SMTP id w21mr22984558pgh.343.1627384935268; 
 Tue, 27 Jul 2021 04:22:15 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5176:76cc:2193:9b8f])
 by smtp.gmail.com with ESMTPSA id 20sm3506467pfh.15.2021.07.27.04.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 04:22:14 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>, eizan@chromium.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: mt8173: elm: Use aliases to mmc nodes
Date: Tue, 27 Jul 2021 19:22:08 +0800
Message-Id: <20210727112208.2508675-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
In-Reply-To: <20210727112208.2508675-1-hsinyi@chromium.org>
References: <20210727112208.2508675-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_042215_869998_4C063B7D 
X-CRM114-Status: GOOD (  12.25  )
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

fa2d0aa96941 ("mmc: core: Allow setting slot index via device tree alias")
allows the use of aliases to number SD/MMC slots. This patch use aliases
to mmc nodes so the partition name for eMMC and SD card will be consistent
across boots.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
v2->v3: add more commit message.
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 21452c51a20a8..d5a2cad39c9c7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -10,6 +10,12 @@
 #include "mt8173.dtsi"
 
 / {
+	aliases {
+		mmc0 = &mmc0;
+		mmc1 = &mmc1;
+		mmc2 = &mmc3;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x80000000>;
-- 
2.32.0.432.gabb21c7263-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
