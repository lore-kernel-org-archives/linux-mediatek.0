Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE0EDECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 15:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FHS4xwDjkiA0w7wmXV8oTrtUiAVe60d4UjcHzqznohk=; b=qd0Yk9ib23dLmtAICDEqY/bxpb
	3WAoG5nJtIg3+GKaVCVl0Rl7hrJyHMbcE5q822XMKZfknbIXJNVQ0UaJWBVX/xdl6gy4hv2OAghH1
	9wSCzkPUhN8irm9NAPd8FvSNr7hPzzFPG1cmdhfRmYEofC5ycFDylulzZZrT757ISWhdpx6c5mfND
	VNgIWMxxxHxyfvdp1bQqjkk7Eddhmqx5h0zyGGFtHT759k/NYB8SfKCfVH4BMiEAVvPFs891LtKM+
	8mifyUQBPOurZwIp0G+M2Kw2QpLYSF0YtZxi/U7QRbrs9eFCsyvUeYGNZHeXJM7VqOvv8qP5Y2oP7
	YKpw1HnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooRTA-000aKM-Fm; Fri, 28 Oct 2022 15:40:28 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooROY-000YDB-E1; Fri, 28 Oct 2022 15:35:45 +0000
Received: by mail-ed1-x532.google.com with SMTP id m15so8368322edb.13;
        Fri, 28 Oct 2022 08:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FHS4xwDjkiA0w7wmXV8oTrtUiAVe60d4UjcHzqznohk=;
        b=HQDYgYhhZviJPw6qArUMruXE/Xm5QXCqsZN88IXXu2qjbCBdY9c/xpcrkmfeLkngqU
         CgWrN8CFwdWnbH6go1dsy/ceLDKKkBGOuP2b663anhfdIWoVi01iAL5pPpsnoeLFHhWY
         lAXlJ3BYPRrwJpY5gMJJ27bQl7sOzZcsOKWhiKRp0ahau6wJGo8bU3zJwBbBfmz9s2As
         zU41STVdnizM+vZ5tlCy28kEqNKexwsN59V9snez96tNF/J+wyIKyy2m1RxpmSXhfs1f
         zKlSkQYalk1mxBSmusEVs3PmpQRoyCoNeGlxlVqhIDjH5aPjH1tvovJU87z1hVW86pVq
         v7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FHS4xwDjkiA0w7wmXV8oTrtUiAVe60d4UjcHzqznohk=;
        b=vXkNWRhg1coGY1bDUqoBqGg3q2m58Jqr/z4Yh9kT+3oHP4TurTO2nW95B+qmmxsLNo
         ilOREYQXrZWguEDTM16wU8OgyOvuGLxe2FyKVj/bLt1SpIcKv/sGaTFkSe8yRLxsld8l
         ejv/ao/526ahABfLc66Frc5zsFbE2h8912jxtiATakVJVKXswHLSP55nYr+LZHMyQ1Na
         rLL2lvJA2GnS0aTMg6ehe83pyw8yFwWwg9PhQUOHqxoctRxT51mSaDxICGi8Yt+XAUyl
         dkSJeZD8wN1xQgUJJuYsp+hAkN8j/mVdfvx4stAauzpG/XLOhjl51PJ6OqFn+DzXHj/P
         3GHA==
X-Gm-Message-State: ACrzQf0a3wC7pZNvJlanTr0BYBhrf8joRRbbxCjz+w9Vpd+AmddnHE9W
	OUa1XQs1VZrsQ4O2+zK/gRYjSzfI0hSNmw==
X-Google-Smtp-Source: AMsMyM5/1YEa9PejtBsdYNmSs9vBC+HCwPcIUqWmAUvP0reCGads9tKDUceYNZXuRialiLEzqocRdw==
X-Received: by 2002:aa7:d889:0:b0:460:62ef:2695 with SMTP id u9-20020aa7d889000000b0046062ef2695mr40743753edq.273.1666971341142;
        Fri, 28 Oct 2022 08:35:41 -0700 (PDT)
