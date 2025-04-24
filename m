Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4ADAC369D3
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Apr 2025 01:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VF+0Z9XtQWhK4xM02Ytbsp2xnIrbr2wRpFPuWbjHR1Q=; b=Eehox+Ld+1YKWTflWZCPnsr3l6
	2GNGvYIim4wUO8Y0mzqpOm+yrHbP5j/JKRI17hzOGf3wH2Tu/VY/3wlV3GXuySQJZieg/82eC4R9J
	7yCM9F4KbXnLYnXWXvvoVN4VSHShKOZVAAQCNt7nhZO0kfJARb+n5wv+zVj5L/oBmxmgztnRtwUC9
	oKwJirjopAZUbhIvBRuEwMGkxSplf75TJ0XwSqWW15B7+FVZ7XgpbRgLzHvbpuDaN77gawYno7SNF
	j4KU4gE0NIti7vP7KeZo+1VsnwiiEEfA0GASAcxkedd6N3qWxu1kvs5G3OYGV8wPDCTwLhtBFBIBQ
	XtCmbZuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7l90-0000000CUaf-0P8R;
	Thu, 24 Apr 2025 01:12:50 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7l5J-0000000CTrx-2ML5
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Apr 2025 01:09:03 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-736b0c68092so340391b3a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Apr 2025 18:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1745456941; x=1746061741; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VF+0Z9XtQWhK4xM02Ytbsp2xnIrbr2wRpFPuWbjHR1Q=;
        b=1UrDS7D7qGx5QX38zPkpY4/RHbbAdRySs6pJEOQxrUGZxbZkvgU092TfAcGZ+ih+Ce
         fBMsRj5fT0KLWpB7rkLSGbRUUzIVZV7snyaNBXYHwewN2Fp+0DQmAaVoPqALZ78v4b61
         h/ezwi/XSGibZn7mYR/bWgmLF996FfxGjJF6GIv+NxGpdCxQkXeZ09o2bAI8EUDzUVFE
         yX3LrV0OBCukG9kZF0seCOXuoxow42WqXRlpvgjNltMEht0wg9A6QsHjk0z6B7O1M9fB
         O9VIZOm0Hf3Zoa3ttNpr6f5STBk7K5Bib34cis7XkUAZa/lkca+60EC/m2BHFGpcGBNX
         Nddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745456941; x=1746061741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VF+0Z9XtQWhK4xM02Ytbsp2xnIrbr2wRpFPuWbjHR1Q=;
        b=fzSiWXI/vBA4GgQckVjxRfCQNWQ/Xi2M2grkQ/2wj68Bx+Th5GwEvQldg71sF3zJ5h
         FRw+5NsKlKYW48lUPDBn9Zt79v1ZLsZeVFwQWixyTdiWdwmyVOKG+JKl5zuBtuCR47fs
         l8L/KO1MOVWkkgvQrvc4IeqWnwzQ9O3fZFdTr+KQo8Hs4hCw0ShabJyOtdHS/PNGvW1l
         4EOQquXfCZxLYrH6e8cHa80r/BU3nbOq67R7XbwPAuq82RlVfdeanBa6RQ6NyPsMgz59
         8qniGVeGDis579TwKKezHDYUB6aj8TqebMpIxE9bjAy+/6UrzTPFoIY2cn+mNSoP646z
         uChg==
X-Forwarded-Encrypted: i=1; AJvYcCVxUKXb91WFj8Hs+6jiLvR+ySgIGL62v/T1jcfG3xI/UxQhQzltdFV6jMSjSeS17/Owo1yqVbcZbLOlgTIDig==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2Jqe4FUlJvdgsCKWDmv68vHIVOUEukBJo14CSPba8Nqn5ndNL
	FfvCENEjqA/8W9W5nOg+LCPPEZQJ/HdNLlforNyVPcXnDyJYQtNNbaI0y4Puw6U=
X-Gm-Gg: ASbGncsyT9vgOLVi7ohq51gA3jaTGpTEkY9q3QuCwCktJnKhT1hpN7UHfyBkqy1q44Z
	tkftbEeHfB8Gi8WpTC+LJZwVcV4+CfBtJl7FdrzUGtSt/y946Mw7EnbLTAFwFLR7w4kJvMe7Mbo
	B4YlTVU2Eeq+7Zg2RQ9eslJJHFRWPDVRJ2YnAkUQPSniJRS9QXh/+FCdxcGbwpqqqur3Yplbl5f
	ByLIyXkA1E6EYG4xSBHNILcJxTJW4CEVoB6TsaEudlmwyrbSNVG9Dqbuu/MMhmzuzVwkdigdkLP
	0iKk9zpA48JXnXmlRXQkp+PB7gmNQsO9ud2WSQ8vO/epSgIiUSxZFMINudZJ3lAjl7uCIgT2lYQ
	=
X-Google-Smtp-Source: AGHT+IEtg9+UM1qgOmmMcagcoC25vt6k7kN9IVgAb2Yi1Mg8BWfSCaJvnh25Radzm1TcN726SEaGnQ==
X-Received: by 2002:a05:6a00:1947:b0:736:3c6a:be02 with SMTP id d2e1a72fcca58-73e2462f2b1mr1025718b3a.11.1745456940726;
        Wed, 23 Apr 2025 18:09:00 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25941d65sm236071b3a.63.2025.04.23.18.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 18:09:00 -0700 (PDT)
From: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
To: sam@ravnborg.org,
	neil.armstrong@linaro.org,
	daniel@ffwll.ch,
	dianders@google.com,
	hsinyi@google.com,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	knoxchiou@google.com
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Subject: [PATCH v11 1/2] dt-bindings: arm: mediatek: Add MT8186 Ponyta Chromebook
Date: Thu, 24 Apr 2025 09:08:49 +0800
Message-Id: <20250424010850.994288-2-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250424010850.994288-1-cengjianeng@huaqin.corp-partner.google.com>
References: <20250424010850.994288-1-cengjianeng@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_180901_605899_CFD0CAFB 
X-CRM114-Status: UNSURE (   7.13  )
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

Signed-off-by: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
---
Changes in v11:
- PATCH 1/2: Remove redundant items.
- Link to v10:https://lore.kernel.org/all/20250423093647.4074135-2-cengjianeng@huaqin.corp-partner.google.com/

Changes in v10:
- PATCH 1/2: Add enum for ponyta sku.
- Link to v9:https://lore.kernel.org/all/20250328094034.3400233-2-cengjianeng@huaqin.corp-partner.google.com/

Chage in V9:
- No change.

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
 Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 108ae5e0185d..fa1646bc0bac 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -285,6 +285,13 @@ properties:
           - const: google,steelix-sku393218
           - const: google,steelix
           - const: mediatek,mt8186
+      - description: Google Ponyta
+        items:
+          - enum:
+              - google,ponyta-sku0
+              - google,ponyta-sku1
+          - const: google,ponyta
+          - const: mediatek,mt8186
       - description: Google Rusty (Lenovo 100e Chromebook Gen 4)
         items:
           - const: google,steelix-sku196609
-- 
2.34.1


