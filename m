Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 278C1C04AA5
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 00:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O+7S/66SfrFhn5CAvYVvbIshTRBkpe9zLeht1LPViP4=; b=q2feI9ecnsunCQO9BLj4bX/iC1
	2M+BvHp5NqSziOdK8JP93DVCgaorJ+bfPLY6NgLMIEQ5rJgOnrWosFFJq8jN59s6oYBRXm/5jv7Kw
	e8qdD5XGKjXo7IsYMKkG27jJVfD+3ha9M/gJMbP2DoolcYt3xdO8iw1Z5sa+8L6FcsR5rQcB4m+NM
	jo7s8Aeo0UTke8m6LV96UVj99yR4RPWNYWQnvaiVsv97x2p70uBxswomfV9vACK1KgcAfkj5iM8Bs
	Z+AsxiCxOZR+2Cvv20acIxgwqaYFruDwdU/StXK1A4VlCzcj10Hg2MOBAfaXv23WAonzDPBirxFg3
	iCwwwFhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR0Sw-003KuM-N7; Thu, 25 Aug 2022 00:11:22 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR0Ss-003Kr8-Vg
	for linux-mediatek@lists.infradead.org; Thu, 25 Aug 2022 00:11:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6E000B826CB
	for <linux-mediatek@lists.infradead.org>; Thu, 25 Aug 2022 00:11:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04FAAC43140
	for <linux-mediatek@lists.infradead.org>; Thu, 25 Aug 2022 00:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661386273;
	bh=E+YugVnu9oRWoUDDh0658NhnE7GJi21VLIvoTbAwFIA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rvaZTFaFjhsKE6fLL5wiIbCkPXjkYDxeIXhYGhIuSWWF82Pwd2pY80vUHnlb7WU7/
	 a+u0bU/89j7u8JKKT6KEfIzxmNXnbNF5ZI5/Psvjw7LOud8FmC0SdZVG2GqCnZhler
	 ErMoxBVyFdqrK5HNOaAeKAHqTaS4kg/AmNtagSbt0uwORhDmoXxBuq4Mk86s3dacxO
	 dxD8cwI5KwjIcq7ue+H4SYLgEZMeuSaxOjq7Rx6104M3QigyEnaZ/9J9wUu6rUsBrl
	 tgEDUYwB7NeYJwWHp2lU0zy7qty5faAX6fx/oket9Mqvgx1Ku/OZD+cDqEKHZs9FyX
	 qh+bcVAcNsIVw==
Received: by mail-wr1-f53.google.com with SMTP id z16so3822237wrh.10
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Aug 2022 17:11:12 -0700 (PDT)
X-Gm-Message-State: ACgBeo1IpOMq2Dr6QA9n7u/nc/d3hLOHkGsNP1Nf3tadNJI7XaysfXRY
	4dKKxZ74XZdaRKsn+eMZ1V52uGweoVm1OxvuvKU=
X-Google-Smtp-Source: AA6agR5e+M3zf283+GLi1bar1aN19ZEkr3JuZhjjx/Oavk+JnUGYkL4RjYbBuaG0lbylLN1eKKeSN569QmtdVaA7h0g=
X-Received: by 2002:adf:d4c6:0:b0:225:2eeb:fe8e with SMTP id
 w6-20020adfd4c6000000b002252eebfe8emr694101wrk.429.1661386271130; Wed, 24 Aug
 2022 17:11:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1660606893.git.objelf@gmail.com> <f48a750e8ad17d5b2410eea03fc30a6403732168.1660606893.git.objelf@gmail.com>
 <YvyUwEdURYHiAduf@lore-desk> <CAGp9LzrvVQOrUNPR8aguUTgWo1wZFMR2Y3kdTk8WqxmG=B8--w@mail.gmail.com>
 <Yv3sqvhXnGiOpKkE@lore-desk>
