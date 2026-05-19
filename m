Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9019ECD4F5B
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2026 12:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8y5pq/3tUQo0gg+N0tZskaVB8fdmoWJdJrd4o2r5SVo=; b=kj0oD9s+mEARBtAD9vYZ0s0Kzg
	FTNR94z7xKxdlW74A+mw0ARQByxb31eLz7FkspfbGrjXqzXQ/p+X92fn7i52vhEiOxffEsCcYdGDL
	4zh53r5fAMcK1Hh32g88+/FMky0JqFS8W2kAfcdVFhe+TL/SiKLcsF63AoqSacH+IV4P5ewQ4wfWX
	UUdTAltQttkJZg+QaW91HhzzB76kK7hHbKAx92y9CuzQz0zwjWweCNfADXVwtCAONBRnneOEo7TZI
	vWu40NeAxQkrAdCl++KAWjTBnKWyBjcIYQxIgi6g0Dt3b7mOma065Tp8Ekco2CACUziOy7jnH2AIk
	h/XPmOPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJVV-00000001SvC-1v4u;
	Tue, 19 May 2026 12:25:09 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJVS-00000001SuH-1fNH
	for linux-mediatek@lists.infradead.org;
	Tue, 19 May 2026 12:25:07 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5a8d1f43432so6399152e87.3
        for <linux-mediatek@lists.infradead.org>; Tue, 19 May 2026 05:25:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779193504; cv=none;
        d=google.com; s=arc-20240605;
        b=U0G1eU54WuDT4oY2Rpt+3J7bhvcHcZ8OU37XpGDgmlFhW8wkq5TqKVyzhfQHM5iAmU
         2V+4jxmdZ9XuqI07ZpeUvTil7eHBg/gHo2H2UXbNSDGgNCZn/stYTUPR1+m3BPoUAgfn
         K2aACSxJ39JUNj/OF2MKhwIPZRQdyWp3ltwv9KG123Ra0/5Lh3PaunofFqz56/M5J1pk
         iQ8VExgcXSR1lhZMpRbTGgQEhQdUdREr2N8XJfIjAOQp6GRwhtk7ShjHmM2NlIJIBK7R
         5ac3ih5WxYg5CZh3yLAlkklFImFMcDbYNRQZ1qJYZGqvza0ynLFAXdTMcHeOFRL6dtfE
         By5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8y5pq/3tUQo0gg+N0tZskaVB8fdmoWJdJrd4o2r5SVo=;
        fh=brGsXQJGAhsdCewyGUoJ3qtIw8CdUQc89Ch8hoBY6p8=;
        b=lgKJfxYgjbNVqpcUggLwYNSXhMsOhF+nYNxeB+IrDhwFxiHm22bdmhsiDzbiYxM0ll
         nA1915Oqhoc1a2i0dIFdNq4fLNm9z8ZXiBwYs6nhGOMYNi8lPjtSQgbTr4ZOS38q5lfp
         dRXkVpcjwJnEGxJPaLRiaFBabEzIEjorPprhK52n+PmzWaFZWuEEOThxYoSF/Q1Ki/lS
         wdVVb2EcaANTb/JdZ819GdlR5V6eJkDCjxDIjmRsOF9bqOsyQYTuguy7tHWZKvlzyGFI
         kfSmEWSs6Uk5p0dJg7EA599G1Ag9fl9FB5sjx0xNOq6QAxfW0jAIC2yTU8JHhGJoRF9n
         wdtw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779193504; x=1779798304; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8y5pq/3tUQo0gg+N0tZskaVB8fdmoWJdJrd4o2r5SVo=;
        b=RzJkQbK/obcwG2IOqjiZ315XU5PCL1hrsEDG0oMApwmtkkPNlajsI6QHNLw1V0Ukss
         ICrEr8aCGVSdhpyaZzO0uIyKZ0v3VcIYWL53W4SboGPdifUt/bnbqszUePmE2DnFceSs
         gLHDvaLfITzpMieDIgZS6aOtFESJ7zREEbGRkhRMo7HqGvAsOh3mrHdnHfqQCJu0OLUM
         d9vyBKuLKCnQgtMmkOF71yE3zucYAYB2AwS+lGostEoFHc1bzzOBQFqwBe99tTRbvxb7
         ScM6Nliq1tXC+DZuOPxaAcIr1TbBp90/RuSxhsCorokZZZKoVHmLpkMCiSmP5jpHZofp
         SoQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779193504; x=1779798304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8y5pq/3tUQo0gg+N0tZskaVB8fdmoWJdJrd4o2r5SVo=;
        b=oyKm/5GGwg+cCa5ij0NVNc5PkSpdsVOg9zoc/aWXmrLd/3bNRgq3fw8TAheGOoWXgf
         V0/TY+PPzSwuyOaB22cmA0QQ4yLlnutils+3gbobGXpNQLBqxWksPdA8PgVE0VlkwnNf
         5Zxn/JDGY0OwweLrN5GIGSolXvnvg94s/wvwG3hbrR7vSocD19nOLx4FP7vMx/yU+bt3
         8tNzrUOJWfnDlq2Y67n+y7zf1wbuOKHptLCg6tRIzViOt9HZhJNhhWTfXtBte9As/ntB
         VxRDC83WAnSe5iruJix/rrmM7c/dW4V9CPfurNsEXOzoTRpAphYUuhot99HhA2jocACJ
         j0Iw==
