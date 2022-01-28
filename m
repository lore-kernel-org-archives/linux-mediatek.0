Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8596C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jan 2022 21:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JeYtO4T2qr7pGCftKUm2ZKK1LZ1NT6MyvV8NTrbv4Us=; b=PToPOt7T1QHQ/PXoLdmZ0ZSagW
	gQJl/s7StI3CnnLMRQ0ww7lP10aeAkApLP4LIKy9Z5H4PfUwR7CLEiKGpm9nUTIz2VKVu3r1BCQEN
	eaNw2i2nN77zZe/7Ji9Vs329pF8Py1Y0SBo6Nh1h6EYAYfvJ/frX6H/0Ouq0dWrkZL4OgJoLjqk7f
	T+Ym2RbLGnL80euJ315Q1Cx013F78q7fUTo+owWS5InEW1g4iLU2gn2KKENyR91Pf6uQXtUU0t+GI
	pSOzD2sLugPgeHKr1SGkZq2TajRtxT4uxkoClA5j+grHwfqlNQocAkRKKfEDTMWklqYKgtuF1dUxt
	eYGtDCRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDZBG-003c3H-I0; Fri, 28 Jan 2022 21:53:18 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDZAr-003byd-AS; Fri, 28 Jan 2022 21:52:55 +0000
Received: from localhost (dslb-188-106-017-011.188.106.pools.vodafone-ip.de
 [188.106.17.11])
 by pokefinder.org (Postfix) with ESMTPSA id 02A3D2C018B;
 Fri, 28 Jan 2022 22:46:39 +0100 (CET)
Date: Fri, 28 Jan 2022 22:46:39 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Kewei Xu <kewei.xu@mediatek.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 qii.wang@mediatek.com, liguo.zhang@mediatek.com,
 caiyu.chen@mediatek.com, housong.zhang@mediatek.com,
 yuhan.wei@mediatek.com, ryan-jh.yu@mediatek.com
Subject: Re: [v2 1/2] dt-bindings: i2c: update bindings for MT8186 SoC
Message-ID: <YfRkP7Wf7lzarVrf@shikoro>
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
 <20220125110413.18988-2-kewei.xu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20220125110413.18988-2-kewei.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_135253_539299_CDAF1EA7 
X-CRM114-Status: UNSURE (   6.86  )
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
Content-Type: multipart/mixed; boundary="===============7931469739467560334=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7931469739467560334==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bRbgB+/I78l0U94u"
Content-Disposition: inline


--bRbgB+/I78l0U94u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 25, 2022 at 07:04:12PM +0800, Kewei Xu wrote:
> Add a DT binding documentation for the MT8186 soc.
>=20
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>

Applied to for-next, thanks! But you forgot to add the ack from Rob
which he gave when you sent v1.


--bRbgB+/I78l0U94u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmH0ZD8ACgkQFA3kzBSg
KbY1YBAAtltEu6XU36xxoNs4hqAVteJnSR1z0QXyM7W1u+/+rv/por6ymVrzQ78i
qUm/aJfjnu2ecCgWOkm0/YaMXjJHXzqQzhw4OIm8YYAv7r1YfGTua+drP2ROExdu
jz+xBR1y2jNGE05CGFMAY5+rtS+x+SQVm2jcJEWcQgacpEfskyee388vdkW1F14H
9Udsls5I3E0j3+tiV0OiafKnVJcFGgVoNq3DoI/dDPdolec4OhthkrpO+m9IULU2
LDpJFvIZpyVjnAIxYcfWWGWXF5wf84crE5NTk5lWh7y+xbFLkmiLA6LJEea5ZKIi
aYQznyUzv8lMspe0mQTnU2+fCbY3pbqRBqDBPI46ZfsNmaw6OUsBrhnpFnVW0xvB
PsuLxokbNCFkhnfvspJtFUmm48GIynp/Nzriew5nnYOulB7z0ZEk9bLDXyj1Y7sF
+peii3fxxJVqSuljWX+GhhlSTpj2QMOip2JUVIN634UJzPn4prvbZGmHZyYEL/+Q
i/j0HweKMVUSAyjQKYMy3YZdqkFGiR2+IQPIf1xkT0FEpWmhw26KfkMTK6AUeCbc
bwdvtzWetjIhz8LYqSdtHb3QQrZwb4L387SQ7zEGRKFNbqoythx3jdrWXEA9McRU
t9N6HZTiFgm9oR49a6v3rg9PaL0Q5iZMUea/LuL2XBUODt0Fc5A=
=AbhB
-----END PGP SIGNATURE-----

--bRbgB+/I78l0U94u--


--===============7931469739467560334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7931469739467560334==--

