Return-Path: <SRS0=c7Bv=H4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF88C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 11:10:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B80A164EEE
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 11:10:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B80A164EEE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=T+dSbDV75YWldp0WOJl8RRFX7Ss5mqP8IAufpULEKAY=; b=YbyL8IIHsyZWptFkkb175x6wo
	BbLh1zjXXSIBibc1xrP6ztCEpodsp4/CaDQSnsLl+tXColSGENGySqeESqKkHhNgn0sgy6SK5FAVw
	9nOMP6WgV7bP5Cd3Mo6N7B8DKlhaUBXaU9k4yhIX2DP8vCFLz54ZC9LOyIxppIF/fv2+6bWZNjTi1
	r5JbV1oaAabi5Nl7t1eATXdTE9FLTXsufeOpAR6r00MGx2O4CyOObr9osvjFMWalH2sA2KhYQY0YW
	28V6nxLfkZnWS3X+eiyOyfljmzOnPtsqqWAfiE5WaHf9Q95loUfFOQqKpyePRgiDGfc2q7eWcQj5M
	lcWLIMcUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFb0P-0007GB-W3; Fri, 26 Feb 2021 11:09:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFb0N-0007FS-49
 for linux-mediatek@lists.infradead.org; Fri, 26 Feb 2021 11:09:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C79E64E6C;
 Fri, 26 Feb 2021 11:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614337793;
 bh=XKQsWPvdzq64BeQHNfSblBPY8Ec1i9KpZVWh59++8mk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gcjvcRK5rXHGPdLgv4cOCXcjveQ1dAiH1l1Bxj/S+h5sv1ptpWp4SpeZE/E6X2evT
 FWAi1I+dcIVmJchWD/4m4gaDmhOc60JQPavKcQ9vRUlXlxquySO/8wSrPNs7r4Cc6y
 TC/vNcVqJHYSH9DcdLzVLebyp/BixAf5ax2y/6/NDac9Ts/2k7pT3PIsvt3erFzo/h
 fDnnjiztAxyrAXNecRS4ySl3+RSnE5GrYXkZK6z+h1oOdrHodXlqa/QJ0oHKM2QKus
 Cedj7VwQCsEli6zOPJ+8jHmXQU7Vxfmf8cHvO6UuhpjpTv0VuwRh+03AmZJKmB/t9Q
 dMCpzns/DQuiA==
Date: Fri, 26 Feb 2021 12:09:48 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: sean.wang@mediatek.com
Subject: Re: [PATCH 1/2] mt76: mt7921: fix the base of PCIe interrupt
Message-ID: <YDjW/LfRmgb84T4H@lore-desk>
References: <4ff45223ff7ecff8e20a722ffd2db77fe51fea00.1614327185.git.objelf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4ff45223ff7ecff8e20a722ffd2db77fe51fea00.1614327185.git.objelf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_060955_346899_F5A5572F 
X-CRM114-Status: GOOD (  14.04  )
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
Cc: robin.chiu@mediatek.com, ch.yeh@mediatek.com, Eric.Liang@mediatek.com,
 linux-wireless@vger.kernel.org, posh.sun@mediatek.com, YN.Chen@mediatek.com,
 Stella.Chang@mediatek.com, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi@redhat.com, Soul.Huang@mediatek.com, nbd@nbd.name
Content-Type: multipart/mixed; boundary="===============2401332256863299174=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2401332256863299174==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TeJPtBiF6yJ8P6Q6"
Content-Disposition: inline


--TeJPtBiF6yJ8P6Q6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> Should use 0x10000 as the base to operate PCIe interrupt according
> to the vendor reference driver.
>=20
> Fixes: ffa1bf97425b ("mt76: mt7921: introduce PM support")
> Co-developed-by: YN Chen <YN.Chen@mediatek.com>
> Signed-off-by: YN Chen <YN.Chen@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

For the series:

Tested-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/pci.c  | 4 ++--
>  drivers/net/wireless/mediatek/mt76/mt7921/regs.h | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/pci.c
> index 3e430c04c97e..def8b7816609 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> @@ -137,7 +137,7 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
> =20
>  	mt76_wr(dev, MT_WFDMA0_HOST_INT_ENA, 0);
> =20
> -	mt7921_l1_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0xff);
> +	mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0xff);
> =20
>  	ret =3D devm_request_irq(mdev->dev, pdev->irq, mt7921_irq_handler,
>  			       IRQF_SHARED, KBUILD_MODNAME, dev);
> @@ -248,7 +248,7 @@ static int mt7921_pci_resume(struct pci_dev *pdev)
>  		return 0;
> =20
>  	/* enable interrupt */
> -	mt7921_l1_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0xff);
> +	mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0xff);
>  	mt7921_irq_enable(dev, MT_INT_RX_DONE_ALL | MT_INT_TX_DONE_ALL |
>  			  MT_INT_MCU_CMD);
> =20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/regs.h b/drivers/n=
et/wireless/mediatek/mt76/mt7921/regs.h
> index 419add751980..c4bd31cc81cb 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/regs.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/regs.h
> @@ -391,7 +391,7 @@
>  #define MT_HW_CHIPID			0x70010200
>  #define MT_HW_REV			0x70010204
> =20
> -#define MT_PCIE_MAC_BASE		0x74030000
> +#define MT_PCIE_MAC_BASE		0x10000
>  #define MT_PCIE_MAC(ofs)		(MT_PCIE_MAC_BASE + (ofs))
>  #define MT_PCIE_MAC_INT_ENABLE		MT_PCIE_MAC(0x188)
> =20
> --=20
> 2.25.1
>=20

--TeJPtBiF6yJ8P6Q6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYDjW+gAKCRA6cBh0uS2t
rOmCAQCGVOdXmAXui1aktXC219Tdpl8GYbAGv6Pmht16KBauswD+KyYzlblAvYc5
3TKPeEeY4rUsGsD/dKRZJzo2Yzc/twM=
=upGh
-----END PGP SIGNATURE-----

--TeJPtBiF6yJ8P6Q6--


--===============2401332256863299174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2401332256863299174==--

