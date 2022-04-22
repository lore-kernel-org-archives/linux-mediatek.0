Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E44E8C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 08:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rXQncRIfu9jfC8foLflP3bWgPQ+JGKQAtjqXBoUSAS4=; b=EaoDivUNYujvwd
	wWXlSVVFuXtIjkWJr8LZMGI6gVeXbGpHIdg+Dhi167+6IIdtwoRKUUXTSxyMo8OssCngcYt1gKHiu
	3K+/2nHEI5kJwL1OsXMyfcyc4IGSyPTz/PgLUQkQt86fRRDpIkdEypqhnJGkM4SEyFHRThjGtOpSh
	vlIUHZEF4zqfBJH6ol2Oww2dv8Yq+42Ixfov9GTyQVpFeoK13L47rkciFLLTaiJfJCzTQjHvAEjJl
	JvNtj/3p7SfJ45zCBivLtufjE+8ygPT5erCsrs1HV4ww8JUH+00PnkkiZjHuxzns/Gs8Xq/TDGcv4
	lE/+jAz1RFUhNSsT+6iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhoQt-00HAUX-LD; Fri, 22 Apr 2022 08:14:27 +0000
Received: from m15111.mail.126.com ([220.181.15.111])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhoLq-00H85A-SN; Fri, 22 Apr 2022 08:09:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=P9Al3
 tNq9A6MMeOWm1tBjYMEjQXzg/zzljHAbch3uHE=; b=exjIFcmCrLsMuwFfGTt9Q
 kqgmOWPJhpQ78BytXMC3CG9OY89HALmf9gZArLHuwa6aEjxAbJQVjrucwkGtNXoV
 Ohlrp7saaaGgkiiTqXl120CiG0WfCdbAlor/3DjMA0a8vdHU8+4uCSMer2FjrAnB
 Xrx4LbHTV+1QoAW4mWB1zI=
Received: from ubuntu.localdomain (unknown [58.213.83.157])
 by smtp1 (Coremail) with SMTP id C8mowAA3n9+aYmJic1AdBA--.42425S4;
 Fri, 22 Apr 2022 16:08:59 +0800 (CST)
From: Bernard Zhao <zhaojunkui2008@126.com>
To: Jakub Kicinski <kubakici@wp.pl>, Kalle Valo <kvalo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: bernard@vivo.com,
	Bernard Zhao <zhaojunkui2008@126.com>
Subject: [PATCH v2] mediatek/mt7601u: add debugfs exit function
Date: Fri, 22 Apr 2022 01:08:54 -0700
Message-Id: <20220422080854.490379-1-zhaojunkui2008@126.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CM-TRANSID: C8mowAA3n9+aYmJic1AdBA--.42425S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxCr1xWF18Ar45GFy8KFWruFg_yoWrXrWUpa
 yDKa4Ykw18Zr15G3yfCF1UZryrGas3Wr17JF95Z345Z3y8Ar1Fq3WjqFy7ZasxXFZ8A3Wj
 qF45tF47GryI9FJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zikR67UUUUU=
X-Originating-IP: [58.213.83.157]
X-CM-SenderInfo: p2kd0y5xqn3xasqqmqqrswhudrp/1tbiuQPqqlpD8lH33AACsp
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_010915_732970_67CCC432 
X-CRM114-Status: GOOD (  11.11  )
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

When mt7601u loaded, there are two cases:
First when mt7601u is loaded, in function mt7601u_probe, if
function mt7601u_probe run into error lable err_hw,
mt7601u_cleanup didn`t cleanup the debugfs node.
Second when the module disconnect, in function mt7601u_disconnect,
mt7601u_cleanup didn`t cleanup the debugfs node.
This patch add debugfs exit function and try to cleanup debugfs
node when mt7601u loaded fail or unloaded.

Signed-off-by: Bernard Zhao <zhaojunkui2008@126.com>

