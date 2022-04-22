Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E0BC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 06:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VJFmW2GyEBrhIBlzg/Y4ZHpzAgArZdNx/m3sFuqZi8s=; b=gORIIaowasCWJj
	jmBJ08yBikXGMDGLjE/Ml8mqGy8XfQQDyN7tLZ1Ix39viDfwQlydqho0vhewAnq3LZ9GDq7Tu9SRa
	XwTgoL7p+mj2rcEvu4ALymfF5X7JWoxe7KbOM8e7E4Rw+zQUZpJJ2ku916XwrnK+OvIVGpU/DICtQ
	6dZKJ8eXcGw0t366aDt3YGrPH4Xsx6sZ7cq5cxdu3lK6kgRAmKudyou7RAoMLnbxvRR+UHKoIFmT8
	b3eVgQtzGaSG1HcNNH3PvqvJW+ocPzW7ofj2ftQe3+hLFuiI3QbK9w+LeeJun5Ss0cWSjblCWXcK4
	6JrT2EXXdyv4aoEQ8bKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhmri-00GaFS-Nx; Fri, 22 Apr 2022 06:34:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhmpq-00GZP3-UV; Fri, 22 Apr 2022 06:32:08 +0000
X-UUID: 6e37e60fec484c6f95532819c47add86-20220421
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:ec1fa9fe-f6a2-42c2-b811-d03beaa289de, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:fa7abeef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 6e37e60fec484c6f95532819c47add86-20220421
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1994396902; Thu, 21 Apr 2022 23:32:03 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Apr 2022 23:24:40 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 22 Apr 2022 14:24:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Apr 2022 14:24:39 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <bjorn.andersson@linaro.org>, <mathieu.poirier@linaro.org>,
 <robin.murphy@arm.com>
CC: <hch@lst.de>, <m.szyprowski@samsung.com>, <matthias.bgg@gmail.com>,
 <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <iommu@lists.linux-foundation.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <mark-pk.tsai@mediatek.com>,
 <yj.chiang@mediatek.com>
Subject: [PATCH 0/2] dma-mapping,
 remoteproc: Fix dma_mem leak after rproc_shutdown
Date: Fri, 22 Apr 2022 14:24:34 +0800
Message-ID: <20220422062436.14384-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_233207_026880_78AA176D 
X-CRM114-Status: UNSURE (   6.90  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Release dma coherent memory before rvdev is free in
rproc_rvdev_release().

Below is the kmemleak report:
unreferenced object 0xffffff8051c1a980 (size 128):
  comm "sh", pid 4895, jiffies 4295026604 (age 15481.896s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<000000003a0f3ec0>] dma_declare_coherent_memory+0x44/0x11c
    [<00000000ad243164>] rproc_add_virtio_dev+0xb8/0x20c
    [<00000000d219c8e9>] rproc_vdev_do_start+0x18/0x24
    [<00000000e694b468>] rproc_start+0x22c/0x3e0
    [<000000000b938941>] rproc_boot+0x4a4/0x860
    [<000000003c4dc532>] state_store.52856+0x10c/0x1b8
    [<00000000df2297ac>] dev_attr_store+0x34/0x84
    [<0000000083a53bdb>] sysfs_kf_write+0x60/0xbc
    [<000000008ed830df>] kernfs_fop_write+0x198/0x458
    [<0000000072b9ad06>] __vfs_write+0x50/0x210
    [<00000000377d7469>] vfs_write+0xe4/0x1a8
    [<00000000c3fc594e>] ksys_write+0x78/0x144
    [<000000009aef6f4b>] __arm64_sys_write+0x1c/0x28
    [<0000000003496a98>] el0_svc_common+0xc8/0x22c
    [<00000000ea3fe7a3>] el0_svc_compat_handler+0x1c/0x28
    [<00000000d1a85a4e>] el0_svc_compat+0x8/0x24

Mark-PK Tsai (2):
  dma-mapping: Add dma_release_coherent_memory to DMA API
  remoteproc: Fix dma_mem leak after rproc_shutdown

 drivers/remoteproc/remoteproc_core.c |  1 +
 include/linux/dma-map-ops.h          |  3 +++
 kernel/dma/coherent.c                | 10 ++++++++--
 3 files changed, 12 insertions(+), 2 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
