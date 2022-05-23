Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD84C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 09:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4OOg+YtrC/Sob77zqlsb3jqh94uVyG5oxZg2RXbsnCU=; b=zpwAwKSoo94zVw
	Gj49NEZ53le6h5uOQ0xiYL/vLDc6SeEFiPerUQxq08uN9rTH3Hs64gUmLDBkdDzUTN85EpnenrLur
	iU/7UHkSZZCpMbLgYON167NwlLyfrN3q8obTd9/2977A4+nzrCRlSwHJ8YehPDhdLM9soSFQucnAi
	d35K6//YPjJvfO75JbrU/HtLtBaiiPw74C2VbsFFHO5aIAHbJQLkKFsrKBfLzJzqTJSsuP6Meh9jw
	beVbU40xHJ9vhIvK6kgv/U9XXb+yJ6GQ+hq0jeeJv9h4v4K0mWIUXWkVS1v2xlYzmkPD1GMHyNR/q
	JEdkM31Rc8BYqu+OXInQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt4mP-00314q-Ax; Mon, 23 May 2022 09:55:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt3sM-002cej-IU; Mon, 23 May 2022 08:57:20 +0000
X-UUID: cfc8c83d20b5421fac8227f1faeda9d9-20220523
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:83f01c11-a14b-4b57-b60d-66bd3b3e2b7a, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:be37467a-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: cfc8c83d20b5421fac8227f1faeda9d9-20220523
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jia-wei.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 348436489; Mon, 23 May 2022 01:57:11 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 01:57:09 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Mon, 23 May 2022 16:57:08 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 23 May 2022 16:57:08 +0800
Message-ID: <f2dd851bdabe03c67da520ec1d2cdfdadc95e6f3.camel@mediatek.com>
Subject: Re: [PATCH v2 0/4] soc: mediatek: svs: add support for mt8186 and
From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Roger Lu
 <roger.lu@mediatek.com>, Kevin Hilman <khilman@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Mon, 23 May 2022 16:57:08 +0800
In-Reply-To: <20220523084034.26802-1-jia-wei.chang@mediatek.com>
References: <20220523084034.26802-1-jia-wei.chang@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_015718_676126_53BFEC3D 
X-CRM114-Status: GOOD (  14.21  )
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

On Mon, 2022-05-23 at 16:40 +0800, Tim Chang wrote:

The Subject is for [Patch v3 0/4] rather than v2.
Sorry for my typo.

> From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> 
> This series supports MT8186 and MT8195 Smart Voltage Scaling (SVS)
> hardware which used as optimization of opp voltage table for
> corresponding dvfs drivers.
> 
> This series is based on Roger's series [1].
> [1]: Message ID: 20220516004311.18358-1-roger.lu@mediatek.com
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
>  drivers/soc/mediatek/mtk-svs.c                | 502
> +++++++++++++++++-
>  2 files changed, 498 insertions(+), 7 deletions(-)
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
