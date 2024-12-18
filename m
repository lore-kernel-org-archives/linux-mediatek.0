Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F092E77183
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Dec 2024 07:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=45CEy2rxbrDuRh41EJF1xrkt88csRRe/R31pGN8EAhE=; b=rJrx/IXrJZbKI2PH0uQmqYVv4l
	JggAazlZddFlRjWQ5JAfLzbbwr5DKW2NvpKBGlHVbae9Ox2dx31XTGM8EEnIjt2ziPNsEwmQTZB6Q
	SqzGYKK/NQ18yG71S5Nx9q1kMfmhsMjwhBN/puiGK9CD9pDu2OyHBE70+VEPDhJry5btw3+wDKHXS
	LbSLI6Z3SmM2pz2kgma1kUBZkhISpSkzcynt4jUieotr3EE4gl8R0aX1QEuyZRtQXKgmhf3s94joI
	VBC7fEUHaACmICjSvh/VfJ3SAiZrz4x8FGTp1VYBpqS1am/DrJrqVzSzmR/NvvshqZWNn9oeMdXHx
	5HBsCf/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNouC-0000000Frj7-2Cd5;
	Wed, 18 Dec 2024 07:55:40 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNot4-0000000FrYx-0pA9;
	Wed, 18 Dec 2024 07:54:32 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4YCmB02cwVzqVFH;
	Wed, 18 Dec 2024 15:52:40 +0800 (CST)
Received: from kwepemh100007.china.huawei.com (unknown [7.202.181.92])
	by mail.maildlp.com (Postfix) with ESMTPS id 37C10140416;
	Wed, 18 Dec 2024 15:54:26 +0800 (CST)
Received: from huawei.com (10.67.175.69) by kwepemh100007.china.huawei.com
 (7.202.181.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 18 Dec
 2024 15:54:25 +0800
From: Zhang Kunbo <zhangkunbo@huawei.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>, <ryder.lee@mediatek.com>,
	<shayne.chen@mediatek.com>, <sean.wang@mediatek.com>, <kvalo@kernel.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<deren.wu@mediatek.com>, <mingyen.hsieh@mediatek.com>
CC: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<chris.zjh@huawei.com>, <liaochang1@huawei.com>
Subject: [PATCH -next] wifi: mt76: mt7925:: replace zero-length array with flexible-array member
Date: Wed, 18 Dec 2024 07:45:52 +0000
Message-ID: <20241218074552.3271542-1-zhangkunbo@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.175.69]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemh100007.china.huawei.com (7.202.181.92)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_235430_379648_7CF00499 
X-CRM114-Status: UNSURE (   9.86  )
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

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1],
introduced in C99:

struct foo {
	int stuff;
	struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last, which is beneficial
to cultivate a high-quality code.[2]

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Zhang Kunbo <zhangkunbo@huawei.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 748ea6adbc6b..956d62062730 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -388,7 +388,7 @@ mt7925_mcu_tx_done_event(struct mt792x_dev *dev, struct sk_buff *skb)
 	struct mt7925_mcu_txs_event {
 		u8 ver;
 		u8 rsv[3];
-		u8 data[0];
+		u8 data[];
 	} __packed * txs;
 	struct tlv *tlv;
 	u32 tlv_len;
-- 
2.34.1


