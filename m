Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF48C48260
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Feb 2024 16:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+F4oKcixpMDMjtibRGARd2c9eJAlVuiYPpkn0XIejY=; b=OCPgYyLa9TmBp59aE3GzZGVYwM
	uxZ9C3wME/FsE1V6pt/2vN7mgKYs10374vsxrSuZgEBz8Acq+Joepbst3lQ711ZD93B15tGotjCVW
	1kq/VsekyM1O5+Vruby2C6Keszjlw2gJL9cnCNDgejQ4tTZPLghg5nJcWejPws7e9YIMbLKMVM9Q4
	nwbtqV+gTBaEzjtW6zzjvXFJ92xJDLtGCCfvWuWrPwE0XBil+d3Rk0AkhOSp4dbEZx9viZeoKkrW3
	QLK4bAnDO2KzsnSqaZbxtuYHc94TmnPPwBXq+4zTH5OUmQxgR+pAmH1DLGPQyv6QcljuhnBRrdTyq
	D38p8G5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZvw7-0000000A1Tw-07h0;
	Tue, 13 Feb 2024 16:47:11 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZvvx-0000000A1Mi-3Grq;
	Tue, 13 Feb 2024 16:47:03 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-55fe4534e9bso5933882a12.0;
        Tue, 13 Feb 2024 08:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707842820; x=1708447620; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+F4oKcixpMDMjtibRGARd2c9eJAlVuiYPpkn0XIejY=;
        b=ZTO+wsOS6XusBFfS61y6Ue+bj+Jeeif0yIPcDoaIrskt/DtWZhO7+HiPk2eaaInb4V
         BzpV2ZLJNn2DtyLA5mwCWKmhuR00//h3kqA0mdQ6eXJM3aye0dIcAb3bPrWgPruaPjA/
         773hnbjcPAT+eD1WLo8MPGrxd3YdcFKTt6m+M4LMB64/5r8FzTOY3MXVWUyAnuaV9omh
         gQzLxi0cD44QYbvXF0xcTDLcJHeOJCpZ2iMjiy6eUXCJahVmMcVuru6hUZ5mXI4hHqhI
         Xo3P8wVn36w2lk5dj6Rf+lMH8/53yJje8FthCMYfk4aoVs+pAj9cREnjkZkktTAgfVJf
         wN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707842820; x=1708447620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T+F4oKcixpMDMjtibRGARd2c9eJAlVuiYPpkn0XIejY=;
        b=DLJQYHEG2je1Mo4izGBC9J/dFTe5B+INQPHilV42bSCerY8Mb+tmhyPHYN6vHIyYfV
         Np+xIxdaQMH5CaPaSbnJnVt5I5zHxHSZerxvtK7Cg671cjJcpW2RL/qnU10ArvKRvn1x
         fCtqGVY756x09Dmi7R4IM9+w0l0HUO3swfBiRT+V1wsIv3l02By8yxbqDF42bCQxIbgy
         ztH3ZMFQmyKheP/oSmj5JgpXy8t+I/tEPkeOIzyLjTVW0LAS2cYMDI/OPhjkgsmcobOY
         3nLgCnZjgCUd1o/bkb7mE0kLKzRL37Uu5gNmKC4CxiIrKIHUhtjQ4t1C7KPelkRm5I6m
         EqSg==
X-Forwarded-Encrypted: i=1; AJvYcCWpXXyVSKK2f4nJoXtxn0SuJPUDnLWmlLztlVzSeFWFkxhs5lD9ViBVBf1oLSxN7eCgQZ7oR4a+Lr6jNRmfQwY3M11F89G0kGJ95wWgtD7WvTobsXTGu4sn5bU1bZI9KusQG3B1vTj5V/t2qITIRsZSSqtTnBb/bE4=
X-Gm-Message-State: AOJu0YzhLxDqJ2KCbKSDSG9Qfy3bsgBO2OFnLsWL9lra6ZQxVvU/AgEB
	9RTvXAQzNbfclFrtZp2+gBSSorVSkmeP3SnmcuBLcg8KgL/0EBCL
