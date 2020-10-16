Return-Path: <SRS0=WAzV=DX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1695AC4363A
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 15:46:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9024E205CA
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 15:46:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AyupDNjX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="VOgIS4Nm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9024E205CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O8YoMsH+BkyQAEhiUH8ikThVHJDGt4QmdvB5PjidsvY=; b=AyupDNjXIUKpv4zP69L8OiQxh
	xOGQFMKXPaHuyG0auzn/3Gmr7z8ARrjFNIR4TXpqHLRPlhypVOwTMO9EVtjRtQ19TuJPre2t95R6z
	pXe5pNMeL8xn0zmP+qYXBlUamVPv19paniUW7v8oxi2a7lUNTr8a2wdX1OKrUFllcCFVmrXA5ixYj
	1anTZ4KJVa2j0BmTJ8NoS1enBvRnFSllmYR2Tuow2Jx7PLAG4KDSZ5866mUyoJyqikhTECZkHSMTA
	2OB7ZbObv7YVn8QbRQ3E6vvy1Sc0msjvmK794MdK3VxwZeWfVXpykD9ODUOcjEurSrMO65ikS+CyW
	JLfiNcPcg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTRvj-0001Yo-Rw; Fri, 16 Oct 2020 15:46:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTRvf-0001Xa-5x
 for linux-mediatek@lists.infradead.org; Fri, 16 Oct 2020 15:46:07 +0000
Received: from localhost (unknown [176.207.245.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A657D205CA;
 Fri, 16 Oct 2020 15:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602863161;
 bh=niTpDyZfJRFbAZD949hDaB5cZh5LED6Tjpy2z6iQJrA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VOgIS4Nmj843vZ6IiDfsxUjjhmrqfJd2xURjWisHLw2CbJhUZS+oqoPBeMK5Pf4nk
 ggS2cGwb3sNxSU2lfA5Hq4tkTh/oDkUjsNhsQ4T9yLecwdfpd/h9jWt6PbqFaFlRp+
 Yje8h2NqXZHX7F6S102rU6iyCev8xUT0yPUSpGKk=
Date: Fri, 16 Oct 2020 17:45:56 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: sean.wang@mediatek.com
Subject: Re: [PATCH 1/2] mt76: mt7663: handle failure event for patch
 semaphore cmd
Message-ID: <20201016154556.GA700952@lore-desk>
References: <267346a9a9c5f71caec03292b6c33b39864b38c5.1602807276.git.objelf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <267346a9a9c5f71caec03292b6c33b39864b38c5.1602807276.git.objelf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_114603_312060_F091ECFB 
X-CRM114-Status: GOOD (  19.87  )
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
Cc: ryder.lee@mediatek.com, Sean Wang <objelf@gmail.com>,
 linux-wireless@vger.kernel.org, YN Chen <YN.Chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com, nbd@nbd.name
Content-Type: multipart/mixed; boundary="===============4073272948528498511=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4073272948528498511==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Content-Disposition: inline


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <objelf@gmail.com>
>=20
> Just follow up vendor driver to retry a few times obtaining patch
> semaphore when the event is PATCH_NOT_DL_SEM_FAIL. That usually
> happens in Bluetooth and Wifi driver contends to download patch
> simultaneously.
>=20
> Co-developed-by: YN Chen <YN.Chen@mediatek.com>
> Signed-off-by: YN Chen <YN.Chen@mediatek.com>
> Signed-off-by:  Sean Wang <sean.wang@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7615/mcu.c
> index 2b17bd1c2a32..c990ccd6f472 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> @@ -1945,14 +1945,21 @@ static int mt7615_load_patch(struct mt7615_dev *d=
ev, u32 addr, const char *name)
>  {
>  	const struct mt7615_patch_hdr *hdr;
>  	const struct firmware *fw =3D NULL;
> -	int len, ret, sem;
> +	int len, ret, sem, c =3D 50;
> =20
> +retry:
>  	sem =3D mt7615_mcu_patch_sem_ctrl(dev, 1);
>  	switch (sem) {
>  	case PATCH_IS_DL:
>  		return 0;
>  	case PATCH_NOT_DL_SEM_SUCCESS:
>  		break;
> +	case PATCH_NOT_DL_SEM_FAIL:
> +		if (is_mt7663(&dev->mt76) && c--) {
> +			msleep(100);
> +			goto retry;
> +		}
> +		fallthrough;

I guess it is more clear to have a dedicated routine for this. E.g:

int mt7615_mcu_get_patch_semaphore()
{
	....
}

Regards,
Lorenzo

>  	default:
>  		dev_err(dev->mt76.dev, "Failed to get patch semaphore\n");
>  		return -EAGAIN;
> --=20
> 2.25.1

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCX4nAMQAKCRA6cBh0uS2t
rDqQAQCedzj17j1YTnDbrr3SSz6sBCBFGouH/x53fytdy6+WlwEAnKmO3SqyXcoE
SBNw3YRd/djU6IkXBpH5NEnM0tLJzgc=
=eXek
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--


--===============4073272948528498511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4073272948528498511==--

