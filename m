Return-Path: <SRS0=eP1B=K4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F19C4708F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 08:28:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 382FF613C1
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 08:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 382FF613C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QbseYWto6l3AYjikBMaOQcgeKxQ8yB26byoS88u7hZ8=; b=uX2e7b2upazQTgrKqIXucxrYgj
	ANbpawBrythYwwsZFP0bPkKBpdTVlvmG4/JvSfmMZbaJq5FZUdsY6QN18ItYhpf1zV/Y9oNF1uSbQ
	T0TgWYU11jzBjctyPOx4qK/yxI6oY/vW+nM4quNqe1aaPIxSTyzCYgoSCjuZZcl5vmov5CspEeXkb
	fsbiSieoirLzo74yw+bykESIdKtxG4661BiXUqlUlHYMiP5nlN6fNPSFerjKmoqPIJBXI60JjnZp2
	7O7982ABaWjeuYnoFEASepHnoq/dc7m5aqSxpzz6ijT/O7rsa/r8LeeTpjYKX2wx96kQyUo5KBurs
	68cSxqAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loMEi-002dxv-Jr; Wed, 02 Jun 2021 08:28:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loLXh-002OAS-PB
 for linux-mediatek@lists.infradead.org; Wed, 02 Jun 2021 07:43:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622619835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RDwUTuIN6Va5Ir6kHpHIpQs0Khzqpo2mQBkVU4vwErw=;
 b=R5ndE1JGDXx25f7IPApaPL6aMYwBhce+d42o7wNQ1uOBDKyReMt2wjK9VCNiMgn36ItYHz
 ZT/VHARuAtEzepwWU3Pxb8SsB4P7tUmTCW2RNqTVZm1epFVvhYe7chbfHSrOkf2u/4s0Y0
 jT6L3Yn4OLEaujTVj030GVW1AiIMEG0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-PtFRhGZhM4uoQwcyT4a2hg-1; Wed, 02 Jun 2021 03:43:50 -0400
X-MC-Unique: PtFRhGZhM4uoQwcyT4a2hg-1
Received: by mail-ej1-f70.google.com with SMTP id
 bw21-20020a170906c1d5b02903df8cbe09ccso359791ejb.11
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Jun 2021 00:43:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BgDFaMFbgw0Ep+PbF5AZPdpXKIQE0rXInbQbiv+/ZDI=;
 b=p5JwMW/+gpmBQQFUq4Y7X7WQaXE88kr2iJXrvqX+DHnTHCAYCMD5AbxzG+anq3mefT
 pjjgTuW8+ht9uxqToAxSFc2trBljUrO/neyZcYRvaWF1NQNso816otA4f+VK5MokheiT
 YIPFEWKDt1y0dezLBD8kO5LfNUqfFiXqkbJbAaFeC2GIfM4kUeAdXZgYbXj4+X9pocQn
 RWZLFJlaMTIMYMUhAB5nX67S3fMFF/Z5HdgONaXS6WuCobfZaMEY454LBVHgTY8OwDuw
 iSPthFVg8eE33EmiGRq7OhGdFWt9yGCK1fjFuzdBvm2Ft4+Ie+RRKIfhIm3/9MZvxMsr
 Od3Q==
X-Gm-Message-State: AOAM531+4DayHaHBhRJDvBxhQN9J33xYDomXyOUomHeKM1x8Zvn3GwIv
 zzHrpNT0T2H+Uz2lTFlP0xVUJwQ6TbSeYSiUPUWaWTAvhxCzLHW+gSdBDIxoco5+XeEcZ+euuVq
 4VNBjlYeXlg8UTb5DwwqKvzOo4hZ3UzlN
X-Received: by 2002:aa7:dc17:: with SMTP id b23mr36728452edu.359.1622619829327; 
 Wed, 02 Jun 2021 00:43:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAThPT+lyQPvjj+Q0U71Kf1uIO1RWWW1T1Lod3XjDeTYw9/4xTMlGHFJY30nBiK3/8ZbJnlQ==
X-Received: by 2002:aa7:dc17:: with SMTP id b23mr36728416edu.359.1622619829052; 
 Wed, 02 Jun 2021 00:43:49 -0700 (PDT)
Received: from localhost (net-93-71-117-34.cust.vodafonedsl.it. [93.71.117.34])
 by smtp.gmail.com with ESMTPSA id p9sm773529edh.61.2021.06.02.00.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 00:43:48 -0700 (PDT)
