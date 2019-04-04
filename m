From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: Re: [PATCH] staging: mt7621-pci-phy: prevent use of uninitialized variable
Date: Thu, 4 Apr 2019 14:55:56 +0200
Message-ID: <CAMhs-H_qFRQ21VoJjy0r=B2uashkGK2Oyf=UWFo66G0spydkaA@mail.gmail.com>
References: <20190404124414.22846-1-detegr@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190404124414.22846-1-detegr@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Antti_Ker=C3=A4nen?= <detegr@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Greg KH <gregkh@linuxfoundation.org>, benniciemanuel78@gmail.com, NeilBrown <neil@brown.name>, devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: linux-mediatek@lists.infradead.org

On Thu, Apr 4, 2019 at 2:46 PM Antti Ker=C3=A4nen <detegr@gmail.com> wrote:
>
> Do not use uninitialized variable 'port' when printing an error message
>
> Signed-off-by: Antti Ker=C3=A4nen <detegr@gmail.com>
> ---
>  drivers/staging/mt7621-pci-phy/pci-mt7621-phy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/mt7621-pci-phy/pci-mt7621-phy.c b/drivers/st=
aging/mt7621-pci-phy/pci-mt7621-phy.c
> index 118302c122ee..aa3ae7777632 100644
> --- a/drivers/staging/mt7621-pci-phy/pci-mt7621-phy.c
> +++ b/drivers/staging/mt7621-pci-phy/pci-mt7621-phy.c
> @@ -331,7 +331,7 @@ static int mt7621_pci_phy_probe(struct platform_devic=
e *pdev)
>
>         ret =3D of_address_to_resource(np, 0, &res);
>         if (ret) {
> -               dev_err(dev, "failed to get address resource(id-%d)\n", p=
ort);
> +               dev_err(dev, "failed to get address resource\n");
>                 return ret;
>         }

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
     Sergio Paracuellos

>
> --
> 2.21.0
>
