Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06CE1C11F65
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 03:55:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C28F061D18
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 03:55:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C28F061D18
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L/SKCKgyJk9UoRJ1DPz8G4MW2Mk81Po8ueFwiKSrHjU=; b=yqKtdLISn55KdX
	8eaZmOiwRsPaRdw06McS9rkp0mX8g4yqbxKVcucZB6EyyxIoYdzkjYCaLjvqF+bHSjegnpfwzcvdf
	YYlPGerm5t4jEqbWt8A7eBmTPC1XcBDQsk7ZmsSXdRM2sm6pA3d/OhKtKkGbOr+JgHDN0cD7u2KDN
	VGUCpNQyLD5lvnwEEqY8yCvXvjcLOub5PF/My/e7lFT8uk+jjOQNMyOfeW3l/IDqAQbdOs/AG2ooo
	JPdSvsFy8kFhXHyfE7vsRaO8ebkrfgzAt/60iiVa9G32kOFihJKiqLG30eZnfIV7XA/NKMRC8dH+u
	1Vr4IeMD/pgzjAWalsdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyRJl-00CjP3-ID; Wed, 30 Jun 2021 03:55:17 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyRJZ-00CjNW-FW
 for linux-mediatek@lists.infradead.org; Wed, 30 Jun 2021 03:55:06 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 p17-20020a17090b0111b02901723ab8d11fso476216pjz.1
 for <linux-mediatek@lists.infradead.org>; Tue, 29 Jun 2021 20:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XTRseahQAn7N0oXgs/qWK7jL4rGQhAjklYtYGhb1AyQ=;
 b=NO5OEIQsKYNpdr2LWayi7XLdIScBEOu4kjYg+ef74vvy8kzigpTWON3vmLPFeT5gTC
 f87p9QJk5st+s2ZG5dWu1HKfyRwJbDsbsauCW4e3auXjUhUmMsP3IxAZj9MRj9fiKDGL
 Zug8Ck07asx4KGT0rcv05OFwQUGLRNCCTVgOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XTRseahQAn7N0oXgs/qWK7jL4rGQhAjklYtYGhb1AyQ=;
 b=s0lEWqAl2KYtKwzM2T01Z07ZmWwyElSkcox2NAQ/KwIGe7ZQRY/vcz6vmPFGG5ggYU
 UmDNjkPjZ+y69GO4TRcMhQhrB8j5WmzvmUlGMPs2Bx/pKosZ8mXfOVuh7QqU8UftKJDO
 iakGaM+XmdLJ/+tcJdEKPyQCzFoYbH6pR/k5jHDQbD9Q8ddkgEUHQjIXHGj9cRJc+9dl
 u1COkWStQEEVvQoz75rh7IEBZT9q2hNrUFMhV6/56lKhZ0OLI/jrORZOkRbIGUswVUs0
 aLipywU0DBYKS9LBUKt/RD0MKlQAYP8foGZ4NcXgaw5ANn9BXZTvMr9Ng4xCVCJimfSe
 uNxw==
X-Gm-Message-State: AOAM531sevaw2kLDVqCPIkgIPocp+mceE7OuuoDVBl50PjdxVNsqsoNr
 9h5vmEXJjLCJbNBRQ9KBif/TAw==
X-Google-Smtp-Source: ABdhPJxpm0eVuqMaGGYVUYcbD+lr8qVwBZYtjBw5loLKQrjnuA9sFFcXJwaQZLigcKOJJXKjl8OsjA==
X-Received: by 2002:a17:902:b193:b029:11a:a179:453a with SMTP id
 s19-20020a170902b193b029011aa179453amr30293113plr.69.1625025303074; 
 Tue, 29 Jun 2021 20:55:03 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:2f49:a14d:fd5:cbd3])
 by smtp.gmail.com with ESMTPSA id f6sm13264333pfj.28.2021.06.29.20.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 20:55:02 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	zhiyong.tao@mediatek.com
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mt8183: kukui: use generic pin configs for i2c
 pins
Date: Wed, 30 Jun 2021 11:54:44 +0800
Message-Id: <20210630035443.2144958-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_205505_545857_1D14363F 
X-CRM114-Status: GOOD (  10.21  )
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

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
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
