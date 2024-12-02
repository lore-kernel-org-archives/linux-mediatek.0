Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03353D49795
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2024 03:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GouYOcgcE/dgc8yVEQqkmDyQoDCGAKL39BpZuNuexD4=; b=q80dzoBDMu/VEMeXg4ZAoWNpeR
	drnsq04rRbDABxIWi0m1EeCW0Pai5P9xjclgIanlgs4G8qsd33o1VnYPhzpHMo4ix1ZLbSLM1wmcs
	q4Pz4ekwrz88EYNIKrz+SLChgmRIJSG8NCl146lp2u8UmqsgXxGvUw84M38bpptjAS6us5gQP0Mwu
	NKTlmm16yJb2WxzAmimCZTYpAQbC6Lab9hWbxWGIEck5KbA4H6FB0g99jgna42kUPkCb3c+stLEh4
	6tOe9y9V79l1C9AAhRoyqWQcj/Epx0PueNW8lE8vGgtit0UWxqlVSCQuc79RR9V7EOo56f2o8iBcO
	gwg0AsCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHx6t-00000004wZ7-0wGD;
	Mon, 02 Dec 2024 03:28:31 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHwzj-00000004v6Y-3l0M
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Dec 2024 03:21:09 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-215564e34acso3113695ad.3
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Dec 2024 19:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1733109667; x=1733714467; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GouYOcgcE/dgc8yVEQqkmDyQoDCGAKL39BpZuNuexD4=;
        b=CY7kVEiDiSIDK4Esk+I14Z+wVvyUgdBBc7cpDeGgsWC0+FXUJYU90zOO7Ik/XOD0hl
         l1x8dhhm1STX01mgQFK7LcHxVqosfIuc7Iu96yN92W9g3nZtbXshmYwch2f2Tg312XcQ
         S+YEs6vOq0LaSbSjfBEdFfIhBp7hmfxl3IpJ+fsOuElVmldX4diDtNk7c1se5cYCiB3H
         NhVamGD8r6x1nxTM/o46HqZD9MXPt9e7MPTp+4OTRxxCOCn1WXM4YpE3mBBNGgNDC8aG
         +1rcBFp7Kveni4FJHwcXryEvWehVOehWuTv1cADw/HmEid2kSLZ3rmNqkfrug2tzUOrT
         OrXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733109667; x=1733714467;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GouYOcgcE/dgc8yVEQqkmDyQoDCGAKL39BpZuNuexD4=;
        b=mLQHxaHbE2bCbku2iTP6XuOAFlfEq9p0bQz/e7sfQOV8RSJC5N/qo1ttBAr3HakU/2
         qsMpf2Pmy7nIm/g4LcGh/HMD93dt8nYqhEr7RzIQ870MGG9TSmJWqfWYmon4YL2qROgm
         WYQdhRl1cjilpj8aTaW6desqf17XWQvT+Fy9hJHTtpTKk5xqe0SnvuZ9hz0nd4ouOcFI
         psGUPX1AFj/AmeK0AR70tkP+LdZ42uRJe3OU7ffZJp9Wf7KsgbCz1JG+QWTJ1CGVmL/0
         YBEcmFk2XrGfnubBjGuX/yrKkV6fKlZo49N1RylFCMUHtfk1OeZJEgfcixb0Yg00owzA
         vwmg==
X-Forwarded-Encrypted: i=1; AJvYcCU2O+HoUc2Ybh5CPe0Z/KtG5ZGSBnF8AEhmNnxaRrHQZXpoxsItcB34XoV0qV3hpm44c9yQvjqLNNO6BprAew==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/jMRY9XIXQw8kKchpqv7kN0cSbLlA70PE+z7tfMMLBiFkfmXl
	K0nxmMrcFNpctFWPXLu3oSubyAN9ii/3xpSVgW9llhRLkKN1GPE6VpzdJYwyY50=
X-Gm-Gg: ASbGncv9AmOJohrnZeuhzv9xiJtx1HWojqq4gdCljM2PA94Y2AiDELNurBgd0vd4F6F
	GEAn3P9CNz0IZCjP+ZBz8zsOlr2sC+oqjc6HQboDGo5ZRA0ZDr89ZYi0PPAOaeSypzA6etCCAKS
	BmDspS7bNE+d0aOE6zYq9ao5HO9CK+bZfojxL1iUWT19iM/r5kcgRegNDe2TXLwkBmk4UnM34RL
	SZwLd1kxrAJmnRtqzLPckYiElzNhijUJ+LpuKCMqaOsu4Aj3zh77Jg4TrmIH5K9uNl9xEUZem7h
	STTICQq8Nr8BBg==
X-Google-Smtp-Source: AGHT+IG1juPxVoOQhPapzHNQkFJhJwBvKjBtiOLjbNYz3Lf0IR6DiUN4N76jIyqAurE7D9qaEV6q9Q==
X-Received: by 2002:a17:903:190:b0:215:94db:1287 with SMTP id d9443c01a7336-21594db1560mr11596255ad.3.1733109666817;
        Sun, 01 Dec 2024 19:21:06 -0800 (PST)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21521986004sm66305725ad.184.2024.12.01.19.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 19:21:06 -0800 (PST)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	hsinyi@chromium.org,
	sean.wang@mediatek.com,
	dianders@google.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v4 1/4] dt-bindings: arm: mediatek: Add MT8186 Chinchou Chromebook
Date: Mon,  2 Dec 2024 11:20:32 +0800
Message-Id: <20241202032035.29045-2-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241202032035.29045-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20241202032035.29045-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_192107_932905_3E90A20D 
X-CRM114-Status: UNSURE (   7.26  )
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


