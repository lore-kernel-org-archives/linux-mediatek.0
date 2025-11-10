Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1120CCF9E3
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Nov 2025 09:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VSfkaAkbqob94VjtZuefTP3rzVGvzkZ2PyLqZ5TTMEA=; b=Tjt5cWBaWWe67kJKnyXMfTgPF7
	VUN9hlELrHWZ+cLByd7oJ1xPZb3vvtSfAniz9tDU35eMHz8qmW2M9KnRoNbrLBxa7lW23b3mJ2TlT
	vi05HplTbMAWd8PDzMK28feOuGoLfcZSVTv52Ny10X08B2ikS48oQOWalMGvatGM/HIDK8IKd5XK4
	+UABWrM/nWWbS960VBMBCvx8xK449eTOSnM7kgLFiuu7EIbbDSjrMh57pk4fpJwCXGsZUFQNlyXiL
	BvCWb0lLJU7hfvX3yzxJN5vvNKqrvjyWuSNwYnj0dkWKNs1ILORq/dpZOA5slDZEauh4yZ+ziEXjG
	dRMe9xHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIO87-000000055P4-1l0Y;
	Mon, 10 Nov 2025 09:24:07 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIO84-000000055OP-0GAA;
	Mon, 10 Nov 2025 09:24:05 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1762766633; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VjrlaTXRT1DTspIRhNm8LqC+UeVeIz39ALeceKY8V7A5/ao3cVaWPJGQCtUJkoopAY3oEk19DUBQ5ibEOHjsNshLnbMXcJb7jHIVgj27JBHdSNW83mWJAtEyjqKUkU+70aUVA5OqDkOgeToKqF1ezdim2D85BEoTmgeE8g+8iMw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1762766633; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VSfkaAkbqob94VjtZuefTP3rzVGvzkZ2PyLqZ5TTMEA=; 
	b=XLMEUim6kByafUhy0mTCMpYnie0fvJC94Rlkmr9OvZoBM/BvE4A8qAyaZJ28JgXr5CMUUniOkUWEgT5jJKcEHivS6qOX4MtH7q2lmgiy0e6eGeOEQjX7p1tA7pKaMacSQhpY/rAvCpENb6KBfOD+Fn0GJelXd6Ekc/lXY/RIzCo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1762766633;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=VSfkaAkbqob94VjtZuefTP3rzVGvzkZ2PyLqZ5TTMEA=;
	b=M0zedMx4CrQIdjkZsoQwJ8KticXzTN1x4GvoNv08cmSC0hYxvMv9qSGvBmrKDbyw
	i03mA/4eYRl4HLbD6swqiUagf75i5IfHFPr9wXgIDK/4mT9WJ1C3K1oenQu1UUNzxrQ
	/62gPcbfd3SJ2sYn/ob1aR6YI0N5+KdulfvauR6Y=
Received: by mx.zohomail.com with SMTPS id 1762766632129188.4290479822298;
	Mon, 10 Nov 2025 01:23:52 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Peter Wang =?UTF-8?B?KOeOi+S/oeWPiyk=?= <peter.wang@mediatek.com>,
 Chunfeng Yun =?UTF-8?B?KOS6keaYpeWzsCk=?= <Chunfeng.Yun@mediatek.com>,
 "kishon@kernel.org" <kishon@kernel.org>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "chu.stanley@gmail.com" <chu.stanley@gmail.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "robh@kernel.org" <robh@kernel.org>,
 "James.Bottomley@HansenPartnership.com"
 <James.Bottomley@hansenpartnership.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chaotian Jing =?UTF-8?B?KOS6leacneWkqSk=?= <Chaotian.Jing@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>
Subject: Re: [PATCH v3 10/24] scsi: ufs: mediatek: Rework probe function
Date: Mon, 10 Nov 2025 10:23:44 +0100
Message-ID: <5025239.GXAFRqVoOG@workhorse>
In-Reply-To: <90a10fba2e41db4df4c28a72d182c5f0df8c016d.camel@mediatek.com>
References: <20251023-mt8196-ufs-v3-0-0f04b4a795ff@collabora.com>
 <20251023-mt8196-ufs-v3-10-0f04b4a795ff@collabora.com>
 <90a10fba2e41db4df4c28a72d182c5f0df8c016d.camel@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_012404_850965_E0B30121 
X-CRM114-Status: GOOD (  28.56  )
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

On Wednesday, 5 November 2025 07:28:39 Central European Standard Time Chaot=
ian Jing (=E4=BA=95=E6=9C=9D=E5=A4=A9) wrote:
> On Thu, 2025-10-23 at 21:49 +0200, Nicolas Frattaroli wrote:
> > Remove the ti,syscon-reset cruft.
> >=20
> > Make PHY mandatory. All the compatibles supported by the binding make
> > it
> > mandatory.
> >=20
> why make the PHY mandatory ? note that not all of MediaTek SoCs have
> the PHY node.

Why don't they have the PHY node? Does the hardware not have a PHY?

The mainline binding makes the phys property mandatory. If you have
downstream device trees that don't have the PHY node properly
described in the DT even though the PHY exists, then that is not a
thing the mainline kernel should support.

If the hardware really doesn't have a PHY, which would surprise me,
then the binding should properly document this, so that the DT checks
pass without warnings.

