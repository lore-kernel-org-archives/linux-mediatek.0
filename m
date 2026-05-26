Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F75BCD5BD5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 May 2026 21:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vofwtLagvBRYkOYwKOjHnTeC6C87g7YP3KZhbzyhI3Q=; b=HegL6ss0L/T79vivlOrxorJSx1
	sijzKbRnXYSGUYljzuYgvdiuV1nCIhFbtBakMzQ0a7AwGXbCVRGXclCT1MRP/tHzWLBluk//oGOgs
	IEb2u0bo6GPrsNHX+dGoVu3PDeq59ZCPEbS+kUcIcxaNBJuWm+WmoPupCaIjbhyTVbEpxC2bCDBO2
	lPe8nE6X4uOsENBFpy7ML+pa0PF7M4rc0Gki5eVKaEBeobcbP9qStocmN0eUnQhIonWDidmygkUVB
	meAqrb/IlBANzSn+E9q7Sg2nOSfuXKa8J3m8VLwmqpLFJFXSf0sZj+yjKALzSZYLkeofXc1s43K5E
	SS2i29ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRzhg-0000000301z-45uo;
	Tue, 26 May 2026 21:52:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRzhe-0000000300z-3ifY
	for linux-mediatek@lists.infradead.org;
	Tue, 26 May 2026 21:52:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 052BE443F8
	for <linux-mediatek@lists.infradead.org>; Tue, 26 May 2026 21:52:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E15181F00ADF
	for <linux-mediatek@lists.infradead.org>; Tue, 26 May 2026 21:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779832365;
	bh=vofwtLagvBRYkOYwKOjHnTeC6C87g7YP3KZhbzyhI3Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JvySodVWkZ4MM3tRJ8YS99NO8G7r2QGWchQgjJs/N+v4T2fakaO4nQDdnRKzeIqTT
	 twW0FxpXffz7ntaZsc3O/ISWeFOfVsNb/x05burAQaCV9x0p4/oCBx+unOrZNDKiKH
	 l9eEs/xvzHk7ZO9LGKRzD+wyhYk/qRZhK5KF4wg+jKuzkyANdqT3/0CZ70KJQmgnhs
	 zZQSlPOBMLaWKn7O7IGnTpnQLYT/fNAPwTGi9bD8J0K1DlMF127mpbMjHwpWu/C29v
	 j8kQ4+Ada+sfRBKhvdrHvYOoaCl3yhfcJa5ke+GxzVVmXHgt06pmnxndTucORDzD0u
	 JP8bxaosMVwHg==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38ea6a5a0b3so88879891fa.3
        for <linux-mediatek@lists.infradead.org>; Tue, 26 May 2026 14:52:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/zwrnL7QqF27998NFAZLcFkE5xIS7dXhPr0kVhLK8dgIUNdCQgpNkufbooIv0grJrhZmlHd/7HarS3ku0ZPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzF4QfBRWzz+rerr8fIB8pHm/bxzkWm+B4oEseXF7CyqkiIVEle
	RjtmH71sn4pTlhZ14QrCCuNfHs68dAt+G3rYOcgSAh1b2jlMsEJ8NeweLNBUVC2pfColq3h0VWf
	eBBNlPXPE+J/ggVK1GAZkbet0ouW0hHU=
X-Received: by 2002:a2e:8192:0:b0:394:2b8a:2374 with SMTP id
 38308e7fff4ca-395d8d3de65mr47969431fa.16.1779832364145; Tue, 26 May 2026
 14:52:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260526060841.49161-1-liujiajia@kylinos.cn>
In-Reply-To: <20260526060841.49161-1-liujiajia@kylinos.cn>
From: Sean Wang <sean.wang@kernel.org>
Date: Tue, 26 May 2026 16:52:32 -0500
X-Gmail-Original-Message-ID: <CAGp9LzqzddmyDHMNsaqigYpVEdo_Pmzwbeh5Ri5_Gr87cVL6Dg@mail.gmail.com>
X-Gm-Features: AVHnY4JN4XiSX6iZ8nQKBZrwSnhXgkTYMQMdyt2mZqBTxzISywSnHzHgBHOFEuo
Message-ID: <CAGp9LzqzddmyDHMNsaqigYpVEdo_Pmzwbeh5Ri5_Gr87cVL6Dg@mail.gmail.com>
Subject: Re: [PATCH] wifi: mt76: mt7925: add wcid publish check in mt76_sta_add
To: Jiajia Liu <liujiajia@kylinos.cn>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, Michael Lo <michael.lo@mediatek.com>, 
	Leon Yen <leon.yen@mediatek.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_145246_960829_AF72554F 
X-CRM114-Status: GOOD (  24.61  )
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

Hi,

