Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C19D8ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 15:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s1V4gFthMJstNGcNhM92rVABM0TfYB3AObPf1xTowFY=; b=LiIByiy8Onma7d39d1IdRvBDpA
	klr7n9d1QcHgECAIZwphwlRQVANIERaNLu5Sgw4pNObKlAvUj2hjU5jn32coA2K06Jh1V2gm11sYn
	3xVH2fAw5Oa4zWxtXmr8BhmNxWA/aIEZSWtgmS3zASspBYnuYswJcMZyc5/FRk5uDkxj3c/8bThTp
	ox4Nabd4Xys1WQ5wMSD1Eszz09DUzl/Po1/Pz1SHIu1jm2SSmpVbKxUZx61OFmraSLJD+RtmDlkkv
	pZfqHUiaBzJo0B9aSh7T6f6W2ZVURRUWw/K5MAZavnx+YLcB4Y8ScSgb7JdgiEDhHSm/xBjp3Tzv/
	717WJbCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooRPd-000YhM-1z; Fri, 28 Oct 2022 15:36:49 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooROP-000Y5U-47; Fri, 28 Oct 2022 15:35:36 +0000
Received: by mail-ed1-x534.google.com with SMTP id r14so8408569edc.7;
        Fri, 28 Oct 2022 08:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1V4gFthMJstNGcNhM92rVABM0TfYB3AObPf1xTowFY=;
        b=FcV+0oYeqEJQCRPz/cdvdrccW6P3vyTfyD5SCo4BOqscyvvcL96TPwX98ubqTa+ZdQ
         QyryJMOTYp1Jw75vsyiY2vodsRkfF6Facm9HcNBXM2ZXd2pY80/68vRvDXSM+2ORvWzh
         +BUeOeRdtzPSw1myhI8mkXAdXxSyP9Rx95E88HVlyxbkAT0HKPyxsIMqSXbpjHvB5juo
         v2hVUpW5e96h/Agd6c3HPxHGftc1w+5k6c/vk+GP6MQovz10bnDoIok+qIVRh5fuJjJH
         sbllyCjmdss3wSuFL7SrsKuCKA6gTT7RvpEcc7uxgvdvdRmmcPWqWceQr2fsQyXRyBEQ
         YUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s1V4gFthMJstNGcNhM92rVABM0TfYB3AObPf1xTowFY=;
        b=CiRkZ8AaTW+fRNRbVdqTCCoVNX4djui8xnv/ShNgdrkcJUQ3LNDHyqIaiz5e7pfGjP
         UPgNF6o3/JbMfwt7ZDVYqpbgWUlY0Cdq7qhSAhvLwZxU2EtlU3ZKT+FpDXCWkgIWZw1N
         IFfJcsUiv1zdybO1hsF8Y3+uEtZQdkWl1LCnIb9DTCU718q0leph/PUzVzzXepPXj23c
         vtxfS1fLQaQCoGAg+1pmldVkvhlbufmne6kfTBlJSocM+Q65y6vdRLoqMAHwLxnfsFPn
         HGBSpGLMaD8q3QYZlzE1KTek1BVQRdLUWpa1elj6RBKVF41j0hXGx99iXeiyTVDDEuWI
         WIfQ==
X-Gm-Message-State: ACrzQf2IjpT9zwNYo1f1ZYX6zkjY7ysigzF+FeJLEXUheM4+qhanXetV
	1U96w6KJOVWXyAO0Su+ZyZQ=
X-Google-Smtp-Source: AMsMyM7hzZ4RIeUlH+o0Dg9E0o2OrHjXLCpJwdUn/BZ3QCJyKqaRyjuW2Gw23e5wwKBPfvZisNkd8g==
X-Received: by 2002:a05:6402:254f:b0:45d:3044:d679 with SMTP id l15-20020a056402254f00b0045d3044d679mr276edb.137.1666971326968;
        Fri, 28 Oct 2022 08:35:26 -0700 (PDT)
Received: from localhost.localdomain ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id ds12-20020a0564021ccc00b00461aebb2fe2sm2830635edb.54.2022.10.28.08.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 08:35:26 -0700 (PDT)
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
Subject: [PATCH v4 03/13] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Make gpio-ranges optional
Date: Fri, 28 Oct 2022 18:34:55 +0300
Message-Id: <20221028153505.23741-4-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221028153505.23741-1-y.oudjana@protonmail.com>
References: <20221028153505.23741-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_083533_192158_B5AD1E73 
X-CRM114-Status: GOOD (  11.76  )
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

The pin controller can function without specifying gpio-ranges so remove
it from required properties. This is also done in preparation for adding
other pin controllers which currently don't have the gpio-ranges property
defined where they are used in DTS. This allows dtbs_check to pass on
those device trees.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
2.38.1


