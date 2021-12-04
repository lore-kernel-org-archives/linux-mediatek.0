Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 210B0C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Dec 2021 17:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PeUf/fFwQxvB+31OmS7aip0c1+Q+bJq9S9tXqIa4ZdM=; b=SGpeEsscZKzV7+
	uus+0oECx+YUGNwgCqMjK8X1cCbTrQ6QWy9ZZwKkW3jDlTXSU7b5jsUyPa4ttSBHQsDkA1Bo4vScU
	iyb7XIvNYX7vgW4usyfXAqWy/+vq4SRte83OdGE8HH31oRBeBEZDTMtsMgJ+W0v6ZqSarMh9FCpko
	K0ZHVqa8th0jraBF118pc4wPiMAnjQ3h1MvSpMleAd+sb6o+So8IByWi6SuLRtNPylVim0iWMRDX6
	hOZdFHcf0kdjtz516bvu8TItOX/4IozWcqUMSWeFxx8WbUXQOHeBSI9TTMMDUDu6sxLscf2dmDemb
	VeqpmIADpiD6u23V9N8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtZ0j-000bSm-VT; Sat, 04 Dec 2021 17:39:45 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtZ0X-000bQY-Bp; Sat, 04 Dec 2021 17:39:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C71ECB80CC3;
 Sat,  4 Dec 2021 17:39:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11754C341C0;
 Sat,  4 Dec 2021 17:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638639569;
 bh=rXm5f+w8zJdRjZd/08cu7eGF5p64j7gfTbLFnnwiDFQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=unGVyD3y/1S13VNXCbpJl98HfgtM+zgjFdTT8xFOVa2FjzWHg98H+yymCmLLowcc5
 qXUVBBWNRpmCVhFT3SrOC/VRYVTrBfU64iUYfWZZZLBO7eMO9bwyDlLgefI7PBBKIk
 Ly84Q+05R/ICIsL94wS6PJP/HtCYpZbMEeh/C1Dj1SsgINR61RlsFw+rIwjgCkjrDK
 Q7Q1g7Y8VVHp7W9zkex8GjVMhTVzLxgldFypCEEpKZMehIR9scT90bUyprTYeB6rRT
 PJ6V24x9UZUL9wYnny90sIxMNhUew/undG8Ru4x+k9q/vGHGSrRYsyT/BCMktMfIca
 Fc1Klfhq3cPhA==
From: Arnd Bergmann <arnd@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Kalle Valo <kvalo@codeaurora.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Shayne Chen <shayne.chen@mediatek.com>,
 Soul Huang <Soul.Huang@mediatek.com>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] mt76: mt7921: fix build regression
Date: Sat,  4 Dec 2021 18:38:35 +0100
Message-Id: <20211204173848.873293-3-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211204173848.873293-1-arnd@kernel.org>
References: <20211204173848.873293-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211204_093933_734805_BC77C5DE 
X-CRM114-Status: GOOD (  14.13  )
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

From: Arnd Bergmann <arnd@arndb.de>

After mt7921s got added, there are two possible build problems:

a) mt7921s does not get built at all if mt7921e is not also enabled

b) there is a link error when mt7921e is a loadable module, but mt7921s
configured as built-in:

ERROR: modpost: "mt7921_mac_sta_add" [drivers/net/wireless/mediatek/mt76/mt7921/mt7921e.ko] undefined!
ERROR: modpost: "mt7921_mac_sta_assoc" [drivers/net/wireless/mediatek/mt76/mt7921/mt7921e.ko] undefined!
ERROR: modpost: "mt7921_mac_sta_remove" [drivers/net/wireless/mediatek/mt76/mt7921/mt7921e.ko] undefined!
ERROR: modpost: "mt7921_mac_write_txwi" [drivers/net/wireless/mediatek/mt76/mt7921/mt7921e.ko] undefined!
ERROR: modpost: "mt7921_mcu_drv_pmctrl" [drivers/net/wireless/mediatek/mt76/mt7921/mt7921e.ko] undefined!
ERROR: modpost: "mt7921_mcu_fill_message" [drivers/net/wireless/mediatek/mt76/mt7921/mt7921e.ko] undefined!
ERROR: modpost: "mt7921_mcu_parse_response" [drivers/net/wireless/mediatek/mt76/mt7921/mt7921e.ko] undefined!
ERROR: modpost: "mt7921_ops" [drivers/net/wireless/mediatek/mt76/mt7921/mt7921e.ko] undefined!
ERROR: modpost: "mt7921_queue_rx_skb" [drivers/net/wireless/mediatek/mt76/mt7921/mt7921e.ko] undefined!
ERROR: modpost: "mt7921_update_channel" [drivers/net/wireless/mediatek/mt76/mt7921/mt7921e.ko] undefined!

Fix both by making sure that Kbuild enters the subdirectory when
either one is enabled.

Fixes: 48fab5bbef40 ("mt76: mt7921: introduce mt7921s support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/wireless/mediatek/mt76/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/Makefile b/drivers/net/wireless/mediatek/mt76/Makefile
index 79ab850a45a2..c78ae4b89761 100644
--- a/drivers/net/wireless/mediatek/mt76/Makefile
+++ b/drivers/net/wireless/mediatek/mt76/Makefile
@@ -34,4 +34,4 @@ obj-$(CONFIG_MT76x2_COMMON) += mt76x2/
 obj-$(CONFIG_MT7603E) += mt7603/
 obj-$(CONFIG_MT7615_COMMON) += mt7615/
 obj-$(CONFIG_MT7915E) += mt7915/
-obj-$(CONFIG_MT7921E) += mt7921/
+obj-$(CONFIG_MT7921_COMMON) += mt7921/
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
