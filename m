Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911EBC67861
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 14:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HbAnGW67+sD3j4bFEEGXSjEWjYNqBQKOwwBoksUT1QI=; b=UY/sYcLiItB/4zLAf/c5KwcDSb
	Wjfd2FN/swnnafj/HY9i3toippRNo1/YgAvriCDLgJVluI/KYUYEweIaBCpImDInCrV55seJXjGCG
	sYXuiFyy0eJCiz8TOB7svE0B5rU9DFV8BdmPoVvmMZ/hObSlbLZCi1DW3MufJWLJIcgpjdP2S+1pn
	e9KJ3mjExMFCwLESKw/mScbbkH8C8uDvV4PdWU0R9y2Vzv4UKsoex6zHJxoUrkgICj8+LfGnpFBXE
	WGZ39VBPmIcKIL/V0CQ8caLAUpLlKiEWPa0V1fP1D/22TJwd9wDV7gR8oK9g+DE/m3xoN+96xNljU
	gx1UQIrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruCkp-00000002VLt-3xmR;
	Tue, 09 Apr 2024 14:47:20 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBjq-00000002CEJ-0jxi
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Apr 2024 13:42:20 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3455ff1339dso1959752f8f.0
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Apr 2024 06:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712670131; x=1713274931; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HbAnGW67+sD3j4bFEEGXSjEWjYNqBQKOwwBoksUT1QI=;
        b=nT+FaLAQiz7k0Af4+laV9YnHGCafojGBH2pUvlw+x5OAddX+yYgx5TwXephSwTLbmO
         Vl1h9dFMByGymAcJe/AyjIgmbnUthD375WoD23fbLCZ2bJ7pyortAFH88H9xle+oi+e7
         w3cSNjuu0yprhuhzlD9FdPLWevacyLlmrubxadoM6nEj9YmuhUh/gPsVVMkIYwqXK5lQ
         HzN83hDmFZApMnGP6sBf0gEx22dH126LUNgkxooU71tyx9JunbkqVi9vdb2QSU8vhS8b
         TckI6At66DTsEvWyVJWQ5SHb3CHnf7fuu4mFoZznkvQ+eqlnYA0RdpD5C+cccXJFRL8E
         0GeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712670131; x=1713274931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HbAnGW67+sD3j4bFEEGXSjEWjYNqBQKOwwBoksUT1QI=;
        b=dstN6iKrz/7RkZP7kBC8PrYWj8+m+b3UrxnOSMVCfVoTJc97EveOH9G9oV8KjucavS
         5AMDG/vRiw1B68SS9rJqQjy/JEPy2RV9Rm54rkEjvhyGOYc0jfLTU5ZqoRvWyho/41x9
         gkTCF8A6ZkFuCVn6cpP692mmuolijdmWUoYq0rx+8rzngrCPZCVQhkEOmIwV5/QUE+sB
         j4Ja01z4WScV0JibofmAVG5ToMk0YYRs+2MVQGmi0XJahLk0jSL6ofU2mGTf3hUzFpEd
         086YV4M9hyjNX0d6qAiJT0whv0yIJ5y4/FsqKJpetOTlaWgrzZVI/evyFCXx72l0i9Gb
         TQug==
X-Forwarded-Encrypted: i=1; AJvYcCWyiVW4Mxl09Y9nOM3q/1DannT0sG8b0PFEgXIQtbjmMMtYGmxjCPeCZM1lr6z8IgyjCXL0MdZ+iFzmAg2/rPeo7aJ/YEYOPghM2kIRTdjAUccI
X-Gm-Message-State: AOJu0Yy/Nd8M2AyBkJBPLlQ5y4dWkRtl9vi55LgfbFtrMsooiUHbTuQa
	Codxdnlo7fLSnjUej0YCf0jky2WAu4pY1p0Wzt15zsoUAIW6kGxgT5JEBv2aHkc=
X-Google-Smtp-Source: AGHT+IEr8v0i04KdyN5kSzY25bHZCPhvpFxoitJRr7PKl1+ZyCicgPra8W9fa1HFKCRN0ubVImW6Bw==
X-Received: by 2002:adf:e90b:0:b0:343:e824:f0f2 with SMTP id f11-20020adfe90b000000b00343e824f0f2mr10011102wrm.13.1712670130725;
        Tue, 09 Apr 2024 06:42:10 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id j11-20020adff54b000000b003433bf6651dsm10753579wrp.75.2024.04.09.06.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 06:42:10 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 15:42:01 +0200
