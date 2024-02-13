Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E129C48260
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Feb 2024 15:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZnXQ4qxGwQr7q5GWes7/A5mpaC/moLlsxNk7QmOMeyM=; b=CRkfozqPUDQLi9tjw1wNKMHnVd
	Mg3lhKkr44IwKZep+Luhavvo+nvFibIT6XrmRo/RybW59rMFxeXSEXSjCfs6rKsxLeX5UgCCCN81z
	l9becAZwTQOcU0Og+rKWsukydYhODGmZIjKwKRGoJ2FFNxYigSfM/g/eGEZ9hm8dNpIXy2RplcI23
	ojWcO0EB+3gF8PPM5hLucGSGwdhrZjzC/bP6yU612H4b3CaInv+8rXEe3msvfEQjHLXSD1/cRbzKI
	RzYX9nKkFWrnL8mzVpalHAcPXV0K3Vpy3s3CztsK7vpfz8+j2ojn0vj9wnRvT74UAgAvlrJvlPp1N
	phhxyoGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZurW-00000009mf3-1irH;
	Tue, 13 Feb 2024 15:38:22 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZurT-00000009mde-3YVk
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Feb 2024 15:38:21 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a26f73732c5so627402366b.3
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Feb 2024 07:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707838698; x=1708443498; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZnXQ4qxGwQr7q5GWes7/A5mpaC/moLlsxNk7QmOMeyM=;
        b=PT18dEthgq1LQsFVsaRbOlhSPUDwU3/4Eju1RYkG0e9MN4HdVB4nEfKTZ11cp+hSzS
         7fQeW7IrH0m6EWzWg304tQJHplgC5GdRq+pRODVlIHoWlw6INSWeDjMjwBRpr23Jnl19
         JF2MHkNAMr1f69MCPLE0S1ZtAuN1xpnbJoh25iVFsO7cMBSU8To96/vsZdnjoj3Lpj6y
         az42dxQqBzm4up9FUZxNLIRryuxARq4KYPqjOExCuGnWS//thldlyPxm7xUXmMldKWxC
         +OAf39/hazW6fkoZlDIJzAiLz1Ft7VHmCi/w0baEhEjyv63KECKJv7HP6AyW5702+fRG
         FA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707838698; x=1708443498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnXQ4qxGwQr7q5GWes7/A5mpaC/moLlsxNk7QmOMeyM=;
        b=NNih48rhg1yQ4wBwVd9gUa4U6pNofsebS5pD9oRtPrbMxPBzWD4vD4TLOgtDpVD24x
         +8eicadOnhNhnibzmL1kRnkt54M+riPBTp18NCfoeGDvcv5dFHivMNJgfZgoZoxief93
         FPsf1Nvw/6DWzb1m47lrSa9me/uML5kNnxeae3bQyea43WGz/1tLHjbF3qKZWJdAv5YS
         Gj0N09LPeRCq1fGeic1pl6vttF2Fy1YWUoIEGAIWCDOWowtk3ZK50lHnKzaF8rfLgpRb
         KkDfvsFk5WW8t+ThGq4GV3ZgT1IYbpC0oobG27N2p3nMLSCsl2xzTbTXr9RzB7BAGImx
         kLww==
X-Forwarded-Encrypted: i=1; AJvYcCX886GSrQGOVg6t6qUVvVRE42OdiO6eI5K8GZAcRjalfIaymR/3iw9i/xf45GklAy+/jjmHyysv8s40ml7Dpwz8EQ9YhEauWUQnHjB2YOLdt8hu
X-Gm-Message-State: AOJu0YxXqXk8m1CJ9/hYeNdcP1GopkBYWuDP93DrwEiLR3Ckcecl0O1w
	j4VO5urCa79HjfCN2yskUbnuYK7TLLZAY/STRQUiSRl31EBdS89c44NKmRNtskM=
X-Google-Smtp-Source: AGHT+IFQPTEKE8GIeujTWJ+O7gJLgC7eeIg5F4CoqdCggtkdMtrG1xNaY7Am/TaD9442Xsd9gV9GdQ==
X-Received: by 2002:a17:906:80d8:b0:a3c:d7a3:2eb5 with SMTP id a24-20020a17090680d800b00a3cd7a32eb5mr3320186ejx.13.1707838697905;
        Tue, 13 Feb 2024 07:38:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV/Jt54FkQUGvaJcgjM5EAn1v2bu/9jkN1Lj7ipBbd8b7vQr9GOqVEmhmnkf4cbsGZpY1XTQRUPRjPzVJOIuhUBC4O5pfQ8AsFP79gtsrG24IdttNeH8rAjoyrCJFXr6DOcwI/BkBKh4ORs4E48oXm2HjaNdLOENfJE5ZYRYsSoNWLi2Ndnfzng0SgaWdxjnkUdLb9HtTYLs+EXVJL5n+NyFJcW+/nvh0+a1f6Lk2w48tyDDCbIU75Bw1S8ASIMpdgmOUO14ndWZz8J8F9f0aQtQyJ2CT/DKqdevCXGcnvY1DEBXR7Zbicfpl2CpoEn5hMIjP9smT30sVxkLv4Zo1o8ZN5zuQasvrazBLjVfoWfiMYveQ77MIxTJYnw2Cq7qRM0PovQZ4Z/+chjXR//XwB68d+7WucPhdqEDfr8m6bkIy8VMs0JCDHTsxjZl3yt4oBYgBb4pxt2f4UK27GzOxGGmPRq
