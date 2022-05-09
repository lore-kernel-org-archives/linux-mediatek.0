Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E13C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 18:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6UF8WEZEcceJ6Yoeaig0e0BPinx0Ou4udYxI0DMDjX4=; b=N8KUUVZE1BlJUQTqJtXMUfU9mH
	CTaSedR5kztj7f7EVItSYuxGxcTgSrZiNOHBXSCW9d6X4QvviYYFk21niJpSD8pY/q4HWzi4l1HfL
	++9LtCklp24zDg7Dovx1JFt3vRPi0+WjF6/8fs5CYy2u112kNiuUboPDeGe19g+TL9YL6l/KGHSiG
	n3GqCuL374l7Qus+WpVvenJlVnwYEwKSbRbCO+GbsERxqpbB2nW/ckZRIXpJLXURurufz4neEsymb
	Xb8W7E65FFAuKgAGmAM0HLsxib+tHzyS6w0xOtuIR7Y082JeXueCQkjLa8SJhSk5yXsyRq0bl8bSk
	JfYiGjvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no7z6-00Fow7-BD; Mon, 09 May 2022 18:19:52 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no7yt-00For9-Qg; Mon, 09 May 2022 18:19:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 494A2B818CE;
 Mon,  9 May 2022 18:19:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D3FBC385B2;
 Mon,  9 May 2022 18:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652120377;
 bh=sEtyjmgOrjIs5NYv5HPC0xk/tdYrRW3tbsJDYBclXYk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QxjxEobBOscR/f/wqE5KqFFibxHBYEbMltpkRKBAnS7TIDyAfo31CyGMDkGQg/3J2
 CSgYm/b4Um//Ob7QXYzVoPwq7Z+JBR8dbsnNgYaeueJZy8t17DNMQygwvpK3Ztd4sp
 iqilsKMgPqHknWIpd4XUmv70r9KdcevXWafnn9Kxcc4NQn0UAwBjC7LxSYF0TC0gmK
 qL4VqlqrmaY02ut3JmWVbdGokASWh1yIDvabGmSm3M115Vb5a1oR0FMSqdD65VgbO7
 atMKHSrq1S2Ghayfh4VZYne1f6GlRhNOm8OTjChJMqHU6gc4Hf6nbzZyDnK2jaYSap
 Q7aUkUZatZjPA==
Date: Mon, 9 May 2022 19:19:30 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: matthias.bgg@gmail.com, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, jiaxin.yu@mediatek.com,
 angelogioacchino.delregno@collabora.com,
 linux-kernel@vger.kernel.org, shane.chien@mediatek.com,
 linux-mediatek@lists.infradead.org, lgirdwood@gmail.com,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 robh+dt@kernel.org, kernel@collabora.com, tzungbi@google.com
Subject: Re: [PATCH 0/3] Add missing dt-binding properties for audio
 components on mt8192-asurada
Message-ID: <YnlbMjTEORFSbxXS@sirena.org.uk>
References: <20220429203039.2207848-1-nfraprado@collabora.com>
 <165211666198.1065748.1151009730882312510.b4-ty@kernel.org>
 <20220509181629.ettskdxfvwvqaq76@notapiano>
MIME-Version: 1.0
In-Reply-To: <20220509181629.ettskdxfvwvqaq76@notapiano>
X-Cookie: Boycott meat -- suck your thumb.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_111940_048003_EB70E623 
X-CRM114-Status: GOOD (  13.77  )
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
Content-Type: multipart/mixed; boundary="===============0997563616491435096=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0997563616491435096==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4y1TD9hR4+zXz6BZ"
Content-Disposition: inline


--4y1TD9hR4+zXz6BZ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 09, 2022 at 02:16:29PM -0400, N=EDcolas F. R. A. Prado wrote:

> this series wasn't supposed to be merged yet, I'm in the process of prepa=
ring
> and sending a v2. Well, for patch 1 at least, which needs some improvemen=
ts
> still. Patches 2 and 3 weren't going to be changed, so those would be fin=
e to
> keep merged if you want.=20

Please send a revert for the first patch with appropriate changelog if
you want it dropping.

--4y1TD9hR4+zXz6BZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJ5WzIACgkQJNaLcl1U
h9DR5Af/TprbNPs5eG3YL7V+LKRWqR7r5/vg4Mv3tT5GnibQHJMnJKNy2UouZxTo
rkacxPv3r1VyUUeK8zHUkyzJrNx2E3UkAlpZ1lwC/HERm66keB5ugaBQpSDEj9/p
ACsF6I1K/fAJq4cwI0vhDWWUXG5Ha0veDao+qfUaTVOyn4EsHCB21OBnsJFRTuLN
26cIS9fHHyxKc055J2rLi4LqpTdxVOuuuJXkD4ScZmflZkEfH1Nea8JMeCnPnXXy
AANm+RFzCi2lMMAO8BCv8PQCbuDxJHXCbx71WenqSS0Cd+r3VlGv5u19fZRGuv0z
k8nbklED1MQtWoNvx67Kz6aY9MpB1w==
=BxKV
-----END PGP SIGNATURE-----

--4y1TD9hR4+zXz6BZ--


--===============0997563616491435096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0997563616491435096==--

