Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97725C00140
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Aug 2022 12:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TtWR+yg+ag6c4ySzzvo2nUeXBN5GFbEppUG3w7dP/gc=; b=4xki+Ew7HrV4mdMfBQMD694tv/
	mQzA+CFPkyR5SyzsO1bSzzHEYQcyyW9oP4riRTy346KoO15sITmuKROgwegwCo6argquwEwMIeO4H
	RJmhafke0BVrnhLDNmE9xLcMxaUnc5WHVur7AoUZqJqZuVzHs22w7x9faQ8SaeSlISj2OV2ByU4GT
	nVKca0zIWE/+q6Kp62X2eP1Xt1EZ5YupqRJuKWTibpe3XzO0lPDjB76ev5Peytbwz0E8LIu6AxEAH
	holNF0IFyhyjohzbs7Z3+IVIo27/r7rg9o4I52INfLn/WXAe6cZBDY/n4SOoyUamWd6tZ8JmAHdpM
	eghHhTiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLktW-00BnAf-In; Wed, 10 Aug 2022 12:33:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLktL-00Bn8K-6c; Wed, 10 Aug 2022 12:32:56 +0000
X-UUID: 8e31797493c84bb5ab0895d48b16c5da-20220810
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:2af801d6-1ca5-42f8-91a3-d2ebf0ca7d9b,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:-5
X-CID-META: VersionHash:3d8acc9,CLOUDID:76c0499c-da39-4e3b-a854-56c7d2111b46,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 8e31797493c84bb5ab0895d48b16c5da-20220810
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 369321361; Wed, 10 Aug 2022 05:32:48 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 10 Aug 2022 20:32:46 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 10 Aug 2022 20:32:46 +0800
Message-ID: <e85295cb7a7a0dc928337b88a14af377c34b6108.camel@mediatek.com>
Subject: Re: [PATCH v2 0/2] Add mt8186 mutex support for mdp3
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@canonical.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Wed, 10 Aug 2022 20:32:45 +0800
In-Reply-To: <20220711123247.15807-1-allen-kh.cheng@mediatek.com>
References: <20220711123247.15807-1-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_053255_277602_22B48923 
X-CRM114-Status: GOOD (  14.38  )
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

Hi Matthias.

Gentle ping on this series.

Is this series ok for you?

BRs,
Allen

On Mon, 2022-07-11 at 20:32 +0800, Allen-KH Cheng wrote:
> This series are based on matthias.bgg/linux.git, for-next and provide
> mt8186 mutex support for Media Data Path 3 (MDP3).
> 
> As discussed, we add data field (mt8186_mdp_mutex_driver_data) for 
> mt8186 mdp3 mutex support instead of adding mutex_table_mod into
> mt8186
> disp mutex data.
> 
> changes since v1:
>  - add mt8186_mdp_mutex_table_mod
>  - add mt8186_mdp_mutex_driver_data for mt8186-mdp3-mutex
> 
> Allen-KH Cheng (2):
>   dt-bindings: soc: mediatek: add mdp3 mutex support for mt8186
>   soc: mediatek: mutex: add mt8186 mutex mod settings for mdp3
> 
>  .../bindings/soc/mediatek/mediatek,mutex.yaml |  1 +
>  drivers/soc/mediatek/mtk-mutex.c              | 28
> +++++++++++++++++++
>  include/linux/soc/mediatek/mtk-mutex.h        |  2 ++
>  3 files changed, 31 insertions(+)
> 


