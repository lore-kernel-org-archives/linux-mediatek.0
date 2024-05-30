Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72807C25B74
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 May 2024 08:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7xwThRWWm7RGJSY39HVyy4ljf9OK8/1xd1SRHdwBmpo=; b=mR1y4FhCiUHFgY0XbgwvCUvarQ
	z7pKivwtF9uyGonQN/6/BzOmEcxL5ZEcK5ypD+MQKHy1ZoK2MVFeLynoBVvN8bw/nkAVtiJGp/b4B
	bcw1han8x4EXZwsIl6+41fvlhaqFzuky+EyRLU5Yq0yyoV9PeR3TUHj7fjIbp3MYsvwW9FcJak342
	Rdc3Z/IuNL+tgCcvvAQSGHeyMEF84VNPJDJwdvT4mv9GhpbzlTT8qCuFOYIFDDSaUmruw+EaOxbaj
	ZLYvJXE1nRnutgfKBm4YM33hCMgW5MxZzw/sc+9ZQ9CsHMMiye6FtQ/I9UVX+StFU/uBbUxnUJ4qt
	bHiTDMxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCbGc-00000006e95-26oq;
	Thu, 30 May 2024 08:36:10 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCbFz-00000006dn5-3bcx
	for linux-mediatek@lists.infradead.org;
	Thu, 30 May 2024 08:35:34 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1f480624d04so5933935ad.2
        for <linux-mediatek@lists.infradead.org>; Thu, 30 May 2024 01:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717058131; x=1717662931; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xwThRWWm7RGJSY39HVyy4ljf9OK8/1xd1SRHdwBmpo=;
        b=jx3GQdKBprVG7MRQUjDPO82gcD97AEk+Qpjs11qTHZIh+wE5NVfAu+AIFahEt/MwCb
         DjKJm9tvzgum61YGjWdRTOGccQmk4ni88Qe6NTM1Ws6El4OKirHLNoy5Ca6r8aFjCN6r
         PkGwXCPlK8Vr1E3VTdPYehYcPyXfA7ohKoPMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717058131; x=1717662931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7xwThRWWm7RGJSY39HVyy4ljf9OK8/1xd1SRHdwBmpo=;
        b=AWEXlA9xPv8CZ+qnTL+ho+CHFMcJZt+9Ezly4q7M/r4aCN3IaUNEIRxr1SC8MLn1Ru
         XexoqDQ8ZNf9eD7LdiSeQSbCJRlFtFTqsehfXSIPa59HQMgEFYIm2F/q7j/sdwMiZlnc
         axMSWgrQ+Am4mMxY0pprgLH/hreb8uCXhpsC35obKRp6vBHixd29gL9h79DKZLNS3+Ho
         Ll0FGdydIHgl90F7mMQJr7bCChWwJuCrBDKe3jQZfypFC20o62lTOqExodmh+O9Gg684
         5xG6QXE05cnZGc5etKHI93bqtVzXJKseceuhaRZm5OKyemKZl+vEVM1WNOaI16ahopGd
         szQw==
X-Forwarded-Encrypted: i=1; AJvYcCVBN1m5lsVtUMotZKxLWv0QkY9klpkgi98ddOKmz7ERaAhJoYvIghFHc7x3fAssUZ2+M/RS5TZpN/tcxAB1sqngNc0Z10kEI4OGDoNsyqbaFeqO
X-Gm-Message-State: AOJu0YxZ4RWP7fM4hkUEPvcG/KWwUPxwJZvtyz1aFU6YtBVAjrNROb/D
	KP5/Lk6LJ/+XZkFtn1m3xagID9N6jSbMovPHZY+F/HPIXDEqYj65KrhsKyHKQw==
X-Google-Smtp-Source: AGHT+IEp028TMUUWRl/RXoMRYp1icLkfUsk+YnlWATTbz/4qqOD7Tx9V/9ogbJ57638g/PX+8PWjow==
X-Received: by 2002:a17:902:c409:b0:1f5:e796:f26a with SMTP id d9443c01a7336-1f6193f2c1cmr16752955ad.5.1717058130799;
        Thu, 30 May 2024 01:35:30 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:65f0:63a9:90bb:50b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f617390fe7sm10950635ad.146.2024.05.30.01.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 01:35:30 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU
Date: Thu, 30 May 2024 16:35:02 +0800
Message-ID: <20240530083513.4135052-4-wenst@chromium.org>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240530083513.4135052-1-wenst@chromium.org>
References: <20240530083513.4135052-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_013532_007261_39CD1FF2 
X-CRM114-Status: GOOD (  11.68  )
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

The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is one
of the Series6XT GPUs, another sub-family of the Rogue family.

This was part of the very first few versions of the PowerVR submission,
but was later dropped. The compatible string has been updated to follow
the new naming scheme adopted for the AXE series.

In a previous iteration of the PowerVR binding submission [1], the
number of clocks required for the 6XT family was mentioned to be
always 3. This is also reflected here.

[1] https://lore.kernel.org/dri-devel/6eeccb26e09aad67fb30ffcd523c793a43c79c2a.camel@imgtec.com/

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../bindings/gpu/img,powervr-rogue.yaml       | 24 +++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 256e252f8087..48aa205b66b4 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -12,10 +12,17 @@ maintainers:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - ti,am62-gpu
-      - const: img,img-axe # IMG AXE GPU model/revision is fully discoverable
+    oneOf:
+      - items:
+          - enum:
+              - mediatek,mt8173-gpu
+          # PowerVR 6XT GPU model/revision is fully discoverable
+          - const: img,powervr-6xt
+      - items:
+          - enum:
+              - ti,am62-gpu
+          # IMG AXE GPU model/revision is fully discoverable
+          - const: img,img-axe
 
   reg:
     maxItems: 1
@@ -56,6 +63,15 @@ allOf:
       properties:
         clocks:
           maxItems: 1
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: img,powervr-6xt
+    then:
+      properties:
+        clocks:
+          minItems: 3
 
 examples:
   - |
-- 
2.45.1.288.g0e0cd299f1-goog


