Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A49D2127C
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 11:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n8lX1GmEtOr6LjU6fqL4HANwkfAPHfX1qh42rxSH5WY=; b=UOX+R/AuiEGF1tQUv0eEiNhpzZ
	uZ4v7Iz6h5D6DkgI/DhjF8ZxXm7HkrX+xJ73BesDp38sRUTr82NvZvrcJTo8jkuHm1zOIVvCCxwl1
	RA2VOMsKUVOdE6IuYe+ElpkESPlPKSZ2fegvPgWeXEa5g6nynMlMuj2TQslQxullaK9UFOYyM7LQK
	A4FHfvXUxo6ysD78lx3oMwZsMgv+EaxqHHWspCDf3FfgiXhLSHyZdGaZWjsvpUvxA0g673VhNEpyw
	+37/ESQwAgULi4qA0BTaE+Mho4r75AGXLAwaWWjZXEfUQLFsYexOjZ8jxZA6tYWMtkpxGeIY2RCGu
	yf3wGVhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Oa8-0000000Ed1K-1WRY;
	Thu, 17 Oct 2024 11:22:16 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1OYd-0000000EcrQ-0q34
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Oct 2024 11:20:47 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-a99ef476aadso54699066b.3
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Oct 2024 04:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729164041; x=1729768841; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n8lX1GmEtOr6LjU6fqL4HANwkfAPHfX1qh42rxSH5WY=;
        b=O8aBiZP8rslhjCL84Q+aTAS9L76PjuZwpRpND75lgtNqEkcJmb9Lkn6qS4BkPI9ftd
         2mvqQwJHB2hvpIn2XV3JdtYB+x+Tyw2okVXoGuWEiqoZDc7kA+Rqe6JQ2OLbEuJuHQTa
         H/7970IMLqst1ZBmgTIaDXzbDabi8IvovQ7sbWJi4pdnAhggLNoDRioaFKW3WczQGQS8
         JPUtjAaBUGpJ2HV8toXZ8m6HNH02jw3ShU865v2tLA7krRqgEXoEUjSZvbXXIaUHOIto
         vBLoArnlUiWhryOU/DjPb5+y/zaSaR1ed13oIAvpa2E2fdPzWawMVySVthFNJ0BK9jDf
         UN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729164041; x=1729768841;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n8lX1GmEtOr6LjU6fqL4HANwkfAPHfX1qh42rxSH5WY=;
        b=hiU1bldo2rZb+3sQM4JytwhCy5YI2ls501XCTPeNY9MBGUxGfg9u9HchE5eNgrh7wX
         ru9z/PUjq7D+5lW95BlUXyXpi+Rh9g6+0NugrjyfC3EJm9gBzs6M9v4tAvh36T9Z+QAs
         JmBUgH1ve3OmXLNRdTNh6bJknKaDr1c12L7x97l/LipTNLNyjbbVBJ/MW68l+07H3z8G
         sp//gHgnItH7JhpaJ/vv1vqK29ntvNpdBZ4osFOSB/StGykKn1+qM2cXQRJi4BGP7Eek
         kbgHV6+8VTH6meVokdHsl0lAwqDu5uiIduXsuqFZ1OeQPAoTQlxcD325sIeLImkTZEUA
         UcBw==
X-Forwarded-Encrypted: i=1; AJvYcCV6uRR3TrDPK2iA3GZL/oljaGDXg1iLDAadkv9RTBXeJHaXPABSNFIj9rnn5dCh7QfBm2udS56zqDu1LMhMRg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyuDqFxnFxg5seVfuzcZinyoP93RoAQWikKbsmC6ceRsfFkt6eW
	spY3sFgC4gqh2SHUymiH+6sbanIng2tUn23gd9tDb7F0m/nJqGw/+JKgt542Tg+8VrY/AmA89y/
	v5+t5Uw==
X-Google-Smtp-Source: AGHT+IEDyt+T9WSjQe2tPO5YQX5MHOujfHpdD7iqlf6ce9MuLBoasfebCTsbGQEpakvLtWeTyF2ZgqEh5dA8
X-Received: from al-for-all.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:545])
 (user=konrada job=sendgmr) by 2002:a17:906:bcc5:b0:a99:fe61:adcb with SMTP id
 a640c23a62f3a-a9a34c7ac36mr210566b.1.1729164040346; Thu, 17 Oct 2024 04:20:40
 -0700 (PDT)
Date: Thu, 17 Oct 2024 11:20:36 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Message-ID: <20241017112036.368772-1-konrada@google.com>
Subject: [PATCH] iommu/mediatek: Add PGTABLE_PA_35_EN to mt8186 platform data
From: Konrad Adamczyk <konrada@google.com>
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, iommu@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Cc: Wojciech Macek <wmacek@google.com>, Konrad Adamczyk <konrada@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_042043_260462_E0459060 
X-CRM114-Status: GOOD (  10.30  )
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

The MT8186 chip supports 35-bit physical addresses in page table [1].
Set this platform flag.

[1] MT8186G_Application Processor Functional Specification_v1.0

Signed-off-by: Konrad Adamczyk <konrada@google.com>
---
 drivers/iommu/mtk_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 6a2707fe7a78..c45313c43b9e 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -1599,7 +1599,7 @@ static const unsigned int mt8186_larb_region_msk[MT8192_MULTI_REGION_NR_MAX][MTK
 static const struct mtk_iommu_plat_data mt8186_data_mm = {
 	.m4u_plat       = M4U_MT8186,
 	.flags          = HAS_BCLK | HAS_SUB_COMM_2BITS | OUT_ORDER_WR_EN |
-			  WR_THROT_EN | IOVA_34_EN | MTK_IOMMU_TYPE_MM,
+			  WR_THROT_EN | IOVA_34_EN | MTK_IOMMU_TYPE_MM | PGTABLE_PA_35_EN,
 	.larbid_remap   = {{0}, {1, MTK_INVALID_LARBID, 8}, {4}, {7}, {2}, {9, 11, 19, 20},
 			   {MTK_INVALID_LARBID, 14, 16},
 			   {MTK_INVALID_LARBID, 13, MTK_INVALID_LARBID, 17}},
-- 
2.47.0.105.g07ac214952-goog


