Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61FE6C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 16:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=njt+/wKDrYTFWg7GTavB0HRQUAfOX8dRAmRM9KTf5KQ=; b=2bROCP7uFkj5JF
	Uaq/pD53tMqjkTt5YFxK6yoFS3kj/4H2yXP2ScHlo8YhuGjj6lfWol/BUvMYB/GFLdEewCJdVvHr4
	w7ddFPH0IDETrJXlO6fL808V9lmnQJmKgoU8ImuEQEIPaTIFqIwdnaw+F0dLCdrtndzfL1kw9CMzc
	28zy7KxLPyva7Aw4vwyuSMqBoz0DY+YU1+ihlq7xFjnWlA4RilhqCmEbCgUbRpEcfI3Jkh75MXNNS
	VKIDXzioEMMDwCW4QlO9WyvQY+TwTdjP6D5XQJrcvj/Lze8SIneiTf4d1TKlrixjuAGtZL+hZk4FQ
	EbIWkpBk0y4WbZoM47ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfOUs-00Ao2W-C5; Fri, 15 Apr 2022 16:08:34 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfO0J-00AbNT-7A
 for linux-mediatek@lists.infradead.org; Fri, 15 Apr 2022 15:37:01 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 n40-20020a05600c3ba800b0038ff1939b16so4037114wms.2
 for <linux-mediatek@lists.infradead.org>; Fri, 15 Apr 2022 08:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bjsrGI6b0RLOajPWZ9Roh+05A2VIae/Wu/ntaXQOjlw=;
 b=3wSns6Qsgrs4cf7sI/QmPRIbAuQFGeQOWy+IwaG4p/9G7wFu2NT3G9NIDox8GsYa83
 lIW5eRDkq87Z8CCCA5g4ZABFIx+PXqihPJ7jJ7jd9wDZYLFNkMXHH5HGR66XCPF+9dTG
 yBbvNBiJWOAM9LE0PerlZPkmCWGL5Ca6Ij+gCgK4iPuD2xWi2jTf4VeR6K0hBkuKstUA
 eKhtkY7CUj6iRNbZBGBOx99przt0jbd2VdOJuWEFD6h94LZnJNuDAkyx1bSVjSteJyCP
 +bftqFga/mY4fsJ8lJf2VOI9bkrKtnifVoc8pP8x+0fPRnZD60jCuzijfIPp+zGjyYwG
 GFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bjsrGI6b0RLOajPWZ9Roh+05A2VIae/Wu/ntaXQOjlw=;
 b=3Y81v41j5slLIZ3vMYK9evyFLt96Km2T6RALkaLjTjm+1nThv2Wd5SsLfGHi79Hn6l
 zGoloUPnlsOW/XZGK1KdcdbGWgJA2bwJCXO4sq9BZEVf0gtg1a3LEi3RAnmlYxlz7srv
 fjuo5d9S20Lrbc0Z2hOWZvqG0nVsNL1me2nlwpWHWUYlhntT1yFZYKPgeo9mtpgkwxg+
 r/ixa8bisMqZpinKxhxnaNjXU2mqNnvl6RacUVeI200Xx2MrnxOURt/IEaTVH3M/Mo9L
 zi5YVJ3uCikZwYD9w/hwka3K2a8Anl2wxICLpzmngdKW9HkU0N348Yqogi8ygk7n4+dD
 lkOA==
X-Gm-Message-State: AOAM533mD9koY2Bt6P5s2fIiVhSMjvqhBdUcqoo8O+A5vmgyaPpxJkH5
 IasWd0dH+HcMMKAh2gS5gq6oMg==
X-Google-Smtp-Source: ABdhPJys6pbLabTkeRziK+wc3YsUE7sp3OaYxjUErcU8DVV+dThnk4NTfuDDdx9muo/luGe71Ahcxg==
X-Received: by 2002:a7b:c8cd:0:b0:38e:c2c1:5219 with SMTP id
 f13-20020a7bc8cd000000b0038ec2c15219mr3731923wml.151.1650037017310; 
 Fri, 15 Apr 2022 08:36:57 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id
 c24-20020a7bc018000000b0038a18068cf5sm8459292wmb.15.2022.04.15.08.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 08:36:56 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] dt-bindings: input: mtk-pmic-keys: add MT6359 binding
 definition
Date: Fri, 15 Apr 2022 17:36:23 +0200
Message-Id: <20220415153629.1817202-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220415153629.1817202-1-fparent@baylibre.com>
References: <20220415153629.1817202-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_083659_307417_08CCE605 
X-CRM114-Status: UNSURE (   9.52  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add binding definition for the support of the MT6359 keyboard driver.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/input/mtk-pmic-keys.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
index 9d00f2a8e13a..afe9062a4dc7 100644
--- a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
+++ b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
@@ -13,6 +13,7 @@ Required properties:
 	- "mediatek,mt6397-keys"
 	- "mediatek,mt6323-keys"
 	- "mediatek,mt6358-keys"
+	- "mediatek,mt6359-keys"
 - linux,keycodes: See Documentation/devicetree/bindings/input/input.yaml
 
 Optional Properties:
-- 
2.35.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
