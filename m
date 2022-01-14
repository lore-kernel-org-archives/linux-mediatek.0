Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC7BC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 09:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VlBeFA38/pk6TeM5LuWxW6TJ9I6yLKehX0/zDaCuB/o=; b=ctpr8GDuwlUewH
	Oeg2/TdvtGnvOO/YxdGOhIqgb82Tw2AV93LrDTgmhJVW/ucwqWUG5NAm51ZCNZnywUmdl8gbXoZ3L
	LwlULLFK/IBmGf98+B+fNF7R3QKizS3rNRt8ezP8nxyEtefajyIztO6QJLvLHH+UfV1n2uN8LT1YH
	ZdYj4iVg6WD0u5PgO1V2QPEp1Fk8yuaxhWmjoKgHM4OPa++rQsYkFhjXj4IDgZlH764fbMRHW74NM
	16TvMNSupfCq50oQ1oBRdtK2olsEpcpmlzsrYzvlbKX45/unSk/inNezciqQjx3ucjH6feRfQLPUQ
	kIgsqFTxp42XWyq0eA1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8JDi-008bCe-He; Fri, 14 Jan 2022 09:50:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8JDf-008bB7-CC
 for linux-mediatek@lists.infradead.org; Fri, 14 Jan 2022 09:50:05 +0000
X-UUID: 0e32ef19feaa471abb6f5d9c6bb6f53c-20220114
X-UUID: 0e32ef19feaa471abb6f5d9c6bb6f53c-20220114
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1812070371; Fri, 14 Jan 2022 02:50:00 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Jan 2022 01:49:58 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 14 Jan 2022 17:49:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 14 Jan 2022 17:49:45 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Ryder Lee <ryder.lee@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>, Shayne Chen
 <shayne.chen@mediatek.com>
Subject: [PATCH] mt76: mt7915: set bssinfo/starec command when adding interface
Date: Fri, 14 Jan 2022 17:49:11 +0800
Message-ID: <20220114094911.30561-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_015003_465469_E7BBB57F 
X-CRM114-Status: UNSURE (   8.54  )
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

bssinfo/starec disabled commands are sent during removing interface.
However, if we don't set corresponding enabled commands before
removing interface, the fw may enter an exception state due to
some NULL structs.
For example, the following commands can cause fw timeout in our newer
chips:
    ifconfig wlan0/mon0 up
    ifconfig wlan0/mon0 down

Fix this by setting enabled commands once interface added.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index b45b75f..41b0a4d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -257,6 +257,9 @@ static int mt7915_add_interface(struct ieee80211_hw *hw,
 	mt7915_init_bitrate_mask(vif);
 	memset(&mvif->cap, -1, sizeof(mvif->cap));
 
+	mt7915_mcu_add_bss_info(phy, vif, true);
+	mt7915_mcu_add_sta(dev, vif, NULL, true);
+
 out:
 	mutex_unlock(&dev->mt76.mutex);
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
