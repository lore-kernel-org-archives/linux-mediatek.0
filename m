Return-Path: <SRS0=qwtc=HN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80CF4C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Feb 2021 08:55:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB4CD64E70
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Feb 2021 08:55:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB4CD64E70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ys0rfv3cXIhX8MDg6wnkbI9tIz//VF4t/1xqbGqog/s=; b=mSuC0qQigWbi5DGX3d1pm8Wzm
	fZnvMYHhyapPxTyJir2IeJXAN21TK4V1+Aa2jJKAK3Hg+DgKVjLCEwD83e6az9uMwodPABrSd4moC
	Ualj/lX+wj/AuNognpGur24P9GjTWJep/ORhyA7Faxk69NAbxWqo8x1EwvfRV2ZwV0epXksFiFHYi
	0rsfyTzkEfdqP5AuRdNWePtNsvKVdM/LkpH0bPLk/skcjrMPh9SGSNMIXKDwVOIXy4DROpljw/sHK
	rmCK5ReBmNhHwmi8U8uCmamRZWyuw42p0CZVV9WmXkz+z3HDMOf3/vbId36SvSEI7hhsdVfrzmmEO
	T+fUTZWFg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lA7lD-0003YT-UD; Thu, 11 Feb 2021 08:55:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lA7lB-0003Xw-4U
 for linux-mediatek@lists.infradead.org; Thu, 11 Feb 2021 08:55:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E2D5464E9C;
 Thu, 11 Feb 2021 08:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613033727;
 bh=eObln2SiLMPgRT0fsDptYhW1B99SRfGvF8pf8uhCqf4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b8IIO8yB5y2perK8+FqKalz0KRHI01rUvmzjXy/n5e6ZP+8y/MjeZdcdG05m5+2j9
 S/bF640BwJM66R77ZjJJQhmmvEWj/F0aqcFOguEXC4N9zAdp2Eek/m7y1ox/VSA24e
 s4+dtxp18e8uyKM6wv7DvJ9isuVYSpCVP83v4jTcOjRnVuRM3aD8j1UOq+8lzXfTds
 B12CW9T5xKh9xr6AY9xswPXXzsRGorI7ZODPHeXT2Ry6JjdTNvhJaK7loeqlzg7OHr
 AJht3BoO5BmloMG8+29bR70imHIBlfjNAKxodhrfXe8/3T8L+M4EHf6zaxepnB9I12
 xAtbkccAdl5RQ==
Date: Thu, 11 Feb 2021 09:55:22 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Colin Ian King <colin.king@canonical.com>
Subject: Re: mt76: mt7921: add MCU support
Message-ID: <YCTw+rM60BaiTOLh@lore-desk>
References: <57068965-649f-ef8e-0dd2-9d25b8bec1c7@canonical.com>
MIME-Version: 1.0
In-Reply-To: <57068965-649f-ef8e-0dd2-9d25b8bec1c7@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_035537_368757_FB2ED1EA 
X-CRM114-Status: GOOD (  11.02  )
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
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Sean Wang <sean.wang@mediatek.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Soul Huang <Soul.Huang@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Content-Type: multipart/mixed; boundary="===============4751528759426105157=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4751528759426105157==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+ingo0Z0BCUaxCET"
Content-Disposition: inline


--+ingo0Z0BCUaxCET
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi,
>=20

Hi Colin,

a fix for this issue has been already posted upstream:

https://patchwork.kernel.org/project/linux-wireless/patch/857ff74f736d4e593=
f5ad602cee7ac67ebfca5ca.1612867656.git.lorenzo@kernel.org/

Regards,
Lorenzo

> Static analysis with Coverity on linux-next has found an issue with the
> following commit:
>=20
> commit 1c099ab44727c8e42fe4de4d91b53cec3ef02860
> Author: Sean Wang <sean.wang@mediatek.com>
> Date:   Thu Jan 28 03:33:39 2021 +0800
>=20
>     mt76: mt7921: add MCU support
>=20
> The analysis is as follows:
>=20
> 390 static void
> 391 mt7921_mcu_tx_rate_report(struct mt7921_dev *dev, struct sk_buff *skb,
> 392                          u16 wlan_idx)
> 393 {
> 394        struct mt7921_mcu_wlan_info_event *wtbl_info =3D
> 395                (struct mt7921_mcu_wlan_info_event *)(skb->data);
> 396        struct rate_info rate =3D {};
> 397        u8 curr_idx =3D wtbl_info->rate_info.rate_idx;
> 398        u16 curr =3D le16_to_cpu(wtbl_info->rate_info.rate[curr_idx]);
> 399        struct mt7921_mcu_peer_cap peer =3D wtbl_info->peer_cap;
> 400        struct mt76_phy *mphy =3D &dev->mphy;
>=20
>    1. var_decl: Declaring variable stats without initializer.
>=20
> 401        struct mt7921_sta_stats *stats;
> 402        struct mt7921_sta *msta;
> 403        struct mt76_wcid *wcid;
> 404
>=20
>    2. Condition wlan_idx >=3D 288, taking false branch.
>=20
> 405        if (wlan_idx >=3D MT76_N_WCIDS)
> 406                return;
>=20
>    3. Condition 0 /* !((((sizeof ((*dev).mt76.wcid[wlan_idx]) =3D=3D size=
of
> (char) || sizeof ((*dev).mt76.wcid[wlan_idx]) =3D=3D sizeof (short)) ||
> sizeof ((*dev).mt76.wcid[wlan_idx]) =3D=3D sizeof (int)) || sizeof
> ((*dev).mt76.wcid[wlan_idx]) =3D=3D sizeof (long)) || sizeof
> ((*dev).mt76.wcid[wlan_idx]) =3D=3D sizeof (long long)) */, taking false =
branch.
>=20
>    4. Condition debug_lockdep_rcu_enabled(), taking true branch.
>    5. Condition !__warned, taking true branch.
>    6. Condition 0, taking false branch.
>    7. Condition rcu_read_lock_held(), taking false branch.
> 407        wcid =3D rcu_dereference(dev->mt76.wcid[wlan_idx]);
>    8. Condition !wcid, taking true branch.
> 408        if (!wcid) {
>=20
> Uninitialized pointer write (UNINIT)
>    9. uninit_use: Using uninitialized value stats.
>=20
> 409                stats->tx_rate =3D rate;
> 410                return;
> 411        }
>=20
> Line 409 dereferences pointer stats, however, this pointer has not yet
> been initialized.  The initialization occurs later:
>=20
> 413        msta =3D container_of(wcid, struct mt7921_sta, wcid);
> 414        stats =3D &msta->stats;
>=20
> Colin

--+ingo0Z0BCUaxCET
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYCTw9gAKCRA6cBh0uS2t
rDLDAQDP4xryemYC6dcqG8FDYTYQfWlDd26K7aFnk63f4Z7lEAD+Le3fknh0PulR
h0z38yNlsbA7otids7O1+3KkfyI7fA8=
=1xcX
-----END PGP SIGNATURE-----

--+ingo0Z0BCUaxCET--


--===============4751528759426105157==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4751528759426105157==--

