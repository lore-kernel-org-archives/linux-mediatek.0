Return-Path: <SRS0=SpBb=PH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB35C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 12:32:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E7D461052
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 12:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7E7D461052
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Zp1WZJuNJxzyJD3BMVh6fkf9/GhEIuu0oE914MMH0Lk=; b=W4zw1Qkss8raNd
	Qc6yyjTo/X5lKd/T3VwSv0VQCA7bp8w12zW0R2wCwvgLJJlni+P6HvSy7hxRAKWvvTKsImylI1NNk
	LOdjDkhjLGiQKIbRgmF+v3RSBxaHvhT6Fv/uf6Yc/+u4D+3cjjSCPUetW36Iu7XVGzLWA01MD+d0L
	2QHpsDPPsUrdozOOS8MPyFSiQ70u7MnO1TDGaejF0EfKUQNGjxCyiBP9GyqlG8B6aaFZ9ixDUQVBw
	EI3+XXWhfUTQMmgzAdXbq0bfJaCwKY6l/ln9CegpHec1n4o71s8g3jUZWCibf07ODiIq5kfEkKeOL
	uiRs+1/niuA/34stfETA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcoHg-001D85-V6; Tue, 19 Oct 2021 12:32:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mco9l-0019ok-Uy; Tue, 19 Oct 2021 12:23:51 +0000
X-UUID: f8d782999c724382a93cf92047f87e6c-20211019
X-UUID: f8d782999c724382a93cf92047f87e6c-20211019
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1012303689; Tue, 19 Oct 2021 05:23:46 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 19 Oct 2021 05:23:44 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 19 Oct 2021 20:23:43 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 19 Oct 2021 20:23:42 +0800
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
Subject: [PATCH] dma-buf: add attachments empty check for dma_buf_release
Date: Tue, 19 Oct 2021 20:23:45 +0800
Message-ID: <20211019122345.160555-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211019_052350_096120_C082B6F1 
X-CRM114-Status: GOOD (  12.53  )
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

Since there is no mandatory inspection for attachments in dma_buf_release.
There will be a case that dma_buf already released but attachment is still
in use, which can points to the dmabuf, and it maybe cause
some unexpected issues.

With IOMMU, when this cases occurs, there will have IOMMU address
translation fault(s) followed by this warning,
I think it's useful for dma devices to debug issue.

Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
---
 drivers/dma-buf/dma-buf.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 511fe0d217a0..672404857d6a 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -74,6 +74,29 @@ static void dma_buf_release(struct dentry *dentry)
 	 */
 	BUG_ON(dmabuf->cb_shared.active || dmabuf->cb_excl.active);
 
+	/* attachment check */
+	if (dma_resv_trylock(dmabuf->resv) && WARN(!list_empty(&dmabuf->attachments),
+	    "%s err, inode:%08lu size:%08zu name:%s exp_name:%s flags:0x%08x mode:0x%08x, %s\n",
+	    __func__, file_inode(dmabuf->file)->i_ino, dmabuf->size,
+	    dmabuf->name, dmabuf->exp_name,
+	    dmabuf->file->f_flags, dmabuf->file->f_mode,
+	    "Release dmabuf before detach all attachments, dump attach:\n")) {
+		int attach_cnt = 0;
+		dma_addr_t dma_addr;
+		struct dma_buf_attachment *attach_obj;
+		/* dump all attachment info */
+		list_for_each_entry(attach_obj, &dmabuf->attachments, node) {
+			dma_addr = (dma_addr_t)0;
+			if (attach_obj->sgt)
+				dma_addr = sg_dma_address(attach_obj->sgt->sgl);
+			pr_err("attach[%d]: dev:%s dma_addr:0x%-12lx\n",
+			       attach_cnt, dev_name(attach_obj->dev), dma_addr);
+			attach_cnt++;
+		}
+		pr_err("Total %d devices attached\n\n", attach_cnt);
+		dma_resv_unlock(dmabuf->resv);
+	}
+
 	dmabuf->ops->release(dmabuf);
 
 	if (dmabuf->resv == (struct dma_resv *)&dmabuf[1])
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
