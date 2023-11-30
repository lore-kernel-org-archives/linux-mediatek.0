Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3480C4167B
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Nov 2023 13:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z3Ac1OsQ/0PufFzAKJvogoNK3ZXux9UUeIIWbEpuj4w=; b=lOu9Iwib/aEMiTetxElFx100l8
	1dZ/juuJ2cQvb1xbSIc4yK7+2JhGs8Cn+Fu2ztY8LOt+/WiV3RrJuwABoKtzR1vsTcYgvRy0l4qh/
	rZxGFMt9gXE/9ZT2DSQtKCJdT+Xu/Aw9mPlor0vwYYSlZ3P5OYYwOJjfOcg6gLCBJXGL+GXDIRH7b
	GENLVfIZGz0zLwxav6lxt4VpEeREOTXZZN6cJ4vGcWBVeiTraISe0I1mIbzTWmUB1BfsFOz3hvv4V
	T5gUb43s0JgYtOjdkPjZ7A9DVrDbmPKYKCZCUOES0r/j4huN2Gv345z0LM29zSb0VzYRKLhk6Ajp3
	7PEbyEvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8gzm-00Ax7o-1V;
	Thu, 30 Nov 2023 13:22:22 +0000
Received: from mail-ot1-f41.google.com ([209.85.210.41])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8gzi-00Ax73-1T;
	Thu, 30 Nov 2023 13:22:19 +0000
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6d815062598so175098a34.0;
        Thu, 30 Nov 2023 05:22:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701350536; x=1701955336;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z3Ac1OsQ/0PufFzAKJvogoNK3ZXux9UUeIIWbEpuj4w=;
        b=U7beg2AQp0Zqx4U/dsSy0LHsEF3Q6BvHfOLw5dz9xa3uVoqflf60Or/6QMMgFYfdua
         0q5UIqS9Sc3C2MPQBAcKqcEWTODZb4ZIfIjDTpqSUH/Ia290aWvgHXmQ9DHtynDD8L0N
         Gq1EGKEB5ovyDMN1yGjZc06SKvt62Tnks5/DB0vj+rtvqP+I4m6mCiPY2G5PakyBavnb
         URWXecaTfK9iewiva8dK7WnO6lrI34kFtC/W7CzWPyaoYKkEc0ykZDPbJPg0ScnIe50P
         73Bj7VRARINght158/nqfRT0rKNkB4ahFo2yFpozbt5hwo1vneE61LjQAMNnVnnQWTOm
         xwHQ==
X-Gm-Message-State: AOJu0YwYj6skzAQpcWjqXS5CFp6QrLoh6pI+7QsdqNImdE4fIWt9H7DZ
	kXVCi5qAQNjVTRen1jtBjXEB0spZyQalX5d3apY=
X-Google-Smtp-Source: AGHT+IE2dl3Xx9eJWjdmY/6S7l+LmkTasy79qgcO017bYrhvGpUKiq9ghaOZGXLyHzSGuDtnofjD5ts7oxP8wmkedE8=
X-Received: by 2002:a4a:eb86:0:b0:58d:5302:5b18 with SMTP id
 d6-20020a4aeb86000000b0058d53025b18mr17772925ooj.1.1701350536438; Thu, 30 Nov
 2023 05:22:16 -0800 (PST)
MIME-Version: 1.0
References: <0-v1-f82a05539a64+5042-iommu_fwspec_p2_jgg@nvidia.com> <2-v1-f82a05539a64+5042-iommu_fwspec_p2_jgg@nvidia.com>
In-Reply-To: <2-v1-f82a05539a64+5042-iommu_fwspec_p2_jgg@nvidia.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 30 Nov 2023 14:22:05 +0100
Message-ID: <CAJZ5v0gEGFk9P8H25GJ827LkCb=G=QsRqN6SPbh9J7zS+BhQ0w@mail.gmail.com>
Subject: Re: [PATCH 02/30] ACPI: VIOT: Make a viot_iommu_for_each_id()
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: acpica-devel@lists.linux.dev, Andy Gross <agross@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Bjorn Andersson <andersson@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, asahi@lists.linux.dev, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, devicetree@vger.kernel.org, 
	Frank Rowand <frowand.list@gmail.com>, Hanjun Guo <guohanjun@huawei.com>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>, 
	Kees Cook <keescook@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Len Brown <lenb@kernel.org>, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Hector Martin <marcan@marcan.st>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Robert Moore <robert.moore@intel.com>, Rob Herring <robh+dt@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Samuel Holland <samuel@sholland.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Sven Peter <sven@svenpeter.dev>, 
	Thierry Reding <thierry.reding@gmail.com>, Krishna Reddy <vdumpa@nvidia.com>, 
	virtualization@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>, 
	Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_052218_494965_0C0F1617 
