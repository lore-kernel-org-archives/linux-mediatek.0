Return-Path: <SRS0=qrwZ=H5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EECA3C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Feb 2021 10:26:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D3C464EDC
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Feb 2021 10:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D3C464EDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EIpELLH5H6XLGapkbZq64Oe2kB1L0ir8ow2DIsaF4N4=; b=p+mmzj/tHKQ0yxi2EWlXyTDlk
	sTwYRQqyf/UjrZzHTCYH1M1K4TFkPfXprv4l7AasqehXdbG7eEVx9ksPQJdMUqfGehvFd/RNTQjlf
	N4BMnnVw4ve6dafKhrKj/jzcWf7USiRE3WB79fo8WClg9sQ9c3C7jAS09rVPoK9CmhBRUAT2qWJMn
	1VHPxS9vtAyL6Mxmf1oKespMt2dKfk2Qkpac5KNvGFdvy2+QOVgQdowL3sqsvsv00oM1kyLTEhz9h
	OzGIKQDtFiQe/a1uFM4wamxybfM8rZKjncR+EzydCRlmserRuzJwOSp5kCnrwBWvgmB2tsuwD+s89
	CHAXAchJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFwnp-00056a-PB; Sat, 27 Feb 2021 10:26:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFwnn-000567-Fd
 for linux-mediatek@lists.infradead.org; Sat, 27 Feb 2021 10:26:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 175AE64ED5;
 Sat, 27 Feb 2021 10:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614421582;
 bh=XO6UU8J6psHkJ5PcrSAcSy2M7xNonSzXvs10KkOZ7ns=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HckBmWJprwk1f0/ZkIO2GRWAKm7KTneLAYQbgZhKopclXa25iJOV7dLOfhdpEkDge
 uRkXio1EWLYc+2msoVUwXoPORpaYaR0p5YppdxlKkxgQDSAjsrn4PIGtkYyGkgAtDQ
 fIT1288ksmDRQDmu06spbURI80+xqJLnnCMGqy+R3GEaKah7c8+7RC6g431iKkaCH2
 vgwSDIfaA1dbf2F7iXdsBd6/y8ixzlhzNizE9AC97ahiluHVW8YuwPupEb8ak9EAk0
 hYK296YY89ESPAAZFaDBJSiBfuOt48nclDsQarHC6m2pbUVMsOXrOiabwKA7XkNOUi
 5+/3h6bos+FUQ==
Date: Sat, 27 Feb 2021 11:26:18 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: [PATCH 4/5] mt76: mt7915: stop ext_phy queue when mac reset
 happens
Message-ID: <YDoeSgKugYwjQw4M@lore-desk>
References: <d6f2573790582538e8ba82f87a4c35329692ee32.1614411256.git.ryder.lee@mediatek.com>
 <20a4b03ba4a347a76df67291680704dfdb7da5d6.1614411256.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20a4b03ba4a347a76df67291680704dfdb7da5d6.1614411256.git.ryder.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210227_052623_597730_59D49457 
X-CRM114-Status: GOOD (  14.23  )
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
Cc: linux-mediatek@lists.infradead.org,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>, linux-wireless@vger.kernel.org,
 Felix Fietkau <nbd@nbd.name>
Content-Type: multipart/mixed; boundary="===============4073188658757759209=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4073188658757759209==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iNypzeBZfhswFpZY"
Content-Disposition: inline


--iNypzeBZfhswFpZY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Stop Tx burst for ext_phy after mac reset.
>=20
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7915/mac.c
> index 6b6ea33bd320..c653cd01b8d8 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
> @@ -1607,9 +1607,10 @@ void mt7915_mac_reset_work(struct work_struct *wor=
k)
>  	set_bit(MT76_MCU_RESET, &dev->mphy.state);
>  	wake_up(&dev->mt76.mcu.wait);
>  	cancel_delayed_work_sync(&dev->mphy.mac_work);
> -	if (phy2)
> +	if (phy2) {
> +		set_bit(MT76_RESET, &phy2->mt76->state);
>  		cancel_delayed_work_sync(&phy2->mt76->mac_work);

same question here as mt7615, do we really need this?

Regards,
Lorenzo

> -
> +	}
>  	/* lock/unlock all queues to ensure that no tx is pending */
>  	mt76_txq_schedule_all(&dev->mphy);
>  	if (ext_phy)
> @@ -1637,6 +1638,8 @@ void mt7915_mac_reset_work(struct work_struct *work)
> =20
>  	clear_bit(MT76_MCU_RESET, &dev->mphy.state);
>  	clear_bit(MT76_RESET, &dev->mphy.state);
> +	if (phy2)
> +		clear_bit(MT76_RESET, &phy2->mt76->state);
> =20
>  	mt76_worker_enable(&dev->mt76.tx_worker);
>  	napi_enable(&dev->mt76.tx_napi);
> --=20
> 2.18.0
>=20

--iNypzeBZfhswFpZY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYDoeRwAKCRA6cBh0uS2t
rMCfAP4vuBHRkZxjZU6lLdA3uMeNdc8eXWNBP2F84H+Sd5r6LAD+ONh7K0Xda4S1
67JHWJitN17qOBdYkYzkeiUGZpC8Iww=
=9yZY
-----END PGP SIGNATURE-----

--iNypzeBZfhswFpZY--


--===============4073188658757759209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4073188658757759209==--