Received: from localhost.localdomain ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id ds12-20020a0564021ccc00b00461aebb2fe2sm2830635edb.54.2022.10.28.08.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 08:35:40 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Andy Teng <andy.teng@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 10/13] arm64: dts: mediatek: mt6797: Make pin configuration nodes follow DT bindings
Date: Fri, 28 Oct 2022 18:35:02 +0300
Message-Id: <20221028153505.23741-11-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221028153505.23741-1-y.oudjana@protonmail.com>
References: <20221028153505.23741-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_083542_501502_0B1DB426 
X-CRM114-Status: GOOD (  10.81  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Add -pins suffix to pin configuration nodes to follow DT bindings
and pass dtbs_check.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 arch/arm64/boot/dts/mediatek/mt6797.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
index 15616231022a..0c2b477184ae 100644
--- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
@@ -135,70 +135,70 @@ pio: pinctrl@10005000 {
 		gpio-controller;
 		#gpio-cells = <2>;
 
-		uart0_pins_a: uart0 {
+		uart0_pins_a: uart0-pins {
 			pins0 {
 				pinmux = <MT6797_GPIO234__FUNC_UTXD0>,
 					 <MT6797_GPIO235__FUNC_URXD0>;
 			};
 		};
 
-		uart1_pins_a: uart1 {
+		uart1_pins_a: uart1-pins {
 			pins1 {
 				pinmux = <MT6797_GPIO232__FUNC_URXD1>,
 					 <MT6797_GPIO233__FUNC_UTXD1>;
 			};
 		};
 
-		i2c0_pins_a: i2c0 {
+		i2c0_pins_a: i2c0-pins {
 			pins0 {
 				pinmux = <MT6797_GPIO37__FUNC_SCL0_0>,
 					 <MT6797_GPIO38__FUNC_SDA0_0>;
 			};
 		};
 
-		i2c1_pins_a: i2c1 {
+		i2c1_pins_a: i2c1-pins {
 			pins1 {
 				pinmux = <MT6797_GPIO55__FUNC_SCL1_0>,
 					 <MT6797_GPIO56__FUNC_SDA1_0>;
 			};
 		};
 
-		i2c2_pins_a: i2c2 {
+		i2c2_pins_a: i2c2-pins {
 			pins2 {
 				pinmux = <MT6797_GPIO96__FUNC_SCL2_0>,
 					 <MT6797_GPIO95__FUNC_SDA2_0>;
 			};
 		};
 
-		i2c3_pins_a: i2c3 {
+		i2c3_pins_a: i2c3-pins {
 			pins3 {
 				pinmux = <MT6797_GPIO75__FUNC_SDA3_0>,
 					 <MT6797_GPIO74__FUNC_SCL3_0>;
 			};
 		};
 
-		i2c4_pins_a: i2c4 {
+		i2c4_pins_a: i2c4-pins {
 			pins4 {
 				pinmux = <MT6797_GPIO238__FUNC_SDA4_0>,
 					 <MT6797_GPIO239__FUNC_SCL4_0>;
 			};
 		};
 
-		i2c5_pins_a: i2c5 {
+		i2c5_pins_a: i2c5-pins {
 			pins5 {
 				pinmux = <MT6797_GPIO240__FUNC_SDA5_0>,
 					 <MT6797_GPIO241__FUNC_SCL5_0>;
 			};
 		};
 
-		i2c6_pins_a: i2c6 {
+		i2c6_pins_a: i2c6-pins {
 			pins6 {
 				pinmux = <MT6797_GPIO152__FUNC_SDA6_0>,
 					 <MT6797_GPIO151__FUNC_SCL6_0>;
 			};
 		};
 
-		i2c7_pins_a: i2c7 {
+		i2c7_pins_a: i2c7-pins {
 			pins7 {
 				pinmux = <MT6797_GPIO154__FUNC_SDA7_0>,
 					 <MT6797_GPIO153__FUNC_SCL7_0>;
-- 
2.38.1


