Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAF5CCFA16
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Sep 2024 12:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ELDmQtxXpVLogwubqzTMS3LPGqaX3x3eR2JGyzb/QuM=; b=j3+v0OYIro0t77NJYIuMVoky+u
	oqP1IVGJspt5GmAu67VehudHcx45KOhV3q7t+qxVxNB3UhyDIlG6R9iTLTRTiGidyyjWgttcbfi0Q
	AjNsavCCDxPqvUU6HOwXjgaL7PxgTzvBIFvC84FrB/HJnrgzTByAQEaVKYvO1NYIIu7We1u6KPEQk
	umoj8WPK+Xnz4HpFyGeuFRooMMxaCvLbks3S0uZdgzU7oA54kTPPTTLD8NERwtWlauPjDyMEJOawT
	F8YYKJQKdaGuKz0o1iMS6rdVtHG4GZUYbtouk14yLkNG1RIMXo+fBMb3L+St3qfhGan8fuM2mbYhm
	551U8g0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1su9wv-0000000B33U-2YNZ;
	Fri, 27 Sep 2024 12:19:53 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1su9vj-0000000B2sC-0NWs
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Sep 2024 12:18:40 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e230808388so31601297b3.0
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Sep 2024 05:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727439517; x=1728044317; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ELDmQtxXpVLogwubqzTMS3LPGqaX3x3eR2JGyzb/QuM=;
        b=cwsouLM2Foqhxzkcui8YFGnmZdHs5aFNO2/C8D/h9K3yKOmUoAVse8vFMsY2Q6Ez1/
         wa635OokPbxdfV8sAQ+8xM7BsMZ3SO4dCuYx3u+l2nhimkalNSRcY/JyWGiuSqxabw2Q
         /H9fJ2iwIRNdsIN9RUaK9xxgJVGXYZFeXvyLlNjFXN4HkAGAViOo7HyZJ/b/KX2/vCUU
         gqtEVSRtIGaR2lhJlYMhqmIVASGk+nvWp+hWF6JJXJRa1JRJX8jxyypuzvQ6SWIRocaI
         qaZ2Q7analWo6DAbPqB+75j5gt8TLlAm8nfn1FXoNPdjyL1+WBtQmQxkz1n6SdaIV7Sz
         UGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727439517; x=1728044317;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELDmQtxXpVLogwubqzTMS3LPGqaX3x3eR2JGyzb/QuM=;
        b=LiU8igQqdF5Qx5WY8F3zG4NtHt4tdei6O5Zh1fGZkdaL3IrWKgDSQv7OLwp66X4+sg
         hdemzt3TBJYiiIheGQpX1D8bQU37GYcNc70rJyYsfYRE9XhvUBqyV4Z2e19O+oAIvVud
         DHyh+9dBokPbXHehC75Pqty9PrzTB7ybbnWKDfWk/ocNjUFS5/2xjQINk1ORJSZ5KOkp
         ZjSYlVCCFnMMHdF8nY8e0UsqvrD8G6WHVZ9sISSGQ2vzWyIdi7v1+zJ1qsSOmNhwZAWs
         5OWeTMl0edy1w4/YPY0InLlxW+TYTkN0Xb2gbfdAW3O+isb2gPN59AiITd2IJZrh6WeP
         l88w==
X-Forwarded-Encrypted: i=1; AJvYcCXnZIJvVU8kvu6HNLaJy2nR6ufY9Zne1djAR128XvJZBYwebtqOwAWo0I2i90bBD2MHem1A1zhaU17wVu2QNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ3JHo3qSRBzamTzJTtXepMP1B8bIxfgrSVnVCa14Lz7BBlJRr
	4frIo/jrgiXRNOjGF3kTeNtSmdeOinkecCXu6zY4+41csbiObjBCRno/YwmOLHjCJMcq6OuPsWd
	Ta8jIDQ==
X-Google-Smtp-Source: AGHT+IE8KqmibgTKaZZdzfDMUva1eju3nSdBv4cAgVn21FeAJz0pOOF7lsLcDdkXOl488n6rYNwhPcAvyq/n
X-Received: from malysz.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:a1e])
 (user=jakiela job=sendgmr) by 2002:a05:690c:2b93:b0:6dd:bf69:7e06 with SMTP
 id 00721157ae682-6e247618d37mr58677b3.7.1727439517064; Fri, 27 Sep 2024
 05:18:37 -0700 (PDT)
Date: Fri, 27 Sep 2024 12:13:53 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240927121418.4187550-1-jakiela@google.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: mediatek: Add MT8186
 Chinchou/Chinchou360 Chromebooks
From: "=?UTF-8?q?Albert=20Jakie=C5=82a?=" <jakiela@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: "=?UTF-8?q?Albert=20Jakie=C5=82a?=" <jakiela@google.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	"=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?=" <rafal@milecki.pl>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, 
	"=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=" <nfraprado@collabora.com>, Sean Wang <sean.wang@mediatek.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240927_051839_152545_67932A57 
X-CRM114-Status: UNSURE (   7.99  )
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

Add entries for MT8186 based Chinchou/Chinchou360 Chromebooks.
These two are clamshell or convertible with touchscreen, stylus
and extra buttons.

Signed-off-by: Albert Jakie=C5=82a <jakiela@google.com>
---

Changes since v1:
- PATCH 1/2: Delete sku2147483647
- Link to v1: https://lore.kernel.org/all/20240925080353.2362879-1-jakiela@=
google.com/

---
 .../devicetree/bindings/arm/mediatek.yaml     | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Document=
ation/devicetree/bindings/arm/mediatek.yaml
index 1d4bb50fcd8d..47efd96e5659 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -239,6 +239,28 @@ properties:
           - enum:
               - mediatek,mt8183-pumpkin
           - const: mediatek,mt8183
+      - description: Google Chinchou360 (Asus Chromebook CZ11 Flip CZ1104F=
)
+        items:
+          - const: google,chinchou-sku16
+          - const: google,chinchou-sku18
+          - const: google,chinchou-sku19
+          - const: google,chinchou-sku21
+          - const: mediatek,mt8186
+      - description: Google Chinchou (Asus Chromebook CZ12 Flip CZ1204C)
+        items:
+          - const: google,chinchou-sku0
+          - const: google,chinchou-sku1
+          - const: google,chinchou-sku2
+          - const: google,chinchou-sku3
+          - const: google,chinchou-sku4
+          - const: google,chinchou-sku5
+          - const: google,chinchou-sku6
+          - const: google,chinchou-sku7
+          - const: google,chinchou-sku17
+          - const: google,chinchou-sku22
+          - const: google,chinchou-sku23
+          - const: google,chinchou
+          - const: mediatek,mt8186
       - description: Google Magneton (Lenovo IdeaPad Slim 3 Chromebook (14=
M868))
         items:
           - const: google,steelix-sku393219
--=20
2.46.1.824.gd892dcdcdd-goog


