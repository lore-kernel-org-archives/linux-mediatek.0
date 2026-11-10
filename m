Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B220606A320
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 23:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dur9cbJO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PKhTy0aL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PdeUXT5hL0s7mCt96NfWjkzr/Wr8kB4BYllQsiOMp6k=; b=dur9cbJOedyL7CH41DcVZMUalL
	hARBbyfT8er7nOioO/SN6XatFqFcwDvx1I2DbgqCSZztFgBBqAem0MpUmSHSkHzrq3oJgaZYu/ySt
	u++zA/63VhAKj6pAF+uGyacSb3qdObfFAUfufqjiHiqk9Fbs7rPQ+SC+TI9vQI2BT49SFqbleWkTU
	YwL3UJWn+fWpdfVtXlX+4lYiovzFN6Jn1Iw9I/bynCNvZP8QyyehsGLW80sGZxMhhnT2BFpCdz5AH
	UEwDbapE8xeVISSS1WO+PUo2fYcjnn+XSw6Sa8LYuy2pCiCD050H2qa4cvnpnP/0EYWwGCFSsPkji
	7z7ngzHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQuuH-00000005DH3-1RTS;
	Tue, 10 Nov 2026 23:05:37 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQuuB-00000005DFp-1Pb8
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 23:05:34 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso1647340a91.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Nov 2026 15:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794351929; x=1794956729; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PdeUXT5hL0s7mCt96NfWjkzr/Wr8kB4BYllQsiOMp6k=;
        b=PKhTy0aL/eLJOvpvZ9wQGQu++/e3La1E/1ge75mxmNLYcuWjGR/5HE4PbbrZHZp3xF
         95AHq/UjNn1Mo/atKk6ria5owuDnvkb6+GRQDOrOX61uGug5dZ0h89UwxhiwZVb3pov0
         Ebj2SrT7pisCNkO7zJsmQVHlBeazCRfJsf1CdS1+cwxvijpVjFRyB2HS9kkUjI4hV+MJ
         mtMFQApr+WvlOIPBcCrj3EeQbAT60CwLexYKAWe7Rn6xL8WjcaRO8PHWzXjLfMY7twrl
         ir/mNH2Km5Nsg67KSXWrTEoOKXenX0C/BEBh3F0ndGDcOsEIZk23IP/O0KHBHrOCxvJE
         g/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794351929; x=1794956729;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PdeUXT5hL0s7mCt96NfWjkzr/Wr8kB4BYllQsiOMp6k=;
        b=qKBKlM6qkDHiQ7KfIjrKG8fipcpXrA8suhuuq5noO5yLIPFEkIneTq1RT3LkC4LoNc
         2/HT+ol1icU/IA64Pw5k+lLYGPdxRiG2cWJ6vQJHgiB1rw2SuLYOBHSIXJpM80oJUNU8
         lHJDNYlV1KU2gMN8UhHVwhxWYJO3fy8vmPDZxY+vdDnTHsv7rqrxP4HujGXV8Qp543kg
         Kq8poBP0RR1XwlAe/x+4DlpfUyiBPJT8U8c9zFeyYNLqaSTztVRfy7iZi6dUH1wKYRKW
         wjqzi5bKgmGTPYbGXsY9eL9GQyShz/Bgg+DYBb3eMP4ZNDVKOh4s+CsNQa0SwKMkgkMt
         By6g==
X-Forwarded-Encrypted: i=1; AL+hErE4TODr+/N5T4QhU0n6HndFHx20Yt10grIs7qC9I8MW6QwDWirsnP2rLUw030wrBsaxMFcpvP9Fsi3S1igGew==@lists.infradead.org
X-Gm-Message-State: APuU4Z93s2xjffClWMwBvm5d0qwLRXPRxT64ycohonF1MetSjHnDuU5Z
	+6TT7XIETTBrTLLJFnw+TSh9jfLoLFRFMHHjH07eL1b4GZkKNt1NHC58m28VNQvLMA==
