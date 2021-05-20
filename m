Return-Path: <SRS0=cSMM=KP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A4E1C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 07:24:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C0E661163
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 07:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C0E661163
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JlHqiQuYxdQkcZg01eaZoQQkeKAts44ft9zJ0ZfRfho=; b=JtJHkqabwoyDHXYMQe2gIj4QZ/
	HWySVdI0CWnPKrtQHXkaqi3ghTB0bT1nhwrFtFGBhv9BN30/M49rToZmRwppXNnw+58VcscHO7R9J
	XegbHIsXVDOw/DoHRxbZLeiU2McdhUTE+M2pGidfjs458vdmvOCl1fYL+Bbv/pE1fuS2n5qtrPLfF
	v8PLs5nlbRHaIj4cYxjVV3PhmDbt5TLsbUJUcJMJzCbKefiT8Cjex+dJybEUTxahGbXnBEQJh0Ndm
	u7ecxvN0T4/HvFxIA/Qp5vByG0RKZkPebr44/JMlG9rf2Wkp9jZHTaVW5dkI+fH/4Xd6TlqtB4aG3
	owhOuzNQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljd2i-006873-4K; Thu, 20 May 2021 07:24:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljd2Z-00684u-U1
 for linux-mediatek@desiato.infradead.org; Thu, 20 May 2021 07:24:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=RDUwdJwNqEVz7tR/mGnj1nfFJSgyNeyTduJvcrDV3XI=; b=4ldXYqBP6HSJOfoMF4hiILoIAt
 VlS5EWWeaaGeIhTTSxt6z3qcKbYYoO+R0d2RWgBksqgiixlzsUvZgAbBsV2FfYtOB+PoRIcOTNkkZ
 ihqK+rgPPFN8+0USDIh1b6LvSEp3djQYsMIPDEh758bo8p467yt3p7rDhppnxFZd4ue2AEXScpsEJ
 jHYvk2WQMLWx0SmhaPKKcY8ZTQiFqMZeHXeO2nuSkkmyruhrsjpUklm+PHBEGQH3jyqlSFNNuatJT
 e6OLLb4RdIUWh+TL6lfDs7oP4xh9Kuf+LKvhyO2uWW+QIqfrsvuFyLBN1BnL7zQ4BzWp06tOl0X9p
 +7j4QrWw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljd2W-00G1mY-Qb
 for linux-mediatek@lists.infradead.org; Thu, 20 May 2021 07:24:18 +0000
X-UUID: f9e01153177844a6882946be565de232-20210520
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=RDUwdJwNqEVz7tR/mGnj1nfFJSgyNeyTduJvcrDV3XI=; 
 b=YD6rDII/TlQYytXpz6NyQ557j2KA6qv2PhT/uKqYXqPAUd8U9ECCZk3FCaKBLm5kgmp4WdiaPpDLWKYrcvB7M3nP1sT6JlqbzXfxHD1AOp2llVtpQK+tLo2lnpow4KxWj3xXjaEYQLqOrP9QpyaVLgRKocksqn9zjRmvm+5i8Iw=;
X-UUID: f9e01153177844a6882946be565de232-20210520
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 366259370; Thu, 20 May 2021 00:24:13 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 May 2021 00:22:37 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 May 2021 15:22:35 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 20 May 2021 15:22:34 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <Eric.Liang@mediatek.com>, <Stella.Chang@mediatek.com>, <jemele@google.com>,
 <yenlinlai@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>, "YN
 Chen" <yn.chen@mediatek.com>
Subject: [PATCH] mt76: mt7921: fix UC entry is being overwritten
Date: Thu, 20 May 2021 15:22:34 +0800
Message-ID: <1621495354-4130-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_002416_891743_5AA33CD7 
X-CRM114-Status: GOOD (  10.02  )
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

Fix UC entry is being overwritten by BC entry

Fixes: 36fcc8cff592 ("mt76: mt7921: introduce mt7921_mcu_sta_add routine")
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: YN Chen <yn.chen@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 73359defa176..f3decc59a6fe 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -875,10 +875,13 @@ int mt76_connac_mcu_add_sta_cmd(struct mt76_phy *phy,
 	if (IS_ERR(skb))
 		return PTR_ERR(skb);
 
-	mt76_connac_mcu_sta_basic_tlv(skb, info->vif, info->sta, info->enable);
-	if (info->enable && info->sta)
-		mt76_connac_mcu_sta_tlv(phy, skb, info->sta, info->vif,
-					info->rcpi);
+	if (info->sta) {
+		mt76_connac_mcu_sta_basic_tlv(skb, info->vif, info->sta,
+					      info->enable);
+		if (info->enable)
+			mt76_connac_mcu_sta_tlv(phy, skb, info->sta,
+						info->vif, info->rcpi);
+	}
 
 	sta_wtbl = mt76_connac_mcu_add_tlv(skb, STA_REC_WTBL,
 					   sizeof(struct tlv));
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
