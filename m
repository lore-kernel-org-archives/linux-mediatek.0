Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781DAC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Dec 2021 16:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dwc+w+h415s2++ArMD8CeMtQnmtfIEgxRloNU6i6TkA=; b=bvEQUvceaj2z+cXmZo1SqR/SVR
	q2P9xNhqkEVDTcHVnLBxYUjrdpKvakQCv6TTwjAdkhBc5bQ2CddGZlvV5gpiO2/dSCl2eAANKNJGH
	iCJich0RN/DMU+fK//Lp71fd8TFjRgv1TUYEpDxDxMlDNoMu6ZGEBA3g/uDiNUjn0hVeUpe72ap3i
	nLNwscVtz/HJ4pdIcYIGz8kdrGqvXvNMwDfJRfIfsbf2/fH35Ew2pWjVRqpZZ3JvF/Z/1yNZELsvw
	qKbEvPo+bQW85ZtCsXgT2tc40QfH6ndukc2c+P9s4cBH9I/+FaLCwwE9R/VsV571G6EFFMWIODKYW
	CKSXsL6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mw5Rs-005GFa-To; Sat, 11 Dec 2021 16:42:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mw5Rq-005GEw-0W
 for linux-mediatek@lists.infradead.org; Sat, 11 Dec 2021 16:42:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639240921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9AJOwtwYeH9t9ymJ9bmplmF1bz+uhU00RQB/NJ9JhpY=;
 b=L2udctmliDJiIhv7I48jlFY7Pyg/KezbKvalr9IDLETBSx8Xq3nkPyz2ACNKP72jIpLuZ1
 vQ85V8VuNKzyxtNlt3+WKKj3K74pAWhW7PfTAAI9paM9HzAxO8vPMjX5eow7gJqAMvu828
 PoR8IBX6w4ovCYdkvP+lJ3cT3R4zbqI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-69-vLovUC-rOiueU7cG1XAHYA-1; Sat, 11 Dec 2021 11:42:00 -0500
X-MC-Unique: vLovUC-rOiueU7cG1XAHYA-1
Received: by mail-ed1-f69.google.com with SMTP id
 q17-20020aa7da91000000b003e7c0641b9cso10649481eds.12
 for <linux-mediatek@lists.infradead.org>; Sat, 11 Dec 2021 08:41:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZKcJEEF5DlHrA1OxBLWQKY9VII5AxIf4/hVpU6/vKcI=;
 b=VneeGoYS4B98P43WvPQ+HvZoU/iguHebhIDc/VGkQmFe+goIBbd9HhQan9vYi9uujp
 LvpkqBD4bFCXI9AztTQrd2hS55RMLgpTgDmJgHkWMBTth3mc5TN5yxd2AFYh6euYP1n2
 6A9mWCuVCSYytr8uPJe3Cqggq1HYumUA5HH/cRAS/ESGIbFnWk7F1GIF/LqbApXUtDoG
 fyNPEAQUkeApa1iCbDNf4zWp1qeNyUrcWUErN2A1GZiUtAa0ULX12wYOeT6Pf0KrnmQ3
 smgq7/HQOct8v71KC8nSyMYzCmPXN8hwT6hKuH2xko8C6+Guj3K8VJiEzoXfpIsABzss
 XypA==
X-Gm-Message-State: AOAM533JkWabTX0w/AJZx6xRopeZOC5vBPwUefrGcVPLeqtIT9E+zL8R
 N3XXkMQRdMOLu0dlKrGxWD1ORbHBApMPTJrlhNqqct7BR6E3nJqUJyBzu+1YugsLmUvOcQgJX61
 wvgSrs4d1VpOjRlquUCpHlYwCHCGVoW6x
X-Received: by 2002:aa7:d0d1:: with SMTP id u17mr47559170edo.135.1639240918787; 
 Sat, 11 Dec 2021 08:41:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzWWoFATl8W7TYrbrSVBSd+HyXsl5FjgxcjiRTXWWq8c3ED7ymnWTZJAHXG0GHRaf2JgeM6Vw==
