Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF01CECAAD5
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Sep 2022 17:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z0XFKHND/hJ+Iw2Nmfh8A0TLsmnBnuzThppH0CZyUsM=; b=gQjEKLzuj2aerqy+beJRI+212U
	PEOIXLsd/1wAaSSaDVPyT3twryfIlbpaGDGdxHHk7o2qjrD5kxJsLuATSJIXhLyN8d8aBbwLPf8i1
	WSimQstpsi0g3EZsYC4U5TpwBGwRTZQy2FrhJEpIxfDVEvYUNy3u5EJaKJW58m0q0VhtKG5ED6G9s
	21A8diinO1ffJew//QN68g5GF25K506JLFQXIVrfuQoT0kiUn+HUo4SzR0fy1xJUmDByjTQuRV36Y
	mpA5Rr3bRfs9MKILhxR/wn1Svu0FW49scCg2PMzycsFUl2G6FnFtZjQ08KFEumu88nRwxhTbttFJU
	0bkLABLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVFeu-007LHZ-7d; Mon, 05 Sep 2022 17:13:16 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVDMq-004fEa-LH
	for linux-mediatek@bombadil.infradead.org; Mon, 05 Sep 2022 14:46:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Z0XFKHND/hJ+Iw2Nmfh8A0TLsmnBnuzThppH0CZyUsM=; b=HVu/HNKadmyIiq1W+xXkvFIB3P
	uKw5r3dlBPJwsZvaD25YBChDYezhMSHfpblm9fBBAl+QsqgoDDGL0duu0+qoCWk3Inp1Czn4FQNXt
	9N3/RaTCI7bHizGNgst+oPKToEXom1iFfBJ1B58uwlZgmfXzQG8rC5oB9qB9nlIxnjIWuNNXfaxr0
	sqlmK5IHwvoPfdRMvLbOz+UhNdpjfqc7BdqkXJw6sb0b9PcecYqmemrlAT1xR144ytpguHigOyM0G
	WsxGvNjKnVfd20gVJy3FtyzwyOUP1aZYmN+MUA9wY7XI6T0RlOoF59MqV0Hyw8keo7J2kWRWtsR/v
	2tBqejdQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVBUo-009cqH-0p
	for linux-mediatek@lists.infradead.org; Mon, 05 Sep 2022 12:46:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AEC2B61274;
	Mon,  5 Sep 2022 12:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93992C433C1;
	Mon,  5 Sep 2022 12:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662381991;
	bh=zTgkc3/O7ys8ZEP2DtrdlEqxPju/WVeIDg0OqeCo9Ug=;
	h=From:To:Cc:Subject:Date:From;
	b=mRRvS0mSi/j+ueQT7e26x4k0pPaZW8g1VcTCyASLrUDccMr8atlbnwt5W9mEoiUSw
	 Pio4mGAoqIz7Iyo8RNKYHaI+89X9W1Mt9SEIGH7vgMAI7bechyK+ttuMtzUOufuWiM
	 p0jb/NBsIZDNIIay0NH/PHxovnTyQVveVgo21ETdaGAJBR/AQZP+2pe+RvAeJuE+0a
	 /WQYcqI6QEdSUbqHrL+IzhlObhIYQpHgBmQUA35tiGJLYzbYxWfe71RLuL6S++rs2m
	 FgqtUzehdIU6sRChfkXjBGfHynnT1MyB9CC4I8NIKUg+qFjYhc4d3wq6GpwAW2ePc9
	 Y+/sCcObej5yQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	lorenzo.bianconi@redhat.com
Subject: [PATCH net-next] net: ethernet: mtk_eth_soc: remove mtk_foe_entry_timestamp
Date: Mon,  5 Sep 2022 14:46:01 +0200
Message-Id: <724dc466880787ae099ea037013cf5c9537128b6.1662380540.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_134634_316368_AAE3FF86 
X-CRM114-Status: UNSURE (   8.53  )
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

Get rid of mtk_foe_entry_timestamp routine since it is no longer used.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_ppe.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.h b/drivers/net/ethernet/mediatek/mtk_ppe.h
index 69ffce04d630..8f786c47b61a 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.h
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.h
@@ -305,17 +305,6 @@ mtk_ppe_check_skb(struct mtk_ppe *ppe, struct sk_buff *skb, u16 hash)
 	__mtk_ppe_check_skb(ppe, skb, hash);
 }
 
-static inline int
-mtk_foe_entry_timestamp(struct mtk_ppe *ppe, u16 hash)
-{
-	u32 ib1 = READ_ONCE(ppe->foe_table[hash].ib1);
-
-	if (FIELD_GET(MTK_FOE_IB1_STATE, ib1) != MTK_FOE_STATE_BIND)
-		return -1;
-
-	return FIELD_GET(MTK_FOE_IB1_BIND_TIMESTAMP, ib1);
-}
-
 int mtk_foe_entry_prepare(struct mtk_foe_entry *entry, int type, int l4proto,
 			  u8 pse_port, u8 *src_mac, u8 *dest_mac);
 int mtk_foe_entry_set_pse_port(struct mtk_foe_entry *entry, u8 port);
-- 
2.37.3


