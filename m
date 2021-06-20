Return-Path: <SRS0=SDo2=LO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8949DC48BDF
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Jun 2021 09:44:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 455E76100A
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Jun 2021 09:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 455E76100A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+NTWopUrN94iTy/HmuPLkaz0M7jyY5deNLbblrGQyJ8=; b=IQwbXlgX2NVRnqsYRY1w/LR7ol
	mY2LEH4BODhxN91rwD0/ruBMppQbfwWWx8TxErkM6dzgmKfU/qx20UxSGmv3+JsePYTHGM4MYlm76
	gGB1hg+llrW+/Qnyo9mG/L1b1oO8Ktndqtue+3v4V8HmjloXDANnXaP7UhVIPbRMolNny5FBxQf2e
	m0SPkwLucBsi7KATHT460Tnpk1x3zWRJvVbRkBwnAzL6Q/Bijg818HTImPX007CEo1U8f2pm2a8hY
	2EWCvy6ugXdKTRQ14qQmNdnKSzpeeGXBszBV8GmFYWKCZ2xD6eq6WLitVjiZVoMKfsQ4ReBCIGAAe
	jUvA4I2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luu04-000nmV-91; Sun, 20 Jun 2021 09:44:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luu02-000nm9-4Q
 for linux-mediatek@lists.infradead.org; Sun, 20 Jun 2021 09:44:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 244856100A;
 Sun, 20 Jun 2021 09:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624182257;
 bh=ZVpCRDYLtBBwy7xkskFEB+FcTLVSN6KKKd1Hft64J0c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s2FW1waHDmMcQYOwP4vbKZENkaPwbvReIIhmHSxKZnOmz/C9sRfpIERYsobkHHVQU
 zbOBhkEdWbXv9+T+epJ/Km1hTn2RajYinJqDRgeCqfMlGwzbdThSgkLX5aCADivC93
 Oza1stKSE7G/ZmcuIsLaYqZ7exKOcVL/syKNv/OGExuSRtLyfVAoZXq6l4say1aq9i
 zxt4HwhhjzRqSv8q9pyUrVbu1v5Fkjk3silMB55Gc5WVT53+UH9mgA7PW3Sm8Q7B/8
 OwE5BTdkG7y4gQeQz8FTu6feiGWvzOvQ+uJEkWAbTx+I+AdgteGYAy1KtPclqEFCD9
 4bf6bNWwIEdFQ==
Date: Sun, 20 Jun 2021 11:44:12 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, lorenzo.bianconi@redhat.com, Soul.Huang@mediatek.com,
 YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com,
 km.lin@mediatek.com, robin.chiu@mediatek.com, ch.yeh@mediatek.com,
 posh.sun@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, jemele@google.com, yenlinlai@google.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] mt76: mt7921: enable aspm by default
Message-ID: <YM8N7BRIk5QzaEZy@lore-desk>
References: <9b704807383f3048898944d2b9cb74e6b4e8d83d.1624174954.git.objelf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <9b704807383f3048898944d2b9cb74e6b4e8d83d.1624174954.git.objelf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210620_024418_240692_04C3B09E 
X-CRM114-Status: GOOD (  17.15  )
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
Content-Type: multipart/mixed; boundary="===============3170074548769520363=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3170074548769520363==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yw7NNhvB76jksAQU"
Content-Disposition: inline


--yw7NNhvB76jksAQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> mt7921 is mainly used in NB, CE and IoT application where battery life is
> much concerned so the patch enabled PCIe ASPM by default to shut off the
> clocks related PCIe as much as possible when MT7921 is either in suspend
> state or in runtime pm to lower power consumption.
>=20
> We still leave disable aspm as an option with module_param for users to
> disable ASPM if necessary.

instead of adding a module parameter (deprecated), why not just enable it by
default for mt7921 and add a debugfs knob to flip it?

Regards,
Lorenzo

>=20
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/pci.c
> index c3905bcab360..33782e1ee312 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> @@ -17,6 +17,10 @@ static const struct pci_device_id mt7921_pci_device_ta=
ble[] =3D {
>  	{ },
>  };
> =20
> +static bool mt7921_disable_aspm;
> +module_param_named(disable_aspm, mt7921_disable_aspm, bool, 0644);
> +MODULE_PARM_DESC(disable_aspm, "disable PCI ASPM support");
> +
>  static void
>  mt7921_rx_poll_complete(struct mt76_dev *mdev, enum mt76_rxq_id q)
>  {
> @@ -132,7 +136,8 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
>  	if (ret)
>  		goto err_free_pci_vec;
> =20
> -	mt76_pci_disable_aspm(pdev);
> +	if (mt7921_disable_aspm)
> +		mt76_pci_disable_aspm(pdev);
> =20
>  	mdev =3D mt76_alloc_device(&pdev->dev, sizeof(*dev), &mt7921_ops,
>  				 &drv_ops);
> --=20
> 2.25.1
>=20

--yw7NNhvB76jksAQU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYM8N6QAKCRA6cBh0uS2t
rNimAP4jh3ekcFwCAH/JZUIv6wMtxWc8AC6WF6ZBLFXVSHKwfgEAo/v9Lpm+g7na
G+XNKkipa6La+NdzwgzP+qTgpG+nngk=
=dJNJ
-----END PGP SIGNATURE-----

--yw7NNhvB76jksAQU--


--===============3170074548769520363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3170074548769520363==--

