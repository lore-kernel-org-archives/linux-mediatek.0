Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA28E77170
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2024 11:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uVThz5d5H5gKAWbx/WAIba3kaWN4OHM2WZEZRby5SVE=; b=IrDSv/+2iytXkHUQCje/45DcIn
	QUVG/Y3jjJZXyOZ0J4aJGASJHh5Z2yy/YulR3r0v9ORbuUQ5YmPGcZB1BaKItr+GKY1KbLptuGj5I
	/Tfj8en2GfU1Xa2KryShRxFmKfeyhCeebvBd3TfyTtK8uP/0CEP6jEY4NijaowU4tCFCaBph5GlOZ
	EuOp61lTd93a9zbBCVIVr+aHeGGnN5Ja6R12gMb2+jmDXOLY4L1RO8EhMu0Ac2dmizGS2Yw3aMGF1
	Euh6sOcI65KSANLFmCKCST9abaXZkw4oSqYeDcMw25ZtYnFjvQPUOzPjomFfhAmbRQBKvnfxNkDLw
	lWmuAs1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAVi-0000000Fpeg-3LJT;
	Thu, 05 Dec 2024 11:59:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9J2-0000000FZPI-0zRB
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Dec 2024 10:42:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CA7545C7273;
	Thu,  5 Dec 2024 10:41:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C73D7C4CED1;
	Thu,  5 Dec 2024 10:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733395319;
	bh=NZpLIj+aF6yV18wyiV+hZZsvH1NLZeOx7bLmfti8dgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VnMLmm3tlYwB1Ys4r5Vn/PjbwurVtHQJbu2Sp9+upCl8vyYMiKZJtRNZi9p41s3dd
	 +QwXcCDWaVNsFDd7tYDQKJycBt3wIkC592WOq5c2OCWOox4WrIqAu/bKBeyRsi9N93
	 T1aLVwyzqHihZ94hruw1akFGxr+cDy3yHC2zrIbMFU3LuOjZrbl8eYf2Xf9teq8jxz
	 2r20V8p90hvV6R/o7HM9bEiRQkiL/bJUld2qbg2DALga5ZVfRhhR8QSVihRYtnbPZN
	 Wqeewe7ZalHOUg6pZrwnuZb9WoFgbLJW6wGDJL2UxBTqsu9BZIZAp8fWpe9+R5mTX7
	 45eztKwfLgngQ==
Date: Thu, 5 Dec 2024 11:41:56 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Zijun Hu <zijun_hu@icloud.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>, 
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev, linux-sound@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-block@vger.kernel.org, linux-cxl@vger.kernel.org, 
	linux1394-devel@lists.sourceforge.net, arm-scmi@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-hwmon@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	open-iscsi@googlegroups.com, linux-usb@vger.kernel.org, linux-serial@vger.kernel.org, 
	netdev@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>
Subject: Re: [PATCH v3 04/11] driver core: Constify API device_find_child()
 then adapt for various usages
Message-ID: <h4pndknfwvck5yjnbs5rdmrxkqeksfxldwj4qbjqyvdzs5cjbf@i4afsjsg3obw>
References: <20241205-const_dfc_done-v3-0-1611f1486b5a@quicinc.com>
 <20241205-const_dfc_done-v3-4-1611f1486b5a@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7cmlxza5fdv22slz"
Content-Disposition: inline
In-Reply-To: <20241205-const_dfc_done-v3-4-1611f1486b5a@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_024200_360793_4EF54B78 
X-CRM114-Status: GOOD (  12.69  )
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


--7cmlxza5fdv22slz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 04/11] driver core: Constify API device_find_child()
 then adapt for various usages
MIME-Version: 1.0

On Thu, Dec 05, 2024 at 08:10:13AM +0800, Zijun Hu wrote:
> diff --git a/arch/sparc/kernel/vio.c b/arch/sparc/kernel/vio.c
> index 07933d75ac815160a2580dce39fde7653a9502e1..1a1a9d6b8f2e8dfedefafde84=
6315a06a167fbfb 100644
> --- a/arch/sparc/kernel/vio.c
> +++ b/arch/sparc/kernel/vio.c
> @@ -419,13 +419,13 @@ struct vio_remove_node_data {
>  	u64 node;
>  };
> =20
> -static int vio_md_node_match(struct device *dev, void *arg)
> +static int vio_md_node_match(struct device *dev, const void *arg)
>  {
>  	struct vio_dev *vdev =3D to_vio_dev(dev);
> -	struct vio_remove_node_data *node_data;
> +	const struct vio_remove_node_data *node_data;
>  	u64 node;
> =20
> -	node_data =3D (struct vio_remove_node_data *)arg;
> +	node_data =3D (const struct vio_remove_node_data *)arg;

You can just drop the cast here. But maybe that is better be done i a
separate change.

>  	node =3D vio_vdev_node(node_data->hp, vdev);
> =20

Best regards
Uwe

--7cmlxza5fdv22slz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdRg3IACgkQj4D7WH0S
/k6XGAf6Av8yk2DAhSYXPrLn/Ud4m0Je4HKR7wDERTkoucUo/owwlaJH19v3/SEN
BoXiIS4oqDNVJbzYsEPr2ZJQLZUTvBMyzKLJ4oNU1RzaivgdSipCPyK6I0OAHNui
CtQI8qTG+gSxHLhoEeFCl2kcnUCtV4nGeXk44by5/Mu3CkC/pXRfbRn7iLrDX34F
XHQ9MMrA6tMoRuStbxo3xHkRI7CkjOJVO6hWgv6PPAoKdFb63QX7jdTrZQTIoNtP
2SMqVunbF87nTNTOQZWDCN1E3vELVsVjs6YsrlJeMYI9Gs7tcbVD4OHKUvrtSf86
UHoREl5N4LOf8l+HqvTaxQnH6pb+QQ==
=qufa
-----END PGP SIGNATURE-----

--7cmlxza5fdv22slz--