In-Reply-To: <Yv3sqvhXnGiOpKkE@lore-desk>
From: Sean Wang <sean.wang@kernel.org>
Date: Wed, 24 Aug 2022 17:10:59 -0700
X-Gmail-Original-Message-ID: <CAGp9LzpjeKH2AHcDGjpeKb02fiE9yHD_p-T9oeY1HS-nDKcUNQ@mail.gmail.com>
Message-ID: <CAGp9LzpjeKH2AHcDGjpeKb02fiE9yHD_p-T9oeY1HS-nDKcUNQ@mail.gmail.com>
Subject: Re: [PATCH 8/9] wifi: mt76: mt7921: introduce remain_on_channel support
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: =?UTF-8?B?U2VhbiBXYW5nICjnjovlv5fkupgp?= <sean.wang@mediatek.com>, 
	Felix Fietkau <nbd@nbd.name>, lorenzo.bianconi@redhat.com, Soul.Huang@mediatek.com, 
	YN.Chen@mediatek.com, Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com, 
	Deren Wu <Deren.Wu@mediatek.com>, km.lin@mediatek.com, jenhao.yang@mediatek.com, 
	robin.chiu@mediatek.com, Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, 
	posh.sun@mediatek.com, ted.huang@mediatek.com, Stella.Chang@mediatek.com, 
	Tom.Chou@mediatek.com, steve.lee@mediatek.com, jsiuda@google.com, 
	frankgor@google.com, kuabhs@google.com, druth@google.com, 
	abhishekpandit@google.com, shawnku@google.com, linux-wireless@vger.kernel.org, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_171119_365602_A6C23F4D 
X-CRM114-Status: GOOD (  30.74  )
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

Hi Lorenzo,

On Thu, Aug 18, 2022 at 12:39 AM Lorenzo Bianconi <lorenzo@kernel.org> wrote:
>
> > Hi Lorenzo,
> >
> > On Wed, Aug 17, 2022 at 12:18 AM Lorenzo Bianconi <lorenzo@kernel.org> wrote:
> > >
> > > > From: Sean Wang <sean.wang@mediatek.com>
> > > >
> > > > Introduce remain_on_channel support. Additionally, we add
> > > > mt7921_check_offload_capability to disable .remain_on_channel and
> > > > .cancel_remain_on_channel and related configuration because those
> > > > operations would rely on the fundamental MCU commands that will be only
> > > > supported with newer firmware.
> > > >
> > > > Co-developed-by: Deren Wu <deren.wu@mediatek.com>
> > > > Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> > > > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> > > > ---
> > > >  .../net/wireless/mediatek/mt76/mt7921/init.c  |  36 ++++++
> > > >  .../net/wireless/mediatek/mt76/mt7921/main.c  | 112 ++++++++++++++++++
> > > >  .../net/wireless/mediatek/mt76/mt7921/mcu.c   |  24 ++++
> > > >  .../wireless/mediatek/mt76/mt7921/mt7921.h    |  34 ++++++
> > > >  .../net/wireless/mediatek/mt76/mt7921/pci.c   |  13 +-
> > > >  .../net/wireless/mediatek/mt76/mt7921/sdio.c  |  11 +-
> > > >  .../net/wireless/mediatek/mt76/mt7921/usb.c   |   1 +
> > > >  7 files changed, 225 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> > > > index cd960e23770f..1b7a18d42f5b 100644
> > > > --- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> > > > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> > > > @@ -44,6 +44,35 @@ mt7921_regd_notifier(struct wiphy *wiphy,
> > > >       mt7921_mutex_release(dev);
> > > >  }
> > > >
> > > > +static int mt7921_check_offload_capability(struct mt7921_dev *dev)
> > > > +{
> > > > +     struct ieee80211_hw *hw = mt76_hw(dev);
> > > > +     int year, mon, day, hour, min, sec;
> > > > +     struct wiphy *wiphy = hw->wiphy;
> > > > +     bool fw_can_roc = false;
> > > > +     int ret;
> > > > +
> > > > +     ret = sscanf(dev->mt76.hw->wiphy->fw_version + 11, "%4d%2d%2d%2d%2d%2d",
> > > > +                  &year, &mon, &day, &hour, &min, &sec);
> > >
> > > does the fw have a differnt base version with respect to the previous ones?
> > > checking the date is a bit ugly.
> >
> > I admitted that way was a bit ugly, but I have investigated for a
> > while, and that is the only way we can use to distinguish the version
> > in current mt7921 firmware.
>
> the fw seems pretty new (2022/7/15), is it already available in linux-firmware
> git tree? If not I guess you can increment fw version in a more evident way.
> For the future please remember to do it for major fw changes.

The new FW is not released in linux-firmware. I will try to figure out
a better way to recognize the FW can support the feature and add it in
v2.

     Sean
>
> >
> > >
<snip>

