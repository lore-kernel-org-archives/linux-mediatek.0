Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E30ECAAD4
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 19:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DRojyyEkQJaI3ruqXF8PA7dAvzuh8TA99+WmvS2ccKU=; b=bLQOgtoEoD7LGbRdS/AuRTf3R0
	BXeoXbaONjGv4xQvr9IjGoEQCIWikahYznQTi+/bKMCKdNjEl330Zukkn3OWpHWdW/1VWX98bm8Ep
	NfU+STuKVpCIvMpXcL3xZvFs5xsloZ3NdA0qBSQWcHy+9o7QvqDP+FgIR0aTAWRHgXXHRK1MoSigT
	1WbW8VQVrqIWcba4EV/n+5noDJabACUdeP0wad+Uji4FGL9z69Hh/axg5XFjtMFi6+eLpwOJRWmU2
	eUQm6ycwWBzEWf5IHCmJiHT/o/C3rLviHhn6c3U6Vi9ESstCJFRTANqhgkNCAw445s9w00T3R/e1S
	o851k+Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSket-00CUst-IZ; Mon, 29 Aug 2022 19:42:55 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSkeq-00CUrl-Jp
	for linux-mediatek@lists.infradead.org; Mon, 29 Aug 2022 19:42:54 +0000
Received: by mail-pj1-x102d.google.com with SMTP id l5so5136308pjy.5
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Aug 2022 12:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=DRojyyEkQJaI3ruqXF8PA7dAvzuh8TA99+WmvS2ccKU=;
        b=brVaxPBLPju5jff8Pa4EVeXfGeOA9i5nUT87DXILuVueaT0W9QC8g08MaV43qdMLt0
         xdzv7YPwS6Ej+TFQAZmh8l/6gX8+G2XJ2GzP0H/vZaquWkB6ymcIBxY/Afg1FsytrXzX
         o5gbJ9ODI6Q3IGOXRCjKFqa0TvtZzEMKSXieCKU6tOeXe+8W20B+CHkaQpCfqHKeWBHj
         hHqF7WQhterfKsvpanzDK/PvEUMzp7lxtSeZY8Ps9ZPztTCNtx9XxeZmXL7MACAkuMfe
         wtive/YlA7RDrhk6/jJJ039P2HFEVIXJqhgRx2eF5apskE3YbhKuqGR63DdXcKQvL0E5
         jH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=DRojyyEkQJaI3ruqXF8PA7dAvzuh8TA99+WmvS2ccKU=;
        b=QbXoxBHqSKxM+ARlskiWtOAQqKlI/IOOhau214KIvGgDUJ9GJqnK1Hu7vf0vjkyysI
         Yk6y8ZlwCBhvhnJKk+ENtWwQcqhiqth1aS3LketBJT3S2bTU3HC7dua/RsGduWu/mFzl
         sc79+gY+XipnRAOfaNvmSI4UusVQKPwezSsBS03vSeMvQdOLeQOibDUgTTqLuf46LGWL
         TzV2xdbvFdSyA2nYI6eh91DxhbKgDfiROcQvh4bn28RGOTyNOuKzrJ9vlmWBCJD/wvAN
         wU7EHh7bluabprbt3Cq2VHVGmAABag/ANfMqEkuL4y1+qdIj9i/C/bjWY5C86dccK+8N
         aHZw==
X-Gm-Message-State: ACgBeo3bWDpP/Hpavl5cwiNgPyZTY8c1u9GyIAsGWS+iMzCB17q340Yv
	3HYOyvLctC4liiz3U1QCJ+cOfQ==
X-Google-Smtp-Source: AA6agR73dJ6zqJdEqwSre7rs9UMvyIM4SDNkPl6iDWE7C8VSfpk2HWHFiKxa7FMIROFlJaab1ETldg==
X-Received: by 2002:a17:902:f64f:b0:172:a790:320a with SMTP id m15-20020a170902f64f00b00172a790320amr17692944plg.149.1661802171623;
        Mon, 29 Aug 2022 12:42:51 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id a13-20020a170902b58d00b00172f4835f60sm7840088pls.189.2022.08.29.12.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 12:42:50 -0700 (PDT)
Date: Mon, 29 Aug 2022 13:42:47 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Lee Jones <lee.jones@linaro.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Prashant Malani <pmalani@chromium.org>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	weishunc@google.com
Subject: Re: [PATCH v2 4/9] remoteproc: mediatek: Support probing for the 2nd
 core of dual-core SCP