On Tue, May 26, 2026 at 1:09=E2=80=AFAM Jiajia Liu <liujiajia@kylinos.cn> w=
rote:
>
> Since mt7925_mac_sta_add publishes wcid, add publish check in mt76_sta_ad=
d
> to avoid reinitializing the wcid->poll_list for mt7925.
>
> Found dev->sta_poll_list corruption when using mt7925 and 7.0-rc4.
> According to the corruption information, prev->next was changed to itself=
.
>
> wlan0: disconnect from AP 90:fb:5d:94:8b:e3 for new auth to 90:fb:5d:94:8=
b:e2
> wlan0: authenticate with 90:fb:5d:94:8b:e2 (local address=3D84:9e:56:9c:7=
e:6b)
> wlan0: send auth to 90:fb:5d:94:8b:e2 (try 1/3)
>  slab kmalloc-8k start ffff8c80958a6000 pointer offset 4160 size 8192
> list_add corruption. prev->next should be next (ffff8c808a7488f8), but wa=
s ffff8c80958a7040. (prev=3Dffff8c80958a7040).
>
>  mt76_wcid_add_poll+0x95/0xd0 [mt76]
>  mt7925_mac_add_txs.part.0+0xa5/0xe0 [mt7925_common]
>  mt7925_rx_check+0xa7/0xc0 [mt7925_common]
>  mt76_dma_rx_poll+0x50d/0x790 [mt76]
>  mt792x_poll_rx+0x52/0xe0 [mt792x_lib]
>
> Signed-off-by: Jiajia Liu <liujiajia@kylinos.cn>
> ---
>
> Reproduced and tested using the script below over ssh. Roam between two
> bssids with the same SSID on a router.
>
> #!/bin/bash
>
> set -ex
>
> while :; do
>         num=3D$(sudo iw wlan0 scan | grep Polaris | wc -l)
>         if [ $num -eq 2 ]; then
>                 break
>         fi
> done
>
> for i in $(seq 1 500); do
>
> echo "index $i"
> wpa_cli -i wlan0 roam 90:fb:5d:94:8b:e3
> sleep 5
> wpa_cli -i wlan0 roam 90:fb:5d:94:8b:e2
> sleep 5
>
> done
>
> ---
>  drivers/net/wireless/mediatek/mt76/mac80211.c    | 11 ++++++++---
>  drivers/net/wireless/mediatek/mt76/mt76.h        |  1 +
>  drivers/net/wireless/mediatek/mt76/mt7925/main.c |  3 +++
>  3 files changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/=
wireless/mediatek/mt76/mac80211.c
> index 4ae5e4715a9c..83f4f941b890 100644
> --- a/drivers/net/wireless/mediatek/mt76/mac80211.c
> +++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
> @@ -1595,11 +1595,16 @@ mt76_sta_add(struct mt76_phy *phy, struct ieee802=
11_vif *vif,
>                 mtxq->wcid =3D wcid->idx;
>         }
>
> -       ewma_signal_init(&wcid->rssi);
> -       rcu_assign_pointer(dev->wcid[wcid->idx], wcid);
> +       if (!test_bit(MT_WCID_FLAG_DRV_PUBLISH, &wcid->flags)) {
> +               ewma_signal_init(&wcid->rssi);
> +               rcu_assign_pointer(dev->wcid[wcid->idx], wcid);
> +               mt76_wcid_init(wcid, phy->band_idx);
> +       } else {
> +               wcid->phy_idx =3D phy->band_idx;
> +       }
> +
>         phy->num_sta++;
>

Thanks for spotting the roaming issue.

I think we can avoid adding MT_WCID_FLAG_DRV_PUBLISH and instead use the
WCID table itself for the publish check.

dev->wcid[] already encodes whether a WCID has been published, so checking
it directly avoids adding a second mirror state. MT_WCID_FLAG_* is also
better kept for WCID features that affect WTBL setup or data-path handling,
rather than common bookkeeping state.

Something like:

@@ -1620,6 +1620,7 @@ mt76_sta_add(struct mt76_phy *phy, struct
ieee80211_vif *vif,
{
  struct mt76_wcid *wcid =3D (struct mt76_wcid *)sta->drv_priv;
  struct mt76_dev *dev =3D phy->dev;
+       struct mt76_wcid *published;
  int ret;
  int i;

@@ -1639,7 +1640,10 @@ mt76_sta_add(struct mt76_phy *phy, struct
ieee80211_vif *vif,
          mtxq->wcid =3D wcid->idx;
  }

-       if (!test_bit(MT_WCID_FLAG_DRV_PUBLISH, &wcid->flags)) {
+       published =3D rcu_dereference_protected(dev->wcid[wcid->idx],
+                                             lockdep_is_held(&dev->mutex))=
;
+       if (published !=3D wcid) {
+               WARN_ON_ONCE(published);
                 ewma_signal_init(&wcid->rssi);
                 rcu_assign_pointer(dev->wcid[wcid->idx], wcid);
                 mt76_wcid_init(wcid, phy->band_idx);

   ....


> -       mt76_wcid_init(wcid, phy->band_idx);
>  out:
>         mutex_unlock(&dev->mutex);
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wire=
less/mediatek/mt76/mt76.h
> index 527bef97e122..8bfce686bff7 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> @@ -361,6 +361,7 @@ enum mt76_wcid_flags {
>         MT_WCID_FLAG_PS,
>         MT_WCID_FLAG_4ADDR,
>         MT_WCID_FLAG_HDR_TRANS,
> +       MT_WCID_FLAG_DRV_PUBLISH,
>  };
>
>  #define MT76_N_WCIDS 1088
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7925/main.c
> index 73d3722739d0..35b5c718475c 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
> @@ -1102,6 +1102,9 @@ int mt7925_mac_sta_add(struct mt76_dev *mdev, struc=
t ieee80211_vif *vif,
>                                               &msta->deflink);
>         }
>
> +       if (!err)
> +               set_bit(MT_WCID_FLAG_DRV_PUBLISH, &msta->deflink.wcid.fla=
gs);
> +
>         return err;
>  }
>  EXPORT_SYMBOL_GPL(mt7925_mac_sta_add);
> --
> 2.53.0
>
>

