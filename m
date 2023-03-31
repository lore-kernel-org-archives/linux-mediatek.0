Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE678C76196
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 17:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jRixuKzQvnbMJhgmsgomkYvraWKHEuPUT+zxf2iYamg=; b=Eb1uaFtfuGjqH5opyU31lJ72eN
	sZKF9wha935HcddaXDANqMV3n9erGqOejcNYoa6+29WpNAxi7Gu+2Pflo7gwXQVekMg+7NtF8syjw
	0PVJu2suOO7oVIA+YYCEjOWE3YgZ0HpoKUsP5kyrPsKisiY87TCcDoICT5jmU/0Ny6IiSZRsZm4sg
	MO+i718OntR+0Jm20vjlMsNzY9Oid6MJRl8cBKGPSH1PZZFiprlY0K2bvkODOU9nnFaYCtZYubnT1
	mDTreXKusIGITuOelXjo/WrXXbS5RPrGgvMyZ5c1rUsl8agNdwLl8JDGC6VLPCF0sKs6PNkt1KX3i
	graE61KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piIih-008Jdn-1H;
	Fri, 31 Mar 2023 17:39:23 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piIie-008Jap-0R
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Mar 2023 17:39:21 +0000
Received: by mail-wr1-x435.google.com with SMTP id m2so23222536wrh.6
        for <linux-mediatek@lists.infradead.org>; Fri, 31 Mar 2023 10:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680284355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jRixuKzQvnbMJhgmsgomkYvraWKHEuPUT+zxf2iYamg=;
        b=LmmTQSCxEPrQPiGyjdgaHyD53hiKaMf7FZfv6Gc/r7/NwLERMujkY+9bJiGGGgUEGt
         1coeHYeANxagjh3FOcGAjlRfmd2p/TZ1qAtpBt4Q526yW6G8SOUgfj/U3S4ojfjhxm6Q
         jJ1TggfS5v/lNSlLu+MXHd4ZOHL+KrJqoGF6m3KQ20EILXkdFms8eS18xCojnDrB8q1A
         YpdlwF80uet6YK4Jq/ttxI6EeUbDfkB8D4j5i6EoJo1yHJz+MvyczmDnsRo+52R06Ing
         BKlYgx1lf1p68W2Fsp9W+FQ3naUWo4dAtPuw7fmKQuTZ40M5vslV+10BDz88BYKaKvPu
         2mnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680284355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRixuKzQvnbMJhgmsgomkYvraWKHEuPUT+zxf2iYamg=;
        b=wOHik9xAE+83o4dqvCF3MPahKTEAo0Cz1Z8yTyIH+pvfe07D21UhzwUyijJFszntZT
         SiXRxW5tkZkBloEw/j4QabaGQQ6zIu+bv0xIlL4+VswXD6JLTKz+HCaIKI9ArMdGdTNe
         Sbi98WGlpg6mVgxYfyKYn17YVGgeKh/PcYF699V6PRED638IXzphlh3/15SW1CZoazch
         gyQ5/VCay3M0rwyNgidrtUK34iQeSfOLU7ibbCzyJO1v5ahLpR5NTCW7ZcGx7+pa9qXX
         oYP7bLLnqlx0ISYtlqK6NLx/DLjxV3GaUXwzecGbqgTLcpAR3VwdLHxCi/XA87XX+oXg
         fEWQ==
X-Gm-Message-State: AAQBX9fMh9ONbKCGwiS/izC0kar6fU9iNQgP/nMDXNbgYa+EA1c+zpiR
	ENTf0by7rCtyix/xMNrKecvVsA==
X-Google-Smtp-Source: AKy350a/Cvyka98UHE/iBASjYLnQV209P2aFcDroXiThDIDA1FYIsCtCyf6fmVkK47FtxJgDuUjY+g==
X-Received: by 2002:adf:f703:0:b0:2cf:ea38:ef29 with SMTP id r3-20020adff703000000b002cfea38ef29mr21791195wrp.44.1680284355608;
        Fri, 31 Mar 2023 10:39:15 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id o5-20020adfcf05000000b002c592535839sm2733550wrj.17.2023.03.31.10.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 10:39:15 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 31 Mar 2023 19:38:59 +0200
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: mediatek: deprecate custom
 drive strength property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230327-cleanup-pinctrl-binding-v2-1-f21fbcc3016e@baylibre.com>
