Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD95C76196
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 17:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/PKiRdK/AdCxhQPLVxp6qRTTYRDZGG0+AZ8Pt0BlOY=; b=wUJ/easDhHUhZb6gV1VPtIldPX
	VwuuwdY/k4ErLQxDTlQbV+I1ln5K6FFyHC1dAEBttPnsCpNqfxxkIbhFs4qzsprzHd+IJMg3KTH3i
	yKXk7uHg071g5IisHEvk6Gpy+NmKZ4mPpFJV81Jpl5de4uGA1qrsHLhB2jsPaefJoxMthpnxv/RxA
	DQv9JeEqFRRb/Ae6i6522gJnIWeJXPQDrdp17s87+FsVSiNi7o8FQCZ3wwZVV0S64eEZDMEADt1iQ
	h1a/FLNawxFQDopJslD+rjZKsmpdmKGjfYPXnz0CWQEPJkM6YNTOS5cwJsdf8kqjf/qyYmdIE2qWu
	saKCCXxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piIj6-008Jjs-2l;
	Fri, 31 Mar 2023 17:39:48 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piIif-008Jaz-0C
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Mar 2023 17:39:23 +0000
Received: by mail-wr1-x434.google.com with SMTP id l27so23227179wrb.2
        for <linux-mediatek@lists.infradead.org>; Fri, 31 Mar 2023 10:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680284356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/PKiRdK/AdCxhQPLVxp6qRTTYRDZGG0+AZ8Pt0BlOY=;
        b=xb2DAmdVIUD0mU4ZM/DecBkaOGR5wsQ6d9c+8vO0ZCq9EzXbbrDYS2OikBJmEMDjs2
         3dCeGNehnUlRSkQ0uuFsk99EuTCG6pU/RB42JLRqfZq+YwiiCEg3GkRCGtDrfp65MPvk
         McAhpZ5R5z/KSekNsSBFlBAhnFaOJDb1pS5Lbk9sEfGD0scfLOR0YB2LKFz4WJ2S7qLt
         5B7CxaayfziYW2P+NHWNaSTZnRQK/HEAoBRY0K9Nt3U2WUQkHT0Koy3gpxJCjN2B8yK7
         xH5fU5UoS2UGd4E3Vsjom0Y1dEvrbPdAypLr7NSdLGwv9fZsWqf9jn0jutUntQHSkHEc
         Bj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680284356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h/PKiRdK/AdCxhQPLVxp6qRTTYRDZGG0+AZ8Pt0BlOY=;
        b=5cuBOxJMQ5tyCSsxzOD3BblGkzaDF18WCbRgEkCY4yWl7kymy92K/eODuU0rwGTnKg
         FqHyTLTfKsp5iHJ44UEti45KOhYxhMzvWgLSRRYRLYF+ZSdmtTp2vg5ql1GW0IT9Fksc
         jjFPRZ3JWpsRtOZztKnxcTQO2gUYaL28hMvdPze3icvuWbGQ/NwCq/cP37PneD10WR70
         on/bmTh8nVXDhvCYrOQVdH2qCrDQ+Iap7810WGawkDDtFecKNStA3B7hzAwyXSFApZYG
         VZ/DS2O5lkYa/54YTKpgslJUdnH9IZxzNwyME0nSAO+Vqkacps8k0vu+tSSUOJmp9YOR
         ARvA==
X-Gm-Message-State: AAQBX9cifUpwHMbVLAkllvVVOUZNVa9+Wr7r6K5LhVl7BwxY3xnYbTDu
	4OFpqG11UYNH6d4J/G/M9FMeNw==
X-Google-Smtp-Source: AKy350Z5qBmyx03YFMY4exnOGUjSMNVkNU5SbYP4fhFOR/ObMcOrfWTagg7GiOvZeoINCeNRFUsb/A==
X-Received: by 2002:adf:df88:0:b0:2c7:604:52a1 with SMTP id z8-20020adfdf88000000b002c7060452a1mr19563658wrl.29.1680284356630;
        Fri, 31 Mar 2023 10:39:16 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id o5-20020adfcf05000000b002c592535839sm2733550wrj.17.2023.03.31.10.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 10:39:16 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 31 Mar 2023 19:39:00 +0200
