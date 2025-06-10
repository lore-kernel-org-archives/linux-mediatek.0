Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1FB9C5B543
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Jun 2025 06:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VrqULORtZRtLvohScS0bW/tHKk9lrlbI86cMujlReXw=; b=zeCc1NUAbKNyx7MIFwvRd2akk/
	3zhNa9fofrtaucLOjIFzminMFWp3BhqG15UZlSL1ql/g5xItoOvkoJ60teGD814Wn6TRyhhxnCJs1
	EUXEz7epvh9oG1ghyniguH+CIHREqH2J2p5b4ageG5HJPzq3xk5eVWuA8rLMJpobTj55gBOG+fs8q
	JTpvG2Iu365qHdRe1EoEyM+qoSvltzKMaQQUSVROp68DuhY2OzZHGdgq9GR1lurw4vlR/mYZMW3In
	V4UUAeIZAPD6Nogp7Y+S18KphzoSEwbVhiaAz2yMgvwd89ISMaysUKmWwqSeJMQJnk1192qp3TbVk
	ooCbvh2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOsdW-00000005wp8-3qAy;
	Tue, 10 Jun 2025 06:39:06 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOsZI-00000005wNR-2fyb
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Jun 2025 06:34:47 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-234c5b57557so46725505ad.3
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Jun 2025 23:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749537284; x=1750142084; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VrqULORtZRtLvohScS0bW/tHKk9lrlbI86cMujlReXw=;
        b=bCo3MYkw10e5btgNkyngmSK1uxRjc6bZIPuXnb67pPcekRnJsOXjLuyXfxY0jjAYBy
         LzYG+LLsVM+6SWzxMOXr58vMZLyACeAljh/UMvHhQPsxrf80JfLMiQxWt1TEClH4vpSh
         OHWj956BskeM9hFEho9G07XkT2WXOH8csjtV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749537284; x=1750142084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VrqULORtZRtLvohScS0bW/tHKk9lrlbI86cMujlReXw=;
        b=Cqd+EOpNQcjQIC693WdqkLXhtOP74Lpzfcpawq0vYeIBLBA7W9ILBYW34/YykWpexA
         CpcwkIMd4CPB+DvztDNKh6G3FVMXb4EmhuIJIFPprtnmrUb5mzE5tKZtdcGewmOoucnZ
         XsgY+iHqIdrvBSNRw3bUnaC7Um5G17UhV/v/psyNzAyrVHUadLIXGr39d+E+gUJO2hSh
         hSoO4mq2IbNfz2GR8TycK/aVbgeWmaabUYBvu5R32q6Mu4Z7lugvY+gXTU0wy0M2wxgz
         2vD+7t2fpF2ehEfjIDHj2Snn/918ixMJExbvXKf5hqvTTf5q4YyamAaYw9P9S+s2woxL
         LA6w==
X-Forwarded-Encrypted: i=1; AJvYcCWcZ92lqjxcfNL3pZBSGtBIJdrbdOvYeMmExspTHWNymS9An8eMF4GAVA7yh+SNFJFaj0bkX2CulkGe0qQmLg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy6Sb3nzgbEK/p+ExSk4HwZb/A6wum6V2aaYe+Wek27lgNdvT0
	+rOPYprTFU6VvGJW69viFN9O+X/vvbVjBD6XOjhUI+Y/s4rmUiHgKg9lOPMeH+Recw==
X-Gm-Gg: ASbGncuceejQVxfVPIJhCi4Q/cPXcpMa8u4cDMgUN/VRvdXiTGt4yvSIrpB29SeACGC
	eAuu1tf19bgAN9NEFzm8vtjdW3hplVeCGLsts54i9HWeevp2754aORk1JJIjCOp7a3VqhOORUXR
	2xcp+X2tgapLsHLFgWvUIcaSoO8ffsd5sJLdJsOoPYBE5EUkhke8jQO0+jfLrD+RYEUrdh07NRl
	BrBhx3qP++JjnuurSfSf7qhAcRicLL4M65GN1M2FG+6kjvQO/ixZ4UhzYl1ms24NzqGIknHUfVc
	qe7sNpv2XLxrefBCPsBnEGNDOQAzQR13LvQ9mAgT7SmLQAk7E5rQJ1KYOFItN42Ladk1OL88RNq
	cRWUg
X-Google-Smtp-Source: AGHT+IEGQxJJmcWYpWGuVmdUnkC75qaMfHhC2ZYRcVR0LV2sYNBvIZJpm3D00eRQqElG+uElS5rHKg==
X-Received: by 2002:a17:903:230d:b0:235:e1d6:f98b with SMTP id d9443c01a7336-23601d03dddmr221983295ad.22.1749537283922;
        Mon, 09 Jun 2025 23:34:43 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2826:ada4:efac:14e8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092ee2sm64596765ad.82.2025.06.09.23.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 23:34:43 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Lala Lin <lala.lin@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johnson Wang <johnson.wang@mediatek.com>
Subject: [PATCH v2 1/2] dt-bindings: nvmem: mediatek: efuse: split MT8186/MT8188 from base version
Date: Tue, 10 Jun 2025 14:34:29 +0800
Message-ID: <20250610063431.2955757-2-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
In-Reply-To: <20250610063431.2955757-1-wenst@chromium.org>
References: <20250610063431.2955757-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_233444_680026_DE63400F 
X-CRM114-Status: GOOD (  13.30  )
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

On MT8186 and MT8188 one of the NVMEM cells contains the GPU speed bin
value. In combination with the GPU OPP bindings, on these two platforms
there is an implied scheme of converting the cell value to what the GPU
OPP "opp-supported-hw" property matches. This does not apply to the base
mediatek,efuse hardware, nor does it apply to any of the other platforms
that do not have the GPU speed bin cell. The platform maintainer argues
that this makes the compatibles incompatible with the base
"mediatek,efuse" compatible, as shown in the link given.

Deprecate the MT8186/MT8188 + "mediatek,efuse" combination, and add
new entries with MT8186 being the base model and MT8188 falling back
to MT8186.

Link: https://lore.kernel.org/all/11028242-afe4-474a-9d76-cd1bd9208987@collabora.com/
Fixes: ff1df1886f43 ("dt-bindings: nvmem: mediatek: efuse: Add support for MT8188")
Cc: Johnson Wang <johnson.wang@mediatek.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../bindings/nvmem/mediatek,efuse.yaml          | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
index 32b8c1eb4e80..4dc0d42df3e6 100644
--- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
@@ -24,6 +24,21 @@ properties:
 
   compatible:
     oneOf:
+      - items:
+          - const: mediatek,mt8188-efuse
+          - const: mediatek,mt8186-efuse
+      - const: mediatek,mt8186-efuse
+
+      - items:
+          - enum:
+              - mediatek,mt8186-efuse
+              - mediatek,mt8188-efuse
+          - const: mediatek,efuse
+        deprecated: true
+        description: Some compatibles also imply a decoding scheme for the
+          "gpu-speedbin" cell, and thus are not backward compatible to the
+          generic "mediatek,efuse" compatible.
+
       - items:
           - enum:
               - mediatek,mt7622-efuse
@@ -33,8 +48,6 @@ properties:
               - mediatek,mt7988-efuse
               - mediatek,mt8173-efuse
               - mediatek,mt8183-efuse
-              - mediatek,mt8186-efuse
-              - mediatek,mt8188-efuse
               - mediatek,mt8192-efuse
               - mediatek,mt8195-efuse
               - mediatek,mt8516-efuse
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog


