Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCF0C4167E
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 18:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0/WfzvHJubbv56pooqVBj0w476tmu7QbHTTDbRCIA5E=; b=Cb0EpMB+yUT8YsPUOwoRFglVZH
	ZUdfMNgIhQn/S81UkRlR72O6gfKhkBm13epU5ddf0MfAzcuFAb4hCsYzY0tzsxkrqmAHP0uWC/9GR
	0O/4Kdv5eS16NpjMDhe2TMRK7k52pIfdp1lnq0yKc0OL1imRzLRxB6ErcjMrPPEdGd0NeDZUUkvo5
	GuUWKg0Xkn1D+Q9vYg1LWj6dg9SIVEuaJqsuBRrkLaee+2tssTUwWkVNz55bZ5v1yDk+gLQj5kcgj
	SMKOFWXYr/f2XdBCmC0D7ZnAVcBjjcOJCr/AmlJU7klI7SucYu8Ls9cJh1nD+wQd/vdmEbOKolO5N
	CPjzMlMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osTaI-007a31-NL; Tue, 08 Nov 2022 18:44:30 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osTa8-007Zp1-9x
	for linux-mediatek@lists.infradead.org; Tue, 08 Nov 2022 18:44:25 +0000
Received: by mail-wr1-x42e.google.com with SMTP id g12so22377093wrs.10
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Nov 2022 10:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0/WfzvHJubbv56pooqVBj0w476tmu7QbHTTDbRCIA5E=;
        b=TewWiwo/fKUKHnrl/jdGAA26gbsYfnUGzuWcy1Z6I8182suw87I83Z6VUuQrsVqIgV
         8eYu6BsyAZSa2Nbii6LBsVNDvsHOXsbu9sQiuVGO3cAJ+MaATm0I8yqJ0Xw8ffODeFyL
         oTtw//bUxz0QR9Rh/ZOuKZkYUjsGnf9FlVVE5pDQJCY138jZVgeOhO4agYzEX4G5dVHx
         8mhro01GcAXguWqqFwAsc/+Jrq6ya5VG5hzHT+nBE2q+KKQIyaSgn8PzHEezPJsZWA2V
         aPgzrhpztrn9y9rs5z0CAn2TxZ3lj53L1G5uTCW/ogDbt2i3PrGJkAnF1k6Ihwz+nclx
         vZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/WfzvHJubbv56pooqVBj0w476tmu7QbHTTDbRCIA5E=;
        b=M7Oc/7BZedqUXGIK5OqykAez6RWdH+RSTVoOJxkMYJ/WO8zuC4ilsGwDZMdk0BkR+3
         Bxh3gr79qaDbyH/dxRGQtB5l9Qu+JNBy75Hta1tDJkkvu3i/jd5OD6A6OH6l/ZDbp8cU
         Hk2lO/ExGvosSXT+CSUA0rYsObDnS9mz7Jwicj62UWZU1BzRO0N9p/a29etpw2uKRpga
         EUmrZQd+H2FC9K4pNWENJqahRBxOSYSpb0ZqoZ/3byLkSP2kQHC2Lcud8zh58XROMuXz
         PiAT7tb/cqoUQHOrQcCdkOORHKPX3nffbKqGzsc+18NO9yVlCdSzr2LB6YARgbgxfAsy
         hIlw==
X-Gm-Message-State: ACrzQf36lzGRN7gKFyhR4ql3fgxZzMckDWORJQu8gDh3ZlEBgXy7fdKW
	yhomMcDSp0j7Y89iG/cwC8vWIg==
X-Google-Smtp-Source: AMsMyM4GRByfBs2rOhytOJLVqo5arouXEthW3hO7pFcl3jL2IFAN0WwzGLcg7+E4ljaUFdtb9RkLag==
X-Received: by 2002:adf:ba8f:0:b0:22c:def3:1179 with SMTP id p15-20020adfba8f000000b0022cdef31179mr36812897wrg.571.1667933054732;
        Tue, 08 Nov 2022 10:44:14 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id m6-20020a05600c3b0600b003cf6c2f9513sm13564009wms.2.2022.11.08.10.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 10:44:14 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 08 Nov 2022 19:43:37 +0100
