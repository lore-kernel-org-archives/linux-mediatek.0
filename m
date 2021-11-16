Return-Path: <SRS0=fhAu=QD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B935C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 14:59:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A4C161178
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 14:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3A4C161178
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G4pDxPD0YlF69QNS+tS+PzNCJmI84cBKtgktTHuR5i4=; b=Yh/EzYOxXkTCZdv5OpRn7YfMzs
	zBJhIarVyQQRQcTpqrib2ZjPjejodtatuDbQ8wozmE0Eo5vT+4EQtW+fQ4MlJVL4iM7OuIYyZwYM+
	YBUeHJYvLj7OXgx6evgVHCKzsar16eoy3QS+fJQte7JJF+dzpRxt9mgazrAs/Iiw8FdMVxIh3OYr9
	2J7bvePbEHEqX+7eErC4G5uvRxPGKv5y1PB/s1bGoFrVLiY0jY6C2PmevVkKIQErL5cVfBmj18J7u
	Bgjc/bo4T70u5W1wL1t68dAc8GQ/j0ss1kaiK+kQpx7i+7oxu2B5UlI9nOtTr7q/K4d3HWyaeV6wu
	lSaJ2jFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmzw5-0023AQ-OX; Tue, 16 Nov 2021 14:59:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmzvs-00238W-Ny; Tue, 16 Nov 2021 14:59:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A60AA61C4F;
 Tue, 16 Nov 2021 14:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637074776;
 bh=kLgNCOXcOMdbR7IPP44gOExLnRjFLRrAYmTTznSGFas=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PEt18bk582cM292euP4s0OwFA1lx3lzTTclKy3RNrQ4QN2xysp9MJJSw7MGDMM9bH
 RNX30oV5vCIzcGXZ3oIULBZkWjAC5b0BJPnXeTziRvUR0cL8PUJvgF0msn25RAylB9
 hg7oPwHtqPsEYP5GG9CzRatQF6/l0DWdeT0Z8iruXDO72CV1FcF9jHuK8zB7nI32Rm
 0u3tSnLIV6IQ0D2rKkx3Bo8j6mqp7HQxvqzTPG03hT83tt0r9pv5Zk1/ofT6/1hQLi
 eNXBow7yOCqovGhoca+j4usdpXbcdyElvdv6wvrx74u4+i2pixjcOD3GvttY5KKGkU
 6EzdhT/s4h7Yw==
Date: Tue, 16 Nov 2021 14:59:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: YC Hung <yc.hung@mediatek.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 tiwai@suse.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 daniel.baluta@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/4] ASoC: mediatek: mt8195: separate the common code
 from machine driver
Message-ID: <YZPHUmDdGF/59XqA@sirena.org.uk>
References: <20211103100040.11933-1-trevor.wu@mediatek.com>
 <20211103100040.11933-4-trevor.wu@mediatek.com>
 <YYP+l7tMofYoB+aC@sirena.org.uk>
 <b4360ea17c3045759e85ee13fa9c001afe73c93c.camel@mediatek.com>
 <YYVQC7KLZx8oxdXT@sirena.org.uk>
 <e404d241-0685-643b-4b9d-d85bb8783385@linux.intel.com>
 <YYVez/V9ocCXhYmg@sirena.org.uk>
 <4e876c89ee58cd1408511a34573005e3df359cd0.camel@mediatek.com>
 <f915d1090abf2b6d188ce27068919a181828e463.camel@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <f915d1090abf2b6d188ce27068919a181828e463.camel@mediatek.com>
X-Cookie: UNIX enhancements aren't.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_065936_822089_2DB5A1F2 
X-CRM114-Status: GOOD (  15.50  )
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
Content-Type: multipart/mixed; boundary="===============1793317706358973610=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1793317706358973610==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YuLN/D4BxE4Sko6x"
Content-Disposition: inline


--YuLN/D4BxE4Sko6x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 16, 2021 at 05:33:48PM +0800, Trevor Wu wrote:

> Is the reply from YC clear? Any suggestion would be appreciated. If you
> need more information, please let us know.=20

Not really.  It's super high level and only at the driver level, not
talking about the hardware much.  As far as I can see it's showing a
single physical system and even seems to have what looks like it's
supposed to be two cards connected together which really seems like
it's a single device.

> Additionally, it was my understanding you suggested that DSP routes
> should be configurable in some ways, and we should not just add a new
> driver for SOF in case we need to support some other interface
> combinations in the future. If I'm wrong, please kindly correct me.

Yes, I'd not expect a separate driver depending on system configuration.

--YuLN/D4BxE4Sko6x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGTx1EACgkQJNaLcl1U
h9DQcQf/UeSfcn6HVEpGYxZ8QFiUTj+pbv+kGdokbgKrS0ecwwnxMi4Py7KS5Z+G
t3FU9D3QiuU1BnHL92LIKT0wdYM7r7yededEPF0t8bnU4+CiO6nJbCRNp9E3jfPA
wlXwe7J+sTEWqmJ+HUNIX/MVHTBdAPwSIyYHWQmB3CgC2WDX8oLsLwobCOCZyh9n
7hdw4rjGE5m4P95j+SHERYBB1osAixaTLMrQ4aa59f5epfn0M5iQ0ABQltYIR48u
DOyGK2ZiJUs524JKVVbHtjz/JY3/SJqlY2DQKIt3vePa/fNNowo5Fjv4oReFJoQS
uek9HwybelDl1KbN9VhWNQDm2SyfsQ==
=42uA
-----END PGP SIGNATURE-----

--YuLN/D4BxE4Sko6x--


--===============1793317706358973610==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1793317706358973610==--

