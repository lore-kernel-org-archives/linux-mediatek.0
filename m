Return-Path: <SRS0=AjBH=3J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 076D8C2D0DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jan 2020 11:54:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCDE1207FF
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jan 2020 11:54:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UHbXNqGy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+SZK1td"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCDE1207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jZEWw4TZ1cJyPj1G9ac3vSh80vh7ZVireNePtVj+r1c=; b=UHbXNqGyWr8KCr3v897lLRLVC
	WXJpOs8kKfd0xdDavzaQ+Kq2DezNIEK8pIQY/4Uh/Tf1qMqoFbJArf5jXsM6rEUHIRdKpnQ6+C8U4
	F7Y/JIQJzWRyGkLmCM95kZbFwS4i+liidTUP5xuZsRX++P/H1Og81g2WUQT5NtJCbNrp1f/Chb/6h
	giBEsju54JBR1xHShA4QBJ0hkJWyJ98H+Mw34JieDPH6ZijqnoBKG0hQwIig8nO1ThBhPK+XFRM+K
	V2oWIQDy/DMzwMuImouj8gD6P1cB8InwLnnSwjfF/6P1tEMc5Jng5Sg/daXlD4+FEFnmDTz6HT3Or
	AZcak/mew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itVdP-0006Mg-7U; Mon, 20 Jan 2020 11:54:23 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itVdA-0006DB-A3; Mon, 20 Jan 2020 11:54:13 +0000
Received: by mail-wr1-x441.google.com with SMTP id j42so29198151wrj.12;
 Mon, 20 Jan 2020 03:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=L51LKob5w5C99mhKOnpy+Hh/B3FukYOEDBWz4jiWK9c=;
 b=P+SZK1tduoWsaphyrSVBynJmE8NMwXDpwRrid9kQURsPEn1cooUkxWrAda/PWdfKer
 vbOMP37ZVUaFxH8zvFXZdCGUMDhDZt5Qc2ytkupEQRBV/LJ2Ant1VT9YQYTtkjYcmHjF
 tZu/5Kaqwvjy8q0JSJ9ZSHjf4v2+u4aU0aiGI5lR0ZTYFT7kPdGG4KFIaCQ4uZG84J1+
 9FPVFlhe2dDWRlw2fs+/Jlpxocw2foPBJlPlQLdhsfjzWpSfwVY9k+z9LLsBFgrgx7WA
 6Ot2ESuxjyNjOXZ9zILVbRe71IwviXJaT2TcpHIwOCCsSm63sjXkvugDg6sZ0tKKjkUu
 MCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=L51LKob5w5C99mhKOnpy+Hh/B3FukYOEDBWz4jiWK9c=;
 b=KMZ9N/vXMxFt6hJKyuL1UjwTdBtcRila8y5kkFRZ6oWBj6JPGACGNlJv21eeC9gwFZ
 DXe1QO+UNEBxHmeaoUgQMQLW8F8gsEoexp8FfhpzVhoFtOTwacGwqrKs0XvQQgaM8T9J
 3MzsRdyk90HcGhWsVnahrbYLw1vnrKx/la/V8DAhCvSN/l5by/Eb2/yWCTc4HrnAjWuc
 E50h19kpl9L91pOuKTpjvRc1L2QxGMHQzlGCxi5SPTQSla7S8vm0YGjFJqkv1ucjXi8G
 h1dqvLUymB/7wkG9QTvbgkm2rI107lvGvemvFs4c4FoC+yvDPCxl/BheRH/c7wfd16L9
 XyhQ==
X-Gm-Message-State: APjAAAV2hfCosOweZBYwfWy91yq+4rh23OnZkyOPpPe52cj8uj99D8wS
 Q9bapMVutlCxLd8sIXOEiFE=
X-Google-Smtp-Source: APXvYqwZMu/00hdevMMP9Kctq+L34gvOdjUxtxvt54q/jgBteyGpG1eUEbQnlTbPxDHQqm1QHwUckA==
X-Received: by 2002:adf:ef49:: with SMTP id c9mr18722882wrp.292.1579521246452; 
 Mon, 20 Jan 2020 03:54:06 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
 by smtp.gmail.com with ESMTPSA id a184sm3522408wmf.29.2020.01.20.03.54.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2020 03:54:05 -0800 (PST)
Date: Mon, 20 Jan 2020 12:54:04 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v4 2/2] pwm: mtk_disp: keep the trigger register after
 pwm setting.
Message-ID: <20200120115404.GB206171@ulmo>
References: <20191217040237.28238-1-jitao.shi@mediatek.com>
 <20191217040237.28238-3-jitao.shi@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20191217040237.28238-3-jitao.shi@mediatek.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200120_035408_351011_E1C91899 
X-CRM114-Status: GOOD (  10.69  )
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
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 CK Hu <ck.hu@mediatek.com>, sj.huang@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============5839809583724231239=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============5839809583724231239==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EuxKj2iCbKjpUGkD"
Content-Disposition: inline


--EuxKj2iCbKjpUGkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2019 at 12:02:37PM +0800, Jitao Shi wrote:
> Move the trigger after pwm setting to avoid the pwm wrong signal
> output.
>=20
> Remove the regist enable trigger setting in probe.
> Move the trigger to end of mtk_disp_pwm_config().
>=20
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  drivers/pwm/pwm-mtk-disp.c | 20 +++++++-------------
>  1 file changed, 7 insertions(+), 13 deletions(-)

Same as for patch 1/2, please make the commit message more useful. Don't
say what you do (because the patch already shows that), but instead say
why you do it, what the specific problems are that you're fixing, etc.

Thierry

--EuxKj2iCbKjpUGkD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4llNwACgkQ3SOs138+
s6HDxQ/+IOGqWchokwjeBg42kfmwMjHb1KEpMro+54eRGoYNxpDIEVacCzzxSTsE
5buLHuzucUZj84iAYDWzzw+m2VVpVrAUf9U6GKXYfPuv+jrXDUqZGU1FYELRTWBt
NebebfYiaeLrx3/ZDF6FRuoVusubMGexn1RgqCqruOyhB9dYG4z+j52zol+EUG7K
N2nbVTzyUn4RnpK2j0KDGW/+vJt8TSwvowgwOq3SmWWqUzA1XnOI/CUijfDGjGh3
ggGS/koW3h5zkErcEAiGLJ4ELlhEbj67ytei8hh8ktRLAZjSSYY8ktE0Q7/q3V6T
0DMxKPzlVOEpfr2/KEQ4r/ibEYDAyJ/Ab23nEw/aMjFq4DXFHCXPkVrRJzjFBHKi
eGt2HbzDbEBH6rrFkVaiXwstx+81m4Yqlm58uzdS/iMzFADo1Zke4enAF3LtY8LX
Em+JJX52sGRjFzOIlveGHY4MqICdKM0MkvO3VDS3thaQRnK/wdrA136/+rmJOMi/
U6JWvcGMxPVuZGDukaRZRXDa5gys5qFSdeVS6d8rU9a8NmFcO91gn/K4Pks60mtS
mNuchXD3oZ5boHb80GoqW274g5wY9M/haw2QMEeydodtUWAz0UIp9l3v+vRqWXC6
8hV3/yVmxZiYhazGk5EZ84wGwflGHZZ4ruEYsMV95wxIvgB01GI=
=TZoJ
-----END PGP SIGNATURE-----

--EuxKj2iCbKjpUGkD--


--===============5839809583724231239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5839809583724231239==--

