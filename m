Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4470EC433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 10:38:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 115FD2072D
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 10:38:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MUCcutvE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="toLXAql2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 115FD2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FB69l9xk1FZoZTl8MXFoBK+LZmEPVYRM83N0n97c5UM=; b=MUCcutvEAZttuDk5razuOBYKj
	PyQDU3geJ8mIv9FzAwKkomPTfWA1ThQMnx4OMnG2GJs8WIHRUql89TrNomENpik6c6XZaeI04Iai6
	1tzzLQECgpE53SCJjYOER1NneRq7GeDeQr42cIIVkgWe/BkgJYecjFpKakKaxgzp4a/LvAvkO104S
	kTf5uJ61I5Slt/psRKfq1cXabfB45T0B5rIXUXaVxHXEJu7pW5XS3mdtQg8RBE3crXgc5HqVoekjf
	It/CaujScSFHMvX7fiNZj68cLxHDERqEhqN5+Zyjn9Z5ED/z8Fh0u3BBaruu/TmIDWLELAN6/ktbX
	As3HojsKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8LTt-0000NS-3v; Wed, 19 Aug 2020 10:38:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8LTn-0000Lh-3A; Wed, 19 Aug 2020 10:38:03 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BC7B52072D;
 Wed, 19 Aug 2020 10:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597833482;
 bh=y+M69Til1EvJORNhPxvngspprJECf70sXE+hyFMk3+Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=toLXAql2wtllHm023rx293u6rgtg4oRalT1G7c7wfPh7zw6tadzcKc0nAX0mtQSv9
 cJCv8nopRHdF9FKLtrxwQZ8GdvEdfF2+RWPKX1UAnOfdE43dVszrqRdv7WbdIxH5JE
 UIM61liYddD+z/S7aiK9zvrhAesojjkLfn5YxTb0=
Date: Wed, 19 Aug 2020 11:37:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH v5 2/2] dt-bindings: mediatek: mt6359: add codec document
Message-ID: <20200819103730.GB5441@sirena.org.uk>
References: <1597644455-8216-1-git-send-email-jiaxin.yu@mediatek.com>
 <1597644455-8216-3-git-send-email-jiaxin.yu@mediatek.com>
 <CA+Px+wXSbGLb+AZnF8ETRycRUVjqk4xacm5DH6MzuMw0vh6Wzg@mail.gmail.com>
 <CA+Px+wUMXoSL6w0wBduE7obJRWgCteeT8=_=U=8LR34JKTTGZA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+Px+wUMXoSL6w0wBduE7obJRWgCteeT8=_=U=8LR34JKTTGZA@mail.gmail.com>
X-Cookie: I wish you were a Scotch on the rocks.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_063803_254459_008B3E7D 
X-CRM114-Status: GOOD (  15.26  )
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
Cc: ALSA development <alsa-devel@alsa-project.org>, howie.huang@mediatek.com,
 Takashi Iwai <tiwai@suse.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 shane.chien@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, eason.yen@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, bicycle.tsai@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============4023337924594562016=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4023337924594562016==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/WwmFnJnmDyWGHa4"
Content-Disposition: inline


--/WwmFnJnmDyWGHa4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 17, 2020 at 04:11:03PM +0800, Tzung-Bi Shih wrote:
> On Mon, Aug 17, 2020 at 3:29 PM Tzung-Bi Shih <tzungbi@google.com> wrote:

> > > +required:
> > > +  - compatible

> > And the same here.

> I misunderstood.  It still needs the compatible string to match the
> corresponding driver.

No, it doesn't.  The MFD should be registering the platform device.

--/WwmFnJnmDyWGHa4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl89AOkACgkQJNaLcl1U
h9Dwbwf8COv9Rs7LMNn91TpJLXgOTRfXxwmnESd9+12yTNqmd+k9YAgp3PaB7PBq
GX1hQYeOeClZMGMGnjCt2RAkfT5A0/5SwKVsASefRpA6CTlKNCUk+5WQ6pK/LLqA
TH0RRiA3Z8ZS5WfUsZrovdCsHlCEQ+gCNctOyf3RqmX33RmycE1YWyWlQS3qLK7v
W7/F7t/mOMbrEAT4a4YHtbSYf/xT8aDr81GyndfpV6zwtQlWAmw4lI2IT0+XX4hr
BDwHxr6/Te3UgU6p+9xq5UgrIyXkR5htNv+49VqxNFNUhhPMgd00IO47kda9kvHP
rIO1YU5Mf+STMsbFuTk3zmEfud3FkQ==
=7xtJ
-----END PGP SIGNATURE-----

--/WwmFnJnmDyWGHa4--


--===============4023337924594562016==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4023337924594562016==--

