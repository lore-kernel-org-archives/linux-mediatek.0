Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D7DC7EE33
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Jun 2025 12:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uWhMh/5fYler3nhbWTRM07ex/VdP8S0PYvhv8obnGps=; b=gQfzXykxkh36FT8vF7/f0fwyZl
	KVSJe6NtPw7e6SenvBMWi+ObCMergL0NcVmpkPcLoBmyEasnUz4KG73xqR/4+GQWo0gJx653RY4WA
	RNpDR8MGERnC3l+GW/8rdzVeBBeHAKhkL1gqvlX+X62NB+Fcvtm78jKHXEDdz5hZYfYHf2IgU5kvR
	Cksd6us4r2VR1zqivflSGsC+csnHl3oignpVxIiJq+0VYL0Aet5M0fk25piu5+e0jXZ9wowuhb55q
	SPr33R9mG+mMO+TY90/IMvhyisrzn1vwfn4v0+SH+WorOHrOZZqhr5mZQltp9XbY6GszNDgUd3/U5
	18easxEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU2nb-00000005aOK-3T1E;
	Tue, 24 Jun 2025 12:30:51 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU2fk-00000005Yie-1MK2
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Jun 2025 12:22:45 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-607247169c0so1031103a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Jun 2025 05:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750767763; x=1751372563; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uWhMh/5fYler3nhbWTRM07ex/VdP8S0PYvhv8obnGps=;
        b=pmHparUiMJpfqF8VLx2hy/bCHeGVaHxz4893Mw/GLoeXfnqhAdRIukKWr1gxEEjg+m
         6psQVDZIJ+0eqfJQgyNmM1TjVrHIG30DF0/Xs98eDiqehSJAFFUVnlw3QoDKZ3yWGtp9
         p37OgRGRFEOi2ced4ZtFzJ6H92NSSW4b+9OIoQwt69C0k25EIAUE4ociDnyT51yxIPSd
         Bw4DNAKH3tJOUASRNetTd96YAEqdXiEiEgwvTfufiKM35lHHXEwvuQE+h8aDUFjCtqjj
         mOpppEUOej+zqCsawE9Rba0v4kRkLunafDaj2yR2g7u/e325ClFhYVEeQOh7JbUC9oXi
         Apqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750767763; x=1751372563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uWhMh/5fYler3nhbWTRM07ex/VdP8S0PYvhv8obnGps=;
        b=uiT8mdP63a4sgAtruH5jqECo3kj8K8Fq3GsebGrWUirzp5zYKikSfnL4hVpX4dx6iI
         k4CKBitHmreJFAVn7vAU9Hb41jwWgCcNMaKqHZZIA0zdYXXBaZeECpujUK8iOtW8EeKW
         5mhOGO7uSJHhcm0X9PW0N6WAIHbZoXOlj4rFoCnkdOmUUcC+x70ybYvp078hsqnSEe6r
         DBFPKsayTIxoihiOQTRRyT6OCVhxwhyqWC1vZEMjALaULTGm1etaFu00tiFJCBrZTPv1
         U6jffudvZE7dGvviZLYJTeZt64g1/bly7AYGyNbvD86q2EAGf9WNFdaYxgZEf0ET46ve
         RH2g==
X-Forwarded-Encrypted: i=1; AJvYcCXw1xsfTkAf0cuVPkcKI+5vybECBVFk+Nlf9hnOKobjyRjOunJcC8aROFQ0Uc4+WPEmYDv6GRKBJ8WwkLSXGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh9y7iBFWya2h2wiaw+2UjwnvycSDqamb7XP9M+VPO5FHjBLJk
	v33Hu/i68wtEqOO/G1LNq7hPuHYhykivyvOV67r9y8rkcQViNJjCqUWOU037OmpOuNc=
X-Gm-Gg: ASbGncvNjPmjv6vlU+U4armmXSq1f3IxYSoiStg08FKyUmycWMDNijRVMBe3nOTW1R6
	A5QU1v7EuTiBd+B1quZUZnAKNfswbBs1Xfs6bCiO2lJzCwHjcSaMO7OVYqsKYlHS/xPgRXTdWcV
	N3w3twygQQNBJ4vNbJnqLHOckPhYVSq/XgFOdyD7H4GMdCD3NPQZRrhXNxRKkYqjfnOBPmZh/MI
	gpU9byZcOuoNSsKjesPJOypyWwkenI4nB4/TBW3SKWnLGubc5s/3S1lp8YWniiyRRaUxzPLvuDY
	CeH3eHI/qGTjxl84wHTBXUFZWwkdWpHBOcTyvrznkYkM4wg2Egw12HRVDu+1DBjDFt80dliXvHg
	+qOlvUg==