X-Forwarded-Encrypted: i=1; AFNElJ9RKv6Zna8DoYjmEHht8vjYAQuW2R2V0tUuALtE0l5YpMe1C//TljAR9LCqkpsDuAdEb4og508w83yTEPeX1Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwrlkiPXNqiE9IVTSSFRp9iXaXimbPRGzz+zBlOtc1PVMWcQShY
	8gM8E0fmxWaIDPXh3OWW2014BaQVdU3Wg52WuBTjNyxFHEYShsGsbi/WBjSep9nksxZOLtFR2Jp
	wwEvT5DZBQVq4RfMElp1e+6ciDFwlr4o=
X-Gm-Gg: Acq92OHutZ5Q+pEL1k2wd43WsbhIX3DIVl3JoW+da7GeglTnWrwRavt/fBSEVSl7k4m
	l+zgSDN95cWx3tA1v/HGJ61x6CVhn6XeZSemuX0OxrwwN4U6EH83/ESXy0i1hInqTWIslhPLn9A
	DeTcDOiTj0SpxuLrkwMV/5vvm0QQTX7jLSOMSgK1KK/YAdUkOoyIJ3zZXIzf9U+/sLeE67nko6q
	QFU1eJfdlyKJQqNH0ESKve9vLvHbG7slNdk5gB3K9T5sZaiaOF6UZvRYWdVRyTeLTtr2762tWGQ
	XT2d+6M=
X-Received: by 2002:a05:6512:a85:b0:5a8:6cab:4866 with SMTP id
 2adb3069b0e04-5aa0e74a9b4mr5964361e87.41.1779193503535; Tue, 19 May 2026
 05:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <5ecac6a9b7d29526e8438dea105b58f5487c93aa.1778521232.git.ryder.lee@mediatek.com>
 <agdJ1EtZjjWh2R1h@lore-desk> <CAHoxojJX2BRRTLMuM_QcJqMMmshxS4EAwrB1VjU3rsZ+0k2PAg@mail.gmail.com>
 <agsGiHKH6ly1afaf@lore-desk> <CAHoxojKeXCCnJoO7yBBmTM9euiTf38orujOhOK00X8bb3ctWuA@mail.gmail.com>
In-Reply-To: <CAHoxojKeXCCnJoO7yBBmTM9euiTf38orujOhOK00X8bb3ctWuA@mail.gmail.com>
From: Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>
Date: Tue, 19 May 2026 14:24:52 +0200
X-Gm-Features: AVHnY4KaoxlMsOnP7ZY50hh_a8dZdUJo8i7PBx8_p8ryKTV2m-BiT8h1mMrMaXk
Message-ID: <CAA2SeNJXv+8QO6zEOF=qB3wVCdEoSqx6fftp1i=aB-DKMFeC=A@mail.gmail.com>
Subject: Re: [PATCH] wifi: mt76: mt7996: avoid memset overwriting tx_info->control.flags
To: Roy Luo <roychl666@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Felix Fietkau <nbd@nbd.name>, linux-mediatek@lists.infradead.org, 
	linux-wireless@vger.kernel.org, Shayne Chen <shayne.chen@mediatek.com>, 
	Roy Luo <roy-ch.luo@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_052506_489876_55401F60 
X-CRM114-Status: GOOD (  21.16  )
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

