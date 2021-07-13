Return-Path: <SRS0=Rt7e=MF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53FDFC07E95
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jul 2021 11:32:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 148B1611C0
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jul 2021 11:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 148B1611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:Cc:To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=XRGpBShXyKv+Hlsbd8vwESFmJALzo8jDT8zpjEfdYmo=; b=fupbVO/xljLC1eFRrtV/jmHnR/
	SiPZTdTj+Hsyn+xEoJHZ4sM8ZdQ0j1IlYPUooUWnphg2j9b4AUAKOHAorNvbjgPTSv+LJtkN35kff
	+1joWgk1/DUuFLRlGaFoOmwK1aeuDqpTSTGdfy1r5fb5/RGE9YyGev+lerXFLsqHLSSmIU5QZiljn
	ulAjln8cwVtrZaSvvxvAv7OqTxQFozuG9dPSDTvdgTSrHhwYixvknxRTsW9zNK8Z8OFfQbBcoSXL4
	DefW+BxAe/hBmabtFHHz5bcdcaaT7Vn0CyTVs7xFuqD7IVmCHA57sAUG5D7NE8kHEvzhWrhcnTE0k
	SLAMyifQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3Ged-00ADfy-KO; Tue, 13 Jul 2021 11:32:47 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3GeO-00ADPD-PJ; Tue, 13 Jul 2021 11:32:34 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso1369355wmh.4; 
 Tue, 13 Jul 2021 04:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VxdNMTgC7RTJI/82gSAHHxnwIsTXy+NvVdODaOq4tmU=;
 b=jbrgQaNivHHWkIhys33LFvPyuiYLHxbq70sxVdJgim8ewGwhZtO9FUjdIMTe+omB3s
 DAxzDDGIqKo0OQ4mC/0OzgOEqLh4pCc3mhTZQ70dyfup1z3oHLB+wvyqZZKTjynnOwUX
 uNjy5YwuC3Qhe1z6V0DKxCgWr+pJv5vjLLaboqX9Fl1VGs2cX27ipJqIQ0UluoCiMNDm
 h9sIW5o7je9YRHhbDIcAQoh+Jid5V0oKBpKlgTph0zoL6xzX/+RkXYwPO4s6+XbUXbck
 alJLAHgki3I65JeyuI0yJ+rbagfm1mc6OZPVt5QCANqVd+IEQxTCzzsFjJdbUnbAjh+G
 K90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VxdNMTgC7RTJI/82gSAHHxnwIsTXy+NvVdODaOq4tmU=;
 b=RmCF+MnfNpQmIyIaa9oBGoRv6z770C2PBNTpP64YzSGr8KFoOI58O5KuS5APiMQF5n
 Xe5uMRqmpizVikA4/NyH2jKOEo2a5akmYrDF75sSjDgFIdBQjacJkoxWHCIs4rnLiejH
 ZATI02wg1u/+Vyi7Ias62zTf7y9svL4fUgC9ccSwaVZ4+S0vmfvSHqESQS38UhPZgNAW
 jxXBBGDi1QXw469f5NAuEWrUgT2fq64Y9YaUwa0PDHCIMt3vFdAg772xt+YLXQpmkDvA
 DEwu5GQocW0OAVJUt9q4KU1AjeU+FtAnuwVPQ8V9jroDj/rXkfU4uR5ZlFb/fuL9CNLM
 yakw==
X-Gm-Message-State: AOAM532TIka6uk8Vz2+aKuS2/GpJ6hjDXQN6Tn21mUlBH0lHnIdVS7Wp
 4gOwFfERHpksYfMJg7iyoQ4=
X-Google-Smtp-Source: ABdhPJxiGPc++BzEpZlBMmV+XlyZZlbgyEGXgaNiGp0hI/Tv7hPRxDVW7mz937Gx9gR/Y6p1sdMtyg==
X-Received: by 2002:a7b:c042:: with SMTP id u2mr4495286wmc.86.1626175950253;
 Tue, 13 Jul 2021 04:32:30 -0700 (PDT)
Received: from ziggy.stardust ([213.195.127.100])
 by smtp.gmail.com with ESMTPSA id r16sm2056532wmg.11.2021.07.13.04.32.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 04:32:29 -0700 (PDT)
To: Chuanjia Liu <chuanjia.liu@mediatek.com>, lorenzo.pieralisi@arm.com,
 robh+dt@kernel.org, bhelgaas@google.com
Cc: ryder.lee@mediatek.com, jianjun.wang@mediatek.com, yong.wu@mediatek.com,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210611060902.12418-1-chuanjia.liu@mediatek.com>
 <20210611060902.12418-3-chuanjia.liu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v10 2/4] PCI: mediatek: Add new method to get shared
 pcie-cfg base address and parse node
Message-ID: <e462d9f0-2fa3-6106-f060-9753dc604b9f@gmail.com>
Date: Tue, 13 Jul 2021 13:32:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210611060902.12418-3-chuanjia.liu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_043232_879620_2347DC15 
X-CRM114-Status: GOOD (  21.42  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 11/06/2021 08:09, Chuanjia Liu wrote:
> For the new dts format, add a new method to get
> shared pcie-cfg base address and parse node.
> 
> Signed-off-by: Chuanjia Liu <chuanjia.liu@mediatek.com>
> Acked-by: Ryder Lee <ryder.lee@mediatek.com>

You missed the
Reviewed-by: Rob Herring <robh@kernel.org>
given in v8. Or were there any substantial changes in this patch?

> ---
>  drivers/pci/controller/pcie-mediatek.c | 52 +++++++++++++++++++-------
>  1 file changed, 39 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index 62a042e75d9a..950f577a2f44 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -14,6 +14,7 @@
>  #include <linux/irqchip/chained_irq.h>
>  #include <linux/irqdomain.h>
>  #include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/msi.h>
>  #include <linux/module.h>
>  #include <linux/of_address.h>
> @@ -23,6 +24,7 @@
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
>  #include <linux/reset.h>
>  
>  #include "../pci.h"
> @@ -207,6 +209,7 @@ struct mtk_pcie_port {
>   * struct mtk_pcie - PCIe host information
>   * @dev: pointer to PCIe device
>   * @base: IO mapped register base
> + * @cfg: IO mapped register map for PCIe config
>   * @free_ck: free-run reference clock
>   * @mem: non-prefetchable memory resource
>   * @ports: pointer to PCIe port information
> @@ -215,6 +218,7 @@ struct mtk_pcie_port {
>  struct mtk_pcie {
>  	struct device *dev;
>  	void __iomem *base;
> +	struct regmap *cfg;
>  	struct clk *free_ck;
>  
>  	struct list_head ports;
> @@ -650,7 +654,11 @@ static int mtk_pcie_setup_irq(struct mtk_pcie_port *port,
>  		return err;
>  	}
>  
> -	port->irq = platform_get_irq(pdev, port->slot);
> +	if (of_find_property(dev->of_node, "interrupt-names", NULL))
> +		port->irq = platform_get_irq_byname(pdev, "pcie_irq");
> +	else
> +		port->irq = platform_get_irq(pdev, port->slot);
> +

Do I understand that this is used for backwards compatibility with older DTS? I
just wonder why we don't need to mandate
interrupt-names = "pcie_irq"
in the binding description.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
