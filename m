Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7611CC07E9A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 07:22:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E229613B2
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 07:22:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E229613B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1LFKqRaZqvIqJf/YFDGzETYe4+d4V/oJzajLIfMX5e4=; b=qWSwl4N0ohLJwL
	jtYBHckWxXDQLsLm9nXu6cHcZv38xsOzUv4E16qfwYWH9FgcEDP8KcRcc+1KoOiHbuWX8PdDP3KqJ
	bGwpFmjkm9LiMh5XUxJ/4iWCW5mNF4BAc6w/OOtnVvUCNP9y/4Ihn7zx4iy2Qu0xjRDr5AWvU0vFn
	PDc9t3EvnowvGvkuSLKTmKCUW3FxhzEHhBK4WNzyA0k7SKqKSYYRmJVYBQGitcwQXicoonG8f/pvd
	ybhw3fbHqDbkToLaToSNhrYKnjHLGqEDKmiEBnM5gNXOqvOH5nFQ+HLJNjQZ08Ufqb7zReLfZlp1c
	yFQejOOGH/xh5h9BfwSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3ZDV-00CUdv-85; Wed, 14 Jul 2021 07:22:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3ZDR-00CUcv-Cv; Wed, 14 Jul 2021 07:21:59 +0000
X-UUID: 827bebe5dd9f4cbdbb361c08066d66a5-20210714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=BTU9yvp5MJwVRvT61eJcbp/R3GzRNC+5P6CEuXMDmFo=; 
 b=bTUW28/ScD9XbIV9GhcVpdh+yPTpVp4j3i8zIzH6XjDrvM7CRaQ/s8UopIVc6wtaph8KZmnicislDP3V+1HgQxzLa9Ska701fmdapb6l2kVLQClktJBbYXhT0gLEJPEL5fVd2ItutV5f50szjnU4XNPEFChERD2mla2V26xBLU4=;
X-UUID: 827bebe5dd9f4cbdbb361c08066d66a5-20210714
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1146425374; Wed, 14 Jul 2021 00:21:53 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 00:11:51 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 15:11:49 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 14 Jul 2021 15:11:49 +0800
From: <guangming.cao@mediatek.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, <christian.koenig@amd.com>
CC: <wsd_upstream@mediatek.com>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Guangming Cao
 <Guangming.Cao@mediatek.com>
Subject: [PATCH] dma-buf: add kernel count for dma_buf
Date: Wed, 14 Jul 2021 15:11:44 +0800
Message-ID: <20210714071144.62126-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_002157_492900_B0A28310 
X-CRM114-Status: GOOD (  17.95  )
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

Add a refcount for kernel to prevent UAF(Use After Free) issue.

We can assume a case like below:
    1. kernel space alloc dma_buf(file count = 1)
    2. kernel use dma_buf to get fd(file count = 1)
    3. userspace use fd to do mapping (file count = 2)
    4. kernel call dma_buf_put (file count = 1)
    5. userpsace close buffer fd(file count = 0)
    6. at this time, buffer is released, but va is valid!!
       So we still can read/write buffer via mmap va,
       it maybe cause memory leak, or kernel exception.
       And also, if we use "ls -ll" to watch corresponding process
           fd link info, it also will cause kernel exception.

Another case:
     Using dma_buf_fd to generate more than 1 fd, because
     dma_buf_fd will not increase file count, thus, when close
     the second fd, it maybe occurs error.

Solution:
    Add a kernel count for dma_buf, and make sure the file count
        of dma_buf.file hold by kernel is 1.

Notes: For this solution, kref couldn't work because kernel ref
       maybe added from 0, but kref don't allow it.

Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
---
 drivers/dma-buf/dma-buf.c | 23 +++++++++++++++++++----
 include/linux/dma-buf.h   |  6 ++++--
 2 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 511fe0d217a0..04ee92aac8b9 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -62,6 +62,7 @@ static void dma_buf_release(struct dentry *dentry)
 	if (unlikely(!dmabuf))
 		return;
 
+	WARN_ON(atomic64_read(&dmabuf->kernel_ref));
 	BUG_ON(dmabuf->vmapping_counter);
 
 	/*
@@ -555,6 +556,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 		goto err_module;
 	}
 
+	atomic64_set(&dmabuf->kernel_ref, 1);
 	dmabuf->priv = exp_info->priv;
 	dmabuf->ops = exp_info->ops;
 	dmabuf->size = exp_info->size;
@@ -617,6 +619,9 @@ int dma_buf_fd(struct dma_buf *dmabuf, int flags)
 
 	fd_install(fd, dmabuf->file);
 
+	/* Add file cnt for each new fd */
+	get_file(dmabuf->file);
+
 	return fd;
 }
 EXPORT_SYMBOL_GPL(dma_buf_fd);
@@ -626,12 +631,13 @@ EXPORT_SYMBOL_GPL(dma_buf_fd);
  * @fd:	[in]	fd associated with the struct dma_buf to be returned
  *
  * On success, returns the struct dma_buf associated with an fd; uses
- * file's refcounting done by fget to increase refcount. returns ERR_PTR
- * otherwise.
+ * dmabuf's ref refcounting done by kref_get to increase refcount.
+ * Returns ERR_PTR otherwise.
  */
 struct dma_buf *dma_buf_get(int fd)
 {
 	struct file *file;
+	struct dma_buf *dmabuf;
 
 	file = fget(fd);
 
@@ -643,7 +649,12 @@ struct dma_buf *dma_buf_get(int fd)
 		return ERR_PTR(-EINVAL);
 	}
 
-	return file->private_data;
+	dmabuf = file->private_data;
+	/* replace file count increase as ref increase for kernel user */
+	get_dma_buf(dmabuf);
+	fput(file);
+
+	return dmabuf;
 }
 EXPORT_SYMBOL_GPL(dma_buf_get);
 
@@ -662,7 +673,11 @@ void dma_buf_put(struct dma_buf *dmabuf)
 	if (WARN_ON(!dmabuf || !dmabuf->file))
 		return;
 
-	fput(dmabuf->file);
+	if (WARN_ON(!atomic64_read(&dmabuf->kernel_ref)))
+		return;
+
+	if (!atomic64_dec_return(&dmabuf->kernel_ref))
+		fput(dmabuf->file);
 }
 EXPORT_SYMBOL_GPL(dma_buf_put);
 
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index efdc56b9d95f..bc790cb028eb 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -308,6 +308,7 @@ struct dma_buf_ops {
 struct dma_buf {
 	size_t size;
 	struct file *file;
+	atomic64_t kernel_ref;
 	struct list_head attachments;
 	const struct dma_buf_ops *ops;
 	struct mutex lock;
@@ -436,7 +437,7 @@ struct dma_buf_export_info {
 					 .owner = THIS_MODULE }
 
 /**
- * get_dma_buf - convenience wrapper for get_file.
+ * get_dma_buf - increase a kernel ref of dma-buf
  * @dmabuf:	[in]	pointer to dma_buf
  *
  * Increments the reference count on the dma-buf, needed in case of drivers
@@ -446,7 +447,8 @@ struct dma_buf_export_info {
  */
 static inline void get_dma_buf(struct dma_buf *dmabuf)
 {
-	get_file(dmabuf->file);
+	if (atomic64_inc_return(&dmabuf->kernel_ref) == 1)
+		get_file(dmabuf->file);
 }
 
 /**
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
