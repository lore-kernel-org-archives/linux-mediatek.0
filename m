Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C80DEECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 15:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7JOBlKgg/kW62eSwLjo5AIuvvOOYYo6+JrLET6u1kQg=; b=CWUxm1OSTE0V58833hWip/SH+c
	tggnVYx1E+H/2YFKN6GNroN2eFwYZmCdlpB9Q+4hafuKyLMkbVnkLwBfBeVw18S+u/Ts5P1yQzXeq
	5IGYTbmxK7Sr5iRMQmCAN0yrRMe4YxRI82FV35b2F2Wvf5GLbOQJYKFSOSDAcLHRTaY3jeFw0Y9Zc
	z2f08uajd1Z6fbyPIf37tD/LPt3uC5nhHtBuRo6phAWFcdhVMBs2WwhV7w4jCTbNFha2Gdq8am5RW
	a1ZUNT119UAUhBlQlpKrbTAEjUpuEHL8H7z10czSPdbkuIqnctrt+2DpKOAK7sotuIO30fZgwsUz6
	zN8a2h1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooROT-000YAC-2h; Fri, 28 Oct 2022 15:35:37 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooROJ-000Y3k-Ch; Fri, 28 Oct 2022 15:35:31 +0000
Received: by mail-ed1-x52d.google.com with SMTP id a5so8376545edb.11;
        Fri, 28 Oct 2022 08:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7JOBlKgg/kW62eSwLjo5AIuvvOOYYo6+JrLET6u1kQg=;
        b=Lokonk4He2xvlbb0fbSGgNBvGtfmJ+Cm3w1fR3GB3KPaUOgFO/DJLBT8Jh9cAlTWvg
         blZJBA64Mkg7OD9h4tm8kPTTHQzT6277uCDrVVEkcn4E52Lvgwr6WTMqf6zkUh1b5TTn
         4/H9m/4qYkEyuQ1gVVChxlRI/UGECSrF34XkXkypZBdqILubNuXc/onQrfxysdTuA9LO
         Lwh8gz6fzrsbrlQBhcPvXvXr0yc4Ur46faSWL+W5U4DvluQo6sA4yxgROLNfAr58Jfh2
         OaWjI+1XPsBqG2iz3L1v+bRE1Cuj58TRrr6CvB860HVT6Q84lbTfcFiKzEbDSLqPZsrc
         Ktcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7JOBlKgg/kW62eSwLjo5AIuvvOOYYo6+JrLET6u1kQg=;
        b=JNx9rjiCmq3D8x6PzF9nAP80AE4NZmGJYhN3y/I6mQnXhWFLwusyjvLLvRY6KRaixG
         4OHP/DQjHh43J/26OR8uqScok4YAxACpTOekiKLyt1V1fWq13Qv3WxQWBjN+AZAmuEra
         E5INlxlGo8vjUopRe02h0WoaJaINCwyfKhOeahdgzOvzVLp+XMX/hVhHs3xe+mg2/aK/
         khShbRhkOROiA1M1swN+ceCN9D7IV+190/41X2hmQqHL9FyS8yGq7P7NdjYPnuXd61tp
         lDOerHKlLGSkaGWt5BmP8E1Atrbp5KCwgrTbQ5k6fQa+mleLkoqjRHkX1OqNTvM6+QxU
         HISw==
X-Gm-Message-State: ACrzQf0iLWNvEa6fLX1FqHIYxQ4m5dZ/A8aFC+47ro1BmuVzSGMbTmC1
	r20tq4QnwWQB4Movo3bb3HI=
X-Google-Smtp-Source: AMsMyM6kzcugT2qZxWGejK7iVyAsKOi54x/a/sQwjsQcyTJruqJX4HMEf1MzEwUzsPRojZzKej5AxQ==
X-Received: by 2002:a05:6402:1d4f:b0:461:d2ed:788c with SMTP id dz15-20020a0564021d4f00b00461d2ed788cmr13269edb.418.1666971323016;
        Fri, 28 Oct 2022 08:35:23 -0700 (PDT)
Received: from localhost.localdomain ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id ds12-20020a0564021ccc00b00461aebb2fe2sm2830635edb.54.2022.10.28.08.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 08:35:22 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v4 01/13] arm64: dts: mediatek: mt6779: Remove syscon compatible from pin controller
Date: Fri, 28 Oct 2022 18:34:53 +0300
Message-Id: <20221028153505.23741-2-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221028153505.23741-1-y.oudjana@protonmail.com>
References: <20221028153505.23741-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_083527_479746_CF14B1B7 
X-CRM114-Status: GOOD (  13.93  )
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

Remove syscon compatible string from pin controller to follow
DT bindings and pass checks. Adding the syscon compatible to
the DT bindings documentation instead causes a different check
error due to the syscon document specifying a maximum of 1 item
in the reg property, while this has 9. This pin controller has
never been, and will never be, used as a syscon, hence it is
safe to drop this compatible.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 arch/arm64/boot/dts/mediatek/mt6779.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6779.dtsi b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
index 9bdf5145966c..a6fa5212da4e 100644
--- a/arch/arm64/boot/dts/mediatek/mt6779.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
@@ -160,7 +160,7 @@ infracfg_ao: clock-controller@10001000 {
 		};
 
 		pio: pinctrl@10005000 {
-			compatible = "mediatek,mt6779-pinctrl", "syscon";
+			compatible = "mediatek,mt6779-pinctrl";
 			reg = <0 0x10005000 0 0x1000>,
 			      <0 0x11c20000 0 0x1000>,
 			      <0 0x11d10000 0 0x1000>,
-- 
2.38.1


