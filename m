From: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [RFC/RFT usb-next v1 5/6] usb: chipidea: do not set the "phy"
 field in struct usb_hcd
Date: Fri, 26 Jan 2018 09:06:33 +0000
Message-ID: <HE1PR04MB145071FCFAF041E0A9252FF08BE00@HE1PR04MB1450.eurprd04.prod.outlook.com>
References: <20180125001639.14681-1-martin.blumenstingl@googlemail.com>
 <20180125001639.14681-6-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180125001639.14681-6-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org" <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org" <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
Cc: "mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org" <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

=20
>=20
> Now that usb_add_hcd parses all generic PHYs anyways the code which skips
> initialization of a single PHY will go away.
> Remove the code which sets struct usb_hcd's phy field from the chipidea d=
river as
> this field will go away soon.
>=20
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> ---
>  drivers/usb/chipidea/host.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c in=
dex
> 19d60ed7e41f..fc324767cb0f 100644
> --- a/drivers/usb/chipidea/host.c
> +++ b/drivers/usb/chipidea/host.c
> @@ -124,9 +124,7 @@ static int host_start(struct ci_hdrc *ci)
>=20
>  	hcd->power_budget =3D ci->platdata->power_budget;
>  	hcd->tpl_support =3D ci->platdata->tpl_support;
> -	if (ci->phy)
> -		hcd->phy =3D ci->phy;
> -	else
> +	if (!ci->phy)
>  		hcd->usb_phy =3D ci->usb_phy;
>=20

The reason hcd->phy is initialized by chipidea core is we do not need HCD c=
ore to
touch PHY, and PHY operation is shared for both device and host mode for ch=
ipidea.

If I understand correct, your HCD core PHY wrapper patch set will do PHY op=
eration if
there is a "phy" node under controller's? If it is correct, you may supply =
one way to let
the HCD core bypass phy operations for some USB controllers, eg dual-role c=
ontrollers.
Thanks.

Peter

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
