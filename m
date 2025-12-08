Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124EED3B7E1
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Dec 2025 12:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4ielOwlDxL2L7lk5YGwC5L8CwD0WFlxwAppk74gylQg=; b=lJnhlZTdgZ4Kva9/Sum0UpwZQf
	aO9/GkVSH0eWcl5k/rHp6R2R98FmKh3zOzc3R0726CdNJR3Vm3j1eWGM9ZFmwMVekndnrIkIpnNEc
	DAriecUQeII5tKdhznXvOraQttuUmsBDeL1gFEytKUIsOSKMPR+3R5Vc0R8a4T6ZS0N4HXY1jmwMK
	pHVgjQqJ0LTJXVaFTDuihXolNKPuwHEnInLucqeigkqlUxYNxV6x0WPI3xvbZmZz4Ao5q5qlhi7ig
	iB8EZzlosgQ14GzEKvevPo2x5p3Z5aLmf1zUms0h9+VONKje2MQ84zdU7N02xVZ/01LOdyzlMvfJ4
	etgSOliA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSagS-0000000D5lR-3fZ1;
	Mon, 08 Dec 2025 12:49:44 +0000
Received: from mail-4396.protonmail.ch ([185.70.43.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSagQ-0000000D5ky-16m6
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Dec 2025 12:49:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=monroe.io;
	s=protonmail3; t=1765198176; x=1765457376;
	bh=4ielOwlDxL2L7lk5YGwC5L8CwD0WFlxwAppk74gylQg=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=kmLnE9ovbCz9QK+7W+dfRDIQ3a/62XjWCDtE3Kpuq8mDb2ZXtV/TM5XgCpZLXA7Vg
	 t9jlQbd+javYqth9POroIVQwFXWMFNdDtcw3awtfB5/S+hhwnLKIhoAZ6zbhhFtgQD
	 FmBGGV3Hz55nJLP24hLMzgMp+bOmHX7YaCZpt3chyuYyNNSLHK+hzvhNISLig4uMw0
	 3T6TTejugUEoHbWAtKdIMp8S79TVl1hyfWO5bpg+oE+4u9odYkwOC9Mb26YE/JXBW9
	 7ksuhU0NiYpzfxR5wsJDL9WdarDboHtL+rouHXZO8ZmMsk/fDVLdi/E+Qlm8+Zm8pi
	 YA3rQxfrCSvHA==
Date: Mon, 08 Dec 2025 12:49:33 +0000
To: Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes.berg@intel.com>
From: Chad Monroe <chad@monroe.io>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, Chad Monroe <chad@monroe.io>
Subject: [PATCH] wifi: mt76: fix deadlock in remain-on-channel
Message-ID: <3fceebb12dcb672cfae11f993a373b457a35e228.1765198130.git.chad@monroe.io>
Feedback-ID: 9731019:user:proton
X-Pm-Message-ID: 4ef7cc0db196e4f44ce46c8c17aac75224e9cf07
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_044943_125157_CF90ED6D 
X-CRM114-Status: UNSURE (   5.86  )
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

mt76_remain_on_channel() and mt76_roc_complete() call mt76_set_channel()
while already holding dev->mutex. Since mt76_set_channel() also acquires
dev->mutex, this results in a deadlock.

Use __mt76_set_channel() instead of mt76_set_channel().
Add cancel_delayed_work_sync() for mac_work before acquiring the mutex
in mt76_remain_on_channel() to prevent a secondary deadlock with the
mac_work workqueue.

Signed-off-by: Chad Monroe <chad@monroe.io>
---
 drivers/net/wireless/mediatek/mt76/channel.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/channel.c b/drivers/net/wir=
eless/mediatek/mt76/channel.c
index 2b705bdb7993..d9f8529db7ed 100644
--- a/drivers/net/wireless/mediatek/mt76/channel.c
+++ b/drivers/net/wireless/mediatek/mt76/channel.c
@@ -326,7 +326,7 @@ void mt76_roc_complete(struct mt76_phy *phy)
 =09=09mlink->mvif->roc_phy =3D NULL;
 =09if (phy->main_chandef.chan &&
 =09    !test_bit(MT76_MCU_RESET, &dev->phy.state))
-=09=09mt76_set_channel(phy, &phy->main_chandef, false);
+=09=09__mt76_set_channel(phy, &phy->main_chandef, false);
 =09mt76_put_vif_phy_link(phy, phy->roc_vif, phy->roc_link);
 =09phy->roc_vif =3D NULL;
 =09phy->roc_link =3D NULL;
@@ -370,6 +370,8 @@ int mt76_remain_on_channel(struct ieee80211_hw *hw, str=
uct ieee80211_vif *vif,
 =09if (!phy)
 =09=09return -EINVAL;
=20
+=09cancel_delayed_work_sync(&phy->mac_work);
+
 =09mutex_lock(&dev->mutex);
=20
 =09if (phy->roc_vif || dev->scan.phy =3D=3D phy ||
@@ -388,7 +390,14 @@ int mt76_remain_on_channel(struct ieee80211_hw *hw, st=
ruct ieee80211_vif *vif,
 =09phy->roc_vif =3D vif;
 =09phy->roc_link =3D mlink;
 =09cfg80211_chandef_create(&chandef, chan, NL80211_CHAN_HT20);
-=09mt76_set_channel(phy, &chandef, true);
+=09ret =3D __mt76_set_channel(phy, &chandef, true);
+=09if (ret) {
+=09=09mlink->mvif->roc_phy =3D NULL;
+=09=09phy->roc_vif =3D NULL;
+=09=09phy->roc_link =3D NULL;
+=09=09mt76_put_vif_phy_link(phy, vif, mlink);
+=09=09goto out;
+=09}
 =09ieee80211_ready_on_channel(hw);
 =09ieee80211_queue_delayed_work(phy->hw, &phy->roc_work,
 =09=09=09=09     msecs_to_jiffies(duration));
--=20
2.47.3



