Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98757C531DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Aug 2024 15:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LOl1ZqBXdbAJXZzTI3BlQ8z/3fBsZwwoZ15vO5UkJdk=; b=GVKgmjjkY0JWNVUeaRpfX+PTBu
	oT9SwIXwvBcOzxWuPz0mMYugG7NgF0uxFxeGNE6pP2BEBZUyppkX8eOQuOlmNNUsZLVT53jqy+JV9
	zqlLWtQpjJdqaf3B5R1rOcljk7Q3H75Mlxls5fnxswJVN2rQwCIO6imhNxjfoelwN+Ig2Y8gLcdDt
	jOujmITkc6+/EWUAu5nJJt035ZRkcrLFJ8Qogy5YtBud8R51+hfcJWKww4LSrKbmRaF5MUsUl3pl7
	Yn0kv8270OKNYToNHjIi5BdfoliTj4SUcz1/DFG41aVdf1ed3FirErrBJKZGCwE318OAA7uhQIyMy
	CDA2TOkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sez3J-0000000DQk3-1GDt;
	Fri, 16 Aug 2024 15:39:45 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seyw4-0000000DOiL-0xb1
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Aug 2024 15:32:17 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-428fb103724so16744805e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Aug 2024 08:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723822335; x=1724427135; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LOl1ZqBXdbAJXZzTI3BlQ8z/3fBsZwwoZ15vO5UkJdk=;
        b=pg28X4LiUv7OiCvf60UuaGKL03tawqVuUNNWjqOWKHj6t59PiyFxkGXjdykr7I3P9n
         +OcQo/xDmffd+Z7d1lZyHAjiejz5xxpq7iFe3gRqc0NVMaJy7LzbFmcdnGAaQ6vIuGw5
         FNWthxc7K3NUc/kXgDa4EFTzPTBNAQp4qoC64+v7aaE3sf2vB/FEb8OllKJHp2GpKmsP
         pCY5uLRGlNh8xiZ2IG4fxDSBW+nFeG43LRzlbsNX1xMNEX0bXnV4B6SMR0CTyfLoMY83
         YBOoW2A4ISy5Z7AnnWBouZoxApjJoUmFS5Db0zRXaUEaDEal1TSYaOGh3uMmaGylJ7u3
         +5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723822335; x=1724427135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LOl1ZqBXdbAJXZzTI3BlQ8z/3fBsZwwoZ15vO5UkJdk=;
        b=qmrSGcX74guuqg1z9Rl4aML+SBdii4Zb/lUnCM1/g5UKqDOw+I9OEYMxQAmHGkisGx
         CnGywDLRQkJNQHGT15S4FnsKv8PYUpOMZHCc70p4F8QldgXcsdEpisGPkTS6PAH9+QwF
         EGky3gmUn7T6zASMhaE5Dl/WS6MaxFY8/2UYRTxT05wn2Ozyk/87Ij4LOhkcYqxUoQIC
         U5h05rjP5/zsHXFXEIdXXwEd6tpyOD2KE+KWu9R3fDr/Rrt8RSpKfq/eE+iS8uRMGZNq
         t5pJOsmBnAYxKQVjemjZqxJE/maW/w2pR06rAZQzL9bsVoMBEGJ+Dm69X37GCbE/OkFP
         SF7A==
X-Forwarded-Encrypted: i=1; AJvYcCXnJet+vp17mJYj98mOdiyuyOlSZSr3Nhh+puMbTdF9HZDHwR4guHevrnaQ+lhZSrl1N3w9IimqkpxSFI0B5ER5Ng4BxGY7P4Rzjp1QZ8mRRRT3
X-Gm-Message-State: AOJu0Yza1Bjo1sHQeG16gaVr/jVywO30sb8Yheeau8OGnkMcQm7JO3b+
	T2DK4qB7mxvLhxLohcKJDfPjUUhj/PewDXv9bmOQn6ibkUHieuHQR0sAKOJ4wdyxjBwlUJhywap
	u
