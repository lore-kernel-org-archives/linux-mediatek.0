Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B19F5A8BB
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Apr 2026 20:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1fmttW43m02UXdVQMFbm1+Fjb9kM23jey1UIcB3meSs=; b=T0yGhn0dCnNW8Ehdm7MOarxQpc
	t5FyqxALtMkH2+T6xam5CMEP/KHC9n7mq0wj8+iAvwL2dvNils5waBLGvfSbmAeSZyenHTyGi5CyR
	9h3uF8kIgDRIvLeIZCGVQNa1SCE2CgtwM4tkUJs81xjVWaZcMJzawOHmZlfK5yQmVyOI8NFficSd2
	fHt41ObhubzmwIcowbkkWwhyqwllmn5Aqbwu1EZsUf8W0HpeZwtbgWbZ33dVYxf8mrH6KEi4wcaMd
	vQ0u1H1difvb2w7+ZC1VtSm1+lCQ8CHIQIsKbxvOewHOdzTO/AjjX4x6/WPqefeAI0Zy2zZ5coYyq
	sh49KgKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEvHM-00000007dBq-191C;
	Mon, 20 Apr 2026 20:31:36 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEvHJ-00000007dBR-0irL
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Apr 2026 20:31:35 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso39727715e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Apr 2026 13:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776717091; x=1777321891; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1fmttW43m02UXdVQMFbm1+Fjb9kM23jey1UIcB3meSs=;
        b=purmVCS+ZGBlTE781fRQ1dX86d+u1vgih3rlCEb4rtBvMyh8LKqXNJIo8R/MPAlBf9
         agPP2N4MtxdfgDcVWGu2xke78VuTOJEXRhUPASryo3jpAPitbwVjfS2RTWu6b2ybMshj
         M19tQ7WihE8K7f2uwYTdyFyIhyMkqMG9Fz4GeelyBmu9uZ90JVQ16neMJaXID6UgCzp7
         eDZlvMoBQKxRZe83hPRIi0lNCudboMa/Ksl5UPmY8T+VWqU64spiG82MCc4kTWeWekaW
         ZsoSV4qJZJm7js5DThDP4zyR5QfCn8gsm+O+bGikX2RRhIL2FxoVmFnAp6X4kEiciACa
         u5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776717091; x=1777321891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1fmttW43m02UXdVQMFbm1+Fjb9kM23jey1UIcB3meSs=;
        b=Sz0/8qeUIAXzuGHA7jvmB5MdJvfxhHzL2Wlt5GKrc2YKCNMzBeIwHnDLN9r2PAmXxp
         Ifc8hPfAyRysQIk9oT7lqF3YrhR30pY2vbkny6fBWSenWutuW+NNp9zsmU6OLc7CHb/k
         tse6MrzAcpjQNIPmyt00+wvySuBPr1cLRYNCnihttowik8+HTrNMdlswrJeA2+1c9cBZ
         JZtffC5W2ayY+NfrSD6od0fYp7iyMj8MwsYzuNeoVZpNOASJzwe6x1H7cgw3bprV/2By
         RHHu5ZoTPQIc//qRedEJc8Uxqdh7q9j5g8Y8GHWKWsq+nWqwSoKo6wBw/om6b7G/Fp9o
         qaug==
X-Forwarded-Encrypted: i=1; AFNElJ/5Bju+IdoYICsvwunNx5riGEdrF6vCx2iEg/4Z5CiyCPvy401O9BFzr3THP2nw9hKZbmvYKl0K5jQdbZXk4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv8e9qkRwgdYrqfpbYKv6igYfANKoshiCII3JXLM1uGEtd7OAN
	3MflHCyuB6e950NB1UcvDvYv66JftylxP8u1p0JYWjRMOrpVamlftH/rAVDhSITVDQU=
