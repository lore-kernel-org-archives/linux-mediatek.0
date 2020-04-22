Return-Path: <SRS0=Y6KA=6G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A971C54FCB
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Apr 2020 19:53:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 253EB2071E
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Apr 2020 19:53:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bg7aYK67";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="aiePX+iL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 253EB2071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mW3dSMlDJazI0R7T3GRLjWzqUBbr1l7sq2v9U0fi2P0=; b=Bg7aYK67KXqOPrkoGp3Jb7BAz
	N6izmBbiTzwzwMWCtqQsNCqbchvewUOtjke3kvYWCA88yVzLZiLa3YgUYzC0+8lHC6wuB51Yercc8
	BgQYaFC/Jr+xR4OnnKkAk678Yt+pxe/jNvCURYTal1+a2HA+bsK41TPRTmFTx5HYGS2mhvZ3G9aBh
	z3k6dcJi/ipxyFvYIqsdl9jrJH4V9FdQZ21kIRnydQJjkop/1YrmJyLpY9hf8nXWMzVWCDGxIH1Sv
	bJkvmRUdd0BvWjio9CxsZCIlkirx7wqa1LDTxawt1buBQBom9rFSTtIOVDjd/qOo5PJMa2m1DeZFC
	IrZ9kYOoA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRLQR-0008BF-Rl; Wed, 22 Apr 2020 19:52:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRLQO-0008AO-W8
 for linux-mediatek@lists.infradead.org; Wed, 22 Apr 2020 19:52:50 +0000
Received: from lore-desk-wlan (unknown [151.66.196.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 21CE12071E;
 Wed, 22 Apr 2020 19:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587585167;
 bh=y0JHWvGjvwSO5+iXChXSG8zecr7blu2SJx+hB3TE+eQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aiePX+iLt2LFMKUeJYsVzq6tKX7BH2XMrn7zIjfGCZTXY7jHm+LR3vxwtr3oO8cGJ
 7oqaA1UnCFzkPW9rdR8gX1/InvN41Z1JD2xawBFJ9dowktG0B8R9kEcWsmjp64nNXv
 wUDOU65hUfwRyP+gWUyMwvf99SPUAMMGQPYO/API=
Date: Wed, 22 Apr 2020 21:52:36 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: sean.wang@mediatek.com
Subject: Re: [PATCH v2] mt76: mt7663: fix up BMC entry indicated to unicmd
 firmware
Message-ID: <20200422195236.GB85966@lore-desk-wlan>
References: <71a5733885991a8211104b616d2f51d120efccb9.1587580510.git.sean.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <71a5733885991a8211104b616d2f51d120efccb9.1587580510.git.sean.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_125249_074230_A7494260 
X-CRM114-Status: GOOD (  13.79  )
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
Cc: ryder.lee@mediatek.com, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 Soul Huang <Soul.Huang@mediatek.com>, nbd@nbd.name
Content-Type: multipart/mixed; boundary="===============4698345858040801977=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4698345858040801977==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eAbsdosE1cNLO4uF"
Content-Disposition: inline


--eAbsdosE1cNLO4uF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> BMC entry for MT7663 unicmd firmware should be a broadcast/multicast entr=
y,
> not a unicast entry, that is GTK rekey offload would rely on.
>=20
> Fixes: 138860679b2a ("mt76: mt7615: add more uni mcu commands")
> Cc: Soul Huang <Soul.Huang@mediatek.com>
> Suggested-by: YF Luo <Yf.Luo@mediatek.com>
> Co-developed-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> --
> v1->v2:
> mt7615_mcu_uni_add_bss is only called on mt7663 with the offload firmware,
> so remove the entire unnecessary if code section.
> ---
>  .../net/wireless/mediatek/mt76/mt7615/mcu.c    | 18 +-----------------
>  1 file changed, 1 insertion(+), 17 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7615/mcu.c
> index 24b78d10d7f7..994446b1baba 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> @@ -1359,7 +1359,7 @@ mt7615_mcu_uni_add_bss(struct mt7615_phy *phy,
>  			.short_st =3D true,
>  		},
>  	};
> -	u8 idx, tx_wlan_idx =3D 0;
> +	u8 idx, tx_wlan_idx =3D mvif->sta.wcid.idx;

nitpick: I guess we do not need tx_wlan_idx anymore.

Regards,
Lorenzo

>  	int err;
> =20
>  	idx =3D mvif->omac_idx > EXT_BSSID_START ? HW_BSSID_0 : mvif->omac_idx;
> @@ -1369,24 +1369,8 @@ mt7615_mcu_uni_add_bss(struct mt7615_phy *phy,
>  	case NL80211_IFTYPE_MESH_POINT:
>  	case NL80211_IFTYPE_AP:
>  		basic_req.basic.conn_type =3D cpu_to_le32(CONNECTION_INFRA_AP);
> -		tx_wlan_idx =3D mvif->sta.wcid.idx;
>  		break;
>  	case NL80211_IFTYPE_STATION:
> -		if (enable) {
> -			struct ieee80211_sta *sta;
> -			struct mt7615_sta *msta;
> -
> -			rcu_read_lock();
> -			sta =3D ieee80211_find_sta(vif, vif->bss_conf.bssid);
> -			if (!sta) {
> -				rcu_read_unlock();
> -				return -EINVAL;
> -			}
> -
> -			msta =3D (struct mt7615_sta *)sta->drv_priv;
> -			tx_wlan_idx =3D msta->wcid.idx;
> -			rcu_read_unlock();
> -		}
>  		basic_req.basic.conn_type =3D cpu_to_le32(CONNECTION_INFRA_STA);
>  		break;
>  	default:
> --=20
> 2.25.1

--eAbsdosE1cNLO4uF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCXqCggQAKCRA6cBh0uS2t
rAUxAQCcW+AzZMGG20XYXqueNgrfuJTgk3eyNLgLpHG1HDrf2wD/d3dg1WSpFtps
SN3BCUDZo2PIjb1valYRBTiHZon/qgA=
=3J44
-----END PGP SIGNATURE-----

--eAbsdosE1cNLO4uF--


--===============4698345858040801977==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4698345858040801977==--