Date: Wed, 2 Jun 2021 09:43:45 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, Soul.Huang@mediatek.com, YN.Chen@mediatek.com,
 Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com,
 Deren.Wu@mediatek.com, km.lin@mediatek.com, robin.chiu@mediatek.com,
 ch.yeh@mediatek.com, posh.sun@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, jemele@google.com, yenlinlai@google.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/3] mt76: connac: add mt76_connac_mcu_update_sta_cmd
 support
Message-ID: <YLc2sWcgBT5sqgcm@lore-desk>
References: <db74f1c3acd2a2729066810ad72b656681a30693.1622610746.git.objelf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <db74f1c3acd2a2729066810ad72b656681a30693.1622610746.git.objelf@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_004358_049456_8A67E8B9 
X-CRM114-Status: GOOD (  22.51  )
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
Content-Type: multipart/mixed; boundary="===============1302608348000743727=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============1302608348000743727==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dwKDF4a27uR5qajW"
Content-Disposition: inline

--dwKDF4a27uR5qajW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> Add mt76_connac_mcu_update_sta_cmd support that is the prerequisite patch
> for we are able to update the station record with the current state the
> station has into the offload firmware at runtime.
>=20
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
> v1->v2: no change
> ---
>  .../net/wireless/mediatek/mt76/mt7615/mcu.c   |  6 ++--
>  .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 32 ++++++++++++++-----
>  .../wireless/mediatek/mt76/mt76_connac_mcu.h  | 16 ++++++++--
>  .../net/wireless/mediatek/mt76/mt7921/main.c  |  8 +++--
>  .../net/wireless/mediatek/mt76/mt7921/mcu.c   |  3 +-
>  .../wireless/mediatek/mt76/mt7921/mt7921.h    |  2 +-
>  6 files changed, 50 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7615/mcu.c
> index fc9cd8da2a11..3352c3559c09 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> @@ -1024,9 +1024,10 @@ mt7615_mcu_wtbl_sta_add(struct mt7615_phy *phy, st=
ruct ieee80211_vif *vif,
>  =09if (IS_ERR(sskb))
>  =09=09return PTR_ERR(sskb);
> =20
> -=09mt76_connac_mcu_sta_basic_tlv(sskb, vif, sta, enable);
> +=09mt76_connac_mcu_sta_basic_tlv(sskb, vif, sta, enable, true);
>  =09if (enable && sta)
> -=09=09mt76_connac_mcu_sta_tlv(phy->mt76, sskb, sta, vif, 0);
> +=09=09mt76_connac_mcu_sta_tlv(phy->mt76, sskb, sta, vif, 0,
> +=09=09=09=09=09MT76_STA_INFO_STATE_3);
> =20
>  =09wtbl_hdr =3D mt76_connac_mcu_alloc_wtbl_req(&dev->mt76, &msta->wcid,
>  =09=09=09=09=09=09  WTBL_RESET_AND_SET, NULL,
> @@ -1152,6 +1153,7 @@ __mt7615_mcu_add_sta(struct mt76_phy *phy, struct i=
eee80211_vif *vif,
>  =09=09.vif =3D vif,
>  =09=09.enable =3D enable,
>  =09=09.cmd =3D cmd,
> +=09=09.state =3D MT76_STA_INFO_STATE_3,

it seems to me this parameter is used only by mt7921, right? So we can drop
this chunk

>  =09};
> =20
>  =09info.wcid =3D sta ? (struct mt76_wcid *)sta->drv_priv : &mvif->sta.wc=
id;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drive=
rs/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> index 73359defa176..c49e4763fa4c 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> @@ -304,7 +304,7 @@ EXPORT_SYMBOL_GPL(mt76_connac_mcu_alloc_wtbl_req);
>  void mt76_connac_mcu_sta_basic_tlv(struct sk_buff *skb,
>  =09=09=09=09   struct ieee80211_vif *vif,
>  =09=09=09=09   struct ieee80211_sta *sta,
> -=09=09=09=09   bool enable)
> +=09=09=09=09   bool enable, bool newly)
>  {
>  =09struct sta_rec_basic *basic;
>  =09struct tlv *tlv;
> @@ -316,7 +316,8 @@ void mt76_connac_mcu_sta_basic_tlv(struct sk_buff *sk=
b,
>  =09basic->extra_info =3D cpu_to_le16(EXTRA_INFO_VER);
> =20
>  =09if (enable) {
> -=09=09basic->extra_info |=3D cpu_to_le16(EXTRA_INFO_NEW);
> +=09=09if (newly)
> +=09=09=09basic->extra_info |=3D cpu_to_le16(EXTRA_INFO_NEW);
>  =09=09basic->conn_state =3D CONN_STATE_PORT_SECURE;
>  =09} else {
>  =09=09basic->conn_state =3D CONN_STATE_DISCONNECT;
> @@ -709,7 +710,7 @@ mt76_connac_get_phy_mode_v2(struct mt76_phy *mphy, st=
ruct ieee80211_vif *vif,
>  void mt76_connac_mcu_sta_tlv(struct mt76_phy *mphy, struct sk_buff *skb,
>  =09=09=09     struct ieee80211_sta *sta,
>  =09=09=09     struct ieee80211_vif *vif,
> -=09=09=09     u8 rcpi)
> +=09=09=09     u8 rcpi, u8 sta_state)
>  {
>  =09struct cfg80211_chan_def *chandef =3D &mphy->chandef;
>  =09enum nl80211_band band =3D chandef->chan->band;
> @@ -770,7 +771,7 @@ void mt76_connac_mcu_sta_tlv(struct mt76_phy *mphy, s=
truct sk_buff *skb,
> =20
>  =09tlv =3D mt76_connac_mcu_add_tlv(skb, STA_REC_STATE, sizeof(*state));
>  =09state =3D (struct sta_rec_state *)tlv;
> -=09state->state =3D 2;
> +=09state->state =3D sta_state;
> =20
>  =09if (sta->vht_cap.vht_supported) {
>  =09=09state->vht_opmode =3D sta->bandwidth;
> @@ -862,8 +863,9 @@ void mt76_connac_mcu_wtbl_ht_tlv(struct mt76_dev *dev=
, struct sk_buff *skb,
>  }
>  EXPORT_SYMBOL_GPL(mt76_connac_mcu_wtbl_ht_tlv);
> =20
> -int mt76_connac_mcu_add_sta_cmd(struct mt76_phy *phy,
> -=09=09=09=09struct mt76_sta_cmd_info *info)
> +static int mt76_connac_mcu_sta_cmd(struct mt76_phy *phy,
> +=09=09=09=09   struct mt76_sta_cmd_info *info,
> +=09=09=09=09   bool newly)
>  {
>  =09struct mt76_vif *mvif =3D (struct mt76_vif *)info->vif->drv_priv;
>  =09struct mt76_dev *dev =3D phy->dev;
> @@ -875,10 +877,11 @@ int mt76_connac_mcu_add_sta_cmd(struct mt76_phy *ph=
y,
>  =09if (IS_ERR(skb))
>  =09=09return PTR_ERR(skb);
> =20
> -=09mt76_connac_mcu_sta_basic_tlv(skb, info->vif, info->sta, info->enable=
);
> +=09mt76_connac_mcu_sta_basic_tlv(skb, info->vif, info->sta, info->enable=
,
> +=09=09=09=09      newly);
>  =09if (info->enable && info->sta)
>  =09=09mt76_connac_mcu_sta_tlv(phy, skb, info->sta, info->vif,
> -=09=09=09=09=09info->rcpi);
> +=09=09=09=09=09info->rcpi, info->state);
> =20
>  =09sta_wtbl =3D mt76_connac_mcu_add_tlv(skb, STA_REC_WTBL,
>  =09=09=09=09=09   sizeof(struct tlv));
> @@ -902,8 +905,21 @@ int mt76_connac_mcu_add_sta_cmd(struct mt76_phy *phy=
,
> =20
>  =09return mt76_mcu_skb_send_msg(dev, skb, info->cmd, true);
>  }
> +
> +int mt76_connac_mcu_add_sta_cmd(struct mt76_phy *phy,
> +=09=09=09=09struct mt76_sta_cmd_info *info)
> +{
> +=09return mt76_connac_mcu_sta_cmd(phy, info, true);
> +}
>  EXPORT_SYMBOL_GPL(mt76_connac_mcu_add_sta_cmd);
> =20
> +int mt76_connac_mcu_update_sta_cmd(struct mt76_phy *phy,
> +=09=09=09=09   struct mt76_sta_cmd_info *info)
> +{
> +=09return mt76_connac_mcu_sta_cmd(phy, info, false);
> +}
> +EXPORT_SYMBOL_GPL(mt76_connac_mcu_update_sta_cmd);

Do we really need these 2 routines? Maybe better to have them static inline=
 in
mt76_connac_mcu.h

> +
>  void mt76_connac_mcu_wtbl_ba_tlv(struct mt76_dev *dev, struct sk_buff *s=
kb,
>  =09=09=09=09 struct ieee80211_ampdu_params *params,
>  =09=09=09=09 bool enable, bool tx, void *sta_wtbl,
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drive=
rs/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> index d64b8058b744..6666507f43ed 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> @@ -902,6 +902,14 @@ struct mt76_connac_suspend_tlv {
>  =09u8 pad[5];
>  } __packed;
> =20
> + /* 0: state 1 - unauthenticated & unassociated
> +  * 1: state 2 - authenticated & unassociated
> +  * 2: state 3 - authenticated & associated
> +  */
> +#define MT76_STA_INFO_STATE_1=090
> +#define MT76_STA_INFO_STATE_2=091
> +#define MT76_STA_INFO_STATE_3=092
> +
>  struct mt76_sta_cmd_info {
>  =09struct ieee80211_sta *sta;
>  =09struct mt76_wcid *wcid;
> @@ -911,6 +919,7 @@ struct mt76_sta_cmd_info {
>  =09bool enable;
>  =09int cmd;
>  =09u8 rcpi;
> +=09u8 state;
>  };
> =20
>  #define MT_SKU_POWER_LIMIT=09161
> @@ -980,7 +989,8 @@ int mt76_connac_mcu_set_channel_domain(struct mt76_ph=
y *phy);
>  int mt76_connac_mcu_set_vif_ps(struct mt76_dev *dev, struct ieee80211_vi=
f *vif);
>  void mt76_connac_mcu_sta_basic_tlv(struct sk_buff *skb,
>  =09=09=09=09   struct ieee80211_vif *vif,
> -=09=09=09=09   struct ieee80211_sta *sta, bool enable);
> +=09=09=09=09   struct ieee80211_sta *sta, bool enable,
> +=09=09=09=09   bool newly);
>  void mt76_connac_mcu_wtbl_generic_tlv(struct mt76_dev *dev, struct sk_bu=
ff *skb,
>  =09=09=09=09      struct ieee80211_vif *vif,
>  =09=09=09=09      struct ieee80211_sta *sta, void *sta_wtbl,
> @@ -995,7 +1005,7 @@ int mt76_connac_mcu_sta_update_hdr_trans(struct mt76=
_dev *dev,
>  void mt76_connac_mcu_sta_tlv(struct mt76_phy *mphy, struct sk_buff *skb,
>  =09=09=09     struct ieee80211_sta *sta,
>  =09=09=09     struct ieee80211_vif *vif,
> -=09=09=09     u8 rcpi);
> +=09=09=09     u8 rcpi, u8 state);
>  void mt76_connac_mcu_wtbl_ht_tlv(struct mt76_dev *dev, struct sk_buff *s=
kb,
>  =09=09=09=09 struct ieee80211_sta *sta, void *sta_wtbl,
>  =09=09=09=09 void *wtbl_tlv);
> @@ -1019,6 +1029,8 @@ int mt76_connac_mcu_uni_add_bss(struct mt76_phy *ph=
y,
>  =09=09=09=09bool enable);
>  int mt76_connac_mcu_add_sta_cmd(struct mt76_phy *phy,
>  =09=09=09=09struct mt76_sta_cmd_info *info);
> +int mt76_connac_mcu_update_sta_cmd(struct mt76_phy *phy,
> +=09=09=09=09   struct mt76_sta_cmd_info *info);
>  void mt76_connac_mcu_beacon_loss_iter(void *priv, u8 *mac,
>  =09=09=09=09      struct ieee80211_vif *vif);
>  int mt76_connac_mcu_set_rts_thresh(struct mt76_dev *dev, u32 val, u8 ban=
d);
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/main.c
> index 472afd4ea487..ece0cecf049d 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> @@ -570,7 +570,8 @@ static void mt7921_bss_info_changed(struct ieee80211_=
hw *hw,
>  =09=09mt7921_mcu_uni_bss_ps(dev, vif);
> =20
>  =09if (changed & BSS_CHANGED_ASSOC) {
> -=09=09mt7921_mcu_sta_add(dev, NULL, vif, true);
> +=09=09mt7921_mcu_sta_add(dev, NULL, vif, true,
> +=09=09=09=09   MT76_STA_INFO_STATE_3);
>  =09=09mt7921_bss_bcnft_apply(dev, vif, info->assoc);
>  =09}
> =20
> @@ -616,7 +617,8 @@ int mt7921_mac_sta_add(struct mt76_dev *mdev, struct =
ieee80211_vif *vif,
>  =09mt7921_mac_wtbl_update(dev, idx,
>  =09=09=09       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
> =20
> -=09ret =3D mt7921_mcu_sta_add(dev, sta, vif, true);
> +=09ret =3D mt7921_mcu_sta_add(dev, sta, vif, true,
> +=09=09=09=09 MT76_STA_INFO_STATE_3);
>  =09if (ret)
>  =09=09return ret;
> =20
> @@ -634,7 +636,7 @@ void mt7921_mac_sta_remove(struct mt76_dev *mdev, str=
uct ieee80211_vif *vif,
>  =09mt76_connac_free_pending_tx_skbs(&dev->pm, &msta->wcid);
>  =09mt76_connac_pm_wake(&dev->mphy, &dev->pm);
> =20
> -=09mt7921_mcu_sta_add(dev, sta, vif, false);
> +=09mt7921_mcu_sta_add(dev, sta, vif, false, MT76_STA_INFO_STATE_1);
>  =09mt7921_mac_wtbl_update(dev, msta->wcid.idx,
>  =09=09=09       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
> =20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/mcu.c
> index 4c97c5bdbf86..631f408520c9 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> @@ -1322,7 +1322,7 @@ int mt7921_mcu_set_bss_pm(struct mt7921_dev *dev, s=
truct ieee80211_vif *vif,
>  }
> =20
>  int mt7921_mcu_sta_add(struct mt7921_dev *dev, struct ieee80211_sta *sta=
,
> -=09=09       struct ieee80211_vif *vif, bool enable)
> +=09=09       struct ieee80211_vif *vif, bool enable, u8 state)
>  {
>  =09struct mt7921_vif *mvif =3D (struct mt7921_vif *)vif->drv_priv;
>  =09int rssi =3D -ewma_rssi_read(&mvif->rssi);
> @@ -1330,6 +1330,7 @@ int mt7921_mcu_sta_add(struct mt7921_dev *dev, stru=
ct ieee80211_sta *sta,
>  =09=09.sta =3D sta,
>  =09=09.vif =3D vif,
>  =09=09.enable =3D enable,
> +=09=09.state =3D state,
>  =09=09.cmd =3D MCU_UNI_CMD_STA_REC_UPDATE,
>  =09=09.rcpi =3D to_rcpi(rssi),
>  =09};
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers=
/net/wireless/mediatek/mt76/mt7921/mt7921.h
> index a9b21fcc321c..694f85e52222 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> @@ -261,7 +261,7 @@ int mt7921_mcu_add_key(struct mt7921_dev *dev, struct=
 ieee80211_vif *vif,
>  =09=09       enum set_key_cmd cmd);
>  int mt7921_set_channel(struct mt7921_phy *phy);
>  int mt7921_mcu_sta_add(struct mt7921_dev *dev, struct ieee80211_sta *sta=
,
> -=09=09       struct ieee80211_vif *vif, bool enable);
> +=09=09       struct ieee80211_vif *vif, bool enable, u8 state);

enum here

Regards,
Lorenzo

>  int mt7921_mcu_set_chan_info(struct mt7921_phy *phy, int cmd);
>  int mt7921_mcu_set_tx(struct mt7921_dev *dev, struct ieee80211_vif *vif)=
;
>  int mt7921_mcu_set_eeprom(struct mt7921_dev *dev);
> --=20
> 2.25.1
>=20

--dwKDF4a27uR5qajW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYLc2rAAKCRA6cBh0uS2t
rIAyAP4wEWTZIjJ16s4nDBVu0owakLjAfrWDZ/PkKSxH7BzedgEA7YMHB7mnB0uQ
vhsi5XJCmtqlqn7iPTR5C05Ag2zFKw4=
=X6q6
-----END PGP SIGNATURE-----

--dwKDF4a27uR5qajW--



--===============1302608348000743727==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1302608348000743727==--


