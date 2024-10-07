Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12582CFB448
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 15:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/BX+VbcYlbm0M/siPhF6PIc3XMMYf77ReOhn3qLkShA=; b=UXHVxT6FPggdDNelbd7hLBwGhx
	vbfa3h//ulsMvQfSD+fQT8KdzAx06nTECQZmUIp0amZWme4EzOJmSryiUszXi6UuQGWnMv72ROM0t
	inMaXWWovE2EnVlp9feefw5EbbzyStcjbs6tK9RCtx0sWSkK3P1eiTVBVnhJVU30NIlZ2i27t22fu
	Of+5AbKMoPTjDvuQL70wkCzONI4ftrHLIGuTy1gBGUwL5Px311lJ8cMNiQZbLdNwExnkZaDmp/nH5
	ya07TBaZvfpxv7O2p/Wkz2LSaa/Q2HaqJWTgIhcmXph2CqUZS6bYqa9J22oUPpFDhqmQ07x5voG3W
	BiOn8Xrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxpoQ-00000002yt2-0UjV;
	Mon, 07 Oct 2024 15:38:18 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxpn6-00000002ygF-0QBO;
	Mon, 07 Oct 2024 15:36:57 +0000
Received: by mail-pj1-x1041.google.com with SMTP id 98e67ed59e1d1-2e109539aedso3809292a91.0;
        Mon, 07 Oct 2024 08:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728315414; x=1728920214; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/BX+VbcYlbm0M/siPhF6PIc3XMMYf77ReOhn3qLkShA=;
        b=jp/oGYUccPuecK7icIEUGa6ehqJxh59miMzO5ewEY+3YqctTwXFHYyrMeELVhPQ4WW
         NMOLIF3I2hBdL10HOLDyViFk5DB0dZr6BwCXn42+qbSU5bUhJaq+oEpCXca7VHjbWN5k
         pAREsvKQm6ncYdtHIJaO6TQwhqBNJE27QWWRabGybh6Olw/FH43slR8B2mftgpnTDksX
         RDbMAuCfOTOP0g2KeGVBSooiUGOzLeFI/jsrA5Qvyv1kMBa2ZkedvCTJwkzHMAxF37wP
         5U2eebzPkJc7VYetb8WgsbK+tDqIIsknR9kFKqSe1kUnbkeBtCYslhNxYBqu+CDWVLYv
         goOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728315414; x=1728920214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/BX+VbcYlbm0M/siPhF6PIc3XMMYf77ReOhn3qLkShA=;
        b=LQaeOGIZy4YmEC821ZuNCJnc2xo8/Nma2YV+GbDVQ8Rkp3RCYtM61K3nQHlMNkUJzH
         uoAG5NCwXVXQC2xLrhmvtvNj/N6a8Ux6XnuZTFBAj7LQocS36/L2RCXVuQjLoIaV7H0c
         54tYsdehATAU51c3JMTDmHaQIPSmzTL7LpaENoe4Hq/pr1s8OBTui+zAtXJY09THCxt2
         /9K0l62iJaVbenUPcq1557QIfx/9njWArgLaLlOYhTJ4hLfH63zhVc6JgUQYZpBE1V+b
         dGrVr9+Vmg4eK/NyT9GOgYXyhGUdqye9BH7AvcaTm/WY2cdMrNuBrmOrgAq0Emis4pXP
         dQBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp34baOODUk7KDSDWOJShT07YbsTPlXsqCnhJUjQQ+z8Awe0J9AoeFTCJRh8FjCvi/iR6DcWcglKTtghrVxFQ=@lists.infradead.org, AJvYcCX8fCE2eCFBxEmEvAbFCX/xSYEoFGI1aEtB0oh13T4J8K1OVP2X9wNfAhAhA1MsvbSN7jfzW2UKG9voN9CW7qA6@lists.infradead.org
X-Gm-Message-State: AOJu0YxIihHXA0BDI5nj7jT2Gi2HricxncoEppOqMKjwGjt10OEHplTq
	c2drjPJkks9QUe7Zaz8FsL9kP2AFuofWV17bYkH9amkoekcCviWnUddjSix+6tTUkbjauFrV915
	g3iuCG5hg3Dn63nbab7I76lLiOaQ=
X-Google-Smtp-Source: AGHT+IHED5KE17P2SIVe12eKhrSWZxRW4U7wLJ3evF8QAPobxP8FyVWs6VS9pgVnIUZ12Cr6PlEXIKLWhUvvhFYajLE=
X-Received: by 2002:a17:90b:102:b0:2c9:7611:e15d with SMTP id
 98e67ed59e1d1-2e1e629fa8cmr15909999a91.20.1728315414372; Mon, 07 Oct 2024
 08:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <20241003180959.12158-1-zichenxie0106@gmail.com> <e116a42e-877e-439e-a83d-1afbaf35748b@gmail.com>
