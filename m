Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF72C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 06:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sE6LksQZnfCU/q27NjX6LfFi6FkGMPi1tJKKd0n1iLM=; b=FXMfUldc6owuBS
	+Ga1PKTVvnzSMsWr+axf7A68FnpKAai++HFAsodBRgy3EAZ4QZMEBTzcRrxZMy1zn3uvYhOkWNJ9g
	j7a50J4kGnkf/sv8gNzJqvop7kU/hU0q2xMa7xAcafY0dSXaETBd3paTkywz2UEeMi7WUnEEb/Cub
	TWd9byPOFPvhrpigIme8u87V1vxKjaYfPDaER6VlNiZa95ExrChdPbUJZz9HZntAsA25hezhHbmH8
	lB3fDo5D44VIpJ5BdEaSxVlu1/dvxLVF32a2Yekb/PHOf2HElb2C7rHwWczwtEKx7p0FdbCX/gS20
	BQpxwta9hIMspQscJBzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhmp2-00GYtf-80; Fri, 22 Apr 2022 06:31:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhmim-00GW2l-Lr; Fri, 22 Apr 2022 06:24:50 +0000
X-UUID: 0e8ea3cb4c4547f3ab83e14f2dc3c192-20220421
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:234c1611-106f-4fec-919a-86709b4bdd2d, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:e42f94f0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:1,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 0e8ea3cb4c4547f3ab83e14f2dc3c192-20220421
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1697608761; Thu, 21 Apr 2022 23:24:43 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Apr 2022 23:24:42 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Apr 2022 14:24:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Apr 2022 14:24:41 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <bjorn.andersson@linaro.org>, <mathieu.poirier@linaro.org>,
 <robin.murphy@arm.com>
CC: <hch@lst.de>, <m.szyprowski@samsung.com>, <matthias.bgg@gmail.com>,
 <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <iommu@lists.linux-foundation.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <mark-pk.tsai@mediatek.com>,
 <yj.chiang@mediatek.com>
Subject: [PATCH 2/2] remoteproc: Fix dma_mem leak after rproc_shutdown
Date: Fri, 22 Apr 2022 14:24:36 +0800
Message-ID: <20220422062436.14384-3-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220422062436.14384-1-mark-pk.tsai@mediatek.com>
References: <20220422062436.14384-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_232448_759617_04450B5A 
X-CRM114-Status: UNSURE (   9.22  )
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

Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 drivers/remoteproc/remoteproc_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index c510125769b9..8e28290eefa9 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -461,6 +461,7 @@ static void rproc_rvdev_release(struct device *dev)
 	struct rproc_vdev *rvdev = container_of(dev, struct rproc_vdev, dev);
 
 	of_reserved_mem_device_release(dev);
+	dma_release_coherent_memory(dev);
 
 	kfree(rvdev);
 }
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
