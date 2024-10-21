Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED892D3C938
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 03:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iEsUo4lrwpljoR0FPBQuFvw1WkkxvZeqCHqf7QaSpZM=; b=fNYCaQ5+UDJ+Dho7IqnFL2uXDU
	UzlqhvD1bciuyVKS/qP0SihiUFkPsJQk1nSL5PExpTvFMfokNrRZeV+Vz6l/OSf6wX09zmGEwHA3P
	qOi4Sibc96HHwpPJe9RAQotIp7A2x53LFlmomRWU7OhYSi7u2yuMXQ6foVib27ScoXZYJWD0hjLgE
	7CnVaNvWwsMxkCV2OPoob3e9hzxyFxQgOiNuuTNQtrYe/sjt+c69CUPUhusEw6M6ZAmOhvOV2bIdo
	SLZRQ5GsjHuupmh4jMWBi/4iXsNdwD1q96Q8KOt4XEF+3jWiTlyyErs9ho1FkhZQYk7UOWrCuarnh
	suw1b0KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2ihp-00000005vHj-47Gk;
	Mon, 21 Oct 2024 03:03:41 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2ig5-00000005uqC-2fEu
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Oct 2024 03:01:54 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-71e67102283so99856b3a.1
        for <linux-mediatek@lists.infradead.org>; Sun, 20 Oct 2024 20:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1729479712; x=1730084512; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iEsUo4lrwpljoR0FPBQuFvw1WkkxvZeqCHqf7QaSpZM=;
        b=VLfB5eMQqEXfz215Q1zObC08HSUosKEqmDV9SVCOzoYrlrNlYgd1g2KE+tappPRIey
         3/totGId9i+4Db0nTIV4+y9iwrJh16jx4OCCDktZa6VDADLJ0TceKG+npOHqEvMOJjNj
         haErNpQbno7IQbqMTLKFli0xLDZoJq0Ew5PSgVYuF9rH7FfgdxL89Ztf6S/Fjyn2sUZ6
         +/JP9l8faE018d1XUQjz9+zs1n4Al2x9ww1W42r0njzwTm7LwscWu5Em6McEFo5LQGAQ
         QJyR6Kflj6kdrvU9tSI/hCKwLuNcvZa7kj/3oy/ljlblYTf8i8ZTHwDP3qAhGd7zhpOg
         KrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729479712; x=1730084512;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iEsUo4lrwpljoR0FPBQuFvw1WkkxvZeqCHqf7QaSpZM=;
        b=Pu8jvmJCvg0TjjRr1H0kzxwUYnzTihpF52QqHG21rJWfVpNc5oqN1Ji8t3CYpnj1ZX
         gbiXtJcNks3GtVZkVYRpzgFLoxclfwxHwZ+TBp4yrHvNLoYpVrS9+50eXisDtFYHFki7
         YFbvELQUpMqiAXfltSy8LRl29gEZTTV9nbh+EgvVBugOFU104fiH9ElUFqcovOhhh3nr
         xROtXpXZ7uFItWecVXuNPftwTnx5xRQnNplqpR6wwfbEw6sLzS2cNuBhkgoSi3lGxPKL
         g6FqrE79d4W7v5UK6TF2t9rSCDxmkDCD49SZQqFxGiqlnihC4vIG9Tu790hrN3mjF4d4
         iKrg==
X-Forwarded-Encrypted: i=1; AJvYcCUMpC8NknSp1BwjwriOouIwQEpJCBy98YDZmuNT6B+RZCaAlm/SPGOer/qt3MVWXwpRvzPbj/0EH2BkFeHZ9g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7IGRHgD23mi8vxaB28V/PgXsSqJ1C5xJIqpzT7Z0YV1I5jJiA
	KbW+hwFWJ4vVfexjG6I6/9L9/GhRdbBEo3+bmrHevmiAekIz/wkO+/o/CBi2NeI=
X-Google-Smtp-Source: AGHT+IGDe3DRRdpAyKVZRtaEWeATYT7/taYp+e9vwdg8Vef8+J128rMKxDPUIbFSJXh1jcZ7xUMuRQ==
X-Received: by 2002:aa7:88c2:0:b0:71e:4ec7:aece with SMTP id d2e1a72fcca58-71ea3267be7mr6165936b3a.7.1729479712451;
        Sun, 20 Oct 2024 20:01:52 -0700 (PDT)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec1313fb5sm1815601b3a.7.2024.10.20.20.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 20:01:52 -0700 (PDT)
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
Subject: [PATCH v3 1/4] dt-bindings: arm: mediatek: Add MT8186 Chinchou Chromebook
Date: Mon, 21 Oct 2024 10:59:35 +0800
Message-Id: <20241021025938.676-2-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241021025938.676-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20241021025938.676-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_200153_685577_014284AC 
X-CRM114-Status: UNSURE (   7.43  )
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


