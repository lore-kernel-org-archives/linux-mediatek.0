Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC4BD0E6C3
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 07:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iEsUo4lrwpljoR0FPBQuFvw1WkkxvZeqCHqf7QaSpZM=; b=Sm8BtGO4QM1/betV7fKeIq9IyO
	QD1agZRDCK60+lD9CGLz+/fTdzsjK1LdA408KdZIQ7x+VoWhpdhvWprXPBYXjk8ddt1jqwaXiP9iv
	/Th4yCkaabPb01rJsZTdknH8uOn/Akl+kZBw19tuokE8+z4Awo6W4RJMYxZAuQNdf93iPFsQYIErt
	m2z6QHZOW4IU/vj6gIP7TOfDKWv5vSDezW9mP57XadmQatfmGxWDf5QZDFaooO2vV8tBRasBla7OL
	dpcGcMTVrFG06jjrwT18mfHMz2IP3NwCYMy/aYZFaZmVYIKlpGnJxY3sGZ3xrcb4uQcYlYQQdskik
	IWSXDqwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2mxw-00000006OSE-2xbk;
	Mon, 21 Oct 2024 07:36:36 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2mpB-00000006NGu-3tK4
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Oct 2024 07:28:30 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-20c7b9087c4so3166745ad.1
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Oct 2024 00:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1729495653; x=1730100453; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iEsUo4lrwpljoR0FPBQuFvw1WkkxvZeqCHqf7QaSpZM=;
        b=K6Se9UwLNp9hdh7LLfZrrg+ot3aXR00HH9zG5J3qN4hmIAdECGCwbuF6JhZsZ0BzuO
         yPDsvuDMF/NvZ0WdRI4s0ONugUiJrTPavHVH/NY5u2cYuYyc5bRnnyQKGFZBmAbLsJ3Y
         2O4acl1wNHsj9z/ScescRStMiK3XarS2F+hlLlc1F6DqdolNU9ZkLZsLgJbt4g3QKrzw
         peWPvBDtlmWds1EQNJBAKGnJ2pZRG9+Wf9KrIKxCEyGiToFQ3CUeDMlxsYENB0wlgATU
         8B4qJYwolaowQ8Mz4S4IolQxYrrThB3hCpYvqWVyOOW3fYgRbfmDEtz5Lb7/IQnjM0ik
         TCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729495653; x=1730100453;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iEsUo4lrwpljoR0FPBQuFvw1WkkxvZeqCHqf7QaSpZM=;
        b=Q5W+jyAFNFyv5jBT+6so2oVs2/uzjtGMWxNmG6lcZHzSK50WaZ8Qd3bOq3XpjLsG7V
         5cnMbyUcrKdMyulHCQwEFVj8rsxcWwyGELSo7vfjONu9EHekh/yomlv/J0bVCmE/mjlQ
         lP5uJ59IRlEvn3JopS1xWa26w0Bl+ChUsSOsOuZAzSz4aqkNChyJYbdNchA+hvu7Kw9u
         T51pwhD0zJgBJ0lm4GMptvqtS9M10P1K0UTRMotOWsGQbpIu1ga3z15OxTYKwKJbET5N
         moZ0Tzt95lScVWyrc8ZqbAQ22BfJ0gppvF6WYhC0nnhchKsUuHJ87rtcm8oVBVTrl/GG
         A1/g==
X-Forwarded-Encrypted: i=1; AJvYcCVegStkhk/ZeWS65qoemoxh1OuJcJ2d4TuvTRdtNKstTJAS3dE0dZd27/vgzHmuERozX8dkvOiGhaStNv7eew==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPK351rwxM6Jtd81IZTaSQ+HZHAlRa22bWmS7B4PZVHNZh+/wb
	XNTal8rYSon5b5RdM2601l8uT80DsEavoezGn1iB5hPij8xwGEunzZsRbUtEQi0=
X-Google-Smtp-Source: AGHT+IHVWdo9DzZe9CvJAnnR5Nm6etKX28vGhiPfuoocslDk2019rofbtIMsNYuZn74vbuM1Sbeinw==
X-Received: by 2002:a17:902:e807:b0:20b:a2b8:1863 with SMTP id d9443c01a7336-20e5a7a3339mr57169335ad.3.1729495652874;
        Mon, 21 Oct 2024 00:27:32 -0700 (PDT)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0db2desm19749595ad.203.2024.10.21.00.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 00:27:32 -0700 (PDT)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	hsinyi@chromium.org,
	sean.wang@mediatek.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v3 RESEND 1/4] dt-bindings: arm: mediatek: Add MT8186 Chinchou Chromebook
Date: Mon, 21 Oct 2024 15:26:23 +0800
Message-Id: <20241021072626.15102-2-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241021072626.15102-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20241021072626.15102-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_002733_975632_BA5F58E7 
X-CRM114-Status: UNSURE (   7.78  )
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


