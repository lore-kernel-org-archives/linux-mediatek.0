Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59509C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Oct 2022 13:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XbkEIuq95eSoiLeUfE84b7FgReJpboo04kC8dJdnn18=; b=YdQO/PcBpY8C0ufT2VcQVhZZDq
	mDGpznpZq4GYl0Kbmlubnc0bMdzuYi5IBGIz1PNalqNYYc+okgS2gMG8nlNsS8z+0QgaahvU8Kt5p
	/xrJbyowPH+BwNku3xD2gAWScqM1DY9D5yoXTuxpzvaT/v9fiNz7pgv1Ric/HKajHl3EDoFoV0/rE
	zb1a+0SjbNaHYk1iwUGdm577s7nIcrZ4o+7enEDc/L6fAexuFdUW/Ut89AZB3AESjgxAXNk5EAEaK
	aMy/lhHT6xx9q6Ti/qBNMd5TPDI6fyt48JaP4Q2FFHGrDM/ZBkSgxZ/NyfOAW7MDRSOAKICgq2iC1
	r0UqbZNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogmzP-0091Lq-1p; Fri, 07 Oct 2022 13:02:07 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogmxB-009080-Py; Fri, 07 Oct 2022 12:59:51 +0000
Received: by mail-wr1-x430.google.com with SMTP id j16so7193271wrh.5;
        Fri, 07 Oct 2022 05:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XbkEIuq95eSoiLeUfE84b7FgReJpboo04kC8dJdnn18=;
        b=pocDwKv8mQ2RyT1Czn+1mfjjZDgRESJxNBBluLbxiY5ru0U1ZjxTQb9C2jF754obmT
         LKX8fxJaTsC4LklSmMvGQ1aPaKgWowGEc9QwR/uCxFD3251/oPIxDpzus3LzxUXaBkZO
         lckxv1lQXvMMAN7z2gQFQAM22EFeD9NnCrvX3laG9jhDx32CcwMkEk7VMoRsFApbRMJf
         95CoJghNp4Fta5tKbiMwAn0XpK023Yj8Xktk5N+6AL5+S1uXx/AxYIvtmyVPs3PEJCBS
         Z7Xd7y4UxKzx5oe8psUaiL2QA/Pgdi0UeBw4wwVburOXZ0ewEzj7SmDDWlWXwMxnc6L5
         tpGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XbkEIuq95eSoiLeUfE84b7FgReJpboo04kC8dJdnn18=;
        b=375GpM0tXr/4/C2DsKXR26Ju1hTD0rhP+Faavu9VUP0lygephTWna3qDrVkP1vuaLH
         Bqd3s+mFlgZqhfLoEFLL1tJC+Z8wJ2whD49RMMOFgRMWfCSxIilrZIY5FrW965f5EY4x
         /P2VpcoinSDE7hA2EUqSI/FR1BGg8rarITgjxQjnVze6OaOl4v93y3v1zAOHmValBwBj
         eJXjEuHJ5Y5NmaqH1SOnf2Z0/fGuuOmJvt3jJiVyOQF77wR6hcddSeLaq729FGGnjC7e
         stdJOWsdGPIpWGerHGHQ/wlxyT5fqCus/ytHpHTGLzllYcheQBbDKTifwFT7SBMJYPmC
         Ej2A==
X-Gm-Message-State: ACrzQf0vdMKcKBd1Gz/6oQPoGMcBE3864qCyDLFytkv1cDwViHZW09Mx
	L73zqykIHMLjtILLJNytXVw=
X-Google-Smtp-Source: AMsMyM7/Sdm+Nb59dRAKOoMfQ11vSakY4VD9Gt4DdgEouYfafenFOU93NAAtzGchUyp7CZosrjvxfQ==
X-Received: by 2002:a05:6000:16c6:b0:22e:5032:f15b with SMTP id h6-20020a05600016c600b0022e5032f15bmr3152640wrf.104.1665147589374;
        Fri, 07 Oct 2022 05:59:49 -0700 (PDT)
Received: from localhost.localdomain ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id i15-20020adffdcf000000b00223b8168b15sm2008243wrs.66.2022.10.07.05.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 05:59:49 -0700 (PDT)
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
Subject: [PATCH v3 08/10] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6765 pin controller
Date: Fri,  7 Oct 2022 15:59:02 +0300
Message-Id: <20221007125904.55371-9-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221007125904.55371-1-y.oudjana@protonmail.com>
References: <20221007125904.55371-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_055949_891678_F102F455 
X-CRM114-Status: GOOD (  10.29  )
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

The MT6765 pin controller has had a driver for a while, but DT
bindings were never documented for it.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index cada3530dd0a..71a9aae2cc8c 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -18,6 +18,7 @@ description:
 properties:
   compatible:
     enum:
+      - mediatek,mt6765-pinctrl
       - mediatek,mt6779-pinctrl
       - mediatek,mt6795-pinctrl
       - mediatek,mt6797-pinctrl
@@ -62,6 +63,28 @@ required:
 
 allOf:
   - $ref: "pinctrl.yaml#"
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt6765-pinctrl
+    then:
+      properties:
+        reg:
+          minItems: 9
+          maxItems: 9
+
+        reg-names:
+          items:
+            - const: iocfg0
+            - const: iocfg1
+            - const: iocfg2
+            - const: iocfg3
+            - const: iocfg4
+            - const: iocfg5
+            - const: iocfg6
+            - const: iocfg7
+            - const: eint
   - if:
       properties:
         compatible:
-- 
2.38.0


