Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57A5C27C4F
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jun 2024 10:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yrRDhDMAfJony6yFg7+6ijdc+Hn8JcmRpBDuBtH438I=; b=RyvAzOFl588qNfCFyjCfiJ/RgX
	WLE4pqV5s9t624uI8B7PUbzYJSAJMwyZwxj0a0XM+FczCXRPLdkhjnlQCzcEbFO/h4qVjoGZ2ZM4w
	VyzrPGWYx5gZ2PHYzFqObJCOlSpZQYciDkotY3d+MGgym7rx//QM2U1OQfEYvFJnqYgqbILJHbz7P
	H0CaL3YusyVHWM9KUg0Daf9KwCc0Zv26fBh3YgvrXNqOvYGP2uRxyWVSbknTp/FxXn9Xfqre93FAI
	ndYGkDOoiBTavbwfU6d0wtH8ifM6rGwhRUMDBWUGr6Ol5AyJfrWlzEUyWFkMZDKmUwsvl7zD7N+68
	JnvrGq8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMPay-00000006FGH-2GyE;
	Wed, 26 Jun 2024 10:09:44 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMPau-00000006FEM-2qZz
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Jun 2024 10:09:42 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-7ebe508fa34so352779139f.2
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Jun 2024 03:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719396579; x=1720001379; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yrRDhDMAfJony6yFg7+6ijdc+Hn8JcmRpBDuBtH438I=;
        b=ytCPCn6/tmd6eEjYNJ73jmQFhcrkda606qhZJyFvJRWNyU2K6ID5fWCIEiDUezgomS
         2/b0tGGvYavecCde8vrH8d658I2YIQTaAbWvYeem/SVy6NAulWFFcwQDftrYEX0Kd47X
         mWm1dqd/+OLNkaGRw5ZQRxCL/IHjvYjNHEVdd6+DxUC59H0OrChzOv1+v2Gtkxtimaoi
         wYgCHHoabJjeyL6G1omjIqsj6ODEhhBg5v5cuf7IJePQCzyV8f53zCHFbNfRwj43OsHl
         FTTAxyup50iCYIL4/TzRXYcViat4DQMQ7r+RCbYZR3eDAFjbPmS9wToAuCeZjP3GVdGT
         +CpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719396579; x=1720001379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yrRDhDMAfJony6yFg7+6ijdc+Hn8JcmRpBDuBtH438I=;
        b=rlwDlDCpVnHKdxWGgngB/mKfQklcYnK3KaiPfTURdKSVBOXBcjxmaoJFq1kEg0V4dQ
         8KPh5nZzNWKganYQYfoGknhFyVmkz+XxUH6clyDP5x1jziEIB17B1yEMAVg15QYqFlxr
         Oe8/MHCqjfsOXYHdpChfiIQnTPnfCRR/H4BGMwtHFbKLfB1fi2KXkd6kzyYESuOCo8IL
         egZKlCq4A3cekaCq3Or7TICbybSlRK/OW63R/so0YmLNNUNMwgA9JhbOdzQobUeOUOGK
         gzEr4Pon9LYrisMv70qf0SaqCzPpF+wGzOJwmS568Toe0NCulr8NlP1Fk7nr9mT+R2VA
         mvXw==
X-Forwarded-Encrypted: i=1; AJvYcCU/lg/DXkYxs+/qkcR/bku2uVVBUGmoKSm21sYXLxqN0FAEg8Wg3SCXWeoZVTM6APiu3G0wcINQJEFLvJTvli8e2Qgo9GFQTbcrSB7QbWNaPXFW
X-Gm-Message-State: AOJu0YxIl4cmuanD5Agx7ImaKu6Jml3h6weahP5TXfQPN3twA7v4gvUP
	WCmmkbedT9C/7yA4KYbohVf6HKs5xZTY1CU6xcyPmkcyID4XoirneBCgZA2EeYc=
