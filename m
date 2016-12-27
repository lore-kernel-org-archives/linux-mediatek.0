From: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH] usb: mtu3: fix U3 port link issue
Date: Tue, 27 Dec 2016 13:22:08 +0200
Message-ID: <87lgv11usf.fsf@linux.intel.com>
References: <1481095393-23198-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1481095393-23198-1-git-send-email-chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Oliver Neukum <oneukum-IBi9RG/b67k@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Alan Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> writes:
> the issue is introduced when @is_u3_ip is used in mtu3_device_enabe()
> before initialized in mtu3_mem_alloc(), so get global IP information
> at first before used by following functins.
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

patch doesn't apply to my testing/fixes. Please rebase

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlhiTuAACgkQzL64meEa
mQZFAw//d4fWZTbQpko9F7Vu1IIC3fLitlouOTOhpdF5vGxeZiS1cQHk4UFcNO1K
6XTiVvjvWtRPUMIoV07QifHJ6vJdMdVpjNM3rt8BdgRt647ceJAAuH/qooyftIB/
f2lP2SOMfsXMl/o9+TY5l8vsoAJSTRVzjAYf6UAbNvcqLnIpig3bJ8HWWpk7jIta
fQwBgt/dSjGc/Ey9v99YUmo+kRxANrnTEIMcMkekeqmH/Gdlmtjv+kUKlBuH60hU
pY7arwDTqVytiduSNrcK/Sk2lBylvj0DfgSJg/8LgKlGAGTDkP83F6jX0IguA+co
zqdXI5TJjv7L6E6JivW1rqpMQeCyaXhaXZ61P3Uqz4B937iJvwDNc8DV2watzRVq
EaSQedTNZn9KCNA9iDptd36lXlqq4RxkOl9M2MLXaB42uJzc4vkKc30We5Oru4Hm
QqKxZlCVQy64QnWRB3MXmgBN5E4IwB8kaAa+cXzVWaz613vzhm0J/o7HJz9Dnj6+
ZgWxqXaKeQ7Wn951utWW1SmT3ieoVkh/pvWgI+QJqgTaqUfhLXSGZFOW2K+NVo1Q
BL/1XtjIYLzjVgk/xX+VJX5m+X3v8Ecr8DCE7Sz32Q/DTSJmWtOFVQ26qYNxFRyN
viD1gcM3gYDUf0PRK7MNc9EVoJNgSTzxmv7am8s7FlKIvjuSYJo=
=OO4e
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
