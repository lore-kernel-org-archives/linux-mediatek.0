Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6C4C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 08:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QTQIoq46vX53Mx8fwZ4rth1mQTR0KYU6SvXmMJpoY04=; b=S3bkTn5v8n4UhX
	rQsa6kRrvcNauB26o1NRR5YXup58IhWV9OB8cQ/pJJLDM2uCq5UeybwQ1evjlT1+6ArDp05AGVZ07
	1GAcKF/HTI/gw5+zzLCSd504Qg8NIVXYmKQIXj8xxJKLL2AWm7zow3/6eIKnRGAYNglpp+YVirVbq
	SgBv13IZD4C/qMnT+gFpF56TvlDCQWpUqkKttilE95hj0U//VKmiCv69M5SzHTVTJW5sv9gq8cNmQ
	fQYBSrjm7fWLVYCPPsrYdGCObALE5fucC4MeFGNIZGPU8A7d3Vv9oFVmTgt3xbw7xy/x33jVWmMFC
	jMXCTlSfyqipkUh2uPZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhovm-00HIXL-Oo; Fri, 22 Apr 2022 08:46:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhova-00HIUo-MQ; Fri, 22 Apr 2022 08:46:11 +0000
X-UUID: 44aa629af0fa4b9781902f7f3202f703-20220422
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:5f33fed4-cf9a-4aa4-8131-e018e757a3bb, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:8
X-CID-META: VersionHash:faefae9, CLOUDID:f94f99f0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 44aa629af0fa4b9781902f7f3202f703-20220422
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1312051247; Fri, 22 Apr 2022 01:46:05 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Apr 2022 01:38:46 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 22 Apr 2022 16:38:44 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Apr 2022 16:38:43 +0800
Message-ID: <00b39ca86c6548c4313e0ee82829b2354ba9e4ac.camel@mediatek.com>
Subject: Re: [PATCH v2] PCI: mediatek-gen3: Update entries to distinguish
 MediaTek PCIe controller
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Jianjun Wang <jianjun.wang@mediatek.com>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>, Rob Herring <robh@kernel.org>, Krzysztof
 =?UTF-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Bjorn Helgaas
 <bhelgaas@google.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: Ryder Lee <ryder.lee@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-pci@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>
Date: Fri, 22 Apr 2022 16:38:44 +0800
In-Reply-To: <20220422070908.14043-1-jianjun.wang@mediatek.com>
References: <20220422070908.14043-1-jianjun.wang@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_014610_766629_E1CE7A9D 
X-CRM114-Status: UNSURE (   7.91  )
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

On Fri, 2022-04-22 at 15:09 +0800, Jianjun Wang wrote:
> Update driver entries in pcie-mediatek-gen3.c to distinguish the
> MediaTek PCIe controllers.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 

Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
