Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7108AD3B7E2
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Dec 2025 17:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nAskoR/9df3vRQNCZZq1S3SyZ/pOxoExHCx2p7cwsAs=; b=WdMJXpKAIrXvain6xZ/dtPUFuv
	DJ/R+7QsYQg5lqungGNolb6TuSlOWsB1KJem474qPz6ZemUTXYLo6k0bwHBrFeHBZFqhYarfFIZcZ
	17HhvWvb7nfEhthCGaco8fs0JOGvU6IPCTs9v8qZYUflL11c293uMzaHRS4Zk0dpD5dltqJqb2nAP
	JeEYTWk6RiNX+CXM2pw6rJON388zoBLctnsphk8K3uIxDoUNlk/Dff3Btw7lh9xbjGSvfLOcIn5yE
	LNN5+9U4bmex3rEiLgos7DkKam8SqYX4pLxgy+68EUCC7agOjRaO2Q0wRl3HT+qSecmrKGP69KSC0
	pdKijx/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSfEo-0000000DORK-1Ue4;
	Mon, 08 Dec 2025 17:41:30 +0000
Received: from mail-106117.protonmail.ch ([79.135.106.117])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSfEk-0000000DOQp-0Ngi
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Dec 2025 17:41:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=monroe.io;
	s=protonmail3; t=1765215681; x=1765474881;
	bh=nAskoR/9df3vRQNCZZq1S3SyZ/pOxoExHCx2p7cwsAs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=rGjJMjJi++4oBCWomM2YHz3jUn3mhugd1p8DU4egRHn/Jt8OuyZxOEsT4dPR973It
	 niqOEUz7ytSMOMafiR5+Gbj/BsFzIFoKLPQhcnetFeBTBGa7+82GhOFf9ZI5jxFdYD
	 YJqHv7e5DrcUZ02nXlLmsmfHSbsVFtUHTJbnMiINwCLZ27akGdJZd+c1/uvyMY79GI
	 /vxE1bdbFj/CtI3AQy8+6yFYlaUo8jd0e6DnukEZZ+F5bJaMmXa7KyNp5GVbG6Rqz5
	 5XKqh3cuAW3O84P9appXejGZBP1D3RAIWwaz5kdPNFVNhHKPgEmix3uc0sddPiEO/5
	 qZyLhy6jTPmaw==
Date: Mon, 08 Dec 2025 17:41:17 +0000
To: Lorenzo Bianconi <lorenzo@kernel.org>
From: Chad Monroe <chad@monroe.io>
Cc: Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes.berg@intel.com>, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt76: fix deadlock in remain-on-channel
Message-ID: <qa3DpeAFV4STXYZKtPG6DyXOAFGaiLxTbsmc30DyPFx7fkpq_m6uhMAlyHVCCf71N4-gphwqjmw1aFR26syHQeONYSFlxUicSEctFdZdSzs=@monroe.io>
In-Reply-To: <aTbed-BC8vEmwpzD@lore-desk>
References: <3fceebb12dcb672cfae11f993a373b457a35e228.1765198130.git.chad@monroe.io> <aTbed-BC8vEmwpzD@lore-desk>
Feedback-ID: 9731019:user:proton
X-Pm-Message-ID: 830241bd499abb301524f1f45c2bdba5ff4df267
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_094127_606045_FE69EB12 
X-CRM114-Status: GOOD (  15.90  )
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






On Monday, December 8th, 2025 at 6:19 AM, Lorenzo Bianconi <lorenzo@kernel.=
org> wrote:

>=20
>=20
> > mt76_remain_on_channel() and mt76_roc_complete() call mt76_set_channel(=
)
>=20
> > while already holding dev->mutex. Since mt76_set_channel() also acquire=
s
> > dev->mutex, this results in a deadlock.
> >=20
> > Use __mt76_set_channel() instead of mt76_set_channel().
> > Add cancel_delayed_work_sync() for mac_work before acquiring the mutex
> > in mt76_remain_on_channel() to prevent a secondary deadlock with the
> > mac_work workqueue.
>=20
>=20
> I think we need a Fixes tag here.
>=20
> Regards,
> Lorenzo
>=20

Good call.. added and submitted v2. Thank you,

    -Chad

> > Signed-off-by: Chad Monroe chad@monroe.io
> > ---
> > drivers/net/wireless/mediatek/mt76/channel.c | 13 +++++++++++--
> > 1 file changed, 11 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/net/wireless/mediatek/mt76/channel.c b/drivers/net=
/wireless/mediatek/mt76/channel.c
> > index 2b705bdb7993..d9f8529db7ed 100644
> > --- a/drivers/net/wireless/mediatek/mt76/channel.c
> > +++ b/drivers/net/wireless/mediatek/mt76/channel.c
> > @@ -326,7 +326,7 @@ void mt76_roc_complete(struct mt76_phy *phy)
> > mlink->mvif->roc_phy =3D NULL;
> > if (phy->main_chandef.chan &&
> > !test_bit(MT76_MCU_RESET, &dev->phy.state))
> > - mt76_set_channel(phy, &phy->main_chandef, false);
> > + __mt76_set_channel(phy, &phy->main_chandef, false);
> > mt76_put_vif_phy_link(phy, phy->roc_vif, phy->roc_link);
> > phy->roc_vif =3D NULL;
> > phy->roc_link =3D NULL;
> > @@ -370,6 +370,8 @@ int mt76_remain_on_channel(struct ieee80211_hw *hw,=
 struct ieee80211_vif *vif,
> > if (!phy)
> > return -EINVAL;
> >=20
> > + cancel_delayed_work_sync(&phy->mac_work);
> > +
> > mutex_lock(&dev->mutex);
> >=20
> > if (phy->roc_vif || dev->scan.phy =3D=3D phy ||
> > @@ -388,7 +390,14 @@ int mt76_remain_on_channel(struct ieee80211_hw *hw=
, struct ieee80211_vif *vif,
> > phy->roc_vif =3D vif;
> > phy->roc_link =3D mlink;
> > cfg80211_chandef_create(&chandef, chan, NL80211_CHAN_HT20);
> > - mt76_set_channel(phy, &chandef, true);
> > + ret =3D __mt76_set_channel(phy, &chandef, true);
> > + if (ret) {
> > + mlink->mvif->roc_phy =3D NULL;
> > + phy->roc_vif =3D NULL;
> > + phy->roc_link =3D NULL;
> > + mt76_put_vif_phy_link(phy, vif, mlink);
> > + goto out;
> > + }
> > ieee80211_ready_on_channel(hw);
> > ieee80211_queue_delayed_work(phy->hw, &phy->roc_work,
> > msecs_to_jiffies(duration));
> > --
> > 2.47.3