X-Received: by 2002:aa7:d0d1:: with SMTP id u17mr47559115edo.135.1639240918387; 
 Sat, 11 Dec 2021 08:41:58 -0800 (PST)
Received: from localhost (net-37-182-17-175.cust.vodafonedsl.it.
 [37.182.17.175])
 by smtp.gmail.com with ESMTPSA id 29sm3346980edw.42.2021.12.11.08.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 08:41:57 -0800 (PST)
Date: Sat, 11 Dec 2021 17:41:55 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, Soul.Huang@mediatek.com, YN.Chen@mediatek.com,
 Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com,
 Mark-YW.Chen@mediatek.com, Deren.Wu@mediatek.com,
 km.lin@mediatek.com, jenhao.yang@mediatek.com,
 robin.chiu@mediatek.com, Eddie.Chen@mediatek.com,
 ch.yeh@mediatek.com, posh.sun@mediatek.com, ted.huang@mediatek.com,
 Eric.Liang@mediatek.com, Stella.Chang@mediatek.com,
 Tom.Chou@mediatek.com, steve.lee@mediatek.com, jsiuda@google.com,
 frankgor@google.com, jemele@google.com, abhishekpandit@google.com,
 shawnku@google.com, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] mt76: mt7921s: make pm->suspended usage consistent
Message-ID: <YbTU08hzeTSJPIsp@lore-desk>
References: <87100999ebfd6e205e655a6355a3990ff89d3945.1639239996.git.objelf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <87100999ebfd6e205e655a6355a3990ff89d3945.1639239996.git.objelf@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211211_084210_181556_F1549082 
X-CRM114-Status: GOOD (  16.20  )
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
Content-Type: multipart/mixed; boundary="===============3669580302043502162=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============3669580302043502162==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="P+2aLphRvD2BcDlm"
Content-Disposition: inline

--P+2aLphRvD2BcDlm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> Update pm->suspended usage to be consistent with mt7921e driver.
>=20
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/sdio.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/sdio.c
> index 84be229a899d..44ee9369f6bf 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
> @@ -278,7 +278,6 @@ static int mt7921s_resume(struct device *__dev)
>  =09struct mt76_dev *mdev =3D &dev->mt76;
>  =09int err;
> =20
> -=09pm->suspended =3D false;
>  =09clear_bit(MT76_STATE_SUSPEND, &mdev->phy.state);
> =20
>  =09err =3D mt7921_mcu_drv_pmctrl(dev);
> @@ -294,7 +293,11 @@ static int mt7921s_resume(struct device *__dev)
>  =09if (!pm->ds_enable)
>  =09=09mt76_connac_mcu_set_deep_sleep(mdev, false);
> =20
> -=09return mt76_connac_mcu_set_hif_suspend(mdev, false);
> +=09err =3D mt76_connac_mcu_set_hif_suspend(mdev, false);

should we check return value here? Something like:

=09if (err)
=09=09return err;
=09
=09pm->suspended =3D false;
=09return 0;

Or, is the chip up even if mt76_connac_mcu_set_hif_suspend() fails?

> +
> +=09pm->suspended =3D false;
> +
> +=09return err;
>  }
> =20
>  static const struct dev_pm_ops mt7921s_pm_ops =3D {
> --=20
> 2.25.1
>=20

--P+2aLphRvD2BcDlm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYbTU0wAKCRA6cBh0uS2t
rN+1AP0Wj4z3qiVUN7SCUJZY++EBa19nPihv1Eaqx50DPqa3RAD+NiufVMTBDqQZ
bSQajtQ8DR38y79NVkEDzIZyRWMACQk=
=dFa2
-----END PGP SIGNATURE-----

--P+2aLphRvD2BcDlm--



--===============3669580302043502162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3669580302043502162==--