X-Google-Smtp-Source: AGHT+IHqwnO5pBa6HTOmyWnYZLgpN3Gi3NqGX/tjkp9Tu/WrmclyDjhC1DHXfx9vpGqIn01XeZ8njw==
X-Received: by 2002:a05:6602:2cd5:b0:7f3:d2d5:f06a with SMTP id ca18e2360f4ac-7f3d2d5f2acmr140707339f.13.1719396579188;
        Wed, 26 Jun 2024 03:09:39 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b9d121859csm3079108173.137.2024.06.26.03.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 03:09:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 26 Jun 2024 12:09:10 +0200
Subject: [PATCH v3 1/7] dt-bindings: mfd: syscon: Drop hwlocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-dt-bindings-mfd-syscon-split-v3-1-3409903bb99b@linaro.org>
References: <20240626-dt-bindings-mfd-syscon-split-v3-0-3409903bb99b@linaro.org>
In-Reply-To: <20240626-dt-bindings-mfd-syscon-split-v3-0-3409903bb99b@linaro.org>
To: Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, 
 Khuong Dinh <khuong@os.amperecomputing.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chuanhua Lei <lchuanhua@maxlinear.com>, 
 Rahul Tanwar <rtanwar@maxlinear.com>, 
 Lars Povlsen <lars.povlsen@microchip.com>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Nishanth Menon <nm@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=845;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=HzjHV2p0YoAb7dKSJR0H5taVVRVE4HdGIeGsfEBVEbk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBme+jN/rKMxop1xT/eiXH0yfnc4nH4wTzAzWBLd
 sGOqlE3goOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnvozQAKCRDBN2bmhouD
 11KrD/kBFxg7oTtHPs9nfetBfgdL+FBGvLZ3f2pfG1Q82+mxioVyml+E0ACoJrF5fyUA3qBoNFY
 mZrROtgqx4qUEtIyipUhpEupd6qdZAGCj+VrkoGS7MJobjRksF62Ef6z15K/OhWjGQevjms05HI
 yQfTAWQFIAVzvmvFNxBSn0y/Yr81bCpJQzUP4aJF5ixpEXxyAKGCcfMe8cBeEDka8l0W2VRegjd
 z6rhRp5pECpwpGOZ0lzwD3gj9yYUeTdAcc6Y8qxCmXNgESx8Ynfsl5zyt+Aj7b+Z9lHvbJjx99L
 733ylo7QKuaKo0JwHc3LkMqtNq8XcFa94VtbLqLt1Hn0tbbrzT41uXTeyIIYbW28jOr11EsVtNY
 7Oe/+heg+jftLxUsqVJdvgC0ylLZgYmRQaPk6x5jR/B/BzDOtxfQ6WNzJVIJji/yia0fLL12zHy
 MYYY13ntHkBT9AXK/P/iecS6c4ti30TJjXvNcqV2e1C9LkMKNYhgZ3GV7Jwc13sOjZz9HoEYYjO
 HSYN92mS5miQI7Ool82Jc5JhSjR/6+EVG7C9HKoNtMnUBrFHSEPEkR1mm42rbCmjKWzzXbTmSIf
 IhjS7hbZqxjT6R/GkGWqEzYyql5GovOBULtnmB94dEDdnG08iNaG4M3eynvfzZOP9WIc75Juxks
 UdTXq7ePdotNovg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_030941_312631_8E6D02F7 
X-CRM114-Status: UNSURE (   7.93  )
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

Apparently there is no in-tree DTS syscon node having hwlocks, so drop
the property to simplify the binding.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 79830dd51ac3..af442767aa96 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -142,11 +142,6 @@ properties:
   resets:
     maxItems: 1
 
-  hwlocks:
-    maxItems: 1
-    description:
-      Reference to a phandle of a hardware spinlock provider node.
-
 required:
   - compatible
   - reg

-- 
2.43.0