X-Google-Smtp-Source: AGHT+IEFjSH4WqobBhV+up3oZ7ztZRwBuC3HgNzLRXaYpTTRLatXBwsIRxgmIFfySIZM1KogU0AXTQ==
X-Received: by 2002:a05:600c:450c:b0:424:8743:86b4 with SMTP id 5b1f17b1804b1-429e232b8a0mr50953985e9.6.1723822334803;
        Fri, 16 Aug 2024 08:32:14 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898497f0sm3853661f8f.39.2024.08.16.08.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:32:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 17:31:46 +0200
Subject: [PATCH 14/17] leds: pca9532: Simplify with scoped for each OF
 child loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-cleanup-h-of-node-put-var-v1-14-1d0292802470@linaro.org>
References: <20240816-cleanup-h-of-node-put-var-v1-0-1d0292802470@linaro.org>
In-Reply-To: <20240816-cleanup-h-of-node-put-var-v1-0-1d0292802470@linaro.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Riku Voipio <riku.voipio@iki.fi>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1474;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=3ARnnx7uT2kjUKO/lBdUAxqqDcV1RDRByaeh6p9QzVk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmv3Dl9NwZPB/MApEGkh1nDqgHmMiX/P3/AIqpm
 RoLHvTk8y6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr9w5QAKCRDBN2bmhouD
 19g0D/wMAqWjPIbSHETSNRfB9R/1HlUm5xI5ndiN59Zcgwr/clBCSt48gRDMuFGS05K/kNaSvRO
 8IbtYru6I5aMaoGCHU1KgbcevPw39TynUzLejaKERSJ2zXJ8UQ+qvh80ce/3XMYlfCBf9b19psi
 xRyJnm70aht0YnafXUBRfWvp6Im9/I7y1YV+tXBnLIKXrWLznSUDTHXSs7EKODOjnqt4mFNJfew
 qMZ4Lu9SFU+kG99RWVs4R96XWtdI5gtCmt9yjriDw5/cD9GE4Ad7Wjk+juXE5HvEjl/hZ0OnokN
 3HsBKw9y+68dZIwQVVDmPPZJb50/DGJstWUwxOti9yfDxKYMCkW/+dZf1/LxZYvuxb/0WOvODM5
 PNeM2bx/y0m/cOQY6GAYpu8UgoAbMWzQxufvxjUN52w+IQjQ7w3epmoZLycDyPEFvVQ9+Nz7kOQ
 I3QvW+PFDLC+htKn3wV0X1Adnhj3CWolfRDdVQ5m/UMB2EwDZy+VOthEx7pNzC5wcmFzTXoL6Sx
 4D/8ee8LHgG/8I5MiNA6wVgqUJCu/NJE1DY6XJ1JuVTbs8qyCiLVW8bJ/yo4ecJgPpBBhPTGdfE
 Ld2si21avus1XNVlYHHao2BVVh3XLSmqiMvmaWBGvQw3Y2J0/nbyOBAcRN0BUWe6W+N0RGJ2O2a
 fZZYbzRJlMQmwbQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_083216_324664_089D60A3 
X-CRM114-Status: GOOD (  11.36  )
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

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/leds/leds-pca9532.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index 9f3fac66a11c..338ddada3de9 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -506,7 +506,6 @@ static struct pca9532_platform_data *
 pca9532_of_populate_pdata(struct device *dev, struct device_node *np)
 {
 	struct pca9532_platform_data *pdata;
-	struct device_node *child;
 	int devid, maxleds;
 	int i = 0;
 	const char *state;
@@ -525,7 +524,7 @@ pca9532_of_populate_pdata(struct device *dev, struct device_node *np)
 	of_property_read_u8_array(np, "nxp,psc", &pdata->psc[PCA9532_PWM_ID_0],
 				  ARRAY_SIZE(pdata->psc));
 
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		if (of_property_read_string(child, "label",
 					    &pdata->leds[i].name))
 			pdata->leds[i].name = child->name;
@@ -538,10 +537,8 @@ pca9532_of_populate_pdata(struct device *dev, struct device_node *np)
 			else if (!strcmp(state, "keep"))
 				pdata->leds[i].state = PCA9532_KEEP;
 		}
-		if (++i >= maxleds) {
-			of_node_put(child);
+		if (++i >= maxleds)
 			break;
-		}
 	}
 
 	return pdata;

-- 
2.43.0


