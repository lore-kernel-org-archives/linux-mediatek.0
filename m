Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1632C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 13:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jWG2vrFqS4j9v5HwivTqR7mQLVv98XABjhKgtu0TrR4=; b=fq4DqqvelucAAR
	Hec3evwGkxI3SdfjOl8va0Oj41Bv5/ut1tjqyrIZzr582+UAPDhheudRkDJDD3m9OOQ5gTDvlQquX
	kFk2K0fmeez7eHsRXOI0KnND0KRElDi1YXftsmn10CNjFbg4Opp5H02buRdgXYJJHr7qfUOoKeEt3
	8q62DiIVc4u9cm0FXtFBEkC51kw24w76AL+Kl8ZeVc+OioHBRw6Lr4M14/Rs4tu0f3NRxhloahw4J
	3u0zuwDNU9RWwtFpbSnboRtF++rtcN4q06bHirRcN6rc0rh5X1wuN6Mh4B8hbD3rXnxaj1gQUV1Qg
	Ys0o6tHQJ5mqUKVkD2IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvflO-006tH4-Kg; Mon, 30 May 2022 13:48:54 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvfZ1-006ln8-Rt; Mon, 30 May 2022 13:36:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 68B2FB80DAB;
	Mon, 30 May 2022 13:36:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 245EEC385B8;
	Mon, 30 May 2022 13:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653917765;
	bh=r/dBWgTFOJ7LNQfKaxvKd/CJUkl0jSQjIUTPtjmE1js=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kYM+drjM80ucn6citCXb+5xNTaUoC6h8917GwH5NPnhAxHpe+NWiCq49ETCoMKjxh
	 fqUsbwCa4OfwPNoX8Xi9yc3Zb6HrkzJmqb7KP+VnBDS4+zQyiR2Ok+j+aMrzf12wUQ
	 mgmF+RLqwdrbIrtTjIw49Eg4ZAQj43Wwp+moiMl0h7B19svaOlGXyA9CP6jhlLhqpp
	 cpab+4TTw28xic+1ffXgLwUs8Bjw1E3MyG75kr2oe+7/a1NduIZT3dqrNyl2+9vQP8
	 NbXBL/eEOd5Nj59Yx9UyEVGS9RMK9FHWLcm3yqpV3izkDLxaxKndrWKrjcmlq14fyE
	 9h2b70+uQW97Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Sasha Levin <sashal@kernel.org>,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	xing.song@mediatek.com,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.17 091/135] mt76: mt7921: accept rx frames with non-standard VHT MCS10-11
Date: Mon, 30 May 2022 09:30:49 -0400
Message-Id: <20220530133133.1931716-91-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530133133.1931716-1-sashal@kernel.org>
References: <20220530133133.1931716-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_063608_189797_F6ABCFC9 
X-CRM114-Status: GOOD (  13.04  )
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

From: Felix Fietkau <nbd@nbd.name>

[ Upstream commit 3128ea016965ce9f91ddf4e1dd944724462d1698 ]

The hardware receives them properly, they should not be dropped

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 84f72dd1bf93..e07707f518a2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -698,7 +698,7 @@ mt7921_mac_fill_rx(struct mt7921_dev *dev, struct sk_buff *skb)
 			status->nss =
 				FIELD_GET(MT_PRXV_NSTS, v0) + 1;
 			status->encoding = RX_ENC_VHT;
-			if (i > 9)
+			if (i > 11)
 				return -EINVAL;
 			break;
 		case MT_PHY_TYPE_HE_MU:
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
