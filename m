Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB52ECAAA3
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Aug 2022 05:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wh6FLDEnJQ0ruFSeCB7dZ0n+l2/E1h9WWj0E7OrvHN8=; b=VkhD+TS3QLL5AwcYZ2TZHQ/sze
	0kdm+OtZb85RxnoSRf49jZsiu0USaRvoMdin1TtPeUR3pgu2z6C3MuSOAVpFH5fW+lBYWTQnzhmNz
	KWAxprl/kN9fpB1fvYYB1doTsnhKGxI2ol2zygEpREAcajMScZyvtmw9NBC+yCUc6w2q+ZapAXhC6
	MhgJohpAsb46U4tPA/SoDHF7adq7yyHaFLPvtbAFSZGqFif4egMPDw0nrb7LNDTDfHjHKdAQ/hzKL
	PvJkvMqTYqZC5b6JUAXWfiqWuftlKc+Bm0UHwKD1tq6kzaMyiI6iRmlEE6WE+So+a7FHouKi+lsJK
	XcPltdtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRRf3-00Dj7A-VE; Fri, 26 Aug 2022 05:13:42 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRRex-00Diyj-KO
	for linux-mediatek@lists.infradead.org; Fri, 26 Aug 2022 05:13:39 +0000
Received: by mail-wm1-x332.google.com with SMTP id i66-20020a1c3b45000000b003a7b6ae4eb2so32741wma.4
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Aug 2022 22:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Wh6FLDEnJQ0ruFSeCB7dZ0n+l2/E1h9WWj0E7OrvHN8=;
        b=gzvm+bQtE8AmMsvbkn6i37XPPtXDA1iCHae/C2j4+xAsmHS2vcozSBzu4Y0tzPlkLB
         frJAVOMQruttFHaVSU4UIT1aWUo7AfH2Ff9H0fE8ZxJIjYfx2ZQukGpsi0/EwQCS143C
         kD6saRNrvRRAy7i+99+TpMQ011lbZ9hrepoaC4v+FYOXDntQHyC0UPd1kY8r/jplXWU1
         QygyRHER5lqg45w8vGM6BUuJ+X9XRh3j1I/WrwWRystcpA+idTltyybUOuOCRsJ4QNsp
         MV5vxp9/x2Lz+8nyK5a9do0S5iruX2dTEhILARFfIaeWgEwVEt7pjePTAQ9dqY5k5rqA
         Ikrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Wh6FLDEnJQ0ruFSeCB7dZ0n+l2/E1h9WWj0E7OrvHN8=;
        b=6V3jjL6P5NOyMJcD/wJS2W8w3d46vNGL9l8vXn7XkKGEGE9oORNh0K9z6a/AxpWl5j
         DR4NBp5GtgH3sFUOG4etEoslfHcsRLThEqvSQ4TJy8my2Wer0HFlcgFEm9EGPGQEWXFI
         7tID85wWeucCRUeKwk+s3d5+f90DpL0CpB5rmalZlshk/bc1tjlZgcm0BfYk25UoTxSj
         HnwVwusPVY9OEuLSJd4tsz4KpIm0w5e42SBBqHlCRdCUHzsK2/JWZlSOKk2mucw701wS
         zL1S3RUSa/shRKMpmshPBvC9shhnMBOF3SpolyWIeLpZPa1XYGqx/leTRuEXEFMckwEg
         9JiQ==
X-Gm-Message-State: ACgBeo1m+JIYU4W1kIrQIqQGe5vVfTEP1QKGXiQjkGFLDwu6i3l5gC/k
	mktx+NqoOmnI9yH89Jc2Lcwzax8iqCK8ZcOZ6K4=
X-Google-Smtp-Source: AA6agR7QFJk2fyWRvEx03DjqaHYun1rzfQlrmhMAnyRnD79orGEX+fPxtFvy6QAk3o0D/25is63NMgz/ewnaoA7X3Cc=
X-Received: by 2002:a05:600c:5008:b0:3a6:1cd8:570d with SMTP id
 n8-20020a05600c500800b003a61cd8570dmr4030338wmr.57.1661490812559; Thu, 25 Aug
 2022 22:13:32 -0700 (PDT)
MIME-Version: 1.0
References: <fd716a393e20d5db89f4f9d705d6dbbfde7260a6.1661400412.git.objelf@gmail.com>
 <Ywc1srMmMu51Nuzv@lore-desk>
In-Reply-To: <Ywc1srMmMu51Nuzv@lore-desk>
From: sean wang <objelf@gmail.com>
Date: Thu, 25 Aug 2022 22:13:20 -0700
Message-ID: <CAGp9LzqmSyj0n__1vOhQcqt-7QXWNzia-zngqyufB4-epgBsQg@mail.gmail.com>
Subject: Re: [PATCH] mt76: mt7921: reset msta->airtime_ac while clearing up hw value
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: =?UTF-8?B?U2VhbiBXYW5nICjnjovlv5fkupgp?= <sean.wang@mediatek.com>, 
	Felix Fietkau <nbd@nbd.name>, lorenzo.bianconi@redhat.com, 
	Soul Huang <Soul.Huang@mediatek.com>, YN Chen <YN.Chen@mediatek.com>, 
	Leon Yen <Leon.Yen@mediatek.com>, Eric-SY Chang <Eric-SY.Chang@mediatek.com>, 
	Deren Wu <Deren.Wu@mediatek.com>, KM Lin <km.lin@mediatek.com>, jenhao.yang@mediatek.com, 
	Robin Chiu <robin.chiu@mediatek.com>, Eddie.Chen@mediatek.com, 
	CH Yeh <ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, ted.huang@mediatek.com, 
	Stella Chang <Stella.Chang@mediatek.com>, Tom.Chou@mediatek.com, steve.lee@mediatek.com, 
	jsiuda@google.com, frankgor@google.com, kuabhs@google.com, druth@google.com, 
	abhishekpandit@google.com, shawnku@google.com, 
	linux-wireless <linux-wireless@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_221335_732775_B9892970 
