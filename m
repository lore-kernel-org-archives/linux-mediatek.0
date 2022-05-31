Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CE6C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 14:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KaFmDu+24wx7zr89xuTwzhAGWJR14rnxT9B2MqGcFeY=; b=MerqELRozyGLcN
	2Ae74z/ihKcmiU7ufyoTVtmz1Ip1FKeKHUeBpB+nzcF2KL2MDrSHDOQSnBxt8fq1flpat3utLOMto
	6tpb4QySSf6jqslJvYKT9cJIKRqTUh+EXAW506OCTb7dIt9mPW/6q0PHoqUSEX7IAJh3vZp3FTGKt
	lF1P7xQT1NGdhX9xZCBHnz5CzQH1OliBigfqfQgaSXZvJ0pHcjMxM+noKGh2Gm2Ml/bO+0iYtHxLk
	afs0WXwbrCutIAxkAwVBZG0AOaHLJOQxOAOZo8KN414rWFMqspFoXm23l9i/Flf5+2PzZeyZPE/lZ
	W9YQ/154wGyAL7ZVqEiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw2Ra-00BCqq-Mg; Tue, 31 May 2022 14:01:58 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw2RM-00BCn5-JL; Tue, 31 May 2022 14:01:48 +0000
Received: by mail-pl1-x633.google.com with SMTP id h1so3712120plf.11;
        Tue, 31 May 2022 07:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Mrb04JIXyqFQ3QOJ4ljFjUENecQCixeg6qU8fHaKeZk=;
        b=obmR59m0Y0vY2NPUoD6WSZci9Ko+JC2tIToDAe4VBgkSuyXRWScFXBhpc/TGFu4ZJH
         0KqnwtrlMx0ODAJTwmUvhk0Mf3fffWaH68i6GXQhUfFygeCHcsr5dTR+RSX4O/6fGyC1
         s7GNfZ27SlwB8Sb4JaplTUwawtiFdoQ6go/zaaKo5JZAy1Az4Wh4t6ybDfhbnysvEv5E
         BOmLvezqVqTiu76Upwot5elJ/4u3bE2w4OYD3hV35WoSNgNCAsciv7CotPOVbHiCxkD+
         opMEQwLjyw4R3HMJpMxGDw1rcWV1jKhHwSCvTtvidbwWZif+Es7otGe4KP/UqS6lIQFJ
         KRhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Mrb04JIXyqFQ3QOJ4ljFjUENecQCixeg6qU8fHaKeZk=;
        b=YuzQA9Kavv8Y6+eIEoGjFRVGGemh8aUkFat7LP4F/p7u8lBYD8fSxmn700XkG11Bj6
         5CLpnth2mLzL/37y4xfM/ZRIZoNEh3bq8wTDXaQW49pJ3Wf3yItyo207KQnGoAvBGGyb
         2JtykU98SLi+wqNs4xRzh6ddAZaicGqDYYdZotk2b8qoptamgKGKM66kpP8+pWtZojzG
         jmfPV293bvjBjiusVZ6RjgBzNyK/HA/7jhuK3YIyqUIT90oiIIVH+zZgWdWoD48AaEa+
         cWAlSbn/6vmkOHa9Q7LcYj6Sv3JYcn6bs2wvm6ytVqoIDPAGDHhMhLXQfguta/eIPV+L
         HBJA==
X-Gm-Message-State: AOAM530sKCGnFhhgW8F5Pd7LyM+5i6BGmP90hoSU+4hhN5J8mvoYry0j
	2OmdzGLC5fpJrqrQch7eIQs=
X-Google-Smtp-Source: ABdhPJzFnIkAf7SzEujOh3vbwx4zBDuoIj5QBUHpQkAIlLjI2rtJTa7RIM9vMNmPLUHXlHMlt1UTug==
X-Received: by 2002:a17:90a:9318:b0:1e0:b957:ffda with SMTP id p24-20020a17090a931800b001e0b957ffdamr29249871pjo.199.1654005699256;
        Tue, 31 May 2022 07:01:39 -0700 (PDT)
Received: from [172.16.4.4] ([219.142.146.208])
        by smtp.gmail.com with ESMTPSA id d5-20020aa78685000000b0050dc76281e6sm10642401pfo.192.2022.05.31.07.01.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 May 2022 07:01:38 -0700 (PDT)
Message-ID: <d6ba61ed-7a78-126a-de0d-e3e88c51bbd9@gmail.com>
Date: Tue, 31 May 2022 22:01:32 +0800
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
References: <6cf820cf-a2e7-c93e-3c00-08bc366f2eb2@gmail.com>
 <20220530073556.1831-1-miles.chen@mediatek.com>
From: Miaoqian Lin <linmq006@gmail.com>
In-Reply-To: <20220530073556.1831-1-miles.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_070144_691579_54BAF10F 
X-CRM114-Status: GOOD (  11.42  )
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

On 2022/5/30 15:35, Miles Chen wrote:
> Hi Miaoqian,
>
>> Hi, Miles
>>
>> On 2022/5/30 10:19, Miles Chen wrote:
>>> Hi Miaoqian,
>>>
>>>>>> 						  &intx_domain_ops, pcie);
>>>>>> 	if (!pcie->intx_domain) {
>>>>>> 		dev_err(dev, "failed to create INTx IRQ domain\n");
>>>>>> +		of_node_put(intc_node);
>>>>>> 		return -ENODEV;
>>>>>> 	}
>>>>> Thanks for doing this.
>>>>>
>>>>> I checked mtk_pcie_init_irq_domains() and there are multiple exit paths like
>>>>> err_msi_domain and err_msi_bottom_domain and the normal path which also
>>>>> need of_node_put(intc_node).
>>>> Thanks for your reply,
>>>>
>>>> I didn't add of_node_put() in other paths because I am not sure if the reference passed through irq_domain_add_linear(), since intc_node is passed to irq_domain_add_linear().
>>>>
>>>> __irq_domain_add() keeps &node->fwnode in the irq_domain structure.
>>>>
>>>> and use fwnode_handle_get() to get the reference of fwnode, but I still uncertain.
>>>>
>>>> If the reference don't needed anymore after irq_domain_add_linear(),
>>>>
>>>> your suggestion looks fine, and I will submit v2.
>>> Thanks for your reply, I think we can do similar things like
>>> rtl8365mb_irq_setup() in drivers/net/dsa/realtek/rtl8365mb.c
>> I checked rtl8365mb_irq_setup(), it calls of_node_put() by goto statement for error paths.
>>
>> and calls of_node_put() before return 0 in normal path. I didn't see the same problem.
> Sorry for the confusing. I meant that we can do the same thing - 
> it calls of_node_put() by goto statement for error paths
> and calls of_node_put() before return 0 in normal path. :-)

I'll sent a v2 for this: https://lore.kernel.org/all/20220530064807.34534-1-linmq006@gmail.com/

following your original suggestion.

> Thanks,
> Miles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
