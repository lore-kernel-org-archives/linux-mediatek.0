Return-Path: <SRS0=WlSZ=LD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1179C47095
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 09:20:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54F3B61285
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 09:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54F3B61285
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X0a9yyKNaXODPoEFmp9hAIQYe7ecBR2vxUwX9s/QwoY=; b=gPEhr7MK01YjZU
	08qGjhiMj8IMjLKbrKrrutTxFl0G8WRfTCxDKKmm64Les2s6e7K7AqUD+He11GPdDUlSBfRsKJebq
	N/xRUfK6rnRYJhECx5fozLtLKBRqGZsMJ3yfrX9NCAjEnOpWLg4sxRz+Zb4sah5sv2zxQa+FfAlkB
	HzBkC7hRSqBICAd1JsG2sNOkFXQe4fFk0o83EJ2c7IKnPsu/P5tz60INDq9hUbJnzlNf16CcCbdNG
	e0z4r3QkLXPIprfVaStJl/zybs3p+WPTtHGTa8XyjcYckBbb4tywx5gQx+/p4bJ1hoioR2u9jagYy
	xqRr6M76FL2c/QLBuoKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lquNx-00Cczq-Uc; Wed, 09 Jun 2021 09:20:30 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqteB-00COKY-5Y; Wed, 09 Jun 2021 08:33:13 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4G0Kyd1RGHz6vjQ;
 Wed,  9 Jun 2021 16:29:13 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 9 Jun 2021 16:33:04 +0800
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 9 Jun 2021 16:33:04 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, "Robin
 Murphy" <robin.murphy@arm.com>, David Woodhouse <dwmw2@infradead.org>, "Lu
 Baolu" <baolu.lu@linux.intel.com>, Yong Wu <yong.wu@mediatek.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 "Chen-Yu Tsai" <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 iommu <iommu@lists.linux-foundation.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, linux-sunxi
 <linux-sunxi@lists.linux.dev>
CC: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH v3 0/2] iommu: Fix spelling mistakes
Date: Wed, 9 Jun 2021 16:32:49 +0800
Message-ID: <20210609083251.13827-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.177.72]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_013311_475762_87C29895 
X-CRM114-Status: GOOD (  10.48  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

v2 --> v3:
1) Add some new fixes for the latest linux-next:
   drivers/iommu/fsl_pamu_domain.c:366: Traverese ==> Traverse
   drivers/iommu/mtk_iommu.c:977: Uppon ==> Upon
   drivers/iommu/intel/svm.c:488: shuld ==> should
   drivers/iommu/intel/svm.c:920: requeset ==> request
   drivers/iommu/intel/dmar.c:2131: Specifiction ==> Specification
2) Add a new fix "Additionally, The ==> Additionally, the", discovered by Will Deacon
3) Add some new fixes for the header files of iommu/iova
   The header files to be checked are as follows:
   include/linux/iommu*.h
   include/linux/iova.h
   include/uapi/linux/iommu.h
4) Changes to files "iova.h" and "iova.c" are grouped into a new patch.


v1 --> v2:
1. Merge into one patch
2. Add a new fix "appropriatley --> appropriately" in iommu.c, discovered by John Garry

Zhen Lei (2):
  iommu/iova: Fix spelling mistakes
  iommu: Fix spelling mistakes

 drivers/iommu/amd/amd_iommu_types.h   |  2 +-
 drivers/iommu/amd/init.c              |  2 +-
 drivers/iommu/amd/iommu.c             |  2 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.c |  2 +-
 drivers/iommu/fsl_pamu.c              |  2 +-
 drivers/iommu/fsl_pamu_domain.c       |  2 +-
 drivers/iommu/intel/dmar.c            |  8 ++++----
 drivers/iommu/intel/iommu.c           |  2 +-
 drivers/iommu/intel/irq_remapping.c   |  2 +-
 drivers/iommu/intel/svm.c             |  4 ++--
 drivers/iommu/iommu.c                 |  6 +++---
 drivers/iommu/iova.c                  |  2 +-
 drivers/iommu/mtk_iommu.c             |  4 ++--
 drivers/iommu/omap-iommu.c            |  2 +-
 drivers/iommu/sun50i-iommu.c          |  2 +-
 include/linux/iova.h                  | 10 +++++-----
 16 files changed, 27 insertions(+), 27 deletions(-)

-- 
2.25.1



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
