Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE1DCCD18E
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Oct 2025 09:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/PXy34aVbH2cOCBybVkIgwC7LUDqbkxQ3ENtY6H23zA=; b=fKCK+n8ihjd8biBzyWe6g/OjOd
	VuGOBbb/fB4c4Kjr8VBqyRcFTia/BdbhVBB1R1e2rCAznKSDcOvq7XrE2YtS5kGwWJAgQ5ag7tMQN
	R160vCPndj5KbyjFXwwUYQzZ2sEE3O97xwurgo7f248wfottJ6uskN9aTsg1PumX6BhyBMVRyOCUR
	0emuMaybVKkkbDnyZCV3CcGcudVK/m6X5a4NWSMWocB3tPZbA9DVrWuHuT5/pMw6MmF1PIMfY5arW
	wfm18CY9xEbUQDUQ8W4P4NFY0FfdpnhWW9LbE0B5S4ay6u3bxlife9lv2MLX+f+gLSd4uvgqG++1n
	ltM/mwPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8bFw-0000000FkFm-08Wm;
	Tue, 14 Oct 2025 09:23:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8bFt-0000000FkDs-0OyH;
	Tue, 14 Oct 2025 09:23:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 92FC6405A8;
	Tue, 14 Oct 2025 09:23:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AEAEC113D0;
	Tue, 14 Oct 2025 09:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760433820;
	bh=8UMDWUKXnpdCQC7p8eOw9etMN6k4kyh9pwqfBIRJJR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OxijG8Ee2g5+wVQnN1qVAuG8VcAY4HRVLn8vhSjOM7j7u/qSgp3Y1jBaIy50zEbUr
	 3UmR+WU+NNvFUBOoKX6jegmuW9xrZ8b3jTnCKA0LccwLcM2WJIhKjzkQzokmU4GCFT
	 p1C4gatH3OkYEwhVTUhG1+NaJsdWUZ6u4LIBleck60/q1eijpfs6FEBPl83NKAHsC+
	 hb+6Zyq4fTx4ghfJ8XGh0t4prBJwWp5HAK7oJ5X35ixzuIz3ouRm6F9xM23i35s67o
	 jW1aP4lFTsRyNPTSqQOGbBsTROYsZh7oszs1QwFMgghXEnRl9odRaf3Kl12TqZ48Z8
	 3NVfLEmJjjzkg==
Date: Tue, 14 Oct 2025 11:23:37 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v3 2/3] net: airoha: npu: Add
 airoha_npu_soc_data struct
Message-ID: <aO4WmeuoAcZLFSBo@lore-desk>
References: <20251013-airoha-npu-7583-v3-0-00f748b5a0c7@kernel.org>
 <20251013-airoha-npu-7583-v3-2-00f748b5a0c7@kernel.org>
 <aO4LL8racazLjjzk@horms.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RC3OzpSHrP3UiKaL"
Content-Disposition: inline
In-Reply-To: <aO4LL8racazLjjzk@horms.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_022341_175052_B0033B25 
X-CRM114-Status: GOOD (  22.89  )
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


