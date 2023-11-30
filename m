Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C667C4167B
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Nov 2023 13:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZvNfFwEaJe35P7DHOxBfctgrV0f0ocDgk3MHXYzHo/M=; b=OFvtII72Y+o6/gaCN+thJrsBMR
	BpSWxZFoUNNRLj+vbS7SfHcXJ6SvEp1mhsklpyc2W0tFt254d4R1Bt3Y1ISr1qa2cbnF456mfQnlm
	C5tWaT4bIVYTcAMadWgnn6idDUNSbXeT5tB46LpSKt8zEi3Esac+nIF3OMDEucTSza0bsyTSv2QLN
	BjkTtxEU+VmN+NoHFJbXL1XJiygCA4MlQz6SNaNPtbk2T5UDeB1USXpWL+fWIjUXT8FvwBJsmfTJW
	5T7BesMXXRorM0cbfD8MAXmCIn7cZU6iVKDg/tKFm9Lq6bHunYpQ+d+/hNauutSULXF4BypB8jmBl
	E4RsXxnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8gzP-00Ax2P-01;
	Thu, 30 Nov 2023 13:21:59 +0000
Received: from mail-oo1-f41.google.com ([209.85.161.41])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8gzL-00Ax1c-0Y;
	Thu, 30 Nov 2023 13:21:56 +0000
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-58db15c68f3so30332eaf.0;
        Thu, 30 Nov 2023 05:21:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701350513; x=1701955313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZvNfFwEaJe35P7DHOxBfctgrV0f0ocDgk3MHXYzHo/M=;
        b=kD62HU94fJOgZ9JUF0/MSUrKPHrZdtfcIp71CARFdNku7vmAjhuU1pOfCFPDnCdfoD
         mrr20BDciCLXty/llUH0UmCY9MW5bu8r5BHv311QwTSOlT/AfUI+UDXsj8J/3+qzwPqQ
         qH+BwiInqKEIikqeXMoucDynCLU0jvIMu/4yXHXZJn2eK2uq4tm2VyI+B3HZldKdguSy
         PsYhf4wRpf9SB4VgCRV1dYofm1YjNwW94e5wmUuCWkMkbSvMHf8NmYhZKrcPSIqqjRza
         xe2vSntEXlqDJYhVlIG8ztiNstOCzliIUz4J7PURbsl1mlBMCoEL7YuAFW9QLpJW7GAX
         6qNg==
X-Gm-Message-State: AOJu0YzARRaccj/kmLl4O/Z5Nkof/oMkhz9A4U+Gxtf//CRSnGdVZmKQ
	oomJs3UuHNA9IJDjUAi8LmIkKws0bStLWN2Bkog=
X-Google-Smtp-Source: AGHT+IHVXAHNIVex42KnwULFjGZK2tI3TPh5OlhmRjJZ4u6dNoVNOqThLGV/PQYjRCTwh4xYmS9IrHBLkf2HUiQDDjI=
X-Received: by 2002:a4a:a2c8:0:b0:58d:ddcb:db1a with SMTP id
 r8-20020a4aa2c8000000b0058dddcbdb1amr1875278ool.1.1701350513014; Thu, 30 Nov
 2023 05:21:53 -0800 (PST)
MIME-Version: 1.0
References: <0-v1-f82a05539a64+5042-iommu_fwspec_p2_jgg@nvidia.com> <3-v1-f82a05539a64+5042-iommu_fwspec_p2_jgg@nvidia.com>
In-Reply-To: <3-v1-f82a05539a64+5042-iommu_fwspec_p2_jgg@nvidia.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 30 Nov 2023 14:21:41 +0100
Message-ID: <CAJZ5v0h2=qHgG8qV0Yjm_mZSKBZcYZMfQYiFZF18RcmHM-+oMA@mail.gmail.com>
Subject: Re: [PATCH 03/30] ACPI: IORT: Make a iort_iommu_for_each_id()
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
X-CRM114-CacheID: sfid-20231130_052155_211555_169D888D 
X-CRM114-Status: GOOD (  25.13  )
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
> Similar to of_iommu_for_each_id() this parses the IORT ACPI description
> and invokes a function over each entry in the table.
>
> Have iort_iommu_configure_id() use the new function to call
> iort_iommu_xlate().
>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

