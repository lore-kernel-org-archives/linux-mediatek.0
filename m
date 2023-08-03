Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0ECDC001DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 04:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hYX9oiFhseZRa3VUcHYtMQ+8ZTlBdh3izIooBciTc7U=; b=0o3RbD9jgA701frISEEd3sJrTR
	M/PXYnPVyH/ebG8C7u0Eob3o74bF99DhPHACAQyoVey2xvqh3QWPFuq05XIcR4YJ4IxJIWemRtttU
	MqS9h1POqcjCQDDuc146qL2cMEi7dyelhV2sPSfEGUEbGq2Tth+jrEsB6PZ7R1TSNOKnTovz+9LQV
	jpRLVmdgosKbDMVUTEJMS5a1rl81TWa6jk3RDFqV2DXbwmM/dn3MT7uw3na+u76hyKz6RfQOwYbXK
	28PwXZxi6UjbkPICRqpAhkhqDL9zzYRV6fYZx1u/PmFnNtuON5ibneORt7d0p+ihbXRf+ODf+scEE
	mFYIvAPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRPZv-006as2-0Q;
	Thu, 03 Aug 2023 04:04:47 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRPZp-006apV-1R;
	Thu, 03 Aug 2023 04:04:43 +0000
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RGZsq4dchzyNHn;
	Thu,  3 Aug 2023 12:01:51 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 3 Aug
 2023 12:04:34 +0800
From: Ruan Jinjie <ruanjinjie@huawei.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
	<daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <robh@kernel.org>,
	<tomeu.vizoso@collabora.com>, <steven.price@arm.com>,
	<alyssa.rosenzweig@collabora.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next v2 0/2] drm: Do not check for 0 return after calling platform_get_irq()
Date: Thu, 3 Aug 2023 12:03:58 +0800
Message-ID: <20230803040401.3067484-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_210441_695465_4CD891EF 
X-CRM114-Status: UNSURE (   8.15  )
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

Since commit a85a6c86c25b ("driver core: platform: Clarify that
IRQ 0 is invalid"), there is no possible both for platform_get_irq() 
and platform_get_irq_byname() to return 0.

And the return value of platform_get_irq() or platform_get_irq_byname() 
is more sensible to show the error reason.

Changes in v2:
  - Update the cover letter to fix the style warning.

Ruan Jinjie (2):
  drm/panfrost: Do not check for 0 return after calling
    platform_get_irq_byname()
  drm/mediatek: Do not check for 0 return after calling
    platform_get_irq()

 drivers/gpu/drm/mediatek/mtk_dpi.c      | 4 ++--
 drivers/gpu/drm/panfrost/panfrost_gpu.c | 4 ++--
 drivers/gpu/drm/panfrost/panfrost_job.c | 4 ++--
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.34.1


