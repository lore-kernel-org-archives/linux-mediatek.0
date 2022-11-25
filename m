Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63FFC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Nov 2022 14:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oT9bhK87PoOgc+UQN81Jxh3OJPRzTWLz+k1QQ++u5DM=; b=gFKmlFhadWKbTdRs0+A3Ra4yGS
	XFyQtcj4mxql7TF3ddb0QAWgRRUHEhL2ngsetMiDqy425OUyQJ8gcom3mLHYFK74NgBO1/W44pfbP
	x2/4lSppL7s5MYgy/sKhl0M5FGZMd6zpr1DuQESQ1lTtFTQ1h3u9pCGVg2Kg2nDhAg8gcOwCSuaji
	8oD1em7FnU9VLVboR+Gmsortas8nAE+tEadfnTfHlz/vwMRYtQmU2k7Fb47fqMtEFTkGYWZAKI5y5
	P2fpkuKnyJDJT4bx7CeZcBRB6Z+/+o7sukGUglBDVfGYGImv8HdDTprKaFu+Xl+294cqWc4yElMPh
	FNdgvg3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyZyS-00HAoj-WA; Fri, 25 Nov 2022 14:46:41 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyZtd-00H8UY-6c
	for linux-mediatek@lists.infradead.org; Fri, 25 Nov 2022 14:41:43 +0000
Received: by mail-lf1-x135.google.com with SMTP id j4so7254558lfk.0
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Nov 2022 06:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oT9bhK87PoOgc+UQN81Jxh3OJPRzTWLz+k1QQ++u5DM=;
        b=DGDj3a00luO5QD/2oq3vZVkAXSYF+M3uDqGG/5wG5ZOk4BHFJ/F61KE+o06ObuZ+mO
         9LGoMDia8S/pBPet9RvexMAxvHa3HE+HTxmKPP3wkA6zfJCxTBialemKCYxRTB3jb6la
         WgoxJdLwDgeX6Vp3gaJfqZXEIdGuaYnJch61IoPMzE+785dtXi285w9SWfFFYyaywXtj
         DUEW38nVprTLsSeaaHVMJDHF6jsSiQ8hBYRaVa+PqlmGA4V4SGQn9wX4JMMZYVf18oP5
         iZq1MHuBlNtrRWL1HNh0Gz/Q5+yvoggPqOE2U79e+4egkJiuAzEuw3MIl7lq8OdBNhmE
         R1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oT9bhK87PoOgc+UQN81Jxh3OJPRzTWLz+k1QQ++u5DM=;
        b=4RzXaMOYkdZkDd/DHHnAM1NJmhQBWgSnCkX7vnJ/dLG9mbF/CiXFNywe+7oRagZjTZ
         1x69HCF13HbOP6ECcH29LG28mJ/z607p+14taOwt/3D8QEGobARfmHyWOjO4kbH9o27X
         C6WMv1pMURbxlz7MeGnSuwslr+IX2BkrdJ4JCunICCuhhO+Av/us3rtMK6ZHEDoNLgOa
         TxdTLf9pHWSwChlhxdR2bVsiCc73hPrgrijwgOo5CXBTllGssJHoukug2R/TblG0Oc8l
         vqaraK+4GbICMyy5ipp+kuGp+MqU+VwWbM8/KdXH+UJRaboi8By+zheJdOy2xVNGxl+j
         aIsA==
X-Gm-Message-State: ANoB5plZIwiVbEfd6AQRpIcUUfIq1RrAQ84lMSG/b3gHSFW8cMYb/JEu
	PiDVT56jHRMgQYDRsPxPU/xXEw==
X-Google-Smtp-Source: AA0mqf78JuJ3NaKsrAsCue8KFCzbl6OQek5fgSU+nZXWnFtNz5bZklzf7SZcA3XKLYSMmFMkma21Fw==
X-Received: by 2002:a05:6512:238d:b0:4ad:5f5c:2b31 with SMTP id c13-20020a056512238d00b004ad5f5c2b31mr12320259lfv.422.1669387299753;
        Fri, 25 Nov 2022 06:41:39 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id x13-20020a056512078d00b004aac3944314sm549069lfr.249.2022.11.25.06.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 06:41:39 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: mediatek: align LED node names with dtschema
Date: Fri, 25 Nov 2022 15:41:38 +0100
Message-Id: <20221125144138.477198-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_064141_372281_36621864 
X-CRM114-Status: GOOD (  10.64  )
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

The node names should be generic and DT schema expects certain pattern:

  mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
index dec11a4eb59e..77b96ddf648e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
@@ -13,7 +13,7 @@ / {
 
 	pwmleds {
 		compatible = "pwm-leds";
-		keyboard_backlight: keyboard-backlight {
+		keyboard_backlight: led-0 {
 			label = "cros_ec::kbd_backlight";
 			pwms = <&cros_ec_pwm 0>;
 			max-brightness = <1023>;
-- 
2.34.1


