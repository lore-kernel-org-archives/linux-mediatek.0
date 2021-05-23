Return-Path: <SRS0=GIYZ=KT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CEEFC04FF3
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 May 2021 17:17:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE33F61284
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 May 2021 17:17:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE33F61284
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=91led8jQIW6xPHkk5t9fSbq9ebvkJmY2lJzhKoray3M=; b=Xw66EMkFBA4vq6dEHPfJA9+tA
	4iZK+UgfCU7+a0CPz6ZqEhSleCZu8IQfU0Z52seBNneK5c2cKRr9OnwK8hhjCxkq/FVEOWcHLutTG
	HUsEHtvHW8BXNejFGwRjG4RS3ChphjioVZBVv+CT7kV+SDMiYvgs+DS6rSIg7tUXaT1/YZ33o11zQ
	XLW4y7QNYwiulrmahoZ2S0koq2Sgzm6eFBi1e6JxIrJMgr/p8Jq1yhiGDb2/CXPGb75a4yUNCOMHh
	HNu287KfyNFfCSKLhZwV+krmUn1ONG46Fp9Lk6ikCh3OH7nWsGwMckqcKne1cuORFDPuoR5ZlVNhp
	hsM+AQ1og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llECs-001FCJ-Re; Mon, 24 May 2021 17:17:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkvUg-000Zoi-KV
 for linux-mediatek@lists.infradead.org; Sun, 23 May 2021 21:18:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A36F261168;
 Sun, 23 May 2021 21:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621804722;
 bh=C3M5g3u/UxfJb6k1YxdamazUj6bL9RjogZwbzmkrhMY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RPNBp3KSlH00ML7RSyU/T9g8sINSOZq+IMi+11REb+gf8rifArIb0cwXJAKl2QUhI
 MYWHTlZ/IgNe/0Nyc1HiuCm6tly4K/um2LnFpihxbycVqUT+18OvYvS+fvxi2nQN1F
 9VwcAZV3eeC3S03zdNZu4v1DLJ17zOVflQ8kDRPJrZt9Vl47vrYiobU4tdIFj4c1/x
 BYV76O1N79wSXUgQCZibyVkiOVsLpNxlxY3likYFT/qiHJ4bUY7fYAFf0PapFejw/E
 ShAJbLQmkH7xDs0IyMP3AfxZTsBEZ/uSYm2PT3wWpgQ1KO/UWZsxESF62njUwMC+0g
 a/040ho9bxREw==
Date: Sun, 23 May 2021 23:18:37 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, lorenzo.bianconi@redhat.com, Soul.Huang@mediatek.com,
 YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com,
 km.lin@mediatek.com, robin.chiu@mediatek.com, ch.yeh@mediatek.com,
 posh.sun@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, jemele@google.com, yenlinlai@google.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mt76: mt7921: fix UC entry is being overwritten
Message-ID: <YKrGretiq7wo+pzv@lore-desk>
References: <1621495354-4130-1-git-send-email-sean.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1621495354-4130-1-git-send-email-sean.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210523_141842_722694_1E1ED160 
X-CRM114-Status: GOOD (  14.50  )
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
Content-Type: multipart/mixed; boundary="===============1577221470074817349=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1577221470074817349==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a65hvaA3CeNihl8+"
Content-Disposition: inline


--a65hvaA3CeNihl8+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Deren Wu <deren.wu@mediatek.com>
>=20
> Fix UC entry is being overwritten by BC entry
>=20
> Fixes: 36fcc8cff592 ("mt76: mt7921: introduce mt7921_mcu_sta_add routine")
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> Signed-off-by: YN Chen <yn.chen@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drive=
rs/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> index 73359defa176..f3decc59a6fe 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> @@ -875,10 +875,13 @@ int mt76_connac_mcu_add_sta_cmd(struct mt76_phy *ph=
y,
>  	if (IS_ERR(skb))
>  		return PTR_ERR(skb);
> =20
> -	mt76_connac_mcu_sta_basic_tlv(skb, info->vif, info->sta, info->enable);
> -	if (info->enable && info->sta)
> -		mt76_connac_mcu_sta_tlv(phy, skb, info->sta, info->vif,
> -					info->rcpi);
> +	if (info->sta) {
> +		mt76_connac_mcu_sta_basic_tlv(skb, info->vif, info->sta,
> +					      info->enable);
> +		if (info->enable)
> +			mt76_connac_mcu_sta_tlv(phy, skb, info->sta,
> +						info->vif, info->rcpi);
> +	}

with this patch we are changing the mt7663 behaviour since we run
mt76_connac_mcu_add_sta_cmd() in mt7615_remove_interface() with
enable =3D false and sta =3D NULL. Can you please confirm you are
not introducing any regression in mt7663?

Regards,
Lorenzo

> =20
>  	sta_wtbl =3D mt76_connac_mcu_add_tlv(skb, STA_REC_WTBL,
>  					   sizeof(struct tlv));
> --=20
> 2.25.1
>=20

--a65hvaA3CeNihl8+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYKrGngAKCRA6cBh0uS2t
rGmTAP0Q7j+zTudPGyKeq5cEHlichR+GkkNv1O1Rtz51VTroEwD9Ex/lnIyGNEhZ
ELQ0A3F97+318Pvo9Kjefy4zj/eJrgw=
=tC3Q
-----END PGP SIGNATURE-----

--a65hvaA3CeNihl8+--


--===============1577221470074817349==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1577221470074817349==--

