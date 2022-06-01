Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28198C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 04:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0go+FEL2o2v903Vfo4EcpshXekClRDqr30HHU9VqoUs=; b=pYmEoVK1bwyjzn
	nfQddRFc8I0PTX6X6sG6985SsHbx2zbL0aRhoI39oTW3WgIWJIDuUCvu8KVHq0hRrKEsKZ0cQItEM
	FCTBCavelkitkOZHrbT6LUpZgZexCoS8b1U86yox3EM1a9p+pPb+65d41IoLGS0fXPS3c74obt+WN
	fiDDF/FmjE7SyCeHDbIm1G443QCCQfi4fTNHo4WizAEKZfko5AFeWSKFm6vTKxVPh3Cz+Do2JpOMU
	UT9/bLHZ5UknbXilO7s93i0nksVGZVPeoLsUCNhEyQr+6e81m0+MqN0RF4PRAObRApeexkrALsNcJ
	qdH/06bqnjWw8rd/BMlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwGQk-00DrnF-0s; Wed, 01 Jun 2022 04:58:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwGQX-00Drlg-Ro; Wed, 01 Jun 2022 04:57:52 +0000
X-UUID: 217d9a1c9d814cacabac402b001749d2-20220531
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:562c58d3-fe87-4684-a754-828242959c6f,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:a048168a-32d7-4fc0-b2ef-8776ac194f8f,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: 217d9a1c9d814cacabac402b001749d2-20220531
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 31885939; Tue, 31 May 2022 21:57:39 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 May 2022 21:47:37 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 1 Jun 2022 12:47:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 1 Jun 2022 12:47:36 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <linmq006@gmail.com>
CC: <bhelgaas@google.com>, <jianjun.wang@mediatek.com>, <kw@linux.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-pci@vger.kernel.org>,
	<lorenzo.pieralisi@arm.com>, <matthias.bgg@gmail.com>, <maz@kernel.org>,
	<miles.chen@mediatek.com>, <robh@kernel.org>, <ryder.lee@mediatek.com>
Subject: Re: [PATCH v3] PCI: mediatek-gen3: Fix refcount leak in mtk_pcie_init_irq_domains
Date: Wed, 1 Jun 2022 12:47:36 +0800
Message-ID: <20220601044736.8440-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220601041259.56185-1-linmq006@gmail.com>
References: <20220601041259.56185-1-linmq006@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_215749_943096_D7490F01 
X-CRM114-Status: UNSURE (   8.32  )
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

>of_get_child_by_name() returns a node pointer with refcount
>incremented, we should use of_node_put() on it when not need anymore.
>Add missing of_node_put() to avoid refcount leak.
>
>Fixes: 814cceebba9b ("PCI: mediatek-gen3: Add INTx support")
>Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Thanks for scanning the refcont leak and submitting this!

Reviewed-by: Miles Chen <miles.chen@mediatek.com>

>---
>changes in v2:
>- move of_node_put(intc_node) right after irq_domain_add_linear to cover
>normal path and error paths.
>---
>changes in v3:
>- call of_node_put() in error paths with goto, and call of_node_put() before
>  return 0 in normal path. Since this function has a goto part to handle
>  resources, so put them together, as suggested by Miles Chen <miles.chen@mediatek.com>
>
>v1 link: https://lore.kernel.org/all/20220526110246.53502-1-linmq006@gmail.com/
>v2 link: https://lore.kernel.org/all/20220530064807.34534-1-linmq006@gmail.com/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
