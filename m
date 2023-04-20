Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2951AC77B72
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Apr 2023 13:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Xah6GWhmaOfPrzkftkdht3aevryakvVutuYc0g9Q61c=; b=GaxnE6rLhyuDXgPgMHwzaxQCOY
	3gzpUW016Yg5r4QI1fnnvd+wQSgu2Of6zS7abtdFmORk1P1ZKaWrlSl2Erds58Mlxe3eS1dwap1hD
	uDCZeRUvRzV9Mho85qSKHJsrLX9iAbnlGRpAO68XjtzJcwxzATSdVX612RHRBZiWrIOwtmb43SRGk
	M/+2rtLDQXcplkVpvJZRD8ze5Zm/ZjtvzWVt6h6NhNk26uqzXNMp3Us2uftzYw9o9ZOGnqhEYV9T4
	vccx5TZ3uTrxyQgQIAt00PLnkxSOrf3s+6vHuZzKCDNFqKxNfyJBER3QpVCOyEeyrcF0lsgraJdJH
	z5CCF+GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppU45-008ANt-1d;
	Thu, 20 Apr 2023 13:11:09 +0000
Received: from [202.114.0.240] (helo=hust.edu.cn)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppU3x-008AJl-1k;
	Thu, 20 Apr 2023 13:11:08 +0000
Received: from wjk.. ([10.12.190.56])
	(user=wangjikai@hust.edu.cn mech=LOGIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 33KD9Q5X018747-33KD9Q5Y018747
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 20 Apr 2023 21:09:32 +0800
From: Wang Jikai <wangjikai@hust.edu.cn>
To: Jakub Kicinski <kuba@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: hust-os-kernel-patches@googlegroups.com,
        Wang Jikai <wangjikai@hust.edu.cn>, Jakub Kicinski <kubakici@wp.pl>,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] wifi: mt7601u: remove debugfs directory on disconnect
Date: Thu, 20 Apr 2023 13:09:24 +0000
Message-Id: <20230420130924.8702-1-wangjikai@hust.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: wangjikai@hust.edu.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_061101_961343_439FB114 
X-CRM114-Status: GOOD (  10.49  )
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

Debugfs is created during device init but not removed.
Add a function mt7601u_remove_debugfs to remove debugfs
when the device disconnects.

Fixes: c869f77d6abb ("add mt7601u driver")
Signed-off-by: Wang Jikai <wangjikai@hust.edu.cn>
---
The issue is found by static analysis and remains untested.
---
 drivers/net/wireless/mediatek/mt7601u/debugfs.c | 5 +++++
 drivers/net/wireless/mediatek/mt7601u/mt7601u.h | 1 +
 drivers/net/wireless/mediatek/mt7601u/usb.c     | 1 +
 3 files changed, 7 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt7601u/debugfs.c b/drivers/net/wireless/mediatek/mt7601u/debugfs.c
index dbddf256921b..1b87a4854e0e 100644
--- a/drivers/net/wireless/mediatek/mt7601u/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt7601u/debugfs.c
@@ -136,3 +136,8 @@ void mt7601u_init_debugfs(struct mt7601u_dev *dev)
 	debugfs_create_file("ampdu_stat", 0400, dir, dev, &mt7601u_ampdu_stat_fops);
 	debugfs_create_file("eeprom_param", 0400, dir, dev, &mt7601u_eeprom_param_fops);
 }
+
+void mt7601u_remove_debugfs(struct mt7601u_dev *dev)
+{
+	debugfs_lookup_and_remove("mt7601u", dev->hw->wiphy->debugfsdir);
+}
diff --git a/drivers/net/wireless/mediatek/mt7601u/mt7601u.h b/drivers/net/wireless/mediatek/mt7601u/mt7601u.h
index 118d43707853..0216ace4b8e9 100644
--- a/drivers/net/wireless/mediatek/mt7601u/mt7601u.h
+++ b/drivers/net/wireless/mediatek/mt7601u/mt7601u.h
@@ -279,6 +279,7 @@ struct mt7601u_rxwi;
 extern const struct ieee80211_ops mt7601u_ops;
 
 void mt7601u_init_debugfs(struct mt7601u_dev *dev);
+void mt7601u_remove_debugfs(struct mt7601u_dev *dev);
 
 u32 mt7601u_rr(struct mt7601u_dev *dev, u32 offset);
 void mt7601u_wr(struct mt7601u_dev *dev, u32 offset, u32 val);
diff --git a/drivers/net/wireless/mediatek/mt7601u/usb.c b/drivers/net/wireless/mediatek/mt7601u/usb.c
index cc772045d526..d9a93d05f1cf 100644
--- a/drivers/net/wireless/mediatek/mt7601u/usb.c
+++ b/drivers/net/wireless/mediatek/mt7601u/usb.c
@@ -332,6 +332,7 @@ static void mt7601u_disconnect(struct usb_interface *usb_intf)
 
 	ieee80211_unregister_hw(dev->hw);
 	mt7601u_cleanup(dev);
+	mt7601u_remove_debugfs(dev);
 
 	usb_set_intfdata(usb_intf, NULL);
 	usb_put_dev(interface_to_usbdev(usb_intf));
-- 
2.34.1


