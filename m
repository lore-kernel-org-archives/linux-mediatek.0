Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67430C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 14:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kUoPBZyP0axk6nRKrhH6g/mHLGZVisdHs+5kDGpekpo=; b=GouHgPClSXtElTCAAuWUixh5XP
	iH2H5mOiPJBGGOeSnhHUXwjlFmU0s0nUkqwDHviGwcNususMQ4tEuJXwm4cf/aZNT/QBtUaUTdRwj
	ycpsBNok5KXZD1eUHlbtiXwzWelQPTT3IPj4NyxkYyI0ZKgUXf0B577X4fiz81D2dntr5174Vmui2
	LRla0k2kogX64hTn/OIGyO2tX9+EGTaFCXHTTlBdRKiGXA80DySN7IBexkS1R0eOzCRoR7B2Yteaz
	v8NTe/DKyXAKK4TdfoE4fQ2pBcNCDq8Jz7DV1oMk8FzRnnGFGKkoP4Ugfcak1XWzZLyqVL8yLhx8O
	m5o1g0Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o40vB-00AlWn-1F; Wed, 22 Jun 2022 14:01:29 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o40uZ-00AlHc-1u; Wed, 22 Jun 2022 14:00:52 +0000
Received: by mail-wr1-x42b.google.com with SMTP id n1so23315363wrg.12;
        Wed, 22 Jun 2022 07:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kUoPBZyP0axk6nRKrhH6g/mHLGZVisdHs+5kDGpekpo=;
        b=k1Ju7wSZg82QWvOtXh5C+tGY8yQTX/08iv3KdTAcyuRnqE58hCx1JQexXSe+URDpdE
         p0ImgnAGaHjE4JislySg6qecoHYrJEejC/GKLB6sT9jN3wrUP9rOG2XIOForITnd02x0
         jhYNwfPB2Ui/+rtwPhJukncCC+3XlAS1L+lRz2bl36BP7Jua1NPToYPE73iRGmqhze51
         o7wdeYArozyn8VTtFZYDGYT6lbHLJjuhRIUJRJsvCozJh1TMeIXHlFc7KREnPbjXtdY+
         CfZiTET5VyMN8qT2QjXSp7TEVMHYK/7YO0SOSiusTq/eFQ92Wv1PlC+bAT9u9ZB3fSWN
         vzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kUoPBZyP0axk6nRKrhH6g/mHLGZVisdHs+5kDGpekpo=;
        b=KLZHuZdFG916KaWrlMJa12JvHy16EkaeSAGYlMw1Q0w3KANsLsDvuoR2wk049jzYoO
         wOLIkb+A2kRYQpqqjXikC6fhl/RKSLqMqsPC23Wm+Q4/3a82E9mzTBZM0xXLvu4TI9iM
         nr4vCDFI5nwyRo2GbAaGy/LtVFJo939Zneg9qjZ1Ae+OvqiFeDQNaVwB0xUaOyPptjxz
         pZdx73m0J9fD15Wbr9kn9YXzcbSoE4mwKsizg7v8wwn4z3NWA+9se+XLXdwNWafSebYf
         RqGhRFTjbanaqsX+awS+JNNrqiDrmylh8vLFSLo/xgS0s5QsVvY3PM9EqMAJQ2uBjQKl
         4w4A==
X-Gm-Message-State: AJIora+MZTFbT9nfA9Qn3Vi1toRbtSRz1zzpEKpqT+zxgFYtdYNv65Jp
	SOGjd3JHy/K5gVENJbjj7/hICbWyzUs=
X-Google-Smtp-Source: AGRyM1tHnt/jgPsUPVHQvg5sU4veue4z+CecoIbCr7Phmv2bIYomTp7Bt+U4+PUBWvt0gfS8ohWH7g==
X-Received: by 2002:adf:fb10:0:b0:207:af88:1eb9 with SMTP id c16-20020adffb10000000b00207af881eb9mr3598860wrr.238.1655906444093;
        Wed, 22 Jun 2022 07:00:44 -0700 (PDT)
Received: from orome (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id o4-20020adfcf04000000b0020ff877cfbdsm16655568wrj.87.2022.06.22.07.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 07:00:43 -0700 (PDT)
Date: Wed, 22 Jun 2022 16:00:40 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Fabien Parent <fparent@baylibre.com>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pwm: add MT8365 SoC binding
Message-ID: <YrMgiCPMsb3Y8Zd9@orome>
References: <20220530205038.917431-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iKffDT5KCf9O/u8c"
Content-Disposition: inline
In-Reply-To: <20220530205038.917431-1-fparent@baylibre.com>
User-Agent: Mutt/2.2.4 (c3baa83e) (2022-04-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_070051_168934_46D2B476 
X-CRM114-Status: GOOD (  13.04  )
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


--iKffDT5KCf9O/u8c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 30, 2022 at 10:50:37PM +0200, Fabien Parent wrote:
> Add binding documentation for the MT8365 SoC.
>=20
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
> v2: fix clock description (five -> three)
>=20
>  Documentation/devicetree/bindings/pwm/pwm-mediatek.txt | 2 ++
>  1 file changed, 2 insertions(+)

Both patches applied, thanks.

Thierry

--iKffDT5KCf9O/u8c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmKzIIgACgkQ3SOs138+
s6EZwhAAtTbNvEnm90ZYyOiXMFI5+PaLF4vJyVAEMi3M8wnJERzD+fx6zlfpdey5
HUOgg7d+R4Oma1wuGFo3HAMcIuG+/pel+eE8f7zGiYkcb2QNpzTrRsVQwBrjCPoY
6upls6fu2Xhzebdkntda3Nnj+JqbPExxmAmrDVgudViBVXKGLLo8l+aFAf1xJYoZ
AphfyPCLyxnC+MB4G0qrQVcPOdTQq433t+BnXZ9C4EnaEZA0vcjFk/CpIYXYme03
sPbI06xJDZVuGluoEaoRq4O6r/v0foxfThn5tjZuwQJvSc2qEX5eJD0U1IFZdsj9
3fJKnrmTQYA7zORslHNQV7aGCIRTtf9v87XvilY9G9P8n0Lp7rGiJrBQg0Kx/cXN
Bb3j+0JnXQtzBB+v4226k/PMP/SDMviTKkQMp3Ls4DM4QOFb8Rn0pdGEhtKVV/FS
ms3inwjO91jM11En+7DZgQHcA2Lm6fuHBhqiOzvyVTzRFj8BHrjg7iddjnhRW5uU
I3V7ln95+aPaQzTQd0qFdg0cngmtc7Tgs04YmV2Rb1e2Nk4Db64h17jiOaeHsU03
9gOBNpRUQ1neEkTRQ+dZCnXfUxnPgSeWHsOkrYIQgEmc4YrGAEIkgSFZUVSYQJFZ
uCQYV9nCrnBcs+PoOwb7aX+5Bk3Cj+xeM0xp9KChkwt4Km/hM1E=
=9amw
-----END PGP SIGNATURE-----

--iKffDT5KCf9O/u8c--

