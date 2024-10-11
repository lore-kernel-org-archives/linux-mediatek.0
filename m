Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A851CFD35C
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Oct 2024 12:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vva6vEuZrAd8wNjfiY39AqSAgZ267m7z8GvSRPwkzFM=; b=xitikOTWa8RIoRKigd99Q2qVVt
	5ukaLpUiM3iTnHD9i4tjMhrJhCoKgqNPEyKVJWWq1WUHZhhGEWp8F2lCsqq4bGFTbfFOK84eMO8At
	LUHsK94mlo0cl6zwKIe6R2WjrXaCQkIECZdaYaa/9xfZ6ftNeL7IXVa4EVOg0tZ4RG5sF2Ja0M04C
	kEiql7hAq+rNDs1o0dVe3xVG+YQKr+J9xF4mdYWAgdju293Brbq3mycFLv1Ucn7Osbb80/Yj+udDB
	ictBYLeZ6r4j3F7O4S17np/GeiwUPlHGXkPoM/PzritVENIadrCkdRnVct/iqptL9xmaJJZ4JW6LC
	wIm+CMTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szEVi-0000000GFRW-0iGx;
	Fri, 11 Oct 2024 12:12:46 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szEPQ-0000000GDwS-3fPx;
	Fri, 11 Oct 2024 12:06:18 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a9963e47b69so292104866b.1;
        Fri, 11 Oct 2024 05:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728648375; x=1729253175; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vva6vEuZrAd8wNjfiY39AqSAgZ267m7z8GvSRPwkzFM=;
        b=Vu/mbNkEf4+ivY6fb34DWcVyJCAghz1Ln7QLbAAMZlf+GvtYO4D6ZBwXrYTPzYHirx
         OWRIcZx1PEjqu+Z1txFb+NkDAzQEijQDEm1vLY6yeGRMLICqMoW5EQ3CX/Jb7JKDNVrP
         hEnkxrsdMGYlakQjJXulxfWfyhFhZ+wd4XkRPmBVMiPefQJr8cUtn2vKHx5qkq0dDXLU
         mHc83EUviW055iJyMJtYB4LwBYf7lmJDCQUip0psyIgp6E65BWVhdr8HVWZFsIhfzP2s
         2F59JgP6isRy9N/b5KUMMp4b/1bfl9M6OQInm7+xL6HPFzR5vrtH9IIRxJ9/aWIhX7cc
         bsyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728648375; x=1729253175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vva6vEuZrAd8wNjfiY39AqSAgZ267m7z8GvSRPwkzFM=;
        b=B9BjO6g95fFq+7Y9hJThTBcFsjFdfmLk37+obPnRUthnahNUiFJ2/Z58UTQmUoXLmB
         kh+mHVNShL8gSGazTO05DN0+vWIN00OakD1Aq+pNAj4FOdUpSsb5StSTMC4gRyX1Bq5g
         B405bIPvRLjAN+EoSIz0tyTIYxvDlNUvyciYjcVIf2ZUT3zSuY3WWLTp28X4JWA46Itd
         /FUkL9Unyo4LWcQEMC0NB5/NgC+gMeSnYhecsjdZ+5IOKllVcko9n1tzovh9DTgKxops
         yJMVxCOnjy3h29vAvDp2OVBC8BJsHFf/sovWo6eY1yqeddkS0z2K6brVl7DvJC0Vs54h
         LXBQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7uPHAIBybCw4W72mQsr9xLf1Obo5lSUayyb+7ZFSKc+RO4J3SjUQYL7lTOcNcpdqWaDxC7pgkOWKrvp6oJY+W@lists.infradead.org, AJvYcCUpB6axcrGdJk9QRP5QECwTTV2LZ/maSQBwI1+HcyFppcNaeK69sSj2+Zm3DBokSDm31h+F1+d9dcOqjd49yXI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyClDydJKO8s3OzxjqO3fyoGLKY97U304I/eJ20ZFSYEDC7++GW
	EadF+XRoqm4MmvrriLhxyFNatVL5UawINYqhncLcUDHuNoSJbKly
X-Google-Smtp-Source: AGHT+IFDW7u55StACmVfDydYmpmeHkLFILWuJRItj9IqAhOfa7oLhobk4myIP5qU7gvT+2wARIfNog==
X-Received: by 2002:a17:907:1c1f:b0:a99:3ebf:9371 with SMTP id a640c23a62f3a-a99b95f3d91mr196358566b.59.1728648374644;
        Fri, 11 Oct 2024 05:06:14 -0700 (PDT)
Received: from zenbook.agu.edu.tr ([95.183.227.31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99b804ea59sm88962366b.151.2024.10.11.05.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 05:06:14 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	Andy Teng <andy.teng@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 5/8] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6765 pin controller
Date: Fri, 11 Oct 2024 15:03:50 +0300
Message-ID: <20241011120520.140318-6-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241011120520.140318-1-y.oudjana@protonmail.com>
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_050616_941202_3D653733 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index 7ac1a85f822f1..4bfbaebb790c3 100644
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
@@ -61,6 +62,41 @@ required:
 
 allOf:
   - $ref: pinctrl.yaml#
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
+
+        interrupts:
+          items:
+            - description: EINT interrupt
+
+      patternProperties:
+        '-pins$':
+          patternProperties:
+            '^pins':
+              properties:
+                drive-strength:
+                  enum: [1, 2, 4, 16]
+
   - if:
       properties:
         compatible:
-- 
2.46.2


