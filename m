Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5C5C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 06:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lFic/c2J195NSCmSOrTWOs9QI0RsrnJKu+5ci4a+h1s=; b=s/EPVwiA1mTmAK
	qGJr7dqZEJNsq0l6NhxpZfILGzhkif8RBhAnFlYSm9i8LJ9KkA9x9XgdAhbMkvY3/8nTtTepoih+p
	fGJc1jFAbj3mtgIAEHOatuK/42CqxC6KOsTOL3gnpJyY7lKuqPaCAH8YGO90d6b27gqxQyZwIroyh
	LEWrWb5THLxVOt1YDXsEjJh4ZuBqX3WyvM8Xbzs9nMNDWLAgwivh36tyMpSE0Z+uv9CCUQ3Ynhly5
	0262eKpxAl3ZTj6kBAe4WX1R9t6BTMw9zyZ1np9qcmRTXZBisp/rFMcHd9p8ilYUgBWukVDeqFSHS
	9wHsYqAN8hPRhQ8xrQGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvZIF-005bvX-EV; Mon, 30 May 2022 06:54:23 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvZI5-005bsj-FX; Mon, 30 May 2022 06:54:14 +0000
Received: by mail-pf1-x432.google.com with SMTP id i18so9780435pfk.7;
        Sun, 29 May 2022 23:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=iESY+LOtFkT1tRhY+yUwneh6az/zE+XpNPtKwgmfOF0=;
        b=UutOl45RVEUG86jQjCRG5VNZVf97ECO7wiy4dg0Ux8XAp7Y9LOKIdFWMuR3rkQ44A8
         CbAWzPT5cU+9COykCTDzsgadZ2bh9+4yIietOhJrQVcdDRlYt+D8RicmUSfLocBYpEHU
         9qkKF9xNVTbN2M9r34WHOM0k7baVMDvolyRBkCqn5Z6zpRQp10iuqPIL57HmdH2aFdLw
         JSEiZ1TyxyLuqGkH/L8paSBfff2WT4FWoJAPmuqXfa7WGjIiY6ymG0NOe9vl5kSr709K
         +wONuVqxob9BUVttYvmg/bZaKtks3mgJrjsGLMfQCT/mPsfxJaAmUV+GA+Q+sWzlABtG
         M+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iESY+LOtFkT1tRhY+yUwneh6az/zE+XpNPtKwgmfOF0=;
        b=VjMolPOlCQVUUnV7dipU08t8BpJRLgOgJFWn81rqm0Sj65KWpaE6yDku3LcdgPpQ6i
         kBF2g2WTU3bm1sM82ECPnBli95t6NPKOGYFHp3ckmH67H/2yWSwe+hu/Lg/w7qzsNLn4
         dVcDHm3OhJ+RTAGYT17e0+WuMDHMciavlHb8KSEX79pHmbHDfi1lsxL1W089XJyhPAMh
         ZWTast526/mN+VXPLxr35Mwpt5yov0vh7etGfG+y9EDfvR/KIH6pj8DcLr8PYgdUd+/l
         C6aYr7TKUFP0ypO5GUSFdqSnAtsAZqOWZnDHHxcBbl+ml0ExXvPU0rOw2HwiphfXfmSG
         NnxA==
X-Gm-Message-State: AOAM533+O76Swj9qgrsgB+iD6iXj4yowiFZwDMUEp3Tz5gZ8UoQO99+a
	Q5sgrA06Qtl1kbi0lYrOjno=
X-Google-Smtp-Source: ABdhPJzZgk01VHqO2Rts4xhDHg9A0sROZcZTZHHDlsl1d2P81YaoOZ34p4dZJkXYNxJI+xOHAsPyPg==
X-Received: by 2002:a63:86c7:0:b0:3fb:efc1:a53e with SMTP id x190-20020a6386c7000000b003fbefc1a53emr6398595pgd.220.1653893649798;
        Sun, 29 May 2022 23:54:09 -0700 (PDT)
Received: from [172.16.4.4] ([219.142.146.208])
        by smtp.gmail.com with ESMTPSA id d24-20020a170902729800b00161ea00350bsm8322920pll.277.2022.05.29.23.54.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 May 2022 23:54:09 -0700 (PDT)
Message-ID: <6cf820cf-a2e7-c93e-3c00-08bc366f2eb2@gmail.com>
Date: Mon, 30 May 2022 14:54:03 +0800
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
References: <bd03ca71-1875-2e94-8040-533034f76ee5@gmail.com>
 <20220530021923.31601-1-miles.chen@mediatek.com>
From: Miaoqian Lin <linmq006@gmail.com>
In-Reply-To: <20220530021923.31601-1-miles.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220529_235413_584748_15807D64 
X-CRM114-Status: GOOD (  11.56  )
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

Hi, Miles

On 2022/5/30 10:19, Miles Chen wrote:
> Hi Miaoqian,
>
>>>> 						  &intx_domain_ops, pcie);
>>>> 	if (!pcie->intx_domain) {
>>>> 		dev_err(dev, "failed to create INTx IRQ domain\n");
>>>> +		of_node_put(intc_node);
>>>> 		return -ENODEV;
>>>> 	}
>>> Thanks for doing this.
>>>
>>> I checked mtk_pcie_init_irq_domains() and there are multiple exit paths like
>>> err_msi_domain and err_msi_bottom_domain and the normal path which also
>>> need of_node_put(intc_node).
>> Thanks for your reply,
>>
>> I didn't add of_node_put() in other paths because I am not sure if the reference passed through irq_domain_add_linear(), since intc_node is passed to irq_domain_add_linear().
>>
>> __irq_domain_add() keeps &node->fwnode in the irq_domain structure.
>>
>> and use fwnode_handle_get() to get the reference of fwnode, but I still uncertain.
>>
>> If the reference don't needed anymore after irq_domain_add_linear(),
>>
>> your suggestion looks fine, and I will submit v2.
>
> Thanks for your reply, I think we can do similar things like
> rtl8365mb_irq_setup() in drivers/net/dsa/realtek/rtl8365mb.c

I checked rtl8365mb_irq_setup(), it calls of_node_put() by goto statement for error paths.

and calls of_node_put() before return 0 in normal path. I didn't see the same problem.

> Thanks,
> Miles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
