Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9012AC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 May 2022 09:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=btQN6NX3hQu/ELUqa483anPJrsHRTcsDl2bo/ZV71Q8=; b=YhcJ1Br+wtWB5R
	20PQPThoFXqWD5u5zMsCA5gqGT8YeajISMcPN6HJ26JaK6KEHAQSzNyG+sOVs+BlvHg9HMInARS+Z
	xPHdGP92PLM+SJk4rOTp/QskeP3imkXvk/kY5Qj1LzfO+88T0rKM3YhqQnUIztBKavsBxO/CS2Dnq
	IMv761wbE/BfJwEci1WSL+JI6fNhTCkdAafMJdqDU6w75nrjoBlKv7v4i5Zf5Gbp281Ttm/rBSLtv
	1Ap+FhYtb/D31kRTQDCa+MOstNWCbBzXxpWNNQoA8Ys46gjWSoL0yMAxAkIl+ZFjnRHgWeCDfRWiL
	efvS3MnttimhuCiUfCtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nusc1-001pNT-W2; Sat, 28 May 2022 09:19:58 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nusbq-001pLN-8j; Sat, 28 May 2022 09:19:47 +0000
Received: by mail-pj1-x1036.google.com with SMTP id z11so6596951pjc.3;
        Sat, 28 May 2022 02:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=qyK+J/hMtuTUruA03PI6DqGG/StA1icCX4LUIGhocgc=;
        b=qH8W6PWPfinC6W1dsB4Sh5n9Avx4kcrU4u9XphkM2vutqAIZIZfuxvSgEku6RuyGUH
         xOsWr5B0fZM8kd/Eyvujie2EKIuzLNSvPL4su90pOnHxFOjEO2H+GvM31W5sps0oh+6n
         d7iDS3eoURZkBgQy/jIwy6CmdOQzQ8cy4jM50sBNNrO94vuz9img9JYhu3hlHHYe7In7
         9QanKQQDiRaZme05dowaMoHM/gXt1IbuU/YCXEfGGndC17K6Cs4tH14v6H0IyslLkThB
         BFH6/y/UyDRBfFU98RUxJy9LYGwIWObnh7sErMYOv+x48u8/U83Vf557WibMsF6K5g0M
         EU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qyK+J/hMtuTUruA03PI6DqGG/StA1icCX4LUIGhocgc=;
        b=Kb9Tou37aW6ZHseP4cn7c6yLH/Q8ZWVnh0KIxARUbh340oIBVJEmRYSvd9VHFdVoic
         qwFF9hnjav4hxsWImB3SQRLLUbLKBKFcTc33nveg6JypgVZiv97PGzIoi0UV6T9Gv87R
         YRXio1X4fokNy0zZmoMHUgWAxusOnZBASRuF9TZe/BqKi2JK25yEXiHhuEnwcm6QkyvV
         NiVIT+/sg6FLo3lHR/opQzF4KcwlVwLhfoDLSFLQgocuH11FnFpzU3E6Wr9urByYJA3H
         VNjqsdZx0uSksFwAB+nFRp9kXyYXp79JveurKug1H5INcX3jYO/g/EKRXaLX3hZ9AxJM
         S0yw==
X-Gm-Message-State: AOAM533N6GDqij87sw5+d1I1HjkQBcwDi6n6XA/h51qk1YcdoYNiDGHt
	sk8yZ8M3WLU8A73gUhBD4TA=
X-Google-Smtp-Source: ABdhPJz8YrzZDOOQcB3GYgrLZBT1lADYS4fKl4Nj0eDpS1sI6mRcXpUiCWa3V+ND/KF5ciK8FwKHEA==
X-Received: by 2002:a17:90b:314b:b0:1e0:5517:1730 with SMTP id ip11-20020a17090b314b00b001e055171730mr12521555pjb.57.1653729584100;
        Sat, 28 May 2022 02:19:44 -0700 (PDT)
Received: from [172.16.4.4] ([219.142.146.208])
        by smtp.gmail.com with ESMTPSA id b8-20020a170903228800b001639e80eb55sm2742984plh.139.2022.05.28.02.19.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 May 2022 02:19:43 -0700 (PDT)
Message-ID: <bd03ca71-1875-2e94-8040-533034f76ee5@gmail.com>
Date: Sat, 28 May 2022 17:19:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] PCI: mediatek-gen3: Fix refcount leak in
 mtk_pcie_init_irq_domains
