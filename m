Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845C9C87FDA
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Aug 2025 13:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JgWMhkvaWwS7Ic7D5DggHNFRz1ZgfJ1G5+UNUzTR8XY=; b=yKBWN05FDmFPDcc3SPOyNFNPLs
	tTdPZjI02jtCXUslLymLYV/rn1LBoUo6/XjD00Ew+AkkTeQlHCOwgqwtkMQEZZOXew+S0FnWMgZhS
	8RdCWqIm/7xsovQAWE3GnOgHn5GLg/iwlAX0lcBogvAc7E3hW17tG8aaoC3FChf6QsPPmMEL9Y5fk
	xhRAGhUZfV9qd5F/99G+0KRNeW/QjyLIqlHl5v3JD6mSenNqe1cTWJ26sDPl7dPkqI6ToBBZXdDCe
	LieU8xGnWLxlLnn43bKko9qzL6mNzzZxYRK3Sy6GibAhnsHou5SzrXrqcHjr0KxlZCFgxvfUUkUzG
	7hYg4K/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukNAX-00000002vVA-2PFX;
	Fri, 08 Aug 2025 13:30:01 +0000
Received: from mail-10624.protonmail.ch ([79.135.106.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukNAU-00000002vUI-1PWM
	for linux-mediatek@lists.infradead.org;
	Fri, 08 Aug 2025 13:30:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=monroe.io;
	s=protonmail2; t=1754659792; x=1754918992;
	bh=JgWMhkvaWwS7Ic7D5DggHNFRz1ZgfJ1G5+UNUzTR8XY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=T1OGgHpv+b0XwOon7ODNAb0S8+p9z7r90wmwjkMyOPT0kDuAF0zTdLq+MR8DVqDsV
	 6H70kDSW772CyWVs0xYuzKkj8a1m/z2u2s98tURcysDfX8WbtKXKRa0RkO15lFXG4G
	 KB9tq4eD8v6/3NUDEpFB8ERQquxmJPioHSAMdAYRLSaMaRdg5xqyB7qVNeBb2AKm3t
	 ERwC4wCyQ8a1+KVMrf3va7y/i0y1Yax0y2N+GdZkaXg8wQouQRT9bJ9h8NHuUc52hu
	 If/cGAqBCT7AzZ9iGNFAy0fBA36XMCqk+duKwHkwtRD2q4RoxmM26b3hr18WeXrpAO
	 eEbCukqRaj6Sg==
Date: Fri, 08 Aug 2025 13:29:48 +0000
To: Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes.berg@intel.com>
From: Chad Monroe <chad@monroe.io>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, Chad Monroe <chad@monroe.io>
Subject: [PATCH] wifi: mt76: mt7996: use the correct vif link for scanning/roc
Message-ID: <180fffd409aa57f535a3d2c1951e41ae398ce09e.1754659732.git.chad@monroe.io>
Feedback-ID: 9731019:user:proton
X-Pm-Message-ID: cfdb5118aa7660394b7ca1f4b8bfb9e76b2779f1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_062959_000335_C8264FD8 
X-CRM114-Status: UNSURE (   4.76  )
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

restore fix which was dropped during MLO rework

Fixes: f0b0b239b8f3 ("wifi: mt76: mt7996: rework mt7996_mac_write_txwi() fo=
r MLO support")
Signed-off-by: Chad Monroe <chad@monroe.io>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/=
wireless/mediatek/mt76/mt7996/mac.c
index 226534490792..6333a064c4f7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -903,8 +903,12 @@ void mt7996_mac_write_txwi(struct mt7996_dev *dev, __l=
e32 *txwi,
 =09=09=09=09       IEEE80211_TX_CTRL_MLO_LINK);
=20
 =09mvif =3D vif ? (struct mt7996_vif *)vif->drv_priv : NULL;
-=09if (mvif)
-=09=09mlink =3D rcu_dereference(mvif->mt76.link[link_id]);
+=09if (mvif) {
+=09=09if (wcid->offchannel)
+=09=09=09mlink =3D rcu_dereference(mvif->mt76.offchannel_link);
+=09=09if (!mlink)
+=09=09=09mlink =3D rcu_dereference(mvif->mt76.link[link_id]);
+=09}
=20
 =09if (mlink) {
 =09=09omac_idx =3D mlink->omac_idx;
--=20
2.47.2



