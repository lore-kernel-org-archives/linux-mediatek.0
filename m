Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CA8C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 01:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VFe0aTgT72drZ0dN0U9JnZIxyic3/O8+WcIDYW9lN88=; b=AZm56ZsZM/fWxj
	9ifpcTilIT5g41Bx+T8KyuCa8ePfLDoTUmotvj1y6GF94FGZ55yK6oC4khomA0zwBxklry0X2Dq+G
	XbZ/M/9TcPGe8SU9zWkuKlz4t/2Plp0pD5HcCwmDYu2DSAtRoD0qxegXjRWiJnrwM5QP9xJWZw/dJ
	dvwXQATjWUKUfPiqGgebQI+DBhd3zu0fd3ywKQ0L8FePkCBzq7MlihIbkC0Ot6fhpywTb47AC0uRt
	IFdyDfSHz/PqH0b3gSZ8QpzONjT9Bojkduv+GgeIVOL/uzWTrXw41J1NuVGFkOHO5XQkdHrftQB5Z
	ttr7nmgtbWqQuU3jO1Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhi6h-00FZH9-SA; Fri, 22 Apr 2022 01:29:11 +0000
Received: from m15111.mail.126.com ([220.181.15.111])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhi6V-00FZEd-Rt; Fri, 22 Apr 2022 01:29:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=b328s
 Yp84i/CvToFx9BMqGedw/IAbOAcUjUC3unR+0k=; b=go+2Bo+2qK87t7eB6c+oo
 Atu+RHLiaYM/OoANhqq6GbeDToLyMNrYUptCdn7qpK9oLrgDIFezVn6kjgtMFVcv
 CcYuKed7tcGSJoPhT3CHMieau6v5R+W6ICcVWTUlGTtf6ThywAY9KI3FpT5B3k26
 FzpSgMdJUiKtg2teYzWIIU=
Received: from ubuntu.localdomain (unknown [58.213.83.157])
 by smtp1 (Coremail) with SMTP id C8mowABHTzfABGJiO8MNBA--.8225S4;
 Fri, 22 Apr 2022 09:28:34 +0800 (CST)
From: Bernard Zhao <zhaojunkui2008@126.com>
To: Jakub Kicinski <kubakici@wp.pl>, Kalle Valo <kvalo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: bernard@vivo.com,
	Bernard Zhao <zhaojunkui2008@126.com>
Subject: [PATCH] net/wireless: add debugfs exit function
Date: Thu, 21 Apr 2022 18:28:30 -0700
Message-Id: <20220422012830.342993-1-zhaojunkui2008@126.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CM-TRANSID: C8mowABHTzfABGJiO8MNBA--.8225S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxWryDur13Jw1kJr4rGr15Jwb_yoW5Gw1xpa
 yUKa4Ykw18Zr1DJ3y8AF4UAFyrG3Zagry7GF90v34ru348Ar1Fq3W0qFW7Aa40qFWUCa45
 tF4UtFnrGryIvFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zizBT7UUUUU=
X-Originating-IP: [58.213.83.157]
X-CM-SenderInfo: p2kd0y5xqn3xasqqmqqrswhudrp/1tbiYAPqqlpEG-QfMQAAs8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_182900_318120_AAEC1520 
X-CRM114-Status: GOOD (  10.07  )
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

This patch add exit debugfs function to mt7601u.
Debugfs need to be cleanup when module is unloaded or load fail.

Signed-off-by: Bernard Zhao <zhaojunkui2008@126.com>
---
 drivers/net/wireless/mediatek/mt7601u/debugfs.c | 9 +++++++--
 drivers/net/wireless/mediatek/mt7601u/init.c    | 1 +
 drivers/net/wireless/mediatek/mt7601u/mt7601u.h | 1 +
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/debugfs.c b/drivers/net/wireless/mediatek/mt7601u/debugfs.c
index 20669eacb66e..5ae27aae685b 100644
--- a/drivers/net/wireless/mediatek/mt7601u/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt7601u/debugfs.c
@@ -9,6 +9,8 @@
 #include "mt7601u.h"
 #include "eeprom.h"
 
+static struct dentry *dir;
+
 static int
 mt76_reg_set(void *data, u64 val)
 {
@@ -124,8 +126,6 @@ DEFINE_SHOW_ATTRIBUTE(mt7601u_eeprom_param);
 
 void mt7601u_init_debugfs(struct mt7601u_dev *dev)
 {
-	struct dentry *dir;
-
 	dir = debugfs_create_dir("mt7601u", dev->hw->wiphy->debugfsdir);
 	if (!dir)
 		return;
@@ -138,3 +138,8 @@ void mt7601u_init_debugfs(struct mt7601u_dev *dev)
 	debugfs_create_file("ampdu_stat", 0400, dir, dev, &mt7601u_ampdu_stat_fops);
 	debugfs_create_file("eeprom_param", 0400, dir, dev, &mt7601u_eeprom_param_fops);
 }
+
+void mt7601u_exit_debugfs(struct mt7601u_dev *dev)
+{
+	debugfs_remove(dir);
+}
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
index a122f1dd38f6..a77bfef0d39f 100644
--- a/drivers/net/wireless/mediatek/mt7601u/mt7601u.h
+++ b/drivers/net/wireless/mediatek/mt7601u/mt7601u.h
@@ -279,6 +279,7 @@ struct mt7601u_rxwi;
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
