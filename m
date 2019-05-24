From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: Re: [PATCH] staging: mt7621-pci: pci-mt7621: Remove unneeded variable err
Date: Fri, 24 May 2019 07:54:08 +0200
Message-ID: <CAMhs-H9222OXrqWh4W-D7pFV6FXbhLVVGXz-29gO-Qo0eQaTvQ@mail.gmail.com>
References: <20190523183510.GA12942@hari-Inspiron-1545>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190523183510.GA12942@hari-Inspiron-1545>
Sender: linux-kernel-owner@vger.kernel.org
To: Hariprasad Kelam <hariprasad.kelam@gmail.com>
Cc: reg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, Mamta Shukla <mamtashukla555@gmail.com>, NeilBrown <neil@brown.name>, Peter Vernia <peter.vernia@gmail.com>, devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Hariprasad,


On Thu, May 23, 2019 at 8:35 PM Hariprasad Kelam
<hariprasad.kelam@gmail.com> wrote:
>
> devm_request_pci_bus_resources function will return -EBUSY/-ENOMEM
> in fail case and returns 0 on success.
>
> So no need to store return value in err variable.
>
> Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
> ---
>  drivers/staging/mt7621-pci/pci-mt7621.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/staging/mt7621-pci/pci-mt7621.c b/drivers/staging/mt7621-pci/pci-mt7621.c
> index 03d919a..bc2a3d1 100644
> --- a/drivers/staging/mt7621-pci/pci-mt7621.c
> +++ b/drivers/staging/mt7621-pci/pci-mt7621.c
> @@ -596,17 +596,12 @@ static int mt7621_pcie_request_resources(struct mt7621_pcie *pcie,
>                                          struct list_head *res)
>  {
>         struct device *dev = pcie->dev;
> -       int err;
>
>         pci_add_resource_offset(res, &pcie->io, pcie->offset.io);
>         pci_add_resource_offset(res, &pcie->mem, pcie->offset.mem);
>         pci_add_resource(res, &pcie->busn);
>
> -       err = devm_request_pci_bus_resources(dev, res);
> -       if (err < 0)
> -               return err;
> -
> -       return 0;
> +       return devm_request_pci_bus_resources(dev, res);
>  }
>

In the patch title, the "mt7621-pci" is repeated twice. With that changed:

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

>  static int mt7621_pcie_register_host(struct pci_host_bridge *host,
> --
> 2.7.4
>
