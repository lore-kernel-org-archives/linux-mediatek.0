Return-Path: <SRS0=sTTz=O4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 699EDC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 06:34:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 184E661053
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 06:34:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 184E661053
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LKh41tQeX+O0Rn4P5IDNTdZsJp1dJczkxB2I/5VcAfI=; b=lTsko+/jaXQOQm
	LN7pnW+1ZNlKqo70NygvgWdt6csge0WsM5WeTEszgMWjXL7q4eMP6pZejFlwo6G1QBC5Umm9Z37dZ
	IXuBvHhi1KmNy6NKSPnNGQvgn1MqOK8XKmRIgNcCBy1ExVj0a4cr2TwjDvc6z03bE7UKYtYgQviCP
	qJQPm3ny2WYjiNvAmey47bSuVaCxdTdGbqAO8ZGThIZ9iv96siw5BLRfqj6b2XmNL428ajUEVtgAB
	CJOmRzeFhOHRc8Dhcv3WUbmsztQKApa0FfoKNaRhIu3Kkfo6Gh3m5e86vayvIXux3vDGxtO+gMpGV
	Xkx7mb1xDoAKUzd1HVIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYjSh-001htg-09; Fri, 08 Oct 2021 06:34:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYjSU-001hrX-EX; Fri, 08 Oct 2021 06:34:19 +0000
X-UUID: 62e4776995dd4d1bbbe68f2e4d6769db-20211007
X-UUID: 62e4776995dd4d1bbbe68f2e4d6769db-20211007
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 578169701; Thu, 07 Oct 2021 23:34:15 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Oct 2021 23:27:20 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 8 Oct 2021 14:27:19 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 8 Oct 2021 14:27:18 +0800
From: <guangming.cao@mediatek.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 "open
 list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>, "open
 list:DMA BUFFER SHARING FRAMEWORK" <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
CC: <wsd_upstream@mediatek.com>, Guangming Cao <Guangming.Cao@mediatek.com>
Subject: [PATCH] dma-buf: acquire name lock before read/write dma_buf.name
Date: Fri, 8 Oct 2021 14:29:03 +0800
Message-ID: <20211008062903.39731-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_233418_500892_A77843C9 
X-CRM114-Status: UNSURE (   8.24  )
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

From: Guangming Cao <Guangming.Cao@mediatek.com>

Because dma-buf.name can be freed in func: "dma_buf_set_name",
so, we need to acquire lock first before we read/write dma_buf.name
to prevent Use After Free(UAF) issue.

Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
---
 drivers/dma-buf/dma-buf.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 511fe0d217a0..aebb51b3ff52 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -80,7 +80,9 @@ static void dma_buf_release(struct dentry *dentry)
 		dma_resv_fini(dmabuf->resv);
 
 	module_put(dmabuf->owner);
+	spin_lock(&dmabuf->name_lock);
 	kfree(dmabuf->name);
+	spin_unlock(&dmabuf->name_lock);
 	kfree(dmabuf);
 }
 
@@ -1372,6 +1374,8 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 		if (ret)
 			goto error_unlock;
 
+
+		spin_lock(&dmabuf->name_lock);
 		seq_printf(s, "%08zu\t%08x\t%08x\t%08ld\t%s\t%08lu\t%s\n",
 				buf_obj->size,
 				buf_obj->file->f_flags, buf_obj->file->f_mode,
@@ -1379,6 +1383,7 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 				buf_obj->exp_name,
 				file_inode(buf_obj->file)->i_ino,
 				buf_obj->name ?: "");
+		spin_unlock(&dmabuf->name_lock);
 
 		robj = buf_obj->resv;
 		fence = dma_resv_excl_fence(robj);
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
