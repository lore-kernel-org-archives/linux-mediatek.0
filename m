Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BEFC4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Nov 2023 21:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t7ww6mzqGGsPSUlmzuVBNdpMvbBkDIB8lVn3IEY42Yw=; b=AxA0qqEHfVpr5KI7TVfl6b1pkq
	XDQRMqeKf4GbU6Ib3JSDMxv5Ic8Q5xZP4tp5mroQ0gRnhDYNFZcttiEGdX3n3v11bbvVshuShskap
	WzuKckpgnUajd2ZDgGbBGYsDGRM2uc2qDuCTFfZL/nfUCeiN+TVkrZCyv7DuUjomo6vjQu4LlwInz
	yavCzstNC0JCsm+mkCHMkedChJho6pQ5/3pAo6pZ4w2A5yPOlGEHfHHZ2WL4txDs+oFz12JxwZSfr
	OxLqfFBnN6GjX9Ofq/NkDD0Jem843PATvvCk0zUh3rYpYXdT9OPCdEFfQfBleemaOhk71pjpUc49f
	H298ffcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r85wQ-006Qge-14;
	Tue, 28 Nov 2023 21:48:26 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r85wM-006Qf8-1x;
	Tue, 28 Nov 2023 21:48:23 +0000
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6d80245b6easo3247648a34.0;
        Tue, 28 Nov 2023 13:48:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701208101; x=1701812901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t7ww6mzqGGsPSUlmzuVBNdpMvbBkDIB8lVn3IEY42Yw=;
        b=jmC4q5Cd7vQYdt9GP/CzwLw+WgOV4VHF+dt6mDoK1vT9w33Oq7sVbZ8ShlMoQkz3on
         MpV8rh/4J+RIyfCqSr5qBio9gBvqLhoNcIZkfzCyclrhXY3wBoy/MP3rvuurypuq2tlF
         1ZDCtEdeyXPwmFZnevOp77aUwkGCV5/M24kLLkKrkg5r4jre+VqepQmT1EFFnAE54jVr
         f/7m3ngqk/WguvmID4EE2tkQG2HBExtnwr0EPW5YnjRVphDR/vDM29lMBaTCbg06DGI6
         DpsTQLPjbx9AdBq+R4iZaQzQoGMAfwMgQAqnEandqaXwtA7xEgNMuwnnJIRdjnT6Zyq7
         sPdg==
X-Gm-Message-State: AOJu0YxnyZNHE1awkVYn/N2xX8dEs5Qsd8RSuRTfVp+QA3PzlR+UIE9V
	BX7hapCP0mh2e7MiMMp+ksr8j3b9Jw==
X-Google-Smtp-Source: AGHT+IFfsLzRsqEDpTBO+1cbp0LH2t58zWoYprlXnC0BcWPBMKo6S3NXELnekLsFxwV0oLfQIukP3w==
X-Received: by 2002:a05:6830:4390:b0:6d8:1889:72af with SMTP id s16-20020a056830439000b006d8188972afmr11498728otv.2.1701208100908;
        Tue, 28 Nov 2023 13:48:20 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id be5-20020a056830350500b006d6496747b6sm1789545otb.80.2023.11.28.13.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 13:48:20 -0800 (PST)
Received: (nullmailer pid 3975986 invoked by uid 1000);
	Tue, 28 Nov 2023 21:48:18 -0000
From: Rob Herring <robh@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen Zhong <chen.zhong@mediatek.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: input: mediatek,pmic-keys: Drop incomplete example
Date: Tue, 28 Nov 2023 15:48:16 -0600
Message-ID: <20231128214816.3975893-1-robh@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_134822_642708_22B8555E 
X-CRM114-Status: GOOD (  10.46  )
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

The example for the Mediatek PMIC keys is incomplete as the binding is
the full PMIC, not just the sub-functions. It is preferred for MFD
examples to be complete in the top-level MFD device binding rather than
piecemeal in each sub-function binding.

This also fixes an undocumented (by schema) compatible warning for
"mediatek,mt6397".

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/input/mediatek,pmic-keys.yaml    | 24 +------------------
 1 file changed, 1 insertion(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index e34c9e78d38d..70567d92c746 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -90,26 +90,4 @@ required:
 
 unevaluatedProperties: false
 
-examples:
-  - |
-    #include <dt-bindings/input/input.h>
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-
-    pmic {
-        compatible = "mediatek,mt6397";
-
-        keys {
-          compatible = "mediatek,mt6397-keys";
-          mediatek,long-press-mode = <1>;
-          power-off-time-sec = <0>;
-
-          key-power {
-            linux,keycodes = <KEY_POWER>;
-            wakeup-source;
-          };
-
-          key-home {
-            linux,keycodes = <KEY_VOLUMEDOWN>;
-          };
-        };
-    };
+...
-- 
2.42.0


