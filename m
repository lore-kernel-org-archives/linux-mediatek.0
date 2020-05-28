Return-Path: <SRS0=lKUU=7K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF5AFC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 13:59:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A70C120814
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 13:59:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zx72CY+h";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="MKEiduFi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A70C120814
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+3rhKCKMxKCNeEedxQpUX32Xvj+K2EWlyiuyYQS5NvA=; b=Zx72CY+hiP0zo5+w2LEDtrjr/
	hm6XXBy5suKjeEsWyKEyFgqPBYv923dcaU1Of1qXSF+SDPA7+l11vmSyOnH8MKrUdrghtSEKXdsY7
	iI3EycskO5b4N7j0RR9xOk/FoMbIaipTP0I69TXoG2UIrPf5W41PajvbxQ9xyt6IgpyEEInp3H0pN
	BM2USk191GJKwMum37zw3Cp/aec+/XqX2AWqyZo2EkLrZEo3w5OS4oC/mIk0poNvAfsn5ptNFLcCg
	vYqmG/HXP4/axAIyMkp4mE5nV53bL28beVQqy2fj0kD/6Mty37JUT33EmA/iAa3XucMKV/JL5XH/U
	e9iWGQIPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeJ3w-00009g-8r; Thu, 28 May 2020 13:59:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeJ3h-0008OX-Pf; Thu, 28 May 2020 13:58:58 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 82E4920814;
 Thu, 28 May 2020 13:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590674337;
 bh=33GJz+mC9GeZY2YmgHy7gFnjO7ILb8Ua0jkAQw0Q7sk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MKEiduFi9xv+EojGxMx1IoYDAlTurQtN+OSRAuUZJnRvF59uZyaeYskhYnI+fCehj
 dv/3K90YBT4XIjE/cC2RUPfj6qlFxWFnQJzbXWJJSD1INMj7Wxfms5KsCxhDRUTest
 Wh4mmocELBuByjLJbVA4du7IBGZaPTdfE11eYZ3E=
Date: Thu, 28 May 2020 14:58:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 1/2] regmap: provide helpers for simple bit operations
Message-ID: <20200528135854.GF3606@sirena.org.uk>
References: <20200528123459.21168-1-brgl@bgdev.pl>
 <20200528123459.21168-2-brgl@bgdev.pl>
 <20200528132938.GC3606@sirena.org.uk>
 <CAMRc=MejeXv6vd5iRW_EB3XqBtdCWDcV=4BOCDDFd4D0-y9LUA@mail.gmail.com>
 <20200528134802.GE3606@sirena.org.uk>
 <CAMRc=MdL5dkJ+BPzvYXTnLQ_sGtU_7n=8jeSa5=hf8u9Pm+0FQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMRc=MdL5dkJ+BPzvYXTnLQ_sGtU_7n=8jeSa5=hf8u9Pm+0FQ@mail.gmail.com>
X-Cookie: Small is beautiful.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_065857_858353_39D177B2 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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
Cc: Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 netdev <netdev@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 Pedro Tsai <pedro.tsai@mediatek.com>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============4131047508181868293=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4131047508181868293==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xkXJwpr35CY/Lc3I"
Content-Disposition: inline


--xkXJwpr35CY/Lc3I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 28, 2020 at 03:57:24PM +0200, Bartosz Golaszewski wrote:

> Ok. So I'm seeing there are a lot of macros in regmap.h that could
> become static inlines but given the amount of regmap users: how about
> we do it separately and in the meantime I'll just modify this series
> to use static inlines?

Sure.

--xkXJwpr35CY/Lc3I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7Pw50ACgkQJNaLcl1U
h9C0JAf/dNRWXvfYGQBfIcxntkKP8aep1vOHRifD1xl9zIeMOFNDJ+jgglCgD68t
LLZrN6cUDTo8C3G+FHwH6DGudq5wH8Ag7NsLhzL3SRn8Za4mDk1pxPBZ+tHJPizx
pqViqPY/vDilJVZ902oM2Fp6/9jFj20kbU7uxxr/xeAyARUeOETZDC/0KjXtqHVJ
tzq8L3i9Pz8trE7sZMCeZEf/xesIGKtC6+ZvXe3amr2x86TDxg3ikfIkjIe4+EJx
OjDpvAymwMPb8Y0THGwPr4UC7+9jCZlU9rVz+T1lwfvIKzfekY6YOIqopCBWRkBp
g/ew6KGinl54+fjsY3A++WgGXuWQZA==
=FKaC
-----END PGP SIGNATURE-----

--xkXJwpr35CY/Lc3I--


--===============4131047508181868293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4131047508181868293==--

