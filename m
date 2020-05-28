Return-Path: <SRS0=lKUU=7K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE14FC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 13:30:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E240207D3
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 13:30:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m0pQgv9r";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="e2a6o2ZN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E240207D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BwtnjswNOvXKI2DIIlV54sZuPIE8w89JydeFc3CuRCw=; b=m0pQgv9rqFhR7urEiRgBzF3q3
	OhOZT5g8tO9bgi6jGmPZelZaGcO/XanHBu5qqruCgODuehPOqNn/cd3wkPMapO0cLPcncQd2FAxN7
	phXCy/ZOeNZIX+qt3jQERuaACAour8c3c348eJ7yCYVhpnp/yITAIp7/wD+oMjS0U8ZrMGAAsX+4b
	OmNapYQcEPxQ9kfeELINzXX/45n4OKq+KZ4hy8DpjThw0AjKlgenNOe2BcmLo06A/DkDplla1IRcj
	m0/5vJ793rM8Xuon89lQsJMIQIUngkWOrmJfdWZ8Rn6NuR9DLVai0PoIX4L3QS/gi+eC5nnkQo+d/
	+KUYNw15A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeIbb-0001RC-8r; Thu, 28 May 2020 13:29:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeIbO-0001GT-Ie; Thu, 28 May 2020 13:29:43 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 657F5207D3;
 Thu, 28 May 2020 13:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590672582;
 bh=VbVffYZ9WuhrTKtlvAZN7dWKp6BJwRmGIOc4s2SHMVM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e2a6o2ZN6Np0K45Iawn8mRD4HE3IlheKZ8Q+L5IcK88V9cyt75e174rdcp9rbMcHk
 IDPXs4jfsoyWbNc+vbUrg2haSKzUHFxhsmQxCXYKbzQ9h6rew50Mfz86o7l0jflU8r
 G/iHlnSeeX/Yc4LJmCTwxHThDoxF24h3fHuoptts=
Date: Thu, 28 May 2020 14:29:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 1/2] regmap: provide helpers for simple bit operations
Message-ID: <20200528132938.GC3606@sirena.org.uk>
References: <20200528123459.21168-1-brgl@bgdev.pl>
 <20200528123459.21168-2-brgl@bgdev.pl>
MIME-Version: 1.0
In-Reply-To: <20200528123459.21168-2-brgl@bgdev.pl>
X-Cookie: Small is beautiful.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_062942_635626_5A30CB12 
X-CRM114-Status: UNSURE (   6.68  )
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
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 Pedro Tsai <pedro.tsai@mediatek.com>, linux-mediatek@lists.infradead.org,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0707581993491489116=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0707581993491489116==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/e2eDi0V/xtL+Mc8"
Content-Disposition: inline


--/e2eDi0V/xtL+Mc8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 28, 2020 at 02:34:58PM +0200, Bartosz Golaszewski wrote:

> This adds three new macros for simple bit operations: set_bits,
> clear_bits and test_bits.

Why macros and not static inlines?

--/e2eDi0V/xtL+Mc8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7PvMEACgkQJNaLcl1U
h9BJSwf/dYRTjyQ2Yy7iTcNYVOuamZoSQgG3ZL6ANS748UWNttQaOUnNCc46dxSw
MowHobHyRDcWopIfxiDE/ZiBeNAZD971eifLIHjTnHtUdrsZWXrsfGg/BSUGJYTA
pRhv0h3uHXvIBlGhOXCGcuNDUV+bAhHv0xWr00E0bKIjoHff9Rnw9PaEOI24sSzy
x5NVhciZzUFnROu1RHResg2qzDYcROM5lNBaOnz3tD4+0E2YtF0dgoQYnf0WjWV3
R02uaFjFRsfdbr+NmpoKgVKbzZa+Z9/0eY3BYBiBk9MdfkJaex52O55AiGHy6V8v
W4E4Q9Nh0PrJJ+AZwItYtnNqeaWSQA==
=dUDC
-----END PGP SIGNATURE-----

--/e2eDi0V/xtL+Mc8--


--===============0707581993491489116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0707581993491489116==--

