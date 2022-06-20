Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10F1C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jun 2022 18:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lGVk7QZLpP0Lr3q+4qWt9R+fHzNccJJ8txr43zBHWGo=; b=a/LjYTj5wYg1NiwrXgrJ5R8tTl
	RCXTN/0l2A/L3eBHkyJYr06QdE5YKXC/PCvQycMHtFL1C9w01xotmRVyKXEF1UXQ46Mlp7bL2yRZu
	HOGUgODEn6vG9+wYSkTEh5QWuHkLKHELikZb+KVVUaB68eR0akV8nV/ZkPY3CJf9qNeAMxZl1ASyh
	t4azeOYlGjQ3/gwMc5qyF+G3+lWkh6wexckr1MYhIp215wZo2T+3Ou5HjA5971GXGq339kpH4iwGe
	EQ5qZsLq1JW9RdM8EoXcgMT3MQ3NUmCV6U5vWcRsmVn1fl3XM3AxATQFT4huhZafeb7fd1H1WXPho
	PrIvNl7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3MF9-001sDy-GN; Mon, 20 Jun 2022 18:35:23 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3MEx-001sB8-Dc; Mon, 20 Jun 2022 18:35:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 92183B815AA;
	Mon, 20 Jun 2022 18:35:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47C0EC3411B;
	Mon, 20 Jun 2022 18:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655750108;
	bh=3mSgNT10b4IjzPgWigmKhCRzl+Ti+EYL/1+uQFwMp0Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YvLC0E9QtvNI2VOwXPiBN5gXjqLr5rXxoHEMOQ5sUWXijZHmHqlZZoWVN+2mGVmI5
	 EP/BOzf3vOI83Nawe3EQM58nzxZAe6m0FgdZ/DpWODRGH6Cl5/dPjtx+o4oAnzLIe+
	 vLUBc4kyvZpN9kK3lF4+sU0CqlKEfutvlSARgTIOtq+LXAz47jazByohylHteahUL9
	 GvRGmi+FKujuIbhBWASw1vLw0pkSfwU5G6iFYlht1leiC50pXx4jiMfj9TBX8+yLXS
	 aAQGL6ZkuYyzt59Xj0R0hgJ8s3YfDEkKxYFZGovzaJGKdKQKHWXfeSG+Uq/2fOKYAW
	 v/wxDubWF0gSA==
Date: Mon, 20 Jun 2022 19:35:00 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: lars@metafoo.de, matthias.bgg@gmail.com, lee.jones@linaro.org, Daniel
 Thompson <daniel.thompson@linaro.org>, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
 szunichen@gmail.com, ChiaEn Wu <chiaen_wu@richtek.com>
Subject: Re: [PATCH v2 07/15] Documentation: ABI: testing: mt6370: Add ADC
 sysfs guideline
Message-ID: <20220620193500.145f05b9@jic23-huawei>
In-Reply-To: <CABtFH5+R761Tyd4yaWg-foSC4K=_aeYiVaTf37KvVH1Z4z9Jhw@mail.gmail.com>
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
	<20220613111146.25221-8-peterwu.pub@gmail.com>
	<20220618164820.2eeb8ae8@jic23-huawei>
	<CABtFH5+R761Tyd4yaWg-foSC4K=_aeYiVaTf37KvVH1Z4z9Jhw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_113511_784864_2034E3B5 
X-CRM114-Status: GOOD (  28.36  )
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

On Mon, 20 Jun 2022 14:00:43 +0800
ChiaEn Wu <peterwu.pub@gmail.com> wrote:

