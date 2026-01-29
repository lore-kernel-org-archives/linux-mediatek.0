Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81DCD358C4
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jan 2026 06:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V4RXnm96yEH7qfYuotbWNpOt6c3/e9A15eAjPlBB3Xw=; b=mVnBVgT+270Q5XmINF43hHoezD
	DBo6rYAVna6ynHZoRwXczZtZKaPPnhBzbo1OcbYkgXB1KMvq43foFBrgTFIIpX2H0SQ02JSXCERsg
	rqTmi2Ad9Sq6ayRV9xJ//vudYaJpEDcF7KYeNEFOzGg7yMMfu1nMjdEPKO/jnD79CWZddDsKKcN9p
	B/XdXHdORhB5aRhhCx68re4nDl2MVKlu/IVpoIHEr6t3MZWvDxgRB61kbg+a1PNJ+AxVpvpB78/oT
	J/rfab2HP7fGu0SMNCWTdN3AyTuL94JTVY77ytJC6hYfVKw6a/HQyZ0gs5XfODAPGP0L/RZ1bxGk8
	Haqkxm9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlLNu-0000000HKPz-3SJP;
	Thu, 29 Jan 2026 06:20:06 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlLNr-0000000HKOw-1diQ
	for linux-mediatek@lists.infradead.org;
	Thu, 29 Jan 2026 06:20:05 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-65832e566edso824319a12.2
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Jan 2026 22:20:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769667601; cv=none;
        d=google.com; s=arc-20240605;
        b=MdsPVISoYMN15UGCqBP709yyY9CdVT9Ym/IHdQ2dKDuxcryMQiIjVcfs/ashK1JsQE
         COW2QLEcagQA0Yk/9fZXghZX4GPBMogKtlOdWzNwTimgFuTpoXnOym6yGKmzcifCxA2b
         H8oZ6XcyrmWQclv3fMUx2z15AKuq1JBB+ye+B3Xo1HTDqqmeK1z/wHZFPIX03k7/gACV
         PHFh1SQ6BA9dcFFBRsgLCTk/bdjJDIRsfeRkSv2/B8jRbU7RV/c2Po0QEchoqphSxJ0X
         f8xFQJHR1OMZ9mMRs6a2ueXqSUtHQmclaeQyEsG6LPJpToZcXCIbRkPGLFyRFDIL0z2w
         ySYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V4RXnm96yEH7qfYuotbWNpOt6c3/e9A15eAjPlBB3Xw=;
        fh=moCrpKOv5+Skv/zl1XuxaiWCm8oduFW2v+xPCFLiCDo=;
        b=RFaIFltwYTWjv89SUxig/3U9iZ6WCZ9OkSA0w0v3ZHrhp2IGhnqAainGlUP2+Y92o0
         GaO7tRKqUQAU2tr2J/mzAxMz9i0eVOl2oTC88Xwft8Stx5imFE/AbtRgAsUPeRwH5cKS
         HkHd0NrxlMoDFZItFvVQox2hWHYJjVFnYiFQ5S223LDXo30hyGrPgRSoTsPz3ypTz5wj
         ZAN8FNu+mTk+KWLEI4Ll3tTS0g1zf5oCUom8exAxNdpu3jnqlT91uwC4PXaBWAxX0Xbm
         +NSwIyJ9db1FJdr8lxVT8SnpCM+A8/0pueqWPWU5JitqOTvhmJczA2IPu8a8om6f58CX
         t30w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zacbowling-com.20230601.gappssmtp.com; s=20230601; t=1769667601; x=1770272401; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4RXnm96yEH7qfYuotbWNpOt6c3/e9A15eAjPlBB3Xw=;
        b=OTogYwgaWi+P0aDylgdklqqmADGt+frfUat0wXTZ6K1965rSFyzXXYrcrueiAKziG/
         PMGShB/nsuYYDveUE7kURm9N6LEwhSywr76lSTG+RSRshsRPj1F0MBZYobF6MIj9jqtU
         0QDoKhJCOfnyb+wn5pr9YnxQASblwUrw1MUNy+PVxb/gjWBcoxa/o2s6OwgWNsn7lzkU
         8sSpu71squFPisyTaOOnZQxFKtE5zDaQzFKb1OAYpS2ri65X06Z3/ozbG0sRmIaQoDX7
         JOuZhy4L0EnAhWAsfgyqBkMJMH7kztoqfyqC2s3ni/mtTZoJWEZFY4B2lrIgqO+AyF18
         fYpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769667601; x=1770272401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V4RXnm96yEH7qfYuotbWNpOt6c3/e9A15eAjPlBB3Xw=;
        b=nmDZ9j52J0P3jQwsaBGfpkiNNHyIRQFKn0YQF8v79ML0u+NY1rmlYGvBcOHJTYt6Np
         MfOHlSIvo2EmsJVzxHutw4tOMcREf8D+L4c0Loe+muzP7a5SPLmcSy41uTIw5U/Gs88m
         +Mh9EGJ/coQPj16e6N7nTK4NDPIK5CSjk1Fzn3Z9lL57+RZQwfiPzjjyp/m/zSSj/8Q9
         T7rMb6DVukP8BYDe3118UwAteXIBJ3071yJpC7iz59qIP0caOxzCss/b3qQ+DmS0/zDU
         oV6m7fce1soTAiS9Wa6TAu4PTYD0jPtRpnlteAGTbBKsfNyIdnlUYUgtkdzI5HwnRs+m
         l46A==
