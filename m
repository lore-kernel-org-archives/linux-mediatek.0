Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E213C83F10
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Aug 2023 09:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+GDJQNvk1I3RU9eHa9L6NV+dyMRSPGsdEAWk45bEPSw=; b=OQEaS5BmpnWt9jvdyiL8Oxx07O
	VuOIVnlITSUq1dEOPjwe6Mbb8qzxIMkWX6PzPqkMNfdmYkjsbR27DuU8YWRnL7X/pqXDI3unrok3E
	+7qyHkt1j8t8NMU+z6bpA0fWMId4WotACHKbqYgQ5JZI73WRYsy/T53lV0fhEA/zfsyX/z1LhEw1y
	du0HPg0SuHUvhe+kLfNOzV8MqngOt0d6hpAYkNl3e7gCFQpvb5FUxGIJLlk93FTR0siy3UrRIITmw
	C0xP0xGIxzpBFtYb6HFj/Lc06rJIv30rEtcwVLjIBarzaj50xiLguRF+YpVs+z39iRGrtzG+RNEwe
	3K9jC82Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbeMs-00Eyhb-2p;
	Thu, 31 Aug 2023 09:53:38 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbeMq-00Eygx-08
	for linux-mediatek@lists.infradead.org;
	Thu, 31 Aug 2023 09:53:37 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3a812843f0fso306635b6e.2
        for <linux-mediatek@lists.infradead.org>; Thu, 31 Aug 2023 02:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693475613; x=1694080413; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+GDJQNvk1I3RU9eHa9L6NV+dyMRSPGsdEAWk45bEPSw=;
        b=SGfhXQAbxC1QsBsaIdgFmcE6wNSgeAM+Z//tO89PRCa8gdefhFnYXQCnA/4S/jknqy
         fsOKTh194iv1zWXlnCNZafH/+ctt8HiW3MVPaJXrxHNgCVyc69M4PHl1uTIREgyLayRz
         HmVCl9lrWbmey/ckZxkvn8N+MO3p6wpAAzlF2aDTMY2qTUnBx1OaC+ssm8/nvEKEfAcP
         PiXa4kCjKbouzjU4h4dEQpR0uq4gOhg6tR6I1xuA+7QsIW1MRj120LLfe2QE+Gk9wxUA
         M1ExmzeRITZ1zFQ1cwWitBEMqUPDZ2X8VK/1ckQJdzei5l37HIygrhqR0b0hmGeFLVwY
         sFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693475613; x=1694080413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+GDJQNvk1I3RU9eHa9L6NV+dyMRSPGsdEAWk45bEPSw=;
        b=Mzhvzc2MuNuUZQaD2q1+nDKIrbx4oy/2YSNvqYKjGtncjWxB+AwYjc9uSCzapAYUJG
         UbDEjN7H68EvO761DhY7iDBwmZ46JPzbKqcrLMlLQNZ5eNVY6//A9ZAmTew+QaujVC8c
         HYDG20QjKXNc3hmPNCXPNfq+HiJVGL9tc6MhNt1gaNOzoxrtKdLeHoy+zguXC0zBxy3U
         rnc+yItAqwntQscCgBZvVirzhmviFJGIi5IT2DRZ7LZCHPG/DrsYq4x8HnQGpV35L2sb
         2yYSJQ0r9NnQ6N9LxFF4TcBtGVLI8KEYmv9pGzUuSd8/PQlXUt0hY6KxT1A6cQLNU4LM
         KXpg==
X-Gm-Message-State: AOJu0YycC6lFtDvo9hPkAedy0nerbu+X7Jy2HVvzw0RAkNjgqCaDGBpS
	/52xjCj8/3E7fjB2Hxvdplo=
X-Google-Smtp-Source: AGHT+IFuTxBBnsClMiDGJuvLuCYgceaKjoXiFCmcN4xiYtVXao8M2f7wxtZGIsYY6C6Re0yFiTRAlw==
X-Received: by 2002:a05:6808:210a:b0:3a7:72e2:f6be with SMTP id r10-20020a056808210a00b003a772e2f6bemr5295000oiw.2.1693475613564;
        Thu, 31 Aug 2023 02:53:33 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id v3-20020a655c43000000b00565e2ad12e5sm924535pgr.91.2023.08.31.02.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 02:53:33 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id DB0A18BF2F99; Thu, 31 Aug 2023 16:53:29 +0700 (WIB)
Date: Thu, 31 Aug 2023 16:53:29 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Frank Wunderlich <frank-w@public-files.de>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Fabien Parent <fparent@baylibre.com>,
	Amjad Ouled-Ameur <aouledameur@baylibre.com>
Cc: Daniel Golle <daniel@makrotopia.org>,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alex Riabchenko <d3adme4t@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Linux Regressions <regressions@lists.linux.dev>
Subject: Re: regression with 33140e668b10 thermal/drivers/mediatek: Control
 buffer enablement tweaks
Message-ID: <ZPBjGWPjSfl-HmDJ@debian.me>
References: <trinity-6713557b-fe0a-4dae-84aa-1aa86f7619fa-1693473911557@3c-app-gmx-bs12>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RJwfJEiQhwB0+FtO"
Content-Disposition: inline
In-Reply-To: <trinity-6713557b-fe0a-4dae-84aa-1aa86f7619fa-1693473911557@3c-app-gmx-bs12>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_025336_100213_E98DC8F8 
X-CRM114-Status: GOOD (  10.97  )
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


--RJwfJEiQhwB0+FtO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2023 at 11:25:11AM +0200, Frank Wunderlich wrote:
> Hi,
>=20
> The commit 33140e668b10 "thermal/drivers/mediatek: Control buffer enablem=
ent tweaks" is merged between 6.3 and 6.4 and causes a regression where tem=
perature cannot be read correctly at least for mt7986/Bpi-R3.
>=20
> bpi-r3 ~ # cat /sys/class/thermal/thermal_zone0/temp
> -274000
>=20
> after reverting the commit and fixing some build-errors in 6.5-rc7 becaus=
e new members used in mt8365_thermal_data too, we can read temperature on m=
t7986 again.
>=20

Thanks for the regression report. I'm adding it to regzbot:

#regzbot ^introduced: 33140e668b1020
#regzbot title: incorrect temperature on MT7986 due to tweaking buffer

--=20
An old man doll... just what I always wanted! - Clara

--RJwfJEiQhwB0+FtO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZPBjFAAKCRD2uYlJVVFO
o0mFAP91QuKCfgQVlixmP/Pv1pO2ZddoCUNEegbRBqxDSCFtvAEA+K4HSholbqcJ
NGGQtAZxl6iJbR5W9KtqFAjrr34MLgo=
=1gyx
-----END PGP SIGNATURE-----

--RJwfJEiQhwB0+FtO--

