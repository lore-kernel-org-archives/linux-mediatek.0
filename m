From: "Frank Wunderlich" <frank-w@public-files.de>
Subject: Aw: Re: BUG: devm_regulator_get returns EPROBE_DEFER
 (5.3-rc5..next-20190822) for bpi-r2/mt7623/mt7530
Date: Thu, 22 Aug 2019 22:28:44 +0200
Message-ID: <trinity-5d117f0d-9f34-4a2b-8a12-1cd34152c108-1566505724458@3c-app-gmx-bs43>
References: <trinity-584a4b1c-18c9-43ae-8c1a-5057933ad905-1566501837738@3c-app-gmx-bs43>
 <20190822193015.GK23391@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190822193015.GK23391@sirena.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, =?UTF-8?Q?=22Ren=C3=A9_van_Dorst=22?= <opensource@vdorst.com>
List-Id: linux-mediatek@lists.infradead.org

cfba5de9b99f drivers: Introduce device lookup variants by of_node

this looks suspicios to me since the change is in the function which fails=
:

struct regulator_dev *of_find_regulator_by_node(struct device_node *np)
 {
        struct device *dev;
=20
-       dev =3D class_find_device(&regulator_class, NULL, np, of_node_matc=
h);
+       dev =3D class_find_device_by_of_node(&regulator_class, np);


but i cannot revert this commit so i did it manually=2E=2E=2Ebut this does=
 not seem to be the cause=2E=2E=2Estill error 517, also a change in core=2E=
c is not the cause=2E=2E=2E

how can i check instantiation at runtime?

regards Frank


> Gesendet: Donnerstag, 22=2E August 2019 um 21:30 Uhr
> Von: "Mark Brown" <broonie@kernel=2Eorg>
> An: "Frank Wunderlich" <frank-w@public-files=2Ede>
> Cc: "Liam Girdwood" <lgirdwood@gmail=2Ecom>, linux-kernel@vger=2Ekernel=
=2Eorg, linux-mediatek@lists=2Einfradead=2Eorg, "Ren=C3=A9 van Dorst" <open=
source@vdorst=2Ecom>
> Betreff: Re: BUG: devm_regulator_get returns EPROBE_DEFER (5=2E3-rc5=2E=
=2Enext-20190822) for bpi-r2/mt7623/mt7530
>
> On Thu, Aug 22, 2019 at 09:23:57PM +0200, Frank Wunderlich wrote:
>=20
> > seems of_find_regulator_by_node(node); is failing here, but i see the =
dts-node (mt6323_vpa_reg: buck_vpa) in /sys/firmware/devicetree/=2E=2E=2E
>=20
> It's not looking for the node in the device tree, it's looking
> for that regulator to instantiate at runtime=2E  Is that happening?
>
