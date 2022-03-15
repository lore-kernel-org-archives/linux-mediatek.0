Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEADFC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 13:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OEfvD7982UbvzMZmWeO5vhfaoGXtSMdbrC4l3+QO6ss=; b=sqKoNzHedu6EIJ8emyaIiSUkMu
	Im4vEXxLXRUbNXcwCOKkihshySYHZNfVYfYQgKirk3K/yefevM+4+ytQsYUNFp3YtARqFYGZWkJpc
	YxpWiQTCIJZxsUlprWCT8pi2mNuM4olzizQLeiig2EY80sM/ttBqEl8Y1kObmSEk8ZUOuKiuswiyH
	lr66QSBaIJyf8FaMvHb2nmp5oORGahTd04krYfim+dETwsT3B3SIAz+stSX3eGxFjZjjOFPdijPmd
	UZq7KBkolQ4h2RCb1BB9DkbW+xo9RE15gtly0khcaYoJrXMWNVKeUVtHi7SyVUbztKVqPh68doy0R
	mL3cO9Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU71W-0098WN-EN; Tue, 15 Mar 2022 13:15:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU71I-0098Rx-KV; Tue, 15 Mar 2022 13:15:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 38BF0615C6;
 Tue, 15 Mar 2022 13:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A97EC340E8;
 Tue, 15 Mar 2022 13:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647350123;
 bh=UseLGcGOm/pva/SYnye9j1eMFLi438hMBLmXnU/SEmU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I/6ksWqtcBc+GFZBAsCSt7uqXHjc02cvBcR93rZ58hH1iHPxtHAy9ziZBY0wZZwkC
 LnhvnWFZLyhFxFQRXO2z4lzF1f+FfJKArX8vnTekK3m43Xk271wUamIHMB1SSHaiDJ
 7YU5b+ZLoXA9cxjph4jnSB3sYg9yKnlr0qGDUhOtbL9EctztbABkd/3keiW2QRIKCe
 TjGvcYTff3RATNurjgiocg/Wbn70SDooQjKZMbbvpXNBSwhETLKfM5Bo0drySRmlxe
 hAjl3RSbAuGM6YLbyZJGEoCeklflvLjXCb06Escm5Vi7Y0mdz9SocJgDmCJ10luQD2
 lCEmrQqHK7lxQ==
Date: Tue, 15 Mar 2022 13:15:17 +0000
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Jiaxin Yu <jiaxin.yu@mediatek.com>, robh+dt@kernel.org,
 aaronyu@google.com, matthias.bgg@gmail.com, trevor.wu@mediatek.com,
 tzungbi@google.com, julianbraha@gmail.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [v3 10/19] ASoC: mediatek: mt8186: support tdm in platform driver
Message-ID: <YjCRZTu8AkYI0JVR@sirena.org.uk>
References: <20220313151023.21229-1-jiaxin.yu@mediatek.com>
 <20220313151023.21229-11-jiaxin.yu@mediatek.com>
 <3c7c6e67-072c-6377-05bd-1b5baa579666@collabora.com>
MIME-Version: 1.0
In-Reply-To: <3c7c6e67-072c-6377-05bd-1b5baa579666@collabora.com>
X-Cookie: Tax and title extra.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_061524_737038_2E8C123A 
X-CRM114-Status: GOOD (  14.41  )
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
Content-Type: multipart/mixed; boundary="===============7502932506534256048=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7502932506534256048==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l81KvQLrUFtHOxoG"
Content-Disposition: inline


--l81KvQLrUFtHOxoG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 14, 2022 at 11:39:11AM +0100, AngeloGioacchino Del Regno wrote:
> Il 13/03/22 16:10, Jiaxin Yu ha scritto:
> > Add mt8186 tdm dai driver.
> >=20
> > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > ---
> >   sound/soc/mediatek/mt8186/mt8186-dai-tdm.c | 695 +++++++++++++++++++++
> >   1 file changed, 695 insertions(+)
> >   create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-tdm.c
> >=20
> > diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-tdm.c b/sound/soc/med=
iatek/mt8186/mt8186-dai-tdm.c

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--l81KvQLrUFtHOxoG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIwkWQACgkQJNaLcl1U
h9Bgtwf/RH2c0IQZVoBoFn8poE9HNrcM4ygfZJzlVBNxt9YQYh0qv/JjP8SsDxX7
V7A0sxQKGv73G6memlblfku6BE/MGVExc2siRVrmGAHnGD2dAuszueDp4XS4mrA6
eeKUvgHb6a3eV6fK/ELkpGTN++EHeypOx0MmZ4QqNS4L7ZKImNq+d44g+NTGervs
3Bsuec4/q7EJOKo29k/FwCfROip7uXzbpnjMsFxw5DFxrV4rATzpT+CqrgtqDs4m
bPlk4/BaDQyEdijcsMtgkh/UqSS5pUcxWnpB3dLanBJ3i82HVLjLh184VzRi+/3k
N5Wpe8EHd91mUjff+MRKzjD57IBd2w==
=RzsX
-----END PGP SIGNATURE-----

--l81KvQLrUFtHOxoG--


--===============7502932506534256048==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7502932506534256048==--

