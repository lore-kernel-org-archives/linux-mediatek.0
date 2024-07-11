Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B776CC3DA41
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jul 2024 14:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o3npd6EQvPKgtV4//EqEfrX3c75XqGVaZsV1QiKxfuw=; b=UTJIIopNyRAs7zrBXNHQE37bC0
	6TkobXQvXZoJK2GnhqiQFRPIhBCQcciMuGBL5aqYGHaRexHiy6LJnqIDDtbmNtwpimro3etZlyfQP
	nf78vGLj+BAozUtZS1lSehSotFX5ZqBMIP8dReP6X1dWN/AD3PWoo/gXOsIlMluVuDbLqndCNwhW/
	EJ38rjDEOvI2ht9dQa8FvS5k3WzvzenrVmSYX8njL7tAZnHTMEo4k9XKV4qfb9vXU/+r96+pRAl0K
	nJgOQi+cCgTUIzWaiovn8Zjta9akkfLh68ezhgseOLXnUmpmvqPvJxreFMcbU50qq3FEfGgKZ7SMa
	xJyNO0Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRuem-0000000EJsm-1Y1v;
	Thu, 11 Jul 2024 14:20:24 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRueT-0000000EJlO-2bMT
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Jul 2024 14:20:07 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5854ac817afso1223169a12.2
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Jul 2024 07:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720707603; x=1721312403; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o3npd6EQvPKgtV4//EqEfrX3c75XqGVaZsV1QiKxfuw=;
        b=FefwoaeyJqZfDf60lX6ryi21YoNK1qaL6pZVIwIkrH3Ja+Krz3+Cwocnk3Zfy69rvB
         uJNfZqppeqHdLrcVSKgFbvZt8i+ru/0Mmf96AwnNgHKZ7ZGPH5QGzwk/OmEQzELuFEgN
         hkSU2cDoIbnrktsp820HvSWBYUFMtdxckeh422c2WKgmURgoF+uLlcHfUHxzr1KOcuMk
         Jn6gjZCpz4lEbIRxMII1OLeHdtJrR3+cFacpFMG24v97JcZuGpjDa+VUXQn9By9CYvQ4
         WO/gFhZ0+aU8CDzuSIdUkChBHZXA20+wU1+6nfrHHfX+N1V1tTy9zoktQ9SM8L8zEn5i
         o1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720707603; x=1721312403;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o3npd6EQvPKgtV4//EqEfrX3c75XqGVaZsV1QiKxfuw=;
        b=KqBoZp2V8jz05ZLmX+Wlt5S/ulNlghaqME60sQp6GXlG+5LuCEmHQrGrByS+1njsw2
         p2KRkq84MrUA9YyGzk/LLa51a5i3xo753KRwfJlB45Or3oiUn5eYZLUTsMdAH9IQ5vfP
         E8UYezDockih/T8KII8JOGR/Y/Vbp0pCPnGHL3NIwr3aucnfX+ODUg+InCFR7zH1teQp
         kccsVXx5GbCpFOpkhvGk30SbGtlV8HQWWPSaDbwY1R8KNbNdq5IvnqIiZ1cNKY7E/TvW
         WAzmjaekR3ZCAjI9xop8bCgEyy8Iah6WVzKYxQNxkRgw/iN5z0NaNaby7wjVjUlDQsxr
         ys6w==
X-Forwarded-Encrypted: i=1; AJvYcCWEnMlGlmsqF24vRmDmSjJ1ZRtZkSKYhZ16vmN5HWX58e6bYVv24De9/hF8VrOc36vijeoBkcasjflXIm2IhK/JCS5hOejyBFBWTBsY2TwP6ON1
X-Gm-Message-State: AOJu0YwL5eK+52GqykK58pZGMUbpwKqRlnBuaL/GLj+PvTvOqMkGTX01
	luOvws8HqKhYevSi36o56WRJhksmWBr/oVMzoClRXOKr4V7mrpiHX4udRAQNCnTzqXow/wmjTMr
	7qTJBpVu9zq+xiZFCGcRa7HWd4yXIHt7SMg57pg==
X-Google-Smtp-Source: AGHT+IE5YvixzSQthswNAQ80xQ/qshZBUGeuPv0J87cnzFcQKMSwoY8hFu9XvKRCoFQLhJKzWznYERboE6rsk2B8lPk=
X-Received: by 2002:a05:6402:13d6:b0:58b:b864:ec77 with SMTP id
 4fb4d7f45d1cf-594bcab03a8mr7502600a12.39.1720707603305; Thu, 11 Jul 2024
 07:20:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240710084200.6561-1-shun-yi.wang@mediatek.com> <20240710084200.6561-2-shun-yi.wang@mediatek.com>