X-CRM114-Status: GOOD (  26.02  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Nov 30, 2023 at 2:11=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> Similar to of_iommu_for_each_id() this parses the VIOT ACPI description
> and invokes a function over each entry in the table.
>
> Have viot_iommu_configure() use the new function to call
> viot_dev_iommu_init().
>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

> ---
>  drivers/acpi/viot.c       | 54 +++++++++++++++++++++++----------------
>  include/linux/acpi_viot.h | 11 ++++++++
>  2 files changed, 43 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/acpi/viot.c b/drivers/acpi/viot.c
> index c8025921c129b2..7ab35ef05c84e0 100644
> --- a/drivers/acpi/viot.c
> +++ b/drivers/acpi/viot.c
> @@ -25,13 +25,6 @@
>  #include <linux/pci.h>
>  #include <linux/platform_device.h>
>
> -struct viot_iommu {
> -       /* Node offset within the table */
> -       unsigned int                    offset;
> -       struct fwnode_handle            *fwnode;
> -       struct list_head                list;
> -};
> -
>  struct viot_endpoint {
>         union {
>                 /* PCI range */
> @@ -304,10 +297,10 @@ void __init acpi_viot_init(void)
>         acpi_put_table(hdr);
>  }
>
> -static int viot_dev_iommu_init(struct device *dev, struct viot_iommu *vi=
ommu,
> -                              u32 epid)
> +static int viot_dev_iommu_init(struct viot_iommu *viommu, u32 epid, void=
 *info)
>  {
>         const struct iommu_ops *ops;
> +       struct device *dev =3D info;
>
>         if (!viommu)
>                 return -ENODEV;
> @@ -324,11 +317,17 @@ static int viot_dev_iommu_init(struct device *dev, =
struct viot_iommu *viommu,
>         return acpi_iommu_fwspec_init(dev, epid, viommu->fwnode, ops);
>  }
>
> -static int viot_pci_dev_iommu_init(struct pci_dev *pdev, u16 dev_id, voi=
d *data)
> +struct viot_pci_iommu_alias_info {
> +       struct device *dev;
> +       viot_for_each_fn fn;
> +       void *info;
> +};
> +
> +static int __for_each_pci_alias(struct pci_dev *pdev, u16 dev_id, void *=
data)
>  {
>         u32 epid;
>         struct viot_endpoint *ep;
> -       struct device *aliased_dev =3D data;
> +       struct viot_pci_iommu_alias_info *info =3D data;
>         u32 domain_nr =3D pci_domain_nr(pdev->bus);
>
>         list_for_each_entry(ep, &viot_pci_ranges, list) {
> @@ -339,14 +338,14 @@ static int viot_pci_dev_iommu_init(struct pci_dev *=
pdev, u16 dev_id, void *data)
>                         epid =3D ((domain_nr - ep->segment_start) << 16) =
+
>                                 dev_id - ep->bdf_start + ep->endpoint_id;
>
> -                       return viot_dev_iommu_init(aliased_dev, ep->viomm=
u,
> -                                                  epid);
> +                       return info->fn(ep->viommu, epid, info->info);
>                 }
>         }
>         return -ENODEV;
>  }
>
> -static int viot_mmio_dev_iommu_init(struct platform_device *pdev)
> +static int __for_each_platform(struct platform_device *pdev,
> +                              viot_for_each_fn fn, void *info)
>  {
>         struct resource *mem;
>         struct viot_endpoint *ep;
> @@ -357,12 +356,28 @@ static int viot_mmio_dev_iommu_init(struct platform=
_device *pdev)
>
>         list_for_each_entry(ep, &viot_mmio_endpoints, list) {
>                 if (ep->address =3D=3D mem->start)
> -                       return viot_dev_iommu_init(&pdev->dev, ep->viommu=
,
> -                                                  ep->endpoint_id);
> +                       return fn(ep->viommu, ep->endpoint_id, info);
>         }
>         return -ENODEV;
>  }
>
> +int viot_iommu_for_each_id(struct device *dev, viot_for_each_fn fn, void=
 *info)
> +{
> +       if (dev_is_pci(dev)) {
> +               struct viot_pci_iommu_alias_info pci_info =3D {
> +                       .dev =3D dev,
> +                       .fn =3D fn,
> +                       .info =3D info,
> +               };
> +               return pci_for_each_dma_alias(to_pci_dev(dev),
> +                                             __for_each_pci_alias, &pci_=
info);
> +       }
> +
> +       if (dev_is_platform(dev))
> +               return __for_each_platform(to_platform_device(dev), fn, i=
nfo);
> +       return -ENODEV;
> +}
> +
>  /**
>   * viot_iommu_configure - Setup IOMMU ops for an endpoint described by V=
IOT
>   * @dev: the endpoint
> @@ -371,10 +386,5 @@ static int viot_mmio_dev_iommu_init(struct platform_=
device *pdev)
>   */
>  int viot_iommu_configure(struct device *dev)
>  {
> -       if (dev_is_pci(dev))
> -               return pci_for_each_dma_alias(to_pci_dev(dev),
> -                                             viot_pci_dev_iommu_init, de=
v);
> -       else if (dev_is_platform(dev))
> -               return viot_mmio_dev_iommu_init(to_platform_device(dev));
> -       return -ENODEV;
> +       return viot_iommu_for_each_id(dev, viot_dev_iommu_init, dev);
>  }
> diff --git a/include/linux/acpi_viot.h b/include/linux/acpi_viot.h
> index a5a12243156377..fce4eefcae4aad 100644
> --- a/include/linux/acpi_viot.h
> +++ b/include/linux/acpi_viot.h
> @@ -5,6 +5,17 @@
>
>  #include <linux/acpi.h>
>
> +struct viot_iommu {
> +       /* Node offset within the table */
> +       unsigned int                    offset;
> +       struct fwnode_handle            *fwnode;
> +       struct list_head                list;
> +};
> +
> +typedef int (*viot_for_each_fn)(struct viot_iommu *viommu, u32 epid,
> +                               void *info);
> +int viot_iommu_for_each_id(struct device *dev, viot_for_each_fn fn, void=
 *info);
> +
>  #ifdef CONFIG_ACPI_VIOT
>  void __init acpi_viot_early_init(void);
>  void __init acpi_viot_init(void);
> --
> 2.42.0
>

