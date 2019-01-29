From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH] MIPS: Select PINCTRL_RT2880 when RALINK is enabled
Date: Tue, 29 Jan 2019 20:09:07 +0000
Message-ID: <20190129200905.vnb3amouxq6o57fn@pburton-laptop>
References: <20190129152522.GA24872@nishad>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190129152522.GA24872@nishad>
Content-Language: en-US
Content-ID: <335B6EC3D6EAD047885765D40FEEF4B3@namprd22.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nishad Kamdar <nishadkamdar@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, NeilBrown <neil@brown.name>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Joe Perches <joe@perches.com>, Matthias Brugger <matthias.bgg@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Kees Cook <keescook@chromium.org>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Nishad,

On Tue, Jan 29, 2019 at 08:55:27PM +0530, Nishad Kamdar wrote:
> This patch selects config PINCTRL_RT2880 when config RALINK is
> enabled as per drivers/staging/mt7621-pinctrl/TODO list. PINCTRL
> is also selected when RALINK is enabled to avoid config dependency
> warnings.
>=20
> Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
> ---
>  arch/mips/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index e2fc88da0223..cea529cf6284 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -623,6 +623,8 @@ config RALINK
>  	select CLKDEV_LOOKUP
>  	select ARCH_HAS_RESET_CONTROLLER
>  	select RESET_CONTROLLER
> +	select PINCTRL
> +	select PINCTRL_RT2880
> =20
>  config SGI_IP22
>  	bool "SGI IP22 (Indy/Indigo2)"

Wouldn't this also require selecting STAGING? Perhaps that's why it
wasn't done in the first place?

Thanks,
    Paul
