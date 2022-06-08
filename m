Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78159C43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jun 2022 12:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mlRhgD07G3aO34ygTVtfoVD3ECrDXE8DaFXQHiyquqY=; b=uibS7YkFuXoL7A
	9CWoMw+LOgAS3qmv10feKO7EGxuSHJ21gfNTAucbvVmEviVQwkqnWXLRu/87Z8rZ/+xQNpMynNjlY
	GcQw7uYGxD46JhrNtMNtu71PvGeIBl5IbgpVb9nS+tM+2BEAN97XI3v6gQjbAfwkbX5IofVHOZxPh
	fhRSr91PdMVDGt7EmKxn1CHqMZRBXgyKsQvDZ8Kxi5X/c3jjsU5GptV6KcVWE+/YMYZfM+Wdu2krl
	5lW314egs4JkA5BWK7aCLDVdMtJ3xahMcGRlVEQN8Ez4jnvvJrXn4ulV5rS2i0AbBaIyw3R4pWOip
	sq+gsCeZ/LeINPCLPIuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyvCG-00D79w-UP; Wed, 08 Jun 2022 12:54:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyvCD-00D78C-Bi
	for linux-mediatek@lists.infradead.org; Wed, 08 Jun 2022 12:54:04 +0000
X-UUID: 2ff1043a7f654cf89dd1de58468af452-20220608
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:5c8002d4-fb76-4469-802f-57745723e059,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:2a19b09,CLOUDID:d25f1de5-2ba2-4dc1-b6c5-11feb6c769e0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: 2ff1043a7f654cf89dd1de58468af452-20220608
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 739439145; Wed, 08 Jun 2022 05:53:50 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Jun 2022 05:53:49 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 8 Jun 2022 20:53:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 8 Jun 2022 20:53:47 +0800
From: Deren Wu <Deren.Wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
	YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>, KM Lin
	<km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
	<ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Eric Liang
	<Eric.Liang@mediatek.com>, Stella Chang <Stella.Chang@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, "Shayne
 Chen" <shayne.chen@mediatek.com>, linux-wireless
	<linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH 1/2] mt76: mt7921: not support beacon offload disable command
Date: Wed, 8 Jun 2022 20:53:25 +0800
Message-ID: <9a167f91fc8ea846583a49fa35c5ddb70e5afae4.1654691030.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1654691030.git.deren.wu@mediatek.com>
References: <cover.1654691030.git.deren.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_055401_450153_A2DB9F1F 
X-CRM114-Status: UNSURE (   9.87  )
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

From: Deren Wu <deren.wu@mediatek.com>

Beacon disable flow would be handled in bss stop handler automatically.
Force return -EOPNOTSUPP in disable case.

Fixes: 116c69603b01 ("mt76: mt7921: Add AP mode support")
Reviewed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 12bab18c4171..de096f090da3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -1255,8 +1255,11 @@ mt7921_mcu_uni_add_beacon_offload(struct mt7921_dev *dev,
 	};
 	struct sk_buff *skb;
 
+	/* support enable/update process only
+	 * disable flow would be handled in bss stop handler automatically
+	 */
 	if (!enable)
-		goto out;
+		return -EOPNOTSUPP;
 
 	skb = ieee80211_beacon_get_template(mt76_hw(dev), vif, &offs);
 	if (!skb)
@@ -1282,7 +1285,6 @@ mt7921_mcu_uni_add_beacon_offload(struct mt7921_dev *dev,
 	}
 	dev_kfree_skb(skb);
 
-out:
 	return mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD(BSS_INFO_UPDATE),
 				 &req, sizeof(req), true);
 }
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
