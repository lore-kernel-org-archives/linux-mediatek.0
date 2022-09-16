Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB6B0ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Sep 2022 06:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6KF/gMuW/gwjjUwudNQxI96eKw9IxeG6G7ArRhNENYc=; b=v/8QALqqGpPMYG7SKuRt1nvUTs
	6UxS7OTKsJq16cuLV1zWWPVetxPtKIVtGrRzv9IBGQJG7BJIhblaMjavlTcDv8Uf+Ju2MIYgxRohx
	o3q7bNT9n/4O5ML+QMjeuhar6+sDKWkkLQGZjDzECy6JNdMr098UnOyNZsakZcyE8AjeqVqrFe0vF
	jUTuoRNsMQqppFE6XnpLD1Qt8RbLnZ0tKH2dtdtL6J1GRnUSWQ5SO82bJqMmvCKyNoumNRZUwUf/P
	O+2rEDSrnXQmWgcA26QesiDFSoQd4bIWmTFmSYWDv9v28EeUsWAIwwkZTskqtPhko9SeDnxB/u3qC
	h/+xncTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ4r5-009CGy-88; Fri, 16 Sep 2022 06:29:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ4r2-009CFl-J7; Fri, 16 Sep 2022 06:29:37 +0000
X-UUID: 6e15ce028a3e4cda916e5f02f22d8459-20220915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=6KF/gMuW/gwjjUwudNQxI96eKw9IxeG6G7ArRhNENYc=;
	b=WW1+pVDV3RuMW4NeFUXUVE0PejRzWGXZ8ftfwQZt/MuARawU0cji2CRQ8Noze8RbJwp0+RAkF0Xk+2Ul2eBOmd5TR5ui0pqAKh4FqnSKUwkbFGm+FOf2f1SycsspNttZuQREN7jNLVz/BAyD82GWotoOHOA53Mk+DwrKC+bTnEg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:daabd8cf-c511-4f85-a25c-004ce90c35f0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:2b449ef6-6e85-48d9-afd8-0504bbfe04cb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 6e15ce028a3e4cda916e5f02f22d8459-20220915
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 674347842; Thu, 15 Sep 2022 23:22:35 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 16 Sep 2022 14:22:20 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 16 Sep 2022 14:22:20 +0800
Message-ID: <5ee6718243923daf9d6aa4c4d36f48e6f341c429.camel@mediatek.com>
Subject: Re: [PATCH v1 0/2] Add power domain support for MT8188
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: Garmin.Chang <Garmin.Chang@mediatek.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Fri, 16 Sep 2022 14:22:20 +0800
In-Reply-To: <20220916055216.20139-1-Garmin.Chang@mediatek.com>
References: <20220916055216.20139-1-Garmin.Chang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_232936_668698_473F9524 
X-CRM114-Status: GOOD (  11.16  )
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

On Fri, 2022-09-16 at 13:52 +0800, Garmin.Chang wrote:
> Base on tag: next-20220915, linux-next/master
> 

Hello Garmin,

Please add more description for this series.

BRs,
Bo-Chen

> Garmin.Chang (2):
>   dt-bindings: power: Add MT8188 power domains
>   soc: mediatek: pm-domains: Add support for mt8188
> 
>  .../power/mediatek,power-controller.yaml      |   2 +
>  drivers/soc/mediatek/mt8188-pm-domains.h      | 623
> ++++++++++++++++++
>  drivers/soc/mediatek/mtk-pm-domains.c         |   5 +
>  .../dt-bindings/power/mediatek,mt8188-power.h |  44 ++
>  include/linux/soc/mediatek/infracfg.h         | 121 ++++
>  5 files changed, 795 insertions(+)
>  create mode 100644 drivers/soc/mediatek/mt8188-pm-domains.h
>  create mode 100644 include/dt-bindings/power/mediatek,mt8188-power.h
> 


