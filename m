Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E010C001DE
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jul 2023 03:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G8Uw0vNKZE+GaqfQjiuOZc6ei5jBk5/DQtpVKaxsbKU=; b=wzykJAA+Ud3uNoeZ/w949ze5Di
	4dCzk8tfPuPAKUqmUQwy+A3VltOZKfYqUwYUnpAfvhAwxiV7L3ZxvK2BoNAiBI1adGIbAwgBI8rif
	NnTBpqyTaOY3gfz8SDGHR+kgx8j9ceeTIKnjRSwc0c0ISq8jl4V7LYSojWhZMNaeDusaQAAXOUlNQ
	tRmRt65JB7UgZvJkv+uDFuGUxv+2bRZIUWVAppRvHEufjVPa0pefT4DhL4iwgWQyDag9kwyWBzpD/
	Bx0oqQbdLjgMvsYQXsn5SH+34DYF9mMKN804hpqOAyIPIUGQJl+Cg+Bs/xGJgPyTVyYzaZkkUSzGR
	BsCq4q4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOrsp-00C2Hx-01;
	Thu, 27 Jul 2023 03:41:47 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOrsl-00C2Gx-2B
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Jul 2023 03:41:45 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-403a7066bc8so3109091cf.0
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Jul 2023 20:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690429299; x=1691034099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8Uw0vNKZE+GaqfQjiuOZc6ei5jBk5/DQtpVKaxsbKU=;
        b=RrrbR9txvZIVR9wVUunpxqqB7I4Mog+KLqZ3aJYwYz4JSZCgVFulSeYzjeYSOJgKCs
         78cqBkWHnnorU5tGbuYC+K4R3lI91JfAkB8eB4ppPqz9xZkfUVWUZxxeVerhMreaYLwR
         oMBW4LVrfb5KruWTVDWQf8Wkl4VJVorC4elC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690429299; x=1691034099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G8Uw0vNKZE+GaqfQjiuOZc6ei5jBk5/DQtpVKaxsbKU=;
        b=DWEVvvDaOOfdx91JNbCji0tMMaWyPKLDf2n8+rXQI31MNW29bCX1S5biM2i3AzirVh
         /o4Y6jncqNtgOVOj9BIApujVzIj+e1WALjaASdQmglC2XOOljr3fS2JdSOzDiQIuia6U
         B0lSWatD5a3tGCmMCtU/b0Bg042P3+xRzpiIkkwQQQaY5+7an1MrCj9FXAgj9B0UArUv
         G4mg0VIQGBtNjmS2hJ6tZB7jpMRieTMWURBBYJsv3i5h8Jq+PiAgocM5p7Mfqj5ESXvW
         Vvn+ET9VqFYcOWykL+awpoysO6A9YkaWgIW0yS57siH/EKlHUFMwGzrOX5PGkYTLGBnE
         xWmA==
X-Gm-Message-State: ABy/qLYIoEUMuI1YNf8hklSmSpuBUEmfU2cPag9BIvxWUadseCd9onZi
	itJNRUmBaOUYDFojV/+/xycdJB4ZcdpkePM7S8R9xngE
X-Google-Smtp-Source: APBJJlEKhIhiz7ZKvxli7u5VRVz/IwThytvyZO9KhAVvoEA2TWeViONHuw1VbTVIts8AJg7KeXJxcg==
X-Received: by 2002:a05:622a:48d:b0:403:f659:d49a with SMTP id p13-20020a05622a048d00b00403f659d49amr4299871qtx.66.1690429298988;
        Wed, 26 Jul 2023 20:41:38 -0700 (PDT)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com. [209.85.222.175])
        by smtp.gmail.com with ESMTPSA id l22-20020ac87256000000b00403eab8b7cesm152653qtp.16.2023.07.26.20.41.38
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 20:41:38 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-76754b9eac0so47247685a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Jul 2023 20:41:38 -0700 (PDT)
X-Received: by 2002:a1f:5e43:0:b0:481:68cc:751 with SMTP id
 s64-20020a1f5e43000000b0048168cc0751mr648348vkb.13.1690429278247; Wed, 26 Jul
 2023 20:41:18 -0700 (PDT)
MIME-Version: 1.0
References: <8fd42ac8e1c97246f6e65225a14fc8a029ac3aaa.1690232804.git.objelf@gmail.com>
In-Reply-To: <8fd42ac8e1c97246f6e65225a14fc8a029ac3aaa.1690232804.git.objelf@gmail.com>
From: David Ruth <druth@chromium.org>
Date: Wed, 26 Jul 2023 23:40:41 -0400
X-Gmail-Original-Message-ID: <CAKHmtrQOouchFx03NRTexru7+zh+MnvAvdRrx5Qz8Jn0EVkZ8A@mail.gmail.com>
Message-ID: <CAKHmtrQOouchFx03NRTexru7+zh+MnvAvdRrx5Qz8Jn0EVkZ8A@mail.gmail.com>
Subject: Re: [PATCH 1/2] wifi: mt76: move struct ieee80211_chanctx_conf up to
 struct mt76_vif
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, lorenzo.bianconi@redhat.com, Soul.Huang@mediatek.com, 
	Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, 
	km.lin@mediatek.com, jenhao.yang@mediatek.com, robin.chiu@mediatek.com, 
	Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, ted.huang@mediatek.com, 
	Stella.Chang@mediatek.com, Tom.Chou@mediatek.com, jsiuda@google.com, 
	arowa@google.org, frankgor@google.com, kuabhs@google.com, 
	abhishekpandit@google.com, shawnku@google.com, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_204143_759396_8FF0CF1E 