X-Forwarded-Encrypted: i=1; AJvYcCWsyathZcILApkysynH0v6M7x5qjytB/TgtT9aprYvPNLcA7hJilPimw0xfSHg9gC31nYcFUrg4KKR12ciDyQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7Ul8yTqvkRRLebnxNwzVKdJf48NYsZLJmfDCCuTtlY1fgVBg+
	v4Y+QMBIZ2pwyGGhYv3O7oqJbEYgrIcU8U1Dgz4pCgspJTvY0U5it1VFbrH7SCvpFx4bAgoxkyr
	nCNSCNkmpSCUgJ5aNePrET7DKdde+t90=
X-Gm-Gg: AZuq6aLiCzkWO7OcSQ380q0F99rYgLn3J9pNGX4IH4MfdkKBySpWERDoIvfK7A3LJbz
	06xGbtmXN8qUjA9M2nLoxhHQGMh6lTLvr+Q5XqbTHaHJR8FpQW1wBsxxcpGVKGjdaCqPk0IB3dh
	p5ol0VOocpOTYdWX8cL34/mr3jOgeoSQkwX0PWQrcCKDg6RkfH+fYfrSXXO7e/xsDiLHxJlI+Wx
	c1iPSPICBtE8fFVXZLHU94eJ1hnwLmq6b0m9VwwAh+tbeUobFWpbvUAOF+fsO2yalo+MsXtR0av
	ppQqyg53YoukkB7yXVVPxlVwF4rjoriauAdsZ5F23PXMeDp2DkG33xbgUA==
X-Received: by 2002:a05:6402:1465:b0:650:31ef:177b with SMTP id
 4fb4d7f45d1cf-658a60c2615mr4860143a12.34.1769667600616; Wed, 28 Jan 2026
 22:20:00 -0800 (PST)
MIME-Version: 1.0
References: <CAGp9LzrcvW18xKFL-oF3wxRmb73G6PN59Y2NSA2E5idva1wtKg@mail.gmail.com>
 <20260120201043.38225-1-zac@zacbowling.com> <20260120201043.38225-5-zac@zacbowling.com>
 <a1113ede-9575-433f-a9d4-f8e9c1c6f8ab@nbd.name>
In-Reply-To: <a1113ede-9575-433f-a9d4-f8e9c1c6f8ab@nbd.name>
From: Zac Bowling <zac@zacbowling.com>
Date: Wed, 28 Jan 2026 22:19:49 -0800
X-Gm-Features: AZwV_QizZvGlC6PpQzePntFypupV7Pq3HGHnJZPkV8fl3s91jhWPWm7IPluHHDg
Message-ID: <CAOFcj8S4vBGpgwamW_b9mGaHhL78O44_CdM++qqGJc89nEancA@mail.gmail.com>
Subject: Re: [PATCH 04/13] wifi: mt76: mt7921: add mutex protection in
 critical paths
To: Felix Fietkau <nbd@nbd.name>
Cc: sean.wang@kernel.org, deren.wu@mediatek.com, kvalo@kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux@frame.work, lorenzo@kernel.org, 
	ryder.lee@mediatek.com, sean.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_222003_728240_F52EB560 
X-CRM114-Status: GOOD (  25.91  )
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

You are right. I caught that too. After reordering, when I went from
the 24-something patch version of this series earlier this month to
this smaller 11-patch series, to make it easier to follow again, that
happened. It's already gone in my new v7 series. We lock somewhere
else up in the stack now.

I'm cleaning up this whole stack again, dropping the ROC_ABORT back
off hack, because I think actually the solution isn't at this layer at
all, but possibly in the mac80211 layer.

Zac Bowling

