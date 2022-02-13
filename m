Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482D8C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Feb 2022 17:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7J7CKmS4yT4PjLgwi07DS7mYl9c0LzWFtaVCaB+Gdz4=; b=cOA6SDBp7f9vNQCaChoxxNyC7K
	x1hsZsrkky7foplDRz/ph3gWla2Xny7voUs6dQwbE++r0/LZIo5aTBjqC2KeJqyAERE5A7yOBy0Vl
	gqMOBF5L7SK6yF9Sq1N7rHMKMvoU0xYgVBbbXGJ84OingMXLdGQmmIg49DFRUke5tWuu/JyZYa+sX
	h3861nO8XXf6rrEo7Vvcenth7p9eTyENIDE1dIF5d2GoNxNg5iegWFzuFPQ4yK3SFjRItCqD5gN1x
	lQxm19woCXg6wcE84W48wRvhCfH3LpOZfqBQl+KS8FuGFnsi4mUmeZN4JxLHrLNcvuADlz2CFHbbm
	wSEXZhlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJIZf-00CCLY-Df; Sun, 13 Feb 2022 17:22:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJIZc-00CCKI-Di
 for linux-mediatek@lists.infradead.org; Sun, 13 Feb 2022 17:22:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644772924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UEbNs2LWwc8c6HkSKwc+PmwK7oT5oIHIc4Lc+WeqQ8g=;
 b=gd6dxhnJqfycm/bxxBSu9ns6GSNoHaNXZkCqGRaStWMyRG5e8afd5bfU5SyS0J9MAX0iBF
 1Uy7O2lgUPZb6whjPqQ3Kh3obw7dbo9gixrupfDyUrzXq4ROVPceSs2Qgz39yUX1Z8n1BU
 dDI3xUFf568LjAaDVqj1QcZiS2nNa2w=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-vCn40q0vMX2qYAh0UPRuJQ-1; Sun, 13 Feb 2022 12:22:01 -0500
X-MC-Unique: vCn40q0vMX2qYAh0UPRuJQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 m4-20020a50cc04000000b0040edb9d147cso8779486edi.15
 for <linux-mediatek@lists.infradead.org>; Sun, 13 Feb 2022 09:22:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UEbNs2LWwc8c6HkSKwc+PmwK7oT5oIHIc4Lc+WeqQ8g=;
 b=Nv6Q+ick4R5yzxyTYi1eWcDhKI4E3JBHUJr2j3XKozKPAvEIwcg+iQagqUduUpsgKB
 2s0XYFZG8qSPEV+V7yP7+ORuAgV4l65J/LNx2xn6voyHOF8p4L0BiqxHXe9Cs1Z4pHRv
 ZWqyB5bQ0SDec1wjgYtgiVitMlb3pBfEj5LSep0nKVZT/boVlNUDvG8ErNHmX1vn0rhB
 WqPRjAn9qerV76hb6oqtPekNcubu1kIT1Iaddv7XPqiq185NtOJVF+pvAhgGXH7VPFWI
 KvJABHVEsxsjtaF5n9wETVw7ovyAeItdeeHyK+xNyzre+h1RGJ6UBELm0lmTAfLrtG3f
 zifw==
X-Gm-Message-State: AOAM532c/D0SHKM83TPwOrg27IJQU40AY+KrkZp+QzY61gEi2orZyQZS
 pap0uAm7dTYctB1oE+4KuV1wbjMjmsFMUjca293kZqWYdfFe0CJJoexESEGlOGvPRELXGWOOvDP
 etE7letNSNwjPkhbBtl1QWDIcxssx6XDQ
X-Received: by 2002:a50:9ea6:: with SMTP id a35mr11157705edf.299.1644772919997; 
 Sun, 13 Feb 2022 09:21:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyzm2+oPdfL9M99wCEDq6LEFXqQwRvwvCmvp8h/JKCBasrO95D3J7apVIuCBZkDobUhp79bgA==
X-Received: by 2002:a50:9ea6:: with SMTP id a35mr11157688edf.299.1644772919773; 
 Sun, 13 Feb 2022 09:21:59 -0800 (PST)
Received: from localhost (net-37-182-17-113.cust.vodafonedsl.it.
 [37.182.17.113])
 by smtp.gmail.com with ESMTPSA id 5sm1116256ejr.144.2022.02.13.09.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 09:21:59 -0800 (PST)
Date: Sun, 13 Feb 2022 18:21:57 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: Chad Monroe <chad.monroe@smartrg.com>
Cc: Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes.berg@intel.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mt76: connac: adjust wlan_idx size from u8 to u16
Message-ID: <Ygk+NbOPnIzphMSd@lore-desk>
References: <a0644f7da6ba09195ee247a5affa562179328207.1644688718.git.chad.monroe@smartrg.com>
MIME-Version: 1.0
In-Reply-To: <a0644f7da6ba09195ee247a5affa562179328207.1644688718.git.chad.monroe@smartrg.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220213_092208_581313_09A70255 
X-CRM114-Status: GOOD (  13.30  )
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
Content-Type: multipart/mixed; boundary="===============4917045307043434864=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4917045307043434864==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hPEQp+DxvyZdzxkr"
Content-Disposition: inline


--hPEQp+DxvyZdzxkr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Thx for fixing it.
I guess we can add the following Fixes tag:

Fixes: 49126ac1f8d26 ("mt76: connac: move mt76_connac_mcu_bss_basic_tlv in =
connac module")

Anyway:

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> Newer chips such as MT7915 require up to 16-bits for this field.
>=20
> Signed-off-by: Chad Monroe <chad.monroe@smartrg.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 2 +-
>  drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drive=
rs/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> index cdd82a62eeb1..f3fdd755a3bb 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> @@ -2656,7 +2656,7 @@ EXPORT_SYMBOL_GPL(mt76_connac_mcu_bss_ext_tlv);
>  int mt76_connac_mcu_bss_basic_tlv(struct sk_buff *skb,
>  				  struct ieee80211_vif *vif,
>  				  struct ieee80211_sta *sta,
> -				  struct mt76_phy *phy, u8 wlan_idx,
> +				  struct mt76_phy *phy, u16 wlan_idx,
>  				  bool enable)
>  {
>  	struct mt76_vif *mvif =3D (struct mt76_vif *)vif->drv_priv;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drive=
rs/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> index 7b9d82dd3f9d..384c3eab1c8a 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> @@ -1642,7 +1642,7 @@ void mt76_connac_mcu_bss_omac_tlv(struct sk_buff *s=
kb,
>  int mt76_connac_mcu_bss_basic_tlv(struct sk_buff *skb,
>  				  struct ieee80211_vif *vif,
>  				  struct ieee80211_sta *sta,
> -				  struct mt76_phy *phy, u8 wlan_idx,
> +				  struct mt76_phy *phy, u16 wlan_idx,
>  				  bool enable);
>  void mt76_connac_mcu_sta_uapsd(struct sk_buff *skb, struct ieee80211_vif=
 *vif,
>  			       struct ieee80211_sta *sta);
> --=20
> 2.32.0 (Apple Git-132)
>=20

--hPEQp+DxvyZdzxkr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYgk+NQAKCRA6cBh0uS2t
rMpAAQDwkrw5UKBqElKj8k80s9mWHyVwxadFBsfy8U6ooKJmBQEAuSFOvB0uw5sh
zVa82nYMLMqqBE86wcSD5HIMM/cgrwA=
=A9mv
-----END PGP SIGNATURE-----

--hPEQp+DxvyZdzxkr--



--===============4917045307043434864==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4917045307043434864==--


