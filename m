Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD619C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 22:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4lrAebbrsaV7SbYoAyQdPzI0ZTvSKq+0zcXGzBEpvY=; b=vbLGSxGSwZsCWQiUGO7G6/yEeq
	MQxSASTfSN2rYmp99sG1XQnighD7AM59MHSuYgR0By6EYRI1+jfwpTdYcxnRZkE2Mg1dDZDI/ymjt
	LnwFKxe6R8ipLYfe6Al9oIabsabID389QhTISKOG2mOIykQJOsYBdk8ntjgpXqldxbcnrcf1Im4a4
	AziZXCcJiu8KtAXvSJ7dMfVH/FOdgGw/zEYh5chgVMHFvIajxpQKEMJAgjMGb9f8NaFw1yH8iif/O
	8r5sieyu+gTtSmUC8cvBwBFukz0m7XsdTDkf2t3bSLXyFYKhGLB0ILo7SXas9rnDEesGBQCsW+0ZW
	nLoDU7TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDYpE-001qsq-Iv; Mon, 18 Jul 2022 22:02:48 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDYp9-001qrx-N8
	for linux-mediatek@lists.infradead.org; Mon, 18 Jul 2022 22:02:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1BDFDB817B5;
	Mon, 18 Jul 2022 22:02:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 409FDC341C0;
	Mon, 18 Jul 2022 22:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658181760;
	bh=Nxs+neqrTmVc0kmk3RZapzGrMhYfWi3RPreVSuYvyh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KWJApb2BkuqV4O09lSd0Q5KqsUCWMt2NmEZXwZkM+4H6pXQfzcEgnlV0Za/Ip9vQZ
	 l1ri5tpwCPYdsThhGzrdPHugnj6nXqPe+y47+qqxaX3RY82PBR07+D+/7toLddXgvU
	 EoA/aWF0j8ZV36gdn8hftXMYghnRiXDHqMky6SOG276i+8zM0LxHAl+J5cdX/3OQ96
	 Tp4MlJqjaIopmIWFPWCH509ObHcf34LkF10kNaekVNH8DaQpdc2ijy91XGsmSCDLEy
	 twDkwTaF+TbdeXtDyeBcsPMrllFnV/GMyZbXsL+sfvB5PCLxZZGqzw1ceY2HNPfS2b
	 1AtneqJ3j6CIg==
Date: Tue, 19 Jul 2022 00:02:37 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, lorenzo.bianconi@redhat.com, Soul.Huang@mediatek.com,
	YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
	Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com,
	km.lin@mediatek.com, jenhao.yang@mediatek.com,
	robin.chiu@mediatek.com, Eddie.Chen@mediatek.com,
	ch.yeh@mediatek.com, posh.sun@mediatek.com, ted.huang@mediatek.com,
	Stella.Chang@mediatek.com, Tom.Chou@mediatek.com,
	steve.lee@mediatek.com, jsiuda@google.com, frankgor@google.com,
	kuabhs@google.com, druth@google.com, abhishekpandit@google.com,
	shawnku@google.com, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] mt76: mt7921s: fix the deadlock caused by
 sdio->stat_work
Message-ID: <YtXYffraDN7RxoTr@lore-desk>
References: <aa7d7ed8f3a817525ab8c7b736f1ce52490a835e.1658176763.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/JO1kva0Pj3FmabW"
Content-Disposition: inline
In-Reply-To: <aa7d7ed8f3a817525ab8c7b736f1ce52490a835e.1658176763.git.sean.wang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_150244_092192_1E92F575 
X-CRM114-Status: GOOD (  21.86  )
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


--/JO1kva0Pj3FmabW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> Because wake_work and sdio->stat_work share the same workqueue mt76->wq,
> if sdio->stat_work cannot acquire the mutex lock such as that was possibly
> held up by mt7921_mutex_acquire, we should exit immediately and schedule
> another stat_work to avoid blocking the mt7921_mutex_acquire.
>=20
> Also, if mt7921_mutex_acquire was called by sdio->stat_work self, the wake
> would be blocked by itself, so we have to changing into an unblocking wake
> (directly wakeup via mt7921_mcu_drv_pmctrl, not via the wake_work) in the
> context.

Hi Sean,

it seems to me we are missing some logic here (e.g cancelling ps_work as we=
 do
in mt76_connac_pm_wake()). Is it enough to move mt7921_usb_sdio_tx_status_d=
ata
on mac80211 workqueue? Can you see any performance issue? (same for mt7663).

Regards,
Lorenzo

>=20
> Fixes: 48fab5bbef40 ("mt76: mt7921: introduce mt7921s support")
> Co-developed-by: YN Chen <YN.Chen@mediatek.com>
> Signed-off-by: YN Chen <YN.Chen@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  .../net/wireless/mediatek/mt76/mt7921/mac.c   | 22 +++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/mac.c
> index 6bd9fc9228a2..75e719175e92 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> @@ -1080,10 +1080,28 @@ bool mt7921_usb_sdio_tx_status_data(struct mt76_d=
ev *mdev, u8 *update)
>  {
>  	struct mt7921_dev *dev =3D container_of(mdev, struct mt7921_dev, mt76);
> =20
> -	mt7921_mutex_acquire(dev);
> +	if (!mutex_trylock(&mdev->mutex)) {
> +		/* Because wake_work and stat_work share the same workqueue
> +		 * mt76->wq, if sdio->stat_work cannot acquire the mutex lock,
> +		 * we should exit immediately and schedule another stat_work
> +		 * to avoid blocking the wake_work.
> +		 */
> +		struct work_struct *stat_work;
> +
> +		stat_work =3D mt76_is_sdio(mdev) ? &mdev->sdio.stat_work :
> +			    &mdev->usb.stat_work;
> +		queue_work(dev->mt76.wq, stat_work);
> +
> +		goto out;
> +	}
> +
> +	mt7921_mcu_drv_pmctrl(dev);
>  	mt7921_mac_sta_poll(dev);
> -	mt7921_mutex_release(dev);
> +	mt76_connac_power_save_sched(&mdev->phy, &dev->pm);
> =20
> +	mutex_unlock(&mdev->mutex);
> +
> +out:
>  	return false;
>  }
>  EXPORT_SYMBOL_GPL(mt7921_usb_sdio_tx_status_data);
> --=20
> 2.25.1
>=20

--/JO1kva0Pj3FmabW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYtXYfQAKCRA6cBh0uS2t
rG4SAP9aMU+iYWw71kmWoYSQa2FQYwVV8olQtNGNtkAAF7Ln2gEA2o0rIjEagdFd
3FxnmJXvn6wKSWhsfuHUut72LyinXQM=
=f6c5
-----END PGP SIGNATURE-----

--/JO1kva0Pj3FmabW--