--RC3OzpSHrP3UiKaL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Mon, Oct 13, 2025 at 03:58:50PM +0200, Lorenzo Bianconi wrote:
>=20
> ...
>=20
> > @@ -182,49 +192,53 @@ static int airoha_npu_send_msg(struct airoha_npu =
*npu, int func_id,
> >  	return ret;
> >  }
> > =20
> > -static int airoha_npu_run_firmware(struct device *dev, void __iomem *b=
ase,
> > -				   struct resource *res)
> > +static int airoha_npu_load_firmware(struct device *dev, void __iomem *=
addr,
> > +				    const struct airoha_npu_fw *fw_info)
> >  {
> >  	const struct firmware *fw;
> > -	void __iomem *addr;
> >  	int ret;
> > =20
> > -	ret =3D request_firmware(&fw, NPU_EN7581_FIRMWARE_RV32, dev);
> > +	ret =3D request_firmware(&fw, fw_info->name, dev);
> >  	if (ret)
> >  		return ret =3D=3D -ENOENT ? -EPROBE_DEFER : ret;
> > =20
> > -	if (fw->size > NPU_EN7581_FIRMWARE_RV32_MAX_SIZE) {
> > +	if (fw->size > fw_info->max_size) {
> >  		dev_err(dev, "%s: fw size too overlimit (%zu)\n",
> > -			NPU_EN7581_FIRMWARE_RV32, fw->size);
> > +			fw_info->name, fw->size);
> >  		ret =3D -E2BIG;
> >  		goto out;
> >  	}
> > =20
> > -	addr =3D devm_ioremap_resource(dev, res);
> > -	if (IS_ERR(addr)) {
> > -		ret =3D PTR_ERR(addr);
> > -		goto out;
> > -	}
> > -
> >  	memcpy_toio(addr, fw->data, fw->size);
> > +out:
> >  	release_firmware(fw);
> > =20
> > -	ret =3D request_firmware(&fw, NPU_EN7581_FIRMWARE_DATA, dev);
> > -	if (ret)
> > -		return ret =3D=3D -ENOENT ? -EPROBE_DEFER : ret;
> > +	return ret;
> > +}
> > =20
> > -	if (fw->size > NPU_EN7581_FIRMWARE_DATA_MAX_SIZE) {
> > -		dev_err(dev, "%s: fw size too overlimit (%zu)\n",
> > -			NPU_EN7581_FIRMWARE_DATA, fw->size);
> > -		ret =3D -E2BIG;
> > -		goto out;
> > -	}
> > +static int airoha_npu_run_firmware(struct device *dev, void __iomem *b=
ase,
> > +				   struct resource *res)
> > +{
> > +	const struct airoha_npu_soc_data *soc;
> > +	void __iomem *addr;
> > +	int ret;
> > =20
> > -	memcpy_toio(base + REG_NPU_LOCAL_SRAM, fw->data, fw->size);
> > -out:
> > -	release_firmware(fw);
> > +	soc =3D of_device_get_match_data(dev);
> > +	if (!soc)
> > +		return -EINVAL;
> > =20
> > -	return ret;
> > +	addr =3D devm_ioremap_resource(dev, res);
> > +	if (IS_ERR(addr))
> > +		return PTR_ERR(addr);
> > +
> > +	/* Load rv32 npu firmware */
> > +	ret =3D airoha_npu_load_firmware(dev, addr, &soc->fw_rv32);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Load data npu firmware */
> > +	return airoha_npu_load_firmware(dev, base + REG_NPU_LOCAL_SRAM,
> > +					&soc->fw_data);
>=20
> Hi Lorenzo,

Hi Simon,

>=20
> There are two calls to airoha_npu_load_firmware() above.
> And, internally, airoha_npu_load_firmware() will call release_firmware()
> if an error is encountered.
>=20
> But should release_firmware() be called for the firmware requested
> by the first call to airoha_npu_load_firmware() if the second call fails?
> Such clean-up seems to have been the case prior to this patch.

release_firmware() is intended to release the resources allocated by the
corresponding call to request_firmware() in airoha_npu_load_firmware().
According to my understanding we always run release_firmware() in
airoha_npu_load_firmware() before returning to the caller. Even before this
patch we run release_firmware() on the 'first' firmware image before reques=
ting
the second one. Am I missing something?

>=20
> Also, not strictly related. Should release_firmware() be called (twice)
> when the driver is removed?

For the above reasons, it is not important to call release_firmware() remov=
ing
the module. Agree?

Regards,
Lorenzo

>=20
> >  }
> > =20
> >  static irqreturn_t airoha_npu_mbox_handler(int irq, void *npu_instance)
>=20
> ...

--RC3OzpSHrP3UiKaL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaO4WmQAKCRA6cBh0uS2t
rMoTAP9HdqSplLptTvESowj2txGAcrb/gc17fXY3RbXV9I2MoQEAokKGOUSeg9My
inH68eZk4H3dQS+CcqdVfpLwtEramQU=
=2u0A
-----END PGP SIGNATURE-----

--RC3OzpSHrP3UiKaL--

