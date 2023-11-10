Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9149C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Nov 2023 21:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZhcaUbufGGCGl+oelTC2ECkW5UU6FCUTDhDK/m2sCfs=; b=FX8GUbAu/7XDTleuqJeGVu6Fed
	YlPbpVc3PFxZ2yynM0vaWciW5PUiKU4SK6T5tKk6GM6ftw4peS6NTaj/tXQsoJNnsaWkugDqMQlQZ
	g6aQiO/e4aRgPPJafvRXW5VykkBQbsZ/B906WNupl7S7K96dCbh0Lko4Nlc+SCThOPLgNNoJNJCEM
	wDXs8J/RhAmMCctTdifhDKluLPJ6WEnM68nlkCIBoTjy5Cta1guHr3m8VJRlKWginu9jdjKBo5Fiq
	jn/HOdRUDmjx4vt4N3MC5givSdy68FPwxnDm+Wzu4j2KlVnuR3xyF5iG9wGJgYXSr2/HkzXsLk8YH
	tCEKCsgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Yiu-009SAV-38;
	Fri, 10 Nov 2023 21:07:28 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Yir-009S99-2i;
	Fri, 10 Nov 2023 21:07:27 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1f03d9ad89fso1292453fac.1;
        Fri, 10 Nov 2023 13:07:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699650438; x=1700255238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZhcaUbufGGCGl+oelTC2ECkW5UU6FCUTDhDK/m2sCfs=;
        b=VH6gTpl2ys7e8Smrhc7qtMnm7hUHYsvZQ+AbnI4s409SBk/Gt4WHQ48ieMCB3iWid/
         vH6yRwoUS6Ft6jv2Fdxxs/haUHNtRSLofA+Zj5rGRB2Wql8Pez5HmQGnNHVHI2y6ok2/
         6kq+buigbRG8cEa/Wki1vz1ZETKhWb0wXh7kCj/dNJmj6BV949K5fXvy5GYumARPEbBT
         c+bKWJCBqMpbtgEK58R4C2Ae0bcrknR1zCr3FjR2T11oI3gEO5nQIbTT9bJS2+iCNuHF
         nCHwqPoAAcxw0W7QiSfsEgDtdIgcIC4RlQTPqk2WNXnEuHO0Vy/zQVQHLuTqmTu/BbMI
         2GWA==
X-Gm-Message-State: AOJu0YyCta/tjq8JKCGAtSs76oN6JCWgjekNUZ5eK4SQRczJ3GqZ66dR
	WUTEwLvYnVKb+y5b6KAGcg==
X-Google-Smtp-Source: AGHT+IEQ7c/sxZ5ogUqRUDBd0ii59Sbjxux7vfokGIfN/0AadRuyYuXRaQGnZx2kQuCJ3B3CfRxsGA==
X-Received: by 2002:a05:6870:2b13:b0:1ef:b809:3f26 with SMTP id ld19-20020a0568702b1300b001efb8093f26mr476789oab.17.1699650438610;
        Fri, 10 Nov 2023 13:07:18 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e5-20020a056870920500b001e9b02b00e9sm67574oaf.22.2023.11.10.13.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 13:07:18 -0800 (PST)
Received: (nullmailer pid 434762 invoked by uid 1000);
	Fri, 10 Nov 2023 21:07:16 -0000
Date: Fri, 10 Nov 2023 15:07:16 -0600
From: Rob Herring <robh@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, andriy.shevchenko@linux.intel.com, Jiri Kosina <jikos@kernel.org>, linus.walleij@linaro.org, broonie@kernel.org, gregkh@linuxfoundation.org, hdegoede@redhat.com, james.clark@arm.com, james@equiv.tech, keescook@chromium.org, petr.tesarik.ext@huawei.com, rafael@kernel.org, tglx@linutronix.de, Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>
Subject: Re: [RFC PATCH v2 5/7] of: hw_prober: Support Chromebook SKU ID
 based component selection
Message-ID: <20231110210716.GB419831-robh@kernel.org>
References: <20231109100606.1245545-1-wenst@chromium.org>
 <20231109100606.1245545-6-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231109100606.1245545-6-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_130725_880577_4AECD843 
X-CRM114-Status: GOOD (  23.43  )
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

On Thu, Nov 09, 2023 at 06:06:02PM +0800, Chen-Yu Tsai wrote:
> In cases where the same Chromebook model is manufactured with different
> components (MIPI DSI panels, MIPI CSI camera sensors, or trackpad /
> touchscreens with conflicting addresses), a different SKU ID is
> allocated to each specific combination. This SKU ID is exported by the
> bootloader into the device tree, and can be used to "discover" which
> combination is present on the current machine.
> 
> This change adds a hardware prober that will match the SKU ID against
> a provided table, and enable the component for the matched entry based
> on the given compatible string. In the MIPI DSI panel and MIPI CSI
> camera sensor cases which have OF graphs, it will also update the
> remote endpoint to point to the enabled component. This assumes a single
> endpoint only.
> 
> This will provide a path to reducing the number of Chromebook device
> trees.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/of/hw_prober.c | 160 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 160 insertions(+)

This certainly does not belong in drivers/of/.


> diff --git a/drivers/of/hw_prober.c b/drivers/of/hw_prober.c
> index 442da6eff896..4345e5aed6d8 100644
> --- a/drivers/of/hw_prober.c
> +++ b/drivers/of/hw_prober.c
> @@ -8,6 +8,7 @@
>  #include <linux/array_size.h>
>  #include <linux/i2c.h>
>  #include <linux/of.h>
> +#include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  
>  #define DRV_NAME	"hw_prober"
> @@ -108,9 +109,168 @@ static int i2c_component_prober(struct platform_device *pdev, const void *data)
>  	return ret;
>  }
>  
> +static int cros_get_coreboot_sku_id(struct device *dev, u32 *sku_id)
> +{
> +	struct device_node *node = NULL;
> +	int ret;
> +
> +	node = of_find_node_by_path("/firmware/coreboot");
> +	if (!node)
> +		return dev_err_probe(dev, -EINVAL, "Cannot find coreboot firmware node\n");
> +
> +	ret = of_property_read_u32(node, "sku-id", sku_id);

Not documented.

Rob