Content-Language: en-US
To: Miles Chen <miles.chen@mediatek.com>
Cc: bhelgaas@google.com, jianjun.wang@mediatek.com, kw@linux.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
 lorenzo.pieralisi@arm.com, matthias.bgg@gmail.com, maz@kernel.org,
 robh@kernel.org, ryder.lee@mediatek.com
References: <20220526110246.53502-1-linmq006@gmail.com>
 <20220527084525.7170-1-miles.chen@mediatek.com>
From: Miaoqian Lin <linmq006@gmail.com>
In-Reply-To: <20220527084525.7170-1-miles.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220528_021946_380043_615B4012 
X-CRM114-Status: GOOD (  17.01  )
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

Hi Miles,

On 2022/5/27 16:45, Miles Chen wrote:
> Hi Miaoqian,
>
>> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
>> ---
>> drivers/pci/controller/pcie-mediatek-gen3.c | 1 +
>> 1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
>> index 3e8d70bfabc6..da8e9db0abdf 100644
>> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
>> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
>> @@ -600,6 +600,7 @@ static int mtk_pcie_init_irq_domains(struct mtk_gen3_pcie *pcie)
>> 						  &intx_domain_ops, pcie);
>> 	if (!pcie->intx_domain) {
>> 		dev_err(dev, "failed to create INTx IRQ domain\n");
>> +		of_node_put(intc_node);
>> 		return -ENODEV;
>> 	}
> Thanks for doing this.
>
> I checked mtk_pcie_init_irq_domains() and there are multiple exit paths like
> err_msi_domain and err_msi_bottom_domain and the normal path which also
> need of_node_put(intc_node).

Thanks for your reply,

I didn't add of_node_put() in other paths because I am not sure if the reference passed through irq_domain_add_linear(), since intc_node is passed to irq_domain_add_linear().

__irq_domain_add() keeps &node->fwnode in the irq_domain structure.

and use fwnode_handle_get() to get the reference of fwnode, but I still uncertain.

If the reference don't needed anymore after irq_domain_add_linear(),

your suggestion looks fine, and I will submit v2.

> Maybe we can move the of_node_put(intc_node) to #54 below and cover
> all possible paths?
>
>
> cheers,
> Miles
>
> e.g.,
>
> static int mtk_pcie_init_irq_domains(struct mtk_gen3_pcie *pcie)
> {
> 	struct device *dev = pcie->dev;
> 	struct device_node *intc_node, *node = dev->of_node;
> 	int ret;
>
> 	raw_spin_lock_init(&pcie->irq_lock);
>
> 	/* Setup INTx */
> 	intc_node = of_get_child_by_name(node, "interrupt-controller");
> 	if (!intc_node) {
> 		dev_err(dev, "missing interrupt-controller node\n");
> 		return -ENODEV;
> 	}
>
> 	pcie->intx_domain = irq_domain_add_linear(intc_node, PCI_NUM_INTX,
> 						  &intx_domain_ops, pcie);
> 	of_node_put(intc_node);
> 	if (!pcie->intx_domain) {
> 		dev_err(dev, "failed to create INTx IRQ domain\n");
> 		return -ENODEV;
> 	}
>
> 	/* Setup MSI */
> 	mutex_init(&pcie->lock);
>
> 	pcie->msi_bottom_domain = irq_domain_add_linear(node, PCIE_MSI_IRQS_NUM,
> 				  &mtk_msi_bottom_domain_ops, pcie);
> 	if (!pcie->msi_bottom_domain) {
> 		dev_err(dev, "failed to create MSI bottom domain\n");
> 		ret = -ENODEV;
> 		goto err_msi_bottom_domain;
> 	}
>
> 	pcie->msi_domain = pci_msi_create_irq_domain(dev->fwnode,
> 						     &mtk_msi_domain_info,
> 						     pcie->msi_bottom_domain);
> 	if (!pcie->msi_domain) {
> 		dev_err(dev, "failed to create MSI domain\n");
> 		ret = -ENODEV;
> 		goto err_msi_domain;
> 	}
>
> 	return 0;
>
> err_msi_domain:
> 	irq_domain_remove(pcie->msi_bottom_domain);
> err_msi_bottom_domain:
> 	irq_domain_remove(pcie->intx_domain);
>
> 	return ret;
> }
>> -- 
>> 2.25.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
