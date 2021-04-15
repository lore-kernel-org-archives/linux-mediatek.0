Return-Path: <SRS0=QSA9=JM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8DEDC43460
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 13:54:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C2D0611AD
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 13:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C2D0611AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XWbhJSyELu9evJFb8wX2/FONi4xpWNDIMVxFRE2DiCk=; b=ikRauNxXzaUMm63ZytxpeSdcD
	fqk7kc9hdXQkncaL/YkqU9uTzcWHzURg2eLihYEw+kEImjNZoTSix4Mztwkwy/fxO2oeFioNUE9fw
	F7DUL9aBFtHKZdElc+P6lnO+maxxavrgg0eLHjvbEmd5K/vHpLfgFM6nwFrJYaTCj++OEzX8rYd5E
	uhTIN1gVu2/kE1x6kdzrRXTYSFuSEIQzInBJhCDY4cMfyS2DuxqAmIPRKSl87U19NlXTfOTyepZc2
	HZuy8n7fQddmXDa3T1tLNWEW4LtFJ41ZSOuH3kHPBBmPhNOAgVe1BAPCdVqc9PLt/49bwVDgkXy7V
	aErTNB+vQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lX2RF-00GLcQ-Df; Thu, 15 Apr 2021 13:53:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX2RC-00GLbl-BK
 for linux-mediatek@desiato.infradead.org; Thu, 15 Apr 2021 13:53:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Jq6b4xt8fJ6hJHmt9AM/9YbkCyavs8GB7QYeo7vPUuk=; b=UuNQwik1PhiJw+KtMDoVFts0U0
 zvEUPATIyBwYk8rMrFjCetUpkRcco7mdv3F0dnoOhf6s1zkg2j5kQbozJOCENcHFdjwqnO92z3BWT
 lMHMe4sTcFh2mVNmfpXYhoSt8azJPbaKwbPCii6XOzXI10ir7Gm6+4IW9mWYZYKQLs5wiRge4zmH2
 LYQXQvB62TouQ1Oe0Z/GE9U4aRw7KwQ1s5/krfo6SV3zAVsXPscPsjnclEa/08kdY97vp4v6cbm2W
 2BdtyRsh2T8pyi8F5p2geRVX7fqihIc7pmOUwlLoKGfTJbCt879cxNttXay3+G4sh1Rr2HSzJoqYW
 hEMw6b/Q==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX2R9-008ctB-HZ
 for linux-mediatek@lists.infradead.org; Thu, 15 Apr 2021 13:53:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 585A6613C0;
 Thu, 15 Apr 2021 13:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618494817;
 bh=HxlQgr9ai/dksl/E9OkOo6I+ld73OP7laqDFtv+3bzo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pqq4rwS/Q9W7u9oFfX2FCCgbdSsC1dABmPRdQPeix8G/JcWbg2BtQ0EPlmxFm/q3u
 WdGUIovFOPFTrgH7ukqN84khGDwursbBeyfOm9R25PFIx8DDzlnldXG4SMgX4z0q3m
 qZyQNT+Hoy0NX/63zC52aX+0XoK+IT6T+8AdWTbZ8zabS9nko0MWerbFNqbtbB9aNq
 HeOSekgoBV670nSAoGQ+bdT1CvJVC3G6WyySfU/RAiZse9KSU5OUTGG0pNUPu1H4tO
 fvYZSzV8x1FyPI212pWqiFTK5UO24lI0xHukK+ZLZ6TcOutB4B8allJN9fhzKyA6O7
 ixAvltInr1j4A==
Date: Thu, 15 Apr 2021 15:53:33 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, lorenzo.bianconi@redhat.com, Soul.Huang@mediatek.com,
 YN.Chen@mediatek.com, robin.chiu@mediatek.com, ch.yeh@mediatek.com,
 posh.sun@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] mt76: mt7921: add debugfs knob for performing wifi
 reset
Message-ID: <YHhFXcgsfziGlCag@lore-desk>
References: <1618494105-5462-1-git-send-email-sean.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1618494105-5462-1-git-send-email-sean.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_065339_624498_F60E01C2 
X-CRM114-Status: GOOD (  14.42  )
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
Content-Type: multipart/mixed; boundary="===============8269540045952591942=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8269540045952591942==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8levkRUDXuehoOxN"
Content-Disposition: inline


--8levkRUDXuehoOxN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> Introduce chip_reset knob in mt7921 debugfs to export a way to users
> able to trigger wifi reset.
>=20
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c b/driver=
s/net/wireless/mediatek/mt76/mt7921/debugfs.c
> index 024524173115..1342a0b645e3 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
> @@ -302,6 +302,16 @@ static int mt7921_config(void *data, u64 val)
> =20
>  DEFINE_DEBUGFS_ATTRIBUTE(fops_config, NULL, mt7921_config, "%lld\n");
> =20
> +static int mt7921_chip_reset(void *data, u64 val)
> +{
> +	struct mt7921_dev *dev =3D data;
> +
> +	mt7921_reset(&dev->mt76);
> +
> +	return 0;
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(fops_reset, NULL, mt7921_chip_reset, "%lld\n");

can we use chip_config for this?

Regards,
Lorenzo

> +
>  int mt7921_init_debugfs(struct mt7921_dev *dev)
>  {
>  	struct dentry *dir;
> @@ -322,6 +332,7 @@ int mt7921_init_debugfs(struct mt7921_dev *dev)
>  	debugfs_create_file("idle-timeout", 0600, dir, dev,
>  			    &fops_pm_idle_timeout);
>  	debugfs_create_file("chip_config", 0600, dir, dev, &fops_config);
> +	debugfs_create_file("chip_reset", 0600, dir, dev, &fops_reset);
> =20
>  	return 0;
>  }
> --=20
> 2.25.1
>=20

--8levkRUDXuehoOxN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYHhFWgAKCRA6cBh0uS2t
rOFtAP9Q+e9TcNmnQkS6+BttcdOc2zkUUk1V1D4v7/zVgEgrJQEA1E30Gz9q/7kh
PJ3WyHJ5SoC+j5r8aehl6bfbWuNFqAg=
=0MF3
-----END PGP SIGNATURE-----

--8levkRUDXuehoOxN--


--===============8269540045952591942==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8269540045952591942==--

