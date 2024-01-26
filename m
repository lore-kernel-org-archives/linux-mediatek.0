Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E870C48260
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jan 2024 08:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKzePUGiZpVCb+bUEgD2WbfAbzcapL4u7uh81bBR8VA=; b=pIKeMZAH/lbyI7l3S+nci0jnms
	YRDzcDV5dKGNh8R3+jZGGdEGrV5h6fNbInaPXEUEFDVq8cSrUxxeyyRbYE7B3XdjRAZKgttC9ANAF
	67y0ue24FTxRxzplq2wn1qvFZO+z5uXF+lh8X3jgADXUN2iik85fYwUcDn2LipEn8HAQQOtLUyY9L
	/0TwjyGs3eNkQA+sWwP2Q6V2AG4WSUV/lsTUH3l+O5EpZy8UPCZXhCDcbL8i9zsam6rC110Ke4aXC
	fWWUQQG55WKF41HE/a8ed35x6TfNXFS8JNRIFtkUrFF4HQ1SGIB64tHsMUIFVY4qFC4ERbhax4por
	/naqSz5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTHjW-00000003Src-3s3y;
	Fri, 26 Jan 2024 08:38:42 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTHjH-00000003Sfx-1z9J
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Jan 2024 08:38:29 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1d731314e67so389415ad.1
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Jan 2024 00:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706258303; x=1706863103; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GKzePUGiZpVCb+bUEgD2WbfAbzcapL4u7uh81bBR8VA=;
        b=UNfH1AAhRCcUflunHJ0sqQBIuW3phO92Ax130vTBEzzD4ltVIVMMKfDL0CKSkPvFLJ
         GXEIjLAsYXgY0vOS8imSReEPJ+wZDMDo4LJuXgV/+1lbepJ9rWF5P/Su0DRYhcNgoJRd
         RyvrMtmaKF+PCB5sTVRZ34EPYMYAmNDmYpiUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706258303; x=1706863103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GKzePUGiZpVCb+bUEgD2WbfAbzcapL4u7uh81bBR8VA=;
        b=rZq9YKTGUN5PmUiYeM2Si7FwWqwgpkuMm4SXJUYlhoDYtbR+eXEyRrmFjY73R5BxzC
         AOS2edu1kP9H5CPpPV2Anm39W0ocJpPoAYB27VXkmzpTq5nj4rDTdrZp6QoVZKSMqN9u
         0ZRMo5OEObSqTB/kU0yygnrZrW7IFI+XdDSmhwV/467Kn6Jm+bZir4eg0MEnWAx7qo25
         +OhyIBPCCflHo3ZnLOW2Ds/wUIw9N9nnJ8Gyuv0QmxReRz2adK0BvCsuPTujbzQD2zIn
         UIr6Lz7pTSZTfbC06G7xsKBH0igCmY/Y9SuJ6IMqBr5p0zIlGTicbpCSilWdp+jNXSAe
         7ASg==
X-Gm-Message-State: AOJu0YzpOyHlKxYAiVakuFdqQu8DUFhu8D4DMwZUJivmA4lpfcdwrkTm
	IWxeXnCrFQe74kj0EW/NmQLkXLJpFXfE0lgp4ArJcoVfBZ+zkHttZVZnBbhckw==
X-Google-Smtp-Source: AGHT+IGoX96u4tjHCtE1Z/7U5hmcjioZkWhGRLyo7bwfK9lQa1gK/mT/fr7N573TKumHNoAFPo3xfA==
X-Received: by 2002:a17:903:1c3:b0:1d7:2817:a63a with SMTP id e3-20020a17090301c300b001d72817a63amr1016382plh.19.1706258303293;
        Fri, 26 Jan 2024 00:38:23 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2614:bbbd:8db2:1f54])
        by smtp.gmail.com with ESMTPSA id b2-20020a170902a9c200b001d6ff1795aesm589529plr.8.2024.01.26.00.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 00:38:22 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 4/9] dt-bindings: arm: mediatek: Add MT8186 Rusty Chromebook
Date: Fri, 26 Jan 2024 16:37:53 +0800
Message-ID: <20240126083802.2728610-5-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240126083802.2728610-1-wenst@chromium.org>
References: <20240126083802.2728610-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_003827_610612_A668C109 
X-CRM114-Status: UNSURE (   9.07  )
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

Add an entry for the MT8186 based Rusty Chromebook, also known as the
Lenovo 100e Chromebook Gen 4.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
Changes since v4:
none

Changes since v3:
- Collected reviewed-by from Angelo

Changes since v2:
- Picked up Conor's ack

Changes since v1:
- Reorder SKU numbers in descending order.
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 23acfe5ed940..385bd2765626 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -235,6 +235,12 @@ properties:
           - enum:
               - mediatek,mt8183-pumpkin
           - const: mediatek,mt8183
+      - description: Google Rusty (Lenovo 100e Chromebook Gen 4)
+        items:
+          - const: google,steelix-sku196609
+          - const: google,steelix-sku196608
+          - const: google,steelix
+          - const: mediatek,mt8186
       - description: Google Steelix (Lenovo 300e Yoga Chromebook Gen 4)
         items:
           - enum:
-- 
2.43.0.429.g432eaa2c6b-goog


