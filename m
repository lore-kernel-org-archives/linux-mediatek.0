Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE4AC00140
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Aug 2022 09:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UQCUheVzm/zqzSXNU/VM4FxsV1aKEDMU6rPmjtjWEbg=; b=cUqU65eKD7KqF4bsd/m8tuWEnI
	GxFqzhuqRxs/BSNFc7cul/JCZVsGwCBEJNXfBOQ8QFrSJsx5qq9W5s5p3NWv2g9BzRVbFsF5vqg/5
	qlG1PWQ/FLHk9Xa4HXGja84MMJpn5CJ/pfmPoUftp7zc0kXAHAaiUXU8twxYTnn3UlD1XPsXlTPah
	aglyx370RFq9VkP4fd0DfypKP41JKyPGrX34ZHQLqgFk3TF2AW7ommOlTdHUU7Hh+YnSoiJli4O0T
	SSczN2B+7Iy/5xuJEPRE8+UYJr1AG8k+RHPMZVPQE9jMMpsLX/AnIdaOdPDNuZLxyNX/7opEYX2al
	jG0UDrew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oObaj-001QVE-AZ; Thu, 18 Aug 2022 09:13:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oObaR-001QFM-1F; Thu, 18 Aug 2022 09:13:18 +0000
X-UUID: 0ef1b088e6074a308f5dd9264a43f373-20220818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=UQCUheVzm/zqzSXNU/VM4FxsV1aKEDMU6rPmjtjWEbg=;
	b=XFN9faatxlGB06PgEiSrQrOFziMAM/zw/Uy85X7duhTB5udpr2luy11cB+rO6YHxaGtlIceZXs0sIilRnv/U3ALBxIXr3dgB6Kg6sE32kkr6fa3cMdFfQhsASqez9w5lwSEdRxu1iXr6Ts3+UF9MVXmX8kjyDdxJBk3w+aWLDos=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:068dd2aa-f147-4adf-aaf7-cf16b6afb33f,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:d5ec2faf-9535-44a6-aa9b-7f62b79b6ff6,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 0ef1b088e6074a308f5dd9264a43f373-20220818
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chengci.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1140017821; Thu, 18 Aug 2022 02:13:04 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 18 Aug 2022 16:12:28 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 18 Aug 2022 16:12:28 +0800
Message-ID: <ee54331a321fe256788a47d2ffd7d3b7124e23ee.camel@mediatek.com>
Subject: Re: [PATCH 1/3] dt-bindings: mediatek: mt8188: Add binding for MM &
 INFRA IOMMU
From: Chengci.Xu <chengci.xu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Yong Wu
	<yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
	<will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 18 Aug 2022 16:12:27 +0800
In-Reply-To: <5a916595-12ee-92e6-d380-84146dd75218@linaro.org>
References: <20220804105834.626-1-chengci.xu@mediatek.com>
	 <20220804105834.626-2-chengci.xu@mediatek.com>
	 <ae06f644-b988-8fc3-fde8-258299f8f2ae@linaro.org>
	 <f34db3a295b8c83e03bf79950cc25d39b6f81240.camel@mediatek.com>
	 <5a916595-12ee-92e6-d380-84146dd75218@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_021316_756253_DC57CD34 
X-CRM114-Status: GOOD (  20.48  )
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

On Thu, 2022-08-18 at 10:48 +0300, Krzysztof Kozlowski wrote:
> On 18/08/2022 10:26, Chengci.Xu wrote:
> > On Thu, 2022-08-04 at 13:13 +0200, Krzysztof Kozlowski wrote:
> > > On 04/08/2022 12:58, Chengci.Xu wrote:
> > > > This patch adds descriptions for mt8188 IOMMU which also use
> > > > ARM
> > > > Short-Descriptor translation table format.
> > > > 
> > > 
> > > 
> > > Thank you for your patch. There is something to discuss/improve.
> > 
> > Tkanks for your review.
> > 
> 
> BTW, none of your emails seem to reach devicetree mailing list:
> 
https://lore.kernel.org/linux-devicetree/20220804105834.626-1-chengci.xu@mediatek.com/
> which means they won't pop-up in Rob's Patchwork and won't tested by
> bot.
> 
https://patchwork.ozlabs.org/project/devicetree-bindings/list/?series=&submitter=84571&state=*&q=&archive=&delegate=
> 
> I wonder if this is the same issue as with other Mediatek emails
> filtered by spam...
> 
> Anyway, you should sort it out, otherwise patches won't get to Rob
> and I
> won't apply them.
> 

Thanks for the your reminder, I will try to find out and fix this when
sending next version.

> Best regards,
> Krzysztof

Best regards,
Chengci Xu


