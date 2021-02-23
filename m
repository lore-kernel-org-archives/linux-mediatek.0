Return-Path: <SRS0=4Hoy=HZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D470C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Feb 2021 09:12:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99BB064E5C
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Feb 2021 09:12:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99BB064E5C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r0So+YUAHQf+zav5tzwpob0vGVj9xCr3dbVx2YypNxI=; b=MnlXt0ZBPL/LLa9aq+mFfN3Xs
	6lX+WBBhQspOI72TkJsP4WVYtFkB4vNJPQkz897MpT/NN7ZjussmsOeJDXUe+IyuE1H7t8zBNhS5g
	5sivxEKTlH/915B+muvCl3ZltlGxv2EcxbNiLuptMj6oVyTnSCTuEpsL+OTqhyzD9as+T9jTXfRTB
	Uj0Qdnk6QpD3Ky26nqgA735C7j1WB/k81Ns/rVekWyO4AjlLQjWd5rscCMzfpiXOLQonqq40HiBsn
	pjBzAgvkrcaB4lgMV2W+nE9fDfOj4hQhQwdiNYuWrSRes2fGTJFKamWc37PR+1hFqUX3+2vOoQCd/
	PQLpQzakA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lETjw-0002HM-5Y; Tue, 23 Feb 2021 09:12:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lETju-0002Gs-7n
 for linux-mediatek@lists.infradead.org; Tue, 23 Feb 2021 09:12:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3BFD4601FA;
 Tue, 23 Feb 2021 09:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614071536;
 bh=DjqJjoufcjzpUfw/QLHeD87CQ3boRTZ3pvy1/b0MsKM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IJ0Jc4epoVOQ8K3M5oRA+ZUfR1he8niW5pIP0sj0nUuYpSgHKONp8Je6AaZZa20KX
 p/t7tr+guBLAS79EvRiFvE+GTMoVdaCdGMX9/8NPIvzhaPL1gS0OLT03fQayyrmNpQ
 VanviheTjJhB54LESIeAqAHCpULfvSoVzX5oBAlOEp/jn4ufer8nMqNheXTpFEeseu
 hZCJOaLrOj5M4Q89s0cTxy2z+vR2Obj8L6q9GeLqKToG2zYOYiJ4Vt4Q2CbREeN8U1
 PEfvCfRBezMtsccwmMZhsuOcMO9bAJ9+dBJuBPEPDSudDbcRTepmWCM8Y4HWFk/hqJ
 fqN0s9LaMbo4A==
Date: Tue, 23 Feb 2021 10:12:11 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: [PATCH 2/2] mt76: mt7615: remove hdr->fw_ver check
Message-ID: <YDTG6xGgCjbinhte@lore-desk>
References: <61d40a20375f888c122ee0e186168fc2db863fc3.1614058187.git.ryder.lee@mediatek.com>
 <d0ed6b4f2dbac66ac9e31f3725bc4db5cc50f1f3.1614058187.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <d0ed6b4f2dbac66ac9e31f3725bc4db5cc50f1f3.1614058187.git.ryder.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_041218_362495_F7B67049 
X-CRM114-Status: GOOD (  14.01  )
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
Content-Type: multipart/mixed; boundary="===============2425077640792098525=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2425077640792098525==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aZDrB28CWxLVbpCm"
Content-Disposition: inline


--aZDrB28CWxLVbpCm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Only mt7615 uses v1 version. Also, some of released firmware doesn't
> have hdr->fw_ver.
>=20
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7615/mcu.c
> index 393ce09d3956..65c6ab14fe6f 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> @@ -1449,8 +1449,7 @@ static int mt7615_load_n9(struct mt7615_dev *dev, c=
onst char *name)
>  		 sizeof(dev->mt76.hw->wiphy->fw_version),
>  		 "%.10s-%.15s", hdr->fw_ver, hdr->build_date);
> =20
> -	if (!is_mt7615(&dev->mt76) &&
> -	    !strncmp(hdr->fw_ver, "2.0", sizeof(hdr->fw_ver))) {
> +	if (!is_mt7615(&dev->mt76)) {
>  		dev->fw_ver =3D MT7615_FIRMWARE_V2;
>  		dev->mcu_ops =3D &sta_update_ops;
>  	} else {

so there are some v2 fw version w/o fw_ver field, correct? Is this fw in
linux-firmware?

Regards,
Lorenzo

> --=20
> 2.18.0
>=20

--aZDrB28CWxLVbpCm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYDTG5wAKCRA6cBh0uS2t
rCRXAQCV+tBJ1+NpNuY++xxAaztdP5BxlB8GjYx6vMsm7kVxegD/VXUUKUK6RtL0
4cHkqnAcKhHrjWm4udlXVrOMM2p4VAc=
=fCnQ
-----END PGP SIGNATURE-----

--aZDrB28CWxLVbpCm--


--===============2425077640792098525==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2425077640792098525==--

