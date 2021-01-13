Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE4B6C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 13:08:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84B3123432
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 13:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84B3123432
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=flZnNayK08ZZkuxsUeN64ixrHaekEJmzdbErDMFgWFQ=; b=d49fjaBWCS8vk+0SBscx0WIuG
	Dax5UkmQjonr8W+8Tdvw1cmr4SFUW45bJe3KlyN6mI/6acxicvt0Th0GjIO73MjLxYDZX7+9eiTUY
	gnw22ZejOeMJ1Q3VCYzwrzMkSruBf4aklgnpffcyxJQ36A5oehRORJFimFeWRNy5T6hwDrRt+ktDL
	QVc65xRMNC8zO8XnkXlr2CRIDGGjORL0kKBPd9SigDXJCtNuPJwbcfRu5lf0ebX8X4GfAdBdb3NAk
	3fDWM/Z5EZhDjpha+ze1vN5hsB+on4ooM58X4e/NTkVeEKtQsqLMoMH7Q+wFiDkLN8T1hV6c36r8J
	y15Y30XBw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzfsv-0004fO-DY; Wed, 13 Jan 2021 13:08:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzfsr-0004eQ-Bz
 for linux-mediatek@lists.infradead.org; Wed, 13 Jan 2021 13:08:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610543300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aefOhJkCPpYd17uP6u3PfhwTWMjjHF8BVz5rPEhzA0E=;
 b=XdexyNxwJdxn3sE9WfqedKHigJh1S6lxZQDtlDXZL++6+ifIt+5m4MusirVj2k/lBYTeno
 LTTow5tbaWghLP4pUIAWK86A+mHbC4phpq2hhAzgVI/Xiry+Bvx0Kc9xm1DWYEY7dMnBY5
 wvpxyzi0xkRbn5DAzHnJsBFXO2GRvLs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-KwVTXBDVN0STbKqKpSliYg-1; Wed, 13 Jan 2021 08:08:16 -0500
X-MC-Unique: KwVTXBDVN0STbKqKpSliYg-1
Received: by mail-wr1-f71.google.com with SMTP id o12so927432wrq.13
 for <linux-mediatek@lists.infradead.org>; Wed, 13 Jan 2021 05:08:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ibT6pwlsUyapZ6dqNBnG2IIiRlRe0J3FzEu7eLv3IhU=;
 b=cNZpFW0Q63Aqlqf59gVSZeVP/Y0Kw5uXaqypEc7lDXsxRpeJBZX8oEsB4Q3q9UBSII
 r+7LFh6hO2AYzg+JW3QEQhDt1ev6nHyh998Op17psvhe2dYISR73Una1hEWcNqb4XLNT
 WzlDjFfivV5hyL1CS1cGmu1QGctMf6BF5iIMPcizuVnuCP4fy5b0ohQGXWkI9fDpkVMt
 IAfnvQTCTz+FVsQC+yU7JcqmlwC2qltj2qE1ikbu/xvz+i1CQbtTf3orYlyuQGlRDdnl
 UQL6KkRrtZbrabR3AsseA/oPyqmm+A9Snu0Ur5M7gdGutreUm3/xlNCKRID/PCpl/1/C
 BbdQ==
X-Gm-Message-State: AOAM532UKK6yO+IS4Mw331PKyShfrJ052hV+kuv1uTnKvDxPMGLADUXq
 XTL53RC46qahX00qctc730IS1UQfVCOkj+eiQgJmEmiZbH1E/k7/kjhS6HreWOy3E8lzFXDTlNR
 XXRMuUXfdw1nh7E6A9vUENLHhgbHL6XLg
X-Received: by 2002:a5d:5917:: with SMTP id v23mr2660459wrd.308.1610543294949; 
 Wed, 13 Jan 2021 05:08:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcoyULwtxdbEK+dbA10k9oF8zoBvFpcFi32V+g8q8u4j/ybk7G0aerZXf4A82n1iOyaWozgQ==
