Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DED0CA5FC5
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2026 01:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rFT97ZWRBz3ey/79pcQ9Crf/WiVH/cFfH5FZgLCxjms=; b=Fv+7oQM7XnW4XqSab+RFSraPz+
	iL69tEkqOHXN/UsBjc7zJlcyHRbqBA1evZsM/JMDPo0Y3IcZQEAeJ1eQhnqT1oynqlyepvFFwef4l
	ya8xS4Lnhids5YgCeyqBnNOFkWt1MHChCQcIXQhw+Tz1r6i4ShWBfeyQMwf6jqAlkjYAD43IDQFl7
	Q4JYQs4Ii7Xqn0g8owLdAbvoJl0FkNoqrR5azKMGSERZ3aOK2uqSM+8NuLrZvFwH9S3sRK6iyShHk
	nNcKwU9dxlNMuIAp3XA4OjNTVjINBgQXpO/DGf4FNBd1o7qB49qYHDUnTrVFL7LqXzHbAVgYlq6Ng
	L4A1hG5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC5Yb-00000007ZGD-3kvu;
	Thu, 01 Oct 2026 01:25:57 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC5YZ-00000007ZFp-0a39
	for linux-mediatek@lists.infradead.org;
	Thu, 01 Oct 2026 01:25:56 +0000
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-8692a8568e9so2572094b3a.3
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Sep 2026 18:25:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790817953; cv=none;
        d=google.com; s=arc-20260327;
        b=MPi8YoUCFh301tFeYoAtCfmEHfr1syNV7XzfYXJZmVOEX7vbOuGMJDXIFYNt4WvsWX
         tkU+x0CnnnyAjalihR6jKS0We/NNfJgnFvbzYyuZNehIjjtcqzLYdKAkNbEMA+gbcBwY
         fKxgxRmixobPFXMCl+ZZ3Y/J4WAc9m1WKEMogMHTbrLMFM2sWdxik9gMO3Ki4/wXh//l
         9y/rfoUjYsUT01dTd23CGEdFi7vHr8iR+sba/4aessdSKYEpBIdbXOK8XDfgYxs6GlfM
         wppTYsAyZBG8ewUNbtGwwmUsLWzkCkgEY+L+bln1MEL4F7/0LjgLBbIVZTM7Hwc7ombc
         ew3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rFT97ZWRBz3ey/79pcQ9Crf/WiVH/cFfH5FZgLCxjms=;
        fh=o66WGGEfOZII5b76VT1iU7ed1j2Kwlj7wKRiL8YdjbQ=;
        b=rWvxIjXgIGQNR0oQfJ3fnk9GptHERq3EhseVdYviZniNPs72ytAHMIuqXrAw9LgAgy
         JXHEVFr2iI0vJr/7LJHGbRX9EA0j/fTNrrLgRofx8v4Hjy7dyu7xxsNkxgmvpRDcUXmW
         +lKBaS8hoxj3w+2Lg1d4ypsX5widJpVZ9EynBR6HVdxdPdAhc1vQCz+Gz6SAIdaGGdxC
         pSUiMTf6tPA8o+1EFc3ovmCv2uVOpOa5kw55X58OpIaUdfct6U2BBnwZrPqixKjfT1U/
         4Wb5JZu/rqNlUoJWYQjX1IkAC74i1fJj3Slbrx++HtPiw5xG+xznWI7lRW3/jigiJGkS
         xiGQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790817953; x=1791422753; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rFT97ZWRBz3ey/79pcQ9Crf/WiVH/cFfH5FZgLCxjms=;
        b=ShAT370fbAyNZJp15BJdqjRoJQqAlYJjR0I9wmqFkLlZJuvfqvMX9212HdLZ12dpIx
         s1sqGX8nfi5Ir3MoJfgmmYwIQQrmHLaLnWatJLN4Q2VGw8K0PkgoDj3C1DV+5TPOW/IY
         3rkRvkhYHwwLMbmhzJUxB1N14QapHiQTE8IAPY/rYxhaSoTyKeX+Y0jO00qQzn9393XY
         6jtY11mzvhYyq4pHh9rV2r8pSt1uvcYBYjYbgxdnf5eEg9+DLlvge+4A/CDUJRSpBU1m
         polS53Z+FXomkSf0UrIUsusYUqp4k8U2K5WS0JsIJHBalY2P2UXmcOQm/uGx/32wP15F
         /oHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790817953; x=1791422753;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rFT97ZWRBz3ey/79pcQ9Crf/WiVH/cFfH5FZgLCxjms=;
        b=ODy9SHsqqfhkNfVodn9DAiZqz2PhDs/pLAL3S2s+F2P7I2sbZNTMqKo3a9JSQ9M3Nu
         EK3E0ip61MSCn3rYIZwoZGQuNSqzFoNenZusi/cfFhnv8aYDz5+oEkgK+irFvfUdXtmB
         HhFZB873M3TSgNGMQvkv2tOgo3w0iKHlsHs3DN5jloi1tO76RZa8e6z3TgkUziJgFWgO
         LIuR8gAUghB6IKwDhmHJNnWgLjRe50XOM29AuoA6BASticB+7jryrxXFufu1s5t8Li1q
         ZO+zKClPRbRGeZyi+wIkvWxWT26kVvhLOXgobrSiJ1qtsdWdjTbsq7fIUjak281NQEtr
         2P0A==
