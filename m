Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE96AC6FA90
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 10:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iX/4To+c28wRIBDrkybObrom/UGxzlrLJ1dNG8kFn7I=; b=l5VQZ+ourIrSrtNvsnh336Xq8W
	eLbtV5XiszYk+jWTyvFdz8DzAW4fZ/QK2R3NCSemBgAWLAi7V8+BTswy0Eowm38FDC+MB4A5dtRJa
	z8sbFlVh0cadlb16OnUxxXJz6QBfHTb9vtA65SnsogBgNQr2XAGImg0LNk7WqyqKqJrncw5SPa7bN
	2ilfaCpYWsa7HcnlgEpFhJcEek1XHqqf+Z0jiPm/xpe49aMDgxBR9+Bm5DxBVjL5toZf4n1QsBrLy
	t4XSxnmR0Axxungnd08wR1vh1LyeuTAgeOIhyAKC1rnIZsXqcfQF6OECCRRT5VaQfpyz30dRT4iPF
	1EFcwWiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od86T-009xcJ-Bx; Tue, 27 Sep 2022 10:46:17 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od86B-009xOV-Kf; Tue, 27 Sep 2022 10:46:01 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4McGQ71VzSz1P6p6;
	Tue, 27 Sep 2022 18:41:35 +0800 (CST)
Received: from dggpemm100009.china.huawei.com (7.185.36.113) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 18:45:49 +0800
Received: from huawei.com (10.175.113.32) by dggpemm100009.china.huawei.com
 (7.185.36.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 27 Sep
 2022 18:45:49 +0800
From: Liu Shixin <liushixin2@huawei.com>
To: Jakub Kicinski <kuba@kernel.org>, Felix Fietkau <nbd@nbd.name>, "John
 Crispin" <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Mark Lee
	<Mark-MC.Lee@mediatek.com>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Liu
 Shixin" <liushixin2@huawei.com>
Subject: [PATCH net-next v2] net: ethernet: mtk_eth_soc: use DEFINE_SHOW_ATTRIBUTE to simplify code
Date: Tue, 27 Sep 2022 19:19:25 +0800
Message-ID: <20220927111925.2424100-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.32]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm100009.china.huawei.com (7.185.36.113)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_034600_048138_B85223AA 
X-CRM114-Status: UNSURE (   7.34  )
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

Use DEFINE_SHOW_ATTRIBUTE helper macro to simplify the code.
No functional change.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---

v1->v2: Rebase on net-next.

 .../net/ethernet/mediatek/mtk_ppe_debugfs.c   | 36 ++++---------------
 1 file changed, 6 insertions(+), 30 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c b/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c
index ec49829ab32d..391b071bcff3 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c
@@ -162,52 +162,28 @@ mtk_ppe_debugfs_foe_show(struct seq_file *m, void *private, bool bind)
 }
 
 static int
-mtk_ppe_debugfs_foe_show_all(struct seq_file *m, void *private)
+mtk_ppe_debugfs_foe_all_show(struct seq_file *m, void *private)
 {
 	return mtk_ppe_debugfs_foe_show(m, private, false);
 }
+DEFINE_SHOW_ATTRIBUTE(mtk_ppe_debugfs_foe_all);
 
 static int
-mtk_ppe_debugfs_foe_show_bind(struct seq_file *m, void *private)
+mtk_ppe_debugfs_foe_bind_show(struct seq_file *m, void *private)
 {
 	return mtk_ppe_debugfs_foe_show(m, private, true);
 }
-
-static int
-mtk_ppe_debugfs_foe_open_all(struct inode *inode, struct file *file)
-{
-	return single_open(file, mtk_ppe_debugfs_foe_show_all,
-			   inode->i_private);
-}
-
-static int
-mtk_ppe_debugfs_foe_open_bind(struct inode *inode, struct file *file)
-{
-	return single_open(file, mtk_ppe_debugfs_foe_show_bind,
-			   inode->i_private);
-}
+DEFINE_SHOW_ATTRIBUTE(mtk_ppe_debugfs_foe_bind);
 
 int mtk_ppe_debugfs_init(struct mtk_ppe *ppe, int index)
 {
-	static const struct file_operations fops_all = {
-		.open = mtk_ppe_debugfs_foe_open_all,
-		.read = seq_read,
-		.llseek = seq_lseek,
-		.release = single_release,
-	};
-	static const struct file_operations fops_bind = {
-		.open = mtk_ppe_debugfs_foe_open_bind,
-		.read = seq_read,
-		.llseek = seq_lseek,
-		.release = single_release,
-	};
 	struct dentry *root;
 
 	snprintf(ppe->dirname, sizeof(ppe->dirname), "ppe%d", index);
 
 	root = debugfs_create_dir(ppe->dirname, NULL);
-	debugfs_create_file("entries", S_IRUGO, root, ppe, &fops_all);
-	debugfs_create_file("bind", S_IRUGO, root, ppe, &fops_bind);
+	debugfs_create_file("entries", S_IRUGO, root, ppe, &mtk_ppe_debugfs_foe_all_fops);
+	debugfs_create_file("bind", S_IRUGO, root, ppe, &mtk_ppe_debugfs_foe_bind_fops);
 
 	return 0;
 }
-- 
2.25.1


