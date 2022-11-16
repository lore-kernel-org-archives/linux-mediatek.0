Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08528C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Nov 2022 12:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oNAGHgKQfdNYz52YrL6tIozDgteaJnMtrOIqvPNzMhg=; b=GVezn3k8RF/iGZSCxBg5aZTmmj
	J7Pp7/IHG0Iz6tdSAqFOjZnrY2ojUYQI9xYpaqcrA5fgj6cKRKKaVNA+xmFLUKgoUJXDTXQ1/F09G
	p2Up3LmojPZhhaL13PBNrJhWcHbB+t+izWS4R2ohITLFiF47bTtxUw1Gg17CZIIQ/yYykjK5KH2b7
	jS44JrJpJ4EAKfH2w6IuxNw4NAZYF0vxK5qxCextjxuDWc5uklfHIXvTFM8xNWYlN/DS7KGtbiE/+
	mIKymXDSLTTAyEOWHsiEsrSHHZ8DZcIwomRMRM5sUdIrjIU/zuBuGBukoiD2mJPbMT7ttCho5AWvs
	b3Jw0SKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovHcx-003RGc-Sl; Wed, 16 Nov 2022 12:34:51 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovHbn-003QbP-Ns
	for linux-mediatek@lists.infradead.org; Wed, 16 Nov 2022 12:33:43 +0000
Received: by mail-wr1-x429.google.com with SMTP id v1so29651145wrt.11
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Nov 2022 04:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oNAGHgKQfdNYz52YrL6tIozDgteaJnMtrOIqvPNzMhg=;
        b=FV/HSHXNcrRrqBJmHz+FqbLbCK1BkffXtZM77vZX9eDe6p7siNq5B8nQcLLmNDS5w7
         Xn4j656GAMQcICkOZaoB6Dl+gIFBSJeVMgM/VagVTIwiAYTJCCkc+SrtKAwlOmz0RSHi
         wPzMZqpVlejCHYtkv2LVPB1KX8ywyFXORrL/BWqL5DUiTAz+B27hZA+JSNEMG1bbuGLT
         15qMsONxjxVyp3znSvgS9ViDjxL8wHcSRtUzGQ7ghvuvbF1cO1EE3hqhjg4yr51bplur
         EY0YSZDUMA6UhrfMLeKqGJVWyheA0mJxrd0hLYbyHLPHXzPv/mDhtp0sM+25PQxxJxbK
         MsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNAGHgKQfdNYz52YrL6tIozDgteaJnMtrOIqvPNzMhg=;
        b=bmrSDsP7SPyhWPUFH0C0d38E40yZnRRrtBj3uI9RNleFvYRZfdo45/HCsgccvd4Er9
         u1WX0+1OVfulaa8Km+TJj4bLmhwxmcCJDs8dMiTz6CZfbFtyOch561zwXdOK2qKgaYwl
         gxPTCBsH9hLx3olAYethgmaXfaQvpeicHwzNf4J89vKdgJYlYQA49HSTUZuGnl6Mxa96
         KB5mWSxxdPEFo9ADF56Dn4j/2zWNk6IZOuBsIhTj0NgejEe2wrp/qY4xStXb7Q0XXZwU
         rK3QchT6ab08F20tbdGlImt5tjadwwUwuhkOmDFdTkp3f4CISU44k4NWbIZtBU5+rctY
         6N5g==
X-Gm-Message-State: ANoB5pn8S/z+u2vb4QhNSmiNiM9qtY6T6govZRPInpdOaxLmXrJKVbjB
	cCzezmDOEvZ0VElYjHeDkvt9tg==
X-Google-Smtp-Source: AA0mqf5fnCwQJSP0dEEGd0P6GY8cmjlR2j/Lo9/ly8wQoWpPbijkVoom+8SCPVlCzBPLmFgLQ6Nclw==
X-Received: by 2002:a5d:6252:0:b0:235:25b7:5084 with SMTP id m18-20020a5d6252000000b0023525b75084mr13597976wrv.135.1668602018230;
        Wed, 16 Nov 2022 04:33:38 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id z13-20020adff1cd000000b0024166413a4fsm15051607wro.37.2022.11.16.04.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 04:33:37 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 16 Nov 2022 13:32:56 +0100
