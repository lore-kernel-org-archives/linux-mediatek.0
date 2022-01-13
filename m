Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99349C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 06:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=syOZpGr2BxzgvF0VvM70FwNTQbm6VXXF3NHdW01T4Bs=; b=Eq3g3wXPJKJQ3s
	7EszJv8FvZmHOSXS9OyUBJN664OBXSAWXOlKNLL67/YQLNnEdKx+LxmMqWyFnD0sh/GB5NnR6pGID
	DPmGD6SecvKGPRa/M8swP7wqvStFhrWl2Yu2SKg8EHDPPQbPASNSAHtd2JmjI0DFMxMea/vfffZOA
	p+KD4Q2dKcmNS+kiDmWeaYsGIjDUADuKiGJu4IBtTqelwVF9vhPVsE4ZnMqV7quhujcMcX+1j4uod
	+ZYDvQH9XJXygDoJrffNUPZ+vUNPHRVKq0nMBYNC9XRXka3NLcNwQwdm9Q5HqIDf3IKJ4I0f3IMoe
	bHxK0vSeIPMQmkL66jOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7tFR-004lo6-GR; Thu, 13 Jan 2022 06:06:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7tFP-004ln1-05; Thu, 13 Jan 2022 06:06:08 +0000
X-UUID: 6e5e282fa74c4f709d558b746963afe5-20220112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=+P/+EoOIhW12eK7FyP0jdKwR6HQk6B21VSHJlpRkc1M=; 
 b=jY7VuWUKRx3DQhQYZ6AkhbaBaeGyPasCBl41cj9kvK84bVPxnMLKu1XljMxH/Y55G4blfeXUuIHw3MMV2DS6O2BvesqutVpBmliAOVtkKovxWDiGM6ebsUUTVj041dg/ydCRMgr6oPzB4ESGbKOIaX8p5uLLi0h391fiVjfzR2g=;
X-UUID: 6e5e282fa74c4f709d558b746963afe5-20220112
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1705541319; Wed, 12 Jan 2022 23:06:04 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Jan 2022 22:06:02 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 13 Jan 2022 14:06:01 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 13 Jan 2022 14:05:59 +0800
Message-ID: <18d7e049adc69f4b7f0ecfdf8520a02bd6e17149.camel@mediatek.com>
Subject: Re: [PATCH v2 4/6] memory: mtk-smi: Fix the return value for
 clk_bulk_prepare_enable
From: Yong Wu <yong.wu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, "Joerg
 Roedel" <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Tomasz Figa <tfiga@chromium.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>, <lc.kan@mediatek.com>,
 <yi.kuo@mediatek.com>, <anthony.huang@mediatek.com>
Date: Thu, 13 Jan 2022 14:05:59 +0800
In-Reply-To: <00efa277-6475-4f20-f045-443a0706e9e2@collabora.com>
References: <20220111063904.7583-1-yong.wu@mediatek.com>
 <20220111063904.7583-5-yong.wu@mediatek.com>
 <00efa277-6475-4f20-f045-443a0706e9e2@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_220607_074780_F999AE70 
X-CRM114-Status: GOOD (  24.50  )
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

On Tue, 2022-01-11 at 10:10 +0100, AngeloGioacchino Del Regno wrote:
> Il 11/01/22 07:39, Yong Wu ha scritto:
> > The successful return value for clk_bulk_prepare_enable is 0,
> > rather than
> > "< 0". Fix this.
> > 
> 
> Hello! Thanks for this commit!
> However, there are a few comments...
> 
> This description is a bit confusing, please reword it, something
> like...
> 
> "Function clk_bulk_prepare_enable() returns 0 for success or a
> negative
> number for error. Fix this code style issue."

Thanks for your quickly reviewing.

I will use this in next version and remove the "Fixes" tag.

> 
> In any case, you're not fixing any bad logic issue here, as the
> function
> will never return anything > 0.
> 
> What you're fixing is a common pattern usage issue, so the Fixes tag
> can be
> removed since it's not really useful to schedule this commit for
> backport
> over older stable versions.
> 
> 
> After the requested changes:
> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 
> > Fixes: 0e14917c57f9 ("memory: mtk-smi: Use clk_bulk clock ops")
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >   drivers/memory/mtk-smi.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> > index b883dcc0bbfa..e7b1a22b12ea 100644
> > --- a/drivers/memory/mtk-smi.c
> > +++ b/drivers/memory/mtk-smi.c
> > @@ -480,7 +480,7 @@ static int __maybe_unused
> > mtk_smi_larb_resume(struct device *dev)
> >   	int ret;
> >   
> >   	ret = clk_bulk_prepare_enable(larb->smi.clk_num, larb-
> > >smi.clks);
> > -	if (ret < 0)
> > +	if (ret)
> >   		return ret;
> >   
> >   	/* Configure the basic setting for this larb */
> > 
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
