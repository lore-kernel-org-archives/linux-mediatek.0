Return-Path: <SRS0=Rw5Z=YR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B5DECA9EAF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2019 08:53:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19E6A20684
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2019 08:53:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u+gN4S1L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19E6A20684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CxanZjvGbpg/wUMgP6tiBE0UW62uobTjNFqNIiB+xsA=; b=u+gN4S1Lpe4zNxKaCw1TJsFMq
	U3JHfm614+FZDBkR0ZQyfjkZoRsMTSaHy+EKACJ9WCaikUyj3ZS6hxEFNX6upBE3MyDO9tSJeCFJX
	FwG/09MpZ6Kt7Zl92BQlnEnfQpmTyxGoAyvO1/3fBfiVUY7iOzywUeUFzo7SniTwGouQVCV/ZmkZI
	kb6NTqeMIl2ElPqyASmpG7V0VW6uM9xaKn0kiewNrIU0jy9hDXE1sK7bCZqjMdcswZ9UGm3bu7sZz
	dlvPR4cfQOpx/4KRzBznvxXCdpROuqVzPBy1sqlLG1fMLyvY+2inj7WSo1tZ657k0+C+x4d9Zy6iv
	uiUmJ5u2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNYrS-0000Yr-As; Thu, 24 Oct 2019 08:52:50 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNYqt-0008Mj-Ha; Thu, 24 Oct 2019 08:52:17 +0000
Received: from localhost (x4e374e90.dyn.telefonica.de [78.55.78.144])
 by pokefinder.org (Postfix) with ESMTPSA id 283C22C011D;
 Thu, 24 Oct 2019 10:52:14 +0200 (CEST)
Date: Thu, 24 Oct 2019 10:52:13 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4] mfd: mt6360: add pmic mt6360 driver
Message-ID: <20191024085212.GB2850@kunai>
References: <1571749359-15752-1-git-send-email-gene.chen.richtek@gmail.com>
 <20191024082623.GK15843@dell>
MIME-Version: 1.0
In-Reply-To: <20191024082623.GK15843@dell>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191024_015215_739685_FFA4A047 
X-CRM114-Status: GOOD (  10.81  )
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
Cc: gene_chen@richtek.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 Gene Chen <gene.chen.richtek@gmail.com>, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Type: multipart/mixed; boundary="===============7825415814246768850=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7825415814246768850==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s/l3CgOIzMHHjg/5"
Content-Disposition: inline


--s/l3CgOIzMHHjg/5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> > +	for (i = 0; i < MT6360_SLAVE_MAX; i++) {
> > +		if (mt6360_slave_addr[i] == client->addr) {
> > +			mpd->i2c[i] = client;
> > +			continue;
> > +		}

Not knowing the DT bindings, I wonder if we can let the for-loop start
at 1 and do beforehand:
	mpd->i2c[0] = client;

That would save the above if block. However, this is a minor nit.


> > +		mpd->i2c[i] = i2c_new_dummy(client->adapter,
> > +					    mt6360_slave_addr[i]);

Please use the new API i2c_new_dummy_device here...

> > +		if (!mpd->i2c[i]) {

... and IS_ERR() here.

> > +			dev_err(&client->dev, "new i2c dev [%d] fail\n", i);
> > +			ret = -ENODEV;

Then you can also return a proper errno value.

You can probably also use devm_i2c_new_dummy_device()...


> > +			goto out;
> > +		}
> > +		i2c_set_clientdata(mpd->i2c[i], mpd);
> > +	}
> > +
> > +	ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_AUTO,
> > +				   mt6360_devs, ARRAY_SIZE(mt6360_devs), NULL,
> > +				   0, regmap_irq_get_domain(mpd->irq_data));
> > +	if (ret < 0) {
> > +		dev_err(&client->dev, "mfd add cells fail\n");
> > +		goto out;
> > +	}
> > +
> > +	return 0;
> > +out:
> > +	while (--i >= 0) {
> > +		if (mpd->i2c[i]->addr == client->addr)
> > +			continue;
> > +		i2c_unregister_device(mpd->i2c[i]);

... to save this ...

> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static int mt6360_pmu_remove(struct i2c_client *client)
> > +{
> > +	struct mt6360_pmu_data *mpd = i2c_get_clientdata(client);
> > +	int i;
> > +
> > +	for (i = 0; i < MT6360_SLAVE_MAX; i++) {
> > +		if (mpd->i2c[i]->addr == client->addr)
> > +			continue;
> > +		i2c_unregister_device(mpd->i2c[i]);
> > +	}

... and this. But please double check.


--s/l3CgOIzMHHjg/5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2xZjwACgkQFA3kzBSg
KbbRSQ/+KeAeLPnHYJBgZYJS5bMotybmbaM9VfBSaGUp5IofDuEyobHAph3O4y49
+qLo5KN/PusE8qnTUfTxs5+7ZC4vWwlwkCMOSK/iX74H5jxXlu3aM3hitvMtWqCD
Sq3eqHRtMqw9Q+Qm5LEEIUdhcmSk7ExoDoVrShZImg3ZjqcGTRVB8+JOfI3GrLfl
dEfyRwn5u/epXucr39dP3NCZTgSCCQOIl3bJGLqRn4jDM/K3WaZu4/SwEYTOQy/d
y8MzBZjKJY3xDIl3WIPOVAcw1fz3wrr/Ff3sfGczPR+jEQAac6E5hGDmsdsbvG4G
CqNYEGb9ey96S1wcrYeBnZjMu5lX672L5rNSSXnEp47UlU3zynovqqYDvh8tEcsB
r1nWY54EUzCKm5KNWRGhsEj99O4Ellz0+7ocpOyqeP+7oPviuXee3L1pv0MtHQcc
Cs1IcT07FmGSSOwyUl+f9neOmNDx2RyK4OCGZn3G3dqE5ncuQUbafQR0LnYjCodB
ui3gQw7SnSGAnusmVsJQPaaPHzJ9o39EHO6TzFKXgWMU6CLprEdRmkGIhLZ6YkcD
IgpgVvN7YSgHqulUAAjnjueJ4qP8jdEIqZx6BpnrWH0DthprMWBNPjThEdHO5pUi
2kXCG5sCZbmg9j/H0apIMNXZAgLJggvRjwt5nz9ftT/bL1ZQuas=
=yXdj
-----END PGP SIGNATURE-----

--s/l3CgOIzMHHjg/5--


--===============7825415814246768850==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7825415814246768850==--

