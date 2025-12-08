Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF576D3B7E2
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Dec 2025 17:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XfhVptDWr1QW2ircHDGHYcKFnDVil044CT7xBlzhjmM=; b=tP7clUg5pshquLAuoeYEUKICtE
	MMoUjIduqNMSaL70UmCCuthZQXHKHtl8kwHJmjWsk1ylDl00lmmFBr40ZwtSRUDwxJCWJTyC/lMqW
	RfftSKaZmtQh8aJqwLkdhMQ7VsAIhc/K5jmMMyKE1sbDPqlH+MVZNe/GH6il9+Ay+6fi91PvRP2G4
	EGn68P6ROyKCsOEMNyu65RMoDjGrG264tJIi+yRI/twbCjzQ01nKmzYU6Ba7npsvcgL3XdBYcn6SP
	u3zc6gyRxwVYLdGc09rJarea0yILq4TW4FJt9zq5fSGTok5J5bT6GniypyUc4p37fhvb5S4BRJsLW
	MVyT8wFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSfA9-0000000DOE7-41Ta;
	Mon, 08 Dec 2025 17:36:42 +0000
Received: from mail-24421.protonmail.ch ([109.224.244.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSfA6-0000000DODa-42xk
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Dec 2025 17:36:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=monroe.io;
	s=protonmail3; t=1765215394; x=1765474594;
	bh=XfhVptDWr1QW2ircHDGHYcKFnDVil044CT7xBlzhjmM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=XpSaItvhr0l9nGt3AZ/CaglPurffUtb75I08wVN4vET9Jh3uX/9w+1Op0Dlzplstb
	 12OkCIuihD76+Hvw2Uazt2MrQ7u9vPNNq8gMY0PY81Qt9+FKf2K7ntUziFyHiSHuPU
	 rU0BKhTzVbM5/dfH9XE+zpOWFKKkCszjlZvB+HEXG13DndUJG2j0jYMaQYP2jNtnH2
	 pWgVGORi9H9kH9vvaUNOqKA/sSMhwC+FO0xypeCiVQO2/7TlKcwrH6Jy+HmhyfpBR4
	 egUN9rM1wx9SV8kVA83kz3MjbwrkabKOvnnsHaAVGt/e6uzKW3Q9jEJpniJu4fal+n
	 nRbgCwhflGsnQ==
Date: Mon, 08 Dec 2025 17:36:29 +0000
To: Lorenzo Bianconi <lorenzo@kernel.org>
From: Chad Monroe <chad@monroe.io>
Cc: Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes.berg@intel.com>, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mt76: mt7996: reset device after MCU message timeout
Message-ID: <STMznQ8BXsvf185OAGs7UAEpv2RIo1G6sws27GVInBYxtAT6Er7qb48T_YNBSF_L3dM_UwaCQXU_5bZy7b5AJQ8u1e1aSlzlx4LVSR9vnxc=@monroe.io>
In-Reply-To: <aTbeOResfSpMk6hZ@lore-desk>
References: <27bebda195599b55d097f4586a034dddce5d2cc0.1765202889.git.chad@monroe.io> <aTbeOResfSpMk6hZ@lore-desk>
Feedback-ID: 9731019:user:proton
X-Pm-Message-ID: a4a1882d1857bea674e625d12e73c7d8c9b21116
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_093639_612290_55EB3D9A 
X-CRM114-Status: GOOD (  12.78  )
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






On Monday, December 8th, 2025 at 6:18 AM, Lorenzo Bianconi <lorenzo@kernel.=
org> wrote:

>=20
>=20
> > Trigger a full reset after MCU message timeout.
>=20
> > Signed-off-by: Chad Monroe chad@monroe.io
> > ---
> > drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 5 +++++
> > drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 9 +++++++++
> > 2 files changed, 14 insertions(+)
> >=20
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/=
net/wireless/mediatek/mt76/mt7996/mac.c
> > index 2560e2f46e89..07b0a694c1bb 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> > @@ -2736,6 +2736,11 @@ void mt7996_reset(struct mt7996_dev *dev)
> > return;
> > }
> >=20
> > + if ((READ_ONCE(dev->recovery.state) & MT_MCU_CMD_STOP_DMA)) {
>=20
>=20
> nit: you do not need double brackets here.
>=20
> Regards,
> Lorenzo

Thanks! I submitted a v2 patch. The logic was copied from an inverse condit=
ion in mt7915 and I missed the extra brackets.

    -Chad

>=20
> > + set_bit(MT76_MCU_RESET, &dev->mphy.state);
> > + wake_up(&dev->mt76.mcu.wait);
> > + }
> > +
> > queue_work(dev->mt76.wq, &dev->reset_work);
> > wake_up(&dev->reset_wait);
> > }
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/=
net/wireless/mediatek/mt76/mt7996/mcu.c
> > index 14a88ef79b6c..40ebda9a3f12 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> > @@ -209,6 +209,7 @@ static int
> > mt7996_mcu_parse_response(struct mt76_dev *mdev, int cmd,
> > struct sk_buff *skb, int seq)
> > {
> > + struct mt7996_dev *dev =3D container_of(mdev, struct mt7996_dev, mt76=
);
> > struct mt7996_mcu_rxd *rxd;
> > struct mt7996_mcu_uni_event *event;
> > int mcu_cmd =3D FIELD_GET(__MCU_CMD_FIELD_ID, cmd);
> > @@ -217,6 +218,14 @@ mt7996_mcu_parse_response(struct mt76_dev *mdev, i=
nt cmd,
> > if (!skb) {
> > dev_err(mdev->dev, "Message %08x (seq %d) timeout\n",
> > cmd, seq);
> > +
> > + if (!test_and_set_bit(MT76_MCU_RESET, &dev->mphy.state)) {
> > + dev->recovery.restart =3D true;
> > + wake_up(&dev->mt76.mcu.wait);
> > + queue_work(dev->mt76.wq, &dev->reset_work);
> > + wake_up(&dev->reset_wait);
> > + }
> > +
> > return -ETIMEDOUT;
> > }
> >=20
> > --
> > 2.47.3

