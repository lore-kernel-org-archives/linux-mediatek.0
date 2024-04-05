Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F530C67861
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Apr 2024 10:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=orLmA0U6SWD24u4F3d7lalRjfUDqxy5pYRcNZDhWsg0=; b=gWn5aFMJjRHMorYZvH74K0Y/Yp
	qgmRAHVkJgvakoTVVv6aPgEQsH4Qmtmsc7sHoGN/22IyJWfcWXDa0rE91yZoAHaIf7VUOxeLKoDbq
	rw+icFPipvJSkz13kHo3oO8aG7r7/Vjx6iVV3EdEJ/Hk8dPGubtmEXgqD8hID3xe9aQYlSJVWDFZH
	Crc8yIQDd/Fj3QVloRPKeDGwAMgQFTHo+puAwoSgFMgAAluh1XzwTgGxovGNlIcApEv8cs9orn5+6
	9k06Kejskd0wAhZkd92IJSLC6/w9Ldvgs4wZkjn+xOj+Kiw2pHUo/8oxnRX4E+8ecjxHxAbWrOldh
	FC/HvHhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rshA1-00000006VvC-01GP;
	Fri, 05 Apr 2024 10:51:05 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsh9x-00000006Vsl-3hyW;
	Fri, 05 Apr 2024 10:51:03 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-516d15d72c3so1688296e87.1;
        Fri, 05 Apr 2024 03:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712314259; x=1712919059; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=orLmA0U6SWD24u4F3d7lalRjfUDqxy5pYRcNZDhWsg0=;
        b=napl04ifhWlQN+lp9gvi2WFoWQGSrM5hsvFVFuPWRHD0ioY25W9lxjWnGnILNs/rLS
         4YFBxhEGqHub1yCtyiKkT6VcezZu96NHBZqkZk2pdeQQXzkrDss17Sd9U2fbhPqDjoml
         PTie8CzQfanmGJOZqR5uUIcXhtXHN6H/obM39n/Z8zHSzsYtm4zybWXrJblzOph+YaaM
         MnvJ8Ogifh8SHY1gl1Zp2CC1o51xAfO5USSE43arkJiAvOTBTljof6Ti5HwksScLJNJI
         1JYa2JDYm7mtVUxo+bxW+5hIrYxdBjH87ABZ8iXFN6Je93mx4/DokOBo3KLA+/rsSoBC
         hfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712314259; x=1712919059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=orLmA0U6SWD24u4F3d7lalRjfUDqxy5pYRcNZDhWsg0=;
        b=jiV6UsySSSdtqOPFWX0Y2lIUEnK0SIIhn3YiMBqe1iP1C7I5tm0dk6eMiPkrsNusD8
         e+gvTVeOLb11iDuLE7t7RFOuAKiyBhoPULxVUqqdh4Sh/pU2crB1Tnh8AFbO4wWLS63f
         KGpWLK1rQ4lFJCgc3IRUb7THpiv8y+g2yBzU/EwcZb+7lMwgcTWU3hgXvPGq88AMm1aG
         vQWH3lwD+nHs30p8gu1S+MaTqNXq6/9PnUIuxwz6WPj6Tei9BDOoNyMIV4ASnPsrAvcR
         1gS2hHwsUut+SOc8ApcvXssSCTbFhrJhd4XPWnev/OUSVmVS5TMJH1WDcVPqLlv7HHxl
         jyoA==
X-Forwarded-Encrypted: i=1; AJvYcCUa9KCxzCHGf7KangiXviz0NVg3t77kweHlGaA5kNuFGgp9y+XKiyN1rHlyMu87oD2DhE0DUl2ctybv+ewigoPZut09RjyftYgP1EM+VkfwFvfqmUU/3OCPH/41v6UAk37vC1rec+vylPbm5xj37dKNHCkpsKunGHo=
X-Gm-Message-State: AOJu0Yze/QtU+2H7kvoklnXmIs+3ZD+/0YVRjjodVMBv49q0+QoTYuaV
	Zw0hFcvvs5IaM6tNmEOjMz9BAXJjJ70obKv68lSnvj0rHdjeTHi9
X-Google-Smtp-Source: AGHT+IEX9qU7KVnW4TWbq3+NQWhG74pUo1ZDPBlJGnMZj77sXTLBLTRbcrw+V72NthRK3niJb3wyiQ==
X-Received: by 2002:a19:6915:0:b0:516:cc2c:6330 with SMTP id e21-20020a196915000000b00516cc2c6330mr729212lfc.6.1712314258526;
        Fri, 05 Apr 2024 03:50:58 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id bj1-20020a170906b04100b00a449026672esm697163ejb.81.2024.04.05.03.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 03:50:58 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] arm64: dts: mediatek: mt7981: fix code alignment for PWM clocks
Date: Fri,  5 Apr 2024 12:50:30 +0200
Message-Id: <20240405105030.24559-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_035101_972290_7E41AA43 
X-CRM114-Status: GOOD (  11.25  )
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

Align "clocks" array entries to start at the same column.

Fixes: cf29427573cc ("arm64: dts: mediatek: Add initial MT7981B and Xiaomi AX3000T")
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
index 5674ac81d1f8..8a6263cc569c 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -86,10 +86,10 @@ pwm@10048000 {
 			compatible = "mediatek,mt7981-pwm";
 			reg = <0 0x10048000 0 0x1000>;
 			clocks = <&infracfg CLK_INFRA_PWM_STA>,
-				<&infracfg CLK_INFRA_PWM_HCK>,
-				<&infracfg CLK_INFRA_PWM1_CK>,
-				<&infracfg CLK_INFRA_PWM2_CK>,
-				<&infracfg CLK_INFRA_PWM3_CK>;
+				 <&infracfg CLK_INFRA_PWM_HCK>,
+				 <&infracfg CLK_INFRA_PWM1_CK>,
+				 <&infracfg CLK_INFRA_PWM2_CK>,
+				 <&infracfg CLK_INFRA_PWM3_CK>;
 			clock-names = "top", "main", "pwm1", "pwm2", "pwm3";
 			#pwm-cells = <2>;
 		};
-- 
2.35.3