In-Reply-To: <e116a42e-877e-439e-a83d-1afbaf35748b@gmail.com>
From: Zichen Xie <zichenxie0106@gmail.com>
Date: Mon, 7 Oct 2024 10:36:44 -0500
Message-ID: <CANdh5G4mnj-N1gV=O=OiFFrZYFP+nzjte2dZTCAobzBHxSdhpA@mail.gmail.com>
Subject: Re: [PATCH v5] wifi: mt76: Fix NULL Dereference caused by mt76_connac_get_he_phy_cap()
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com, 
	shayne.chen@mediatek.com, sean.wang@mediatek.com, kvalo@kernel.org, 
	angelogioacchino.delregno@collabora.com, johannes.berg@intel.com, 
	quic_adisi@quicinc.com, deren.wu@mediatek.com, chui-hao.chiu@mediatek.com, 
	mingyen.hsieh@mediatek.com, howard-yh.hsu@mediatek.com, 
	StanleyYP.Wang@mediatek.com, allen.ye@mediatek.com, 
	benjamin-jw.lin@mediatek.com, Bo.Jiao@mediatek.com, evelyn.tsai@mediatek.com, 
	meichia.chiu@mediatek.com, krzk@kernel.org, linux-wireless@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	chenyuan0y@gmail.com, zzjas98@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_083656_163586_7F5636E2 
X-CRM114-Status: GOOD (  16.79  )
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

IMHO, using operator "&" for a NULL dereferenced pointer won't cause a
crash. 've' will only be assigned to a invalid address.

So we can put off the NULL check after
'const struct ieee80211_he_cap_elem *ve =3D &vc->he_cap_elem;'

Best Regards,
Zichen

On Mon, Oct 7, 2024 at 9:23=E2=80=AFAM Matthias Brugger <matthias.bgg@gmail=
.com> wrote:
>
>
>
> On 03/10/2024 20:09, Gax-c wrote:
> > From: Zichen Xie <zichenxie0106@gmail.com>
> >
> > mt76_connac_get_he_phy_cap() may return a NULL pointer,
> > leading to NULL Pointer Dereference.
> > Add a NULL check for the returned pointer.
> >
> > Fixes: a5c372f77aa7 ("wifi: mt76: mt7925: extend mt7925_mcu_bss_he_tlv =
for per-link BSS")
> > Fixes: e6d557a78b60 ("mt76: mt7915: rely on mt76_connac_get_phy utiliti=
es")
> > Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi=
 7 (802.11be) devices")
> > Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
> > ---
> >   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 5 +++++
> >   drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 2 ++
> >   drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 2 ++
> >   3 files changed, 9 insertions(+)
> >
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/=
net/wireless/mediatek/mt76/mt7915/mcu.c
> > index 87d0dd040001..762be3a37228 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> > @@ -551,6 +551,8 @@ mt7915_mcu_bss_he_tlv(struct sk_buff *skb, struct i=
eee80211_vif *vif,
> >       struct tlv *tlv;
> >
> >       cap =3D mt76_connac_get_he_phy_cap(phy->mt76, vif);
> > +     if (!cap)
> > +             return;
> >
> >       tlv =3D mt76_connac_mcu_add_tlv(skb, BSS_INFO_HE_BASIC, sizeof(*h=
e));
> >
> > @@ -1145,6 +1147,9 @@ mt7915_mcu_sta_bfer_he(struct ieee80211_sta *sta,=
 struct ieee80211_vif *vif,
> >       u8 nss_mcs =3D mt7915_mcu_get_sta_nss(mcs_map);
> >       u8 snd_dim, sts;
> >
> > +     if (!vc)
> > +             return;
> > +
>
> That will already blow up at line:
>          const struct ieee80211_he_cap_elem *ve =3D &vc->he_cap_elem;
>
> This needs some more code changes.
>
> Regards,
> Matthias
>
> >       bf->tx_mode =3D MT_PHY_TYPE_HE_SU;
> >
> >       mt7915_mcu_sta_sounding_rate(bf);
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/=
net/wireless/mediatek/mt76/mt7925/mcu.c
> > index 748ea6adbc6b..55e4cda2f20f 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> > @@ -2508,6 +2508,8 @@ mt7925_mcu_bss_he_tlv(struct sk_buff *skb, struct=
 ieee80211_bss_conf *link_conf,
> >       struct tlv *tlv;
> >
> >       cap =3D mt76_connac_get_he_phy_cap(phy->mt76, link_conf->vif);
> > +     if (!cap)
> > +             return;
> >
> >       tlv =3D mt76_connac_mcu_add_tlv(skb, UNI_BSS_INFO_HE_BASIC, sizeo=
f(*he));
> >
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/=
net/wireless/mediatek/mt76/mt7996/mcu.c
> > index 6c445a9dbc03..55bb2d0e67e5 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> > @@ -798,6 +798,8 @@ mt7996_mcu_bss_he_tlv(struct sk_buff *skb, struct i=
eee80211_vif *vif,
> >       struct tlv *tlv;
> >
> >       cap =3D mt76_connac_get_he_phy_cap(phy->mt76, vif);
> > +     if (!cap)
> > +             return;
> >
> >       tlv =3D mt7996_mcu_add_uni_tlv(skb, UNI_BSS_INFO_HE_BASIC, sizeof=
(*he));
> >

