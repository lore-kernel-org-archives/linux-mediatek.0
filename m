Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429DECCF2DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2026 10:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QItUMk3/faB0K9oWLrR1Ff3bacbZI0KfxrnOXxLHV5I=; b=jfH7+UujxUNWBssEZXXQCOUtod
	kyVvvERhAVjWG4vFUgSZJS7hjS+gxSNhHrm1YHmaHfzTIjOWDgEhwheibe8z7mOak9Zx6cGo+dAQr
	S9ptckqHk834XDOFvrihGEpyPmORx+RyahAeUjzYdrbZkKIZoKP04f9LL9upMXP7N7Xzd0I0+0tyE
	Gka50CJsweaRfmt7bFmJmBgsVn/h2rl3jMnH87YzCLEAkwtjDqZhvtCtNonxL45xgriQIyPyb7anV
	sqAM9esupV4JgUtXzitiHEyJXQrljbLjsM6917KjAjEFZV3KpDW+MXVlBfmEktcgf+TbcGTin6Rfp
	BA94XB8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkP7-000000078sf-2bXq;
	Mon, 19 Oct 2026 10:15:41 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkOz-000000078lK-0XBg;
	Mon, 19 Oct 2026 10:15:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=QI
	tUMk3/faB0K9oWLrR1Ff3bacbZI0KfxrnOXxLHV5I=; b=aqvtdUPLqi+92VWng/
	GFce4w5gpDl3SLFNh2knSg9vnaordKHUTYVMkjRRXHIkEs2YJCgw/6T4ce/EEux2
	dknKqG6HH3KQNomY9jSCurmHS3ajgsSsJZPfXYDwAUk62tVid1HAnUue4Y6kE+QV
	818ofSh4lsjO7JdB8HVno2u18=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3Hxax7dVq4twABQ--.41578S3;
	Mon, 19 Oct 2026 18:15:19 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 01/10] wifi: mt76: mt7603: validate MCU response length
Date: Mon, 19 Oct 2026 18:14:56 +0800
Message-Id: <20261019101506.1926943-2-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019101506.1926943-1-yaojiale02@163.com>
References: <20261019101506.1926943-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3Hxax7dVq4twABQ--.41578S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrtw1UXFyUZr1UKryrKFWxZwb_yoWkXFX_ur
	1v9ry7trWUG3ZYkw42kr43uryak3y8Zr95Z3y3t3yFg3y7JrWDCFs3Zry7Jryq9347uFyq
	yrnxJ3W8X34avjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRil1v3UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRi582rV7biLfQAA3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_031535_021614_358E57B2 
X-CRM114-Status: UNSURE (   9.02  )
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

The MCU response parser reads the sequence number from the receive
descriptor without first ensuring that the descriptor is present. A
truncated firmware response can therefore cause an out-of-bounds read.

Reject responses shorter than the receive descriptor before accessing
the sequence number.

Fixes: f320d812b7bb ("mt76: implement .mcu_parse_response in struct mt76_mcu_ops")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/mediatek/mt76/mt7603/mcu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7603/mcu.c
index e432cce97640..b231fb2d3752 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/mcu.c
@@ -26,6 +26,8 @@ mt7603_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 		dev->mcu_hang = MT7603_WATCHDOG_TIMEOUT;
 		return -ETIMEDOUT;
 	}
+	if (skb->len < sizeof(*rxd))
+		return -EINVAL;
 
 	rxd = (struct mt7603_mcu_rxd *)skb->data;
 	if (seq != rxd->seq)
-- 
2.34.1


