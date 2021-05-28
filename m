Return-Path: <SRS0=JD7o=KX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 840CAC47087
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 10:00:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F4E26135F
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 10:00:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F4E26135F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I4Wu/tz8MR6RJq4X6kI34D2qPvy9r6v7z0BLRZ6L2ao=; b=hijMO49HYlgPxMxg9npRhvbr1L
	ucvJSsyeE9Z2sKquL2wYbNhOws1bpCvDnxdPWb3kCVUojIownoyR+FeL+X9wsVGdjKMf+Csssv94G
	WiC2GYGMYpDYBUH1SKlk0mx4zMek6vq6M4AcHK1tm3HcgDcIQ/KKYl7UgEEuNtnCobKR0TL2C/ipU
	G0fut2z2X1HwsmtIzNjH4B8BOzw8PKlj8BTwS/kzm/o9Il3esxGCZvSMmV4XImNhUgmxaHTDVh6s2
	eLCQv1Uf/pSDR2sUhLUD+QXsldl2hvPHJwTA63CD6pfDYQ3qIGNuU7lduNyJPY+cATrROpOornV7V
	kixmpMYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmZI7-00EBnK-17; Fri, 28 May 2021 10:00:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmZHn-00EBd9-8c
 for linux-mediatek@lists.infradead.org; Fri, 28 May 2021 10:00:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 72BFF6113E;
 Fri, 28 May 2021 10:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622196009;
 bh=1EFGuJzQrt+sV+YW/yXOh29Ca+ZeeH8P9SwtZ3MQNZg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hNFRpcWSgzDf/SBvMfK6oT7wMCLBgmS1OCCoaxt1FZVF4oNMqbK7AdzOsTPyjfKod
 Aperao1/Y7SaQ+2uTNB13KipFwzG41e8/mGi/LG2b/Qj2hqo3N76blkXlEWukEIEnH
 6LQ8JWVENdfWXsA4DSZw428qn9vEoCZFMkf9w7lDrktb6dsTcYXy7mDq8grka/GCG9
 l60RgQIPYAh/8/Tt+k+XJwbYTN1FtqzbbIXMM3Z6h8L0+KuB5Ytdlpen9F38mGvWER
 WYUIDfPRAd50wn0XSmbCOPwmnjG7Nim8c5KOL2drMshum8mOv2gsgAIjeLGoQ5wNRX
 j1yO6fZAsTUfQ==
Date: Fri, 28 May 2021 12:00:05 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Deren.Wu@mediatek.com
Cc: nbd@nbd.name, lorenzo.bianconi@redhat.com, sean.wang@mediatek.com,
 Soul.Huang@mediatek.com, YN.Chen@mediatek.com,
 Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com,
 km.lin@mediatek.com, robin.chiu@mediatek.com, ch.yeh@mediatek.com,
 posh.sun@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, jemele@google.com, yenlinlai@google.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mt76: mt7921: update statistic in active mode only
Message-ID: <YLC/JQhJliH1FM0B@lore-desk>
References: <9337f7947e1f0921ffb6b4af541d29af9a0a9394.1622112237.git.deren.wu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <9337f7947e1f0921ffb6b4af541d29af9a0a9394.1622112237.git.deren.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_030011_393656_6BDEF9CF 
X-CRM114-Status: GOOD (  16.66  )
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
Content-Type: multipart/mixed; boundary="===============3821264182544482566=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3821264182544482566==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dyk70omr0HMm6HS1"
Content-Disposition: inline


--dyk70omr0HMm6HS1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Deren Wu <deren.wu@mediatek.com>
>=20
> wakeup chip every 250ms may cause huge power consumption
>=20
> try to update statistic counter only if in active status only,
> and it would lead fewer power cost
>=20
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/mac.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>=20

Hi Deren,

in order to be acceptable we need even patch 2/2. I guess it would be bette=
r to
squash them in oreder to not break it.

Regards,
Lorenzo

> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/mac.c
> index e29d4fdab572..212832b34674 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> @@ -1459,13 +1459,15 @@ void mt7921_pm_power_save_work(struct work_struct=
 *work)
>  {
>  	struct mt7921_dev *dev;
>  	unsigned long delta;
> +	struct mt76_phy *mphy;
> =20
>  	dev =3D (struct mt7921_dev *)container_of(work, struct mt7921_dev,
>  						pm.ps_work.work);
> +	mphy =3D dev->phy.mt76;
> =20
>  	delta =3D dev->pm.idle_timeout;
> -	if (test_bit(MT76_HW_SCANNING, &dev->mphy.state) ||
> -	    test_bit(MT76_HW_SCHED_SCANNING, &dev->mphy.state))
> +	if (test_bit(MT76_HW_SCANNING, &mphy->state) ||
> +	    test_bit(MT76_HW_SCHED_SCANNING, &mphy->state))
>  		goto out;
> =20
>  	if (time_is_after_jiffies(dev->pm.last_activity + delta)) {
> @@ -1473,8 +1475,10 @@ void mt7921_pm_power_save_work(struct work_struct =
*work)
>  		goto out;
>  	}
> =20
> -	if (!mt7921_mcu_fw_pmctrl(dev))
> +	if (!mt7921_mcu_fw_pmctrl(dev)) {
> +		cancel_delayed_work_sync(&mphy->mac_work);
>  		return;
> +	}
>  out:
>  	queue_delayed_work(dev->mt76.wq, &dev->pm.ps_work, delta);
>  }
> --=20
> 2.18.0
>=20

--dyk70omr0HMm6HS1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYLC/IAAKCRA6cBh0uS2t
rHzyAP0Q0zFFmdcnAJuuCidCeLFAoquizTDgg40cyTd2TnWlZgEAo4+U0LeaT1Z+
9Ti9+WF+lSb5jrYtiqGyn3f7lCHpZAo=
=+AVP
-----END PGP SIGNATURE-----

--dyk70omr0HMm6HS1--


--===============3821264182544482566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3821264182544482566==--

