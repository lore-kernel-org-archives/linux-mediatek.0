Return-Path: <SRS0=Y38d=MP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A32C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 13:52:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4E7760F22
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 13:52:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C4E7760F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wMic4kQn3qHNX/rey+sQo1RCVhxuONANtsFrzMJAeG8=; b=jf8nBxFNcEYrIPrqgv/PMWuYkY
	GM1EFon3PD0rsC67PXlBtLi6p1nzIEB92XXjuKVSAGWBV0VAeqym7F7QFiMihCGbbqE9el+IS83t/
	yMzLQlL0iCFN8r0SdjfPY7FeIb6QspmALmi8qwmS2sywuN+xdi2QoDwNe389wg1xlRI8a1pTpI6nf
	Pxgy6OySFgzn7SxbMzASnItH5GysTQ4e8IMqEGqFZc84WNwzZzVSTswif2MOkmV5FbbptjPUj88zo
	IG6Ofc8sC9sNn+8mQyoQsjsknUNdVjVoV0p4ZDIbkbmxyyHgST89EDUxP2LV5BEcf7sI4W3N/RQBA
	GrLVCNcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6vbC-004vE0-AU; Fri, 23 Jul 2021 13:52:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6vay-004vCU-4S; Fri, 23 Jul 2021 13:52:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 535F260EE2;
 Fri, 23 Jul 2021 13:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627048327;
 bh=jFk+0LMES7S6Ja8o2wsbPLKGH7j8TpUeerYAYihrE5g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fAgesXjxnCrHQFC63+0zu1QAnLMUb/krMXzvhoUXFpw/hG/JnsJBmsrsYBv15zVWw
 lDw+h+lom1f7KghsRfKm1UaoKqdoDOzwtMQypaJO+wfyrt62D+4kFST1838j47HWZx
 qOITCI0JMt9qS35PfGfGKGQbs2lBYRHjzC5W5Rdc23BJmLBub8UXazhRhUCQrsXkuF
 MPsNW10Xvax40ERdt4FFhEeeubP+z3DlE3d+7dEYnll8ftGeI5qVRj0X64d5soll5u
 euA+ofLq32pIPgsslGmcK7NRJUP28V+rvZX/Gs7E6CUk8Fq3ZWo0IfXflyC5xNLHFN
 iGnih1/AzMueQ==
Date: Fri, 23 Jul 2021 14:52:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: linux-mediatek@lists.infradead.org, Frank Wunderlich <linux@fw-web.de>,
 linux-arm-kernel@lists.infradead.org,
 Leilk Liu <leilk.liu@mediatek.com>, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Peter Hess <peter.hess@ph-home.de>, linux-spi@vger.kernel.org
Subject: Re: [PATCH] spi: mediatek: fix fifo rx mode
Message-ID: <20210723135201.GC5221@sirena.org.uk>
References: <20210706121609.680534-1-linux@fw-web.de>
 <162608669457.4543.2374973099687363958.b4-ty@kernel.org>
 <363C87CD-F0C6-4A46-877C-86E07D14787D@public-files.de>
MIME-Version: 1.0
In-Reply-To: <363C87CD-F0C6-4A46-877C-86E07D14787D@public-files.de>
X-Cookie: Integrity has no need for rules.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_065208_233308_AF2C192A 
X-CRM114-Status: GOOD (  10.07  )
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
Content-Type: multipart/mixed; boundary="===============1954292879762709503=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1954292879762709503==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2JFBq9zoW8cOFH7v"
Content-Disposition: inline


--2JFBq9zoW8cOFH7v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 23, 2021 at 03:46:02PM +0200, Frank Wunderlich wrote:

> Can we add stable-tag i've missed to fix older kernel versions or
> inform greg to add patch to at least 5.4/5.10?

Let the stable people know once it's in mainline (IIRC it is already) -
there's a good chance they'll pick it up anyway based on the commit log.

Please don't top post, reply in line with needed context.  This allows
readers to readily follow the flow of conversation and understand what
you are talking about and also helps ensure that everything in the
discussion is being addressed.

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

--2JFBq9zoW8cOFH7v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmD6yYAACgkQJNaLcl1U
h9BS2wf9EAlL6oZ0DzmB1nfQW4jRM0cEjg0EP36GEgjC8qJ2a8SfLfNK5I4foIKf
NHqPAvnsWm1hNqFqT717/B3qkrIGD2xhp6RAkzb94IKJID4WA5KCazzjUr/AYHz5
rv2aaM/2qwq0F0vZAPP5d9Q7UqYmqceX9D9T/PBmVSwq6uyhd1lWngh+QR70HYB1
n6XFqMkkujk/fXP5iWD9OUbI6EKaC4tclkJ/W8k/UvsffcKXM6NUzukrf4Mhl+uu
kTYYkuwsNymyAySnUmze07H0P4aLCYefYMtIpXW2fp7GkioLH0smBUL7GKLV43Eo
VSKbXqA+zjeKCooVhDXA+wlFBzOrCA==
=oWDi
-----END PGP SIGNATURE-----

--2JFBq9zoW8cOFH7v--


--===============1954292879762709503==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1954292879762709503==--

