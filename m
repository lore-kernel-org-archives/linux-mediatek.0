Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA82C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 15:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VdcalMCeF1MMF5E1om7yjtwGVg6A0AUrtDhEO/M4x44=; b=oAlOFBo4VldNDRZNTw846upi5a
	5XtAFoAGZrQvPlrsBRYraOznG5n1zZpJ8v/L9k7IrObie7wwaOgLjinJSwnfxrpVIPl9lpNe/ISnf
	1ShQEddqNfux8CZ1mn+mY3MYOIC/1OYrNXM5jkNverZEb5iNOFGvk0FJut8qAvGKPAxOo1CsIuPhb
	Q8iNR4oRr3mKXUJsnVG211jjbYgD2Hep2PY4Zjwa3piI+CoYN+22iJiL6Jaso1U08P9fYxlIjglj1
	MkKn1X1eglEAvAAHpf3ak4+qS2MCLoC9NJ2y6aDqvq3mFXy8mOfU007N8rcRxlY1LS6rXvy1EdRjS
	QWWWZtNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP4HR-00HFPT-TI; Tue, 01 Mar 2022 15:19:13 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP4HC-00HFGO-Rs; Tue, 01 Mar 2022 15:19:01 +0000
Received: from localhost (35-123-142-46.pool.kielnet.net [46.142.123.35])
 by pokefinder.org (Postfix) with ESMTPSA id 9657B2C00BF;
 Tue,  1 Mar 2022 16:18:52 +0100 (CET)
Date: Tue, 1 Mar 2022 16:18:52 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Kewei Xu <kewei.xu@mediatek.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 qii.wang@mediatek.com, liguo.zhang@mediatek.com,
 caiyu.chen@mediatek.com, housong.zhang@mediatek.com,
 yuhan.wei@mediatek.com, ryan-jh.yu@mediatek.com, david-yh.chiu@mediatek.com
Subject: Re: [PATCH v10,1/1] i2c: mediatek: modify bus speed calculation
 formula
Message-ID: <Yh45XIAnC9mQNqyr@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
 Kewei Xu <kewei.xu@mediatek.com>, matthias.bgg@gmail.com,
 robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 qii.wang@mediatek.com, liguo.zhang@mediatek.com,
 caiyu.chen@mediatek.com, housong.zhang@mediatek.com,
 yuhan.wei@mediatek.com, ryan-jh.yu@mediatek.com,
 david-yh.chiu@mediatek.com
References: <1645100563-59441-1-git-send-email-kewei.xu@mediatek.com>
 <1645100563-59441-2-git-send-email-kewei.xu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1645100563-59441-2-git-send-email-kewei.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_071859_092880_96930430 
X-CRM114-Status: UNSURE (   8.75  )
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
Content-Type: multipart/mixed; boundary="===============6233768455757731354=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6233768455757731354==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GUdQBt0v2xcPs6AE"
Content-Disposition: inline


--GUdQBt0v2xcPs6AE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2022 at 08:22:43PM +0800, Kewei Xu wrote:
> When clock-div is 0 or greater than 1, the bus speed
> calculated by the old speed calculation formula will be
> larger than the target speed. So we update the formula.
>=20
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Applied to for-next, thanks!


--GUdQBt0v2xcPs6AE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIeOVwACgkQFA3kzBSg
KbY+Ag/8DKZF6+5v+fhOkRi1ryNi19EnaO8Gxu81up/6Z0iJUqpNit5DTeWAa0r2
j/HUbLyFI9eXU+UBTSPF0Bf6FClRQYyV2fATBGPz5THXgg+893RgcSvKKauFv19l
u0SnOFaK9RbIAc3dwRbARNrfD9aaXOriLdbRHhYwmIImaIQLs4Z4yCI49HfvCGnW
/duo+0aP+3TWbKKNJLJiV2UhepW0cUg5ksyo5myAHxafV6DgPplry1Tl5fCku3L3
RGLmHG8b5IECvbj2NYVWGsss6zTE1zCCJAmF80hJvmprzwpnN+HSCCKmwRoRafPT
lOUInQlQmGBxkbFYu8HeNM6EWUIONlto1H6ZAEer0gJVn1B9lzdTjuxBTsnO7IPH
x2vYseUH1mKRcfPGMlJS/q40v4jF1Q5eU+gbptjxPcwF0q6KLYw9Wxfl0Kx/TQ2V
Ne3uc/z8+MkjBebwSZkYCc9ZiL00cBADaEWd3J4F+MYuJeY8Dl/JMDQdup60khDE
4x+RZoodR2t6KvgEz7GdnBFqE4dA9RXuamQxYZqP46vzC/ogJ7Xzfg3UiD+651M1
HjL4LRCHbVXl3etzVvRxItNjEKP9CLM8xGZ5JDhI90qHPCz9gl8+9GHVLTiZdqZO
HtDVW2SD8bihM92LKMcrxCibRJ3frQ9LbfyhYeo94tsLUCYALAk=
=M8Mv
-----END PGP SIGNATURE-----

--GUdQBt0v2xcPs6AE--


--===============6233768455757731354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6233768455757731354==--