Received: from linaro.org ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id tx9-20020a1709078e8900b00a3d23a4e8fdsm169762ejc.90.2024.02.13.07.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 07:38:17 -0800 (PST)
Date: Tue, 13 Feb 2024 17:38:16 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RFC v2] spmi: pmic-arb: Add support for multiple buses
Message-ID: <ZcuM6ChFFN6pIlrf@linaro.org>
References: <20240213-spmi-multi-master-support-v2-1-b3b102326906@linaro.org>
 <3fcb9f16-61f8-4544-a319-20496d5eb106@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fcb9f16-61f8-4544-a319-20496d5eb106@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_073819_931158_7E80E7B4 
X-CRM114-Status: GOOD (  36.78  )
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

On 24-02-13 15:55:56, Neil Armstrong wrote:
> On 13/02/2024 15:41, Abel Vesa wrote:
> > The v7 HW supports currently 2 buses. So register each bus as a separate
> > spmi controller and adapt all ops to use the bus instead of the
> > arbitrator. Legacy mode is still supported as long as there is no child
> > node that represents a bus, instead all nodes are expected to be actual
> > slave devices.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> > Changes in v2:
> > - Reworked it so that it registers a spmi controller for each bus
> >    rather than relying on the generic framework to pass on the bus
> >    (master) id.
> 
> Thanks, I think this is better.
> 
> > - Link to v1: https://lore.kernel.org/r/20240207-spmi-multi-master-support-v1-0-ce57f301c7fd@linaro.org
> > ---
> >   drivers/spmi/spmi-pmic-arb.c | 950 ++++++++++++++++++++++++++-----------------
> >   1 file changed, 585 insertions(+), 365 deletions(-)
> > 
> > diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
> > index 9ed1180fe31f..eced35b712b4 100644
> > --- a/drivers/spmi/spmi-pmic-arb.c
> > +++ b/drivers/spmi/spmi-pmic-arb.c
> 
> <snip>
> 
> 
> > +static int spmi_pmic_arb_bus_init(struct platform_device *pdev,
> > +				  struct device_node *node,
> > +				  struct spmi_pmic_arb *pmic_arb)
> > +{
> > +	int bus_index = pmic_arb->buses_available;
> > +	struct spmi_pmic_arb_bus *bus = &pmic_arb->buses[bus_index];
> > +	struct device *dev = &pdev->dev;
> > +	struct spmi_controller *ctrl;
> > +	void __iomem *intr;
> > +	void __iomem *cnfg;
> > +	int index, ret;
> > +	u32 irq;
> > +
> > +	ctrl = devm_spmi_controller_alloc(dev, sizeof(*ctrl));
> > +	if (IS_ERR(ctrl))
> > +		return PTR_ERR(ctrl);
> > +
> > +	ctrl->cmd = pmic_arb_cmd;
> > +	ctrl->read_cmd = pmic_arb_read_cmd;
> > +	ctrl->write_cmd = pmic_arb_write_cmd;
> > +
> > +	bus = spmi_controller_get_drvdata(ctrl);
> > +	bus->spmic = ctrl;
> > +
> > +	bus->ppid_to_apid = devm_kcalloc(dev, PMIC_ARB_MAX_PPID,
> > +					 sizeof(*bus->ppid_to_apid),
> > +					 GFP_KERNEL);
> > +	if (!bus->ppid_to_apid)
> > +		return -ENOMEM;
> > +
> > +	bus->apid_data = devm_kcalloc(dev, pmic_arb->max_periphs,
> > +				      sizeof(*bus->apid_data),
> > +				      GFP_KERNEL);
> > +	if (!bus->apid_data)
> > +		return -ENOMEM;
> > +
> > +	/* Optional property for v7: */
> > +	of_property_read_u32(node, "qcom,bus-id", &bus_index);
> 
> Not sure what bindings you plan to use, but this should be the reg property.
> 

This is already part of the old bindings (and implementation) and it's
only used for cases where some platforms would have two separate DT
nodes (one for each bus, v7 only) as it would specify which bus id it
is.

None of the upstream platforms use the qcom,bus-id with any other value
than 0, currently.

TBH, I think it should be dropped entirely.

Also, just realized that if any platforms is using two separate
controller nodes for each bus, this new approach will break the second
instance as it will expect the qcom,bus-id value to still be 0.

> > +	if (bus_index != pmic_arb->buses_available) {
> > +		dev_err(dev, "wrong bus-id value");
> > +		return -EINVAL;
> > +	}
> > +
> > +	index = of_property_match_string(node, "reg-names", "cnfg");
> > +	if (index < 0) {
> > +		dev_err(dev, "cnfg reg region missing");
> > +		return -EINVAL;
> > +	}
> > +
> > +	cnfg = devm_of_iomap(dev, node, index, NULL);
> > +	if (IS_ERR(cnfg))
> > +		return PTR_ERR(cnfg);
> > +
> > +	index = of_property_match_string(node, "reg-names", "intr");
> > +	if (index < 0) {
> > +		dev_err(dev, "intr reg region missing");
> > +		return -EINVAL;
> > +	}
> > +
> > +	intr = devm_of_iomap(dev, node, index, NULL);
> > +	if (IS_ERR(intr))
> > +		return PTR_ERR(intr);
> > +
> > +	irq = of_irq_get_byname(node, "periph_irq");
> > +	if (irq < 0)
> > +		return irq;
> > +
> > +	bus->pmic_arb = pmic_arb;
> > +	bus->intr = intr;
> > +	bus->cnfg = cnfg;
> > +	bus->irq = irq;
> > +	bus->id = bus_index;
> > +
> > +	ret = pmic_arb->ver_ops->init_apid(bus, index);
> > +	if (ret)
> > +		return ret;
> > +
> > +	dev_dbg(&pdev->dev, "adding irq domain for bus %d\n", bus_index);
> > +
> > +	bus->domain = irq_domain_add_tree(dev->of_node,
> > +					  &pmic_arb_irq_domain_ops, bus);
> > +	if (!bus->domain) {
> > +		dev_err(&pdev->dev, "unable to create irq_domain\n");
> > +		return -ENOMEM;
> > +	}
> > +
> > +	irq_set_chained_handler_and_data(bus->irq,
> > +					 pmic_arb_chained_irq, bus);
> > +
> > +	bus->spmic->dev.of_node = node;
> > +	dev_set_name(&bus->spmic->dev, "spmi-%d", bus_index);
> > +
> > +	ret = devm_spmi_controller_add(dev, bus->spmic);
> > +	if (ret)
> > +		return ret;
> > +
> > +	pmic_arb->buses_available++;
> > +
> > +	return 0;
> > +}
> > +
> > +static int spmi_pmic_arb_register_buses(struct spmi_pmic_arb *pmic_arb,
> > +					struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct device_node *node = dev->of_node;
> > +	struct device_node *child;
> > +	int ret;
> > +
> > +	for_each_available_child_of_node(node, child)
> > +		if (of_node_name_eq(child, "bus")) {
> 
> It seems you use "bus" subnodes, it seems you should also submit a new
> bindings scheme for v7 controllers with subnodes

Yep, will do that.

> 
> > +			ret = spmi_pmic_arb_bus_init(pdev, child, pmic_arb);
> > +			if (ret)
> > +				return ret;
> > +		}
> > +
> > +	if (!pmic_arb->buses_available)
> > +		ret = spmi_pmic_arb_bus_init(pdev, node, pmic_arb);
> > +
> > +	return ret;
> > +}
> > +
> > +static void spmi_pmic_arb_deregister_buses(struct spmi_pmic_arb *pmic_arb)
> > +{
> > +	int i;
> > +
> > +	for (i = 0; i < pmic_arb->buses_available; i++) {
> > +		struct spmi_pmic_arb_bus *bus = &pmic_arb->buses[i];
> > +
> > +		irq_set_chained_handler_and_data(bus->irq,
> > +						 NULL, NULL);
> > +		irq_domain_remove(bus->domain);
> > +	}
> > +}
> > +
> 
> <snip>
> 
> Overall the patch is __huge__, could you split it ? Like move the bus handling
> then add the multi-bus support in separate patches ?

Sure thing.

> 
> But first please add new bindings first so we know what you expect from DT.

Yep, will add another example to the existing bindings schema.

> 
> Thanks,
> Neil
> 
> > 
> > ---
> > base-commit: 445a555e0623387fa9b94e68e61681717e70200a
> > change-id: 20240207-spmi-multi-master-support-832a704b779b
> > 
> > Best regards,
> 

