Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7817ACCF2DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2026 10:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qOehNbT+F+RAH22AKHx6kqc1rYrnpUKwENVvTT9d5L0=; b=bSUxOexVkbcAK142J0FSCk84GJ
	EEHeCw2aa0MrGnmZY3ni8k1DaYrTk9OcTJ2foLJY/HC91vwo/jIZxqMKzlW939JTJR9desWzXHSkB
	TH6ZWiFfg7EKcZdpV/XqhBeH2kb3kszqIw8RTTznutoNi+0oKo+KwM3NPHj9g4Djmq+EnJz7uli8V
	27gtWbU4fm2S1BkTLvJ+T2qL5KI0oefdTh/lk2l1Wnz/nY5y/RYDPsdIbYdYX2EcbtgPqlM1igpz4
	PP2ggywVcHpmlgmj7USrpvsTQSVm1cGhD2Lyoloeb2VUl8WWCdZVHOvwKfjdbcVI0VYlJfmhIKVKm
	qaUmj1pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkP7-000000078rm-1CTE;
	Mon, 19 Oct 2026 10:15:41 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkP0-000000078lb-0f1I;
	Mon, 19 Oct 2026 10:15:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=qO
	ehNbT+F+RAH22AKHx6kqc1rYrnpUKwENVvTT9d5L0=; b=AxMSFrFDYp6ctSyjNQ
	Wee2EmVhamVOtUFLi0mvSrfWUKKCxq11pDTdrUWI90l0zIFII7hNcHqX8NLyOLmJ
	Oo8qsVYtuw8Qb0CNvOq0hkNT0dp1YkPaJEBRUBxZA0DN5X8ElwC6AV3pE0ppdidO
	AMFttAqcOpnKXqoNZIG1JK3Nk=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3Hxax7dVq4twABQ--.41578S6;
	Mon, 19 Oct 2026 18:15:23 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Money Wang <Money.Wang@mediatek.com>,
	MeiChia Chiu <meichia.chiu@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 04/10] wifi: mt76: mt7915: validate MURU statistics response
Date: Mon, 19 Oct 2026 18:14:59 +0800
Message-Id: <20261019101506.1926943-5-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019101506.1926943-1-yaojiale02@163.com>
References: <20261019101506.1926943-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3Hxax7dVq4twABQ--.41578S6
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF48WrWrAw15Gw43ZF43ZFb_yoWkGFgE9r
	ZYvry3Gr10kw1qvw42kw4a9FWqka95J3WkZrWrtrWfZw47AFZrCr9avwn3JrW7uw4xZF15
	Gr9xXa4UW34agjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRiCzuDUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8Bu582rV7buzyAAA3z
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_031534_609945_BD13571C 
X-CRM114-Status: UNSURE (   8.61  )
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

mt7915_mcu_muru_debug_get() treats the firmware response as a complete
statistics structure without checking its length. A truncated response
can cause out-of-bounds reads while accumulating the counters.

Reject responses shorter than the expected statistics structure.

Fixes: 1966a5078f2d ("mt76: mt7915: add mu-mimo and ofdma debugfs knobs")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 3643906cbdf2..6d777dcfa2c1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2256,6 +2256,10 @@ int mt7915_mcu_muru_debug_get(struct mt7915_phy *phy)
 					&req, sizeof(req), true, &skb);
 	if (ret)
 		return ret;
+	if (skb->len < sizeof(*mu_stats)) {
+		dev_kfree_skb(skb);
+		return -EINVAL;
+	}
 
 	mu_stats = (struct mt7915_mcu_muru_stats *)(skb->data);
 
-- 
2.34.1


