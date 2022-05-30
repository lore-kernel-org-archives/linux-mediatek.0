Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCAC0C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 02:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a8ueeEvoJo5I4oebTz9vK8ZTSrkWxq+zgQVmLtU5NJY=; b=rlDZEFP2hPDbYv
	SaYKHLRHIwqCERDFJ6xyYimXFz0wrN1cy4kLKJkI37apvNi5Lax3TJlAua+0eCZuRVNxAFlJHzVMb
	k10zzEkGSeyRjEA25Ska6L8L+PsAvokGUfPvzx+u84NSIpPjYI/KoY30EaPGLmgF3Z12FkXeB7tyj
	wxmsRGrZXuYWCRUAPMp0ia6Xn6Mglf6X2PIqq0Pf+wB5eb4LWOgmSNVDDDKOBfI9vMKtXas2C4HF4
	pg7ND21ctXE3AbUDGsx9DyNCiw3DsWDwoUbqDzrwXEallZZWzLc2S3knS0qayB+p18Q71z8YHdw9f
	SFpnS2aM85pH8Hcty5NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvV0T-0058Yk-0b; Mon, 30 May 2022 02:19:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvV0H-0058VV-Ns; Mon, 30 May 2022 02:19:35 +0000
X-UUID: 53d9a100a4494199b4fecad3f649d19a-20220529
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:043a32e3-3d77-467c-916c-9d0f9dc55f9c,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:83eaed47-4fb1-496b-8f1d-39e733fed1ea,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 53d9a100a4494199b4fecad3f649d19a-20220529
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 64645191; Sun, 29 May 2022 19:19:27 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 29 May 2022 19:19:25 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 30 May 2022 10:19:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Mon, 30 May 2022 10:19:23 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <linmq006@gmail.com>
CC: <bhelgaas@google.com>, <jianjun.wang@mediatek.com>, <kw@linux.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-pci@vger.kernel.org>,
	<lorenzo.pieralisi@arm.com>, <matthias.bgg@gmail.com>, <maz@kernel.org>,
	<miles.chen@mediatek.com>, <robh@kernel.org>, <ryder.lee@mediatek.com>
Subject: Re: [PATCH] PCI: mediatek-gen3: Fix refcount leak in mtk_pcie_init_irq_domains
Date: Mon, 30 May 2022 10:19:23 +0800
Message-ID: <20220530021923.31601-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <bd03ca71-1875-2e94-8040-533034f76ee5@gmail.com>
References: <bd03ca71-1875-2e94-8040-533034f76ee5@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220529_191933_824981_AFF1CADF 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
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

>>> 						  &intx_domain_ops, pcie);
>>> 	if (!pcie->intx_domain) {
>>> 		dev_err(dev, "failed to create INTx IRQ domain\n");
>>> +		of_node_put(intc_node);
>>> 		return -ENODEV;
>>> 	}
>> Thanks for doing this.
>>
>> I checked mtk_pcie_init_irq_domains() and there are multiple exit paths like
>> err_msi_domain and err_msi_bottom_domain and the normal path which also
>> need of_node_put(intc_node).
>
>Thanks for your reply,
>
>I didn't add of_node_put() in other paths because I am not sure if the reference passed through irq_domain_add_linear(), since intc_node is passed to irq_domain_add_linear().
>
>__irq_domain_add() keeps &node->fwnode in the irq_domain structure.
>
>and use fwnode_handle_get() to get the reference of fwnode, but I still uncertain.
>
>If the reference don't needed anymore after irq_domain_add_linear(),
>
>your suggestion looks fine, and I will submit v2.


Thanks for your reply, I think we can do similar things like
rtl8365mb_irq_setup() in drivers/net/dsa/realtek/rtl8365mb.c

Thanks,
Miles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