X-CRM114-Status: GOOD (  19.14  )
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

Reviewed-by: David Ruth <druth@chromium.org>
Tested-by: David Ruth <druth@chromium.org>


On Mon, Jul 24, 2023 at 5:20=E2=80=AFPM <sean.wang@mediatek.com> wrote:
>
> From: Sean Wang <sean.wang@mediatek.com>
>
> Move struct ieee80211_chanctx_conf up to struct mt76_vif to allow the
> connac2 library can access the struct ieee80211_chanctx_conf * member in
> struct mt76_vif.
>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt76.h        |  1 +
>  drivers/net/wireless/mediatek/mt76/mt7921/main.c | 16 ++++++++--------
>  .../net/wireless/mediatek/mt76/mt7921/mt7921.h   |  1 -
>  3 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wire=
less/mediatek/mt76/mt76.h
> index 878087257ea7..bf9c781ff48c 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> @@ -708,6 +708,7 @@ struct mt76_vif {
>         u8 basic_rates_idx;
>         u8 mcast_rates_idx;
>         u8 beacon_rates_idx;
> +       struct ieee80211_chanctx_conf *ctx;
>  };
>
>  struct mt76_phy {
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/main.c
> index 87067ac367eb..8987173a83f2 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> @@ -804,7 +804,7 @@ void mt7921_mac_sta_assoc(struct mt76_dev *mdev, stru=
ct ieee80211_vif *vif,
>
>         if (vif->type =3D=3D NL80211_IFTYPE_STATION && !sta->tdls)
>                 mt76_connac_mcu_uni_add_bss(&dev->mphy, vif, &mvif->sta.w=
cid,
> -                                           true, mvif->ctx);
> +                                           true, mvif->mt76.ctx);
>
>         ewma_avg_signal_init(&msta->avg_ack_signal);
>
> @@ -839,7 +839,7 @@ void mt7921_mac_sta_remove(struct mt76_dev *mdev, str=
uct ieee80211_vif *vif,
>                 if (!sta->tdls)
>                         mt76_connac_mcu_uni_add_bss(&dev->mphy, vif,
>                                                     &mvif->sta.wcid, fals=
e,
> -                                                   mvif->ctx);
> +                                                   mvif->mt76.ctx);
>         }
>
>         spin_lock_bh(&dev->mt76.sta_poll_lock);
> @@ -1638,7 +1638,7 @@ mt7921_start_ap(struct ieee80211_hw *hw, struct iee=
e80211_vif *vif,
>         mt7921_mutex_acquire(dev);
>
>         err =3D mt76_connac_mcu_uni_add_bss(phy->mt76, vif, &mvif->sta.wc=
id,
> -                                         true, mvif->ctx);
> +                                         true, mvif->mt76.ctx);
>         if (err)
>                 goto out;
>
> @@ -1670,7 +1670,7 @@ mt7921_stop_ap(struct ieee80211_hw *hw, struct ieee=
80211_vif *vif,
>                 goto out;
>
>         mt76_connac_mcu_uni_add_bss(phy->mt76, vif, &mvif->sta.wcid, fals=
e,
> -                                   mvif->ctx);
> +                                   mvif->mt76.ctx);
>
>  out:
>         mt7921_mutex_release(dev);
> @@ -1695,7 +1695,7 @@ static void mt7921_ctx_iter(void *priv, u8 *mac,
>         struct mt7921_vif *mvif =3D (struct mt7921_vif *)vif->drv_priv;
>         struct ieee80211_chanctx_conf *ctx =3D priv;
>
> -       if (ctx !=3D mvif->ctx)
> +       if (ctx !=3D mvif->mt76.ctx)
>                 return;
>
>         if (vif->type =3D=3D NL80211_IFTYPE_MONITOR)
> @@ -1728,7 +1728,7 @@ mt7921_assign_vif_chanctx(struct ieee80211_hw *hw,
>         struct mt7921_dev *dev =3D mt7921_hw_dev(hw);
>
>         mutex_lock(&dev->mt76.mutex);
> -       mvif->ctx =3D ctx;
> +       mvif->mt76.ctx =3D ctx;
>         mutex_unlock(&dev->mt76.mutex);
>
>         return 0;
> @@ -1744,7 +1744,7 @@ mt7921_unassign_vif_chanctx(struct ieee80211_hw *hw=
,
>         struct mt7921_dev *dev =3D mt7921_hw_dev(hw);
>
>         mutex_lock(&dev->mt76.mutex);
> -       mvif->ctx =3D NULL;
> +       mvif->mt76.ctx =3D NULL;
>         mutex_unlock(&dev->mt76.mutex);
>  }
>
> @@ -1758,7 +1758,7 @@ static void mt7921_mgd_prepare_tx(struct ieee80211_=
hw *hw,
>                        jiffies_to_msecs(HZ);
>
>         mt7921_mutex_acquire(dev);
> -       mt7921_set_roc(mvif->phy, mvif, mvif->ctx->def.chan, duration,
> +       mt7921_set_roc(mvif->phy, mvif, mvif->mt76.ctx->def.chan, duratio=
n,
>                        MT7921_ROC_REQ_JOIN);
>         mt7921_mutex_release(dev);
>  }
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers=
/net/wireless/mediatek/mt76/mt7921/mt7921.h
> index ec9879650174..04a9ce50cff2 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> @@ -173,7 +173,6 @@ struct mt7921_vif {
>         struct ewma_rssi rssi;
>
>         struct ieee80211_tx_queue_params queue_params[IEEE80211_NUM_ACS];
> -       struct ieee80211_chanctx_conf *ctx;
>  };
>
>  enum {
> --
> 2.25.1
>

