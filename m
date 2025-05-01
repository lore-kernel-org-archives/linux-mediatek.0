Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5603AC3ABAA
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 May 2025 16:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+72BTk3p7hLtQaCti3cuxoq+C9cJepOLj5FSJpxepws=; b=r2FQJq79ltt6r/gmWLxJ/Zx21o
	XbgsiK4AvVMRW7eukLDkmiDpPIY2EFI79bk1o9mXFhUmuE/lBS8UYvVU1vy5OeRYyMlE9+r9L2IU1
	w9Lg9YeNINKKhhfreyukifCru7La34wMGPkDyn7b6GeWtZ1G21oNViIv6sKucoElAvkyIT0PKBrNU
	zhv8SjbeC9QtYWb4KLlr9LsTcKSiVsPw5toOqKdysPk0cOO400rm8xImbPoDTcJRqD9MC9mdPvnYD
	l5yBgiDfiiiwdNlAfG3agqqPgcOMkqaS8gIDutG8qoSUilUwkLYOqaDc+tucpOOEk7HeC01+uk6PJ
	d30fNTTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAX09-0000000GCrS-1ncf;
	Thu, 01 May 2025 16:43:09 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAWuY-0000000GBxJ-1J2y
	for linux-mediatek@lists.infradead.org;
	Thu, 01 May 2025 16:37:23 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43ce4e47a85so1641485e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 01 May 2025 09:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746117441; x=1746722241; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+72BTk3p7hLtQaCti3cuxoq+C9cJepOLj5FSJpxepws=;
        b=VUPt7GWVZQnpLigTK59TDhxzh6pnvxh9hGxVuNFkKoEW3nXWdUkoz1P76eq7B54Vyx
         itC61uJydcEmnyXqoWkBS9P8rsKpy/lClKzhPuJfjBueZGgZwYZv+x9nj2X1esBVi0da
         dDNL6H2dGveYtKYP1pfAgaZRtfoX68S6N94Ppzgtet1ie9N6ewU+pZnXCtY16k4EKsTy
         /IAz0GwUL2zUHgGydb/qXeQ0GAnp3jkulv+fv/WFf/3HSer61dd1C6OqwKpfkqrnMXOs
         aMAgLI4Lk16aEfujAsoQhvYqhOKsmo1v+nGwJKsNf7RA4ZKRA8FB4wUTIEjQ+WVyf7yu
         F64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746117441; x=1746722241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+72BTk3p7hLtQaCti3cuxoq+C9cJepOLj5FSJpxepws=;
        b=CTilTK+THrNGordzr9qFjpk51mDf5pxOgh7GwiMRZkUYOrP19NYdl2gR4ArOWZdfG7
         0ZFOk+dlx2j2wMT0XAm7DQuNvk7wTHCV7aWu8gb02sZU7oV27J3Dk6zLbRTT6fdernY1
         /PlY5IdNi6p+f7qYlWjfrRTZAvX/zqy256EmB5afPqdu0J26ZcAKzX/KhEgcUuHyqgXe
         v8CPMNhMZya3Lxm2lCHfArYnA0Y6/KEZDj4dxK4mz+4KDsXtGTile7OETLoWNZsku+MX
         n5JVZL6f+N1KI2F2rlu+ErXVxgntXu0hxWUXNJs61JjyZy+pbikB94zR1CCRVE5TWMLA
         ptsQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4YS2b2lcJr2Rt0rcSJtRP/J85zTGyYml8bAOo5QzKgthFfJh2Fwj29KTtJUS1kWvCjtR/2mYEp4MQ0HsRrA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwaluUb51HLqOoyLPn9JlzM7PsOe5phV7SWiImaFYHIJ2KP5e8o
	g3zEwCi01U0Qz6Izem0cxeSQSof/EA0rqv0xK5n/BInIA7Ytw9DOYRWCm9E5TRQ=
X-Gm-Gg: ASbGncuaYWkPWRJ1wyBNZWI4RKcANOm7fhm5TLse6Erc1yVWOJTtMhUmY0E/Jl2/dk8
	AL9dFtxhU7OxcY5rtEdEb97ks5BZQtAaRN38ut0qPk+r0Drbt9ZkrEwp/Qq6pJOl3shJ+souRrH
	ysgeojCzpmOpmKI3hf57OT6lCSWW3PMX9++tChwVF7FE/UeeiO+zOMiAN9X8xEYaHIEEQOTB2r0
	LTRK5LT/wseNjzPLGdCM1ziq7KsPyFpai0hFuclQ2FRVeWcGAiaVjJLtedH8mbuNKpKh2ST3FT1
	hsVQ462qRgme+sGKqAT5JnW78aSMtfy82EvhauziXv9noldE60WdhMs2BruQcap/vBtsLw==
