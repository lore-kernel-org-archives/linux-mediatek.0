Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9445C25B47
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 21:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Zb5Wh/eo+im2l7B1fmvT/WoiYRemD8ZCN2J8BNebAU=; b=3iinN8W83LHmLx
	WK0LsqOF34OiusOxFtaqPdXZ8Q4A3Q15jvVEAChI4VLcQJ+6rHKI4+FGmapsTZaVrra+0wQZ7hJ/k
	XKyftrO+Gb7pyKdrkGZKP9Mx7i9QJHK9aoH9P4DBjgqdW3/PLbZISzJzLKLAeCIFmwbg9RC+HPc3/
	lCgCMNOdxAUYlHDFURPxk35OcN7HN0J2JlMXQX5Tgs6XHglC8Ung6r/hJQxy2tYUX3/aTwgR89R8n
	ILa2if/srLW3HXW9ogxAY2xeflAGEgvcxfYYH3G4AgEym2fn6cnr+cAnNiPxk1b0cT68oc3KxBwBv
	mllkm5W5RRn8AApIs2xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvOvm-00AspL-2W;
	Tue, 24 Oct 2023 21:27:18 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvOv8-00AsRA-15
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Oct 2023 21:26:39 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1c8a1541232so42647955ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Oct 2023 14:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698182788; x=1698787588; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Zb5Wh/eo+im2l7B1fmvT/WoiYRemD8ZCN2J8BNebAU=;
        b=cJdHWuz2ErJB+wkWZBo9wV6hgJ7wYg+nA+rPZtgKnogvoQA96omEL26hKPFv/mQqOG
         hivJqlfDDK7W821txjt0PR2SzbmHjQGDf/uAeLRFTl8DMe8byo+DHOM2T3MMe5JwTyrb
         7DLBEZy0wUSltzV5ib9y20d99U/hrEREG79PA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698182788; x=1698787588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Zb5Wh/eo+im2l7B1fmvT/WoiYRemD8ZCN2J8BNebAU=;
        b=C4AYc8f+Xnh/PtGiSU+dMHhQDGiSh1+CJbVYWmkrvPaSyS42y6lDhrYNEqDlDkjU79
         Kg4kHIchLABZGJ7A+HvQsesr4rIOONofLcd+oixv7M6prilvVMKfnREoiAhkT7mqky/b
         x7ckpLlyvbPr7e0pqyRNdgQ2tbxxUCZZQxvB8psDUatVXWXyTCiJ6xTUioOro0L14gHg
         deNLyQKzKcVraiybs8k5SG9gwvKyYmLYEWmTrVxEB035hABc8lEd+ORLuNBE6Lb1ZCXH
         x6jExSujFcwdo7Tc61WV80QibFXpMElvUzqcyvm6cGiLROOkCvw8CuAhqrv3LFAtCrOM
         LglQ==
X-Gm-Message-State: AOJu0YxwHQJxE3VaOyk9dOa90INwh9IZEzkhcKDzFZWd6D9TWfu8x7fU
	unz+kOS1A2BPRRuQVtzWz5K3QQ==
X-Google-Smtp-Source: AGHT+IEHZNbRevO+MX5QpplNtldSLlaYzi6eCiT26xP+SBmDo9AFqh2UChobD3gyVfCa1s1ke+FKJA==
X-Received: by 2002:a17:902:db09:b0:1c0:9b7c:f82a with SMTP id m9-20020a170902db0900b001c09b7cf82amr16579647plx.53.1698182788321;
        Tue, 24 Oct 2023 14:26:28 -0700 (PDT)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:5a2d:c345:7f3f:d26c])
        by smtp.gmail.com with ESMTPSA id p9-20020a170902e74900b001b850c9d7b3sm7824140plf.249.2023.10.24.14.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 14:26:27 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 4/7] dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-makomo
Date: Tue, 24 Oct 2023 14:22:26 -0700
Message-ID: <20231024212618.1079676-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
In-Reply-To: <20231024212618.1079676-1-hsinyi@chromium.org>
References: <20231024212618.1079676-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_142638_385925_7E173507 
X-CRM114-Status: UNSURE (   9.41  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>, =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Macpaul Lin <macpaul.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add makomo sku0 and sku1 which uses different audio codec.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 4fe58cfe6f1b..af1037a95fd5 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -251,6 +251,18 @@ properties:
               - google,kodama-sku32
           - const: google,kodama
           - const: mediatek,mt8183
+      - description: Google Makomo (Lenovo 100e Chromebook 2nd Gen MTK 2)
+        items:
+          - const: google,makomo-rev4-sku0
+          - const: google,makomo-rev5-sku0
+          - const: google,makomo
+          - const: mediatek,mt8183
+      - description: Google Makomo (Lenovo 100e Chromebook 2nd Gen MTK 2)
+        items:
+          - const: google,makomo-rev4-sku1
+          - const: google,makomo-rev5-sku1
+          - const: google,makomo
+          - const: mediatek,mt8183
       - description: Google Willow (Acer Chromebook 311 C722/C722T)
         items:
           - enum:
-- 
2.42.0.758.gaed0368e0e-goog