X-Forwarded-Encrypted: i=1; AKwUvBwW2943ieWIkpyheHrROQAxMR0hXpCTMAwBPMYQcZ0iEykevng8Q5QbmxWoROQokEWCs9gnY59/uGjBAApBlw==@lists.infradead.org
X-Gm-Message-State: AFuF++lFXKJgdKcuV8z7yK+yiRVQMnHTwXl2HFhDnCcvOpdgHcKi/cm4
	XNmOPI44IeyvWaPT8Hds4okx+4ZOfPRKPWcAYnmlUWSQs6Vzbj/9abLz8wt6itYOZWSTLIhq3g0
	mS/gS3Lsj16I2/m1EC6jGBXetj9fnytg=
X-Gm-Gg: AYBFou0stbmwIyXgWRA6Wlxisj2feM0BdBVAod2uNJHKE2VqgBkd5IWWwk82OUrffzy
	z7/NGZkWpVblpIBnE5SIIwBKPTcnYXnydyZD601eWY4heqJ42m8e5I68JfFPD3327IQenokPkBQ
	eYflJUzmfKt9ZBrlnwgLxayDC9aOsKy0ugFEPmSTBjxiNBMltoAaX926IOJxOpKpaCt+eZlH0xt
	krqX38FDckWXFd0LJzj8uswYSJfp4ptTxaRfQ505qasD4QzHQMBeblCbuhYE/jntZuRi8HxAOe/
	c6mt9vDD8E4JvHkCdU0YCF9kY+fKTZAy5xhM5AIvnMqmCkWngmfhz2uZ
X-Received: by 2002:a05:6a00:2da0:b0:880:5a44:9367 with SMTP id
 d2e1a72fcca58-8874a69ec71mr2480685b3a.30.1790817953484; Wed, 30 Sep 2026
 18:25:53 -0700 (PDT)
MIME-Version: 1.0
References: <20261001003501.2425492-1-lucid_duck@justthetip.ca>
In-Reply-To: <20261001003501.2425492-1-lucid_duck@justthetip.ca>
From: Chris <hoopyfrood42@gmail.com>
Date: Wed, 30 Sep 2026 21:25:41 -0400
X-Gm-Features: AclHuK8_KWE1UfLVbGLDncG3ZFM4xVbCeQcbtCCHGsIVNzIJFDtLu7YJF8SsscU
Message-ID: <CAHaeJsSaqTJZ+Os-fxGq-g=wH7842n3Kt-_hmohdwN8qUwijiQ@mail.gmail.com>
Subject: Re: [PATCH wireless v2] wifi: mt76: move the channel survey when the
 channel changes
To: Devin Wittmayer <lucid_duck@justthetip.ca>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Deren Wu <deren.wu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_182555_189909_B364A09F 
X-CRM114-Status: GOOD (  24.75  )
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