Subject: [PATCH v5 02/10] dt-bindings: rtc: mediatek: convert MT6397 rtc documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mt6357-support-v5-2-8210d955dd3d@baylibre.com>
References: <20221005-mt6357-support-v5-0-8210d955dd3d@baylibre.com>
In-Reply-To: <20221005-mt6357-support-v5-0-8210d955dd3d@baylibre.com>
To: Flora Fu <flora.fu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Tianping Fang <tianping.fang@mediatek.com>,
 Fabien Parent <fabien.parent@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Mark Brown <broonie@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Chen Zhong <chen.zhong@mediatek.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh@kernel.org>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, linux-mediatek@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-rtc@vger.kernel.org,
 linux-input@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3687; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=bgTXwPzyd6FKEaUqDbIPVK0cW0K3Wt2nexsVI0k4GvA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjdNie/0nfbIeSBs2767maC3sOK+AOvXWyp3zfFzK8
 aHPdjmyJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY3TYngAKCRArRkmdfjHURXobD/
 4w4dIX0ZyQIB72yfVZW5deAwSwyPwWxUftc8sKFy6nPu+/Pkulo1OPj0Py4nKAnJXp2EJz0l1NMR0A
 L4GEiZqTQ7I82pvPIoGMe6rP2G3KAPSlAs7ftXUg0DiQrO1UDZVptQKl4wKC7TLzQFFdD+41Rv4fwQ
 5QM/d45Z+cPsOBXhQN4ULawAXCJXXc9W73n+lL19eFRr+doETI22gAFQ3IIQKbrtJFg/wZM3TxElOr
 McJ2Fmys7SO+WtNMtUYhJ0bT10ICTFUyD9bcniRZ9oVXG1CKN5KdUvE//cD3lWO6yoiEfcXHmM8yaC
 TX6mWkiaX1tFxkDEpBQ21p9YSKTT8Z36OFtUBrM21rk4WLEDCR4k1QnhSomSmPFibq9JZ63b/GVNf6
 xABd9E2K5meLOCmCLTsT2Y+mTXAIIxVUxkHAR2pAUVF9bF2cGS/HZ4kGc8ev+FPLwsM/CJJcbVLZuN
 eXqMRBDDI5/PcMFPgG166G4RfQM26WNrvzh+5PMAa0Ct91zLt++GVQPHNLDmr6CZAmW02lhpIVrXwv
 r7I5s3ghydWK3uKNPpqeqTEa3KPfv6iJOUY6TL6BQP9wKERlVnTGSBBv4I9owvbBf00YbyMXwvYlHd
 Ocvx9OesU/VfqlhCwDPiiLnRCwnChrq6rRdUqmU7wc69Z7o+xbCPMiJHMo1Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_043339_801279_7D3215D3 
X-CRM114-Status: GOOD (  16.47  )
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
- Add maintainer
- Remove the .txt binding file

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/mfd/mt6397.txt   |  2 +-
 .../bindings/rtc/mediatek,mt6397-rtc.yaml          | 43 ++++++++++++++++++++++
 .../devicetree/bindings/rtc/rtc-mt6397.txt         | 31 ----------------
 3 files changed, 44 insertions(+), 32 deletions(-)

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
index 000000000000..f5a323597f1d
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/mediatek,mt6397-rtc.yaml
@@ -0,0 +1,43 @@
+ # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/mediatek,mt6397-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6397/MT6366/MT6358/MT6323 RTC
+
+maintainers:
+  - Tianping Fang <tianping.fang@mediatek.com>
+  - Alexandre Mergnat <amergnat@baylibre.com>
+
+description: |
+  MediaTek PMIC based RTC is an independent function of MediaTek PMIC that works
+  as a type of multi-function device (MFD). The RTC can be configured and set up
+  with PMIC wrapper bus which is a common resource shared with the other
+  functions found on the same PMIC.
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt6323-rtc
+      - mediatek,mt6358-rtc
+      - mediatek,mt6366-rtc
+      - mediatek,mt6397-rtc
+
+  start-year: true
+
+additionalProperties: false
+
+required:
+  - compatible
+
+examples:
+  - |
+    pmic {
+        rtc {
+            compatible = "mediatek,mt6397-rtc";
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

