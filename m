Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91B5C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jan 2022 21:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6m9njx8W7lBTITf1UYb9D9gmwPuh36qKB6iDJf6Owds=; b=CbNpX3hY/pDg/eLTShjQr6C9Sk
	aFkM4PEny2ph9gHClZ8ToJPFVxO4ZPgCoOmfcG06ISRzI+R1susgDS9ucJNVqtCbBayLizPd5qUY0
	R1SOkkHNNhiWkswiCaJM9ffP954Zdp1X8QHLhfcMHv47DswxeJHklhL5n9cyiHGy+Q/QAA8ucGMC3
	YNLCblHGktpndJgo5ihWfdRct2enpU6HW+dyfYG9eIZYPw42MwgrjJd9H/P5MYWLVSvFOM5wZZGZw
	xQ5u1OYIafgXSscKWuz/D3NwkFYHFyei/oEb+TgGQPm8YD2ufvMd4Dztbek/3fg1hWKArZVznbsnI
	xaBLawVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDZBV-003c9S-Ja; Fri, 28 Jan 2022 21:53:33 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDZAr-003byc-Gd; Fri, 28 Jan 2022 21:52:56 +0000
Received: from localhost (dslb-188-106-017-011.188.106.pools.vodafone-ip.de
 [188.106.17.11])
 by pokefinder.org (Postfix) with ESMTPSA id D2CC42C019A;
 Fri, 28 Jan 2022 22:46:49 +0100 (CET)
Date: Fri, 28 Jan 2022 22:46:49 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Kewei Xu <kewei.xu@mediatek.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 qii.wang@mediatek.com, liguo.zhang@mediatek.com,
 caiyu.chen@mediatek.com, housong.zhang@mediatek.com,
 yuhan.wei@mediatek.com, ryan-jh.yu@mediatek.com
Subject: Re: [v2 2/2] i2c: mediatek: Add i2c compatible for Mediatek MT8186
Message-ID: <YfRkSWXZjMipeY9t@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
 Kewei Xu <kewei.xu@mediatek.com>, matthias.bgg@gmail.com,
 robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 qii.wang@mediatek.com, liguo.zhang@mediatek.com,
 caiyu.chen@mediatek.com, housong.zhang@mediatek.com,
 yuhan.wei@mediatek.com, ryan-jh.yu@mediatek.com
References: <20220125110413.18988-1-kewei.xu@mediatek.com>
 <20220125110413.18988-3-kewei.xu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20220125110413.18988-3-kewei.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_135253_755384_30C3F74A 
X-CRM114-Status: UNSURE (   7.00  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============4420654905865081143=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4420654905865081143==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iDYL83PzqLRC0DKr"
Content-Disposition: inline


--iDYL83PzqLRC0DKr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 25, 2022 at 07:04:13PM +0800, Kewei Xu wrote:
> Add i2c compatible for MT8186. Compare to MT8192 i2c controller,
> MT8186 doesn't need handshake signal witch apdma.
>=20
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>

Applied to for-next, thanks!


--iDYL83PzqLRC0DKr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmH0ZEkACgkQFA3kzBSg
KbZ6jA//Wu7tH7rEW6TSr2vfsy1JdHoT27T3MVU0rEMAxMywWekdsb1CihQb4MLn
VuoX1vaPNiGibnJJJj3WPn/ooY7qabnpBQ6vjyJVjy2wOUMezyHYhIl6Cn7IYAL+
yzUBekC+drFxIbEumek5WFH8gV5HXM9nhmm1FUXQN5r//Eu/uva6NPm/FB62jh74
VxQ8SsNrp/SWYtUarBO8bsthzEdBHhtRLygZ+nJVyahAhZ4Ozm69sEKn9lxRgAVl
E8WWAj8qh5QY1kY0dBU54dNJGiuZH45IlC6DxMJyoWE287xpSbXQeDhbdvmXCxSt
1B9WtFi4/7l8fEzrnYbSGj+QA3H8qX5ajpTXNlu5IKJJnJckDEEUH8DchyvXVQMJ
IpxfhPfm/KZEq/hw/mEm3JyqFwxng10t5394Y2zihbNNo/Iq2WaOp9RjF+Wt9VNT
EsIxoK/duKC/nIfmxKDK0WiFql/W35uZuWAeCVsTe3Nh2HnpzLiGbLeKFnI0mItK
+k5v8nE8+vkpsBY1z5fG0cyKzceeey34unoQ71cSw/sQdyneaZSAw+01ilgRvqjY
Tg/vv6iUdhE0yMA+xG2rRIwvHe0XWpj1/HBIHBJ5ytwBXNshsyJnpfsRjD/GpcgP
H+oFRoOX04AgRuJ5eCh/dI9hK/+dwGbYBUXamX+1Zutn9wXqqNc=
=7JnB
-----END PGP SIGNATURE-----

--iDYL83PzqLRC0DKr--


--===============4420654905865081143==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4420654905865081143==--

