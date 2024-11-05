Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C18D12670
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Nov 2024 09:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nnqa2pPYuuC5Cap6gt5UkBzeNS3a7p0T+6rmPXsBpW4=; b=Dfs4bLV8f2L2OM
	e6FsT9Q3JWSjZ591jD4L9we2H/sk+PHecMItI1yfSk6znrcpFznuYsv5GrxyCMItmJUFCAu2lvG0D
	Sv7CpHv0CN/A865W/PNjXnJpD8wrf5cpBMY5FI8JX7mhzjYAXHwwj91Zf3Ct7EC9YFbqk3XmREa+Z
	pIYL+0iA0Bslu4s6hp6Hu/xMw90Fm6JYG8Dci6KnsTN5BxLLAceJvTRnpM2TsSO8WI+9pIIfujlgC
	KGvyv/AX/bs+mtPuDqi0UUMSK8ECWY/d0u1JKTd2atiGrwAFl/e/oz5ZIunSheq6GpDFWpPiYDCXw
	KSJjSTXsH5rfrsGg/gWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Fz8-0000000GXPb-3vRL;
	Tue, 05 Nov 2024 09:36:26 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8FvR-0000000GW8w-3o20
	for linux-mediatek@lists.infradead.org;
	Tue, 05 Nov 2024 09:32:40 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20c8b557f91so53436595ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 05 Nov 2024 01:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730799157; x=1731403957; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nnqa2pPYuuC5Cap6gt5UkBzeNS3a7p0T+6rmPXsBpW4=;
        b=Vd9BGBstRFuFkGKM2/nhQG0bTolYRhrnMoPQDyRMcG1teel5Q6k3+pQpn5PkGUE4XM
         ebf8b4plGbgMzzlO+l9eBKGzx5esVdAA/RvwMEHd06bx2wnLR8zzsFQcQdV93azwKlYJ
         ooYfaLY7sa4Mba5xgtC8hCmphT7t3vtehYBIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730799157; x=1731403957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nnqa2pPYuuC5Cap6gt5UkBzeNS3a7p0T+6rmPXsBpW4=;
        b=sTeAjbA6n2yp8WlmreNhwz+6CfOPsIuupkewGX9PrL0JWnQfEpbSo9rPxkDHQevz5q
         kMb2ebmR742yOuZzK/mz4PidWPSnQfle7TodtElXdT9S0BlngNkwu7vAYzWLwwfV/HAc
         432K8zuZYzPT9S7654FTI4gKzXG4zT1YEOUbztcEC0sy+S6cnz4hLM/fJGOCeoyHwV39
         R+f+I0xoHf1/mYqhIjbVQpwAOdmc6qDP8pcmpqIrvjOi7ruiWZ307nvIvV5zHfwdDCWO
         ZW7yaV9MzAWs5Rpt9Qi6lU2TT3emLtB55ieG86Mrjle3MJ/01jHkdaLxtrnCss6lEj7m
         enng==
X-Forwarded-Encrypted: i=1; AJvYcCVkA8q2Kigf/uoWe5GWpWPh5D2wqweppIBVNe5CokkyuA/Juw0xXWOhDqvIl4ijqmkCBOMbkDuGdWeFeSAYEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRIs2yczPpQm7f2dqb+bGR94yvRUUiX3jeznIV4BHG5fjyzhjG
	B3XPMrg6T/EUIv0pPkoILJo9ouw4wkS61J4NH0FLYE9aSnYj2pV3npDTg0ZJNw==
X-Google-Smtp-Source: AGHT+IGOGQ1HZ0I0tBq/EN9OnU8jHABvUHtmvm4AuXTRezpGH+/Gkd1vzZSmZS+YuGC8dwHeP6ckbA==
X-Received: by 2002:a17:902:d50a:b0:20b:57f0:b38b with SMTP id d9443c01a7336-210c68d748amr489451335ad.19.1730799157354;
        Tue, 05 Nov 2024 01:32:37 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:20ee:3712:ce0b:1ed7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211056ed8fbsm74149565ad.6.2024.11.05.01.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 01:32:37 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: mediatek: Add MT8188 Lenovo Chromebook Duet (11", 9)
Date: Tue,  5 Nov 2024 17:30:12 +0800
Message-ID: <20241105093222.4055774-2-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
In-Reply-To: <20241105093222.4055774-1-fshao@chromium.org>
References: <20241105093222.4055774-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_013238_181921_28EA9241 
X-CRM114-Status: UNSURE (   9.32  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add entries for the MT8188-based Chromebook "Ciri", also known as
Lenovo Chromebook Duet (11", 9).

This device features a detachable design with touchscreen, detachable
keyboard and USI 2.0 Stylus support, and has 8 SKUs to accommodate the
combinations of second-source components.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

(no changes since v1)

 Documentation/devicetree/bindings/arm/mediatek.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 1d4bb50fcd8d..4b68f0baf010 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -307,6 +307,19 @@ properties:
           - enum:
               - mediatek,mt8186-evb
           - const: mediatek,mt8186
+      - description: Google Ciri (Lenovo Chromebook Duet (11", 9))
+        items:
+          - enum:
+              - google,ciri-sku0
+              - google,ciri-sku1
+              - google,ciri-sku2
+              - google,ciri-sku3
+              - google,ciri-sku4
+              - google,ciri-sku5
+              - google,ciri-sku6
+              - google,ciri-sku7
+          - const: google,ciri
+          - const: mediatek,mt8188
       - items:
           - enum:
               - mediatek,mt8188-evb
-- 
2.47.0.277.g8800431eea-goog