X-Google-Smtp-Source: AGHT+IFZ4wq/YC5Z8Q1DORspcfBal0TXZZSb4qQ5i2LX5qoWo7ODXYSBY0H6naDeevzu7XX1zCwGJA==
X-Received: by 2002:a05:600c:8712:b0:43b:c962:ad29 with SMTP id 5b1f17b1804b1-441b2c6fe2cmr22011025e9.1.1746117441032;
        Thu, 01 May 2025 09:37:21 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a288f0sm17166175e9.27.2025.05.01.09.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 09:37:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 01 May 2025 18:36:57 +0200
Subject: [PATCH RESEND v2 3/3] iommu: mtk_iommu_v1: Simplify by dropping
 local 'mtk_mapping' variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-syscon-phandle-args-iommu-v2-3-5a3cab296972@linaro.org>
References: <20250501-syscon-phandle-args-iommu-v2-0-5a3cab296972@linaro.org>
In-Reply-To: <20250501-syscon-phandle-args-iommu-v2-0-5a3cab296972@linaro.org>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Yong Wu <yong.wu@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1469;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=br7GZJo/Y+jEEdWoRzjynfLSYE2qWMF71yGrpCFWlfM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE6M4CJameWdIEbaKrhQD0ut81+1BXWRWUnwFO
 97Wgb7lxumJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBOjOAAKCRDBN2bmhouD
 14SOD/45uy0MY8VGk4ZvKE/H0R7CNE2ft3oLP9XOQRzm6XJHx2Z9QXmTT/RSuKn7rZ+bMTOw+Ir
 GPQ0iGcxYbbvzawOd5YGQVIPk0Zb1+shoVoyBFJqmuoRll36W3jRmfIN3GL0YaUjZhpnA1jcZAy
 TTuqnfYHXInALgDOecbSNWc79Uy8+ClQ3E4L+KOy4pdGjft7nSX7JXTtTXy37QxGkhpekH0JM5e
 Ny0iwkeJTtgXi7Exa1K2spOHRlROyoBC4SbhIwSnR1ht7QkzuV/dDELMLU+rjhbANXDRvhLD3Vu
 jzqfOzDuiChfqmVO8WAS80b7a7MORPmXVhl/foe3JeyXchF2/AdA0IG31LiCwkryPkD2k75l3rn
 CEazjbiTy4jsN8ZLcGWs8/1s6FpePznAdTmg4Xwg85K+Un2AibmOI8+XJXVQYQflmXwe2cvAcxq
 dYBhTZwXoJ+HdUEjmJpq+DC1veARGn0blUPddRTXMqveUNQP6ieZY53tCYDKJH3dsXH3cU+rmSn
 2touTUB0YumibIzZdFmfF4BKTwSMHWDE0A4ZrLuaeQ2PdEdjI39x0BCE2NLbYI+Ra1JtWEZ7mgq
 vVTfWQER71C4Hc8d4JZLENH1I4xL8uQFlnxuZ0maHo0+4z4H03ObcnJNhOE7y1NWCKkOEVpBT7F
 DmneETwpwZMjFiw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_093722_356929_A53ECC78 
X-CRM114-Status: GOOD (  11.85  )
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

Storing 'data->mapping' in local variable in
mtk_iommu_v1_probe_finalize() does not make the code easier to read.
Use the 'data->mapping' directly.

ARM64 W=1 builds also complain with:

  mtk_iommu_v1.c:512:28: error: variable 'mtk_mapping' set but not used [-Werror,-Wunused-but-set-variable]

but this is not being fixed here and 'data' still won't be used in such
compile test.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Old warning is change now to:

  error: variable 'data' set but not used [-Werror,-Wunused-but-set-variable]
---
 drivers/iommu/mtk_iommu_v1.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index 66824982e05fbfdda224276ad41b90f9d5f9ca4e..bbe3e9d901c69ac6405d9549a4481fc80f1adb80 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -509,14 +509,12 @@ static struct iommu_device *mtk_iommu_v1_probe_device(struct device *dev)
 
 static void mtk_iommu_v1_probe_finalize(struct device *dev)
 {
-	struct dma_iommu_mapping *mtk_mapping;
 	struct mtk_iommu_v1_data *data;
 	int err;
 
 	data        = dev_iommu_priv_get(dev);
-	mtk_mapping = data->mapping;
 
-	err = arm_iommu_attach_device(dev, mtk_mapping);
+	err = arm_iommu_attach_device(dev, data->mapping);
 	if (err)
 		dev_err(dev, "Can't create IOMMU mapping - DMA-OPS will not work\n");
 }

-- 
2.45.2


