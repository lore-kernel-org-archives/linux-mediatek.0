Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4DBC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Mar 2023 16:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+NYT6/BKIUKBpZUikL9i2eT/s0p9j2M6TmaP9t/4zBo=; b=lv1imr7/ur3FZSVlU5niO293q9
	KafwzXfgKNIBby9kIM/F64cyuOs44LJCSqOoPDBXKcav8LVTmKYYppRGBmmi9QV7MEn6/8Fp7hjPg
	aqU5TehsLxwX1VTgowWDnd3izNIIueonlx7B4yC+u54qn9/m+rbtvHHtgK4O4nai4kUIagxcIM5rs
	Wv3jT+lwgt59v3uuW7w9iZ+Z8NFTwCiNWYCuQRzR1J1mv0JhnGO8vtJdWz9tUBP3ulLcPNoX8ZKM+
	/sAXDbr9EcEjB6IXpvSqiflOwo+H+XnzMbp/VIA5/5FEaIGRbXc8wMvZjPM0CupofUxyfUvv/suVl
	JVUVQhtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pefJB-00D9Ko-0p;
	Tue, 21 Mar 2023 16:58:01 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pefJ8-00D9JZ-0L;
	Tue, 21 Mar 2023 16:57:59 +0000
Received: by mail-oi1-f175.google.com with SMTP id w133so11630482oib.1;
        Tue, 21 Mar 2023 09:57:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679417876;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+NYT6/BKIUKBpZUikL9i2eT/s0p9j2M6TmaP9t/4zBo=;
        b=ho9WIuln2HEzf+TcZVQqBbfUa75P63BowlKQC9AGy0gLKgY+6MFviJKoDIWxrHgI96
         xdXgB/MM6SmcNzmIqMI5aZXAfuLFCGimQIa48UmQlRbmd81eaQxBnntMfCXzfN9P0rQj
         iQbSBZY4K738AaWSAPieJMyXHV7j5PEEsETRcFPMJo8xPjxBdsDgS3E17Nhf174vnvHe
         5YRwY/AvVoNuV1XYIUu0QyniG5twJjJv5I8iaggv2srUPvXrN1vR04l5QMT9YevZxFXa
         pHZhSjm+dNHOp2WViYY7po8PB5bfAxBr0l2JUy5w8ai3DdOLn75HedxRpSS9iasX3tYR
         g6fA==
X-Gm-Message-State: AO0yUKWRqD0YUXKYeIDKv+TFWRfhjOUiiLqRwkUvxrl5tynyr389hhTz
	iPOaO6l2pe/qkCuO8Q/uZA==
X-Google-Smtp-Source: AK7set88VFMo3gqa89T6gYa1MXGYZmfk0qMNlofc1ibiXSiDOEWA9mj49rVetrklI2BsjqBMuC9iNA==
X-Received: by 2002:a05:6808:688:b0:387:262c:ef4f with SMTP id k8-20020a056808068800b00387262cef4fmr1030253oig.0.1679417876421;
        Tue, 21 Mar 2023 09:57:56 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id a14-20020a9d6e8e000000b00670679748f9sm5404900otr.49.2023.03.21.09.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 09:57:56 -0700 (PDT)
Received: (nullmailer pid 950146 invoked by uid 1000);
	Tue, 21 Mar 2023 16:57:55 -0000
Date: Tue, 21 Mar 2023 11:57:55 -0500
From: Rob Herring <robh@kernel.org>
To: Jian Yang <jian.yang@mediatek.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Jianjun Wang <jianjun.wang@mediatek.com>, linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, chuanjia.liu@mediatek.com, jieyy.yang@mediatek.com, qizhong.cheng@mediatek.com
Subject: Re: [PATCH v2 2/2] PCI: mediatek-gen3: Add power and reset control
 feature for downstream component
Message-ID: <20230321165755.GA942823-robh@kernel.org>
References: <20230306064059.7239-1-jian.yang@mediatek.com>
 <20230306064059.7239-3-jian.yang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230306064059.7239-3-jian.yang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_095758_150045_A6F901C6 
X-CRM114-Status: GOOD (  17.93  )
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

On Mon, Mar 06, 2023 at 02:40:59PM +0800, Jian Yang wrote:
> From: "jian.yang" <jian.yang@mediatek.com>
> 
> Make MediaTek's controller driver capable of controlling power
> supplies and reset pin of a downstream component in power-on and
> power-off flow.
> 
> Some downstream components (e.g., a WIFI chip) may need an extra
> reset other than PERST# and their power supplies, depending on
> the requirements of platform, may need to controlled by their
> parent's driver. To meet the requirements described above, I add this
> feature to MediaTek's PCIe controller driver as a optional feature.

If you have PCI devices with extra stuff that's not standard PCI stuff 
(i.e. what's on a standard connector), then you should be describing 
the PCI device in the DT.

The standard stuff should really be in the root port node rather than 
the host bridge node. That's often omitted too because many host bridges 
only have a single root port.

> 
> Signed-off-by: jian.yang <jian.yang@mediatek.com>
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 86 ++++++++++++++++++++-
>  1 file changed, 85 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index b8612ce5f4d0..45e368b03ed2 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -8,6 +8,8 @@
>  
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> +#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/iopoll.h>
>  #include <linux/irq.h>
>  #include <linux/irqchip/chained_irq.h>
> @@ -15,11 +17,14 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/msi.h>
> +#include <linux/of_gpio.h>

This header is getting removed. You shouldn't depend on it.

Rob

