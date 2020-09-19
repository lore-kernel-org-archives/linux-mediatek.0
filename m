Return-Path: <SRS0=9Csx=C4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B7CDC43464
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Sep 2020 02:48:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83B8D208DB
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Sep 2020 02:48:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pLLCc6L0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83B8D208DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IF5+oqXr4XG4mARNmBMR6TFqOkinGE+F/JL0/UlOfl0=; b=pLLCc6L0VNyOCM/1E47DwdKhti
	9kGyNZB81rIbvvUd34KQ6Q4Tt7AnS7p6NHQo4go837KTRjhYFrBRfH5LbpuYGIPunsOv7KGJDDy1j
	Vk+P0ro3g2vhzh338gBrw+yYH3LbSgIiuYKPSWwC0HPkpygOKQE/++z+Z0yDN95R04k0yf6zJE/jj
	NZEj1Bb2NRZ+8gWBPIR4ndqnEggn2ehZaBNtusgKgWrWRrwuKSWgJEsoBe2dFMHQLQHav0x3RnClS
	681XimnBKAOoEQsOkgYSLDYP6lLYa+rIjcJ/+LRbEnITyeB8Bw33tc1EWs377qkByqtq77k4cOe1D
	Q2D4xkmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJSvM-000752-FB; Sat, 19 Sep 2020 02:48:28 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJSvI-00074B-NT; Sat, 19 Sep 2020 02:48:26 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 3101F85380A276DAB0C9;
 Sat, 19 Sep 2020 10:48:16 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Sat, 19 Sep 2020 10:48:06 +0800
From: Qinglang Miao <miaoqinglang@huawei.com>
To: Jakub Kicinski <kubakici@wp.pl>, Kalle Valo <kvalo@codeaurora.org>,
 "David S. Miller" <davem@davemloft.net>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: [PATCH -next v2] mt7601u: Convert to DEFINE_SHOW_ATTRIBUTE
Date: Sat, 19 Sep 2020 10:48:38 +0800
Message-ID: <20200919024838.14172-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_224825_019307_155C6C85 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Qinglang Miao <miaoqinglang@huawei.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 .../net/wireless/mediatek/mt7601u/debugfs.c   | 34 ++++---------------
 1 file changed, 6 insertions(+), 28 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/debugfs.c b/drivers/net/wireless/mediatek/mt7601u/debugfs.c
index 300242bce..20669eacb 100644
--- a/drivers/net/wireless/mediatek/mt7601u/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt7601u/debugfs.c
@@ -30,7 +30,7 @@ mt76_reg_get(void *data, u64 *val)
 DEFINE_DEBUGFS_ATTRIBUTE(fops_regval, mt76_reg_get, mt76_reg_set, "0x%08llx\n");
 
 static int
-mt7601u_ampdu_stat_read(struct seq_file *file, void *data)
+mt7601u_ampdu_stat_show(struct seq_file *file, void *data)
 {
 	struct mt7601u_dev *dev = file->private;
 	int i, j;
@@ -73,21 +73,10 @@ mt7601u_ampdu_stat_read(struct seq_file *file, void *data)
 	return 0;
 }
 
-static int
-mt7601u_ampdu_stat_open(struct inode *inode, struct file *f)
-{
-	return single_open(f, mt7601u_ampdu_stat_read, inode->i_private);
-}
-
-static const struct file_operations fops_ampdu_stat = {
-	.open = mt7601u_ampdu_stat_open,
-	.read = seq_read,
-	.llseek = seq_lseek,
-	.release = single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(mt7601u_ampdu_stat);
 
 static int
-mt7601u_eeprom_param_read(struct seq_file *file, void *data)
+mt7601u_eeprom_param_show(struct seq_file *file, void *data)
 {
 	struct mt7601u_dev *dev = file->private;
 	struct mt7601u_rate_power *rp = &dev->ee->power_rate_table;
@@ -131,18 +120,7 @@ mt7601u_eeprom_param_read(struct seq_file *file, void *data)
 	return 0;
 }
 
-static int
-mt7601u_eeprom_param_open(struct inode *inode, struct file *f)
-{
-	return single_open(f, mt7601u_eeprom_param_read, inode->i_private);
-}
-
-static const struct file_operations fops_eeprom_param = {
-	.open = mt7601u_eeprom_param_open,
-	.read = seq_read,
-	.llseek = seq_lseek,
-	.release = single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(mt7601u_eeprom_param);
 
 void mt7601u_init_debugfs(struct mt7601u_dev *dev)
 {
@@ -157,6 +135,6 @@ void mt7601u_init_debugfs(struct mt7601u_dev *dev)
 
 	debugfs_create_u32("regidx", 0600, dir, &dev->debugfs_reg);
 	debugfs_create_file("regval", 0600, dir, dev, &fops_regval);
-	debugfs_create_file("ampdu_stat", 0400, dir, dev, &fops_ampdu_stat);
-	debugfs_create_file("eeprom_param", 0400, dir, dev, &fops_eeprom_param);
+	debugfs_create_file("ampdu_stat", 0400, dir, dev, &mt7601u_ampdu_stat_fops);
+	debugfs_create_file("eeprom_param", 0400, dir, dev, &mt7601u_eeprom_param_fops);
 }
-- 
2.23.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
