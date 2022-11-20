Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93D5C4332F
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Nov 2022 11:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eFFRtDG3SnY31rS3/TY9saZ3cpDv+kx8E+R9eiFK10I=; b=MDOhBrXOTL94xLvZmATHZE8Kdy
	mOEWiU3acPeKLNmb/QBlavJJvGDjut6OnBMDbczXeQ0dujJ7Ly/sUOThJv2Kkplbhn03b66q8xZUY
	jMQWebyai1tksCFkIiDkAirN3fswgdPvCWBOV5LYMYN01UH+lUBHoxwclF9EEzMwun2dZc1ul+X9X
	c5y+jCjq9XmhmsNfqh8ynJiC7TiEcfJGaDLGD/saAmB9QjZhb1tY37mQpZa68x7Xjh+hOJFe4f1Fo
	gY5ZeKDOg4XFrMUOwD6lKi34Zz0DTI1sv+rLcUUZWkjOj/nw93g0YvzjkoF8/4I6FSxuq17bpEpWu
	pA+YI87A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owip8-00457e-FI; Sun, 20 Nov 2022 11:49:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owiox-00451o-OG
	for linux-mediatek@lists.infradead.org; Sun, 20 Nov 2022 11:49:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668944947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eFFRtDG3SnY31rS3/TY9saZ3cpDv+kx8E+R9eiFK10I=;
	b=QcMrffzZSfwBoEAtK1sberGc+k2aeBzqCBqQuldXlK7gxFKqCUvrmRdXsPX4vHXgUlNRKz
	jWNWCZtnrZ3TYrFgxbWeXsX5fw59bE/1YaJf5PKfmxtic+aIOKNTdgjC50fYwsI+E9fD0z
	oYIZkbAni2UrCw/x5kfcfVqaOFL8uLY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-6-qrBFSzOcNMaqaDkq8PlC_w-1; Sun, 20 Nov 2022 06:49:05 -0500
X-MC-Unique: qrBFSzOcNMaqaDkq8PlC_w-1
Received: by mail-wm1-f70.google.com with SMTP id c187-20020a1c35c4000000b003cfee3c91cdso5017341wma.6
        for <linux-mediatek@lists.infradead.org>; Sun, 20 Nov 2022 03:49:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eFFRtDG3SnY31rS3/TY9saZ3cpDv+kx8E+R9eiFK10I=;
        b=dDff7kneURGianTju6RzAH7GvSbp2izaz86gagdcr4I04zJ5YRX723CyMD2V5lzX5X
         4GUlibMPDBC9CJT0DTnEtdwuC5RPEciWDUVl45V33R8wXe13+blFK041w0XyJUNBqvsI
         fjSWNfFbshlHuq5+BdzxWSd0h9TEX/uWIXGnHQ49saJ7DX0zqB5t1eGl1q2CfSeKDSgQ
         YPf7Ld5AHC1NiQQt5EHMeCWlWJ9ytwvTd3LIb9qeWLPccTWccwVpxsiozuVadY2hjm8j
         MrYzCn0HT26tykWgK425DZF7guyCjjJkcH0YlGsFaalIhdJt/kIDCtdfkYbu9ZdEYRf5
         BYkA==
X-Gm-Message-State: ANoB5pm6kitywBU7G2Ad+lMRQgdS1qRxxBDO/59RcjUt+e5h/Da5Jgoh
	HB6gv6ai/QnUXGpiqDtgiAdhdAWJSNEaMNzACXp69nBSfqp5iLjYKO0SyLRESZ56BtCWIo2FYVF
	CSvYHP5fQC2dWjB38ya/CZJTJpO3ppz4I
X-Received: by 2002:adf:f74d:0:b0:236:4e3c:7720 with SMTP id z13-20020adff74d000000b002364e3c7720mr8545078wrp.674.1668944944671;
        Sun, 20 Nov 2022 03:49:04 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7udSW6/pfqawh/yYUkdpdhzbG5vE8EEGEBnisT1ahzb5hGEDLmfhdqECpSPgvVpZoIghYixw==
X-Received: by 2002:adf:f74d:0:b0:236:4e3c:7720 with SMTP id z13-20020adff74d000000b002364e3c7720mr8545068wrp.674.1668944944420;
        Sun, 20 Nov 2022 03:49:04 -0800 (PST)
Received: from localhost (net-188-216-77-84.cust.vodafonedsl.it. [188.216.77.84])
        by smtp.gmail.com with ESMTPSA id t11-20020adff60b000000b0022e035a4e93sm8629318wrp.87.2022.11.20.03.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 03:49:03 -0800 (PST)
Date: Sun, 20 Nov 2022 12:49:01 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: Ziyang Xuan <william.xuanziyang@huawei.com>
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
	linux@armlinux.org.uk, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	lorenzo@kernel.org
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: fix potential memory
 leak in mtk_rx_alloc()
Message-ID: <Y3oULSsTwbDY2Bvv@lore-desk>
References: <20221120035405.1464341-1-william.xuanziyang@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Mg3mLB7M7b1XKZaD"
Content-Disposition: inline
In-Reply-To: <20221120035405.1464341-1-william.xuanziyang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_034911_926011_06BA0527 
X-CRM114-Status: GOOD (  17.94  )
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


--Mg3mLB7M7b1XKZaD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> When fail to dma_map_single() in mtk_rx_alloc(), it returns directly.
> But the memory allocated for local variable data is not freed, and
> local variabel data has not been attached to ring->data[i] yet, so the
> memory allocated for local variable data will not be freed outside
> mtk_rx_alloc() too. Thus memory leak would occur in this scenario.
>=20
> Add skb_free_frag(data) when dma_map_single() failed.
>=20
> Fixes: 23233e577ef9 ("net: ethernet: mtk_eth_soc: rely on page_pool for s=
ingle page buffers")
> Signed-off-by: Ziyang Xuan <william.xuanziyang@huawei.com>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>

>=20
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/et=
hernet/mediatek/mtk_eth_soc.c
> index 7cd381530aa4..bc47ef1e4dd5 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -2378,8 +2378,10 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int r=
ing_no, int rx_flag)
>  				data + NET_SKB_PAD + eth->ip_align,
>  				ring->buf_size, DMA_FROM_DEVICE);
>  			if (unlikely(dma_mapping_error(eth->dma_dev,
> -						       dma_addr)))
> +						       dma_addr))) {
> +				skb_free_frag(data);
>  				return -ENOMEM;
> +			}
>  		}
>  		rxd->rxd1 =3D (unsigned int)dma_addr;
>  		ring->data[i] =3D data;
> --=20
> 2.25.1
>=20

--Mg3mLB7M7b1XKZaD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY3oULQAKCRA6cBh0uS2t
rB+XAQC1NS342yCNR/mijZECnJw0DZzDUciWxdRU9qpQUcIisAD8C9l7RVkWprf7
ZY5de9YVDFIspT/WErMrTjJIkJRU4g8=
=vshG
-----END PGP SIGNATURE-----

--Mg3mLB7M7b1XKZaD--


