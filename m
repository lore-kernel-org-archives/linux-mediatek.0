Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC38C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 17:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s74OAcrnJmEwMIg5y8kD13FcfZI0oHtteoKyxHIc6vU=; b=lpEReLeMupQEKBCIRGEPd3xwRS
	s0kLRBPVE6kzqPJYv28djsayNFqG0o61O1LFC5RLRGCbMYf9vk/N+h7okcrJ0AWYM1lraJG+LPa+j
	gvPjg47MZIX4RaXS9UrLnU0PF0R7onMa6igkPANG3xZvzK1xPzkQbn1qgkNVZqyG1vx8UF9YwswJ5
	W8j9lJZrZUFqaq//gmIZLRMG/pjdcv6XKp0z6rlJToHcBUJXqPslcGhT+nVtRu74ByzUNXBAkuV9f
	wRbrpmKEKQv5Gsfj2Y+53gbrZ9qyvEMuuUy4O0SC+SU5o7WpYRWjWYdWlxjGHUl/y5yp8vxmOd04U
	ppVNuV2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og8Ru-00FSA2-Gg; Wed, 05 Oct 2022 17:44:50 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og8RU-00FRvB-0B; Wed, 05 Oct 2022 17:44:25 +0000
Received: by mail-wm1-x32a.google.com with SMTP id r128-20020a1c4486000000b003bd44dc526fso1362510wma.3;
        Wed, 05 Oct 2022 10:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=s74OAcrnJmEwMIg5y8kD13FcfZI0oHtteoKyxHIc6vU=;
        b=DRMySqDqwjrbpH70gOwqe0WMGRTSDMFh8/yL8ljpndp7oyx4hSQIulbomwARRFYlE7
         WNzFT6jUCXwOwSNWqpb9EQYxTCF6mGPD2cGVkfcZx0tF/Pdm17wVwtivzwCayG9LUQFA
         x2ZOVQuVKBVcTRyfcDnXDlpkjFDCs7adnnmhKy7kinx3CXVjmr/q/PuN+BR4b5l2l4xU
         u86NoTByjk/y3+tFTM763rnbjP0jE/Bi13WWOP+SMhGRGYQEjl/w04YKZ8i3dbh7Vnlg
         VuAdpmFh4QzZV86dhCLi1/A6deyPOGN37M11+TcBA7Ic3RPIJ9+hbH6mIOohuJpxFiCK
         yBPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=s74OAcrnJmEwMIg5y8kD13FcfZI0oHtteoKyxHIc6vU=;
        b=nNCLpApQKIwQHqg1iyp8e7ahYyzMKYcnZs/8XyDYdoc+GqaGdWKg+kyMAhtMChjf/9
         oA+lzHCAWAXasGRAjsUFsbjzQBsG6+vzJVSCC/BB29NBseJdZa12PuQDG0d+KewuvL67
         vtX76eQ/nd0oQ8/RgsnCkGmROcRQ95FcnziwwN7YRuRD0c5Dcw+7YKSF+wrCfJnevEiE
         akGMLJAC1XcC5w2owXFSfcBymQjHSKBNI9Wu42x+9AgWOWbceI5w1GMIV8r1QA4dUz7R
         Lg1nb+EjjmMx3jls+xksiDD8AINBaROtT0YZFJZMjcqgv7N3swTIUZYChfJttf+npPov
         hzCA==
X-Gm-Message-State: ACrzQf2aP3v5qnid/Oh9leCIV2bn/QyS/60Mx7JGCKnqHx36De+nRmg0
	xWG4Uzd3CosRgFaNzEtw7qU=
X-Google-Smtp-Source: AMsMyM6GP+roXxlZWBu8IJ3eVceDIiaqoVBHkMfHPKC43E8xi3E9O/UHR1awiOndfRsF+i0omj7tOA==
X-Received: by 2002:a7b:c457:0:b0:3bf:f1eb:e943 with SMTP id l23-20020a7bc457000000b003bff1ebe943mr504773wmi.52.1664991860481;
        Wed, 05 Oct 2022 10:44:20 -0700 (PDT)
Received: from localhost.localdomain ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id c6-20020a5d4146000000b0022a403954c3sm16075491wrq.42.2022.10.05.10.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 10:44:19 -0700 (PDT)
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
Subject: [PATCH v2 03/10] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Make gpio-ranges optional
Date: Wed,  5 Oct 2022 20:43:36 +0300
Message-Id: <20221005174343.24240-4-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221005174343.24240-1-y.oudjana@protonmail.com>
References: <20221005174343.24240-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_104424_064363_BB1C043C 
X-CRM114-Status: GOOD (  12.23  )
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

The pin controller can function without specifying gpio-ranges. Remove
it from required properties. Remove it for that reason and to prepare
for adding other pin controllers which currently don't have the
gpio-ranges property defined where they are used in DTS. This should
allow dtbs_check to pass on those device trees.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 .../devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml     | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index c6290bcdded6..d45f0e75a698 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -67,7 +67,6 @@ required:
   - reg-names
   - gpio-controller
   - "#gpio-cells"
-  - gpio-ranges
   - interrupt-controller
   - interrupts
   - "#interrupt-cells"
-- 
2.38.0