>
> On Mon, May 18, 2026 at 5:31=E2=80=AFAM Lorenzo Bianconi <lorenzo@kernel.=
org> wrote:
> >
> > On May 15, Cheng Hao Luo wrote:
> > > > struct ieee80211_tx_info {
> > > >         u32                        flags;                /*     0  =
   4 */
> > > >         u32                        band:3;               /*     4: =
0  4 */
> > > >         u32                        status_data_idr:1;    /*     4: =
3  4 */
> > > >         u32                        status_data:13;       /*     4: =
4  4 */
> > > >         u32                        hw_queue:4;           /*     4:1=
7  4 */
> > > >         u32                        tx_time_est:10;       /*     4:2=
1  4 */
> > > >
> > > >         /* XXX 1 bit hole, try to pack */
> > > >
> > > >         union {
> > > >                 struct {
> > > >                         union {
> > > >                                 struct {
> > > >                                         struct ieee80211_tx_rate ra=
tes[4]; /*     8    12 */
> > > >                                         s8     rts_cts_rate_idx; /*=
    20     1 */
> > > >                                         u8     use_rts:1; /*    21:=
 0  1 */
> > > >                                         u8     use_cts_prot:1; /*  =
  21: 1  1 */
> > > >                                         u8     short_preamble:1; /*=
    21: 2  1 */
> > > >                                         u8     skip_table:1; /*    =
21: 3  1 */
> > > >                                         u8     antennas:2; /*    21=
: 4  1 */
> > > >                                 };                       /*     8  =
  14 */
> > > >                                 long unsigned int jiffies; /*     8=
     8 */
> > > >                         };                               /*     8  =
  16 */
> > > >                         struct ieee80211_vif * vif;      /*    24  =
   8 */
> > > >                         struct ieee80211_key_conf * hw_key; /*    3=
2     8 */
> > > >                         u32        flags;                /*    40  =
   4 */
> > > >                         codel_time_t enqueue_time;       /*    44  =
   4 */
> > > >                 } control;                               /*     8  =
  40 */
> > > >                 struct {
> > > >                         u64        cookie;               /*     8  =
   8 */
> > > >                 } ack;                                   /*     8  =
   8 */
> > > >                 struct {
> > > >                         struct ieee80211_tx_rate rates[4]; /*     8=
    12 */
> > > >                         s32        ack_signal;           /*    20  =
   4 */
> > > >                         u8         ampdu_ack_len;        /*    24  =
   1 */
> > > >                         u8         ampdu_len;            /*    25  =
   1 */
> > > >                         u8         antenna;              /*    26  =
   1 */
> > > >                         u8         pad;                  /*    27  =
   1 */
> > > >                         u16        tx_time;              /*    28  =
   2 */
> > > >                         u8         flags;                /*    30  =
   1 */
> > > >                         u8         pad2;                 /*    31  =
   1 */
> > > >                         void *     status_driver_data[2]; /*    32 =
   16 */
> > > >                 } status;                                /*     8  =
  40 */
> > > >                 struct {
> > > >                         struct ieee80211_tx_rate driver_rates[4]; /=
*     8    12 */
> > > >                         u8         pad[4];               /*    20  =
   4 */
> > > >                         void *     rate_driver_data[3];  /*    24  =
  24 */
> > > >                 };                                       /*     8  =
  40 */
> > > >                 void *             driver_data[5];       /*     8  =
  40 */
> > > >         };                                               /*     8  =
  40 */
> > > >
> > > >         /* size: 48, cachelines: 1, members: 7 */
> > > >         /* sum members: 44 */
> > > >         /* sum bitfield members: 31 bits, bit holes: 1, sum bit hol=
es: 1 bits */
> > > >         /* last cacheline: 48 bytes */
> > > > };
> > > >
> > > > According to pahole, the size of the control inner union is actuall=
y 16 bytes
> > > > since the compiler adds 2 bytes of padding. Since mt76_tx_status_sk=
b_add()
> > > > meset to 0 just mt76_tx_cb size (that is 16 bytes) I can't see how
> > > > control.flags is overwritten. Am I missing something?
> > > >
> > > > struct mt76_tx_cb {
> > > >         long unsigned int          jiffies;              /*     0  =
   8 */
> > > >         u16                        wcid;                 /*     8  =
   2 */
> > > >         u8                         pktid;                /*    10  =
   1 */
> > > >         u8                         flags;                /*    11  =
   1 */
> > > >
> > > >         /* size: 16, cachelines: 1, members: 4 */
> > > >         /* padding: 4 */
> > > >         /* last cacheline: 16 bytes */
> > > > };
> > >
> > > Hi Lorenzo,
> > >
> > > The mt76_tx_cb is placed at status.status_driver_data (offset 32).
> > > It overlaps with hw_key, flags and enqueue_time in the control union.
> > >
> > > static inline struct mt76_tx_cb *mt76_tx_skb_cb(struct sk_buff *skb)
> > > {
> > > BUILD_BUG_ON(sizeof(struct mt76_tx_cb) >
> > >     sizeof(IEEE80211_SKB_CB(skb)->status.status_driver_data));
> > > return ((void *)IEEE80211_SKB_CB(skb)->status.status_driver_data);
> > > }
> >
> > Hi Roy,
> >
> > I still do not understand since mt76_tx_status_skb_add() sets to 0 just=
 sizeof
> > of mt76_tx_cb, that according to pahole is 16 bytes, so it can't overwr=
ite
> > hw_key pointer (whose offset respect to the beginning of the control st=
ruct is
> > 24, 32 - 8).
> >
> > Regards,
> > Lorenzo
> >
> > >
> > > Regards,
> > > Roy Luo
>
> Hi Lorenzo,
>
> The mt76_tx_status_skb_add() memset zero the 16 bytes starting from
> status.status_driver_data (please see the above inline function shared
> in my last response) whose offset with respect to the beginning of
> the control/status union is exactly 24 (32 - 8) instead of 0.
>
> Regards,
> Roy Luo

Hi Roy,

I can see the issue now, I was confusing status.status_driver_data
with
driver_data. You are right, we have an issue here. However, copying
all the
ieee80211_tx_info struct seems a bit overkill, what do you think?
Moreover, we have the same issue for various chipsets (e.g. mt7925 and
mt7915).  I guess we should try to find a global solution for the
problem.

Regards,
Lorenzo

