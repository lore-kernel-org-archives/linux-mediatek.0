Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA49DCCF2E4
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2026 10:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D32FpQGazZvJhAchTXEiSni/VM614GAKI9AEvzA1OLo=; b=pdgZXgKqR8VzcoG3LKW2aHWG4M
	OPfcQkOblE2/uHX5Fy10eA1VisRYxVKMCDs+x/DKEZHsqMvPz4dcsJWzHWXsrKuJ1CYGJi7W1kue0
	5BwNSXkKuanACLyeHREihx6NS8SLY43PTlXkbFWoq5hERFI1ccUULIywqWe7qZLhHO+TtEpDkOpr5
	Dk0g3WpCCYDJY/w7BIeYs17Zsylf2xu94yHD0AvIIqz1KpNkR8aITKCZI9JHSk+6EJcXpuioHInip
	hstR7obiuWLMxJXdBDA/aM6p094PZU6TTD7ag4gwlCDbkxTjE9r1Ak8oLFQt9UtAo3xIF6KWpY8En
	ZBkIni0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkP8-000000078v6-2aXC;
	Mon, 19 Oct 2026 10:15:42 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkP2-000000078nG-2aAF;
	Mon, 19 Oct 2026 10:15:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=D3
	2FpQGazZvJhAchTXEiSni/VM614GAKI9AEvzA1OLo=; b=cgT1r3JzizIqNc5R2L
	uRpLW7NyXdj+O+dWxx9D34TqM/evP5SBnpvB3q523EvlOCnyaFc0tZgPhvqV8QP+
	c9MV6ygiHqvp0ly/sUwgAUQShBmVM9inVXc+QR0mk5ykiBqXYZ5WwDrkCpOAygSW
	Saup8uir7rykpKV6MZ2HfkMEU=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3Hxax7dVq4twABQ--.41578S8;
	Mon, 19 Oct 2026 18:15:26 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 06/10] wifi: mt76: mt7915: validate free-block response length
Date: Mon, 19 Oct 2026 18:15:01 +0800
Message-Id: <20261019101506.1926943-7-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019101506.1926943-1-yaojiale02@163.com>
References: <20261019101506.1926943-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3Hxax7dVq4twABQ--.41578S8
X-Coremail-Antispam: 1Uf129KBjvdXoWrKr1Uur4rWr1fXryUAF48tFb_yoWDtwb_ur
	nYvr17Gr18Gw4qkr42kr47urWak395Aas5ZrWftrWrXay7AFW7GFsxZwn8JrZxu3Z29F15
	Grn8Zay7J34a9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRiuWl7UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzR669GrV7b6MCgAA33
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_031536_994850_C0F6C3A0 
X-CRM114-Status: UNSURE (   8.47  )
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

The free-block query reads the first response byte without checking that
the firmware returned any payload. A zero-length response can therefore
cause an out-of-bounds read.

Require the block-count byte before accessing it.

Fixes: bbc1d4154ec1 ("mt76: mt7915: add default calibrated data support")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 7009a3a3edd2..05614b99165b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2985,6 +2985,10 @@ int mt7915_mcu_get_eeprom_free_block(struct mt7915_dev *dev, u8 *block_num)
 					&req, sizeof(req), true, &skb);
 	if (ret)
 		return ret;
+	if (skb->len < sizeof(*block_num)) {
+		dev_kfree_skb(skb);
+		return -EINVAL;
+	}
 
 	*block_num = *(u8 *)skb->data;
 	dev_kfree_skb(skb);
-- 
2.34.1


