Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77748C001DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 03:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OKNwR7WAGADBlGZeVud7oq8ArZS/SIZux7L4yafgQvk=; b=SAK5HL2Y0KkjQJ34n+ZJB1sEQL
	qiMOPLnMIvSfWiX53tMT5qTqJFqcY0oeLnRm7U1PO5cLNIby+wV3esG+QjrCAXqSpx0iJq9/YmefV
	y+EeCvI3CAcjBc+BQQGTXjxvjnTqMsd2vAQ0EH1EDWILEr4MCCpJCpmeA71xBg7iF1bR9KhehcNga
	Z5yGsxUTCmhFaaGq6WZyFtXp97qL8nkQporuPQRYF1o3+STsARJ9taWR7nxv3Nfk6wRAm/+RGVQoo
	PNoslOA4Cx2XnScYZZl04Q5S95EnIh8Q4CoGX/X38MaQK89aD3YG0sxQdilYUzj3bWX+T8KyAWeJV
	1LH+wqVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qROpm-006X8C-2d;
	Thu, 03 Aug 2023 03:17:06 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qROpi-006X71-1w;
	Thu, 03 Aug 2023 03:17:04 +0000
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RGYrp4h6gzrS65;
	Thu,  3 Aug 2023 11:15:54 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 3 Aug
 2023 11:16:57 +0800
From: Ruan Jinjie <ruanjinjie@huawei.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
	<daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <robh@kernel.org>,
	<tomeu.vizoso@collabora.com>, <steven.price@arm.com>,
	<alyssa.rosenzweig@collabora.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next 0/2] drm: Do not check for 0 return after calling platform_get_irq()
Date: Thu, 3 Aug 2023 11:16:20 +0800
Message-ID: <20230803031622.3023868-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_201702_794561_F42F0260 
X-CRM114-Status: UNSURE (   8.06  )
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

Since commit a85a6c86c25be ("driver core: platform: Clarify that
IRQ 0 is invalid)", there is no possible both for platform_get_irq() 
and platform_get_irq_byname() to return 0,

And the return value of platform_get_irq() or platform_get_irq_byname() 
is more sensible to show the error reason.

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


