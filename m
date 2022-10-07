Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A91EC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Oct 2022 13:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jv44eLn5NBzZ2l/C4c+X3coz25UlOTpTrzr64+4VaYk=; b=D5dI/jkMzkkLMXyLnLYkyzTAgl
	193YS71/oA9xdK8sXroW2Kvz/x6qpeS2j+RPtQ7BbACAFNvbjOB59btVd9zBeWcGe4KEPZ1WaZsxn
	0xrpH4wMyA+3f1Fm4NDp7WQg6cv4SNSme3/YP68T6IiLdGKB6PbcIetUrkuRKd2aNMjozYGRducv4
	bTn9JrcxEOgMtVzMwDGR81hDZmG6SeTHO6XDU50k3UZvgpe0CXxgAfkIbKFV+7piXLEQRXFbKgU2c
	YlhTHEIDH4Iask5wjp1Xu5wM8Zh509IOCRKSCIPEBegrrMrWKhs+K+8HKGaFYNz/bVZM+KlVSLECT
	6oHeDhkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogmxR-0090IO-0l; Fri, 07 Oct 2022 13:00:05 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogmx1-00906l-8y; Fri, 07 Oct 2022 12:59:41 +0000
Received: by mail-wr1-x430.google.com with SMTP id a10so7167237wrm.12;
        Fri, 07 Oct 2022 05:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jv44eLn5NBzZ2l/C4c+X3coz25UlOTpTrzr64+4VaYk=;
        b=MuM8hM0nbyOrg3KeHbDFTuBIVsEMcTbFBl6MDZlnYZfE1cH2RDEBOCUIIs9PzwILfe
         0qmHo135P+i68z8BqCVo5YIagRtqrQ4T0O0/NbCnspkfhkkJG0QEBIPtpGVqiQsSVQur
         dwK/bRvofOCPoSnfC3q81V2r7/6/3SK5VwLphlHm1MTKlLkA0eEqLjef5vRXIrAkb1w1
         ZXG6LFvL5dc5SFHMhMlpjlEv7cAB6bgwVEqfGUd/EkkxqSbC6xoq/OdNh1biFcUpOiMi
         KoYMjfkhavw1NfP64RTHH9GajbdNN+xmCB8v1iouXT38KSm6KyWhcZXMnAp/f2watLBs
         y0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jv44eLn5NBzZ2l/C4c+X3coz25UlOTpTrzr64+4VaYk=;
        b=skeCYcJ/B+gg1JeA7J3t+l3BBiLABC+xdngBI81wBjsYyPOKT3zfCdELWFP0eNLfmD
         tHbD+BXga9ji8ewkA+CHMw2tQ4QadAD4emUfRF9lByB8P/AS/eNQVKIc0Fe1lZbWFnGb
         DyuOVlfjU4Ef4ExdT6/mE0n33/yawOF5afZsqF0AGaI94N7ePjpUeOzrVwMrjWes2PvU
         J0apEb8waPl0UII8qLXCkfK9peU5TKaGe0h0N19qAFv8RUbI0yWIK2b/LzF4J8QNkTKP
         m+YRRd6CkAHezfaI0Y5MvqHLdRQ4lEBM6W0rWqhKBT/3ZClFBF9BRzA9b1Bdmfy9+r8m
         4JKA==
X-Gm-Message-State: ACrzQf1MWoxFZS6VxfLA5Hv+q+VLmmLdC9zeSfB3WvXRC8rfj/kQLFJG
	5rP7ShOsZ6al0sbCmZMYN0o=
X-Google-Smtp-Source: AMsMyM4vYCnsY6VSZkZ7UNJcM2dG96KmQJwNtCghn8lQjzSQLCois44HVHDEtx86+WJ3fAo9gkEmmQ==
X-Received: by 2002:a5d:5012:0:b0:22e:4e0e:f4c3 with SMTP id e18-20020a5d5012000000b0022e4e0ef4c3mr3115829wrt.187.1665147577264;
        Fri, 07 Oct 2022 05:59:37 -0700 (PDT)
Received: from localhost.localdomain ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id i15-20020adffdcf000000b00223b8168b15sm2008243wrs.66.2022.10.07.05.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 05:59:36 -0700 (PDT)
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
Subject: [PATCH v3 02/10] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Improve description
Date: Fri,  7 Oct 2022 15:58:56 +0300
Message-Id: <20221007125904.55371-3-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221007125904.55371-1-y.oudjana@protonmail.com>
References: <20221007125904.55371-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_055939_333563_AFE6FD50 
X-CRM114-Status: GOOD (  12.38  )
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

The current description mentions having to put the pin controller
node under a syscon node, but this is not the case in the current
MT6779 device tree. This is not actually needed, so replace the
current description with something more generic that describes
the use of the hardware block.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml          | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index 8c79fcef7c52..c6290bcdded6 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -9,10 +9,9 @@ title: Mediatek MT6779 Pin Controller
 maintainers:
   - Andy Teng <andy.teng@mediatek.com>
 
-description: |+
-  The pin controller node should be the child of a syscon node with the
-  required property:
-  - compatible: "syscon"
+description:
+  The MediaTek pin controller on MT6779 is used to control pin
+  functions, pull up/down resistance and drive strength options.
 
 properties:
   compatible:
-- 
2.38.0