References: <20230327-cleanup-pinctrl-binding-v2-0-f21fbcc3016e@baylibre.com>
In-Reply-To: <20230327-cleanup-pinctrl-binding-v2-0-f21fbcc3016e@baylibre.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Zhiyong Tao <zhiyong.tao@mediatek.com>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3361; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=igiUCMFpCLdMiNckuDwORr1eE6qfItZDAhGIpRb0mNg=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkJxrBMXQ3aqrosawTCEfZ459CZ6+xtnAFlCCE4IGo
 KGftLluJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCcawQAKCRArRkmdfjHURVPjD/
 9zv00Oouq8BQqAEHKHrBsBtsA/dP0r9wgxn+cTQpyhyO13QZc/tA6I/QpXw2Aw/CISlTdgNw1fkhGp
 HXPUMGSRYZo7LU+NiW1WgH6HVlwa+DQUTUNulkpeHs1r1WmIJF25sImMjCvUlEdKKDF61X5fJm4ePO
 rC1sd3ZXnSXqD4mxIfA0FadAXdd9ot+BSDgIpZ21mhAUVvC5mGVh8L9EcudnzN+DpFSS9V8hRB+yRP
 BteUL7koGjs88mxehoh27SasvAeIPBbNMB+NnROvueSy1uVRryh8n4ubTswNo+zspKd5X4ejnQspUv
 34q1ldvf+8D/zYeYcz8CIboA/iAbWsjP5DLL9mtiSkMQK+qWIjfPjZ2Wlw/2VtI8kM91b+qrU2bodW
 5oiM88XXomksrEYv7CeuzLNSgQeIMrexyhCflZNcPg6AefQcuZD+DWgsJWi0lubFjV8sUCDGj9MoRW
 ngyvNW9j70LwYvv8ooGYfZfUBzjDkMPKQhGUt0NI/wzaA723+QFMqo9QhKlsullyU5woJuauJ1VbGj
 Qq/mrMevdPpHe+O80XTPHowUGONmzscoIizvco7GgzaqEZCmZeYyeFP1QKwxX5KjtXj0Gqua0q8plv
 yCM2xDWkyLLpnlTQiKVOfCU6yoZ+nky2c/w91qNhMFCF0aUAGZTdzaE4eXng==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_103920_174511_949ECB64 
X-CRM114-Status: GOOD (  10.49  )
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

Deprecate mediatek,drive-strength-adv which shall not exist, that was an
unnecessary property that leaked upstream from downstream kernels and
there's no reason to use it.

The generic property drive-strength-microamp should be used instead.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml      | 8 ++++++--
 .../devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml      | 6 +++++-
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
index c30cd0d010dd..b82a066b91ec 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
@@ -110,8 +110,13 @@ patternProperties:
           drive-strength:
             enum: [2, 4, 6, 8, 10, 12, 14, 16]
 
+          drive-strength-microamp:
+            enum: [125, 250, 500, 1000]
+
           mediatek,drive-strength-adv:
+            deprecated: true
             description: |
+              DEPRECATED: Please use drive-strength-microamp instead.
               Describe the specific driving setup property.
               For I2C pins, the existing generic driving setup can only support
               2/4/6/8/10/12/14/16mA driving. But in specific driving setup, they
@@ -215,7 +220,7 @@ examples:
               pinmux = <PINMUX_GPIO48__FUNC_SCL5>,
                 <PINMUX_GPIO49__FUNC_SDA5>;
               mediatek,pull-up-adv = <3>;
-              mediatek,drive-strength-adv = <7>;
+              drive-strength-microamp = <1000>;
             };
           };
 
@@ -224,7 +229,6 @@ examples:
               pinmux = <PINMUX_GPIO50__FUNC_SCL3>,
                 <PINMUX_GPIO51__FUNC_SDA3>;
               mediatek,pull-down-adv = <2>;
-              mediatek,drive-strength-adv = <4>;
             };
           };
         };
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
index 4b96884a1afc..347f533776ba 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
@@ -91,8 +91,13 @@ patternProperties:
 
           input-schmitt-disable: true
 
+          drive-strength-microamp:
+            enum: [125, 250, 500, 1000]
+
           mediatek,drive-strength-adv:
+            deprecated: true
             description: |
+              DEPRECATED: Please use drive-strength-microamp instead.
               Describe the specific driving setup property.
               For I2C pins, the existing generic driving setup can only support
               2/4/6/8/10/12/14/16mA driving. But in specific driving setup, they
@@ -189,7 +194,6 @@ examples:
           pins {
             pinmux = <MT8365_PIN_59_SDA1__FUNC_SDA1_0>, <MT8365_PIN_60_SCL1__FUNC_SCL1_0>;
             mediatek,pull-up-adv = <3>;
-            mediatek,drive-strength-adv = <00>;
             bias-pull-up;
           };
         };

-- 
2.25.1