Changes since V1:
*Remove CONFIG_DEBUG_FS check.
---
 .../net/wireless/mediatek/mt7601u/debugfs.c   | 23 +++++++++++--------
 drivers/net/wireless/mediatek/mt7601u/init.c  |  1 +
 .../net/wireless/mediatek/mt7601u/mt7601u.h   |  3 +++
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/debugfs.c b/drivers/net/wireless/mediatek/mt7601u/debugfs.c
index 20669eacb66e..efc575a1147c 100644
--- a/drivers/net/wireless/mediatek/mt7601u/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt7601u/debugfs.c
@@ -124,17 +124,20 @@ DEFINE_SHOW_ATTRIBUTE(mt7601u_eeprom_param);
 
 void mt7601u_init_debugfs(struct mt7601u_dev *dev)
 {
-	struct dentry *dir;
-
-	dir = debugfs_create_dir("mt7601u", dev->hw->wiphy->debugfsdir);
-	if (!dir)
+	dev->root_dir = debugfs_create_dir("mt7601u", dev->hw->wiphy->debugfsdir);
+	if (!dev->root_dir)
 		return;
 
-	debugfs_create_u8("temperature", 0400, dir, &dev->raw_temp);
-	debugfs_create_u32("temp_mode", 0400, dir, &dev->temp_mode);
+	debugfs_create_u8("temperature", 0400, dev->root_dir, &dev->raw_temp);
+	debugfs_create_u32("temp_mode", 0400, dev->root_dir, &dev->temp_mode);
+
+	debugfs_create_u32("regidx", 0600, dev->root_dir, &dev->debugfs_reg);
+	debugfs_create_file("regval", 0600, dev->root_dir, dev, &fops_regval);
+	debugfs_create_file("ampdu_stat", 0400, dev->root_dir, dev, &mt7601u_ampdu_stat_fops);
+	debugfs_create_file("eeprom_param", 0400, dev->root_dir, dev, &mt7601u_eeprom_param_fops);
+}
 
-	debugfs_create_u32("regidx", 0600, dir, &dev->debugfs_reg);
-	debugfs_create_file("regval", 0600, dir, dev, &fops_regval);
-	debugfs_create_file("ampdu_stat", 0400, dir, dev, &mt7601u_ampdu_stat_fops);
-	debugfs_create_file("eeprom_param", 0400, dir, dev, &mt7601u_eeprom_param_fops);
+void mt7601u_exit_debugfs(struct mt7601u_dev *dev)
+{
+	debugfs_remove(dev->root_dir);
 }
diff --git a/drivers/net/wireless/mediatek/mt7601u/init.c b/drivers/net/wireless/mediatek/mt7601u/init.c
index 5d9e952b2966..eacdd5785fa6 100644
--- a/drivers/net/wireless/mediatek/mt7601u/init.c
+++ b/drivers/net/wireless/mediatek/mt7601u/init.c
@@ -427,6 +427,7 @@ void mt7601u_cleanup(struct mt7601u_dev *dev)
 	mt7601u_stop_hardware(dev);
 	mt7601u_dma_cleanup(dev);
 	mt7601u_mcu_cmd_deinit(dev);
+	mt7601u_exit_debugfs(dev);
 }
 
 struct mt7601u_dev *mt7601u_alloc_device(struct device *pdev)
diff --git a/drivers/net/wireless/mediatek/mt7601u/mt7601u.h b/drivers/net/wireless/mediatek/mt7601u/mt7601u.h
index a122f1dd38f6..06c190a3f54c 100644
--- a/drivers/net/wireless/mediatek/mt7601u/mt7601u.h
+++ b/drivers/net/wireless/mediatek/mt7601u/mt7601u.h
@@ -242,6 +242,8 @@ struct mt7601u_dev {
 	u32 rf_pa_mode[2];
 
 	struct mac_stats stats;
+
+	struct dentry *root_dir;
 };
 
 struct mt7601u_tssi_params {
@@ -279,6 +281,7 @@ struct mt7601u_rxwi;
 extern const struct ieee80211_ops mt7601u_ops;
 
 void mt7601u_init_debugfs(struct mt7601u_dev *dev);
+void mt7601u_exit_debugfs(struct mt7601u_dev *dev);
 
 u32 mt7601u_rr(struct mt7601u_dev *dev, u32 offset);
 void mt7601u_wr(struct mt7601u_dev *dev, u32 offset, u32 val);
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
