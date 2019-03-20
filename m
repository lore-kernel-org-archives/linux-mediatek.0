From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH v2] usb: introduce usb_ep_type_string() function
Date: Wed, 20 Mar 2019 08:55:11 +0200
Message-ID: <87r2b2ujao.fsf@linux.intel.com>
References: <28a8e9f1518e47c35e4563706cbe592b972a7f9d.1552977710.git.chunfeng.yun@mediatek.com> <1552982059.10179.143.camel@mhfsdcap03> <20190319092331.GA21652@kroah.com> <1553044567.10179.148.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1553044567.10179.148.camel@mhfsdcap03>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Matthias Brugger <matthias.bgg@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Arnd Bergmann <arnd@arndb.de>, Roger Quadros <rogerq@ti.com>, Alan Stern <stern@rowland.harvard.edu>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Miquel Raynal <miquel.raynal@bootlin.com>, Dmitry Torokhov <dtor@chromium.org>, Johan Hovold <johan@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Colin Ian King <colin.king@canonical.com>, Matteo Croce <mcroce@redhat.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ar
List-Id: linux-mediatek@lists.infradead.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Chunfeng Yun <chunfeng.yun@mediatek.com> writes:

> Hi Greg,
>
> On Tue, 2019-03-19 at 10:23 +0100, Greg Kroah-Hartman wrote:
>> On Tue, Mar 19, 2019 at 03:54:19PM +0800, Chunfeng Yun wrote:
>> >=20
>> > Hi Felipe & Mathias,
>> >=20
>> > Could you please comment this patch, if there is some-effect on dwc3 a=
nd
>> > xhci, I'll remove its change.
> typo: some-effect/side-effect

well, we don't really know if there are tools parsing the output. The
side-effect _does_ exist (i.e. you change the string :-), what we don't
know is if this will cause problems to possibly existing tools.

Personally, I don't mind the patch, but if it breaks existing parsers,
that would be a little annoying.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlyR488ACgkQzL64meEa
mQaAWg//S95naaisDElfGnzXqBw3k2BoHlVBjEBB8ZxEjMzsKRAeg6D+9cUcnr/X
He/uixVvKfFAnAUVpOFe6gCJi+djcJ+XiPWkPerR0Rrpe2/jk2UN1czQgtf1HRR2
K4hyy9wny3xoKguLXs8qTCqBW6WnKRhrrfP0XR5X8xN8Nz9bFcqdvN0rj9TAguoO
LROa4F8afo1M5ImdXA0wnjQkFqVUZNP9/feXlTPjXDWVBK5AdwRFf+ErUXJCofJ+
YEF05yfB+rnrr4ttlZ6MMWJQ+2CmqxQ0xk0w4aqubhWwbrw6f1LJDNj3j+9cA4mS
G7H+ZHBBfpa+93X1iyDPkBv0pE+Ztx6s4UkN3B/YbM6IUwYoID14sBKjcmwzpeYS
0aUc1Fi/91qsj747UyMWwhZFlLhFyycl8oajr+YIz0oWYZBO5S5W4RQ+txOO0YJZ
3dPE/boIblZaY9GqmLQDtEHHpw7jeynu6+JJWpY6dowiHvLjSGAnbnZisHgdOtxy
crm+gcocmt5Czl0FVBeuSDQdv5cMfrGIB4bTUa8uuS72WkNVIownQzG4VUl1LH8J
rudrRmca2jZiq3iP8EXsukiITglgde5hTrN6p8ONK9ZTT8b7DV4OC8osGkOIZ+Eq
Slx/MHsARCrK+J6h5BzBPom+Wl0rUusvIanvS5zPhqEJ5qRkPPE=
=A4FC
-----END PGP SIGNATURE-----
--=-=-=--
