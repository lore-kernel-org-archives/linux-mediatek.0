Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36352C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 07:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IS/f5gU8JosIuquzmRtTavEgsyZu8zs9Dg39nH19u88=; b=ptMLXQChZuOu8n
	/ecM9yLjewW2FTDtnvcu4PzQwOqX9byHROlFz4RlPuGQ6umeITM0vrgTD5Oluio7VurQ85biyIVcn
	XKUhUWIraZUqOlX5RALuRvK1PZbr8XpfYLTfYBHcaUUcnbYuugzG1grUqcvVX3MPZk44GhhWTuduO
	eBiIvsBmtY9J6Mj8t+n+rD6ah5oNmB3HlvMPgKCQQSX/78WZ6ho5pSjMcZ4lHgjZL6IiCj6LD+l8i
	g9Y2ors9ukPdaFCK5g7+biFiQlK8ZTFY8jKQBw89spRTP5d+JrENYcPgO2S1UW8spdJ9smax0eDEg
	fRr9uA8T54bypXICppuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvZxG-005hj5-Mb; Mon, 30 May 2022 07:36:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvZxD-005hie-6M; Mon, 30 May 2022 07:36:45 +0000
X-UUID: 967611e254a74724a0f2deb879b627a6-20220530
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:65c59f2a-7012-48a4-bce6-ed15608b2831,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:e3ccfb47-4fb1-496b-8f1d-39e733fed1ea,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 967611e254a74724a0f2deb879b627a6-20220530
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1397195331; Mon, 30 May 2022 00:36:36 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 May 2022 00:35:57 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 May 2022 15:35:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 30 May 2022 15:35:55 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <linmq006@gmail.com>
CC: <bhelgaas@google.com>, <jianjun.wang@mediatek.com>, <kw@linux.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-pci@vger.kernel.org>,
	<lorenzo.pieralisi@arm.com>, <matthias.bgg@gmail.com>, <maz@kernel.org>,
	<miles.chen@mediatek.com>, <robh@kernel.org>, <ryder.lee@mediatek.com>
Subject: Re: [PATCH] PCI: mediatek-gen3: Fix refcount leak in mtk_pcie_init_irq_domains
Date: Mon, 30 May 2022 15:35:56 +0800
Message-ID: <20220530073556.1831-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <6cf820cf-a2e7-c93e-3c00-08bc366f2eb2@gmail.com>
References: <6cf820cf-a2e7-c93e-3c00-08bc366f2eb2@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_003643_279984_CB6E7C5E 
X-CRM114-Status: GOOD (  10.76  )
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

Hi Miaoqian,

>Hi, Miles
>
>On 2022/5/30 10:19, Miles Chen wrote:
>> Hi Miaoqian,
>>
>>>>> 						  &intx_domain_ops, pcie);
>>>>> 	if (!pcie->intx_domain) {
>>>>> 		dev_err(dev, "failed to create INTx IRQ domain\n");
>>>>> +		of_node_put(intc_node);
>>>>> 		return -ENODEV;
>>>>> 	}
>>>> Thanks for doing this.
>>>>
>>>> I checked mtk_pcie_init_irq_domains() and there are multiple exit paths like
>>>> err_msi_domain and err_msi_bottom_domain and the normal path which also
>>>> need of_node_put(intc_node).
>>> Thanks for your reply,
>>>
>>> I didn't add of_node_put() in other paths because I am not sure if the reference passed through irq_domain_add_linear(), since intc_node is passed to irq_domain_add_linear().
>>>
>>> __irq_domain_add() keeps &node->fwnode in the irq_domain structure.
>>>
>>> and use fwnode_handle_get() to get the reference of fwnode, but I still uncertain.
>>>
>>> If the reference don't needed anymore after irq_domain_add_linear(),
>>>
>>> your suggestion looks fine, and I will submit v2.
>>
>> Thanks for your reply, I think we can do similar things like
>> rtl8365mb_irq_setup() in drivers/net/dsa/realtek/rtl8365mb.c
>
>I checked rtl8365mb_irq_setup(), it calls of_node_put() by goto statement for error paths.
>
>and calls of_node_put() before return 0 in normal path. I didn't see the same problem.

Sorry for the confusing. I meant that we can do the same thing - 
it calls of_node_put() by goto statement for error paths
and calls of_node_put() before return 0 in normal path. :-)

Thanks,
Miles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
