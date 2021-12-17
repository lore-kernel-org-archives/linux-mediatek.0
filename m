Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3000C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Dec 2021 18:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D0ANEmNmbxMTWaH1/rT0KkEUkNpcY5XfKr+gAu32/qs=; b=C+XEuqu8/LtJhBOZRg8XYVMN1j
	l980gvC9gVnVo64KZAmNy4d1YAfTUUh2l1bQ5z3GRBFpJZbTLFkav8z7Iq6jWEAypkbgiKnygpm98
	qMHeOTfPNaRICGaBF2PCxlksRZJ+JA+s8+P4sUkRqHJpOJP+FUZprHmEaTJiIuyB5mPGj8x/DtbKB
	5ArcjnL9GrfHG+cZery4LbN5+rq/Yfr+A56NWJqBvEJby1Sib98YQNVuIfDVx2LDRFnSuaJ54stAm
	LJxI388j+G5wkxyjyIpMwESLoLD/DfNjU1xBR4S5yU1Bfvftf6PxvA/7XTzkc44YiAc/9d7jzrtKo
	JhT1FdYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myHgO-00Bh5H-4a; Fri, 17 Dec 2021 18:10:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myGau-00BKDy-5c; Fri, 17 Dec 2021 17:00:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9167F62321;
 Fri, 17 Dec 2021 17:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A7AEC36AE1;
 Fri, 17 Dec 2021 17:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639760431;
 bh=MIwrEAZOSHeYZ/APN7YkKSbncZZtDThY8jn6JIL8CA0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DX8FDndfNyFE+N7291noRiXlRb9+qYnSgy9+KOaT2n1UR4J/mr7fr/p92DUPZYSb+
 UBhevf5NlYqXrKHGqtB2qOlYvYGQRKvYIpOloYMHh8JAx9rlsy0gin5AxHvILGoPqv
 lcJBGinU++B42F0Gw9NWGlXo+lJAwCXi78iezQDnVZidBRl27iQ65mjI70o8Djpo8Z
 X5C4ngCBuKne7XJETFr+vL0whCwy/oGXozR1glUBtVWUf9Vu7WZgOt4zl/P1IDJZ+7
 8650JJaqiVvHuFpHVPconmC5xN7k2+YNuTOgoMraHY3sx2Mp3VxnZoh7E5GDB7F8Nn
 /7RM0RSL8HEAg==
Date: Fri, 17 Dec 2021 17:00:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc: matthias.bgg@gmail.com, lgirdwood@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] isoc: mediatek: Fix dereference of null pointer while
 alloc fail
Message-ID: <YbzCKoKGpGgAtvdq@sirena.org.uk>
References: <20211217165220.675485-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20211217165220.675485-1-jiasheng@iscas.ac.cn>
X-Cookie: Pause for storage relocation.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_090032_300086_6EED0D48 
X-CRM114-Status: GOOD (  13.25  )
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
Content-Type: multipart/mixed; boundary="===============4860212893890208276=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4860212893890208276==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JJqGkUrwTom4jERC"
Content-Disposition: inline


--JJqGkUrwTom4jERC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 18, 2021 at 12:52:20AM +0800, Jiasheng Jiang wrote:

>  		clk[i] = devm_clk_get(&pdev->dev, clk_names[i]);
> +		if (IS_ERR(clk[i]))
> +			return -ENOMEM;

As I and IIRC someone else pointed out there is an error code encoded in
the pointer if IS_ERR() is true, we should use that error code.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--JJqGkUrwTom4jERC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmG8wikACgkQJNaLcl1U
h9C91Qf/fsxCTq7BvFkf3sXZV0g4NXhdBia8H6U+ehwqkyRqwj9irbhmFZPa5a5e
IvWxSJ4e6UBFtL3ej0eVCEj/xcJHytRBC492G3RI+Hr1XPNtpfBY/eaGIZQ5Q9HE
KbwQ/ScMeoYRW3sGHtczrQrmd/LTXY+H47hICtq8CNriO56N6O1iISaXaMeogyfp
RyefEBtM5IUhcZsqbAhOpa4+v6EO6tWu3fUwUexUNF2u4vJm5r+V/yZGQaxmypSj
ecQFljvyjpT04PL/GOlPqgV2/qgiwlRDsy3SjsGPyrNiR2FWzbOXXdDxfjnxQnVY
XO0+74eQQmR/fCFEuXZKe3xxubVPFA==
=/dDZ
-----END PGP SIGNATURE-----

--JJqGkUrwTom4jERC--


--===============4860212893890208276==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4860212893890208276==--

