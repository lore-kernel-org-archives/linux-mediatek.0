Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1406C04A6A
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 04:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yTrI5GxD97wIRgrvA4sbjXDqlqKTvsltROnuatvm3F0=; b=JLR+oCEgjr1mjXyWFhBf0U+uQs
	WH3QqbvsZKyFa9ykpNEMdSmrZFgZjWFdzA46pccNquvVhiSCSesme5ZtYgcal6ZLbn767c9UnXlL/
	KRuZtu0vVAJoVnhcKUyXT+Y6OHglOeTbsTugTYMS085aS2nBcUSIDG4lnZg7IDwjF51uAEU11LJz+
	tWvGJp4PSpSakzoxRFVkF2MNuA2JYIilY+LO9vyNxXvdrQp4A3jHmfH3CyS0tunGDiZP8J35mBln9
	diAGcYDzzrhe7ywJaOLLuQTGugZWegiuxYbjYfh9+dzkTvKXr9vEV6HpGzI31X0oIWtSZh3t8SjYU
	Ae0xQjyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRPZr-006aqt-0f;
	Thu, 03 Aug 2023 04:04:43 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRPZn-006apb-1s;
	Thu, 03 Aug 2023 04:04:41 +0000
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RGZtz2BSNzVjj9;
	Thu,  3 Aug 2023 12:02:51 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 3 Aug
 2023 12:04:36 +0800
From: Ruan Jinjie <ruanjinjie@huawei.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
	<daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <robh@kernel.org>,
	<tomeu.vizoso@collabora.com>, <steven.price@arm.com>,
	<alyssa.rosenzweig@collabora.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next v2 1/2] drm/panfrost: Do not check for 0 return after calling platform_get_irq_byname()
Date: Thu, 3 Aug 2023 12:03:59 +0800
Message-ID: <20230803040401.3067484-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230803040401.3067484-1-ruanjinjie@huawei.com>
References: <20230803040401.3067484-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_210439_789505_29A8EBC9 
X-CRM114-Status: GOOD (  10.16  )
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

It is not possible for platform_get_irq_byname() to return 0.
Use the return value from platform_get_irq_byname().

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/gpu/drm/panfrost/panfrost_gpu.c | 4 ++--
 drivers/gpu/drm/panfrost/panfrost_job.c | 4 ++--
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index d28b99732dde..2faa344d89ee 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -390,8 +390,8 @@ int panfrost_gpu_init(struct panfrost_device *pfdev)
 	dma_set_max_seg_size(pfdev->dev, UINT_MAX);
 
 	irq = platform_get_irq_byname(to_platform_device(pfdev->dev), "gpu");
-	if (irq <= 0)
-		return -ENODEV;
+	if (irq < 0)
+		return irq;
 
 	err = devm_request_irq(pfdev->dev, irq, panfrost_gpu_irq_handler,
 			       IRQF_SHARED, KBUILD_MODNAME "-gpu", pfdev);
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index dbc597ab46fb..3322b3024937 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -794,8 +794,8 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 	spin_lock_init(&js->job_lock);
 
 	js->irq = platform_get_irq_byname(to_platform_device(pfdev->dev), "job");
-	if (js->irq <= 0)
-		return -ENODEV;
+	if (js->irq < 0)
+		return js->irq;
 
 	ret = devm_request_threaded_irq(pfdev->dev, js->irq,
 					panfrost_job_irq_handler,
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index c0123d09f699..d54d4e7b2195 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -755,8 +755,8 @@ int panfrost_mmu_init(struct panfrost_device *pfdev)
 	int err, irq;
 
 	irq = platform_get_irq_byname(to_platform_device(pfdev->dev), "mmu");
-	if (irq <= 0)
-		return -ENODEV;
+	if (irq < 0)
+		return irq;
 
 	err = devm_request_threaded_irq(pfdev->dev, irq,
 					panfrost_mmu_irq_handler,
-- 
2.34.1


