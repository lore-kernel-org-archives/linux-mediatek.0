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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775A3C07E9A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 12:30:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32B20613B2
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 12:30:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32B20613B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uDqV6TkOA0E3z/eVvPS6qtBHU3mh2e6+s9F1cuKK2UY=; b=unuuLa994i1Mju
	AowVBgjE4Sz7y5v/UTwUkUDThfK+DMNL8dghulWgK8C59wJaHqTTTTA5xc9K7YmYDRm+k5V7UP2Kg
	LBh/nKydU+1DC3+aOjofEiJ4Jo0wXtJG6XO3k2aFCAvSpWjP/LQqrq8TnrMdUqa7CBB3pc3Q6u8gp
	ZiX/2v+gRRS2Olmv18QtDFqjitCEKdsxjTymmxKFG5OG9t02rroXvIfMsygpEoZrFGI1YwGmzEDge
	2X6Nej26nQ7U4P6lxCUIQMhnvxXbzm6TPnyqUwhB4d2xcX0KZx9KnFEfIhp2CsuB6LojTyZTL9Oe8
	Ag72eEKdcfPsdu4APOug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3e1u-00DY1I-8i; Wed, 14 Jul 2021 12:30:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3e1f-00DXwM-Fx; Wed, 14 Jul 2021 12:30:09 +0000
X-UUID: 6ded1028362d4210afb5790ef1c6328b-20210714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=cYdFSkIOeXY5Wn6UwXabQpp/YxDT0LuRYxAub7w176A=; 
 b=gR7Z9ncOoFpT7B2Li2likGlmUhSDrlZW1y5DhmQO7tL6oBRKjhVpukkOF0v5ep9FfiTs8s+csIJK9vhtO2k5tDX1hMSz5bCorXVZkLws641lp1JKiFhER3o/Mj/QjEOnQy5LoV27JKyUNuSBAbSIV6QPHJOA12yqeJIKvq4saCs=;
X-UUID: 6ded1028362d4210afb5790ef1c6328b-20210714
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 829188638; Wed, 14 Jul 2021 05:30:06 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 05:30:04 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 20:29:56 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 14 Jul 2021 20:29:56 +0800
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
CC: <wsd_upstream@mediatek.com>, <caoguangming34@gmail.com>, Guangming Cao
 <Guangming.Cao@mediatek.com>
Subject: [PATCH] dma-buf: support users to change dma_buf.name
Date: Wed, 14 Jul 2021 20:29:54 +0800
Message-ID: <20210714122954.71931-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_053007_613346_75BCF0E6 
X-CRM114-Status: GOOD (  15.14  )
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

User space user can call DMA_BUF_SET_NAME to set dma_buf.name,
also add a kernel api for users to do same thing at kernel side.

Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
---
 drivers/dma-buf/dma-buf.c | 28 ++++++++++++++++++++++------
 include/linux/dma-buf.h   |  1 +
 2 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 511fe0d217a0..949af232c644 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -331,20 +331,20 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
  * purpose between different devices.
  *
  * @dmabuf: [in]     dmabuf buffer that will be renamed.
- * @buf:    [in]     A piece of userspace memory that contains the name of
+ * @buf:    [in]     A piece of memory that contains the name of
  *                   the dma-buf.
  *
  * Returns 0 on success. If the dma-buf buffer is already attached to
  * devices, return -EBUSY.
  *
  */
-static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
+long dma_buf_set_name(struct dma_buf *dmabuf, const char *buf)
 {
-	char *name = strndup_user(buf, DMA_BUF_NAME_LEN);
+	char *name = kstrndup(buf, DMA_BUF_NAME_LEN, GFP_KERNEL);
 	long ret = 0;
 
-	if (IS_ERR(name))
-		return PTR_ERR(name);
+	if (!name)
+		return -ENOMEM;
 
 	dma_resv_lock(dmabuf->resv, NULL);
 	if (!list_empty(&dmabuf->attachments)) {
@@ -361,6 +361,22 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
 	dma_resv_unlock(dmabuf->resv);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(dma_buf_set_name);
+
+static long
+dma_buf_set_name_user(struct dma_buf *dmabuf, const char __user *buf)
+{
+	char *name = strndup_user(buf, DMA_BUF_NAME_LEN);
+	long ret = 0;
+
+	if (IS_ERR(name))
+		return PTR_ERR(name);
+
+	ret = dma_buf_set_name(dmabuf, name);
+	kfree(name);
+
+	return ret;
+}
 
 static long dma_buf_ioctl(struct file *file,
 			  unsigned int cmd, unsigned long arg)
@@ -403,7 +419,7 @@ static long dma_buf_ioctl(struct file *file,
 
 	case DMA_BUF_SET_NAME_A:
 	case DMA_BUF_SET_NAME_B:
-		return dma_buf_set_name(dmabuf, (const char __user *)arg);
+		return dma_buf_set_name_user(dmabuf, (const char __user *)arg);
 
 	default:
 		return -ENOTTY;
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index efdc56b9d95f..e6612ab59a59 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -507,4 +507,5 @@ int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
 		 unsigned long);
 int dma_buf_vmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
 void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
+long dma_buf_set_name(struct dma_buf *dmabuf, const char *name);
 #endif /* __DMA_BUF_H__ */
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
