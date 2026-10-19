Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB523CCF2E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2026 10:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6PghorHOmeojsuMzVoaD7X2T5RS+ugW/hws9X0wYBOs=; b=VeZZiHIZQS80V5e4MO+HJfXY4U
	zb3N/v8FSTy/pORK2jcPToCSeSOTzkIuaCZ9gOFh2gYFSler03IayCrMLk0jALIW9MEPeHQppTbe/
	qH7G0MKETb5eypX3LhgJIuiBCK23skBc7r2GncNHq7OcvnO7ILQDIwmRKeSBLxZ/WImiOalMtJxdG
	Fn+5jW5B4ENamiAKEQg8TbyYt1rHZNQYbBwljZbl5wyNVfT4dDKsl4tuaOXMEaqREDHCxTIycxdG0
	xRIvlGnw7iCwr0y9xrTJkkn2ZjywDvXlbklivzgFTIbGG9Jw7ryGKA82ZpPFMfJ2WdFEL1WuQgeVr
	JDivTT9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkP8-000000078ty-0oOU;
	Mon, 19 Oct 2026 10:15:42 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkP1-000000078mB-0ONm;
	Mon, 19 Oct 2026 10:15:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=6P
	ghorHOmeojsuMzVoaD7X2T5RS+ugW/hws9X0wYBOs=; b=DtsOfq1pK5F2hh82nl
	qZuFoJhfO4Jn+Drwiie3LsEgZEVVQ1UEBGerhdOs0NNp/5B2xqI/Hr3l4jtuPcj8
	vVBnW52TysLionW1B70fogy4Gg10iZMbqv5jyDJZinoSiCezDtY7rE5ZG7n2lz6A
	ICh3eVqhn5DVn4q93MswhuolM=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3Hxax7dVq4twABQ--.41578S7;
	Mon, 19 Oct 2026 18:15:24 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chih-Min Chen <chih-min.chen@mediatek.com>,
	YF Luo <yf.luo@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 05/10] wifi: mt76: mt7915: validate EEPROM response length
Date: Mon, 19 Oct 2026 18:15:00 +0800
Message-Id: <20261019101506.1926943-6-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019101506.1926943-1-yaojiale02@163.com>
References: <20261019101506.1926943-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3Hxax7dVq4twABQ--.41578S7
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr48CrWxKrWxKFyrAF1xuFg_yoWkXrb_u3
	4v9rnrGr1UG3Wqkw42kr429FZ0y395Aa4kCrWrtrWFq3y7ArW7urZ3Aw4fGrZruws2vFW5
	Grn8Ja4UX34a9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRiuWl7UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8B269GrV7b2z5gAA3Z
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_031535_473725_B52773FE 
X-CRM114-Status: UNSURE (   9.14  )
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

The EEPROM query copies a complete firmware response block without
checking that the response contains the address and data fields. A
truncated response can cause an out-of-bounds read.

Require the complete EEPROM response structure before processing it.

Fixes: e57b7901469f ("mt76: add mac80211 driver for MT7915 PCIe-based chipsets")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 6d777dcfa2c1..7009a3a3edd2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2945,6 +2945,10 @@ int mt7915_mcu_get_eeprom(struct mt7915_dev *dev, u32 offset, u8 *read_buf)
 					&req, sizeof(req), true, &skb);
 	if (ret)
 		return ret;
+	if (skb->len < sizeof(*res)) {
+		dev_kfree_skb(skb);
+		return -EINVAL;
+	}
 
 	res = (struct mt7915_mcu_eeprom_info *)skb->data;
 	if (!buf) {
-- 
2.34.1


