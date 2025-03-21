Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75CF6C36000
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Mar 2025 15:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lH2U2G8Gz+Xy1V3LOetq1Y+BXZZfWfVYayeHBZ6YCgc=; b=Ch3rxt/jBAlimgYcQgL0Rp3o7V
	gG/FSR/+V5dH/nFIbthRi70i+vk1JeDJdIXhCM0Srwbur0+nzxcGs7SOASWQCXsPoSM1E9NlNt1nv
	7/7CYHTFILo0PpfJlzorUiPzvkl+TPxSezWNYMu+2NUJ4GEMSrv8tOt4/u9iPwzbJ0qMAqzj52lqt
	JvX6x0a0n0wiW9D7w5/4Vix31oKIw1gCscX3WAiMPtg1OIdBujlbwcqVvb7+HfwvLXNUxZGzsfeWo
	mRjEyNUd/LzRKgZEZmmzu+Uk6K43TThuG52E00jUKdu0T7s4sEVsNclae0psoZqrA3w639QkSE3nd
	Kj2FPGuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvedC-0000000FMDs-1e3k;
	Fri, 21 Mar 2025 15:49:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvebW-0000000FLnH-2hHc
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Mar 2025 15:48:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 98A6643DC8;
	Fri, 21 Mar 2025 15:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 533E5C4CEED;
	Fri, 21 Mar 2025 15:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742572093;
	bh=DU5u7zzqxk8b3LOzHKAd92FrOH93E891MIYgL+Z1eac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RSsqN3XNrfb16zXuntT1jMfUhCBZLAQFG96m5MK28imTXVzybiRv/4Re31lgHRydo
	 Be6miDqEeyMPR+3K/T8q5nYmteXWy0B58FDtxuq4aoWoq5I/0YxG3K5EfL0/2FLHJO
	 2sbAHp5kldh3zjfs6/6mBZrdW93AFuJxUBAzYF6Qva0NV60gLPv/eRoU2WWZOeuzOY
	 aiFI03QCrDzuDTd/JJYLsZlBy39+QxTFUdMZhHlgIkfzMpslX3zNMkZ0WA2XfYoc+M
	 j6dcZFtdGqu1PhEj5NPoTZFy0l7KZU6BdvtYncqv8cnkrxNDocj/zLEdraJ6+Ek4K1
	 wZGMMkcjn94gQ==
Date: Fri, 21 Mar 2025 16:48:11 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [bug report] wifi: mt76: mt7996: Rely on mt7996_sta_link in
 sta_add/sta_remove callbacks
Message-ID: <Z92KO68zKlqKcF1W@lore-desk>
References: <f335328d-8554-401b-83c2-36e8d7668a62@stanley.mountain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EHUAeOz4fd75awZd"
Content-Disposition: inline
In-Reply-To: <f335328d-8554-401b-83c2-36e8d7668a62@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_084814_719687_01972EB9 
X-CRM114-Status: GOOD (  10.56  )
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


--EHUAeOz4fd75awZd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hello Lorenzo Bianconi,

Hi Dan,

this issue is already fixed by the following patch:
https://lore.kernel.org/linux-wireless/20250320201914.48159-1-qasdev00@gmai=
l.com/T/#u

Regards,
Lorenzo

>=20
> Commit dd82a9e02c05 ("wifi: mt76: mt7996: Rely on mt7996_sta_link in
> sta_add/sta_remove callbacks") from Mar 11, 2025 (linux-next), leads
> to the following Smatch static checker warning:
>=20
> 	drivers/net/wireless/mediatek/mt76/mt7996/main.c:1023 mt7996_mac_sta_add=
_links()
> 	error: uninitialized symbol 'err'.
>=20
> drivers/net/wireless/mediatek/mt76/mt7996/main.c
>     984 static int
>     985 mt7996_mac_sta_add_links(struct mt7996_dev *dev, struct ieee80211=
_vif *vif,
>     986                          struct ieee80211_sta *sta, unsigned long=
 new_links)
>     987 {
>     988         struct mt7996_sta *msta =3D (struct mt7996_sta *)sta->drv=
_priv;
>     989         unsigned int link_id;
>     990         int err;
>     991=20
>     992         for_each_set_bit(link_id, &new_links, IEEE80211_MLD_MAX_N=
UM_LINKS) {
>     993                 struct ieee80211_bss_conf *link_conf;
>     994                 struct ieee80211_link_sta *link_sta;
>     995                 struct mt7996_vif_link *link;
>     996=20
>     997                 if (rcu_access_pointer(msta->link[link_id]))
>     998                         continue;
>=20
> What about if there are no new links or we hit the continue on every
> iteration.
>=20
>     999=20
>     1000                 link_conf =3D link_conf_dereference_protected(vi=
f, link_id);
>     1001                 if (!link_conf)
>     1002                         goto error_unlink;
>=20
> error code?
>=20
>     1003=20
>     1004                 link =3D mt7996_vif_link(dev, vif, link_id);
>     1005                 if (!link)
>     1006                         goto error_unlink;
>=20
> error code?
>=20
>     1007=20
>     1008                 link_sta =3D link_sta_dereference_protected(sta,=
 link_id);
>     1009                 if (!link_sta)
>     1010                         goto error_unlink;
>=20
> error code?
>=20
>     1011=20
>     1012                 err =3D mt7996_mac_sta_init_link(dev, link_conf,=
 link_sta, link,
>     1013                                                link_id);
>     1014                 if (err)
>     1015                         goto error_unlink;
>     1016         }
>     1017=20
>     1018         return 0;
>     1019=20
>     1020 error_unlink:
>     1021         mt7996_mac_sta_remove_links(dev, sta, new_links);
>     1022=20
> --> 1023         return err;
>     1024 }
>=20
> regards,
> dan carpenter

--EHUAeOz4fd75awZd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ92KOwAKCRA6cBh0uS2t
rG5cAQDphmP9K6IfiUhNPlSlfzsCq2U+tHPbt379ElB7baJv3QD/WpT91hM+ML6V
f3ep0hi29dXXuvRt8mNx0qUiRB4WXgE=
=PyZM
-----END PGP SIGNATURE-----

--EHUAeOz4fd75awZd--