On Tue, Jan 27, 2026 at 2:59=E2=80=AFAM Felix Fietkau <nbd@nbd.name> wrote:
>
> On 20.01.26 21:10, Zac wrote:
> > From: Zac Bowling <zac@zacbowling.com>
> >
> > Add proper mutex protection for mt7921 driver operations that access
> > hardware state without proper synchronization. This fixes multiple race
> > conditions that can cause system instability.
> >
> > Fixes added:
> >
> > 1. mac.c: mt7921_mac_reset_work()
> >     - Wrap ieee80211_iterate_active_interfaces() with mt792x_mutex
> >     - The vif_connect_iter callback accesses hw_encap state
> >
> > 2. main.c: mt7921_remain_on_channel()
> >     - Remove mt792x_mutex_acquire/release around mt7925_set_channel_sta=
te()
> >     - The function is already called with mutex held from mac80211
> >     - This was causing double-lock deadlock
> >
> > 3. main.c: mt7921_cancel_remain_on_channel()
> >     - Remove mt792x_mutex_acquire/release
> >     - Function is called from mac80211 with mutex already held
> >
> > 4. pci.c: mt7921_pci_pm_complete()
> >     - Remove mt792x_mutex_acquire/release around ieee80211_iterate_acti=
ve_interfaces
> >     - This was causing deadlock as the vif connect iteration tries
> >       to acquire the mutex again
> >
> > 5. usb.c: mt7921_usb_pm_complete()
> >     - Same fix as pci.c for USB driver path
> Changelog should be below "---" after the commit description, so it
> doesn't get picked up.
>
> > These changes prevent both missing mutex protection and mutex deadlocks
> > in the mt7921 driver.
> >
> > Fixes: 5c14a5f944b9 ("wifi: mt76: mt7921: introduce remain_on_channel s=
upport")
> > Signed-off-by: Zac Bowling <zac@zacbowling.com>
>
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers=
/net/wireless/mediatek/mt76/mt7921/main.c
> > index 5fae9a6e273c..196fcb1e2e94 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> > @@ -373,6 +373,11 @@ void mt7921_roc_abort_sync(struct mt792x_dev *dev)
> >
> >       timer_delete_sync(&phy->roc_timer);
> >       cancel_work_sync(&phy->roc_work);
> > +     /* Note: caller must hold mutex if ieee80211_iterate_interfaces i=
s
> > +      * needed for ROC cleanup. Some call sites (like mt7921_mac_sta_r=
emove)
> > +      * already hold the mutex via mt76_sta_remove(). For suspend path=
s,
> > +      * the mutex should be acquired before calling this function.
> > +      */
> >       if (test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state))
> >               ieee80211_iterate_interfaces(mt76_hw(dev),
> >                                            IEEE80211_IFACE_ITER_RESUME_=
ALL,
> > @@ -619,6 +624,7 @@ void mt7921_set_runtime_pm(struct mt792x_dev *dev)
> >       bool monitor =3D !!(hw->conf.flags & IEEE80211_CONF_MONITOR);
> >
> >       pm->enable =3D pm->enable_user && !monitor;
> > +     /* Note: caller (debugfs) must hold mutex before calling this fun=
ction */
> >       ieee80211_iterate_active_interfaces(hw,
> >                                           IEEE80211_IFACE_ITER_RESUME_A=
LL,
> >                                           mt7921_pm_interface_iter, dev=
);
> > @@ -765,6 +771,9 @@ mt7921_regd_set_6ghz_power_type(struct ieee80211_vi=
f *vif, bool is_add)
> >       struct mt792x_dev *dev =3D phy->dev;
> >       u32 valid_vif_num =3D 0;
> >
> > +     /* Note: caller (mt7921_mac_sta_add/remove via mt76_sta_add/remov=
e)
> > +      * already holds dev->mt76.mutex, so we must not acquire it here.
> > +      */
> >       ieee80211_iterate_active_interfaces(mt76_hw(dev),
> >                                           IEEE80211_IFACE_ITER_RESUME_A=
LL,
> >                                           mt7921_calc_vif_num, &valid_v=
if_num);
>
> It looks like these comments should be replaced with
> lockdep_assert_held, so that these assumptions can be verified
> automatically instead of doing so by hand.
>
>
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/=
net/wireless/mediatek/mt76/mt7921/pci.c
> > index ec9686183251..9f76b334b93d 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> > @@ -426,7 +426,9 @@ static int mt7921_pci_suspend(struct device *device=
)
> >       cancel_delayed_work_sync(&pm->ps_work);
> >       cancel_work_sync(&pm->wake_work);
> >
> > +     mt792x_mutex_acquire(dev);
> >       mt7921_roc_abort_sync(dev);
> > +     mt792x_mutex_release(dev);
> The next patch is removing those...
>
> - Felix