X-Received: by 2002:a5d:5917:: with SMTP id v23mr2660447wrd.308.1610543294765; 
 Wed, 13 Jan 2021 05:08:14 -0800 (PST)
Received: from localhost ([151.66.42.92])
 by smtp.gmail.com with ESMTPSA id u83sm3009401wmu.12.2021.01.13.05.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 05:08:13 -0800 (PST)
Date: Wed, 13 Jan 2021 14:08:10 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: [PATCH 1/2] mt76: mt7915: simplify peer's TxBF capability check
Message-ID: <20210113130810.GA5528@lore-desk>
References: <287bbdb0193bd74069219b97199ba4ec72127bd8.1610539467.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <287bbdb0193bd74069219b97199ba4ec72127bd8.1610539467.git.ryder.lee@mediatek.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_080821_451523_20392193 
X-CRM114-Status: GOOD (  16.02  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, Shayne Chen <shayne.chen@mediatek.com>,
 linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>
Content-Type: multipart/mixed; boundary="===============0508221713259691280=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============0508221713259691280==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Content-Disposition: inline

--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> This is a preliminary patch for implicit beamforming support.
>=20

Hi Ryber,

just few nitpicks inline.

Regards,
Lorenzo

> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 50 +++++++------------
>  1 file changed, 17 insertions(+), 33 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7915/mcu.c
> index 0baef70fc522..f38bc421ea8e 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> @@ -66,9 +66,6 @@ struct mt7915_fw_region {
> =20
>  #define MCU_PATCH_ADDRESS=09=090x200000
> =20
> -#define MT_STA_BFER=09=09=09BIT(0)
> -#define MT_STA_BFEE=09=09=09BIT(1)
> -
>  #define FW_FEATURE_SET_ENCRYPT=09=09BIT(0)
>  #define FW_FEATURE_SET_KEY_IDX=09=09GENMASK(2, 1)
>  #define FW_FEATURE_OVERRIDE_ADDR=09BIT(5)
> @@ -1948,16 +1945,23 @@ mt7915_mcu_sta_bfee_tlv(struct sk_buff *skb, stru=
ct ieee80211_sta *sta,
>  =09=09bfee->fb_identity_matrix =3D true;
>  }
> =20
> -static u8
> -mt7915_mcu_sta_txbf_type(struct mt7915_phy *phy, struct ieee80211_vif *v=
if,
> -=09=09=09 struct ieee80211_sta *sta)
> +static int
> +mt7915_mcu_add_txbf(struct mt7915_dev *dev, struct ieee80211_vif *vif,
> +=09=09    struct ieee80211_sta *sta, bool enable)
>  {
> -=09u8 type =3D 0;
> +=09struct mt7915_vif *mvif =3D (struct mt7915_vif *)vif->drv_priv;
> +=09struct mt7915_sta *msta =3D (struct mt7915_sta *)sta->drv_priv;
> +=09struct mt7915_phy *phy;
> +=09struct sk_buff *skb;
> +=09int r, len;
> +=09bool ebfee =3D 0, ebf =3D 0;
> =20
>  =09if (vif->type !=3D NL80211_IFTYPE_STATION &&
>  =09    vif->type !=3D NL80211_IFTYPE_AP)
>  =09=09return 0;
> =20
> +=09phy =3D mvif->band_idx ? mt7915_ext_phy(dev) : &dev->phy;
> +
>  =09if (sta->he_cap.has_he) {
>  =09=09struct ieee80211_he_cap_elem *pe;
>  =09=09const struct ieee80211_he_cap_elem *ve;
> @@ -1970,12 +1974,12 @@ mt7915_mcu_sta_txbf_type(struct mt7915_phy *phy, =
struct ieee80211_vif *vif,
>  =09=09if ((HE_PHY(CAP3_SU_BEAMFORMER, pe->phy_cap_info[3]) ||
>  =09=09     HE_PHY(CAP4_MU_BEAMFORMER, pe->phy_cap_info[4])) &&
>  =09=09    HE_PHY(CAP4_SU_BEAMFORMEE, ve->phy_cap_info[4]))
> -=09=09=09type |=3D MT_STA_BFEE;
> +=09=09=09ebfee =3D true;
> =20
>  =09=09if ((HE_PHY(CAP3_SU_BEAMFORMER, ve->phy_cap_info[3]) ||
>  =09=09     HE_PHY(CAP4_MU_BEAMFORMER, ve->phy_cap_info[4])) &&
>  =09=09    HE_PHY(CAP4_SU_BEAMFORMEE, pe->phy_cap_info[4]))
> -=09=09=09type |=3D MT_STA_BFER;
> +=09=09=09ebf =3D true;
>  =09} else if (sta->vht_cap.vht_supported) {
>  =09=09struct ieee80211_sta_vht_cap *pc;
>  =09=09struct ieee80211_sta_vht_cap *vc;
> @@ -1989,36 +1993,16 @@ mt7915_mcu_sta_txbf_type(struct mt7915_phy *phy, =
struct ieee80211_vif *vif,
>  =09=09     IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE;
> =20
>  =09=09if ((pc->cap & cr) && (vc->cap & ce))
> -=09=09=09type |=3D MT_STA_BFEE;
> +=09=09=09ebfee =3D true;

what about:
=09=09ebfee =3D !!((pc->cap & cr) && (vc->cap & ce))

> =20
>  =09=09if ((vc->cap & cr) && (pc->cap & ce))
> -=09=09=09type |=3D MT_STA_BFER;
> -=09} else if (sta->ht_cap.ht_supported) {
> -=09=09/* TODO: iBF */
> +=09=09=09ebf =3D true;

=09=09ebfee =3D !!((vc->cap & cr) && (pc->cap & ce))
>  =09}
> =20
> -=09return type;
> -}
> -
> -static int
> -mt7915_mcu_add_txbf(struct mt7915_dev *dev, struct ieee80211_vif *vif,
> -=09=09    struct ieee80211_sta *sta, bool enable)
> -{
> -=09struct mt7915_vif *mvif =3D (struct mt7915_vif *)vif->drv_priv;
> -=09struct mt7915_sta *msta =3D (struct mt7915_sta *)sta->drv_priv;
> -=09struct mt7915_phy *phy;
> -=09struct sk_buff *skb;
> -=09int r, len;
> -=09u8 type;
> -
> -=09phy =3D mvif->band_idx ? mt7915_ext_phy(dev) : &dev->phy;
> -
> -=09type =3D mt7915_mcu_sta_txbf_type(phy, vif, sta);
> -
>  =09/* must keep each tag independent */
> =20
>  =09/* starec bf */
> -=09if (type & MT_STA_BFER) {
> +=09if (ebf) {
>  =09=09len =3D sizeof(struct sta_req_hdr) + sizeof(struct sta_rec_bf);
> =20
>  =09=09skb =3D mt7915_mcu_alloc_sta_req(dev, mvif, msta, len);
> @@ -2034,7 +2018,7 @@ mt7915_mcu_add_txbf(struct mt7915_dev *dev, struct =
ieee80211_vif *vif,
>  =09}
> =20
>  =09/* starec bfee */
> -=09if (type & MT_STA_BFEE) {
> +=09if (ebfee) {
>  =09=09len =3D sizeof(struct sta_req_hdr) + sizeof(struct sta_rec_bfee);
> =20
>  =09=09skb =3D mt7915_mcu_alloc_sta_req(dev, mvif, msta, len);
> --=20
> 2.18.0
>=20

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCX/7wuAAKCRA6cBh0uS2t
rG5UAQDzdZn08mrPnGeKlMsexdSLFqvhSnaygitAkF+1mW5jiQD9HKymQFg0JQK2
qx8DbwSzKMbQoZ3T3bqT1ZjBJzrL/AU=
=BaKt
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--



--===============0508221713259691280==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0508221713259691280==--


