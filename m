Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9D5C54EED
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 12:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8N51dvvgNdPlIO/ogIwHg/iY57RhT5Q6RXf/Lx7Z6sQ=; b=mOk1Mzvckpv8RMkRxEiv8BBH57
	t8Xjd70t9fZs1d7xFWb3HpZYo3uowIVYVTQOKSshQ65DtwH1hM0oUtjhNN/SGOMSBQo9mDaVMImoY
	hubl+yOaeLpCE3ttoQ8lkmsifHWwfZZvEqGy0D7Ti6Rplms64a79/Ds9qICgO/4BEKZSDz3MB26QV
	ifKy8M/SwDDL7qgfrJgn1eHzI21Pmh49i3x8WDaF4XCisDP+u7RtHQwjqwSzFblBHnVrnzwn6ZABj
	kkECRrz/SHoV4a4Jgtmv692wgclZUBJwFI+1m5U111ELxoP4TckRNqtJbINMBqcXqLddqyVvCWhRI
	/Y/IJ8HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMTQW-003WXS-60; Mon, 30 Jan 2023 12:38:24 +0000
Received: from e10edge.fintech.ru ([195.54.195.159] helo=exchange.fintech.ru)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMTPN-003WPY-EQ
	for linux-mediatek@lists.infradead.org; Mon, 30 Jan 2023 12:37:14 +0000
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 30 Jan
 2023 15:37:05 +0300
Received: from localhost (10.0.253.157) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 30 Jan
 2023 15:37:05 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: <stable@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Nikita Zhandarovich <n.zhandarovich@fintech.ru>, Felix Fietkau
	<nbd@nbd.name>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Ryder Lee
	<ryder.lee@mediatek.com>, Kalle Valo <kvalo@codeaurora.org>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
	<linux-wireless@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Alexey Khoroshilov" <khoroshilov@ispras.ru>, <lvc-project@linuxtesting.org>
Subject: [PATCH 5.10 1/1] mt76: fix mt7615_init_tx_queues() return value
Date: Mon, 30 Jan 2023 04:36:55 -0800
Message-ID: <20230130123655.86339-2-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230130123655.86339-1-n.zhandarovich@fintech.ru>
References: <20230130123655.86339-1-n.zhandarovich@fintech.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.253.157]
X-ClientProxiedBy: Ex16-01.fintech.ru (10.0.10.18) To Ex16-01.fintech.ru
 (10.0.10.18)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_043713_503541_2260F980 
X-CRM114-Status: UNSURE (   9.85  )
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

mt7615_init_tx_queues() returns 0 regardless of how final
mt7615_init_tx_queue() performs. If mt7615_init_tx_queue() fails (due to
memory issues, for instance), parent function will still erroneously
return 0.

This change takes into account ret value of mt7615_init_tx_queue()
when finishing up mt7615_init_tx_queues().

Fixes: 04b8e65922f6 ("mt76: add mac80211 driver for MT7615 PCIe-based chipsets")
Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>

 drivers/net/wireless/mediatek/mt76/mt7615/dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/dma.c b/drivers/net/wireless/mediatek/mt76/mt7615/dma.c
index bf8ae14121db..47922c1dd6e3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/dma.c
@@ -82,7 +82,7 @@ mt7615_init_tx_queues(struct mt7615_dev *dev)
 
 	ret = mt7615_init_tx_queue(dev, MT_TXQ_MCU, MT7615_TXQ_MCU,
 				   MT7615_TX_MCU_RING_SIZE);
-	return 0;
+	return ret;
 }
 
 static int mt7615_poll_tx(struct napi_struct *napi, int budget)

