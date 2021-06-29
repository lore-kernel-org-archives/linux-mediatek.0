Return-Path: <SRS0=olbE=LX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8009EC11F67
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jun 2021 15:02:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B34961CE6
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jun 2021 15:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B34961CE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NwLgwhwVwuu26zN3JOhb+6qAkmxWsCv6YurSS1rvzWk=; b=ePtN1JN73PegZS
	UdRbsuN3Y5MyBa7jq063Zk20W1Mi7OlOyufYQ3dErevksDrZoS9M7faE9B8vuG++EhFL02pkZ+SaX
	IxboxU/xoQwV2JJ6102wmEbTNW0g0uCsgv+Fri4YMz/Fqpt/owYYCRfAUO+UmuAg33Iy3HJPvRui5
	zybXYywLtqHMLWcYOguhQPeYsiFZA5Qykt7aYDxeHnZfMWrbhsj5Apy20huuNUBjdj/uR+6YsFbJ1
	wYPi+L1snqdbH5vy6dWClToqBQP2U0zx0XIGygvwZcQxeVHiePUOz1xpuPZGW2C/YyVZCgVZrbPVJ
	pUKCb2n/qEEGTUn3o+rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyFFT-00BOfc-H0; Tue, 29 Jun 2021 15:02:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyFFQ-00BOee-Pp; Tue, 29 Jun 2021 15:02:02 +0000
X-UUID: e0c2f2d4f4da44619b1ca27b74b6580f-20210629
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=1AdWuVi90zo0qjXMBgGXjnne3/Dg36g8YM2lbEOtTyE=; 
 b=DLHgn9JYQhyMtW67bVwTB+E8uVkPCz2U5/kLy9T1BEtLt9+AZuALBn1hXG252173yN4jyzSHfB6yvHQ85wHUzuicF5OG0dUSz+nxnHHGdKJVo8AgGtLTqwmRFM0HS14chRpovWPXcmhiC5HXkp6w2atf5VfkUhWP68pLoL61WFM=;
X-UUID: e0c2f2d4f4da44619b1ca27b74b6580f-20210629
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <phil.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1569160952; Tue, 29 Jun 2021 08:01:55 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Jun 2021 08:01:51 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Jun 2021 23:01:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 29 Jun 2021 23:01:50 +0800
From: Phil Chang <phil.chang@mediatek.com>
To: <linux-remoteproc@vger.kernel.org>
CC: <ohad@wizery.com>, <bjorn.andersson@linaro.org>,
 <mathieu.poirier@linaro.org>, <matthias.bgg@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <yj.chiang@mediatek.com>,
 <mark-pk.tsai@mediatek.com>, <weiting.tsai@mediatek.com>, Phil Chang
 <phil.chang@mediatek.com>
Subject: [PATCH] remoteproc: export rproc re/unregister to virtio device APIs
Date: Tue, 29 Jun 2021 23:00:02 +0800
Message-ID: <20210629150002.8050-1-phil.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_080200_893012_43D50DE1 
X-CRM114-Status: GOOD (  10.24  )
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

In some case, the remote processor already boot up on previous state,
but still need register to virtio device, so that exported those APIs.

Signed-off-by: Phil Chang <phil.chang@mediatek.com>
Signed-off-by: YJ chiang <yj.chiang@mediatek.com>
---
Hi

In our case, the remote processor is already boot up in u-boot,
we don't want to boot again or load fw in driver but register to virtio
device for rpmsg. so that needs those API exported.
Furthermore, the rproc_vq_interrupt is exported, so those functions
should be exported also.

thanks

 drivers/remoteproc/remoteproc_virtio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 0cc617f76068..e23658a76f5e 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -425,6 +425,7 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 out:
 	return ret;
 }
+EXPORT_SYMBOL(rproc_add_virtio_dev);
 
 /**
  * rproc_remove_virtio_dev() - remove an rproc-induced virtio device
@@ -440,3 +441,4 @@ int rproc_remove_virtio_dev(struct device *dev, void *data)
 	unregister_virtio_device(vdev);
 	return 0;
 }
+EXPORT_SYMBOL(rproc_remove_virtio_dev);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