X-Gm-Gg: AYBFou3MzJQsMjaI4PrhupprqBBNUEKestsILtPHarw/LMy+tyehda5m/XZfDFWz18G
	ZnlzkA96wX1sA73bkbS7+PMwNAmB69f2as+h3Eh9u4RiqhQtfwEGp0AfRD0ZfpskyIsRwv/WkP6
	8yJIlQzdB/FNyK4gkHLEEpz8nPY0uuBFGzvazbHuvT07waaKoG14jCMs6HvE39fp/pYdNTtFDqb
	ZGMAuwMth6jUCex8z8s2FzWDMjfi13fDBEQQbPAhLcvX5MnDY87YvSjvI89UknV9sV6VnROhRjw
	x4LQmCLx2IHRz/VIXWyUNfRMRnvee/JNWu/1snpPfsYrKRq1JciLF9cQpFiils8D0Hq8iTyFdG3
	EKnspsAvHcDL2LmLsdnsEeZvsZ2D2u9Blzdvm5vtK4BVTTIBFltxL8nKtpaz5qqLaCjA1GcGDjZ
	cMwcD67gwgSVigNeXW+rS/KzzWirYoXUPXZMuhDrC2HpPczvqMtla3eZB2IDAQxDLayP7dfDxAc
	f5vsz0CRd1ncZnfMTAukpBifpFA45dWAeVYdNqiBy0P2GPtMGMLzXEB7hVSH/oYEOfHEvYW38CM
	KuIh0LTeDMfkNdjWV6NNm2dSPBI3Kl4X3LBsAcIiUqUI/YqrGZPS4j5WzW2bD/17CcduOVkUZ0w
	/LeAD+J3bHmbDzCVk1QhJgfEumrn+Q/4/4HItGMzN2q0zlwxB3UTYYzTKPCP1xeEvsdOO7Tvxot
	AJtxOXhrvZ6lsM
X-Received: by 2002:a17:90a:d00b:b0:3b0:a7b5:c044 with SMTP id 98e67ed59e1d1-3b182e0c1a7mr350381a91.1.1794351928487;
        Tue, 10 Nov 2026 15:05:28 -0800 (PST)
Received: from google.com (196.126.197.35.bc.googleusercontent.com. [35.197.126.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7df7csm1476956a91.11.2026.11.10.15.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:05:25 -0800 (PST)
Date: Tue, 10 Nov 2026 23:05:22 +0000
From: Benson Leung <bleung@chromium.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mfd@lists.linux.dev, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v4 09/20] mfd: Drop unused assignment of
 platform_device_id driver data
Message-ID: <avOjMhYL-jo5qWnx@google.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <9bf8e674ac935547639dc6f89fc0aab5ac826db9.1794347059.git.u.kleine-koenig@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QGZX1VfFPgOu+2d7"
Content-Disposition: inline
In-Reply-To: <9bf8e674ac935547639dc6f89fc0aab5ac826db9.1794347059.git.u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_150531_441659_10C54B6A 
X-CRM114-Status: GOOD (  19.89  )
X-Spam-Score: -8.4 (--------)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--QGZX1VfFPgOu+2d7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 10:54:34PM +0100, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> The drivers explicitly set the .driver_data member of struct
> platform_device_id to zero without relying on that value. Drop these
> unused assignments
>=20
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits.
>=20
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/mfd/cros_ec_dev.c | 2 +-
>  drivers/mfd/mt6397-core.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
> index 529a23b804f7..96aac158fd8b 100644
> --- a/drivers/mfd/cros_ec_dev.c
> +++ b/drivers/mfd/cros_ec_dev.c
> @@ -379,7 +379,7 @@ static void ec_device_remove(struct platform_device *=
pdev)
>  }
> =20
>  static const struct platform_device_id cros_ec_id[] =3D {
> -	{ DRV_NAME, 0 },
> +	{ DRV_NAME },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(platform, cros_ec_id);
> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index 5d5f816492aa..e74936ac206f 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -435,7 +435,7 @@ static const struct of_device_id mt6397_of_match[] =
=3D {
>  MODULE_DEVICE_TABLE(of, mt6397_of_match);
> =20
>  static const struct platform_device_id mt6397_id[] =3D {
> -	{ "mt6397", 0 },
> +	{ "mt6397" },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(platform, mt6397_id);
> --=20
> 2.56.0.rc1
>=20

--QGZX1VfFPgOu+2d7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCavOjMQAKCRBzbaomhzOw
wggAAP4v7fnaGuBxjdQU0SnWBJUfK3YeW/iId1LRt/eBXC0OmQEAioUu55g6cEtn
WOAUBxWTSFHNLgkeLCTw0+Pu3PdU8As=
=e1Q6
-----END PGP SIGNATURE-----

--QGZX1VfFPgOu+2d7--

