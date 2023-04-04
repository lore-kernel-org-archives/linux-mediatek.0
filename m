Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EAB9C77B62
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Apr 2023 16:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fPm8iQsu3PXiX9UtaaXxTfcyhiLnzUQ0oS0z/eHP0Q=; b=KiYWmuAdRb7sw8ZZuv2z1KQUFO
	KLF+OQf1tQITcO1hbHMpHCzNofqLzeiwaWaAHH4hk6sLjENB/0+aopOxUBQ4z+3HQCmSkymHCfgXP
	5iUWUlrc/t8lpRMYXxjdqCG1ZEJg70wbb0bm7Nib2ndrjdrpdHwjmZ0vhMoFRmVLKk0nKF3gudTRQ
	btRVIHy3QrnsNB+JFgjvGg6Mq5CP9AIVPwh2uuPA1PLX6gKfDVAfbugBvSwsO7aF7sqAjvhws8P5M
	S2azf9DiW0I3BmKg1dhKMlTJJKdBa6pjW1ceuOm2dXl41IozbByVdmnjmV8t2h7Q/jaNzcySXJZx4
	2B7unIvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjjY2-002CtE-1u;
	Tue, 04 Apr 2023 16:30:18 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjjXv-002Coq-0M
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Apr 2023 16:30:13 +0000
Received: by mail-wr1-x434.google.com with SMTP id l12so33428841wrm.10
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Apr 2023 09:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680625808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3fPm8iQsu3PXiX9UtaaXxTfcyhiLnzUQ0oS0z/eHP0Q=;
        b=5E1/4PXVI7xXROdgc5cyA/ZMG0OFPxq4oeWNkd0Rw8a6F2q1/paBLSCJXDfRzd0bsS
         /WnfsJ30PiYsL8G05UGSKwitdTtTl46Vn+1RduG1Y8VsdnZzycM7dQActoFlKLpTnc0g
         BUVs8Zk3dVojT21P9//DRM/0GC+GNemGV0jM449uICgCb4SSCpL5xxKYNi1eXdMf6zMU
         Yr/pSzoG5gmNVmUQc5KXWUdwxpoD7f7xxCPWoLLQcutUxTPSXz0wKgjABs3n1QZDnRmq
         tbJ1g7QUuOruh/NBYTy2G0yvT3UJ0TOKKGX280/VfcEia2YSjRi3oAw8mhFg/tXUNFmg
         QGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680625808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3fPm8iQsu3PXiX9UtaaXxTfcyhiLnzUQ0oS0z/eHP0Q=;
        b=VE3TNDI8Zf/6WZB/4OHXwiDOKw/Nh6ucDKaa/5bRkn7LXFLeS8koJtvFqOB65LuL4P
         fI5wsy3TMKr2RSnIO8dFXS/xSfYX8wSzzAvdXTyllt2KJBIX6xd1+mMoCU6JCVcIEAZg
         c+2tLvl2UgWv++1344Y7AIQGyDQk2lO9rMg3ETxOKU2iPjPm67jxGDU2g6FwwzvoXH60
         5gG4+7aNtg0PICQzgUJl1S/dkLopVbL3482zft0gor/Ttt00kFo7rdQ2y/AwL6M2mgLa
         KZlmn0FFXDzSo87YW5wuUdHlCI/4/+CjJHSEvYvVb8+hDUyafTaaOIwo7UwlFUw/cthh
         TKpg==
X-Gm-Message-State: AAQBX9e744s1pmyCfB2LncYXzk3L3ajl6jXqeWLC8nJHbErLpwtOYJcx
	qz4/85WkVYh4B6tfZbrWuyLjrvFGtrZmbRLDlYw=
X-Google-Smtp-Source: AKy350bwZoqlEwBDskiE/IRsA/yOqgpI3H9hlO1N+VWFVxHr4VsbBmVTxxuq7vjbwzpT/l0hydSY0Q==
X-Received: by 2002:a05:6000:150:b0:2e3:7dba:2ba6 with SMTP id r16-20020a056000015000b002e37dba2ba6mr18924wrx.6.1680625808715;
        Tue, 04 Apr 2023 09:30:08 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id o7-20020adfe807000000b002e4cd2ec5c7sm12694528wrm.86.2023.04.04.09.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 09:30:08 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 04 Apr 2023 18:29:50 +0200