In-Reply-To: <20240710084200.6561-2-shun-yi.wang@mediatek.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 11 Jul 2024 08:19:52 -0600
Message-ID: <CANLsYkw8vanrYi0jvP+1jfZWrYBtTuXSJ5xywJYUDLhyRQUrWw@mail.gmail.com>
Subject: Re: [PATCH RFC 1/1] remoteproc: mediatek: Support reserved CMA regions
To: Shun-yi Wang <shun-yi.wang@mediatek.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, jason-ch.chen@mediatek.com, 
	yaya.chang@mediatek.com, teddy.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_072005_668774_7C9E585B 
X-CRM114-Status: GOOD (  24.57  )
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

On Wed, 10 Jul 2024 at 02:42, Shun-yi Wang <shun-yi.wang@mediatek.com> wrote:
>
> From: "shun-yi.wang" <shun-yi.wang@mediatek.com>
>
> In order to reserve specific Contiguous Memory Allocator (CMA) regions
> for hardware use. When the name of the reserved region contains "cma",
> then a corresponding CMA heap is added.
>
> Signed-off-by: shun-yi.wang <shun-yi.wang@mediatek.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 38 ++++++++++++++++++++++++++++--------
>  1 file changed, 30 insertions(+), 8 deletions(-)
>

I'm not sure what to do with this patch...  Is it a superset of your
other patch [1]?  And if so why is it labelled as an RFC?

Please read the documentation on submitting patches [2] and subscribe
to the remoteproc mailing list to give you an idea of the patch
workflow that is expected.

Thanks,
Mathieu

[1]. [PATCH 1/1] remoteproc: mediatek: Support multiple reserved memory regions
[2]. https://elixir.bootlin.com/linux/latest/source/Documentation/process/submitting-patches.rst

> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index e744c07507ee..ca0a4a52ece9 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -4,6 +4,7 @@
>
>  #include <asm/barrier.h>
>  #include <linux/clk.h>
> +#include <linux/dma-heap.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/err.h>
>  #include <linux/interrupt.h>
> @@ -1006,22 +1007,43 @@ EXPORT_SYMBOL_GPL(scp_mapping_dm_addr);
>
>  static int scp_map_memory_region(struct mtk_scp *scp)
>  {
> -       int ret;
> +       int ret, i, err;
>         const struct mtk_scp_sizes_data *scp_sizes;
> +       struct device_node *node = scp->dev->of_node;
> +       struct of_phandle_iterator it;
> +
> +       i = 0;
> +       of_for_each_phandle(&it, err, node, "memory-region", NULL, 0) {
> +               ret = of_reserved_mem_device_init_by_idx(scp->dev, node, i);
> +
> +               if (ret) {
> +                       dev_err(scp->dev, "failed to assign memory-region: %s\n",
> +                               it.node->name);
> +                       of_node_put(it.node);
> +                       return -ENOMEM;
> +               }
> +
> +#ifdef CONFIG_DMABUF_HEAPS_CMA
> +               if (strstr(it.node->name, "cma")) {
> +                       /* Reserved cma memory region */
> +                       ret = dma_heap_add_cma(scp->dev);
> +                       if (ret) {
> +                               dev_err(scp->dev, "Failed to add reserved cma");
> +                               of_node_put(it.node);
> +                               return ret;
> +                       }
> +               }
> +#endif /* CONFIG_DMABUF_HEAPS_CMA */
>
> -       ret = of_reserved_mem_device_init(scp->dev);
> +               i++;
> +       }
>
>         /* reserved memory is optional. */
> -       if (ret == -ENODEV) {
> +       if (!i) {
>                 dev_info(scp->dev, "skipping reserved memory initialization.");
>                 return 0;
>         }
>
> -       if (ret) {
> -               dev_err(scp->dev, "failed to assign memory-region: %d\n", ret);
> -               return -ENOMEM;
> -       }
> -
>         /* Reserved SCP code size */
>         scp_sizes = scp->data->scp_sizes;
>         scp->cpu_addr = dma_alloc_coherent(scp->dev, scp_sizes->max_dram_size,
> --
> 2.18.0
>

