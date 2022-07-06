Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0453C43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 03:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fOgdua1g7BQiVxvJ2RwbnxD1OPVCRcYU3dGal6NqZ98=; b=5CWda0p+VAbGfiKwnMtdKPWvlm
	Ayf8yiIWpWXk5aumfuUvjjs8zwc8nnLPDocARJ57BunCAk/F9MxasOkEDTePr1to92PBc/q46NKEs
	y9DgmRxVND0FG2sW0QR5nzHYiL0IBsTEKkn8qopwqCCx4qF1eLaZeicKQhz9tWlRDpmMXGraj89Ru
	gNTmXAiG6PeY57PxLu5lwcTNYe9EinYz1QhQx07EQrs7RnfC27Dt8+8ifFid341DHcHulYxXHxozJ
	B9yndBvCl1g1s3sJZ14LRPVgMN1kK5XaH9efCs2TTycelQYlp4G2TtjoF4gWgqi8pCNnohpDS4iOM
	aFCb3AJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8vni-005WF9-JT; Wed, 06 Jul 2022 03:34:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8vnf-005WDl-7U; Wed, 06 Jul 2022 03:34:06 +0000
X-UUID: bd5a0a77a73c4a83995a6b5990921f37-20220705
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:72e371bb-7717-4bb0-afe1-85baa59c8af0,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:75bab7d6-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: bd5a0a77a73c4a83995a6b5990921f37-20220705
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jia-wei.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2028434933; Tue, 05 Jul 2022 20:33:53 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 6 Jul 2022 11:33:18 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 6 Jul 2022 11:33:18 +0800
Message-ID: <6ce60f09ccc60415bdee90ab2b336a3bbc61c102.camel@mediatek.com>
Subject: Re: [PATCH v4 0/4] soc: mediatek: svs: add support for mt8186 and
From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Roger Lu
	<roger.lu@mediatek.com>, Kevin Hilman <khilman@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Wed, 6 Jul 2022 11:33:16 +0800
In-Reply-To: <20220620033156.21489-1-jia-wei.chang@mediatek.com>
References: <20220620033156.21489-1-jia-wei.chang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_203403_316573_0606243A 
X-CRM114-Status: GOOD (  15.75  )
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

Hi Matthias,

Just a gentle ping for this series, is there anything I can do to get
this series merged?  Or can you help give an advice on it?

Thanks,
Jia-wei

On Mon, 2022-06-20 at 11:31 +0800, jia-wei.chang wrote:
> This series supports MT8186 and MT8195 Smart Voltage Scaling (SVS)
> hardware which used as optimization of opp voltage table for
> corresponding dvfs drivers.
> 
> This series is based on [1].
> [1]: 
> https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/log/?h=for-next
> 
> Change since v3:
> - Remove irqflags of MT8186 and MT8195.
> 
> Change since v2:
> - Reuse platform probe of MT8192 for MT8195.
> - Remove unnecessary svs bank parameters of MT8195.
> - Remove sw id check for MT8195 efuse parsing.
> 
> Change since v1:
> - Add myself as a co-maintainer of mtk-svs.yaml.
> - Fix MT8186 error handling in platform probe.
> - Add dt-bindings and support for MT8195 platform.
> 
> Jia-Wei Chang (4):
>   dt-bindings: soc: mediatek: add mt8186 svs dt-bindings
>   soc: mediatek: svs: add support for mt8186
>   dt-bindings: soc: mediatek: add mt8195 svs dt-bindings
>   soc: mediatek: svs: add support for mt8195
> 
>  .../bindings/soc/mediatek/mtk-svs.yaml        |   3 +
>  drivers/soc/mediatek/mtk-svs.c                | 500
> +++++++++++++++++-
>  2 files changed, 496 insertions(+), 7 deletions(-)
> 


