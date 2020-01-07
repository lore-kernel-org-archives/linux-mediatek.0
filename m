Return-Path: <SRS0=GJVM=24=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FFA3C33C99
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jan 2020 10:57:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6DFD20848
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jan 2020 10:57:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pFFfEqlG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6DFD20848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pesL/OlogCjH+NEaCUw9ZEjRc4w8Xp91jViOGc9IhrQ=; b=pFFfEqlGO1/YW/DdMIPrX3GJn
	6QSasMASbqL3rC1qXM2ShISwVLzzjJsJQPUPkHbDC0GHFz60FpwrczpjVIT+gLzcw/MrKswzszm2c
	HPkQ0Momz3GcNZHNdgMBo3mz27Q9DFFEct0+bwA5NkzYVljlnQYgeDWv3qTl9Se8DJXIb9ZHUBqUe
	gtSaQiT6y4IE5qHQMyW5DmXCiDMlHfOwRp1Np24dqvGCgHWQVOnaAfq0XpvIMYDlr1tpVBFuHklyk
	/XQOC3VkBN+TEx4maFkQfqa7Om7VOntprmNKZg6drXQJl06gOZh6TZ8BCJy+KfijKH8SL4Kmgk9dH
	2nN7qDCdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iomY2-0007HV-AF; Tue, 07 Jan 2020 10:57:18 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iomXu-00079H-TZ; Tue, 07 Jan 2020 10:57:12 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 72E95AD05;
 Tue,  7 Jan 2020 10:57:09 +0000 (UTC)
Message-ID: <bb661c1013f5e05407f93a134f221fb0988ce63f.camel@suse.de>
Subject: Re: [PATCH 05/13] mailbox: bcm2835: convert to
 devm_platform_ioremap_resource
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Yangtao Li <tiny.windzz@gmail.com>, jassisinghbrar@gmail.com, 
 f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com, 
 bcm-kernel-feedback-list@broadcom.com, lftan@altera.com,
 matthias.bgg@gmail.com,  agross@kernel.org, bjorn.andersson@linaro.org,
 mcoquelin.stm32@gmail.com,  alexandre.torgue@st.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com, 
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, nios2-dev@lists.rocketboards.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
Date: Tue, 07 Jan 2020 11:57:07 +0100
In-Reply-To: <20191228183538.26189-5-tiny.windzz@gmail.com>
References: <20191228183538.26189-1-tiny.windzz@gmail.com>
 <20191228183538.26189-5-tiny.windzz@gmail.com>
User-Agent: Evolution 3.34.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200107_025711_097167_C7E885C0 
X-CRM114-Status: GOOD (  13.23  )
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
Content-Type: multipart/mixed; boundary="===============8790601404246762504=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8790601404246762504==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-y5AsCnHtvQY7mJ+3+eeo"


--=-y5AsCnHtvQY7mJ+3+eeo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2019-12-28 at 18:35 +0000, Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.
>=20
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

Thanks!

>  drivers/mailbox/bcm2835-mailbox.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/mailbox/bcm2835-mailbox.c b/drivers/mailbox/bcm2835-
> mailbox.c
> index 39761d190545..79f93c9c7682 100644
> --- a/drivers/mailbox/bcm2835-mailbox.c
> +++ b/drivers/mailbox/bcm2835-mailbox.c
> @@ -137,7 +137,6 @@ static int bcm2835_mbox_probe(struct platform_device
> *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
>  	int ret =3D 0;
> -	struct resource *iomem;
>  	struct bcm2835_mbox *mbox;
> =20
>  	mbox =3D devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
> @@ -153,8 +152,7 @@ static int bcm2835_mbox_probe(struct platform_device
> *pdev)
>  		return -ENODEV;
>  	}
> =20
> -	iomem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	mbox->regs =3D devm_ioremap_resource(&pdev->dev, iomem);
> +	mbox->regs =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(mbox->regs)) {
>  		ret =3D PTR_ERR(mbox->regs);
>  		dev_err(&pdev->dev, "Failed to remap mailbox regs: %d\n", ret);


--=-y5AsCnHtvQY7mJ+3+eeo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl4UZAMACgkQlfZmHno8
x/5XXwgAlWhWoPbAnKlacluRU3wwe6Bf/fyJCILvfBL9w8HbTcoFBOIX1v57lLdQ
vd8AzkmNgkzmUYyMOpKcyUI6+YQDgtc4qKutzeA7fLNS5oo2b0XB3tRwZa1ng1oJ
vknawhQvjlzIjfNNzO5UKIVWgSoVqZlHmuQyuRN6pemg9IgT7VaEEL/rEo1uOkix
eCyerYBXqS8Y5Ty0Y7KOjrDM2wFiggH/r6Y4mt+2Mto5pZDbY4CtBD1JjSb4u8eS
8TF9+Pf7Jqh/NW0xAz1x40aq+J77rPsKecWm96kWnJBTUyTx4Seh6mHsZQl1Nxej
fZAJaanhMv0nlXusFg/vtaSBr94lkQ==
=bWd1
-----END PGP SIGNATURE-----

--=-y5AsCnHtvQY7mJ+3+eeo--



--===============8790601404246762504==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8790601404246762504==--


