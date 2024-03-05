Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD457C54E41
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Mar 2024 17:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LCfHSJif2IzTulfiAhxVZDIoy9aDonUR7qQ6uLz691o=; b=JlYuyrin8fxRA0eN5VovFJdErl
	MErlmS3DZeFull8C1OhMAIHF55W5q1USTpRwpjYm1MVT7VFX5p6t4/8ZY0V55nT4M9LVK8ya0T3Q4
	uRvVqdbPTKexvjEzO7BS+XFGsheqAmh3kHQ5ZR50+nUiXvieNt/dNqO7LDHnUbrsGi/v+mcf3kXJ5
	dy1YvK0c0h+YYBK0I8drMszqBZQIUnPv0DfT0AXvNh6895eowVoUkkkgAjolyoaqOiOYkT2/14h9H
	+Q+L14zfBqVPh5R/2TKm+n2zqimXRH0IcPOJGMqpG7znhVcdSP1X2I+fhUV97X8PhTANZbRbReScb
	YTyDscvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhZ1O-0000000Elfn-2UQB;
	Tue, 05 Mar 2024 17:56:10 +0000
Received: from mail-4317.proton.ch ([185.70.43.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhZ1K-0000000Elep-2jyv
	for linux-mediatek@lists.infradead.org;
	Tue, 05 Mar 2024 17:56:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=monroe.io;
	s=protonmail2; t=1709661359; x=1709920559;
	bh=LCfHSJif2IzTulfiAhxVZDIoy9aDonUR7qQ6uLz691o=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=lYTe0B4HlEQUx4SQEzJDZQaKmxugpsW4T4zNt82JJM8zaQoLmxHbfVyuopBecSDzJ
	 nSvcOj7m58LPqiIvx5ByUIZRUXyiLYs0wzRevJoNdTylj9GBCTBZ6rG+C5tbwrm5WW
	 M5ZrUnAJDVNlwrwPoG00sW7w5EALbtQde9WpGOUx5tCZDVlsgMjVetyc7nbbzi2y5W
	 Qo0auFI7EVGvSuWESyom0ltI+YwK2OPWs6qoll+VJEBg73U/s1PZiGDrYfp2x8SePl
	 oWH8DTrKabi7jhspVJWDTeCuCnNA6U3A02X85jrpeIhZEN6bnN3bAz+Xq1lXasEWK0
	 fbt4gFZf9nshQ==
Date: Tue, 05 Mar 2024 17:55:35 +0000
To: Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes.berg@intel.com>
From: Chad Monroe <chad@monroe.io>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, Chad Monroe <chad@monroe.io>
Subject: [PATCH] wifi: mt76: mt7996: fix size of txpower MCU command
Message-ID: <301ef7cfecc47fa488fdf172596c9ed75719410e.1709657969.git.chad@monroe.io>
Feedback-ID: 9731019:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_095607_416201_50A1B64A 
X-CRM114-Status: UNSURE (   6.63  )
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

Fixes issues with scanning and low power output at some rates.

Fixes: f75e4779d215 ("wifi: mt76: mt7996: add txpower setting support")
Signed-off-by: Chad Monroe <chad@monroe.io>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c    | 7 +++++--
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h | 1 +
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/=
wireless/mediatek/mt76/mt7996/mcu.c
index b44abe2acc81..cfb5a7d348eb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -4464,7 +4464,7 @@ int mt7996_mcu_set_txpower_sku(struct mt7996_phy *phy=
)
 =09=09u8 band_idx;
 =09} __packed req =3D {
 =09=09.tag =3D cpu_to_le16(UNI_TXPOWER_POWER_LIMIT_TABLE_CTRL),
-=09=09.len =3D cpu_to_le16(sizeof(req) + MT7996_SKU_RATE_NUM - 4),
+=09=09.len =3D cpu_to_le16(sizeof(req) + MT7996_SKU_PATH_NUM - 4),
 =09=09.power_ctrl_id =3D UNI_TXPOWER_POWER_LIMIT_TABLE_CTRL,
 =09=09.power_limit_type =3D TX_POWER_LIMIT_TABLE_RATE,
 =09=09.band_idx =3D phy->mt76->band_idx,
@@ -4479,7 +4479,7 @@ int mt7996_mcu_set_txpower_sku(struct mt7996_phy *phy=
)
 =09mphy->txpower_cur =3D tx_power;
=20
 =09skb =3D mt76_mcu_msg_alloc(&dev->mt76, NULL,
-=09=09=09=09 sizeof(req) + MT7996_SKU_RATE_NUM);
+=09=09=09=09 sizeof(req) + MT7996_SKU_PATH_NUM);
 =09if (!skb)
 =09=09return -ENOMEM;
=20
@@ -4503,6 +4503,9 @@ int mt7996_mcu_set_txpower_sku(struct mt7996_phy *phy=
)
 =09/* eht */
 =09skb_put_data(skb, &la.eht[0], sizeof(la.eht));
=20
+=09/* padding */
+=09skb_put_zero(skb, MT7996_SKU_PATH_NUM - MT7996_SKU_RATE_NUM);
+
 =09return mt76_mcu_skb_send_msg(&dev->mt76, skb,
 =09=09=09=09     MCU_WM_UNI_CMD(TXPOWER), true);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/n=
et/wireless/mediatek/mt76/mt7996/mt7996.h
index 36d1f247d55a..ddeb40d522c5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -50,6 +50,7 @@
 #define MT7996_CFEND_RATE_11B=09=090x03=09/* 11B LP, 11M */
=20
 #define MT7996_SKU_RATE_NUM=09=09417
+#define MT7996_SKU_PATH_NUM=09=09494
=20
 #define MT7996_MAX_TWT_AGRT=09=0916
 #define MT7996_MAX_STA_TWT_AGRT=09=098
--=20
2.39.2



