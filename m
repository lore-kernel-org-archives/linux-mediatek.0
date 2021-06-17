Return-Path: <SRS0=zq7C=LL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28476C48BE5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 16:30:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB669613BA
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 16:30:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB669613BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UdUTbFQ4PYwKaGuXRYSET2ahOy6EdUSaUH55bHJWQ9o=; b=ju8mBEaR1rc9952sffWkmasjEI
	WpC3JlNyMfUyAOertc/W56WGAUPS2qcWsyBIDmjQCZMkkjznf2hKtgsyHI5Q3s6M4DrTpdRcYkreo
	7ETO/Ewa7EhxYkgyF9EW9w+X2yrsD26SetVOZG13MX25ZE99NpWwTE+ETTOy4/W1O9iAmIwka1jBr
	6+hVhwzlWKZDo+ptyILPZgL0mPSLuqo2yOztxgUbsiiW9rvDRViqrqqTugmhrhYQ++Ek7Be7P2wki
	eLEqlvdTT0oF2dIgeEbCj5iRfx80Kz5mSOWm5wQXpVWL1DkQWjjRXctAOBxs2DtHrW2t8NcXQBaiH
	YtSQCqFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltutt-00B7Hg-Po; Thu, 17 Jun 2021 16:29:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltutg-00B7Ec-PJ; Thu, 17 Jun 2021 16:29:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E294E613BA;
 Thu, 17 Jun 2021 16:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623947380;
 bh=h8mWdalnwqOGxgPzDDjfRank/448I/bBBc4d6qKMLj8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LvZ0+KKAuAFqDjU/hLzVEd/T///kIjlioxINYjvjY7itetWi7+YvxllivGbc8WZCA
 ORi9Vj+QxOVl5mxSGnXm3rnUbFdSJRtgVd3zyegtwCxVEeq3uHQVMZsoUFYEtUdzMm
 AMHHcEKm/UdgfO/1cSxmAhUe/3ZPmUuhZjB0XkoSlesVpDNSsQclTVcEzCqUejVc3Z
 hT0kUcrnqEfr44kKGRNLVCfuRtMItcmE6KXjzrWYYWb6lIIu5vLgXEUaKKtZC9nCfN
 7g3gTL9VyYi/X6olvFozUsgvwlVkp06+lQKmQ1G2Vh5KzlXVbUztan/2qWZ/nSsFJ9
 85uOir0giuq2Q==
Date: Thu, 17 Jun 2021 17:29:19 +0100
From: Mark Brown <broonie@kernel.org>
To: ChiYuan Huang <u0084500@gmail.com>
Cc: Rob Herring <robh@kernel.org>, lgirdwood@gmail.com,
 matthias.bgg@gmail.com, gene_chen@richtek.com,
 lkml <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 cy_huang <cy_huang@richtek.com>, gene.chen.richtek@gmail.com
Subject: Re: [PATCH 1/2] regulator: mt6360: Add optional
 mediatek.power-off-sequence in bindings document
Message-ID: <20210617162919.GH5067@sirena.org.uk>
References: <1622616875-22740-1-git-send-email-u0084500@gmail.com>
 <20210611201643.GA1583875@robh.at.kernel.org>
 <CADiBU39Prz99ZLtkYdcM9XDQsd0nKKeiEGjW3wq=u75JGjwX=g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADiBU39Prz99ZLtkYdcM9XDQsd0nKKeiEGjW3wq=u75JGjwX=g@mail.gmail.com>
X-Cookie: But it does move!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_092940_896538_1AD39EFF 
X-CRM114-Status: GOOD (  14.23  )
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
Content-Type: multipart/mixed; boundary="===============6461704136122278774=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6461704136122278774==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4C6bbPZ6c/S1npyF"
Content-Disposition: inline


--4C6bbPZ6c/S1npyF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 14, 2021 at 11:04:01PM +0800, ChiYuan Huang wrote:
> Rob Herring <robh@kernel.org> =E6=96=BC 2021=E5=B9=B46=E6=9C=8812=E6=97=
=A5 =E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=884:16=E5=AF=AB=E9=81=93=EF=BC=9A

> > > Originally, we think it must write in platform dependent code like as=
 bootloader.
> > > But after the evaluation, it must write only when system normal HALT =
or POWER_OFF.
> > > For the other cases, just follow HW immediate off by default.

> > Wouldn't this be handled by PSCI implementation?

> No, the current application default on powers buck1/buck2/ldo7/ldo6
> are for Dram power.
> It's not the soc core power. It seems not appropriate  to implement
> like as PSCI.
> MT6360 play the role for the subpmic in the SOC application reference des=
ign.

If this is part of the overall system power off that seems like it fits
well enough into what PSCI is doing - it's got operations like
SYSTEM_OFF which talk about the system as a whole.

--4C6bbPZ6c/S1npyF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDLeF8ACgkQJNaLcl1U
h9DoNAf/ay42021AEwWsgvVf64PZ7bfN1VQtq5/Gvxa3qKXwvF2ElhI0rEWVv+TD
ykW5worWSNVBlrmXT5e5pG0vDPAqQ4XSgOsubJCj7BWz/o8vebLSclpZz0PDQCav
Dbt3qvsDnTcOMOMucTRf2X4u9SHAVgE06JDUiZTcEqprRk4Vd4ye6i6REqw2t2wX
ydNjf2EsU1b9nzoVuyzhnLA9p1p5wiiYEzhCoFw+4x2BYypYNT4bk6xRQ/IitcIl
ZrtklyKL+G3Ty7Ul9AREvr++U177bA902zg+5kCh2NvrmcPDwQahA3zx06NePexK
B6Ch9wofiE4v/hRfzXuS7w4Q85k2Vg==
=/WVl
-----END PGP SIGNATURE-----

--4C6bbPZ6c/S1npyF--


--===============6461704136122278774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6461704136122278774==--

