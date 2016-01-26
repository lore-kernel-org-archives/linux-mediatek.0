From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V2 4/4] mfd: mediatek: add MT6323 support to MT6397 driver
Date: Tue, 26 Jan 2016 08:34:33 +0000
Message-ID: <20160126083433.GX3368@x1>
References: <1453716887-38442-1-git-send-email-blogic@openwrt.org>
 <20160125124112.GG3368@x1>
 <56A64108.7020807@openwrt.org>
 <3476571.0yU9yvPsKF@linux-gy6r.site>
 <56A670A3.5030100@openwrt.org>
 <1453777643.26374.11.camel@mtksdaap41>
 <56A71CE5.4080201@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56A71CE5.4080201@openwrt.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Crispin <blogic@openwrt.org>
Cc: Henry Chen <henryc.chen@mediatek.com>, Steven Liu <steven.liu@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, Flora Fu <flora.fu@mediatek.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Tue, 26 Jan 2016, John Crispin wrote:
> On 26/01/2016 04:07, Henry Chen wrote:
> > On Mon, 2016-01-25 at 19:59 +0100, John Crispin wrote:
> >>
> >> On 25/01/2016 19:44, Matthias Brugger wrote:
> >>> On Monday 25 Jan 2016 16:36:40 John Crispin wrote:
> >>>> Hi,
> >>>>
> >>>> On 25/01/2016 13:41, Lee Jones wrote:
> >>>>> Please honour the subject format of the subsystem you are contr=
ibuting
> >>>>> to.
> >>>>>
> >>>>> `git log --oneline -- $subsystem` gives you this.
> >>>>>
> >>>>> On Mon, 25 Jan 2016, John Crispin wrote:
> >>>>>> Signed-off-by: John Crispin <blogic@openwrt.org>
> >>>>>> ---
> >>>>
> >>>> [...]
> >>>>
> >>>>>> @@ -261,6 +271,15 @@ static int mt6397_probe(struct platform_d=
evice
> >>>>>> *pdev)
> >>>>>>
> >>>>>>  	}
> >>>>>>  =09
> >>>>>>  	switch (id & 0xff) {
> >>>>>>
> >>>>>> +	case MT6323_CID_CODE:
> >>>>>> +		mt6397->int_con[0] =3D MT6323_INT_CON0;
> >>>>>
> >>>>> This is confusing.  You're still using memory allocated for a m=
t6397
> >>>>> device.
> >>>>
> >>>> the variable is currently defined as struct mt6397_chip *mt6397;
> >>>> shall i only change the name or also create a patch to rename th=
e struct ?
> >>>>
> >>>
> >>> I think we should rename the struct and the file as well.
> >>>
> >>> Cheers,
> >>> Matthias
> >>
> >> Hi,
> >>
> >> that would have been my next question. renaming the struct would i=
mply
> >> renaming the driver and the whole namespace contained within. We w=
ould
> >> then also need to change the Kconfig and Makefile. I am happy to d=
o this
> >> but want to be sure that is is actually wanted.
> >>
> >> 	John
> > Hi,
> >=20
> > Since mt6323 was similar with mt6397, I think we can reuse the
> > mt6397_chip without duplicate code.
> >=20
> > Maybe we can rename the local variable name to avoid confusing.
> >=20
> > struct mt6397_chip *mt_pmic;
> > ...
> > ...
> > switch (id & 0xff) {
> > 	case MT6323_CID_CODE:
> > 		mt_pmic->int_con[0] =3D MT6323_INT_CON0;
> > 		mt_pmic->int_con[1] =3D MT6323_INT_CON1;
> > ...
> > ...
> >=20
> > Henry
>=20
> Hi,
>=20
> IMHO we should either rename the namespace or not. renaming some
> variables seems weird as that will just move the confusion/inconsiste=
ncy
> to another place in the code. I am however rather indifferent on this
> matter.

It's common to name a driver after the device which was enabled first,
so no need to rename the files or CONFIGs; however, it does seem
prudent to generify the struct (both parts).

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
