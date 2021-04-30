Return-Path: <SRS0=r4MK=J3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61B88C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 07:34:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 999ED61434
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 07:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 999ED61434
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UBOSrZZvwZmsNJ7itfoY1HwF+bLZC8fOVF8fGfSISJc=; b=YCn6+SHsa92UHVJsU3x05nrg8
	rCAeP4v2aZXYdAWF+ivBg/DkR2KBOn8VfdC3vfrByzZlrMIScKfWAJ7ZBwlefpeEz7lAtvlfyFdKJ
	gT0ymIR0z4u/OW6pQWJHSSB30Ij8DaHeBohSjyA8yt5lQjmATVLEocBbWiZvpkE50qbudfqTDVQrT
	Sc9GjBQ+o1vr26Z0HlOfFYR1WYMTlv05dhs2aoQNIjv+fz78P95OxqmqRGQ+z3UnTzhmPndL/npzq
	fpoTs8z3WDRrtJqFE8b2CkkhzWQRY1YyCoH4C8Rhvtr7fIWP9/+mLzfMsnqMm2nLNg54Tj2O2l9Pt
	KvoyObKGw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcNel-007R8a-4I; Fri, 30 Apr 2021 07:33:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcNei-007R8J-Bv; Fri, 30 Apr 2021 07:33:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=fYnTZjtZi+ChPsBsoKvCFsCx7AX5XBrzMnGC25v6LBM=; b=Xs1F2Oz/DK7l94eSGfROtc2Q5D
 w2pr8qRCkH9Y4SOm7+fcK+tR0DaFldqglgF0QXubY8VcI6BP32nGkGGXNQH3oAHENDJSMTfbXg8sA
 qIoDrmGStTG4+tJvEeIfnIZcOSSDy3SkqAxef2A1z1SZFhbob2dU0Vdf7x9GN9yYBufmTV3uTt6kG
 Xzoi9XeuPL/UKd0KdD5RA2o9530NkmBFXQUrKCcZtrn/neEL8CNgaaESRZZ/azcjs4yR9aSFbaV8y
 mlnjWIFaob4zQ4B4fYz/Eedf93Ok2lkF71gTpE9p6Iu8iR+Vmt5EnPzJ4Hm9Bg6GpytqJ6W/wBl2g
 3xQoTf4A==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcNef-001CWB-Cz; Fri, 30 Apr 2021 07:33:42 +0000
X-UUID: 403df6e4aaf741caac31aa6d3200539c-20210430
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=fYnTZjtZi+ChPsBsoKvCFsCx7AX5XBrzMnGC25v6LBM=; 
 b=mvXaxDuDdgyPXqi2LZaYW4uD81lp8SmL5kiv8z/Cc5t8Iwq6hG65og37ozLGgqoIVExkVXvoocYZsFXc4RpOGnuqESAST7+ThDxQS/OgkRPZhxiVNFXkFHeOFQYwXqI01rQ3gp2a1U3Hn8qVaQPXkvonVh4QlfKEv0C7uokzYfo=;
X-UUID: 403df6e4aaf741caac31aa6d3200539c-20210430
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1148638086; Fri, 30 Apr 2021 00:33:38 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Apr 2021 00:25:03 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs08n2.mediatek.inc
 (172.21.101.56) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 30 Apr 2021 15:24:55 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 30 Apr 2021 15:24:54 +0800
Message-ID: <1619767494.1027.3.camel@mhfsdcap03>
Subject: Re: [PATCH][next] PCI: mediatek-gen3: Add missing null pointer check
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Colin King <colin.king@canonical.com>
CC: Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>, Rob Herring <robh@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <kernel-janitors@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Date: Fri, 30 Apr 2021 15:24:54 +0800
In-Reply-To: <20210429110040.63119-1-colin.king@canonical.com>
References: <20210429110040.63119-1-colin.king@canonical.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8410CB59BBA8CE1684706891C6FE72A498F1C9DD1D6662302587175341C90FE22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_003341_472825_1E5550F1 
X-CRM114-Status: GOOD (  17.63  )
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

Hi Colin,

On Thu, 2021-04-29 at 12:00 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The call to platform_get_resource_byname can potentially return null, so
> add a null pointer check to avoid a null pointer dereference issue.
> 
> Addresses-Coverity: ("Dereference null return")
> Fixes: 441903d9e8f0 ("PCI: mediatek-gen3: Add MediaTek Gen3 driver for MT8192")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 20165e4a75b2..3c5b97716d40 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -721,6 +721,8 @@ static int mtk_pcie_parse_port(struct mtk_pcie_port *port)
>  	int ret;
>  
>  	regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pcie-mac");
> +	if (!regs)
> +		return -EINVAL;

Thanks for your patch.

devm_ioremap_resource() will check and decode this null pointer
dereference error, so I don't think we need to check here.

Thanks.

>  	port->base = devm_ioremap_resource(dev, regs);
>  	if (IS_ERR(port->base)) {
>  		dev_err(dev, "failed to map register base\n");


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
