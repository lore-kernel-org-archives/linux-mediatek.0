From: NeilBrown <neil@brown.name>
Subject: Re: [PATCH v2] staging: mt7621-eth: Fix sparse warning in ethtool.c
Date: Mon, 02 Apr 2018 13:41:33 +1000
Message-ID: <87po3i1dhu.fsf@notabene.neil.brown.name>
References: <20180329095637.GA16778@kroah.com> <20180329124745.24694-1-cmc@babblebit.net> <87vada1owt.fsf@notabene.neil.brown.name> <1522638255.18424.44.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1522638255.18424.44.camel@mtkswgap22>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Wang <sean.wang@mediatek.com>
Cc: Chris Coffey <cmc@babblebit.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, devel@driverdev.osuosl.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 02 2018, Sean Wang wrote:

> On Mon, 2018-04-02 at 09:34 +1000, NeilBrown wrote:
>> On Thu, Mar 29 2018, Chris Coffey wrote:
>>=20
>> > This fixes the following sparse warning:
>> >
>> > drivers/staging/mt7621-eth/ethtool.c:213:6: warning: symbol
>> > 'mtk_set_ethtool_ops' was not declared. Should it be static?
>> >
>> > Signed-off-by: Chris Coffey <cmc@babblebit.net>
>>=20
>> Reviewed-by: NeilBrown <neil@brown.name>
>>=20
>> Thanks,
>> NeilBrown
>>=20
> Hi, Neil
>
> Forgive me I cannot find the cover letter in the original series in my
> mailbox to make a reply, so I rudely made here just letting you know
> something good to the growth of mt7621 support in upstream.
>
> do you have maintained an out-of-tree branch to boot the mt7621 machine
> with those staging patches?

I can boot v4.16 plus staging-next on my mt7621 with no other patches.
An important fix (a63d706ea71919) landed in 4.16-rc7.

It do have
  https://github.com/neilbrown/linux/commits/gnubee/v4.15

which was part of preparation for this, but now that very nearly all I
need is in mainline or on its way, I won't be doing much more in that
tree.

>
> If so, it would become a bit easier for me that maybe I could give a
> hand for migrating these staging driver for mt7621 to mainline. I
> thought mmc, pci, ethernet, gsw and hsdma all could probably reuse the
> current mainline code.

I agree that it is quite likely that several of these drivers could and
should reuse current mainline code.  I would love to have some help
sorting this out.  I won't have much time myself to dig into it for
several weeks, but I'll make time to review and test any code that is
contributed.

Thanks,
NeilBrown

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEG8Yp69OQ2HB7X0l6Oeye3VZigbkFAlrBpm4ACgkQOeye3VZi
gbmclBAAm+NewuKw08BlxuB0AgbPrKV346xZiq5N/FdHhQDHIIob0GvAxAZmDtfi
LrjAwO4gmliAFkY6vk6qcWSj8EmYxdn+t5gx1BJXaZaumJ5nZ64XtgZ2of/S7wkH
fUwNzbAGsKe9IuXKPbXoJhvjITwTtMDii2FQ2YjIM6wBhWw6GIbmeUIm3aVRWB4W
+wYdXo8pgYY6ULPdGwadxFh5xwrLk6sMIIPsE+aeteoC1px+/kVmee5LKKpJdo99
XbSXjZHIMgwfVSQfzpWabrv+SiwkRjygTrHk0tAXNsuRhPWTpg69xfVIQCQG0Da/
m/CiayXJRWCD2TAfoDecyffvkT8+NQEJ2Z1ow7EGDcvisVY+PtgZ2fJHNWdu9a+z
/+87l6zOjvBlPRR2JBKv4HGSW72NeJTeMP+4jAn4zXZ+Ks7Oj9E+LaXgCKvfBLih
VLYR1NOR+JP3qn3fQNsx8bFLFfRzjs0nEGl7c0C1z/xD2Lw843n+kx4UbdHO8lTd
dhWyJvl+wCfiGbVnMMjgJLGj4LtVCcFoGgImQyekAVZnO3Vr3pGQXVmM3/wBerE2
feVSJaZkI5En5cgha8RG5Z+uy5/UOja8nAoiPxR7BuqvsnMW/Nk6utwiSOiqHJNp
ilU2vg85eWRg9PcTbx5t/lFs7utVB3a5kfplR8OTjPAeNXL6wg0=
=RzAz
-----END PGP SIGNATURE-----
--=-=-=--
