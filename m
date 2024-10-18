Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665F5D2127B
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 09:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iEsUo4lrwpljoR0FPBQuFvw1WkkxvZeqCHqf7QaSpZM=; b=VUPo/0e8txMDfcCSqFGRWQypZI
	kS4tc6TNj8jp5BI7P9cTXCoQNfaUgkR/LcnL/4AJarJAH5hT1TMOIb4RrnbZG5AbELFPKRL8C/dxB
	RKcfCJ6NzRFOYvvllHT/JAi+ioCU5gUAiS0n/ZUvpAcyb0bkjmuCqcZfYC+7Ggzl8fi0sSz4jX+XV
	rmD7FinjbcBmbVrZ5XzXskZdMaxx2hg7hPExvpwsKnry+JTqYrutRkQAP/Yg2YS3WXZUUvG9PufcG
	0/aG5TPtNP7c40MukD7oqjZn24+TedoFJw/Tmxd1r/P/F310gi6HkLjV6FaGoUUc5Q1fjiOjZrN6o
	6H0umGnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1j8E-00000000AEA-1j0e;
	Fri, 18 Oct 2024 09:18:50 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1j1T-000000008EU-4AZX
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Oct 2024 09:11:54 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-20c78a10eb3so2050935ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Oct 2024 02:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1729242711; x=1729847511; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iEsUo4lrwpljoR0FPBQuFvw1WkkxvZeqCHqf7QaSpZM=;
        b=bym8nNSUppzzmxvQVVLfc4ykrraGO/a2HGF4TvoQ5qqjf/H51lsvPk81cZ704hhPiT
         W3nRNYFVd1CPl1zH7AZHVRg9nwLMYYyhKiAOHFaBp12eYq6UM/46iC8rMU4AQJ/4n499
         d6PrC7B2WOCzjKFjehqLaYKx4wh4IcGvcDmveb6cGbik5x8rQ08UHEgaO7lfNK+797vO
         SPgXgsqskbZBopr099SE1rhLdXJFARDa84Y/JFuU/zrSPp0O40l/jtE5Y6DCKbhZDXtp
         lYUI7HpNFDGTlpbrAY5vSu8cXTm8m42zQVkZ/z/feStoafT1ouzM1SOTjp8AJ1Yv8oDI
         eudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729242711; x=1729847511;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iEsUo4lrwpljoR0FPBQuFvw1WkkxvZeqCHqf7QaSpZM=;
        b=NgIeCpuGOI6j72u5zmWB6vpYKflpP7T8CR54dYRSv2XNi0LFnXNAf0K4IUq89eSLPT
         Ldm7DSrX14vyZ2/qTT801v4gxoQ4rkFkSjb3Jlx5zIJIf+QknEH8Yjo+nKdx97lR6rU1
         iMaNzrVqZd3pnVNmNEAYl9Z3vGwJnjMm7mrR395NmVfPxo4SVybshDxJL6+0vn5lJUNt
         1ICfLwOzAPDN4F9qFRkgcHC4tplUlHELA6XyKpTwT34cJG1hsqPK7tSZwOxfLrGjgoXI
         yVxpbOCDD5mk+/fFn/tgTZc40c4IW8NzPJVUh6jy2SFULRw4kgHbEvqIrl4w7qgYImXr
         dO5A==
X-Forwarded-Encrypted: i=1; AJvYcCWAlKDRL5L+f65MUPJePqemJQnp0uNkApm5CWcHpIriaJ9E412T5q5j5EiqocjPig4kKB5Zn0xqBuGDRPxo2g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0FEIgUC942LTer4645tb6c+BtwLlSEtABIcZrE6ine3TonQ7L
	r9vHo4HroDJfnl0wLUZbsXUokHm+JYkBxUmQDUanD6zvA8YB+v/Hsu9Og62Yztc=
X-Google-Smtp-Source: AGHT+IHCJSXnH2e/abEV/Wv8/vRj6XKID20CEDw3D0Xf9MusYELPDkoXIFjOA/U2OAaCR0QCKEtFIw==
X-Received: by 2002:a17:902:e807:b0:20b:a2b8:1863 with SMTP id d9443c01a7336-20e5a7a3339mr9956855ad.3.1729242710981;
        Fri, 18 Oct 2024 02:11:50 -0700 (PDT)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e5a747925sm8659115ad.71.2024.10.18.02.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 02:11:50 -0700 (PDT)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: devicetree@vger.kernel.or,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	hsinyi@chromium.org,
	sean.wang@mediatek.com,
	Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: mediatek: Add MT8186 Chinchou Chromebook
Date: Fri, 18 Oct 2024 17:11:33 +0800
Message-Id: <20241018091135.17075-2-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241018091135.17075-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20241018091135.17075-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_021152_068445_7CCC4F50 
X-CRM114-Status: UNSURE (   7.61  )
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

Add an entry for the MT8186 based Chinchou Chromebook, also known as the
ASUS Chromebook CZ12 Flip (CZ1204F) and CZ12(CZ1204C).

Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
---
 .../devicetree/bindings/arm/mediatek.yaml     | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 1d4bb50fcd8d..3efab59b8a73 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -239,6 +239,34 @@ properties:
           - enum:
               - mediatek,mt8183-pumpkin
           - const: mediatek,mt8183
+      - description: Google Chinchou (Asus Chromebook CZ1104CM2A/CZ1204CM2A)
+        items:
+          - const: google,chinchou-sku0
+          - const: google,chinchou-sku2
+          - const: google,chinchou-sku4
+          - const: google,chinchou-sku5
+          - const: google,chinchou
+          - const: mediatek,mt8186
+      - description: Google Chinchou (Asus Chromebook CZ1104FM2A/CZ1204FM2A/CZ1104CM2A/CZ1204CM2A)
+        items:
+          - const: google,chinchou-sku1
+          - const: google,chinchou-sku17
+          - const: google,chinchou-sku3
+          - const: google,chinchou-sku6
+          - const: google,chinchou-sku7
+          - const: google,chinchou-sku20
+          - const: google,chinchou-sku22
+          - const: google,chinchou-sku23
+          - const: google,chinchou
+          - const: mediatek,mt8186
+      - description: Google Chinchou360 (Asus Chromebook CZ1104FM2A/CZ1204FM2A Flip)
+        items:
+          - const: google,chinchou-sku16
+          - const: google,chinchou-sku18
+          - const: google,chinchou-sku19
+          - const: google,chinchou-sku21
+          - const: google,chinchou
+          - const: mediatek,mt8186
       - description: Google Magneton (Lenovo IdeaPad Slim 3 Chromebook (14M868))
         items:
           - const: google,steelix-sku393219
-- 
2.17.1