> ---
>  drivers/acpi/arm64/iort.c | 118 ++++++++++++++++++++++++--------------
>  include/linux/acpi_iort.h |  12 ++++
>  2 files changed, 86 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
> index bdaf9256870d92..5c9b4c23f96a87 100644
> --- a/drivers/acpi/arm64/iort.c
> +++ b/drivers/acpi/arm64/iort.c
> @@ -1218,9 +1218,10 @@ static bool iort_pci_rc_supports_ats(struct acpi_i=
ort_node *node)
>         return pci_rc->ats_attribute & ACPI_IORT_ATS_SUPPORTED;
>  }
>
> -static int iort_iommu_xlate(struct device *dev, struct acpi_iort_node *n=
ode,
> -                           u32 streamid)
> +static int iort_iommu_xlate(struct acpi_iort_node *node, u32 streamid,
> +                           void *info)
>  {
> +       struct device *dev =3D info;
>         const struct iommu_ops *ops;
>         struct fwnode_handle *iort_fwnode;
>
> @@ -1250,9 +1251,11 @@ static int iort_iommu_xlate(struct device *dev, st=
ruct acpi_iort_node *node,
>  struct iort_pci_alias_info {
>         struct device *dev;
>         struct acpi_iort_node *node;
> +       iort_for_each_fn fn;
> +       void *info;
>  };
>
> -static int iort_pci_iommu_init(struct pci_dev *pdev, u16 alias, void *da=
ta)
> +static int __for_each_pci_alias(struct pci_dev *pdev, u16 alias, void *d=
ata)
>  {
>         struct iort_pci_alias_info *info =3D data;
>         struct acpi_iort_node *parent;
> @@ -1260,7 +1263,7 @@ static int iort_pci_iommu_init(struct pci_dev *pdev=
, u16 alias, void *data)
>
>         parent =3D iort_node_map_id(info->node, alias, &streamid,
>                                   IORT_IOMMU_TYPE);
> -       return iort_iommu_xlate(info->dev, parent, streamid);
> +       return info->fn(parent, streamid, info->info);
>  }
>
>  static void iort_named_component_init(struct device *dev,
> @@ -1280,7 +1283,8 @@ static void iort_named_component_init(struct device=
 *dev,
>                 dev_warn(dev, "Could not add device properties\n");
>  }
>
> -static int iort_nc_iommu_map(struct device *dev, struct acpi_iort_node *=
node)
> +static int __for_each_platform(struct acpi_iort_node *node, iort_for_eac=
h_fn fn,
> +                              void *info)
>  {
>         struct acpi_iort_node *parent;
>         int err =3D -ENODEV, i =3D 0;
> @@ -1293,27 +1297,71 @@ static int iort_nc_iommu_map(struct device *dev, =
struct acpi_iort_node *node)
>                                                    i++);
>
>                 if (parent)
> -                       err =3D iort_iommu_xlate(dev, parent, streamid);
> +                       err =3D fn(parent, streamid, info);
>         } while (parent && !err);
>
>         return err;
>  }
>
> -static int iort_nc_iommu_map_id(struct device *dev,
> -                               struct acpi_iort_node *node,
> -                               const u32 *in_id)
> +int iort_iommu_for_each_id(struct device *dev, const u32 *id_in,
> +                          struct iort_params *params, iort_for_each_fn f=
n,
> +                          void *info)
>  {
> -       struct acpi_iort_node *parent;
> -       u32 streamid;
> +       struct acpi_iort_named_component *nc;
> +       struct acpi_iort_node *node;
> +       int err =3D -ENODEV;
>
> -       parent =3D iort_node_map_id(node, *in_id, &streamid, IORT_IOMMU_T=
YPE);
> -       if (parent)
> -               return iort_iommu_xlate(dev, parent, streamid);
> +       memset(params, 0, sizeof(*params));
> +       if (dev_is_pci(dev)) {
> +               struct pci_bus *bus =3D to_pci_dev(dev)->bus;
> +               struct iort_pci_alias_info pci_info =3D { .dev =3D dev,
> +                                                       .fn =3D fn,
> +                                                       .info =3D info };
>
> -       return -ENODEV;
> +               node =3D iort_scan_node(ACPI_IORT_NODE_PCI_ROOT_COMPLEX,
> +                                     iort_match_node_callback, &bus->dev=
);
> +               if (!node)
> +                       return -ENODEV;
> +
> +               pci_info.node =3D node;
> +               err =3D pci_for_each_dma_alias(to_pci_dev(dev),
> +                                            __for_each_pci_alias, &pci_i=
nfo);
> +
> +               if (iort_pci_rc_supports_ats(node))
> +                       params->pci_rc_ats =3D true;
> +               return 0;
> +       }
> +
> +       node =3D iort_scan_node(ACPI_IORT_NODE_NAMED_COMPONENT,
> +                             iort_match_node_callback, dev);
> +       if (!node)
> +               return -ENODEV;
> +
> +       if (id_in) {
> +               struct acpi_iort_node *parent;
> +               u32 streamid;
> +
> +               parent =3D iort_node_map_id(node, *id_in, &streamid,
> +                                         IORT_IOMMU_TYPE);
> +               if (!parent)
> +                       return -ENODEV;
> +               err =3D fn(parent, streamid, info);
> +       } else {
> +               err =3D __for_each_platform(node, fn, info);
> +       }
> +       if (err)
> +               return err;
> +
> +       nc =3D (struct acpi_iort_named_component *)node->node_data;
> +       params->pasid_num_bits =3D FIELD_GET(ACPI_IORT_NC_PASID_BITS,
> +                                               nc->node_flags);
> +       if (nc->node_flags & ACPI_IORT_NC_STALL_SUPPORTED)
> +               params->dma_can_stall =3D true;
> +
> +       iort_named_component_init(dev, node);
> +       return 0;
>  }
>
> -
>  /**
>   * iort_iommu_configure_id - Set-up IOMMU configuration for a device.
>   *
> @@ -1324,40 +1372,22 @@ static int iort_nc_iommu_map_id(struct device *de=
v,
>   */
>  int iort_iommu_configure_id(struct device *dev, const u32 *id_in)
>  {
> -       struct acpi_iort_node *node;
> -       int err =3D -ENODEV;
> +       struct iort_params params;
> +       int err;
>
> -       if (dev_is_pci(dev)) {
> +       err =3D iort_iommu_for_each_id(dev, id_in, &params, &iort_iommu_x=
late,
> +                                    dev);
> +       if (err)
> +               return err;
> +
> +       if (params.pci_rc_ats) {
>                 struct iommu_fwspec *fwspec;
> -               struct pci_bus *bus =3D to_pci_dev(dev)->bus;
> -               struct iort_pci_alias_info info =3D { .dev =3D dev };
> -
> -               node =3D iort_scan_node(ACPI_IORT_NODE_PCI_ROOT_COMPLEX,
> -                                     iort_match_node_callback, &bus->dev=
);
> -               if (!node)
> -                       return -ENODEV;
> -
> -               info.node =3D node;
> -               err =3D pci_for_each_dma_alias(to_pci_dev(dev),
> -                                            iort_pci_iommu_init, &info);
>
>                 fwspec =3D dev_iommu_fwspec_get(dev);
> -               if (fwspec && iort_pci_rc_supports_ats(node))
> +               if (fwspec)
>                         fwspec->flags |=3D IOMMU_FWSPEC_PCI_RC_ATS;
> -       } else {
> -               node =3D iort_scan_node(ACPI_IORT_NODE_NAMED_COMPONENT,
> -                                     iort_match_node_callback, dev);
> -               if (!node)
> -                       return -ENODEV;
> -
> -               err =3D id_in ? iort_nc_iommu_map_id(dev, node, id_in) :
> -                             iort_nc_iommu_map(dev, node);
> -
> -               if (!err)
> -                       iort_named_component_init(dev, node);
>         }
> -
> -       return err;
> +       return 0;
>  }
>
>  #else
> diff --git a/include/linux/acpi_iort.h b/include/linux/acpi_iort.h
> index 1cb65592c95dd3..5423abff9b6b09 100644
> --- a/include/linux/acpi_iort.h
> +++ b/include/linux/acpi_iort.h
> @@ -29,6 +29,18 @@ void iort_deregister_domain_token(int trans_id);
>  struct fwnode_handle *iort_find_domain_token(int trans_id);
>  int iort_pmsi_get_dev_id(struct device *dev, u32 *dev_id);
>
> +struct iort_params {
> +       unsigned int pasid_num_bits;
> +       bool dma_can_stall : 1;
> +       bool pci_rc_ats : 1;
> +};
> +
> +typedef int (*iort_for_each_fn)(struct acpi_iort_node *iommu, u32 stream=
id,
> +                               void *info);
> +int iort_iommu_for_each_id(struct device *dev, const u32 *id_in,
> +                          struct iort_params *params, iort_for_each_fn f=
n,
> +                          void *info);
> +
>  #ifdef CONFIG_ACPI_IORT
>  u32 iort_msi_map_id(struct device *dev, u32 id);
>  struct irq_domain *iort_get_device_domain(struct device *dev, u32 id,
> --
> 2.42.0
>

