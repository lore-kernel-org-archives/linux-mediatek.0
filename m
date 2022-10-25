Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE211C38A2D
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 07:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQobf7xDtt3s0PCmRp7MPfET49Bi1DCJ8ajNsUuFyIs=; b=HND+ZPJftS33exl3r5Gt/Mv3RX
	HThRauflk09yxEv2GnWiokP/48PIJJl1y0rPy+CctK3+kna8mCBeimawMElA34u5OoGScVzgQlg2l
	4FQ3Q3xUbI3lU2Gh7TV1dVKphWvJRLiLBXwMH125a7bwA0doJ/2dfA7ulXzNDjatsZMxGE32vWT4s
	oRSvIGOIK+RnvXnsCSQ6Lw6aB0667jqZfpTec9Puvve2L0Fg6BzGuwAJXob/n95nTMuGFdiJFttyW
	ri3O9QniYOr56BioZGO3Ju6c/h0+hZ2lrA8DiSnnKn+4qNT1qhnc3yZAi7K668rVfL7zllNvOBAGi
	S6SN5I1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onENz-0049Y7-Nf; Tue, 25 Oct 2022 07:30:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onENe-0049MJ-P3; Tue, 25 Oct 2022 07:29:49 +0000
X-UUID: ae2b793e470b4a2588b5de4922b1830f-20221025
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=tQobf7xDtt3s0PCmRp7MPfET49Bi1DCJ8ajNsUuFyIs=;
	b=kj3Mq+CiCePf6Xqb1xJG+BIJ7YMsxNAYxlpyQslxZEcpLMeZUz71bRTWqwyw6kw5GOCalTMGcpM95t0aJbaHS1e79AKLMkNsEm/Wif60JMo3MQfnBOBu/pv6HaeGe/GoUMWcc0P/xqcFLmZLO7NO0tqsXVIu+Iw3o387GrMun7o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:6b7fb492-84df-4c4a-8a34-88120a12b905,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:32f5036d-89d3-4bfa-baad-dc632a24bca3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ae2b793e470b4a2588b5de4922b1830f-20221025
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1180233191; Tue, 25 Oct 2022 00:29:38 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 25 Oct 2022 14:39:01 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 25 Oct 2022 14:39:00 +0800
Message-ID: <514697c381172b4baa011cc68ae8093c7517e0b2.camel@mediatek.com>
Subject: Re: [PATCH v5 0/3] iommu/mediatek: Add mt8365 iommu support
From: Yong Wu <yong.wu@mediatek.com>
To: Alexandre Mergnat <amergnat@baylibre.com>, Robin Murphy
	<robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Will Deacon <will@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-kernel@vger.kernel.org>, Amjad Ouled-Ameur
	<aouledameur@baylibre.com>, <devicetree@vger.kernel.org>, Fabien Parent
	<fparent@baylibre.com>, <linux-arm-kernel@lists.infradead.org>, "Markus
 Schneider-Pargmann" <msp@baylibre.com>, <linux-mediatek@lists.infradead.org>,
	<iommu@lists.linux.dev>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, <mingyuan.ma@mediatek.com>,
	<yf.wang@mediatek.com>, <libo.kang@mediatek.com>, <anan.sun@mediatek.com>
Date: Tue, 25 Oct 2022 14:39:00 +0800
In-Reply-To: <20221001-iommu-support-v5-0-92cdbb83bbb8@baylibre.com>
References: <20221001-iommu-support-v5-0-92cdbb83bbb8@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_002946_855826_1D0D6C14 
X-CRM114-Status: GOOD (  12.56  )
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

On Fri, 2022-10-21 at 15:42 +0200, Alexandre Mergnat wrote:
> Hi,
> 
> This series contains patches related to the support of mt8365 iommu.
> Thanks for your feedback so far.
> 
> Regards,
> Alex
> 
> Changes in
> v5:                                                                  
> - Fix name file in
> mediatek,iommu.yaml                                          
> - Rename defines to be more
> consistent                                          
> - Rework INT_ID_PORT_WIDTH_6
> check                                              
> - Link to v4: 
> https://lore.kernel.org/r/20221001-iommu-support-v4-0-f1e13438dfd2@baylibre.com


For this series,

Reviewed-by: Yong Wu <yong.wu@mediatek.com>



