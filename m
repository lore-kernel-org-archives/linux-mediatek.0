Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEA1C77B7A
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 09:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3sm0sOG8kJdGXppUS7SqrEsY1zLRiuVvK2VuTgB8S8=; b=qNz5+mByyJi4HgCwMm4eZV0axW
	f1h+AnA1WSN0yx442OApsVrIJo/91Kvj6GPVw+B7T7FTdcWk1D9KgdFMOdicvFC0nB6CeTBQWhleK
	A3dBwItVSBAcwPSp4XK32uslY+VPa3sdR2vdlMw0IGIUyc8lt96xLyYXCmknNyFccsdEmMIgLKCm5
	ao6MpFDdwpvR1G+6ciNDlG5BkDVZiAOG5hTv/wriEHkMycWkjELCsiBXasQqfVk8bhQl4OwsuCsx0
	U7B4yiN5xwCAgLqVqDKD06iB9WyyB8JEa6PeJVd67uIX4WcAXkLHfyFmLOem/qaVqD2lG/FM81Y0V
	30OVGONw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q27NU-00G9gi-2A;
	Thu, 25 May 2023 09:35:24 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q26Q4-00G0Oi-1A
	for linux-mediatek@lists.infradead.org;
	Thu, 25 May 2023 08:34:01 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f6d7abe9a4so1762185e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 25 May 2023 01:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685003638; x=1687595638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i3sm0sOG8kJdGXppUS7SqrEsY1zLRiuVvK2VuTgB8S8=;
        b=f9lp641QvszKDqXr/dcjmtgWVIP1qzwN/4cqxgf+52rNs179pQqakOD5UTKOL/jxp4
         XMQJ1gzdl26G5hDIYeRorsYEMjaWvkJxMSq0COnCscqEBGyeAf4Kf67jWEnbycQIwAUs
         vUm1K/R8zdaPCXq3X7L9fq42cOyr1Un6nJGGd5hYJEH1AJRvBAowKuVYeV7n7VwKs+h6
         xrw7tfUYoIR3Ffv1IpX2vlXR8B38+aETXdc07zJdOW4pXFVyPLwOQY2kkz4RZG2btOik
         zkXKPlsVXlJ6/cqH+a6UltGsqsYcJazQRLAVX/dNNl3sFUd2S1rndeEtyqWcf9gxHRDn
         pVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685003638; x=1687595638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i3sm0sOG8kJdGXppUS7SqrEsY1zLRiuVvK2VuTgB8S8=;
        b=CMl/e6Obf8STYLjMtK+GS+lq5vyn5Cgm2y/RQjH8GQUG92nvcJkAXhRrOLohDRuxyU
         Rxz5morNJQBHQTflXZ1yHnWcHCkleMU8mJR5cZLzvap8i0ZtVVSvUAMsI1UDnS/M/Ke+
         l2RWni/8o6ydziTHgVF5NNsc0epCrdj8MuV+RZfUO9Re4/YYwqOjNEFldQnAt2v0DC+l
         lz/MdOu2IrDbNZUI8B4t5DEy1QXREJrYdfjRhE78Z3rnK9rh1aO1SaXb9sj8S623Fyrc
         TdrKnqkWN4zslk0ZtsC9QO7QnY+uSwSVlkWcJRmPZLhbh37c0wCFf/QKSmSsJ26MojaW
         zSyA==
X-Gm-Message-State: AC+VfDwsux8cDPAMmoh8HuoOxuSPsrL2RLaSe2xMY8DR/SRH/Jr+Rdex
	8rO60kx66hRChw9CzwmEFcU7Tg==
X-Google-Smtp-Source: ACHHUZ597gM54jthlc4sodF7mY2YbjsqEtuPE+bwsgwgwmqT/Slvsp1X86sm8eZnXaLtqXFTQOJVZw==
X-Received: by 2002:a7b:ca55:0:b0:3f6:da2:bc83 with SMTP id m21-20020a7bca55000000b003f60da2bc83mr1554877wml.33.1685003638126;
        Thu, 25 May 2023 01:33:58 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id o3-20020a5d6843000000b003095a329e90sm945809wrw.97.2023.05.25.01.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 01:33:57 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 25 May 2023 10:33:13 +0200
Subject: [PATCH v8 04/10] arm64: dts: mediatek: add mt6357 PMIC support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v8-4-7019f3fd0adf@baylibre.com>
References: <20230203-evk-board-support-v8-0-7019f3fd0adf@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v8-0-7019f3fd0adf@baylibre.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1093; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=QwAiDhJXueyKUnGYKSko4cktLia5bmqONipL6za+jZs=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkbx1vx8LNUWxBp0aHwE8AGYzpFTDng4XFcXnuQvIx
 pRDExReJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZG8dbwAKCRArRkmdfjHURXJ9EA
 CbfA/Oqko58S6ZJVJTy07eTvvFu27rFBrH4SOrdYvo15F7T5vCrqugjfIPtyY0cPoIIgM6Iz025zNL
 jGU7TdcqpZ4Msr2p7dtId1QDkUNcAoE11ibsjNPAbo7GLZwPG4DarPUVUpqslnESspuiiXJmf5eEFK
 7bOH6ESvSft9rthWT3A70NiAgzm2giDLpjpQhV2o/Dbh0CAsYOILetQZGuj3vPcQ/6gdgeP23ESnNm
 HLT+uOzdevQb/4jUi2x/JzxTUd589twxFHVrrScdR4SSqsw4osO5OszzrnkU5FOOFufboym4eiVCET
 90ohS+5idlDTHS0Ddqwe/pD+JL/cBp+PbJgr++vWM9mXNKj9Ov2hAy3nUQewxyvUKxgxARwpZWTIZL
 smUHCPAQ3E66TdFv9F1XVipuGJXJ0sBN+tn4bnlzrN0sbpu0uDAct5UNiLoo9kZuerYq23lNl7VIj4
 UTfNLd1mOxGLg0/i6Tvps1RtX9oYn2eulB0n0KmCFNdNLn8TXEAwf0gHrrcKvcmquK+LTAgfHPxwJk
 9SYon7fPwu1HNGJ5QdjoJ55dTdQYhIVo06GbHY6V5Nww8HyXO53gQpJWUNCMgvCmmW6PdpU6IE0DBF
 N+s1eUtCKEvLKcfvVAivRjVX63pchnAmFgQbt+SKOutE5d7Y3OqcQaakvM3A==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_013400_400435_00EEB3FC 
X-CRM114-Status: UNSURE (   9.61  )
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

This power management system chip integration helps to manage regulators
and keys.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index ceb48eb1a6e6..6074aa9c1c3e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -12,6 +12,7 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/mt8365-pinfunc.h>
 #include "mt8365.dtsi"
+#include "mt6357.dtsi"
 
 / {
 	model = "MediaTek MT8365 Open Platform EVK";
@@ -94,6 +95,12 @@ &i2c0 {
 	status = "okay";
 };
 
+&mt6357_pmic {
+	interrupts-extended = <&pio 145 IRQ_TYPE_LEVEL_HIGH>;
+	interrupt-controller;
+	#interrupt-cells = <2>;
+};
+
 &pio {
 	gpio_keys: gpio-keys-pins {
 		pins {

-- 
2.25.1