X-Google-Smtp-Source: AGHT+IGJeHAE5O/zwjKbt1rTA+c+TADFcI3NU88w3TmhhB+vtkSIGErnItgRWYP4ZJeQzbFZwyUKeA==
X-Received: by 2002:a17:906:7311:b0:ad5:2caa:cda0 with SMTP id a640c23a62f3a-ae0578e8100mr576222166b.2.1750767762491;
        Tue, 24 Jun 2025 05:22:42 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0b3448efbsm56794966b.177.2025.06.24.05.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 05:22:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 24 Jun 2025 14:22:30 +0200
Subject: [PATCH v3 1/3] iommu: omap: Drop redundant check if
 ti,syscon-mmuconfig exists
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-syscon-phandle-args-iommu-v3-1-1a36487d69b8@linaro.org>
References: <20250624-syscon-phandle-args-iommu-v3-0-1a36487d69b8@linaro.org>
In-Reply-To: <20250624-syscon-phandle-args-iommu-v3-0-1a36487d69b8@linaro.org>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Yong Wu <yong.wu@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1567;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=MR4X/vqSPCpzHXBlHPwjTdycYDcqajyWXlyrIiTPhc0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoWpiM6ARA2FxSObqWTe3UcZTFThPbO9BDoHWLU
 PhkHh1V/zeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaFqYjAAKCRDBN2bmhouD
 10LmD/9HpPHgdOhaRuuJrbNOYY6y9CLhs2idJGqV/EDv2qgsS8WG1i8N2cleWDdJPlajEelEsbK
 uYaR6Z+FIKU4TWCOtHXjkut3T8C5kKBQfrMWmCzFoA3Br3z+X5FssW76DmzfikShRZdMPIKAlyj
 VcTszq8nPqtvxu9MPR6AJrTkyWRr0CyOJG3fShHB6V3YaHccvBsGaEJkoFElPyKEUMcLK42Vyym
 Zrxd3svSy2w4Zz8vvKJgvjsUUBJ3dr9BMe8xng/sMQWX4Nqn1Qi9GTdMGsnMvKtergM97bwe7Rz
 Qzsfp5TnYpKP9zG8SnvZTJ1FCKnHRwsbJJbO8cjvoIxJkWykthRKQ9fxsRMXyxBPRnuELNnZsxC
 5edJu4QdKJpjs0famlCNyXA6AS9hh3aiTdU+RHXNyKSKjyRnJYLTKTAGIR3QfD2Ura7SpymfIFk
 mId46fu0g5s/ueNSgigZnt+qUJOiarAgsptFCQ0TFhvsIvCoxUWbilR0VYEnQtaWfOZpCRetqNB
 etOLco8RovGOUMrSiECRB6Oek6GPuca/SZOU+PJxTy3ULIfHlbRdmVTaoBp5N3oTW2ZK31yef3F
 2H6IuMznU0SzXzxW3BpTNuOvFqhBE21SupYWzzYU/DRIvtFvHr/Pyfuo/gLovJv9dOWV7mkbqo4
 B+5rkWKjyrOp7Tg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_052244_360711_B4744A03 
X-CRM114-Status: GOOD (  12.31  )
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

The syscon_regmap_lookup_by_phandle() will fail if property does not
exist, so doing of_property_read_bool() earlier is redundant.  Drop that
check and move error message to syscon_regmap_lookup_by_phandle() error
case while converting it to dev_err_probe().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/iommu/omap-iommu.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index 3c62337f43c67720a15b67e8b610da7886f6f39c..4448c0a512137c79195112eea25d762266c77bc3 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1123,23 +1123,15 @@ static int omap_iommu_dra7_get_dsp_system_cfg(struct platform_device *pdev,
 					      struct omap_iommu *obj)
 {
 	struct device_node *np = pdev->dev.of_node;
-	int ret;
 
 	if (!of_device_is_compatible(np, "ti,dra7-dsp-iommu"))
 		return 0;
 
-	if (!of_property_read_bool(np, "ti,syscon-mmuconfig")) {
-		dev_err(&pdev->dev, "ti,syscon-mmuconfig property is missing\n");
-		return -EINVAL;
-	}
-
 	obj->syscfg =
 		syscon_regmap_lookup_by_phandle(np, "ti,syscon-mmuconfig");
-	if (IS_ERR(obj->syscfg)) {
-		/* can fail with -EPROBE_DEFER */
-		ret = PTR_ERR(obj->syscfg);
-		return ret;
-	}
+	if (IS_ERR(obj->syscfg))
+		return dev_err_probe(&pdev->dev, PTR_ERR(obj->syscfg),
+				     "ti,syscon-mmuconfig property is missing\n");
 
 	if (of_property_read_u32_index(np, "ti,syscon-mmuconfig", 1,
 				       &obj->id)) {

-- 
2.48.1


