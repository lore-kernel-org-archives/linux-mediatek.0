Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B4EC4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Dec 2022 12:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xva4+JODa1CXmxrrNEoeJGKgbbb6AVhHbz9b3pDdu3Y=; b=opF3/IYCz2hXbLPZJmKvBGSCk8
	sHah9yy3ATTcz5VQlCxBpZfx4YhAQXhJjRFalWIcL4zGOM6maKCESTwrq8TIKc3/0BGBknv7x3mBS
	khsrccR8YnRUL5fkKZ+M/A+X0bnb3d8VWXv+iFJtvSRtaDyXmVecHyUXKZSlsyS7sSX3cWEY+6oKI
	FVCxjczrcC/Lctykogsx+5Za2ORHEW07GzI0vwK5xIxn8+GFrBMESoLg0VzJxvpALJByiXvRkCFKV
	Y14inWQ62/XbwrvuUiTZP1f3rhwRe0ywzAzp3vl+KYUJQFBuCvFPVe700DdRBJ6XnMq/nrctW42oB
	+aBYZmoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAVZk-004p6m-13; Wed, 28 Dec 2022 12:30:28 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAVZK-004oyz-Di; Wed, 28 Dec 2022 12:30:04 +0000
Received: by mail-pj1-x102d.google.com with SMTP id hd14-20020a17090b458e00b0021909875bccso16473859pjb.1;
        Wed, 28 Dec 2022 04:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xva4+JODa1CXmxrrNEoeJGKgbbb6AVhHbz9b3pDdu3Y=;
        b=LSTQpTjJPDYXXfQgBFygaBnBXhiDHGw8nySZOPSt8FTS+JN/iPOuTa+aHzokSyIjeA
         yETYvBEjlaQbziFflOlzDKih6/eoiSRb7U97HPJvLGKWiOV8mLGHZ7xRopYi+jf1uuXy
         NnyL2BYLrVt14Z4lkVj8vslSwKGDRrvc0Q5uBHMLMvyHBoexl0OdlMeWKPOGitxeSweO
         SbwtmkMSLFy1tLTNj69xQegSyxxU+jLXOWzoA/u5Ku3nxguClAR6rtWleX1FH7awXDTn
         +kj22wptp8k2w390UzXBmcErwlOyyF2xn2Aa0spFG6WKv8+WJ3y9HD/VdwBP3r2UD3vI
         V4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xva4+JODa1CXmxrrNEoeJGKgbbb6AVhHbz9b3pDdu3Y=;
        b=sPzRzk4RAG4nLLUZB6V/y40Id+Smt12kQsCRHV7ZZUu9rR0ShPTcm2aayRQjXly2WH
         8dtR4SFH4fBKX1EVdTVM3SwAcQD/Icxh5m/qWsiwDrs2OyB+NWmSdfaNpCUbpVwxUxDh
         CrR1LhY4Ib0DxpUCM9GJOFQoPD2kKm6Ip9Gvr0V5XQMYC0DWZuP8Us03a/FruzKOMw8z
         NYyUPN9T3GPZ2hdPXGkR4bx8RX0Pp1WDLDWnePCEirE4xKt114NYiQpIs0ztM91yp7IV
         4tGfsGJJVdzxtNa0tnbBRZ4sIvT8uwqvhlcCMotLQ55DsqDMOjp36uu1tBi0BfyyX48N
         MLPw==
X-Gm-Message-State: AFqh2krJgaaj+yzE3b+2o2VRWKM1tr+C5G1TSPSt+6pCB3P66DwRkeWd
	7KDjyRMw1+5q2iQ4sflsloM=
X-Google-Smtp-Source: AMrXdXtsBi80DY9iwPR5JpBM2gQ0nTOt8eV/7FcOW3HG2JFpwq9o0rV1ylg2c4EWuyxfXExCDG7uBg==
X-Received: by 2002:a17:902:b402:b0:188:d434:9c67 with SMTP id x2-20020a170902b40200b00188d4349c67mr24625787plr.32.1672230598294;
        Wed, 28 Dec 2022 04:29:58 -0800 (PST)
Received: from debian.me (subs03-180-214-233-21.three.co.id. [180.214.233.21])
        by smtp.gmail.com with ESMTPSA id o9-20020a170903210900b001782398648dsm10932255ple.8.2022.12.28.04.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 04:29:57 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
	id 6EBF8100504; Wed, 28 Dec 2022 19:29:52 +0700 (WIB)
Date: Wed, 28 Dec 2022 19:29:52 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Irui Wang <irui.wang@mediatek.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	angelogioacchino.delregno@collabora.com,
	nicolas.dufresne@collabora.com, kyrie wu <kyrie.wu@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Tomasz Figa <tfiga@chromium.org>, xia.jiang@mediatek.com,
	maoguang.meng@mediatek.com
Subject: Re: [V2] media: jpeg: Fix multi-hw judgement
Message-ID: <Y6w2wG2MlIiHlkr/@debian.me>
References: <20221216035247.18816-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KTfqalsCkhxWe9vh"
Content-Disposition: inline
In-Reply-To: <20221216035247.18816-1-irui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_043002_507103_48D18ACA 
X-CRM114-Status: GOOD (  10.32  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--KTfqalsCkhxWe9vh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 16, 2022 at 11:52:47AM +0800, Irui Wang wrote:
> From: kyrie wu <kyrie.wu@mediatek.com>
>=20
> some chips have multi-hw, but others have only one,
> modify the condition of multi-hw judgement

nit: s/judgement/conditional block/ ...

> -	if (list_empty(&pdev->dev.devres_head)) {
> +	if (!jpeg->variant->hw_arch) {

=2E.. like here (if block).

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--KTfqalsCkhxWe9vh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY6w2ugAKCRD2uYlJVVFO
oxnoAQDF4eixtonmpeiSzrrnq0P464jpGvONKLB03PJ+hcYvmgEAkL0nfkqyljuU
uDlPj3WP1suLVtrYWPvRsjvpYhBOvws=
=vr87
-----END PGP SIGNATURE-----

--KTfqalsCkhxWe9vh--

