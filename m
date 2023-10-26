Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8F3C25B6B
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Oct 2023 19:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yLZEufX4IELLQNXAIl4tmqVd4CvacXFJyoj0xSht3aE=; b=PErmfbBWQ6yclNWkdCLlLoXOUU
	10Jty1yeMRofMr4f3RoB1F7gccg4Up8kIUR3DPxg/ssFWUR5EFkRMokHXIGi+2JfZIDOc6K5PCfLl
	akQfmy5OgJr4aBd1d2SZvHvxqBjIoyABzqZJlJ2mWUSqEqAK0S9fFJQTO3J6rhyrKpMZLmudjwvUf
	7CDl21xYf5C/6JrpBkjqjdi9l5XhrU2vliikR5/ZQxhBGZUfprBXTqzng2a12x9ndRXySRB0If+cG
	NQiZdntG3dZlnftuf/JNIe9w4f5sT6R7R4qeBOZMA17v6Vv5MTWoHrtkuNmontiA6nZkCJmEYBjfV
	o6iCWj3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw5nr-00F2DB-0Y;
	Thu, 26 Oct 2023 19:13:59 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw5nm-00F288-11
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Oct 2023 19:13:55 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1c9d407bb15so11554285ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Oct 2023 12:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698347632; x=1698952432; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLZEufX4IELLQNXAIl4tmqVd4CvacXFJyoj0xSht3aE=;
        b=S17HZqc/v6HU8f1XVwd8S8c3kVT/OFB9cAxeU9ZOPVP5fcC4k09kp1GtmrL3vcxA9I
         h3WJ8sqA0NFwt2ajsfn8GRuYBqdUX6KZ8M4iZKRBwD7j1AJG6TpUsbxcDHRHP/OsS3+8
         PI8hTxInrhalLeoCwNOZgpKWTpn1NIOeLckXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698347632; x=1698952432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yLZEufX4IELLQNXAIl4tmqVd4CvacXFJyoj0xSht3aE=;
        b=aqoCcYlqgWP0aofPVTfuQAlmUt3klJpMEwdPpGwyttnPJSlpS+9LiAgXDgUMudPTqh
         waFiDRjXO3dznTfv8lH1lik/NYbncSkKnHeOpkSgf7Pt7ga9QKg9EKLCwRz8U2iW7kJV
         hl02sNaHyArNJCNH3FeAPkhsXLsYIUxmRLz2mS1v0c4bGs5JK1uD6lC5hBUouHZuXefG
         KnpOEvhPp+pVfTKv1EW4+zy3NFTLk+mZ3OJq7eQxsA+2KiX3GgbQQLyms/x9YRFppCy0
         Dwq5v5G9l6h4xbACS+ZRPpiGidyMD4SNQwatLlr2X9HraW/82jbyT9f0Yl2BOGIB2FyI
         SH2g==
X-Gm-Message-State: AOJu0YxzQNHrd77Qg59lpE5GcTuAwEZBnoeho5bS1Ljci95+88m4eH4k
	N32wkmCrWu3AsgbW8qPWV6NVpw==
X-Google-Smtp-Source: AGHT+IFk7vjIEklI72YfVhtP3+bOj+LPS0CVkNSGaWn6qlYyy7hlM3KbxfKPXYk+F5DUBE/ZxPVx0g==
X-Received: by 2002:a17:90a:1918:b0:27c:fb63:9c89 with SMTP id 24-20020a17090a191800b0027cfb639c89mr521631pjg.0.1698347632103;
        Thu, 26 Oct 2023 12:13:52 -0700 (PDT)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:f0fe:5c3b:1d70:d0bb])
        by smtp.gmail.com with ESMTPSA id 22-20020a17090a031600b0027476c68cc3sm2183639pje.22.2023.10.26.12.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 12:13:51 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	=?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 4/7] dt-bindings: arm64: mediatek: Add mt8183-kukui-jacuzzi-makomo
Date: Thu, 26 Oct 2023 12:09:13 -0700
Message-ID: <20231026191343.3345279-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
In-Reply-To: <20231026191343.3345279-1-hsinyi@chromium.org>
References: <20231026191343.3345279-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_121354_354263_4EF1CDAB 
X-CRM114-Status: UNSURE (   9.08  )
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

Add makomo sku0 and sku1 which uses different audio codec.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
v3->v4: remove error const.
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 4fe58cfe6f1b..c937f49ba3b4 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -251,6 +251,13 @@ properties:
               - google,kodama-sku32
           - const: google,kodama
           - const: mediatek,mt8183
+      - description: Google Makomo (Lenovo 100e Chromebook 2nd Gen MTK 2)
+        items:
+          - enum:
+              - google,makomo-sku0
+              - google,makomo-sku1
+          - const: google,makomo
+          - const: mediatek,mt8183
       - description: Google Willow (Acer Chromebook 311 C722/C722T)
         items:
           - enum:
-- 
2.42.0.820.g83a721a137-goog


