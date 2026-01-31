Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C56E6BF3C
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Jan 2026 01:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQyH5xpTG8TO/Rjoqb2jAcpkWjV64y4FbbMV20nTjh8=; b=ysEYJZYGPWQuYr7hbm6AmwSxQl
	wB9fWagB2Urdo27WWF1yFUuuJovso++PnRX/pf722D/f+7Mo6VDwQTF6k2qFf8cmOFjBags2rjMs9
	pt9xf7gskLDPLibz8cg+YE9ORGSN6Em8t7zslWIYhyfobdf2AYV8v+m+4SXFW03WdRpTw0b9S+BAk
	j2MA48iaIHDJ5wHh0odtWADQq1h8O1heVQAt2vk5DNmH4tMSVlsvhcDvNQSECWHb6Epjk1PmPpMth
	6FPD/bdhVKyCv3Bm0CmCMNBneGnwsenAfQV4nPjNMw1bX7f+xYi+e0Pr+teAH+J7XKFa+y4l6vbLe
	0peNT0kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlzvF-00000002C70-38Ir;
	Sat, 31 Jan 2026 01:37:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlzvE-00000002C6V-0y4L
	for linux-mediatek@lists.infradead.org;
	Sat, 31 Jan 2026 01:37:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 46F556013D
	for <linux-mediatek@lists.infradead.org>; Sat, 31 Jan 2026 01:37:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00DA0C2BC87
	for <linux-mediatek@lists.infradead.org>; Sat, 31 Jan 2026 01:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769823431;
	bh=HSlwIJ3DA03/OunBfURR+gTgDH9OrO+A2nv+pjkXXjw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QgXpE0tDl3vo6ylg8njiRaJhA142z6t9oj9LisXrIMOCApL9oRxp6dO8R+a56W+iy
	 090+Utx6lu425HbkFoLbfPXsizeAl5hU4rWVqA6FBlTufiymgDPsVcboGy4A9KV8U5
	 DgCru4xNydtjMLpdvNYv3PQmzrm6LygJnxdz53Y6Icu65seR3mUipjgJ5pXLf0xH5A
	 +TdshQjXiJd4NNMY+D+ZToG2mJxW7D7iA26BZ1wLJsnIvrOocufWm7kDl2ognpbGS7
	 Ab0xs+6OGeUc/5D0yoI4VVqlWy2XnGpIpM+W3mi2JUamOMnssMv6Envx6VFz/59xa0
	 b8hcbXkhqAJ/A==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59b8466b4a8so2096391e87.1
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Jan 2026 17:37:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUuaspK34e9VTvxs/4lTz2Yqe1YMN3/M/9uGEmPBHtEPmkLD3YvhehqMLC+oRW/QXS1sJGp6hkdKBiOWjaYrQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwuFYdqH9mrxSKkAo2xmY8ig9hT28u1e4Aae6QJHbO7U3SXUZlg
	Vf+teKaoiCRskgZAWTpv85xc4DsecRtthx7agfCT/5+zBAMNns87EWPd6V5R1DYK7RhFq0nHdTJ
	1DBQ80VjNLjiKhlEW/M+46Cue4o4+lvk=
X-Received: by 2002:a05:6512:ad4:b0:59b:70e7:4128 with SMTP id
 2adb3069b0e04-59e16463c5emr1561236e87.53.1769823429264; Fri, 30 Jan 2026
 17:37:09 -0800 (PST)
MIME-Version: 1.0
References: <20260130032517.173590-1-n7l8m4@u.northwestern.edu>
In-Reply-To: <20260130032517.173590-1-n7l8m4@u.northwestern.edu>
From: Sean Wang <sean.wang@kernel.org>
Date: Fri, 30 Jan 2026 19:36:56 -0600
X-Gmail-Original-Message-ID: <CAGp9LzqQ45LAeeG1Cijs1QmtzBjOmML_qY=9Y5zH8tYmZeQWZQ@mail.gmail.com>
X-Gm-Features: AZwV_Qgzlc9REroD0uijyrgcGZUw6qt5vKeV6p_1BhQT_C5t6Fi3nVhTvV39E4c
Message-ID: <CAGp9LzqQ45LAeeG1Cijs1QmtzBjOmML_qY=9Y5zH8tYmZeQWZQ@mail.gmail.com>
Subject: Re: [PATCH] wifi: mt76: add missing lock protection in mt76_sta_state
 for sta_event callback
To: Ziyi Guo <n7l8m4@u.northwestern.edu>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Jan 29, 2026 at 9:25=E2=80=AFPM Ziyi Guo <n7l8m4@u.northwestern.edu=
> wrote:
>
> mt76_sta_state() calls the sta_event callback without holding dev->mutex.
> However, mt7915_mac_sta_event() (MT7915 implementation of this callback)
> calls mt7915_mac_twt_teardown_flow() which has
> lockdep_assert_held(&dev->mt76.mutex) indicating that callers must
> hold this lock.
>
> The locking pattern in mt76_sta_state() is inconsistent:
> - mt76_sta_add() acquires dev->mutex before calling dev->drv->sta_add
> - mt76_sta_remove() acquires dev->mutex before calling __mt76_sta_remove
> - But sta_event callback is called without acquiring the lock
>
> Add mutex_lock()/mutex_unlock() around the sta_event callback invocation
> to fix the missing lock protection and maintain consistency with the
> existing locking pattern.
>

The mt7921 / mt7925 .sta_event callback already holds the lock; this
patch would cause a deadlock. Suggest adding the implementation to
MT7915.

> Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
> ---
>  drivers/net/wireless/mediatek/mt76/mac80211.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/=
wireless/mediatek/mt76/mac80211.c
> index 75772979f438..468bc176bacb 100644
> --- a/drivers/net/wireless/mediatek/mt76/mac80211.c
> +++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
> @@ -1640,6 +1640,7 @@ int mt76_sta_state(struct ieee80211_hw *hw, struct =
ieee80211_vif *vif,
>         struct mt76_phy *phy =3D hw->priv;
>         struct mt76_dev *dev =3D phy->dev;
>         enum mt76_sta_event ev;
> +       int ret;
>
>         phy =3D mt76_vif_phy(hw, vif);
>         if (!phy)
> @@ -1668,7 +1669,11 @@ int mt76_sta_state(struct ieee80211_hw *hw, struct=
 ieee80211_vif *vif,
>         else
>                 return 0;
>
> -       return dev->drv->sta_event(dev, vif, sta, ev);
> +       mutex_lock(&dev->mutex);
> +       ret =3D dev->drv->sta_event(dev, vif, sta, ev);
> +       mutex_unlock(&dev->mutex);
> +
> +       return ret;
>  }
>  EXPORT_SYMBOL_GPL(mt76_sta_state);
>
> --
> 2.34.1
>
>

