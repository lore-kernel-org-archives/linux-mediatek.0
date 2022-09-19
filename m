Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9085ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 17:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nf15LCZ41yR567CGTs0jMggqT7vYr6v+1mrdNYdAXhQ=; b=Jh4iB/Ft5aJ4GoZ70BoKVGfzXM
	zbmdkzjV8dPBFolMdLH/BFlXGSgwrXB+pYn6NhvQFzpl6l/TMMLI5QllIPbauGXYnDJ7i47yc+ikT
	X9EN5z4JdK0aNWWJohip9NttKR8mwhyN3z1YJ0H7niH6pesiokbJo+pmfx/0cXpQYjFZoOas082+4
	+ZxGMy3jmTUIR6HsNCL60Zl4Fu4561D1AIreC/bll1VipFotKd8L7PqKTD2m4BaI5YFPYAryKofSM
	B7S62yHKu0AbvTndjbUBp9Cv7zkyjeuZwM68tUxalA5yZ5E3SddFVsPpRsggzbPyC1MLA6vlwznJI
	KvhG9DAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaKDH-00D8If-W8; Mon, 19 Sep 2022 17:05:44 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaKBb-00D6tv-Sx; Mon, 19 Sep 2022 17:04:01 +0000
Received: by mail-wr1-x436.google.com with SMTP id t14so71057wrx.8;
        Mon, 19 Sep 2022 10:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=nf15LCZ41yR567CGTs0jMggqT7vYr6v+1mrdNYdAXhQ=;
        b=ZD7fUgjkjYzdOIIjM9zCtOWu0KO9Oqs+9aPPDSxRJnr3CkysmFY28DA7mrGb+FgQ52
         NIjL9M4y7L/sRuT3sydISnddHXH5t1i9Gr95bsLKpN8FUiSpVhIcp1l90rCsVHx1GQip
         iq/QFkFzPbA3fpGONXHaR/ZZ1F3tJzptQoikCr5ve2m1xD0ygJMfOth9YSdhPFuI4LhL
         OsE+AhYuiIaHH3p9kgjBG1a7LGUAnRym1/1hM492aAiKf7r+UqAzTaZI661f7HffRNzq
         Id5DvHjym973ECP6cCOfptOvovV/LFxEdlNkDmF0NTf5RG0Fy+p9Bywr+Fx//a7sLp7V
         Rddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=nf15LCZ41yR567CGTs0jMggqT7vYr6v+1mrdNYdAXhQ=;
        b=0hO0cgIHjOciwtN+2zqerfBHIef9/N5E9wqXBOQYpmJPlAIdZRNyGxxW2hth6Q62Jf
         99ytCAy4jzlETwjUQ+5uRBezQ9+tPqqySzUiIzSC/l7OsNXNWzIizqB1SJ3qTe5vEVAR
         6KGdVajx7Wa4kEaGsS0U628Rs3b6ZSQFg/2VGHQv8k191TRpp4TmlkDPUlvVc5OVAfm/
         O8eN5hVId8mkkF8T/qbDC7qNMWNFWi2uupQKWKZ/9KvWJu4CPFH4x5RX9EMB3OVXVar+
         F4e6mwOmhEVRxiOh0szo9BLQXT4ZD0UHloBYOaH+vaQfIF9pzDb+Pr1pwa36oXpXRWsC
         /HOQ==
X-Gm-Message-State: ACrzQf1UmciwJEBnWIWKfZL9+vjEKVhIw+m5YREdvdgKZk9kClKfLzeE
	tuZqKo9KFAEEkPjDKrLyuGzwcQfAhg8=
X-Google-Smtp-Source: AMsMyM6M0vy0t3hvu4FfyUeWGYGzqDWgTfwOMONAZA8HhrxKeFV5auXVZWRGb1fmJ3aJC+9eAZxhHw==
X-Received: by 2002:a5d:59a9:0:b0:22b:e6a:4796 with SMTP id p9-20020a5d59a9000000b0022b0e6a4796mr569883wrr.47.1663607039408;
        Mon, 19 Sep 2022 10:03:59 -0700 (PDT)
Received: from localhost.localdomain ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id ci10-20020a5d5d8a000000b0021e6c52c921sm17562487wrb.54.2022.09.19.10.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 10:03:59 -0700 (PDT)
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
Subject: [PATCH 3/4] dt-bindings: pinctrl: mediatek,mt67xx-pinctrl: Document MT6735 pin controller bindings
Date: Mon, 19 Sep 2022 20:01:14 +0300
Message-Id: <20220919170115.94873-4-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220919170115.94873-1-y.oudjana@protonmail.com>
References: <20220919170115.94873-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_100400_096764_2FC5E4F1 
X-CRM114-Status: GOOD (  13.31  )
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

Add bindings for the pin controller found on MediaTek MT6735 and
MT6735M SoCs, including describing a method to manually specify
a pin and function in the pinmux property making defining bindings
for each pin/function combination unnecessary. The pin controllers
on those SoCs are generally identical, with the only difference
being the lack of MSDC2 pins (198-203) on MT6735M.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 .../pinctrl/mediatek,mt67xx-pinctrl.yaml      | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt67xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt67xx-pinctrl.yaml
index 1a1a03cede3c..c5b4972caa77 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt67xx-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt67xx-pinctrl.yaml
@@ -20,6 +20,8 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - mediatek,mt6735-pinctrl
+          - mediatek,mt6735m-pinctrl
           - mediatek,mt6765-pinctrl
           - mediatek,mt6795-pinctrl
           - mediatek,mt6797-pinctrl
@@ -63,6 +65,29 @@ required:
 
 allOf:
   - $ref: "pinctrl.yaml#"
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt6735-pinctrl
+              - mediatek,mt6735m-pinctrl
+    then:
+      properties:
+        reg:
+          minItems: 8
+          maxItems: 8
+
+        reg-names:
+          items:
+            - const: gpio
+            - const: iocfg0
+            - const: iocfg1
+            - const: iocfg2
+            - const: iocfg3
+            - const: iocfg4
+            - const: iocfg5
+            - const: eint
   - if:
       properties:
         compatible:
@@ -180,6 +205,22 @@ patternProperties:
               };
             };
           };
+          The MTK_PIN_NO macro can also be used to select a pin and specify
+          a function index:
+          pincontroller {
+            /* Pin 19 set to function 0 (multifunction GPIO) */
+            gpio-pins {
+              pins {
+                pinmux = <(MTK_PIN_NO(19) | 0)>;
+              };
+            };
+            /* Pin 172 set to function 1 (primary function) */
+            msdc1-pins {
+              pins-cmd {
+                pinmux = <(MTK_PIN_NO(172) | 1)>;
+              };
+            };
+          };
         $ref: "pinmux-node.yaml"
 
         properties:
-- 
2.37.3