Message-ID: <20220829194247.GC2264818@p14s>
References: <20220608083553.8697-1-tinghan.shen@mediatek.com>
 <20220608083553.8697-5-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220608083553.8697-5-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_124252_740417_E3003216 
X-CRM114-Status: GOOD (  28.98  )
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

On Wed, Jun 08, 2022 at 04:35:48PM +0800, Tinghan Shen wrote:
> The mtk_scp.c driver only supports the single core SCP and the
> 1st core of a dual-core SCP. This patch extends it for the 2nd core.
> 
> MT8195 SCP is a dual-core MCU. Both cores are housed in the same subsys.

s/subsys/subsystem

> They have the same viewpoint of registers and memory.
> 
> Core 1 of the SCP features its own set of core configuration registers,
> interrupt controller, timers, and DMAs. The rest of the peripherals
> in this subsystem are shared by core 0 and core 1.
> 
> As for memory, core 1 has its own cache memory. the SCP SRAM is shared

/the/The

> by core 0 and core 1.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 3510c6d0bbc8..91b4aefde4ac 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -23,6 +23,10 @@
>  #define MAX_CODE_SIZE 0x500000
>  #define SECTION_NAME_IPI_BUFFER ".ipi_buffer"
>  
> +#define SCP_CORE_0 0
> +#define SCP_CORE_1 1
> +#define SCP_CORE_SINGLE 0xF
> +
>  /**
>   * scp_get() - get a reference to SCP.
>   *
> @@ -836,6 +840,7 @@ static int scp_probe(struct platform_device *pdev)
>  	struct resource *res;
>  	const char *fw_name = "scp.img";
>  	int ret, i;
> +	u32 core_id = SCP_CORE_SINGLE;
>  
>  	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
>  	if (ret < 0 && ret != -EINVAL)
> @@ -851,8 +856,16 @@ static int scp_probe(struct platform_device *pdev)
>  	scp->data = of_device_get_match_data(dev);
>  	platform_set_drvdata(pdev, scp);
>  
> +	ret = of_property_read_u32_index(dev->of_node, "mediatek,scp-core", 1, &core_id);
> +	if (ret == 0)
> +		dev_info(dev, "Boot SCP dual core %u\n", core_id);

Why is the DT property "mediatek,scp-core" needed at all?  Since the compatible
"mediatek,mt8195-scp-dual" has already been defined previously in this patchset,
initialising the second core, if present, is a matter of looking at the
compatile string. 

> +
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
> -	scp->sram_base = devm_ioremap_resource(dev, res);
> +	if (core_id == SCP_CORE_1)
> +		scp->sram_base = devm_ioremap(dev, res->start, resource_size(res));
> +	else
> +		scp->sram_base = devm_ioremap_resource(dev, res);
> +

This looks very broken...  For this to work you would need to have two DT
entries with the "mediatek,mt8195-scp-dual" compatible properly, one with
"mediatek,scp-core = <&scp_dual1 0>;" and another one with "mediatek,scp-core = <&scp_dual0 1>;".

Which is also very broken...  Here you have a binding whose first argument is a
reference to the core sibling while the second argument is a characteristic of
the current core, which is highly confusing.

I suggest what when you see the compatible binding "mediatek,mt8195-scp", a
single core is initialized.  If you see "mediatek,mt8195-scp-dual", both cores
are initialized as part of the _same_ probe.

If the above analysis is not correct it means I misinterpreted your
work and if so, a serious amount of comments is needed _and_ a very detailed
example in "mtk,scp.yaml" that leaves no room for interpretation.

I will stop reviewing this patchset until you have clarified how this works.

Thanks,
Mathieu

>  	if (IS_ERR(scp->sram_base))
>  		return dev_err_probe(dev, PTR_ERR(scp->sram_base),
>  				     "Failed to parse and map sram memory\n");
> @@ -873,7 +886,12 @@ static int scp_probe(struct platform_device *pdev)
>  		scp->l1tcm_phys = res->start;
>  	}
>  
> -	scp->reg_base = devm_platform_ioremap_resource_byname(pdev, "cfg");
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cfg");
> +	if (core_id == SCP_CORE_1)
> +		scp->reg_base = devm_ioremap(dev, res->start, resource_size(res));
> +	else
> +		scp->reg_base = devm_ioremap_resource(dev, res);
> +
>  	if (IS_ERR(scp->reg_base))
>  		return dev_err_probe(dev, PTR_ERR(scp->reg_base),
>  				     "Failed to parse and map cfg memory\n");
> -- 
> 2.18.0
> 