Subject: [PATCH v3 03/18] ASoC: dt-bindings: mt6357: Add audio codec
 document
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v3-3-16bb2c974c55@baylibre.com>
References: <20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com>
In-Reply-To: <20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2284; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=/vOu9XkDF1ivIMFF9y8dssFF9iYAfa06zhwEkg41bTE=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFUWsCUPB67ZFEADN+f8GNfytWS4dS0PC0CimAp9l
 6g24vd2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhVFrAAKCRArRkmdfjHURT50D/
 9vl4WxfBFWz3OI9VU5akS6nHUTHE/5H8g6UD5AKWoJj81wXmTOdfSs3SgtdxKtmsmb89fCM04dVot/
 PzcjN687mp1aKo8TzcQpM8yCtMkWDC6XU5vGDgw6LjbbZyvHIdpWkPx+z/Wf3On3fBmtihvKZ17ebL
 ornI4fLUSKQfOSo3UMemleu+ZCucJ/t84hQHFTdZ13nqu79BWTExfYKSe3ZblY2t1X3noYSu4XYew2
 lBf4tr08WA/kJNb8Kpe6hm3G6zCv65J5cPxIJk0H8vZEKtngAtPXIDnFveZgZHRBifYea8wWtFDaqv
 3f6tXlJYYSmBXtzRhOmyYaZ5vKHIRD8pQK+pDtT6O+7ozklGIWbWpeA/k681LHYCDaDqstw353AnX+
 MZZyJaVIwBviGpI+jym6Ei6RWTLrC+mJ13D4qA2Sj24TUlt/lT9N7/5vjgvVaDvpYtQxcWqGa47IMk
 Bdq7mMJyiMEJ6VLYvj00J8fLFAO/ka1WnVFK0YI/PrB7mXZYgrC1OG92m7b73NKNbJgP/Yhhw08MuK
 ZtqtQj899QN9V4dDO8LMSkBeuWh02vmZFbxPhB2l6mC6SHQ39F6rqnHYCqLy06FEdEyIJ85gFtEgTV
 j751Pi2ZGvH15ILCqOWmbKGm5qDr2rXN4iTqlgnTxQsjqHbUHVAYZVMBSzkA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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

Add MT8365 audio codec bindings to set required
and optional voltage properties between the codec and the board.
The properties are:
- phandle of the requiered power supply.
- Setup of microphone bias voltage.
- Setup of the speaker pin pull-down.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../devicetree/bindings/sound/mt6357.yaml          | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt6357.yaml b/Documentation/devicetree/bindings/sound/mt6357.yaml
new file mode 100644
index 000000000000..381cb71b959f
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mt6357.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mt6357.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT6357 Codec
+
+maintainers:
+  - Alexandre Mergnat <amergnat@baylibre.com>
+
+description: |
+  This is the required and optional voltage properties for this subdevice.
+  The communication between MT6357 and SoC is through Mediatek PMIC wrapper.
+  For more detail, please visit Mediatek PMIC wrapper documentation.
+  Must be a child node of PMIC wrapper.
+
+properties:
+
+  mediatek,hp-pull-down:
+    description:
+      Earphone driver positive output stage short to
+      the audio reference ground.
+    type: boolean
+
+  mediatek,micbias0-microvolt:
+    description: Selects MIC Bias 0 output voltage.
+    enum: [1700000, 1800000, 1900000, 2000000,
+           2100000, 2500000, 2600000, 2700000]
+    default: 1700000
+
+  mediatek,micbias1-microvolt:
+    description: Selects MIC Bias 1 output voltage.
+    enum: [1700000, 1800000, 1900000, 2000000,
+           2100000, 2500000, 2600000, 2700000]
+    default: 1700000
+
+  mediatek,vaud28-supply:
+    description: 2.8 volt supply phandle for the audio codec
+
+required:
+  - mediatek,vaud28-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    codec {
+        mediatek,micbias0-microvolt = <1900000>;
+        mediatek,micbias1-microvolt = <1700000>;
+        mediatek,vaud28-supply = <&mt6357_vaud28_reg>;
+    };
+
+...

-- 
2.25.1