X-Gm-Gg: AeBDies1wfdRTHDT207/8S6LVg6hegkXajOvriqVMgexdS//WS9K7NPZWqrfHhQ8mbM
	uLsmKIu9Kwyw8JeUR0wNGu8e4VN5C1M5gTh+j3SrbbQuU2cYHGEt6t6U/j7hnnfNsglXPuDXbg7
	/YS/Y5gLr2G4YAiULVzT67Insfoeu2SDHO4sGRNNqbQtWtcwyhXTfrtL1ZcBPcI6CGD2siNagUI
	tbSsxKgG9ICKugYp2uyapjKQed6ngLsC+GV+4jHAb7KURVtQcKS6rnKgN4TnRKsLt0ZGZN/E74i
	xDUb5y8WaETnVQyz+nfM9AJ5AXtZOWt+/eyVHPAJGTX2lz2+FESez7/MsszVaFrZxiYPl7CtjfI
	Q58yR7Q5vyM2uzjKn41cy8B7w5Nmo+bAOmRORDzuxyFbisPJrSIeUfRW0UiaPOh5GQvuFWDdtr+
	5aP2WY/yfo/qRA7n87fisCX/KIf7PB4Rbnucz3RLI=
X-Received: by 2002:a05:600c:4f49:b0:489:1ff1:74df with SMTP id 5b1f17b1804b1-4891ff176bamr64290705e9.1.1776717090675;
        Mon, 20 Apr 2026 13:31:30 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-488fb7a0745sm126204805e9.9.2026.04.20.13.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 13:31:29 -0700 (PDT)
Date: Mon, 20 Apr 2026 22:31:28 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>, 
	linux-mmc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-kernel@vger.kernel.org, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	linux-bluetooth@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org, 
	Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Brian Norris <briannorris@chromium.org>, Francesco Dolcini <francesco@dolcini.it>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/6] sdio: Add syntactic sugar to store a pointer in
 sdio_driver_id
Message-ID: <aeaMkfk_1t98e7SU@monoceros>
References: <cover.1776429984.git.u.kleine-koenig@baylibre.com>
 <c830049dcfcd99f005e2ff6742aace9341c61f13.1776429984.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u46iqxpjoedhizpi"
Content-Disposition: inline
In-Reply-To: <c830049dcfcd99f005e2ff6742aace9341c61f13.1776429984.git.u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_133133_480053_62679CCF 
X-CRM114-Status: GOOD (  17.55  )
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


--u46iqxpjoedhizpi
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 1/6] sdio: Add syntactic sugar to store a pointer in
 sdio_driver_id
MIME-Version: 1.0

Hello,

On Fri, Apr 17, 2026 at 03:10:47PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> On all current Linux architectures sizeof(long) =3D=3D sizeof(void *) and
> this is used a lot through the kernel. For example it enables the usual
> practice to store pointers in sdio_driver_id's .driver_data member.
>=20
> This works fine, but involves casting and thus isn't type-safe.
> Additionally with the CHERI architecture extension there are machines
> with sizeof(void *) > sizeof(long) for with the traditional approach of
> storing a pointer in .driver_data doesn't work.
>=20
> By replacing the plain unsigned long .driver_data by an anonymous union,
> most of the casting can be dropped and it yields a working solution for
> CHERI.
>=20
> All users of struct sdio_driver_id are initialized in a way that is
> compatible with the new definition, so no adaptions are needed there.

sashiko.dev found s/sdio_driver_id/sdio_device_id/ twice in the commit
log and once in the short log. If you consider applying this patch
please adapt the commit message accordingly.

Many thanks to those who created sashiko.dev!

Best regards
Uwe

--u46iqxpjoedhizpi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmnmjQwACgkQj4D7WH0S
/k7lawf+IBy1b5wfuwWZiVYsobJ5/VQtS1uab/j//LDVdxK0lHUoqurrxgHf8aFa
2/h7V1KF+nbxyYPjLmWI8a37uIwuSKZ5vijoBeDnFRFwWdEokon2xNz+IK0hTkf4
Ill7bkiF7fk+epa8am5nZ9gUbmy1nlQbFZHlXizQA4YeFOlLyfOdPTsXw8p/P7Tq
RIGbTgcE13Qkiokn+iCwGUzLfb1sjBm+Nx3M/g1/C2r4tw+M1ypwCAizKjjvFyTz
8a7d4lCX5G140aKhxhTCdN3nE5iwtvZ4w9BT2RXRY03pv4w0FW5Xyc/PqymZ2Kp/
qcp9T3xPsnUPVlIgTg1SnhlhnrS5Qg==
=RSgT
-----END PGP SIGNATURE-----

--u46iqxpjoedhizpi--

