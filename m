Return-Path: <SRS0=K1YL=GT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4A31C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Jan 2021 10:13:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 405FC22522
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Jan 2021 10:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 405FC22522
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aQKT062AmVo3sK4QexTaACnQPJ0RRpxlP5SnupeIxUA=; b=kNHYoLRh6GKM6UDvPs6kxtVqI
	aa3a/nr+XTPrmNU8zKam7LQ6vE+YhW5REgo+HmtzxpH0o74FBmJbjNey6mKIeCKaLCwVGKKrm/ycB
	H/yNkA/6Tcnv+MfFZZlzrB7YJRkzs/N/owX/YT307u9i2o3zRsHqSwjvVmb/Mf9Als95UEjLcbwCD
	rcpkDj27TE3ZW64dmZu5Tzoh6xKHjaPFm6PZTYgGeK8aWByWGAXff/zKDj174z2uyjwgVMnWy2bdY
	NhKC08VFH5m4dR4//5DrtuMEZ3wz1VDxfBIv5YPZop7QsVlFqQPe7NYaOBpU3X5Jjq510cqT+MHb6
	CdnDith5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0iZc-0005vr-Hl; Sat, 16 Jan 2021 10:12:48 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0iZX-0005uv-L7; Sat, 16 Jan 2021 10:12:44 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 7E51A1F4604D
Received: by earth.universe (Postfix, from userid 1000)
 id 73B7C3C0C94; Sat, 16 Jan 2021 11:12:37 +0100 (CET)
Date: Sat, 16 Jan 2021 11:12:37 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v3 2/2] power: supply: mt6360_charger: add MT6360 charger
 support
Message-ID: <20210116101237.vktppv2ec7kvtz3v@earth.universe>
References: <1608796084-29418-1-git-send-email-gene.chen.richtek@gmail.com>
 <1608796084-29418-3-git-send-email-gene.chen.richtek@gmail.com>
 <20210106201654.lkmqorlgcecgqqkf@earth.universe>
 <CAE+NS37t-Gf7fjK0crZ+9qxWxfxm3k8hoEvwystdNP4CjM=KXQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAE+NS37t-Gf7fjK0crZ+9qxWxfxm3k8hoEvwystdNP4CjM=KXQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210116_051243_909286_3FFD369D 
X-CRM114-Status: GOOD (  26.71  )
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
Cc: Gene Chen <gene_chen@richtek.com>, devicetree <devicetree@vger.kernel.org>,
 linux-pm@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Wilma.Wu@mediatek.com,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 shufan_lee@richtek.com
Content-Type: multipart/mixed; boundary="===============4659285933318575386=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4659285933318575386==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ochbwuxpqessdn2a"
Content-Disposition: inline


--ochbwuxpqessdn2a
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jan 11, 2021 at 08:15:33PM +0800, Gene Chen wrote:
> Sebastian Reichel <sebastian.reichel@collabora.com> =E6=96=BC 2021=E5=B9=
=B41=E6=9C=887=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=884:16=E5=AF=AB=
=E9=81=93=EF=BC=9A
> > > +static int mt6360_charger_get_ichg(struct mt6360_chg_info *mci,
> > > +                                union power_supply_propval *val)
> > > +{
> > > +     int ret;
> > > +     unsigned int regval;
> > > +
> > > +     ret =3D regmap_read(mci->regmap, MT6360_PMU_CHG_CTRL7, &regval);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +     regval =3D (regval & MT6360_ICHG_MASK) >> MT6360_ICHG_SHFT;
> > > +     val->intval =3D mt6360_map_real_val(regval,
> > > +                                       MT6360_ICHG_MIN,
> > > +                                       MT6360_ICHG_MAX,
> > > +                                       MT6360_ICHG_STEP);
> > > +     return 0;
> > > +}
> >
> > It's unusual, that you do not need any scaling. Does the hardware
> > really report voltages in =C2=B5V and currents in =C2=B5A?
> >
>=20
> Should I replace MT6360_ICHG_MIN by MT6360_ICHG_MINUA?

I just noticed, that you already have uA/uV comments above the
#defines. Should be good enough. Just keep it the way it is.

