Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0269C48BC4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Feb 2024 14:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=asD3ev0Cb3OxFqrbvaOTmglMW6LCxeDZuldyNVrUzqM=; b=s8kF/hW6UPSNubPt/3Wi4yiVK0
	fUIu6MBKXjBEROSkuJW4OtLsFHyT4YlH27ylRFapyKK+PLT5tFZuxvBPmfMW92A7E4cWdIXLlSKuw
	1KbFW7YIW03BzlLsCWIv0PWsD9+7AbZ+6DeFgp9H6e1MmZuhjuXHoL4T+Jd3KU54kPkwl3ATj4u+/
	5wX5JzPzJSyxsi7TncKXCU9dou25YlJCYIuc0+/w0obx8yCmjZRXDnUsymODPnk4VUesdZ8aBARuP
	v0DIMZD3imFNExo+HszTQwUN+GYZtY0AXF7OoWkdqhRxzKlsYR1MSYXHbJ00Hidy4Td1QVLYt0Y3W
	KN72aYLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1razOP-00000002d0n-1PEH;
	Fri, 16 Feb 2024 14:40:45 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1razOJ-00000002cuH-0S9D
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Feb 2024 14:40:41 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5639c8cc449so1089061a12.2
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Feb 2024 06:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708094436; x=1708699236; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=asD3ev0Cb3OxFqrbvaOTmglMW6LCxeDZuldyNVrUzqM=;
        b=fRamExgkMlquA19O6LY6eJ7u/zRvLeILyIazS4CCrOtqyfDwcViy91Dv5lJ1s20bvz
         WuvamX4pE6W/aaKVdzMpT07uxzSW78NDZnwPXlGdWqzWn54jA14QIPPRqRXKFL8nwVSo
         pDDwEWpeAn/V6oZb3P5h1H/1MUMy4BRUjYqWJkTtwaFwPBWdMy99LtfZZ6AYykeTfybq
         j/a4OdrEoZKonKU4cIQCLMFCc3QcUChdKUIvGZRcXaZ0oZluWQ/IqaGKSIATo+un5eRK
         4AhriZgErNjdNpmVXTAo85JEAkxKfzkNBiwlgwQuFatgBF7Fp29EaAWFQJWO55WZjvd2
         tHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708094436; x=1708699236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=asD3ev0Cb3OxFqrbvaOTmglMW6LCxeDZuldyNVrUzqM=;
        b=ZhxutvhTQFJFHoAGdkjPiCitUH1zEjtn0h+8uPlqwnbMYEKBhbjiCF8jNQuBJ9ow0+
         aaNJpz9C3JFApcc2EdTuBWeKCGNyZAbbsi2dtj8YFSpJG8JDT2JzCK+evbwVRoGSpaOQ
         F75cP8Vk7xUEzF+Fo255TV6i7JJ+o2V9qBRJnlcbKBXsBEmy/Wc/zunT4Pmm/c3+evQJ
         cgxBMXhO0bjlggy/7l+8qNHwsvsGrdP1JFRDm8NIwG6CoPcoXYOvC4J1/C0JlIAvdAmE
         sBHX2l0edOX7Vgf+7/HmSovMFtvLb7qvwyJxh1121kkPwFzsnqNyfH0TaV9y//qdvWkM
         uG3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXRyHyVfdadpKvNf2BCE4UYM9hY5uvcgMN7VZUn0NK+A7F6J6FbKOgYrOiCFHg0eJsjy/SY/e/civ214JwQZW7dbVD8ZPG1dnmQwOKS1D1egadK
X-Gm-Message-State: AOJu0Yxeo/RYDPC6gu2YSKEzDEHFPryOvCpCjuxN7csqLZCdPlNZacAm
	kZDq9eK372YpYqM1S0TXUlNDhYml5snSvOXRxpYPUQEdOK83AyIPt3JrASB0yAs=
X-Google-Smtp-Source: AGHT+IGCyUGN+VLUaRlt1OZxHWuQFmwSgWLlGY6S3fHlEaQRS780PIZW2GJtYg2x+OIezg266xrJrQ==
X-Received: by 2002:a17:906:7d86:b0:a3b:f054:92a2 with SMTP id v6-20020a1709067d8600b00a3bf05492a2mr3792983ejo.59.1708094436519;
        Fri, 16 Feb 2024 06:40:36 -0800 (PST)
Received: from krzk-bin.. ([78.10.207.130])
        by smtp.gmail.com with ESMTPSA id a8-20020a170906670800b00a3ce3c5b2a4sm1592942ejp.195.2024.02.16.06.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 06:40:36 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Rob Clark <robdclark@gmail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Yong Wu <yong.wu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	virtualization@lists.linux.dev
Subject: [PATCH 3/4] iommu: constify fwnode in iommu_ops_from_fwnode()
Date: Fri, 16 Feb 2024 15:40:26 +0100
Message-Id: <20240216144027.185959-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240216144027.185959-1-krzysztof.kozlowski@linaro.org>
References: <20240216144027.185959-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_064039_198907_C4C2130F 
X-CRM114-Status: GOOD (  12.64  )
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

Make pointer to fwnode_handle a pointer to const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/iommu/iommu.c | 2 +-
 include/linux/iommu.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 26a31ba4f72d..a1f9bb8fa041 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2987,7 +2987,7 @@ bool iommu_default_passthrough(void)
 }
 EXPORT_SYMBOL_GPL(iommu_default_passthrough);
 
-const struct iommu_ops *iommu_ops_from_fwnode(struct fwnode_handle *fwnode)
+const struct iommu_ops *iommu_ops_from_fwnode(const struct fwnode_handle *fwnode)
 {
 	const struct iommu_ops *ops = NULL;
 	struct iommu_device *iommu;
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 600fc6e6f308..269ef0af7f20 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -903,7 +903,7 @@ int iommu_fwspec_init(struct device *dev, struct fwnode_handle *iommu_fwnode,
 		      const struct iommu_ops *ops);
 void iommu_fwspec_free(struct device *dev);
 int iommu_fwspec_add_ids(struct device *dev, const u32 *ids, int num_ids);
-const struct iommu_ops *iommu_ops_from_fwnode(struct fwnode_handle *fwnode);
+const struct iommu_ops *iommu_ops_from_fwnode(const struct fwnode_handle *fwnode);
 
 static inline struct iommu_fwspec *dev_iommu_fwspec_get(struct device *dev)
 {
@@ -1253,7 +1253,7 @@ static inline int iommu_fwspec_add_ids(struct device *dev, u32 *ids,
 }
 
 static inline
-const struct iommu_ops *iommu_ops_from_fwnode(struct fwnode_handle *fwnode)
+const struct iommu_ops *iommu_ops_from_fwnode(const struct fwnode_handle *fwnode)
 {
 	return NULL;
 }
-- 
2.34.1


