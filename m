Return-Path: <SRS0=2T+p=G6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA4F0C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 19:07:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FDA960C40
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 19:07:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FDA960C40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MwVvrlVKGh2HBy7q5F1ExNE2m+ojhUNGXkYl3UyGYEE=; b=F05cUYqz9PkhcC2NsHpJdH02X
	xGK7MRTCu9shhO7BivEIbPhGFGIGWiZuv3mCrmqxCt6bmdPmR5ko4Fb5E/EgQqxzO3kHxO/KZ2bjT
	QAs/u4BnVBG1z1H0GmcDQgzJroVaR3xdeyNQ1kPZ03N8ibR64FRsehPxGa9nK8I7uLe6g7nApHljL
	YjMEuW6m7etswW8AnNbxAhOSmXNzFCfeJ7lI4AoEn3Tyfp2AwrlRO+iBhLCT/1bT3ds+jUEx1myU0
	9BoD04siGkQF4ILuPrQNHbXjaigl8WTyqvuQWcPZbusXNy4oxC1ValNbG8VETumeWf3UF7pWqutgZ
	LlnzkMh8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4q9w-0007rA-SD; Wed, 27 Jan 2021 19:07:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4q9t-0007qY-GG; Wed, 27 Jan 2021 19:07:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C8D964DBF;
 Wed, 27 Jan 2021 19:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611774435;
 bh=+2fq9fqcnJYIGiasm2Y78NeRv8I7YIdMcOI8TxM795s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YhRvfHT6RV1BMZil1zdzFYbHrjCJm7nZH8PN85tJkCvVMFjd6eDbEasUTop/t+LPD
 +og8JbTEYZzAi04vEHfuIFInmDsmd231LW3n5RVJFYyM6vY3hmYrtWNfd8A82XdX6m
 DjpPaS8pSa/DuHZYs6mKcfXHpOXTTFE56zyLkjQntGO4C+hsC0Ykvmz47tpeTx/84l
 zXaW1LY6a8F7/TYczF+XBpza56l2dKK/8HzbEQZeM6w1bYXSP9+Xt5hPZiwG5xTEFf
 wAw/S9OAFRpNo71WJjOFETco8uFIl0z2ETgQOd81ch+lFz7xSSy2QicZgzOBZ8Zlq9
 XFs7hqikGgclQ==
Received: by mail-ej1-f46.google.com with SMTP id hs11so4232891ejc.1;
 Wed, 27 Jan 2021 11:07:15 -0800 (PST)
X-Gm-Message-State: AOAM531IrWNXcKMNvtk3pSOYUT70aPOzcd1oH94VhY6blA2NfM7j1an0
 p+6cc0mlvyDhwOHzrFM+SvEvoBtEuMOSCDfTyA==
X-Google-Smtp-Source: ABdhPJwZ642wt52ernlRSW6Ok++wbRCAdfK+zZt0YWbSRLkd8I/BHIp2pHEsvorc0aidjP5dLvbM2BPXjvTf/vQ2vrY=
X-Received: by 2002:a17:906:c9d8:: with SMTP id
 hk24mr8285418ejb.468.1611774433585; 
 Wed, 27 Jan 2021 11:07:13 -0800 (PST)
MIME-Version: 1.0
References: <20210119105203.15530-1-yong.wu@mediatek.com>
In-Reply-To: <20210119105203.15530-1-yong.wu@mediatek.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 27 Jan 2021 13:07:01 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJB=MMeMobznBiAUihJLBt5aeiiL+AtDWh6tajePu=Now@mail.gmail.com>
Message-ID: <CAL_JsqJB=MMeMobznBiAUihJLBt5aeiiL+AtDWh6tajePu=Now@mail.gmail.com>
Subject: Re: [PATCH v2] of/device: Update dma_range_map only when dev has
 valid dma-ranges
To: Yong Wu <yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_140717_674550_CBAD9B68 
X-CRM114-Status: GOOD (  20.75  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Frank Rowand <frowand.list@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Tomasz Figa <tfiga@google.com>, Linux IOMMU <iommu@lists.linux-foundation.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jan 19, 2021 at 4:52 AM Yong Wu <yong.wu@mediatek.com> wrote:
>
> The commit e0d072782c73 ("dma-mapping: introduce DMA range map,
> supplanting dma_pfn_offset") always update dma_range_map even though it was
> already set, like in the sunxi_mbus driver. the issue is reported at [1].
> This patch avoid this(Updating it only when dev has valid dma-ranges).

only when dev *doesn't* have valid dma-ranges?

> Meanwhile, dma_range_map contains the devices' dma_ranges information,
> This patch moves dma_range_map before of_iommu_configure. The iommu
> driver may need to know the dma_address requirements of its iommu
> consumer devices.
>
> [1] https://lore.kernel.org/linux-arm-kernel/5c7946f3-b56e-da00-a750-be097c7ceb32@arm.com/
>
> CC: Rob Herring <robh+dt@kernel.org>
> CC: Frank Rowand <frowand.list@gmail.com>
> Fixes: e0d072782c73 ("dma-mapping: introduce DMA range map, supplanting dma_pfn_offset"),
> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/of/device.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/of/device.c b/drivers/of/device.c
> index aedfaaafd3e7..1122daa8e273 100644
> --- a/drivers/of/device.c
> +++ b/drivers/of/device.c
> @@ -162,9 +162,11 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
>         mask = DMA_BIT_MASK(ilog2(end) + 1);
>         dev->coherent_dma_mask &= mask;
>         *dev->dma_mask &= mask;
> -       /* ...but only set bus limit if we found valid dma-ranges earlier */
> -       if (!ret)
> +       /* ...but only set bus limit and range map if we found valid dma-ranges earlier */
> +       if (!ret) {
>                 dev->bus_dma_limit = end;
> +               dev->dma_range_map = map;
> +       }
>
>         coherent = of_dma_is_coherent(np);
>         dev_dbg(dev, "device is%sdma coherent\n",
> @@ -172,6 +174,9 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
>
>         iommu = of_iommu_configure(dev, np, id);
>         if (PTR_ERR(iommu) == -EPROBE_DEFER) {
> +               /* Don't touch range map if it wasn't set from a valid dma-ranges */
> +               if (!ret)
> +                       dev->dma_range_map = NULL;
>                 kfree(map);
>                 return -EPROBE_DEFER;
>         }
> @@ -181,7 +186,6 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
>
>         arch_setup_dma_ops(dev, dma_start, size, iommu, coherent);
>
> -       dev->dma_range_map = map;
>         return 0;
>  }
>  EXPORT_SYMBOL_GPL(of_dma_configure_id);
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