[...]
=20
> > > +     last_usb_type =3D mci->psy_usb_type;
> > > +     /* Plug in */
> > > +     ret =3D regmap_read(mci->regmap, MT6360_PMU_USB_STATUS1, &usb_s=
tatus);
> > > +     if (ret < 0)
> > > +             goto out;
> > > +     usb_status &=3D MT6360_USB_STATUS_MASK;
> > > +     usb_status >>=3D MT6360_USB_STATUS_SHFT;
> > > +     switch (usb_status) {
> > > +     case MT6360_CHG_TYPE_UNDER_GOING:
> > > +             dev_info(mci->dev, "%s: under going...\n", __func__);
> > > +             goto out;
> >
> > IDK what this is supposed to tell me. Do you mean "detection in
> > progress"? Also why is this info level? I would expect either
> > debug (assuming it happens regularly and is normal) or warning
> > (assuming it should not happen).
> >
>=20
> When handling attach interrupt and cable plug out at the same
> time, HW change register status. So we don' need to handle this
> attach interrupt at this case.

So this is basically for debouncing? I suggest adding a comment:

/* Received attach IRQ followed by detach event, so nothing to do */
dev_dbg(mci->dev, "under going...\n");
goto out;

[...]

> > > +     config.dev =3D &pdev->dev;
> > > +     config.regmap =3D mci->regmap;
> > > +     mci->otg_rdev =3D devm_regulator_register(&pdev->dev, &mt6360_o=
tg_rdesc,
> > > +                                             &config);
> > > +     if (IS_ERR(mci->otg_rdev))
> > > +             return PTR_ERR(mci->otg_rdev);
> > > +
> > > +     ret =3D mt6360_sysfs_create_group(mci);
> > > +     if (ret) {
> > > +             dev_err(&pdev->dev,
> > > +                     "%s: Failed to create sysfs attrs\n", __func__);
> > > +             return ret;
> > > +     }
> >
> > Use charger_cfg.attr_grp to register custom sysfs group for
> > power-supply devices. Otherwise your code is racy (udev may not pick
> > up the sysfs attributes). Also custom sysfs attributes need to be
> > documented in Documentation/ABI/testing/sysfs-class-power-<driver>.
> >
> > Looking at the attributes you are planning to expose, I don't think they
> > are suitable for sysfs anyways. Looks more like a debug interface, which
> > should go into debugfs instead. But it's hard to tell without any docum=
entation
> > being provided :)
>=20
> ACK, I will change to charger_cfg.attr_grp.
> I assumed the charger algorithm thread is in user space, and take
> control by sysfs node from charger device, like bq24190.c.
> Should I change to debugfs?

It's hard to tell without knowing more about the attributes
your are trying to expose. In debugfs we have relaxed ABI rules,
so it's easier to adopt naming e.t.c. later.

-- Sebastian

--ochbwuxpqessdn2a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmACvAsACgkQ2O7X88g7
+pp1TBAApwZbiBR41pqeQofuNzK3+gUsuqMvf/I6MR24aWvXAqxlkuihN4oHY4uk
VqlPBlH2+KFEOkn0JedYY+e19KV+9vmI/2ph+KTd3FkS3WToUWMIoBH3yuHqoeZ2
ZkNIwXX3H/CNYw1nXYky4sdHWKn2vYdN5RFeJ4gAzMvv6JI/ziaKemcLPL1n7jE1
jylQxYKVhA4ABFpjBfUk3eXv7cytmT4H64UPSt8cppPuGIfaz6ZPYwsRZ9PCMdy2
pWg3VGKhc7v+jgXymTe8OlhTA0xaaOuolfFHdquJrNRGUkF3bt94AECtB95IWXQH
s+dnHL7wbi79JSuK9Wl03u5e3dGOlwr5j/U2J0JHpS9uGMpkyTsQbB+BPh8MDSql
CCextokIZqIwvWWic+LXH9Oc5lSJud8ZXLaqy9fDoc8mR2/bFF3k9acEwo9GDBMq
rI//a/D7YMKs2h1fecm574yCTxchgSN5sJhHCa8tU/oHXRIg382pp/gF+uCoSQW7
07/lDzOes62QcRQf+gSLo0BjlJ5hGfRjFdQcVFlaGEw4HAAvhtSLNl+BjSDkQLD5
kFof8kWnX+CrczibZLyfuzucXbCiN7KHjrltaYwD1MvA1n0lRUT4S3xfc8SS3+YV
NubNmRQNmiOiOv0JA7ieE6KTma6F2AQI0ggnDQQUH9+tK5OwASw=
=r4DG
-----END PGP SIGNATURE-----

--ochbwuxpqessdn2a--


--===============4659285933318575386==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4659285933318575386==--

