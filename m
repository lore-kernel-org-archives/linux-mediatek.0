Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E81C369CB
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Apr 2025 10:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+xSVSEjLLoJeTGf00+7NUDFSajI19htlW6OjqQ08dg=; b=fhKJ7YHXxY1/ULYQJQ4IqeBpND
	IYNTbnSv+BdGDiJXoB3j3aRC95apg2mmq4FBWFpFTD+g2sCWRu5DPY6hXyJYmdX5hKK9AuFcmZMFt
	itdirZ9vO4U4ko/NK12hQC6/3HoC+YGCn5IPuUw8Xszq1WrrjyqP2e+R97H1aUCfp4f9OeocTq/W+
	MjHpvh/P7113pMyH6h8LgoyQCQIGVHWqfQ8UDNyh5TV6LpDhxy+KEfkqbVQHgSU9Tf06JQqFUXDT+
	VPHwOYjqNQ782QWBmEyPSrnwZ/2bCjd5+uAWUx5iqtoci8lZyamRoAfT6taOLfmk86/kfEOHd+zTg
	30isVqtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7XUQ-0000000ACMY-47ic;
	Wed, 23 Apr 2025 10:38:02 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7WXL-00000009zsL-1kOc
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Apr 2025 09:37:00 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-af28bc68846so5266975a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Apr 2025 02:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1745401019; x=1746005819; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+xSVSEjLLoJeTGf00+7NUDFSajI19htlW6OjqQ08dg=;
        b=kFzZ0elCqOjXMMN1ekU/3ZJzR8hOZUdmLWOQZPnKq5iZElo0d6XyC4/iLclVfWCXeI
         CFT+NJOVkfrzVRUOZOGL7sz5l1rapmTwmHTJ4zJrxZvu8IYnZjYtk42FtFFJc1vLuenU
         aRpv49q/ZYIdGFmc3tHFJ01CMlld36lsdsl6juvHrLDAxMU09AvxTL69uFwhO03lruLH
         01ZqLxxjwuqn8hWoguJuRpuIrkzFkiABsFt+Ngnooll9p/KRMLqLvPIq0OcFFgTSvc3Q
         ZD+DjbWdDgP3n9qgL9RWVRaprpMXvq6sSQHLccCjh5avlGKVA6JCO+WwBSHM+NdzswK5
         a1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745401019; x=1746005819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K+xSVSEjLLoJeTGf00+7NUDFSajI19htlW6OjqQ08dg=;
        b=CEzAkyFUpr+1NpSNfP9sZBL61oEdCqdBlbA5/nUug0KmHFnkmHbc75G32bjxAGmBOB
         JMb/uVQTRX7BIb2hr5Y8yf1vFEfiwKD8SWkHZBIm+3fA0Oiq25RWwpf2DScsMC+vZQta
         Fulx6fdbrX3NPvpp+aAa3RhK+x2GhQWA5ffoaiGi/OaKtypksC+sghRfIin9wGeok3KN
         iSm0+nntyFDjEU0n6SgSHrJG4gmsmSyfNCHHazmqUa0YPdbRdQ4jtUx1gdKkQsfmiEXS
         q9hjqphZVxMfxtyCOAyNy9nmmF4v1c5Lx7Fx07BCX+IdNCe//sLiJY7T/irY6/6x6TRE
         I5Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUVbmwAsSQu5iiKk3cxhpVszsVz/GBu83Lz1fij93HJo8O/SK1EU8FlQ55TAJs07JW5PCXlZTVqaaDM5JmOdA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxqexvBVa69b9MES5BkqmY1tDGuIgWS82Uszv7UjSwmm1+NSzDo
	uqL1Qpbaf4/YrCy35yU1f/Wx7PP3lj+EHTdjAYXCMf3PEtfDIaupulVorRj1o7I=
X-Gm-Gg: ASbGnctIAzZpKMM0VH7Ixzex+M7TdZcN576wNtKJ6vw1j4tQ9m5HirOgVrY0i2oaU+H
	T86UJsRv8V/uuVE/0MbXo35wyV50VUOLlPvBBWk6HvsfvRdwJWjwg+RMKU7eOdt1Q697SZLCr7J
	27iVFRmRs/2jyHbRJb2BoIfGZIV8sNJycG34X1ZUbV+fOule1kzZA0Nf04JbAoCco/rmPUMTvFf
	ewl2JffHOw6RVpyuHuURWaM10KlspA//hTRUOdl6TMC7Vxf9kQk6mYWEYmGLExSucjXT3Fx7uV7
	YazXFMy7gXLY/sqUGDRIxcyxt+BEvp7rS9x1r2oXp/c68z5iDwdft/umf5eYkLVDtcIjqOh7j0Q
	=
X-Google-Smtp-Source: AGHT+IH4Modu/E8d48v1FsMHRhmok4QGpGU7FQB895A2U+1zbGEhQvVtdj5vu+Io3DYOEd0DRLMUeg==
X-Received: by 2002:a17:90b:1f90:b0:2ee:45fd:34f2 with SMTP id 98e67ed59e1d1-3087bb3c7eemr23304008a91.6.1745401018662;
        Wed, 23 Apr 2025 02:36:58 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50ecec54sm99557885ad.168.2025.04.23.02.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 02:36:58 -0700 (PDT)
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
Subject: [PATCH v10 1/2] dt-bindings: arm: mediatek: Add MT8186 Ponyta Chromebook
Date: Wed, 23 Apr 2025 17:36:46 +0800
Message-Id: <20250423093647.4074135-2-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423093647.4074135-1-cengjianeng@huaqin.corp-partner.google.com>
References: <20250423093647.4074135-1-cengjianeng@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_023659_459280_2A517D51 
X-CRM114-Status: UNSURE (   7.65  )
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
 Documentation/devicetree/bindings/arm/mediatek.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 108ae5e0185d..bfa38e7fd0f7 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -285,6 +285,19 @@ properties:
           - const: google,steelix-sku393218
           - const: google,steelix
           - const: mediatek,mt8186
+      - description: Google Ponyta
+        items:
+          - enum:
+              - google,ponyta-sku0
+              - google,ponyta-sku1
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