X-CRM114-Status: GOOD (  24.14  )
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

On Thu, Aug 25, 2022 at 1:41 AM Lorenzo Bianconi <lorenzo@kernel.org> wrote:
>
> > From: Sean Wang <sean.wang@mediatek.com>
> >
> > We should reset mstat->airtime_ac along with clear up the entries in the
> > hardware WLAN table for the Rx and Rx accumulative airtime. Otherwsie, the
> > value msta->airtime_ac - [tx, rx]_last may be a negative and that is not
> > the actual airtime the device took in the last run.
>
> the only point where we need it is mt7921_mac_sta_assoc() since in
> mt7921_mac_sta_add() airtime_ac array is supposed to be already 0 and in
> mt7921_mac_sta_remove() we are removing the sta. Is my understanding correct?
> If so, is it better to just add a memset(, 0, ..) in mt7921_mac_sta_assoc()?
>

The way looks good to me. I'll add in the v2. thanks!

    Sean

> Regards,
> Lorenzo
>
> >
> > Reported-by: YN Chen <YN.Chen@mediatek.com>
> > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> > ---
> >  drivers/net/wireless/mediatek/mt76/mt7921/mac.c   | 15 ++++++++++-----
> >  drivers/net/wireless/mediatek/mt76/mt7921/main.c  |  9 +++------
> >  .../net/wireless/mediatek/mt76/mt7921/mt7921.h    |  2 ++
> >  3 files changed, 15 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> > index 47f0aa81ab02..87dd0babff7a 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> > @@ -46,6 +46,14 @@ bool mt7921_mac_wtbl_update(struct mt7921_dev *dev, int idx, u32 mask)
> >                        0, 5000);
> >  }
> >
> > +void mt7921_mac_sta_airtime_clear(struct mt7921_dev *dev,
> > +                               struct mt7921_sta *msta)
> > +{
> > +     mt7921_mac_wtbl_update(dev, msta->wcid.idx,
> > +                            MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
> > +     memset(msta->airtime_ac, 0, sizeof(msta->airtime_ac));
> > +}
> > +
> >  void mt7921_mac_sta_poll(struct mt7921_dev *dev)
> >  {
> >       static const u8 ac_to_tid[] = {
> > @@ -100,11 +108,8 @@ void mt7921_mac_sta_poll(struct mt7921_dev *dev)
> >                       addr += 8;
> >               }
> >
> > -             if (clear) {
> > -                     mt7921_mac_wtbl_update(dev, idx,
> > -                                            MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
> > -                     memset(msta->airtime_ac, 0, sizeof(msta->airtime_ac));
> > -             }
> > +             if (clear)
> > +                     mt7921_mac_sta_airtime_clear(dev, msta);
> >
> >               if (!msta->wcid.sta)
> >                       continue;
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> > index 1438a9f8d1fd..9d70884e24af 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> > @@ -723,8 +723,7 @@ int mt7921_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
> >       if (vif->type == NL80211_IFTYPE_STATION)
> >               mvif->wep_sta = msta;
> >
> > -     mt7921_mac_wtbl_update(dev, idx,
> > -                            MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
> > +     mt7921_mac_sta_airtime_clear(dev, msta);
> >
> >       ret = mt7921_mcu_sta_update(dev, sta, vif, true,
> >                                   MT76_STA_INFO_STATE_NONE);
> > @@ -750,8 +749,7 @@ void mt7921_mac_sta_assoc(struct mt76_dev *mdev, struct ieee80211_vif *vif,
> >               mt76_connac_mcu_uni_add_bss(&dev->mphy, vif, &mvif->sta.wcid,
> >                                           true);
> >
> > -     mt7921_mac_wtbl_update(dev, msta->wcid.idx,
> > -                            MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
> > +     mt7921_mac_sta_airtime_clear(dev, msta);
> >
> >       mt7921_mcu_sta_update(dev, sta, vif, true, MT76_STA_INFO_STATE_ASSOC);
> >
> > @@ -769,8 +767,7 @@ void mt7921_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
> >       mt76_connac_pm_wake(&dev->mphy, &dev->pm);
> >
> >       mt7921_mcu_sta_update(dev, sta, vif, false, MT76_STA_INFO_STATE_NONE);
> > -     mt7921_mac_wtbl_update(dev, msta->wcid.idx,
> > -                            MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
> > +     mt7921_mac_sta_airtime_clear(dev, msta);
> >
> >       if (vif->type == NL80211_IFTYPE_STATION) {
> >               struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> > index c161031ac62a..8b704d08509d 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> > @@ -362,6 +362,8 @@ void mt7921_stop(struct ieee80211_hw *hw);
> >  int mt7921_mac_init(struct mt7921_dev *dev);
> >  bool mt7921_mac_wtbl_update(struct mt7921_dev *dev, int idx, u32 mask);
> >  void mt7921_mac_reset_counters(struct mt7921_phy *phy);
> > +void mt7921_mac_sta_airtime_clear(struct mt7921_dev *dev,
> > +                               struct mt7921_sta *msta);
> >  void mt7921_mac_set_timing(struct mt7921_phy *phy);
> >  int mt7921_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
> >                      struct ieee80211_sta *sta);
> > --
> > 2.25.1
> >

