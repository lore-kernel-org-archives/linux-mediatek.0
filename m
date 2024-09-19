Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DA5CDD578
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Sep 2024 13:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CxqgBeByiqEGN7btCj/bU6+qAg4akgJ/31iLPDvaLhw=; b=js1NPi7nxzy8kvKkQJxj3TF+i1
	2dAR5atbRkmeJeKV86Z12CpnbmkbUE8svigZHk296QrqmRpX+RyOpkSeF7F8Q1VERD3+5VfbX+fc5
	11i1ZRbeivAJ9Rw/g3QXCAhv5grBiSGMRSlp7A0Zo8AGDt3dffjQO4Uoi++PkGrO0UP8YWS7jEnD/
	00t4wHVXHFtUTqQhfxfoESq3BRGnK/7TkAzQumsHGAakFGzsBTsao4zhUvUmLsSCnQEOwUol2dzvP
	Gppe5l3Sn6BoHui8r/5a/NQJGjGahyv8Kjvyn1QJd9+76PMeOssfOexoSpYFJuWUzYpJwDhDxvUOL
	A2WBhcdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srHAz-0000000ALFU-1n4d;
	Thu, 19 Sep 2024 13:26:29 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srHAw-0000000ALEp-1ctE
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Sep 2024 13:26:27 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5c24ebaa427so3009430a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Sep 2024 06:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726752384; x=1727357184; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CxqgBeByiqEGN7btCj/bU6+qAg4akgJ/31iLPDvaLhw=;
        b=O/0YJ6IOSj0xSFoYintjqNijxn2uiqAAcLd0XIk9kHookK16vci07Zhm0LU5mpz3iW
         ncBiLfu0MpU2EHpBPy4eHKzIJtrRui5PzGC6ECO7Ye/WF87B9OPekZA9TeWymRe2sh88
         dGI9E2va8NUSX//rq4ki4OdcspRPEZ13fAxsn+dLMEC/gi1ly0Uvp01GlXJ7Ql1e0WSk
         FaZXrj8jQWCA8jpuX1i39jRxcyBtXzRn4he3tThI0lDFDv/YIKRVHjnOuhPjN3uQ4/z4
         cxii/1hLBUSC0fu5VNPuRLz/GJwJcvWiTkLj7YW8rootoi2t8YZlI/mvMiqyAA3rH3+y
         /cQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726752384; x=1727357184;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CxqgBeByiqEGN7btCj/bU6+qAg4akgJ/31iLPDvaLhw=;
        b=bLvd1Rgd9XrMVH8C0y/fFrjYUlRLDR9qFKWp/+aeUOubD4ftoEyJK8aGHH5zEp6rBT
         JgcN+kbcHCAoVYIi+7RyBXl9n1SLD0t3e2+01bFXqDj0u7xIeHtPoKVAK5YpX7zPLAmJ
         7L/pf9mDkI62Bc/JOw9AOj1nOfNlMT84L+8RAP07gZB32BHNGTUBWfYqNN4Kg+pcPLzu
         J8TGqqjwHwOad5hFjQWh7h/XpXzvYVIZmT4Xy6Ms1tMnNJxOsFZZyfv937yDt6NQ6H7d
         qfjryw1DFkMzfOmlh7DHFZVY9kMTIIO2Fay7FxvYYcU2qvz8ko2+XmqT7ypqUBBtj3rW
         a4hA==
X-Gm-Message-State: AOJu0YzyCopN6CBq+4xvhjZ0uE9m4hlOtB/SawvIyWTjBRjlRaIZXvIo
	SSThVMliM36oqXGfMOClM/VL95ILIuRblibmFimXU6YNzypqqfj1oOhnWbClst2uxRMor7N43dB
	+
X-Google-Smtp-Source: AGHT+IFLarCnOacvRt1Pc8xDIhYuWcNW+sbuUln+ZBlKC/vL9ZzdFB4p9yXoeNYHkl4c9QklvQ4Zlg==
X-Received: by 2002:a17:907:94d4:b0:a90:126f:bcbf with SMTP id a640c23a62f3a-a90c1c77f83mr274686966b.10.1726752384267;
        Thu, 19 Sep 2024 06:26:24 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:3d88:df0a:afe5:8794])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612e7c72sm720216966b.187.2024.09.19.06.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 06:26:23 -0700 (PDT)
Date: Thu, 19 Sep 2024 15:26:21 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, 
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH] firmware: mtk-adsp-ipc: Switch to using dev_err_probe()
Message-ID: <4426qubj6oy3kwrxtzjyc5imhxhmgapjibbv55gig22pxfrjrm@qhk7larn3qnk>
References: <20240919120208.152987-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x5s3i6p4o36fjocm"
Content-Disposition: inline
In-Reply-To: <20240919120208.152987-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_062626_452248_267432F7 
X-CRM114-Status: GOOD (  19.57  )
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


--x5s3i6p4o36fjocm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello

On Thu, Sep 19, 2024 at 02:02:08PM +0200, AngeloGioacchino Del Regno wrote:
> There is an error path that checks whether the return value is
> -EPROBE_DEFER to decide whether to print the error message: that
> is exactly open-coding dev_err_probe(), so, switch to that.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/firmware/mtk-adsp-ipc.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/firmware/mtk-adsp-ipc.c b/drivers/firmware/mtk-adsp-=
ipc.c
> index a762302978de..fdb083f42ebf 100644
> --- a/drivers/firmware/mtk-adsp-ipc.c
> +++ b/drivers/firmware/mtk-adsp-ipc.c
> @@ -95,10 +95,9 @@ static int mtk_adsp_ipc_probe(struct platform_device *=
pdev)
>  		adsp_chan->idx =3D i;
>  		adsp_chan->ch =3D mbox_request_channel_byname(cl, adsp_mbox_ch_names[i=
]);
>  		if (IS_ERR(adsp_chan->ch)) {
> -			ret =3D PTR_ERR(adsp_chan->ch);
> -			if (ret !=3D -EPROBE_DEFER)
> -				dev_err(dev, "Failed to request mbox chan %s ret %d\n",
> -					adsp_mbox_ch_names[i], ret);
> +			ret =3D dev_err_probe(dev, PTR_ERR(adsp_chan->ch),
> +					    "Failed to request mbox channel %s\n",
> +					    adsp_mbox_ch_names[i]);
> =20

Looks good to me:

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Best regards
Uwe

--x5s3i6p4o36fjocm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmbsJnoACgkQj4D7WH0S
/k6JyAgAs8EPVGdHwR2cB7KuBTWmMoG7vZXS/QNTBCOM2liWpNQWO3y8vgj+52UQ
cRsevvScsmaqeEYiot0086YWIUKSQbdjN5s51QXWDI3Jys4jU/T1f67zoD7tY1Xi
FtOzWIp28KYnKEYdQ44oAA18QCNAj1A61PUHyZEgcM1SMJKq5B71xq0c3rjz4MXW
eDiIARnloVG3n2kZ96CM1e1OwfkaOChFG+1aQwZX5bU3NNJAjTXAuvNI0jqEIiOt
doQTaQU2nTsDSMsySjzzZKUNv/eiaNGrfuFmThYrslPo3/dIRkUaxyIp4EP5lmBp
iDa9Eph0rYL3PLm+lXexsm3J+bcmdg==
=NQRs
-----END PGP SIGNATURE-----

--x5s3i6p4o36fjocm--

