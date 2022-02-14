Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA6AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 08:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w4nBSyZc0ousA1hgwfQ7Py6NNSuahhgvvTWvkKAyPRo=; b=HRx2kSrdqS/ZTW
	xRCCmGtKOkYp4uWlFxBgTg/JJ05e5YNiiTtcMQ/4Iin6e2ReP6qL5Vi3HXF0P+rEgSjB9UYEcLXgV
	DC6ZvBCU7pQP3+LFa5wk7ckMNSlNs3reMGdBBwwCoQ46gW5o+2mbgnKwvhT4usK3FT0Mz6nsjwWXL
	wTgIJ22cUCaSAKHECwXEs5Jk1FzFn/18MrdEQ77eBJMe8bmr8R+fuEAmRy0kLM8XuQIKPCHToNwl8
	jqZ1BvSsNGVfY9aHKVREjRa5gWHkZN1w5POwTtHRmSNGA7G8EOyWsHrjYH2OgHiOiwWI6nQOGlG/y
	j2zlCdB/91QTpzZ/WmKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJWps-00Dxg9-7g; Mon, 14 Feb 2022 08:35:52 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJWaV-00DrCW-3u
 for linux-mediatek@lists.infradead.org; Mon, 14 Feb 2022 08:20:01 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id CF24C407DF
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Feb 2022 08:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644826797;
 bh=o/YgTPBdxwkk76YIPJfDwO9KLR8OIlu6EoGrWBDU/GQ=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=EwTyN5N67UAQHLpprepPlAdArEoxH9FHAtFV+b2v/8mCpJO9jzmVzcILyPM1QfAbE
 mcYvaKAxFLktyuhN6d8z+h5Ije00wbvaMxqdQcusXQUlfOszPBuuMobs1BrXaKaANb
 9dlfmVgYjSoQt2dKnfeJ/ZSY+y1qzxVO9Fjhv7VR++Dy8m0dWIbJnuE5jhsBzkGIA1
 n+qAYg2y5g/hq71m0WQZbiuHAxmVjasQzBlAgOptKuU9jy81ta9rak5q4puZxmImiQ
 QzRXART7ckrtwQCvBQSSU96TSsvUzC9xC0sKw2KEQYTwjoP0Ah9DwcJioZJ7+YEa0R
 8mDjyxKbwq3Dg==
Received: by mail-ej1-f71.google.com with SMTP id
 kw5-20020a170907770500b006ba314a753eso5464236ejc.21
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Feb 2022 00:19:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o/YgTPBdxwkk76YIPJfDwO9KLR8OIlu6EoGrWBDU/GQ=;
 b=uSFO7cYCIRKOCbUlGMnz7OtOPLB95nvogD2KD2rHSjx4OXwW6blyOeCTr7k7VA2QEN
 ZIjbF4u0pEokCsEQ6AwOhXoVHztaBY4vVWKmVRMg5Tb9X21MdeZzcnZq+NovHK6mwUlE
 lspwGpDguisvpR215Asui9zXsS7m7CfN82ttx4P0927uq5KEpSZJ2rbkjI71zr1bvBs0
 v5ZdRnqhxLBJnoy163HlIAoXEeMtq6G57t17f+ryC9ASVopPwMHHjib+UM1cAfwRXXGB
 JmN5C+JLAkB9LzA/dmSqaUrUcLYyKBsI5KsmFILrX1hL4I4sz+Kt96u7nShltm99SYnZ
 mSkQ==
X-Gm-Message-State: AOAM531VGA84lDpwlWtkdNEytUxv1juSoMDX76oOz/WLzJrJ84itaNsG
 +fZIo5B+iQEZIn4JEVO8dDdhVY37bd3cEQIzTO8bLdSJJFmj6pMvySozDIaklqMAakjO19tuXCI
 78WpGpCqHMm7bxlsDsVxqOgZhu1zX0MrRKIKB7cSqg8YkbRA8HA==
X-Received: by 2002:a17:907:6091:: with SMTP id
 ht17mr10718085ejc.607.1644826797386; 
 Mon, 14 Feb 2022 00:19:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkFPJeiJWjmWYMYKnbVg1bBwxgaPTZV+oh4RSUxGNA67GTozBuexvPDdoyT1VdY/d6fUhgGw==
X-Received: by 2002:a17:907:6091:: with SMTP id
 ht17mr10718069ejc.607.1644826797215; 
 Mon, 14 Feb 2022 00:19:57 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id b20sm2022941ede.23.2022.02.14.00.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 00:19:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Douglas Anderson <dianders@chromium.org>,
 devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [PATCH 4/4] arm64: dts: rk3399: align Google CROS EC PWM node name
 with dtschema
Date: Mon, 14 Feb 2022 09:19:16 +0100
Message-Id: <20220214081916.162014-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
References: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_001959_314123_7E23DF97 
X-CRM114-Status: GOOD (  14.01  )
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

dtschema expects PWM node name to be a generic "pwm".  This also matches
Devicetree specification requirements about generic node names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
index 9b2c679f5eca..3355fb90fa54 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
@@ -462,7 +462,7 @@ ap_i2c_tp: &i2c5 {
 };
 
 &cros_ec {
-	cros_ec_pwm: ec-pwm {
+	cros_ec_pwm: pwm {
 		compatible = "google,cros-ec-pwm";
 		#pwm-cells = <1>;
 	};
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
