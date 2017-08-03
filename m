From: Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: Re: [PATCH 2/2] MAINTAINERS: add entry for mediatek usb3 DRD IP driver
Date: Thu, 03 Aug 2017 12:23:09 +0300
Message-ID: <87y3r1dmyq.fsf@linux.intel.com>
References: <1501749439-8837-1-git-send-email-chunfeng.yun@mediatek.com> <1501749439-8837-2-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1501749439-8837-2-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Chunfeng Yun <chunfeng.yun@mediatek.com> writes:
> Add myself as maintainer of MediaTek USB3 DRD IP driver
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  MAINTAINERS |    7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 205d397..0f0bcc7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8472,6 +8472,13 @@ M:      Sean Wang <sean.wang@mediatek.com>
>  S:      Maintained
>  F:      drivers/char/hw_random/mtk-rng.c
>=20=20
> +MEDIATEK USB3 DRD IP DRIVER
> +M:	Chunfeng Yun <chunfeng.yun@mediatek.com>
> +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> +L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)

everything USB should go to linux-usb too.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlmC630ACgkQzL64meEa
mQbL9BAAsetGOL0OGwMKpYKYrMxXrt8lRf9SORXrvGChQkznPzO8ninoXppOaAon
aYrfrE7HLYc6zR8Fst/IIKE5kA6f4bbCb6pNMALGuLr+K8tp10KNdsJ7QAP/dfdL
mAMV0Q6axB60xUzxGO1mE9/Q+PsQRJVdkDksoLgJV3B7nApGpNCK4qnHXteE4gni
nNdl+kNaMkqpKa9YON1JVQgJB+xYNU03W/A5sDKR1ohyVID77pJ8In34lLeOR0Ej
qB7k8/pgNUizpn5CWecdJW+eC7G3gDompZl16nJTBbinXF20OPhvVGOWJgq4X9Ku
ZMs9fWmq3AAhCp7ucnxOikOi8K5YfGmxCrSPCnDAviQKpoBFebPfOMUDoD3Zfi/z
iBTSlj85jt3viLJX98IdM0gi/GskkWcGHz++wrpew4A8S0Be1KjOU2GRxc7/f7ta
MrIHlA6M85Ir5qVvWEbps6LjkzogG5R0OqE5SOBGwIRMwiGRHHgJQr5dM7XkpnBr
JjbAe4qUtOZjLkiazMD3rN03i2AToJBtDZK4sRcigTRUhg0iE9m1U9hMHhcPLjF6
RSB6CIjW0pVVao+jBRFpMbVeZEvRoSMAPkVzhfl8OOp4dbMb4brPWxKhWoecmvYO
ll1raRfFUY12nYhX2txCL3dQgIyJE+GvOyS1d/DChZ0Cp91zxiA=
=tUAN
-----END PGP SIGNATURE-----
--=-=-=--