Subject: [PATCH v4 2/9] dt-bindings: rtc: mediatek: convert MT6397 rtc documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mt6357-support-v4-2-5d2bb58e6087@baylibre.com>
References: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
In-Reply-To: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
To: Fabien Parent <fabien.parent@linaro.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Chen Zhong <chen.zhong@mediatek.com>, Alessandro Zummo <a.zummo@towertech.it>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-leds@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Fabien Parent <fparent@baylibre.com>,
 linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3705; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=/h7YGXK8tw+BLV0bfVCW4btQXGCozMogPt+Hd7yMb0w=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjaqN6CcEIylfYlBT9eGuZhBXMu2i4n3Ib1lYHdH1n
 C4gPsFeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY2qjegAKCRArRkmdfjHURVVaD/
 0RFrYM5QhJtj1wxw1WP8Su/8jf7SX9w6CEJdEwgOv8MoNVRPajQAS1CfjLMls9gf9+mBKCXnidGzPM
 bDWm+UFzkoCFRRfvNaz03yHPv/xtw4d1Mx68maavKuNtPHP4G4A1b4nK72gTK06NCa3RDJ/0LO94kJ
 2szrH6wmsgb2qAIMxhv5J8IFuVg4KlGa0/GKRz2CNljD6gD33IRqmel1gDHoPLxcKgqRnTVleGNZOr
 obiskESHGXywTJ8h3BABgXOCUbnXOnSscs7//0XL4e61yBMOSQmeQV9e6xm9Ia1ZR3o+IAywUazdho
 GihclUAEcvj2Lgwu7T/xgwYy4zt8hbvK9M2m7JC4hRhtdrNMjPYpuj/irv5uAUVafwyP5PK4tAdnkU
 EOeTLNmgd4xgCbgVVB8hgA0Cuxfrrp1+CG4y0Y+NIBneVy3ghLzMgM1wDwTCC+BWlRaPBp1n/4tgCa
 1v7AsxSaYYhb7wEeKQP//eBC0mrsfkQ5xx9MbhDWB5qq02BCwjfHci9hPcJ9YSGWQehuyckkmLIyKx
 fxLuAqts76aL7lWlnt+7GplIKMWrT6ORB9Lq79G2j4VVY1SM8TXFgoHUpBhYhFtDoCggWrehJLnEl4
 hLr4Ae2OS/ZHx0MFVFeEJJ8C/A0cs4jE2IrLSZhbLGxc8tYCtZWq/Z2j49aQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_104420_355620_7F931173 
X-CRM114-Status: GOOD (  16.81  )
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

- Convert rtc/rtc-mt6397.txt to rtc/mt6397-rtc.yaml
- Add mediatek,mt6357-rtc compatible.
- Add maintainer
- Remove the .txt binding file

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/mfd/mt6397.txt   |  2 +-
 .../bindings/rtc/mediatek,mt6397-rtc.yaml          | 40 ++++++++++++++++++++++
 .../devicetree/bindings/rtc/rtc-mt6397.txt         | 31 -----------------
 3 files changed, 41 insertions(+), 32 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
index 0088442efca1..79aaf21af8e9 100644
--- a/Documentation/devicetree/bindings/mfd/mt6397.txt
+++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
@@ -33,7 +33,7 @@ Optional subnodes:
 		- compatible: "mediatek,mt6331-rtc"
 		- compatible: "mediatek,mt6358-rtc"
 		- compatible: "mediatek,mt6397-rtc"
-	For details, see ../rtc/rtc-mt6397.txt
+	For details, see ../rtc/mediatek,mt6397-rtc.yaml
 - regulators
 	Required properties:
 		- compatible: "mediatek,mt6323-regulator"
diff --git a/Documentation/devicetree/bindings/rtc/mediatek,mt6397-rtc.yaml b/Documentation/devicetree/bindings/rtc/mediatek,mt6397-rtc.yaml
new file mode 100644
index 000000000000..bb48c0150f95
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/mediatek,mt6397-rtc.yaml
@@ -0,0 +1,40 @@
+ # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/mediatek,mt6397-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6397/MT6366/MT6358/MT6357/MT6323 RTC
+
+maintainers:
+  - Alexandre Mergnat <amergnat@baylibre.com>
+
+description: |
+  MediaTek PMIC based RTC is an independent function of MediaTek PMIC that works
+  as a type of multi-function device (MFD). The RTC can be configured and set up
+  with PMIC wrapper bus which is a common resource shared with the other
+  functions found on the same PMIC.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt6323-rtc
+      - mediatek,mt6357-rtc
+      - mediatek,mt6358-rtc
+      - mediatek,mt6366-rtc
+      - mediatek,mt6397-rtc
+
+additionalProperties: false
+
+required:
+  - compatible
+
+examples:
+  - |
+    pmic {
+        compatible = "mediatek,mt6397";
+
+        rtc {
+               compatible = "mediatek,mt6397-rtc";
+        };
+    };
diff --git a/Documentation/devicetree/bindings/rtc/rtc-mt6397.txt b/Documentation/devicetree/bindings/rtc/rtc-mt6397.txt
deleted file mode 100644
index 7212076a8f1b..000000000000
--- a/Documentation/devicetree/bindings/rtc/rtc-mt6397.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-Device-Tree bindings for MediaTek PMIC based RTC
-
-MediaTek PMIC based RTC is an independent function of MediaTek PMIC that works
-as a type of multi-function device (MFD). The RTC can be configured and set up
-with PMIC wrapper bus which is a common resource shared with the other
-functions found on the same PMIC.
-
-For MediaTek PMIC MFD bindings, see:
-../mfd/mt6397.txt
-
-For MediaTek PMIC wrapper bus bindings, see:
-../soc/mediatek/pwrap.txt
-
-Required properties:
-- compatible: Should be one of follows
-       "mediatek,mt6323-rtc": for MT6323 PMIC
-       "mediatek,mt6358-rtc": for MT6358 PMIC
-       "mediatek,mt6366-rtc", "mediatek,mt6358-rtc": for MT6366 PMIC
-       "mediatek,mt6397-rtc": for MT6397 PMIC
-
-Example:
-
-       pmic {
-               compatible = "mediatek,mt6323";
-
-               ...
-
-               rtc {
-                       compatible = "mediatek,mt6323-rtc";
-               };
-       };

-- 
b4 0.10.1

