Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF97CC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 17:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xzQ3pu4AkkWqxTHaHeMz8ghBZOwYoCN5mkKi0p9uYHs=; b=hCVCnSoozMb8e4NgGN2AnTl2BG
	4AIWwo70YEAe2poJixlE1tGlyuYCLiP+zLnplAJGdybDJzF2LJfffBVy0roJBblzGQaxUG4ASyVP3
	VWCrcKjZt9kAOuZpJ5z9RpbpjtIu6Oov77LdDJstgcUh1P5txMvsbIfRtkDBGlq5Cibx9EVUK3w0H
	G+Fug4lJccWNsgUqaerxpdGFmJbF7HN6n3OFnnISBEf/wAJSIf59TicDvttWIrYHihhjbzFKmoE36
	jrDP/G3FZz94hqDQhyCO5OxYDt+42CqHii4LPsISFfm5w+IDOZQqprKmOX/3UuQFXvq2obHic2k/9
	GhUa4PhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og8Tj-00FTcx-3D; Wed, 05 Oct 2022 17:46:43 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og8Rd-00FRza-CE; Wed, 05 Oct 2022 17:44:34 +0000
Received: by mail-wr1-x432.google.com with SMTP id bq9so27014704wrb.4;
        Wed, 05 Oct 2022 10:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=xzQ3pu4AkkWqxTHaHeMz8ghBZOwYoCN5mkKi0p9uYHs=;
        b=gaxodBeuuMM0XJH7Z5uOppiufptWExBXPakriMQEZRFk5LQ8wOj1eNupyQ+0+uEsV8
         O3mMmjs74AOR0Aog3r7N8Z+3lzTidhDvS0hPgQnUv94KLIIvnVnxi+R7rGMSHfZhqFYj
         /kaLDrfXNYIMlV4NpxIiyOiaDXQfGK9lRBdx6lz5FYcQdxw0H1psJgNimkMTZKuXtnBu
         C0dIJ6MBT7V251msfdS0ElJQEw6qsNj9UsQmvrqoC4qmd/G5eF1/9HqH0GAPwrcpwsTo
         fbdKfP68fd0VOTJy7qtd4Yqq4Z3U3HJJ3KGIyRcJvk6g9UT7VwCCpyAOpKG/czGc5rD1
         uaDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=xzQ3pu4AkkWqxTHaHeMz8ghBZOwYoCN5mkKi0p9uYHs=;
        b=PVb2one9L9cUxmGF7TyCHwnp1IuJcQF4GVFkRiKsOT74wGhhoBgsGRJYI440ZRAfvY
         tY9extaFFLWjEeXye6AVpSfGLs15CeT/E4Bde5xBPcNU8MFk2Ktxxvr07iWXiSGzXogC
         mMDY5zqKThecmAUwAB9WjPeXutSLI301OTUMao91WIASJx70L4caYMs+1BnyPsIPUMht
         ecozqMoYs8bqteut6dKQTeyBuP7TYejeOKoBLZBizcG7uGL+y5aCDx2rqAT0UnFdsPJs
         LjpJJpaOwEIGHoSfNPamETErYOjNUJYLe1HnjZLgz0olRg5zOO7b4XItP+XdKyR+ZQ8Q
         FZGg==
X-Gm-Message-State: ACrzQf0eO17SCmRSjL7sg+5B0DnYOm9hJM/jY67RUGrccZcPncWTGWPL
	MDKwiXc15ogKBSgrNdG7YTw=
X-Google-Smtp-Source: AMsMyM5aaW/jqs7PzwW9R7tJincjwVTCwCF2vgEwDG/p+WiHo0oGn0xHe/dbMN4IpZ6oR/jLR9Xtaw==
X-Received: by 2002:adf:e0cb:0:b0:22e:2e7e:e57d with SMTP id m11-20020adfe0cb000000b0022e2e7ee57dmr585151wri.170.1664991869718;
        Wed, 05 Oct 2022 10:44:29 -0700 (PDT)
Received: from localhost.localdomain ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id c6-20020a5d4146000000b0022a403954c3sm16075491wrq.42.2022.10.05.10.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 10:44:29 -0700 (PDT)
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
Subject: [PATCH v2 08/10] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6765 pin controller
Date: Wed,  5 Oct 2022 20:43:41 +0300
Message-Id: <20221005174343.24240-9-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221005174343.24240-1-y.oudjana@protonmail.com>
References: <20221005174343.24240-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_104433_451959_2A8287D4 
X-CRM114-Status: GOOD (  10.87  )
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
---
 .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index 64d4b6a3b5bd..f10d1d5543cb 100644
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
@@ -60,6 +61,28 @@ required:
 
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