Subject: [PATCH v3 2/3] dt-bindings: pinctrl: mediatek: deprecate custom
 bias pull properties for mt8365
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230327-cleanup-pinctrl-binding-v3-2-6f56d5c7a8de@baylibre.com>
References: <20230327-cleanup-pinctrl-binding-v3-0-6f56d5c7a8de@baylibre.com>
In-Reply-To: <20230327-cleanup-pinctrl-binding-v3-0-6f56d5c7a8de@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3521; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=cP3MabLj1zpNPUMZqw1OhrEkYXQOUITPoTif+rF9fUo=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkLFCNrywDsoe4jiH3UnujVAgYQWtf/M/OJ9ie74fS
 SEm2uuOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCxQjQAKCRArRkmdfjHURUAGD/
 4rxS8wtQEth/9IobGOHJfI/HINziRRF1RJfBwgOrmugJEiX5KDAXwrdpCMZUoiaeTT1hSRssT2fnj9
 fslNrLhBRsa3cz6OGGifGYS8apFf5sK3Quy27OudNuU6F+Rg7ruxz2PqKaR+UvhCIKMuwJ7Tyw62EC
 YGfJl+ZstFxNXNDVR26cpvxyH45/ZNhKCdxHr0mJBsal17l28k2Ri34lNtcOgidN+DaxljMcr9k1FB
 Xj0G7ki9izG9/ODbKW0KtMXRtLP9cMNPqoFPp1QNiBWFxEul1MXgkpHmzGbrrSaRzaUEqGvVoyjGEk
 iUduZQLARerRovAoKlE/wH7CCqIGX7wIgwdsPfd1YnsRPGNfqbEis7RXkPLLVlnoxjwP3JfO+xyan+
 /f8UuUS4cmwGUyWi4KLo7cjQqMjyPj1CM+h+uegVWOc3laYlAFf/oES4iZCpEBIvu3GbnXN4VY9umf
 42JEpI6tuznQuCXt5Q1KAhzt4exAywjLRt4gsyOtiWeBAfrN4wYuStiFULb9BZQyKZLEcjdb9ueAOM
 G9QVEmXUGI2ej+bEP/Ni0zMPb1HfY1c8eWir+Zvc/cZhcZsMMayXHWe9Caaohw5+WLuJu+1dANWoN6
 4khAKkueNtCUTCeI/9iaOOcVFhS5+peIYwmHnMQT33BgGOo5ZJhbxOYtX2kA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_093011_163656_9BCD6E8E 
X-CRM114-Status: GOOD (  11.20  )
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

In order to be more generic, "mediatek,pull-up-adv" and
"mediatek,pull-down-adv" should be deprecated. Use "bias-pull-up" and
"bias-pull-down" instead.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../bindings/pinctrl/mediatek,mt8365-pinctrl.yaml  | 36 ++++++++++++++++++----
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
index dce9fd1a6a72..75d74b92c767 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
@@ -72,12 +72,32 @@ patternProperties:
           bias-disable: true
 
           bias-pull-up:
-            description:
-              Besides generic pinconfig options, it can be used as the pull up
-              settings for 2 pull resistors, R0 and R1. User can configure those
-              special pins.
-
-          bias-pull-down: true
+            oneOf:
+              - type: boolean
+              - enum: [100, 101, 102, 103]
+                description: Pull up R1/R0 type define value.
+            description: |
+              For pull up type is normal, it don't need add R1/R0 define.
+              For pull up type is R1/R0 type, it can add value to set different
+              resistance. Valid arguments are described as below:
+              100: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
+              101: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
+              102: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
+              103: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
+
+          bias-pull-down:
+            oneOf:
+              - type: boolean
+              - enum: [100, 101, 102, 103]
+                description: Pull down R1/R0 type define value.
+            description: |
+              For pull down type is normal, it don't need add R1/R0 define.
+              For pull down type is R1/R0 type, it can add value to set
+              different resistance. Valid arguments are described as below:
+              100: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
+              101: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
+              102: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
+              103: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
 
           input-enable: true
 
@@ -123,7 +143,9 @@ patternProperties:
             enum: [0, 1, 2, 3, 4, 5, 6, 7]
 
           mediatek,pull-up-adv:
+            deprecated: true
             description: |
+              DEPRECATED: Please use bias-pull-up instead.
               Pull up setings for 2 pull resistors, R0 and R1. User can
               configure those special pins. Valid arguments are described as
               below:
@@ -135,7 +157,9 @@ patternProperties:
             enum: [0, 1, 2, 3]
 
           mediatek,pull-down-adv:
+            deprecated: true
             description: |
+              DEPRECATED: Please use bias-pull-down instead.
               Pull down settings for 2 pull resistors, R0 and R1. User can
               configure those special pins. Valid arguments are described as
               below:

-- 
2.25.1


