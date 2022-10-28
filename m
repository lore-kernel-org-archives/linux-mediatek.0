Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05F0FA3745
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 15:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LqCccumknJLELEs6P6qfy76QQ4LLkzIhoHsvgTTQP0A=; b=yvj4ouGsUpzAxLl8E6vLrN55o8
	MZZioXJIjw0jGIGGrXU4s9SUI5V5Zwo5e6AsHQEJrjb3fNmgaKYYo8dQYceEmz//YwwNxcr2nMurQ
	JREfbsHzc/1SK23TyauaAtqifJ5ysuSJZnn0S/tfuEovaI4q6i5gAluxi6h1fcmkORB+eumizxJl1
	TPU2KnEjfPGMEfsRfqCNpzP5a3zBicIrpilTapCJu4haI6p1DCPz3cgk1DgAY8p+UQqkdQmKtmjlI
	s4YCy7PbwnVUQ+gYyot9X2qODIQ3FZOAt/9vpJU55gWn2u2v7siwMnpWTpdZGdmXQpM495N0VN7N8
	st/T670w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooROy-000YOF-Ip; Fri, 28 Oct 2022 15:36:08 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooROO-000Y6S-I4; Fri, 28 Oct 2022 15:35:34 +0000
Received: by mail-ed1-x532.google.com with SMTP id v27so8446603eda.1;
        Fri, 28 Oct 2022 08:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LqCccumknJLELEs6P6qfy76QQ4LLkzIhoHsvgTTQP0A=;
        b=Tn73lx7E473nQMYoOWdMzrI4B7Y8cLS0asgGZ4ic/y9XfDXHi8Uknu1+0NNt/ochSe
         v+V0HUSncvJcrrBRUIH7B5buSwacbfeYn73OZbijlDaow5KZZKeMEhlhyNG/Fh1mxtHe
         vl9UKo9MUlYXzV0YQZrcfvtkNvPvFQ182phxyxvaksqAmpS1xtKsaKRg7ivadDebxmKK
         KsMZZxYsnouvNfW9xNWPeicZC3sMS8IeRAxYCPydS9gq3n8inlcbyluC/sKl7Knth5Tm
         /gjEWYHTWoOyemlIApJBHMBMfdLAWB+rx/qZ8h0W0TOTmgLOROVfFJ+zXdDc0yeEs0Gr
         IesA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LqCccumknJLELEs6P6qfy76QQ4LLkzIhoHsvgTTQP0A=;
        b=YKQX6HIKEkA0SR9xIHCChjaWmjYXmdnWPmGyPE9pWUrUwD0ew4V4VwxYmKHE4nZU5q
         6fJ+RpkpJTfalNMMaFnxYpkDnKhn2F1bL+Qr09NBoEfPqOzqhGVmb/I1zlyhtNwJYex2
         RC9ynza/086rZOZJZvv+AawyN0TZbthDv1/PjYg/Ye1wd3wkwzA/bAZl/Vx2Md4OfdMc
         EAX4t5tbsXZrcmbtI5oOC11sN9tjb2Udl/gw+8stsSOnPqiUMQVY7SRzc+CLNENI2SKq
         Gwze7Djqu3pEdGFmre1pNgrX+ofZ8SfiGWoQ73ujQZE8K+oyNY6JdyB1h9zTH/F0tckx
         /0Nw==
X-Gm-Message-State: ACrzQf0NThS+kBvyZvav+Ip3fZmMVVthn2ChlR71zQkanrlL+YpHJ0ou
	KPRQUPgmxgYz2/osVeObRxY=
X-Google-Smtp-Source: AMsMyM47SbkBLgzsyeqHvow0DxFIWZcWEVDjQy8qASHWKeuoqSZCOJP1h1nqlFCyxDv+tJeohq8wFA==
X-Received: by 2002:a05:6402:2791:b0:461:c5b4:d114 with SMTP id b17-20020a056402279100b00461c5b4d114mr25045506ede.357.1666971331095;
        Fri, 28 Oct 2022 08:35:31 -0700 (PDT)
Received: from localhost.localdomain ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id ds12-20020a0564021ccc00b00461aebb2fe2sm2830635edb.54.2022.10.28.08.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 08:35:30 -0700 (PDT)
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
Subject: [PATCH v4 05/13] dt-bindings: pinctrl: mediatek,pinctrl-mt6795: Fix interrupt count
Date: Fri, 28 Oct 2022 18:34:57 +0300
Message-Id: <20221028153505.23741-6-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221028153505.23741-1-y.oudjana@protonmail.com>
References: <20221028153505.23741-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_083532_669465_12712237 
X-CRM114-Status: GOOD (  12.62  )
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
has 2 specified causing a dtbs_check error. Replace the maximum limit
with a minimum and add per-interrupt descriptions to pass the check.

Fixes: 81557a71564a ("dt-bindings: pinctrl: Add MediaTek MT6795 pinctrl bindings")
Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
index 73ae6e11410b..a3a3f7fb9605 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
@@ -47,7 +47,10 @@ properties:
 
   interrupts:
     description: The interrupt outputs to sysirq.
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: EINT interrupt
+      - description: EINT event_b interrupt
 
 # PIN CONFIGURATION NODES
 patternProperties:
-- 
2.38.1