Subject: [PATCH v2 2/2] dt-bindings: pinctrl: mediatek: deprecate custom
 bias pull properties for mt8365
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230327-cleanup-pinctrl-binding-v2-2-f21fbcc3016e@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3599; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=99/zsAro4iog0C+4jUroqtzB5pHnwrzuYQWT6NZAlsM=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkJxrBc+oHkE+9tNrcKZp9r++zV1rP91TNBZwe1D7T
 WVhYllSJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCcawQAKCRArRkmdfjHURX9rD/
 4pfi2lithVMijjiYZPLKnaAHoQGss4png8T9snd06mrSkSOW/XHJ2DAT1vj2Z7F1du3OZJIIFBKusu
 Sd9Mqwb+IbwgfZI3arRrv1PpkSmUFh5SrT6bNkTr1ghyc4P7wm/mvz+jxgZawAbczk3AzHnntrAIEF
 cPm9MWc9KGbD9m+6/0mwxapjLBl82frEvCSxiLp+MQzcFjBtz/JOek6v5L7OIcZO/P94n/o3xrKmwz
 8Rz01ll2XoQaL27tDO8YX/7KTZHOtHeCmrjh9EuozCidfCP8c2THTy0KTYQbzFA2mNjtr8QDMCjJeq
 /xDGnAyYZ5VMIUO6OC5dSnh5eWhQLQwYFOykT7ay67Ir9APCeh7Mube5RfnKowcy4qIAkW6r4iO4dz
 o+iinLYMwXIckKCvvraBH6yQQ8BA4SzcUHNrE4klJ2fKd5zEdOGw7Em2nwY2m86ytSXOOkr6wm9tel
 NVLSOQCeHGrdZJ+bHaJ3G01RAyJ0Exun25N4soIioWmNJyc4B2eK83S4jJZqeegWFFzg+HGhDffcGD
 kq9V1VNom+q+aPhy6w1owWIi2sY9DqsXZHQBeZ7SiorT/SGU3CEd4+ovuVkwJixAyYFsXxVpR2W/X5
 cd7P//yboXTqXP1AzX8+zN7MWeZCZvYNl1YjUL9N5kw6zBgtjFyfQJKuKRAA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_103921_117959_2B2ECBDC 
X-CRM114-Status: GOOD (  11.02  )
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
 .../bindings/pinctrl/mediatek,mt8365-pinctrl.yaml  | 32 +++++++++++++++++++---
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
index 347f533776ba..2ce6a69b0bf9 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
@@ -72,12 +72,32 @@ patternProperties:
           bias-disable: true
 
           bias-pull-up:
+            oneOf:
+              - type: boolean
+              - enum: [100, 101, 102, 103]
+                description: Pull up R1/R0 type define value.
             description: |
-              Besides generic pinconfig options, it can be used as the pull up
-              settings for 2 pull resistors, R0 and R1. User can configure those
-              special pins.
+              For pull up type is normal, it don't need add R1/R0 define.
+              For pull up type is R1/R0 type, it can add value to set different
+              resistance. Valid arguments are described as below:
+              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
+              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
+              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
+              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
 
-          bias-pull-down: true
+          bias-pull-down:
+            oneOf:
+              - type: boolean
+              - enum: [100, 101, 102, 103]
+                description: Pull down R1/R0 type define value.
+            description: |
+              For pull down type is normal, it don't need add R1/R0 define.
+              For pull down type is R1/R0 type, it can add value to set
+              different resistance. Valid arguments are described as below:
+              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
+              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
+              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
+              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
 
           input-enable: true
 
@@ -123,7 +143,9 @@ patternProperties:
             enum: [0, 1, 2, 3, 4, 5, 6, 7]
 
           mediatek,pull-up-adv:
+            deprecated: true
             description: |
+              DEPRECATED: Please use bias-pull-up instead.
               Pull up setings for 2 pull resistors, R0 and R1. User can
               configure those special pins. Valid arguments are described as below:
               0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
@@ -134,7 +156,9 @@ patternProperties:
             enum: [0, 1, 2, 3]
 
           mediatek,pull-down-adv:
+            deprecated: true
             description: |
+              DEPRECATED: Please use bias-pull-down instead.
               Pull down settings for 2 pull resistors, R0 and R1. User can
               configure those special pins. Valid arguments are described as below:
               0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.

-- 
2.25.1


