Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D33C76196
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 13:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dZCUDC113hZrfc4/w637u6Evx1aNuEaVcx74j51VyTM=; b=y+X7bPay26j0iOLAOo4J+2LA3U
	2U6PG7vDyoCw+88tKOPx8pkjkSQKWqLMHsE0MwFzRGTQT21XBXXjVHR8uQ4+4+YeuSslF5mFdqTPR
	BNn1vXa0EukU/0qhaDnf5+Qold/BehK4NFETAc1bWPZ+pUqKD2e7UW6b9mnyS8xz4plFY6xulBVCg
	mvZ1oFe89nt+V0BdCGiBbMnvzd06n88X6ZW6pLojEjQqv62d1gLs5DzhDYWav4XF4n7Y5wMAEdyzQ
	R6+5yb/ePYhAmlOT3CasW5/NTBwQN/G9qFkCNjKGbPdjCUOqKjDuHYtSNXAj9eRdf1PM5ADawjA5b
	Omb2GPsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph932-00EUnD-1w;
	Tue, 28 Mar 2023 13:07:36 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph92s-00EUif-0h
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Mar 2023 13:07:32 +0000
Received: by mail-wm1-x32d.google.com with SMTP id v20-20020a05600c471400b003ed8826253aso890777wmo.0
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Mar 2023 06:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680008843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dZCUDC113hZrfc4/w637u6Evx1aNuEaVcx74j51VyTM=;
        b=uoroKRPzK9rs9wPecKIL+FAsDmGrHpnOBjWXWavpjuNbBvVP8hqk47XarvJK8FiWQH
         2SVd07zgg3VYJSfkTyNR+UlE8gSo9Qj8hJD9X/d0GJt4mePqlDQV/XhHI4+IO26TLVCw
         mar8OwufFS9x5kUvFjEuJUYxpCN0qnmfk+MBlspF1quV4pI77yXYf9KZa5KBgjB+dB41
         YFz2BS4jjU2gxdJ1LaVIEkde+Bg7/m+GnuFCpamRYF15z1fI4Y/QAZQvmaNndQj0o8x+
         LSLg8jPxOtTqIJYb0i27ju0iSVs/0WT5OYn1RHKHNoy4UmV5aQszCxjfUSkbttptVLhT
         kahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680008843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dZCUDC113hZrfc4/w637u6Evx1aNuEaVcx74j51VyTM=;
        b=HoOjPS9Lv8hHCkdNtAKCxqtlyenTcYtLTq082ukyhXr48TRq2wDKYGquB4HFQen5lf
         xgm7W/CrJN0+WO2aaUbMGyL2uegjxSZWoMD4XAMOZfEatHKpFoER3/j6YQ5OeEH/HRhN
         cdVrdbbj1yBHN57bpedfwHDcePra0B6G1oHPRke0yzy4rBnKy1MESSsL1kqLY8opWqEy
         wqB3qy6uY9bGHerGnG/BSr5sMW4y7QL5+3KJVVPxe0fxInpzG6Np8PHm0zDuvPhAWS43
         jdL5NLlvDDdojIq2QvtrQyA/nLCfq8198LgJ6GEqpiJjeKqJjivwAE35nuGVSPh1qkox
         punw==
X-Gm-Message-State: AO0yUKW66Z1F3mKjr648T3r9HOreBkvBCMWh+r46IsbCjEqibtg/E12o
	Ir6rmkRzkj24tmMt1b9SP+Zfbw==
X-Google-Smtp-Source: AK7set+Qn0QNdIv72uD1VA07borwcLXRZGmrN7Ku5Wm5hRlUJq4FRQmbaJsv8P4qDs/N6t3ccpeO4g==
X-Received: by 2002:a7b:c459:0:b0:3eb:a4e:a2b2 with SMTP id l25-20020a7bc459000000b003eb0a4ea2b2mr12130724wmi.4.1680008843401;
        Tue, 28 Mar 2023 06:07:23 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id z6-20020a05600c0a0600b003ee6aa4e6a9sm12733650wmp.5.2023.03.28.06.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 06:07:23 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 28 Mar 2023 15:06:32 +0200
Subject: [PATCH 1/2] dt-bindings: pinctrl: mediatek: deprecate custom drive
 strength property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230327-cleanup-pinctrl-binding-v1-1-b695e32e4f2e@baylibre.com>
References: <20230327-cleanup-pinctrl-binding-v1-0-b695e32e4f2e@baylibre.com>
In-Reply-To: <20230327-cleanup-pinctrl-binding-v1-0-b695e32e4f2e@baylibre.com>
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
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3294; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=Panj4X+b8/VMaW+LvlJ1ecWkOV96Ee2HxiKik6gJXi8=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkIuaJY3OkB+NsfNUaQoH79+5BJZdOW5QZzUOiim6I
 l82EFoOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCLmiQAKCRArRkmdfjHURSeiEA
 Cr6PC0vlcLoWQvViOLHWiZPUEdkJ7pygYavOjfVXwQZXiGfKWBpOnFh/r2b0iIqk5b/XKQAqH5birv
 B0ZqUBzENIP7WN1OnRGEfhA4NP7MCSZiemF+sezKab7p7G9Xs8cwWhl9gIYWqXTpEqDB5GIYZXqkrh
 t53BElPXNzMHS7p3W7svxnmmZwNY+MYfrQWol9ryN29++M/dWfZSp2kHrCo3AMFIf2ES47K0RJNHDZ
 TbkNhMFgtEXeYDYDJyXESMVK7wh7jbeVoquLU0lQN9zL4q4/LVgt76QTRwx2Rn7sns1tCSMHtGco9V
 5CnNK5SYWgvdNH2kxjqlP8vcvnxq5gGW6+f2TuSa38ETnehymWw6atDGzJ5UamCRTWN4PPLk8geTyw
 f/Q9HmWnu9KF8sIJQF3u6xHGHYRt0oo8rEVz7vqxb4zC31UsI73qwsokjfL2XEr3XU3YLC8Wbr0cVt
 prJQVQ7Y5nzqxyxcY916mz43WVFyy9RatPGszh0iM/4yrqutvOUeKBsSUtVmG2iZYv+bs7Rz6gPn6a
 yUIBHH5La8RcOzfEZb0JEJp9XGsRGeZztlqmYAeyJUR7ynR7FGBHhQFwFIpM+lD2mx903Mzx3Kxabw
 PKMuOqKmpa103h7u/dSQNnoIQrl56u5rgcjUDB7XZodnJ7TPG7wb0BtDDNzw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_060726_252037_21A5885C 
X-CRM114-Status: GOOD (  10.98  )
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


