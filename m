Return-Path: <SRS0=JQKK=7A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC54FC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 16:59:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B264220758
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 16:59:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="deAaBcQn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="HHEGijKf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B264220758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WEfDujEiJoa7ZpK6tjlfj3MhOecRACGivMzzR+s6Sc8=; b=deAaBcQnWP/9tT0C99ZnvDZLV
	b7KWs8rn8nM8Jgrxof4Nfqg3fBNCbUel/YqoctHOLOu4l22gdjQMMF9e0MSH9eXnc1JBGiGVSF2I+
	tO7Mlrha39bQifRaonbpgJ8TNOZJBWU0DXn7F1WWxtGji2ShxdeA8vM0nIE58VlOM9fpmngrKrOLG
	EgTf+chQkm2wqN70bkDqGUNiQA4SBcZcgTGCuytTs5OZisAmsq08QQFfF3dtaYpx/i51OsEA8EImn
	DT2yCXC0OmvqTAO9qUxblZKjYsoPVJgkbiCtlzyIBqpOgiDOpekIt6IbGafRcJcBZANb+yBkRThNR
	fYXUe9fsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaj76-0005SH-RI; Mon, 18 May 2020 16:59:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaj6x-0005Io-Qk; Mon, 18 May 2020 16:59:33 +0000
Received: from localhost (p5486cdc1.dip0.t-ipconnect.de [84.134.205.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9804F207ED;
 Mon, 18 May 2020 16:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589821171;
 bh=w0HNXMQtb5MPVWf1AAAYPOcwduF4qerzU22fA0gSZiY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HHEGijKf2tjytccux+SuPlDtZb3iKDYVNS3Ck6aivHYkEgdwJogUZYvrqXz6/6nBd
 s+TW35CSH6gLtriPMS/4JmHCYvVcQFvC0xyfm2hZ7H8e+HGLqiYSqRYKAcmUixHg+8
 n8ycxmeFNXpxpd/UERdMwyR6PRtqDnuwYSa8pjt0=
Date: Mon, 18 May 2020 18:59:28 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Colin King <colin.king@canonical.com>, qii.wang@mediatek.com
Subject: Re: [PATCH][next] i2c: mediatek: fix integer overflow on an integer
 multiplication
Message-ID: <20200518165928.GA5109@ninjato>
References: <20200518165529.57821-1-colin.king@canonical.com>
MIME-Version: 1.0
In-Reply-To: <20200518165529.57821-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_095931_883579_4D78BC60 
X-CRM114-Status: GOOD (  16.37  )
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============8630000576322847439=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8630000576322847439==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2020 at 05:55:29PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Currently the calculation of sample_ns is using a 32 bit integer
> multiplication and can potentially overflow. Fix this by making the
> constant a long long to use a 64 bit multiply and hence
> avoid an overflow.
>=20
> Addresses-Coverity: ("Unintentional integer overflow")
> Fixes: 5f1ae73d538a ("i2c: mediatek: Add i2c ac-timing adjust support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

CCing the patch author.

> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt6=
5xx.c
> index 702061805925..c93492b997ce 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -551,7 +551,7 @@ static int mtk_i2c_check_ac_timing(struct mtk_i2c *i2=
c,
>  	const struct i2c_spec_values *spec;
>  	unsigned int su_sta_cnt, low_cnt, high_cnt, max_step_cnt;
>  	unsigned int sda_max, sda_min, clk_ns, max_sta_cnt =3D 0x3f;
> -	long long sample_ns =3D (1000000000 * (sample_cnt + 1)) / clk_src;
> +	long long sample_ns =3D (1000000000LL * (sample_cnt + 1)) / clk_src;
> =20
>  	if (!i2c->dev_comp->timing_adjust)
>  		return 0;
> --=20
> 2.25.1
>=20

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7CvuwACgkQFA3kzBSg
KbZ6Aw//ZeFST6GFjXIXi4OO9acwzfy4x/KqHdw2rfZlnN+ZtibcHk91s8Rnkdxk
7H8sRbJ+28ketszWJnKuhtD8z0+itUi9H2mgbV/RKhPfAzWOoLdt6fLq9OA0KzZh
Ap82nlpIpeVdr7RK+YxcUE9imjdX5bO9fZszo7uwupiUvYm+8hg2K+N8/ZS9Gz74
AEVfRRONIT9Eg+sGk+QNa8wXRitDVsXWrO9ZCWOwEJENotDFCzhUp1qv8AvoF6tq
x0LdEjnpKBe+1rl990NdipL5JBOkh6XTiWer9juE9RyRHZVshuj9CAvyVFYGHCrB
eXB7Ay8S1zkvNgK9kCD3zf1op1kCAiy27RIB2VMlyMX/FzoI/grRInTgO+ApmFW2
e4ZnM38h3lLBXZcho3JjONGt13IMhG0nTR+IWD8yEluXhoKEqZ6EU57GowCS8/sq
it5j0wZZFHLiAMty57Jg4run6MwIDkoCMZqQuPAO17kFstPBKZ8tNIQi1one8CwU
MjgT8Z8yZfaTffAWrhAEldeB3osQfGMbA3mQGdGtLgk5lNNvEAGEWNENzUduANJx
Pj1pvoNcT4rMrLawMbUQbcYLdk4s2vULjtEkyGIbWoNhhJRGT1W9GwmDWaIoiMoh
6xb0jHycEOQOW1xyc7Iw5d2wS67l2y92J0ruBCvYgbUJ1bkJfUA=
=KBYJ
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--


--===============8630000576322847439==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8630000576322847439==--