X-Google-Smtp-Source: AGHT+IEeCwyqkHpoeY0sJgs+ZgFzlmCq6/tbYDuHpnER0Oiuvl6HmAKPTXql31UVCs75XR7jLk+zFw==
X-Received: by 2002:aa7:d590:0:b0:55f:d9d1:6de1 with SMTP id r16-20020aa7d590000000b0055fd9d16de1mr169835edq.16.1707842819607;
        Tue, 13 Feb 2024 08:46:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUJ01uweZYgi6dyBpmqVKNY1aQLUGcn9okDSZxLvkc2fCvETs8lVM4QVRx/Z3UztsF9TRQeXuZv/iau8+VVonrwh0Ry0Mn+5XUDbCYIjne4NE/Pej4Qh5E1hwcPPtAMJGpCWAKslgCCvepxqQ06Hx8Gg07VgFvdvx2whcix6fexV8J/r+KnLQYAo6JhhK5/sSxEtCpj8m9DTrcYMfZlrkph73xQOjSKo377khXaBW77sEJwhLlkYHDU0T3M5T+uVtl0sUQKeyQzJt8IhVwCCBIf3qeTzMdGEhd9Lq44n126Mco+rueEbFSuBpU4oAicwyj7dVz/ed2U3kq5x+HRBurmrth8PDMvEhsSQblKFMG4ct8vP2knzwvgwbO5aeMz2AjDS5zJ1x2vezF6F6UHPtE4ic66Btj5guMzAD4gLoVsrO//Z9smQwShv2+xuG7D0mFdQR6dyYJTosntQHSxY4zinuFqQ+HkqSVDgeDL7p7MLKbTm3VGuOUrf9ioWbafHveji9qflnl8zgS5jjke
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id v10-20020a056402184a00b0055f0b3ec5d8sm3863582edy.36.2024.02.13.08.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 08:46:59 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: John Crispin <john@phrozen.org>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 2/2] arm64: dts: mediatek: mt7988: add PWM controller
Date: Tue, 13 Feb 2024 17:46:33 +0100
Message-Id: <20240213164633.25447-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240213164633.25447-1-zajec5@gmail.com>
References: <20240213164633.25447-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_084701_860119_1D1DC42D 
X-CRM114-Status: GOOD (  12.41  )
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

From: Rafał Miłecki <rafal@milecki.pl>

Add binding for on-SoC controller that can control up to 8 PWMs.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index bba97de4fb44..67007626b5cd 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only OR MIT
 
+#include <dt-bindings/clock/mediatek,mt7988-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
 / {
@@ -78,7 +79,7 @@ gic: interrupt-controller@c000000 {
 			#interrupt-cells = <3>;
 		};
 
-		clock-controller@10001000 {
+		infracfg: clock-controller@10001000 {
 			compatible = "mediatek,mt7988-infracfg", "syscon";
 			reg = <0 0x10001000 0 0x1000>;
 			#clock-cells = <1>;
@@ -103,6 +104,24 @@ clock-controller@1001e000 {
 			#clock-cells = <1>;
 		};
 
+		pwm@10048000 {
+			compatible = "mediatek,mt7988-pwm";
+			reg = <0 0x10048000 0 0x1000>;
+			clocks = <&infracfg CLK_INFRA_66M_PWM_BCK>,
+				 <&infracfg CLK_INFRA_66M_PWM_HCK>,
+				 <&infracfg CLK_INFRA_66M_PWM_CK1>,
+				 <&infracfg CLK_INFRA_66M_PWM_CK2>,
+				 <&infracfg CLK_INFRA_66M_PWM_CK3>,
+				 <&infracfg CLK_INFRA_66M_PWM_CK4>,
+				 <&infracfg CLK_INFRA_66M_PWM_CK5>,
+				 <&infracfg CLK_INFRA_66M_PWM_CK6>,
+				 <&infracfg CLK_INFRA_66M_PWM_CK7>,
+				 <&infracfg CLK_INFRA_66M_PWM_CK8>;
+			clock-names = "top", "main", "pwm1", "pwm2", "pwm3", "pwm4", "pwm5", "pwm6",
+				      "pwm7","pwm8";
+			#pwm-cells = <2>;
+		};
+
 		clock-controller@11f40000 {
 			compatible = "mediatek,mt7988-xfi-pll";
 			reg = <0 0x11f40000 0 0x1000>;
-- 
2.35.3