> > Entertain this driver's insistence on playing with the PHY's RPM, but
> > at
> > least fix the part where it doesn't increase the reference count,
> > which
> > would lead to use-after-free.
> >=20
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  drivers/ufs/host/ufs-mediatek.c | 87 +++++++++++++++--------------
> > ------------
> >  1 file changed, 32 insertions(+), 55 deletions(-)
> >=20
> > diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-
> > mediatek.c
> > index 9c0ac72d6e43..889a1d58a041 100644
> > --- a/drivers/ufs/host/ufs-mediatek.c
> > +++ b/drivers/ufs/host/ufs-mediatek.c
> > @@ -2353,74 +2353,49 @@ MODULE_DEVICE_TABLE(of, ufs_mtk_of_match);
> >   */
> >  static int ufs_mtk_probe(struct platform_device *pdev)
> >  {
> > -	int err;
> > -	struct device *dev =3D &pdev->dev, *phy_dev =3D NULL;
> > -	struct device_node *reset_node, *phy_node =3D NULL;
> > -	struct platform_device *reset_pdev, *phy_pdev =3D NULL;
> > -	struct device_link *link;
> > -	struct ufs_hba *hba;
> > +	struct platform_device *phy_pdev;
> > +	struct device *dev =3D &pdev->dev;
> > +	struct device_node *phy_node;
> >  	struct ufs_mtk_host *host;
> > +	struct device *phy_dev;
> > +	struct ufs_hba *hba;
> > +	int err;
> > =20
> > -	reset_node =3D of_find_compatible_node(NULL, NULL,
> > -					     "ti,syscon-reset");
> > -	if (!reset_node) {
> > -		dev_notice(dev, "find ti,syscon-reset fail\n");
> > -		goto skip_reset;
> > -	}
> > -	reset_pdev =3D of_find_device_by_node(reset_node);
> > -	if (!reset_pdev) {
> > -		dev_notice(dev, "find reset_pdev fail\n");
> > -		goto skip_reset;
> > -	}
> > -	link =3D device_link_add(dev, &reset_pdev->dev,
> > -		DL_FLAG_AUTOPROBE_CONSUMER);
> > -	put_device(&reset_pdev->dev);
> > -	if (!link) {
> > -		dev_notice(dev, "add reset device_link fail\n");
> > -		goto skip_reset;
> > -	}
> > -	/* supplier is not probed */
> > -	if (link->status =3D=3D DL_STATE_DORMANT) {
> > -		err =3D -EPROBE_DEFER;
> > -		goto out;
> > -	}
> > -
> > -skip_reset:
> >  	/* find phy node */
> >  	phy_node =3D of_parse_phandle(dev->of_node, "phys", 0);
> > +	if (!phy_node)
> > +		return dev_err_probe(dev, -ENOENT, "No PHY node
> > found\n");
> > =20
> > -	if (phy_node) {
> > -		phy_pdev =3D of_find_device_by_node(phy_node);
> > -		if (!phy_pdev)
> > -			goto skip_phy;
> > -		phy_dev =3D &phy_pdev->dev;
> > +	phy_pdev =3D of_find_device_by_node(phy_node);
> > +	of_node_put(phy_node);
> > +	if (!phy_pdev)
> > +		return dev_err_probe(dev, -ENODEV, "No PHY device
> > found\n");
> > =20
> > -		pm_runtime_set_active(phy_dev);
> > -		pm_runtime_enable(phy_dev);
> > -		pm_runtime_get_sync(phy_dev);
> > +	phy_dev =3D &phy_pdev->dev;
> > =20
> > -		put_device(phy_dev);
> > -		dev_info(dev, "phys node found\n");
> > -	} else {
> > -		dev_notice(dev, "phys node not found\n");
> > +	err =3D pm_runtime_set_active(phy_dev);
> > +	if (err) {
> > +		dev_err_probe(dev, err, "Failed to activate PHY
> > RPM\n");
> > +		goto err_put_phy;
> > +	}
> > +	pm_runtime_enable(phy_dev);
> > +	err =3D pm_runtime_get_sync(phy_dev);
> > +	if (err) {
> > +		dev_err_probe(dev, err, "Failed to power on PHY\n");
> > +		goto err_put_phy;
> >  	}
> > =20
> > -skip_phy:
> >  	/* perform generic probe */
> >  	err =3D ufshcd_pltfrm_init(pdev, &ufs_hba_mtk_vops);
> >  	if (err) {
> > -		dev_err(dev, "probe failed %d\n", err);
> > -		goto out;
> > +		dev_err_probe(dev, err, "Generic platform probe
> > failed\n");
> > +		goto err_put_phy;
> >  	}
> > =20
> >  	hba =3D platform_get_drvdata(pdev);
> > -	if (!hba)
> > -		goto out;
> > =20
> > -	if (phy_node && phy_dev) {
> > -		host =3D ufshcd_get_variant(hba);
> > -		host->phy_dev =3D phy_dev;
> > -	}
> > +	host =3D ufshcd_get_variant(hba);
> > +	host->phy_dev =3D phy_dev;
> > =20
> >  	/*
> >  	 * Because the default power setting of VSx (the upper layer of
> > @@ -2429,9 +2404,11 @@ static int ufs_mtk_probe(struct
> > platform_device *pdev)
> >  	 */
> >  	ufs_mtk_dev_vreg_set_lpm(hba, false);
> > =20
> > -out:
> > -	of_node_put(phy_node);
> > -	of_node_put(reset_node);
> > +	return 0;
> > +
> > +err_put_phy:
> > +	put_device(phy_dev);
> > +
> >  	return err;
> >  }
> > =20
> >=20
>=20





