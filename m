Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00733C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 17:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vXh3BxCd3UR1/+WjnZXctSKss7l1jK9ZVA3CPpEkeRU=; b=zW4YM4kQAX4JLa9Jh9QIdG8uaa
	cUTIP9icbNUSm3eyD/KfTUQ+W2dwVyjqkY6fgI1v0eXN00JWwzEKxRePH2N84P6FxIGFuorj4icFG
	9d3dzHw8PpWpT2SVDptsev7zYQ33W1cCh69WCPyQ4uBq3/VMOk9rJQvtRi0Gq4w/DBGtI8oc4gxXS
	NhsFORqIkRieIwgTsV6Fwyu1D31w8JGKjUFTLqy1P+5rhtOIYyex+prYWr7ERiD8yxaSgsaD/R2GJ
	NXunIqxV1vZ8dgVh9l19kdQAPaVQZzfMi4aW5e5eGuXIxZjojQqFdeYIo/PJyFrvo9bGQO1Vp7ACm
	mGHuaz/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og8SH-00FSTW-Fa; Wed, 05 Oct 2022 17:45:13 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og8RV-00FRx3-9d; Wed, 05 Oct 2022 17:44:26 +0000
Received: by mail-wm1-x32a.google.com with SMTP id e10-20020a05600c4e4a00b003b4eff4ab2cso1413359wmq.4;
        Wed, 05 Oct 2022 10:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=vXh3BxCd3UR1/+WjnZXctSKss7l1jK9ZVA3CPpEkeRU=;
        b=pQU0bVQHqs3y8H5Gc8qcusH69fCC7CJC8gFA/XWJsVSLmx15qzHkgLOem0Z3/DFOxJ
         GmS/0dzjvbMtHHHV9LJpW8HIvwEFDlolqPee4YAygr26A3pS4HPqWWqFB/wT7Uv8HJxT
         rysFqkHvsxjKFd3am2tfYxddB+4eNMIgWDQSgBP9S7CZ7rQwzKX4teyHBmcmcyK7KuyU
         oZSoC20kyMw3/Zs3nF/c+zlksnbZf0l735xkSGutgPNtTLQMlDhMpmgn8OJg8/z9A09H
         hG7l/dwdtc4zClnBU/CGaf9FJSw+dx5dleZ9eCDktGaNI+5a+yvSvAj5aQXgZNT13v5l
         LsmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=vXh3BxCd3UR1/+WjnZXctSKss7l1jK9ZVA3CPpEkeRU=;
        b=sBIi4b4bqthWBtQC5zJusqWYi7Eie6I5IzTgWEeYF7w10SpqNzupe79SHJXIFclC1o
         EvsYISVPMbDcLXaWirzA+kQxlI+SBgWcTUydTLhZOC6JznceDCSluF9Qah9ad1ZbWXnH
         0tMRsYqsMT+c74KQeog/yhdQPLRSCzqYb/MSBZJsic3JKzstth+2b1n/eRXwMHhvAnFG
         QbCIeRxMxPCByEpDgNgjNNBZBFV5fGjts50cf8g4YwKPS/1KszMgW0M2kUwKoMllryHM
         Wui9jSkxlRGwFj7IYxKkRxt3KPNykUsqGvcbjZAtcbdrt6kCXBUAuLsYIXBtf9+TTHRS
         4Y3g==
X-Gm-Message-State: ACrzQf3NDA4ojasQHx/vT5UY/ZFmBQNoOOSfqsECsSJ1NYBe01Z+GqV6
	kqm+RfiYBVKp2qfvY20najU=
X-Google-Smtp-Source: AMsMyM7SGMHRmQPQNPDZTLXjXHJw2JOTQjWqlYWILhe1UsBmIUdBty7xdVg2s6m1Fm3NF8/JPQ8u2Q==
X-Received: by 2002:a05:600c:1f06:b0:3b4:86e8:bd21 with SMTP id bd6-20020a05600c1f0600b003b486e8bd21mr468229wmb.7.1664991864127;
        Wed, 05 Oct 2022 10:44:24 -0700 (PDT)
Received: from localhost.localdomain ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id c6-20020a5d4146000000b0022a403954c3sm16075491wrq.42.2022.10.05.10.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 10:44:23 -0700 (PDT)
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
Subject: [PATCH v2 05/10] dt-bindings: pinctrl: mediatek,pinctrl-mt6795: Fix interrupt count
Date: Wed,  5 Oct 2022 20:43:38 +0300
Message-Id: <20221005174343.24240-6-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221005174343.24240-1-y.oudjana@protonmail.com>
References: <20221005174343.24240-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_104425_364646_6845E900 
X-CRM114-Status: GOOD (  12.81  )
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

The document currently states a maximum of 1 interrupt, but the DT
has 2 specified causing a dtbs_check error. Change the limit to 2
to pass the check and add a minimum limit.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 .../devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
index 73ae6e11410b..483fcdc60487 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
@@ -47,7 +47,8 @@ properties:
 
   interrupts:
     description: The interrupt outputs to sysirq.
-    maxItems: 1
+    minItems: 2
+    maxItems: 2
 
 # PIN CONFIGURATION NODES
 patternProperties:
-- 
2.38.0


