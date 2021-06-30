Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B94C11F65
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 07:36:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEDCF61D03
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 07:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEDCF61D03
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TK74x92fwVxpAcll6gyAj7dKg383A56qgioEUaO+Efw=; b=VE7h0hlgaWbUkM
	WZJLSER+dbb+Fg1hQZJwPfrSvaJJG1OIHLWco++WxodzJVITyhAO8MATAo2k8Bl02GAm6PGodekwY
	kL+lEFs4d50p2G7y+zIQE2qRx/E06vPKh0B874RRxUyalJp5cegikgD+J+RjXKvNm8ayk/TamXpYJ
	EUsDNYchjyh6rAer8qWoaZ6p1ghGzZmhkRB9zTmpeX8guUktVqk176K45UcCA5cV9cWwjwgeMC9oY
	qzaTObSiS6uhauGBf/HMnSqUo1417iioVtaVybyzma8URGuU8OnqKTyqGmdbdGB+MzEhBw80U/r8P
	LqtafZfRCzUKYY050gKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyUlj-00D71n-El; Wed, 30 Jun 2021 07:36:23 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyUio-00D5Sn-62
 for linux-mediatek@lists.infradead.org; Wed, 30 Jun 2021 07:33:23 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 p17-20020a17090b0111b02901723ab8d11fso782102pjz.1
 for <linux-mediatek@lists.infradead.org>; Wed, 30 Jun 2021 00:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S23gVGVcqD7f0fwhKzKVAxR8rv5+89obRLf4D+hN+hE=;
 b=JsQOWA1IUjLa3FWO6Hy/j9CL5yHybWgR/t+DuEdTAQn6HFyHEKwWKQsJ1fRUF1aKhi
 //wQexGMhTMFys9IslVkV+px4sY/hcxKmFNUZeJZ9kqMh/81cqDuFnMjIt+kqVlyIJR1
 j2QvXnO1mtbDkSdQa9Txfnwc9cjr85VjCwU6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S23gVGVcqD7f0fwhKzKVAxR8rv5+89obRLf4D+hN+hE=;
 b=WtAKJdmF7SCh8U6EVeK7qZ+GVr6OIF4Mw6OWT4PYNFaMBcMSqWNSA3Yye5viIYJVyy
 mB/OBd1pdhqy9aMKxzM4pueMhnocYF63u4YBqeN+sDeNqd0wKgQyRYfc3zl9k1NZbsTQ
 /OAS868nR+yrLI6fQNUOYpoRxYQ1lSJRWG8NiDa+iv2aiqzeHjPy42pgPteAeqlUrDFX
 DsVrBfCN4nu+RMHCWGox1IAt4VxQJNbnjKkgYFa3bmdtcSy15GACUgQQ+r1OWJ0n/1DY
 xZQ27HjurkePN9jjIOD/lbF0aZGLj1ZF4XKNHYVvdztkgcIoKwjtYCFz6fMHcvYP6zXY
 cWBA==
X-Gm-Message-State: AOAM5326GoK+I4w3NYW3komqiODX/KLjyH27LnAS+O2Nl+cxMHqTRSz+
 1EbhTMPHADc9B8L3kWhXOm4+lQ==
X-Google-Smtp-Source: ABdhPJyMt1I0HHKMGn1W7t71MGIp14zkTdXt0kIvh9nOUAWZINKJW4akDkCQEjnawxoDuWVC/fxxeQ==
X-Received: by 2002:a17:90a:7641:: with SMTP id
 s1mr38258826pjl.84.1625038401283; 
 Wed, 30 Jun 2021 00:33:21 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:2f49:a14d:fd5:cbd3])
 by smtp.gmail.com with ESMTPSA id v1sm20724909pjg.19.2021.06.30.00.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 00:33:20 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	zhiyong.tao@mediatek.com
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: mt8183: kukui: use generic pin configs for i2c
 pins
Date: Wed, 30 Jun 2021 15:33:12 +0800
Message-Id: <20210630073311.2177374-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_003322_287840_42841DF8 
X-CRM114-Status: GOOD (  10.11  )
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

mt8183 i2c pins don't support PUPD register, so change to use generic
pin configs instead of let it fail and fallback.

Fixes: cd894e274b74 ("arm64: dts: mt8183: Add krane-sku176 board")
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index ae549d55a94fc..69dc04c3f7fff 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -426,7 +426,7 @@ i2c0_pins: i2c0 {
 		pins_bus {
 			pinmux = <PINMUX_GPIO82__FUNC_SDA0>,
 				 <PINMUX_GPIO83__FUNC_SCL0>;
-			mediatek,pull-up-adv = <3>;
+			bias-pull-up;
 			mediatek,drive-strength-adv = <00>;
 		};
 	};
@@ -435,7 +435,7 @@ i2c1_pins: i2c1 {
 		pins_bus {
 			pinmux = <PINMUX_GPIO81__FUNC_SDA1>,
 				 <PINMUX_GPIO84__FUNC_SCL1>;
-			mediatek,pull-up-adv = <3>;
+			bias-pull-up;
 			mediatek,drive-strength-adv = <00>;
 		};
 	};
@@ -453,7 +453,7 @@ i2c3_pins: i2c3 {
 		pins_bus {
 			pinmux = <PINMUX_GPIO50__FUNC_SCL3>,
 				 <PINMUX_GPIO51__FUNC_SDA3>;
-			mediatek,pull-up-adv = <3>;
+			bias-pull-up;
 			mediatek,drive-strength-adv = <00>;
 		};
 	};
@@ -471,7 +471,7 @@ i2c5_pins: i2c5 {
 		pins_bus {
 			pinmux = <PINMUX_GPIO48__FUNC_SCL5>,
 				 <PINMUX_GPIO49__FUNC_SDA5>;
-			mediatek,pull-up-adv = <3>;
+			bias-pull-up;
 			mediatek,drive-strength-adv = <00>;
 		};
 	};
-- 
2.32.0.93.g670b81a890-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
