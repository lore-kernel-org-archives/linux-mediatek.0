Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A62D3B7F3
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Dec 2025 14:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8nKz2i+UgA4ZnB2wqGPDMLkn1/884FRr78R0DF/R32M=; b=GKDDoej6Q2sj2KAU/0Sq+6Vbrp
	ZJYbpWG89NvxkDi191egO7+ip0SZp8VRiRyUBVv/Ai2veEA5Uxd+Up3vToQVXI5U6nbJFOHQPY8gZ
	r0w/XruGCL7KCJzGmMqTxBXUaWHoK/hmssm1dj4/owvqffs7MAiHQtcsDeCu2gqrZWWc8q6cDvD+H
	/vYFwRMR9QVLomllTDiJze9o8nlORmFTk5ShYc5ui2cDO8tosW+Aap2QvlPNKZcahH4sEY+TnZSiP
	44BNmmVF1QjMhIhCOQQ5t/Lq5SZZqEAUGkQ+TtI4zyFMx/q/2fj+JxyedzRijVv2zujS5GOaliP0H
	XhAxKE+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSc4U-0000000DAqS-3k64;
	Mon, 08 Dec 2025 14:18:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSc4T-0000000DAqI-1Bpu
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Dec 2025 14:18:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B261A60153;
	Mon,  8 Dec 2025 14:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12FCCC113D0;
	Mon,  8 Dec 2025 14:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765203516;
	bh=SjQTmjRaxoAZEdS9VaHUthT3W5NWzBYP22Q6Yz5xYTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iugpJget+ITa0hSKukq/g6oTbAbGtomuNJqpaE9VStyQu/aM2dsgFkFqwoukGrqxL
	 7//6qOSL1aB2OrHcbUgjc5OTk85gEFsNvy+CVjpJlwdfasSxCZpAInaq8udDl1Btmn
	 pRsXpoE9Qn1YoxiynN9BlfOhO9bX85YlpLiUEGEhxDR1F4Jvd+E2WwLJ6J8GVYNCsi
	 Alajq+EwL9OO3UZcgRok7bhAPIAUZngyOzPOu2wahc1+ds/+hhjqXydNa2THRsbMJW
	 VQLyzMrX2Lk4g75BX7oba+Zdo/wEJ9nT6QqnzH1Le/xboKfgUhsWqInJpk0KxA9hto
	 SZAJtYQ9w6hMg==
Date: Mon, 8 Dec 2025 15:18:33 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Chad Monroe <chad@monroe.io>
Cc: Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes.berg@intel.com>,
	Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	Ryder Lee <ryder.lee@mediatek.com>, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mt76: mt7996: reset device after MCU message timeout
Message-ID: <aTbeOResfSpMk6hZ@lore-desk>
References: <27bebda195599b55d097f4586a034dddce5d2cc0.1765202889.git.chad@monroe.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZgBOj1SGc4qFoWQM"
Content-Disposition: inline
In-Reply-To: <27bebda195599b55d097f4586a034dddce5d2cc0.1765202889.git.chad@monroe.io>
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


--ZgBOj1SGc4qFoWQM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Trigger a full reset after MCU message timeout.
>=20
> Signed-off-by: Chad Monroe <chad@monroe.io>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 5 +++++
>  drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 9 +++++++++
>  2 files changed, 14 insertions(+)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7996/mac.c
> index 2560e2f46e89..07b0a694c1bb 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> @@ -2736,6 +2736,11 @@ void mt7996_reset(struct mt7996_dev *dev)
>  		return;
>  	}
> =20
> +	if ((READ_ONCE(dev->recovery.state) & MT_MCU_CMD_STOP_DMA)) {

nit: you do not need double brackets here.

Regards,
Lorenzo

> +		set_bit(MT76_MCU_RESET, &dev->mphy.state);
> +		wake_up(&dev->mt76.mcu.wait);
> +	}
> +
>  	queue_work(dev->mt76.wq, &dev->reset_work);
>  	wake_up(&dev->reset_wait);
>  }
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7996/mcu.c
> index 14a88ef79b6c..40ebda9a3f12 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> @@ -209,6 +209,7 @@ static int
>  mt7996_mcu_parse_response(struct mt76_dev *mdev, int cmd,
>  			  struct sk_buff *skb, int seq)
>  {
> +	struct mt7996_dev *dev =3D container_of(mdev, struct mt7996_dev, mt76);
>  	struct mt7996_mcu_rxd *rxd;
>  	struct mt7996_mcu_uni_event *event;
>  	int mcu_cmd =3D FIELD_GET(__MCU_CMD_FIELD_ID, cmd);
> @@ -217,6 +218,14 @@ mt7996_mcu_parse_response(struct mt76_dev *mdev, int=
 cmd,
>  	if (!skb) {
>  		dev_err(mdev->dev, "Message %08x (seq %d) timeout\n",
>  			cmd, seq);
> +
> +		if (!test_and_set_bit(MT76_MCU_RESET, &dev->mphy.state)) {
> +			dev->recovery.restart =3D true;
> +			wake_up(&dev->mt76.mcu.wait);
> +			queue_work(dev->mt76.wq, &dev->reset_work);
> +			wake_up(&dev->reset_wait);
> +		}
> +
>  		return -ETIMEDOUT;
>  	}
> =20
> --=20
> 2.47.3
>=20
>=20
>=20

--ZgBOj1SGc4qFoWQM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaTbeOQAKCRA6cBh0uS2t
rBRdAQDpgmkK6Zsh1t0kzKkUl6bsh9G75hBe3VMQu7d4a3Og3wD9EPrcYUfL8DOz
xSiHjYwGb+3+Gg59nWWN757fWR6jAg8=
=LKrR
-----END PGP SIGNATURE-----

--ZgBOj1SGc4qFoWQM--