> Hi Jonathan,
>=20
> Thanks for your helpful comments, and I have some questions want to
> ask you below.
>=20
> Jonathan Cameron <jic23@kernel.org> =E6=96=BC 2022=E5=B9=B46=E6=9C=8818=
=E6=97=A5 =E9=80=B1=E5=85=AD =E6=99=9A=E4=B8=8A11:39=E5=AF=AB=E9=81=93=EF=
=BC=9A
> >
> > On Mon, 13 Jun 2022 19:11:38 +0800
> > ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> > =20
> > > From: ChiaEn Wu <chiaen_wu@richtek.com>
> > >
> > > Add ABI documentation for mt6370 non-standard ADC sysfs interfaces.
> > >
> > > Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> > > ---
> > >  .../ABI/testing/sysfs-bus-iio-adc-mt6370      | 36 +++++++++++++++++=
++
> > >  1 file changed, 36 insertions(+)
> > >  create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-adc-mt6370
> > >
> > > diff --git a/Documentation/ABI/testing/sysfs-bus-iio-adc-mt6370 b/Doc=
umentation/ABI/testing/sysfs-bus-iio-adc-mt6370
> > > new file mode 100644
> > > index 000000000000..039b3381176a
> > > --- /dev/null
> > > +++ b/Documentation/ABI/testing/sysfs-bus-iio-adc-mt6370
> > > @@ -0,0 +1,36 @@
> > > +What:                /sys/bus/iio/devices/iio:deviceX/in_voltage0_ra=
w =20
> >
> > Unfortunately the kernel documentation build scripts do no support dupl=
icating
> > standard ABI for particular devices so as to provide more information.
> > Hence you can't have anything in this file.
> > =20
>=20
> I want to confirm with you again,
> because my ABI file duplicates with standard sysfs-bus-iio (voltage,
> current, and temperature channels),
> Should I just remove this ABI file and modify the code of mt6370-adc
> to meet your expectations??

yes.

>=20
> > =20
> > > +KernelVersion:       5.18
> > > +Contact:     chiaen_wu@richtek.com
> > > +Description:
> > > +             Indicated MT6370 VBUS ADC with lower accuracy(+-75mA) =
=20
> > Curious though, voltage with a mA accuracy range? =20
>=20
> Yes, this description is based on the data sheet.

Weird :)=20

>=20
> > This scale should be presented directly to userspace anyway so no need
> > for this doc.
> > =20
> > > +             higher measure range(1~22V)
> > > +             Calculating with scale returns voltage in uV =20
> >
> > No. All channels return in mV. That's the ABI requirement as
> > in sysfs-bus-iio and we cannot vary if for particular drivers.  If we d=
id
> > no generic tooling would work. =20
>=20
> Ok, I got it!
>=20
> > =20
> > > +
> > > +What:                /sys/bus/iio/devices/iio:deviceX/in_voltage1_raw
> > > +KernelVersion:       5.18
> > > +Contact:     chiaen_wu@richtek.com
> > > +Description:
> > > +             Indicated MT6370 VBUS ADC with higher accuracy(+-30mA)
> > > +             lower measure range(1~9.76V)
> > > +             Calculating with scale offset returns voltage in uV
> > > +
> > > +What:                /sys/bus/iio/devices/iio:deviceX/in_voltage4_raw
> > > +KernelVersion:       5.18
> > > +Contact:     chiaen_wu@richtek.com
> > > +Description:
> > > +             Indicated MT6370 TS_BAT ADC
> > > +             Calculating with scale returns voltage in uV
> > > +
> > > +What:                /sys/bus/iio/devices/iio:deviceX/in_voltage7_raw
> > > +KernelVersion:       5.18
> > > +Contact:     chiaen_wu@richtek.com
> > > +Description:
> > > +             Indicated MT6370 CHG_VDDP ADC
> > > +             Calculating with scale returns voltage in mV
> > > +
> > > +What:                /sys/bus/iio/devices/iio:deviceX/in_temp8_raw
> > > +KernelVersion:       5.18
> > > +Contact:     chiaen_wu@richtek.com
> > > +Description:
> > > +             Indicated MT6370 IC junction temperature
> > > +             Calculating with scale and offset returns temperature i=
n degree =20
>=20
> Shall I modify the scale of temperature to milli degrees in
> mt6370-adc.c and remove this item??

yes.

Thanks,

Jonathan

>=20
> > =20
>=20
> Best regards,
> ChiaEn Wu


