Return-Path: <SRS0=30uw=BQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C82FC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 12:28:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AA5F22DFB
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 12:28:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Px6gSFnj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="g3zLm8dN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AA5F22DFB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1uSNoc1Ukaff6FwqcbvP/U+b1x1JKMMjjdNjoNDpisQ=; b=Px6gSFnj40/PNfZi/xEIvU9EB
	rGDOiAszkqHIKPhFTrfvbLBUUkkdZ2X/U7BpvmJq8rxfThdjMw46VDkqheElqEnhXZyFzZEfIFt7A
	WVZjnkaS41pMcsMA6nrCt4WQZAChtqXZwzY3Gz8N4o3Juu8mT9JPbsUpfgpBTmEZRlsllH0WoVfez
	uQ5T0422qJYmfibfLvBMQizHPyfXALVfcvEFl9BRR4Ns7Xdz80Y9FxGFRQn8A31eySW5JkUYK9wdN
	9L2EvhpgpXe86nebUt4xGE/t8mFE43cE3qHCP766zCLak8J3elJU+3ytYQrh343zZ5lh21FXEeFR1
	ysa70CBoA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3aLv-0002GN-3t; Thu, 06 Aug 2020 07:30:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3aLr-0002FA-Es; Thu, 06 Aug 2020 07:30:13 +0000
X-UUID: 33ed00c901394be6802420b42950f470-20200805
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=B8qaPDjKTfOIbqITwnr8BqIaksFSTvTxUkaMPB1xRYM=; 
 b=g3zLm8dNbp40J01i/yYzw2SMc2ExBI05wGquGdG69920gPZgXvfI6VXaLA4k7986fVAp+6tm4log+Wkt879Ddgof6meoYTYVz8K5CILNhXcDn/SpS/A3eKczVJuBQtHCyM77zomip9fGHzR4twHAswjPqDR572ux28X9RLZUvUM=;
X-UUID: 33ed00c901394be6802420b42950f470-20200805
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <frederic.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 765057043; Wed, 05 Aug 2020 23:30:04 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Aug 2020 00:30:02 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Aug 2020 15:29:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 6 Aug 2020 15:29:59 +0800
From: <frederic.chen@mediatek.com>
To: <hans.verkuil@cisco.com>, <laurent.pinchart+renesas@ideasonboard.com>,
 <tfiga@chromium.org>, <matthias.bgg@gmail.com>, <mchehab@kernel.org>
Subject: [PATCH V1] media: mc-device.c: change media_device_request_alloc to
 match media_ioctl_info
Date: Thu, 6 Aug 2020 15:29:52 +0800
Message-ID: <20200806072952.11709-2-frederic.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200806072952.11709-1-frederic.chen@mediatek.com>
References: <20200806072952.11709-1-frederic.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0A052C7018DA07F1261F4C1F1DC0A8B028AFDDE8F537988F71012BDB323D49AF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_033011_664411_280A54FE 
X-CRM114-Status: GOOD (  11.32  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Sean.Cheng@mediatek.com, srv_heupstream@mediatek.com, sj.huang@mediatek.com,
 yuzhao@chromium.org, linux-mediatek@lists.infradead.org, zwisler@chromium.org,
 christie.yu@mediatek.com, frederic.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frederic Chen <frederic.chen@mediatek.com>

We modified the type of media_device_request_alloc()'s second
parameter from int* to void* so that it can match the interface
defined in struct media_ioctl_info.

Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>
---
 drivers/media/mc/mc-device.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index da8088351135..bc5b5ecb6581 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -370,9 +370,10 @@ static long media_device_get_topology(struct media_device *mdev, void *arg)
 	return ret;
 }
 
-static long media_device_request_alloc(struct media_device *mdev,
-				       int *alloc_fd)
+static long media_device_request_alloc(struct media_device *mdev, void *arg)
 {
+	int *alloc_fd = arg;
+
 #ifdef CONFIG_MEDIA_CONTROLLER_REQUEST_API
 	if (!mdev->ops || !mdev->ops->req_validate || !mdev->ops->req_queue)
 		return -ENOTTY;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