On Wed, Sep 30, 2026 at 8:35=E2=80=AFPM Devin Wittmayer
<lucid_duck@justthetip.ca> wrote:
>
> mt7921 and mt7925 report every survey counter against one channel and
> never mark the one in use. Both use channel contexts, so the code that
> moves the survey never runs.
>
> Move it when a context is assigned or changed, after booking the time
> spent on the old channel.
>
> Tested on MT7922 over PCIe, MT7921AU and MT7925 over USB.
>
> Fixes: 41ac53c899bd ("wifi: mt76: mt7921: introduce chanctx support")
> Cc: stable@vger.kernel.org
> Reported-by: Chris <hoopyfrood42@gmail.com>
> Closes: https://lore.kernel.org/linux-wireless/CAHaeJsT8O8Nhq351hFp3NAL8e=
0iU85N-LBdYZ9nYHFHVy7t_hQ@mail.gmail.com/
>
> Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
> ---
> v2: aim it at the wireless tree and tag it for stable. No code change.
>
>  drivers/net/wireless/mediatek/mt76/mac80211.c   | 17 +++++++++++++++++
>  drivers/net/wireless/mediatek/mt76/mt76.h       |  2 ++
>  .../net/wireless/mediatek/mt76/mt7921/main.c    |  1 +
>  .../net/wireless/mediatek/mt76/mt7925/main.c    |  2 ++
>  .../net/wireless/mediatek/mt76/mt792x_core.c    |  1 +
>  5 files changed, 23 insertions(+)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/=
wireless/mediatek/mt76/mac80211.c
> index abbe65cbcd89..fdfdb324ab98 100644
> --- a/drivers/net/wireless/mediatek/mt76/mac80211.c
> +++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
> @@ -1045,6 +1045,23 @@ void mt76_update_survey(struct mt76_phy *phy)
>  }
>  EXPORT_SYMBOL_GPL(mt76_update_survey);
>
> +/* For drivers that retune without __mt76_set_channel(): book the time s=
pent
> + * on the old channel before moving the survey to the new one.
> + */
> +void mt76_set_survey_channel(struct mt76_phy *phy,
> +                            struct cfg80211_chan_def *chandef)
> +{
> +       if (!chandef->chan)
> +               return;
> +
> +       mt76_update_survey(phy);
> +
> +       phy->chandef =3D *chandef;
> +       phy->main_chandef =3D *chandef;
> +       phy->chan_state =3D mt76_channel_state(phy, chandef->chan);
> +}
> +EXPORT_SYMBOL_GPL(mt76_set_survey_channel);
> +
>  int __mt76_set_channel(struct mt76_phy *phy, struct cfg80211_chan_def *c=
handef,
>                        bool offchannel)
>  {
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wire=
less/mediatek/mt76/mt76.h
> index 62b41c8bb7c0..2cbe9884ab46 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> @@ -1548,6 +1548,8 @@ void mt76_sta_ps_transition(struct mt76_dev *dev, s=
truct mt76_wcid *wcid,
>  bool mt76_has_tx_pending(struct mt76_phy *phy);
>  int mt76_update_channel(struct mt76_phy *phy);
>  void mt76_update_survey(struct mt76_phy *phy);
> +void mt76_set_survey_channel(struct mt76_phy *phy,
> +                            struct cfg80211_chan_def *chandef);
>  void mt76_update_survey_active_time(struct mt76_phy *phy, ktime_t time);
>  int mt76_get_survey(struct ieee80211_hw *hw, int idx,
>                     struct survey_info *survey);
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/main.c
> index 68a059504e83..915d6789c668 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> @@ -1423,6 +1423,7 @@ mt7921_change_chanctx(struct ieee80211_hw *hw,
>         } else {
>                 mt76_connac_mcu_uni_set_chctx(mvif->phy->mt76, &mvif->bss=
_conf.mt76, ctx);
>         }
> +       mt76_set_survey_channel(mvif->phy->mt76, &ctx->def);
>         mt792x_mutex_release(phy->dev);
>  }
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7925/main.c
> index 5993b31e1aae..e21bd79dcc56 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
> @@ -2063,6 +2063,7 @@ mt7925_change_chanctx(struct ieee80211_hw *hw,
>                                                       link_conf, ctx);
>                 }
>         }
> +       mt76_set_survey_channel(mvif->phy->mt76, &ctx->def);
>
>         mt792x_mutex_release(phy->dev);
>  }
> @@ -2399,6 +2400,7 @@ static int mt7925_assign_vif_chanctx(struct ieee802=
11_hw *hw,
>
>         mconf->mt76.ctx =3D ctx;
>         mctx->bss_conf =3D mconf;
> +       mt76_set_survey_channel(mvif->phy->mt76, &ctx->def);
>         mutex_unlock(&dev->mt76.mutex);
>
>         return 0;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/n=
et/wireless/mediatek/mt76/mt792x_core.c
> index 0ad33f74c228..6a0d5b2c2d59 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
> @@ -472,6 +472,7 @@ int mt792x_assign_vif_chanctx(struct ieee80211_hw *hw=
,
>         mutex_lock(&dev->mt76.mutex);
>         mvif->bss_conf.mt76.ctx =3D ctx;
>         mctx->bss_conf =3D &mvif->bss_conf;
> +       mt76_set_survey_channel(&dev->mphy, &ctx->def);
>         mutex_unlock(&dev->mt76.mutex);
>
>         return 0;
> --
> 2.55.0
>

Tested on a Netgear A9000 (MT7925, USB 0846:9072) in monitor mode,
Ubuntu 7.0.0-34 with the patch backported (the mt7921 hunk needed
rebasing for the older brace-less if/else). Before: tuned to 2437 and
then 5180 MHz, every counter stayed on 5955 MHz and no channel was
marked in use. After: each of 2412/2437/2462/5180/5745/5955/6115 MHz
is "[in use]" while tuned, gets its own active time (~4.2 s per 4 s
dwell), keeps it when left and resumes on return.

The busy half of the report is unchanged: busy still grows by 0xADBEEF
=C2=B5s (11,386.6 ms) per update, now on the right channel. So the MIB busy
register read is still returning 0xDEADBEEF on this chip.

Tested-by: Chris hoopyfrood42@gmail.com

