Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED2EFC6197
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Sep 2024 06:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZMbpfoBsozAlPEt45oixhx4qB7QHE0ziqmDEI/ywgss=; b=QGMO5PK82VrmqVEfYW2KK4wKye
	J0ynYDh5RGIflui+dM957EOPK4w8gjhF5EEe5A/KjEO/lAtW/aQt3J52QbvHqz6W3MGeoZRhVZ07x
	v/2F77Bss5jpYwUPBZVgLY5feevYlVTdfQGVLuWOxam7Iz2rKgmdnUuf0D6tiF+/Np26DnwflvSnR
	DbZqoSj7lP2Ll/yPB1qIWVCk+E7V3wSkerc84vUl8ilPhVXt/Zwufd7WLIqMY3Ja1qj3wM4NMcAsS
	ega3oYUVHeWJs0rWZFrfZfiPo3nS6WxrIdFQI2lPIHnXSOOvUXuBsPdK1D8+848uYO8XD4XhYdSiZ
	I/Wjjz0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spMJp-00000000DHe-3LEJ;
	Sat, 14 Sep 2024 06:31:41 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spMJn-00000000DG4-17wx
	for linux-mediatek@lists.infradead.org;
	Sat, 14 Sep 2024 06:31:40 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-718e9c8bd83so2855596b3a.1
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Sep 2024 23:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1726295498; x=1726900298; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMbpfoBsozAlPEt45oixhx4qB7QHE0ziqmDEI/ywgss=;
        b=GnWzbpJM8dR+W4qJXSlFvMXtnUM5mQd60Qr0rdtvzfe1kTHdFBcxpiskqih7Sc30S2
         DiqzdAHy4jLtndHefib6mVP6GKD6nWki6oNjANkijGoOhqXgq1lF6UAqhP+lk/Tfar37
         oY6ALqMil9hcic+3DSL2qqKQ1RhuqCUhrx/gtfGMDQGwkJOiL7cun4ScGIzxQBPJYwCj
         Lpg7UQVeC1hsjPIKVqzQn7kOPivqzcrXws8Sha6hDPCyYIR/a8abndLaWT1yKAILLcI+
         QIWLQipw51VpEBAB+XQFC5K+rVW6OumpvOAcJpDcxJ7aaxitx+pzckHkrDb9kxLpJgDH
         BHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726295498; x=1726900298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMbpfoBsozAlPEt45oixhx4qB7QHE0ziqmDEI/ywgss=;
        b=XlcRZWUE5gAQEh+tk7euJl57r4QCGB0ZCFJ7cdw9kSYnzr1q9LyBHtJjeeiJA3UTIV
         ndL+crWqHI78GqYlSdJTb1CU1cyXtGFjPSzfKl/lKHIYPqSAAMTrkEEnohzP3UfTrVjf
         BwIHLrodznxkdkTwjlJxo1B+gJCXDhjviMRKZFcmHBvtuLQHcN1ISVhEnr5n24jUCvAm
         7ahNFU26BVxyr1M8nJNCk3d0DJw/R2YE68DazTZt25jYBnb6vJgR4fNnyQpVl64o36gz
         vCdtiiAWIeU17m+fqojHdkgPoGXDHbX3PhxCkeeUNfU8H0Va/UP2riQ4wv2Du1A00X33
         EJNw==
X-Forwarded-Encrypted: i=1; AJvYcCV5jroNW3hsJjWdTc0bxme49Ya/MzyIAXViY50o/K1WVVezYYuPW2WM9N49qbCxGkNW4qeXdtPk+PcB26VYIw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3fZei/ObU2cxqsZ9SKz7tQhMRsQGv3q+Z0feLbGjmGEwMG3ud
	O9dGn6zOE5YXOzSAn6MwhsdAKsHgMn5NZcjjzqHyUNnlir8ejxA51Utc4g6pYf8=
X-Google-Smtp-Source: AGHT+IGycpetak1pWQ8TZomDKaTDzd4/oHu4i8ppeV0iKcr0nagXoU73WEZHK3VSlahquUT08PKg5w==
X-Received: by 2002:a05:6a21:328e:b0:1c6:9a3b:ba44 with SMTP id adf61e73a8af0-1cf5e21aeddmr18019343637.25.1726295497922;
        Fri, 13 Sep 2024 23:31:37 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db4990cebbsm599216a12.37.2024.09.13.23.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 23:31:37 -0700 (PDT)
From: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
To: angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	knoxchiou@google.com,
	hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v8 1/2] dt-bindings: arm: mediatek: Add MT8186 Ponyta Chromebook
Date: Sat, 14 Sep 2024 14:31:21 +0800
Message-Id: <20240914063122.1622196-2-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240914063122.1622196-1-cengjianeng@huaqin.corp-partner.google.com>
References: <20240914063122.1622196-1-cengjianeng@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_233139_333970_6153AADD 
X-CRM114-Status: UNSURE (   7.87  )
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

Ponyta is a custom label Chromebook based on MT8186. It is a
self-developed project of Huaqin and has no fixed OEM.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
---
Changes in v8:
- PATCH 1/2: Remove custom label.
- Link to v7:https://lore.kernel.org/all/01020191ea98a643-2d0be5d1-e00b-48e0-b823-bfe2c65b0d00-000000@eu-west-1.amazonses.com/

Chage since V6:
- No change.

Changes in v5:
- PATCH 1/2: Remove sku2147483647.
- Link to v4:https://lore.kernel.org/all/20240906085739.1322676-2-cengjianeng@huaqin.corp-partner.google.com/

Changes in v4:
- PATCH 1/2: Add more info for Ponyta custom label in commit.
- Link to v3:https://lore.kernel.org/all/20240904081501.2060933-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v3:
- PATCH 1/2: Modify lable to label.
- Link to v2:https://lore.kernel.org/all/20240903061603.3007289-1-cengjianeng@huaqin.corp-partner.google.com/

Chage since V2:
- No change.

---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 1d4bb50fcd8d..88f50989ba3f 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -257,6 +257,16 @@ properties:
           - const: google,steelix-sku393218
           - const: google,steelix
           - const: mediatek,mt8186
+      - description: Google Ponyta
+        items:
+          - const: google,ponyta-sku0
+          - const: google,ponyta
+          - const: mediatek,mt8186
+      - description: Google Ponyta
+        items:
+          - const: google,ponyta-sku1
+          - const: google,ponyta
+          - const: mediatek,mt8186
       - description: Google Rusty (Lenovo 100e Chromebook Gen 4)
         items:
           - const: google,steelix-sku196609
-- 
2.34.1


