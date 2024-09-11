Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E124EE49BC
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 14:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wnPQW7Y4BtUSgD7VL5z1FONolY3V9ZDMRIrGcpJjXnE=; b=baTjqrs3DFzK6w
	ShBD4xQQAznUnORIzMAFLFKhrNS3glOMYwatbipX7ptBysLgXhFezPC5rDqTDhc8n+S7Eg1cvKUyk
	ipzzEkBwO6ljPxITXGTfDLskziGNWoUy6HeQy/ynByZIdLzdr29utb5SK4gKjBbcnrojA/iP3xcbS
	bF7JHqFQiyB1VjifqXrauVZxGw/a7n4RO9mq7erSyl2gGpKl1DUFisMorhrh9YP3hnOnuhrAulvq5
	4M1oOx9d3cfGqfmzYKUmJi03Hj1Ze7ax3N21F7srDHztgJdVym4KDMFM5ektfeQ/g24eYGVAq/STP
	psdxVe9ZcMGD468O4lOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soOeD-0000000A0Ub-30gb;
	Wed, 11 Sep 2024 14:48:45 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soOR9-00000009w6P-1n9z
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 14:35:16 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3e033e37bc9so2519555b6e.0
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Sep 2024 07:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726065314; x=1726670114; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnPQW7Y4BtUSgD7VL5z1FONolY3V9ZDMRIrGcpJjXnE=;
        b=BiwoNjOP/mVxr/y95QN6ytz8UIW41lKcy5AgbjXIbi5NGClQWf9S48ejWQOnMI5r7x
         GAaWNhcEX4htvGcPgpcelw6X1e8GREt9SY6KYT0G069Wjh9ktwdP0HbtwIfREg8C7UpU
         49UgOmH+VOocA/agU/4Jixm7mxOjqLeyyN9XA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726065314; x=1726670114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wnPQW7Y4BtUSgD7VL5z1FONolY3V9ZDMRIrGcpJjXnE=;
        b=CLCmHSD5fMnoL6xABUuRhc31k7csTCIxIyHWtaSCokSoYOQOS8NNO/ur5zc44qRnOA
         abTemBnt2PpRQRFt59yWrNSJfW1zXdywKFWCByCQKjGdlg20nSaQ7OrH62XBVURZbNhX
         iQeRTM+C+RAjBjo+JJnqu8zf0nx+Z3/doi0mdXtxbxrntcBhI9eqIegbHXBCXje+Z55B
         RwEim1UPs/IV5ZuOFrc+L4x8iQo7dyKC42ITqRrSgyumTFWO3xsLPEA8duAzru/3iB1s
         BsTWlO7+xy4U9fAJpwDdZntJPl+/oylVE1e2ub/MlHfx62Hz1DezIQyp+3Eu4XT5VUYw
         15Gg==
X-Forwarded-Encrypted: i=1; AJvYcCVJnXNdkbMtCO0fG3+NqtFYo7Y3wG9grRqb5M/gZ+XRJBHKduNj9H2e9f2B+xR9h70PY1/CJbM7VTq7FNc59Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyYV4K7pE4uv4ESKegYkDpDJtU9JmErEvl150JntEyEInj7k+Kv
	HHOPkaLC/FqVFWyrH4R5BjdCjaXee41ZAuHYZaPbokRpe0ekTQfj4JWnrkcNIw==
X-Google-Smtp-Source: AGHT+IHHUCdHBp5uv6ADa0vxA18vvNpQp5qn4oDl6lTmb8iv0NjjXhkphjoMY82rsiFzMfvLj5l/lg==
X-Received: by 2002:a05:6808:3206:b0:3e0:6a7f:4752 with SMTP id 5614622812f47-3e06a7f4a48mr875938b6e.41.1726065314162;
        Wed, 11 Sep 2024 07:35:14 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:102f:d738:6069:fd4b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fbb5901sm46620a12.24.2024.09.11.07.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 07:35:13 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 2/8] dt-bindings: mailbox: mtk,adsp-mbox: Add compatible for MT8188
Date: Wed, 11 Sep 2024 22:33:55 +0800
Message-ID: <20240911143429.850071-3-fshao@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240911143429.850071-1-fshao@chromium.org>
References: <20240911143429.850071-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_073515_496262_8B947A85 
X-CRM114-Status: UNSURE (   9.87  )
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
Cc: "Rob Herring \(Arm\)" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>, Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add compatible string for ADSP mailbox on MT8188 SoC, which is
compatible with the one used on MT8186.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Fei Shao <fshao@chromium.org>
---

(no changes since v1)

 .../devicetree/bindings/mailbox/mtk,adsp-mbox.yaml   | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml
index 72c1d9e82c89..8a1369df4ecb 100644
--- a/Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml
@@ -17,9 +17,15 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt8195-adsp-mbox
-      - mediatek,mt8186-adsp-mbox
+    oneOf:
+      - enum:
+          - mediatek,mt8186-adsp-mbox
+          - mediatek,mt8195-adsp-mbox
+      - items:
+          - enum:
+              - mediatek,mt8188-adsp-mbox
+          - const: mediatek,mt8186-adsp-mbox
+
 
   "#mbox-cells":
     const: 0
-- 
2.46.0.598.g6f2099f65c-goog


