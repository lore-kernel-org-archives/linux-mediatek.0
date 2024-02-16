Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE61C48260
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Feb 2024 14:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZRC42YbuNYRdIwcaj+US8j1sKLD+6CzDw3sU7mb37/4=; b=26CbSBOTerDvK6TaHPocRNFKvu
	JsWV1FqLVPL/HRAv5wbtnFVfBUOtimfS1JWux1awfKKfscxcmBhrVa8YCSgZ2CvQKjKYa7GL1RxLQ
	B4dTGcY9kkwSmV16hkfbGx/GGWYN5DKq9rLAQ0VmXR2EQTk+LBU5eB622rZtzs6G4E2I4tEMur8gV
	0OuDXssAc7LDyXpKQpLi1uEbUkxkZhDQZYXCBgLnyYOQQbgmHIP2t9KWza/Jmt2fmFJ8y15nrNKe8
	APOJm9vCluScK5kaEy3N1RlnoPJJjTaDazITa5dcLI5jj9VYYeSbaGXt/k0DtKoV8+ecbL4TxJnBN
	sgh3XT4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1razOK-00000002cwq-09n6;
	Fri, 16 Feb 2024 14:40:40 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1razOG-00000002cu4-3DBI
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Feb 2024 14:40:38 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a3dbc5d22c3so140129766b.1
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Feb 2024 06:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708094432; x=1708699232; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRC42YbuNYRdIwcaj+US8j1sKLD+6CzDw3sU7mb37/4=;
        b=tAJmQgjknWrkqyT9Gp6rSeUpOPI/SpT2US/q1aSTcqcDDR4HLRzZzecZCoBUFXNmIX
         n06ZXVa2ANg77iQ69a5I/xM2/HXFtJwV4mL49S7ReJuEjfCoRB4W/Q0mxefUVnLSu18S
         XkcXH4KimFvQX+juIHD0oz+E74nz9hoNwoVu8EAiQQX/Zz+aVaT5hW9Tp3copZr0VM4s
         1y2LnAvQOzKv1Ib2tBogk8WYlPM7gcjNS26dO1R2VGz6J1L2JhlIrPoNHJrhUcO/sQuU
         4/DJLF09CfO5gFEt0re/StQciirfy4BoARksBBXoqkUBO+ty6EapN9m9Ia7XKzuoyA4Q
         ubww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708094432; x=1708699232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRC42YbuNYRdIwcaj+US8j1sKLD+6CzDw3sU7mb37/4=;
        b=Tff1d5BKD6YIWqFmjskKvl/tZ2VgH6GwofkgvAXSkeY1cOuek+pINbdY6kvFLJ4jzO
         M5m1h1raIwq/1iENc5UYCLDwDNPBPscruEzD4Dk+Gx1E4KA3KjOXlp13y3vywmPs8MAi
         oUzSe4Jt2qZBJhbaseEVHl0oXHXRKLlNuYzDWfs/A1wvgQa47qnMIISRebtUNx/rJTzK
         ocGpDS1cC0dXaL29pCU8zV4Y3bD/yYy0RjW7nRwVWO3wBm91DKWn/EJkSP2At0vKDCrF
         LPZuMsyknDV+E2cKi8PnEzmvqT9kWwknZjA1ZvDM3hfg2NC+4avpGfsPcxso3m8s1vw+
         EY5w==
X-Forwarded-Encrypted: i=1; AJvYcCVcdwqark3/TEQWP7UEYpp8Uadjvuw17rdd9rbxN7eK/CkiqKBlf8E7AnrEjyvm7jruF1BtBxblMRJ4DdnzpRARIkwE+1SO1tLlN2APNIRCaKJN
X-Gm-Message-State: AOJu0YwLXaULpAclYZJrw0wyc17tiU27QLraKqVaDxjHCfrHndh4QQ98
	a1qni6OLMCnFtMp4R5B5NxYF124A7/+yRNIf+Np+CyxcGfPdFP+8I8DfJCdYQv8=
X-Google-Smtp-Source: AGHT+IHf//9yt3eTnyw6VXgXdUG6tjNHVGPCN0at0VvNZn01LUmWCi7a4swsg2sOshpZkHrmmM9UNA==
X-Received: by 2002:a17:906:185a:b0:a3d:994a:791d with SMTP id w26-20020a170906185a00b00a3d994a791dmr3667044eje.59.1708094432164;
        Fri, 16 Feb 2024 06:40:32 -0800 (PST)
Received: from krzk-bin.. ([78.10.207.130])
        by smtp.gmail.com with ESMTPSA id a8-20020a170906670800b00a3ce3c5b2a4sm1592942ejp.195.2024.02.16.06.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 06:40:31 -0800 (PST)
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
Subject: [PATCH 1/4] iommu: constify pointer to bus_type
Date: Fri, 16 Feb 2024 15:40:24 +0100
Message-Id: <20240216144027.185959-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_064037_015620_E5C90BA2 
X-CRM114-Status: GOOD (  10.77  )
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

Make pointer to bus_type a pointer to const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/iommu/iommu-priv.h | 5 +++--
 drivers/iommu/iommu.c      | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/iommu-priv.h b/drivers/iommu/iommu-priv.h
index 2024a2313348..5f731d994803 100644
--- a/drivers/iommu/iommu-priv.h
+++ b/drivers/iommu/iommu-priv.h
@@ -21,10 +21,11 @@ int iommu_group_replace_domain(struct iommu_group *group,
 			       struct iommu_domain *new_domain);
 
 int iommu_device_register_bus(struct iommu_device *iommu,
-			      const struct iommu_ops *ops, struct bus_type *bus,
+			      const struct iommu_ops *ops,
+			      const struct bus_type *bus,
 			      struct notifier_block *nb);
 void iommu_device_unregister_bus(struct iommu_device *iommu,
-				 struct bus_type *bus,
+				 const struct bus_type *bus,
 				 struct notifier_block *nb);
 
 #endif /* __LINUX_IOMMU_PRIV_H */
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index d14413916f93..170329a085b8 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -291,7 +291,7 @@ EXPORT_SYMBOL_GPL(iommu_device_unregister);
 
 #if IS_ENABLED(CONFIG_IOMMUFD_TEST)
 void iommu_device_unregister_bus(struct iommu_device *iommu,
-				 struct bus_type *bus,
+				 const struct bus_type *bus,
 				 struct notifier_block *nb)
 {
 	bus_unregister_notifier(bus, nb);
@@ -305,7 +305,8 @@ EXPORT_SYMBOL_GPL(iommu_device_unregister_bus);
  * some memory to hold a notifier_block.
  */
 int iommu_device_register_bus(struct iommu_device *iommu,
-			      const struct iommu_ops *ops, struct bus_type *bus,
+			      const struct iommu_ops *ops,
+			      const struct bus_type *bus,
 			      struct notifier_block *nb)
 {
 	int err;
-- 
2.34.1


