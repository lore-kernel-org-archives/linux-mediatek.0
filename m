Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9A9109318F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 08:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=myGmC4KfVEEyrFlKjuV9yVJRZVZMuANRDdrcusd4yYw=; b=UvPYNZ2tk7b4avehNWFr1LDA3j
	taxfXIMovq1wSiXovqfg+ZeipA+ZHJhYxyCzxsJM9VoTTIc+sAeA3ZXe5Z2zFJgwPidj3RSO6/1tB
	G2DCyRsR42cvn6rVBtzxfvv4a75dUyS5UeU/dqjYOE2e7YcgBzzvWGru3HZL8bSb3NB+Frpwa5IsC
	2r54E0y5NS/Xpq+4c5eJ0nFQirzSHqBI0CHlQ9I0vTdLUMCvUb766hOPOHAgdKHMGwFH5ZB9EklgM
	Nu/dkSo/a0gWJPvc95c83EKSFiDj2Z/Tb/lus4lDCFdgowDh7JpYMx5gvxl43ft0BCC11aTzWQWT9
	JCyiKhVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VT4-0000000CO2K-3tUo;
	Fri, 20 Mar 2026 08:44:30 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSs-0000000CNob-1RVO
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 08:44:19 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2b04d051664so13836215ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Mar 2026 01:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773996258; x=1774601058; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=myGmC4KfVEEyrFlKjuV9yVJRZVZMuANRDdrcusd4yYw=;
        b=gOk9F0BJ5KOiXjpvKdcLcYErdOL1//CwX/Sln1EEIJBXLTM4c+/KY4Ez8/BP6NtK8L
         igzPWXpEVy0c41/uDGEooCFa60/mtU77jdm1zrSZkP0xwsOcx6TpBuqX9S9d3Zx1MyuO
         bcCoBAZ4debZHwXqyd07TvhW48ix9JHHdRyIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773996258; x=1774601058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=myGmC4KfVEEyrFlKjuV9yVJRZVZMuANRDdrcusd4yYw=;
        b=WmkGKVg+Gl3ZCjUsnluGdxsafMFB+AehRdH0FReVf4cmt5sRJaP1OUGzV6jGNOgP33
         to1NcKSftKbAVaJMh7b+keHIh7j7EPvdAfuA0J95zhBrvjgppmrmaiLLN33hD0ffdgaY
         NmZ/E1PcOzyl81apej9nqdoXEWC+DD1d8XnB3reCXQwpT6c5NXdEgaoYlvv8GHyeOA4r
         zt3JWSMtJrEU9QH+NyYqtL0hrU9al5WpEpnSU9qmxua8MHslvBF4u/xLOho6xjWUiStu
         HSCK7iz/NFYGuDQsOYf2JH0nMtq5aHVMs+ph0qPTN6aHQfbel1URdS+iztL5rSaSgNlJ
         tcFw==
X-Forwarded-Encrypted: i=1; AJvYcCVg9Ovcj5iSejQweYu65UUw97bdv2j+uyuwBsn/SluG076opxkSEz6Ahm5SZmBFGih80eP0puUf+9nhH6msjg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJdyOsJE/3nj8xEJR9X4HOjx2+ESHqhBm/j73fKvxKGn9Dx3JB
	Q7pzs08Q00u+MAGpPNBeJNHdOesNJ0jjJFAvSO+3EXB/OhevefvdiVFxFvcQoV/AZB4NjWFHhKh
	CbHM=
X-Gm-Gg: ATEYQzwBBSni6p9ubVzBeIippS0jlYX0Ew28EKtzEUqZLx1VoNix9q5sn3Cifii0sFP
	+AhPcAzubXcaGq4JuyZjvh9IYryJlI4RzR7U9dvoqEPFuz01w7LgvxBdme3ZUoc8ll8Nf6ssGQO
	viHjGKInPFFN6Gu7KtrojWGcbOs0aF8Qk0KSOxHtc0k7IvciP1Tnpd7XSG2MvdMAAUkiitASL4h
	9+7O7b3qfoxk0oMWXxcs0BS/mh8cDH602a/IfmMvr3KDMJ/7rKcf4jpjmY/f8eTnDq3vjU9fpkb
	V0qBiEVTMidkzzQYvCqMi423BQ9fSenuTuu1U1flcBC2xKOdZtipl0GTwBCk2g3e4iXZfIwRWoq
	f/dQkHUN/UM7Q/z+GHDkj8Qdw9IuxDxzew4ibf1c1ILJSjCbWBugJqdGzrZlVAwXdFpEVPE1ioX
	nkTihmYcCg/EsRRD2xl8FU3vhPEGpj8Wa7ik3HvHtcXQoXTPaGA93+tfail5ZNJlWOXbx220jKP
	rBQT790g782kZ9uELY=
X-Received: by 2002:a17:903:3c27:b0:2b0:615a:53d0 with SMTP id d9443c01a7336-2b0827d5f01mr26569135ad.47.1773996257756;
        Fri, 20 Mar 2026 01:44:17 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836a3066sm14917905ad.75.2026.03.20.01.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:44:17 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/13] arm64: dts: mediatek: mt8192-asurada: Fix WiFi regulator description
Date: Fri, 20 Mar 2026 16:43:40 +0800
Message-ID: <20260320084351.2461060-9-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320084351.2461060-1-wenst@chromium.org>
References: <20260320084351.2461060-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_014418_397130_C054EAB8 
X-CRM114-Status: GOOD (  10.95  )
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

The WiFi supply regulator is a current-limiting switch. It does not have
voltage regulation capabilities. The description is also missing a power
input.

Drop the voltage constraints, and add a supply input.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index b71c4c87730b..e2f722d19683 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -167,12 +167,11 @@ pp3300_wlan: regulator-3v3-wlan {
 		regulator-name = "pp3300_wlan";
 		regulator-always-on;
 		regulator-boot-on;
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pp3300_wlan_pins>;
 		enable-active-high;
 		gpio = <&pio 143 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&pp3300_g>;
 	};
 
 	/* system wide switching 4.2V power rail */
-- 
2.53.0.959.g497ff81fa9-goog


