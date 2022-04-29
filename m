Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE405C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 09:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Vpioy3557DAtXHP45Carplqm7psD8po7767NxnM+ls=; b=5B8FhSV/UMdu+Y
	EHQk0ynX64r1LClPSJlI6kY9cxSaEAMrTlgX/JZiuaZ7irC+MH9JJmGAb9sRrYlB+XTWzMH938sgE
	3dqEVm2tK7TYYF9Qu2CG5GeD+RicSfLYUFGEl7qd4BXinQq55RRw5Hiq4+oSja9TeXBd79fHZyx0c
	XwTv7wE3BGBHUp5LkMWJsXmJHfa0TOLFECRwZRiQu1APeaUCiRXWPA2VLE/q2T9LQGuerBKZzyV4X
	DbdXU93gPQJ466rOpU1oaEZ4j129dLIhILelCahLB1rj4sy55wkop0WXbLAP/4mzkm0dbRRUATTLP
	Uc4DCyyWcHVL2CIPoVbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkMwZ-00AN8f-Sq; Fri, 29 Apr 2022 09:29:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkMwW-00AN6O-IA; Fri, 29 Apr 2022 09:29:42 +0000
X-UUID: e8ccaf0848304c9590e2e0d3dd915771-20220429
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:ea9ad940-fb4e-4b7b-8934-0201afec6629, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:32e9f4c6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: e8ccaf0848304c9590e2e0d3dd915771-20220429
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 637677441; Fri, 29 Apr 2022 02:29:27 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Apr 2022 02:29:25 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 29 Apr 2022 17:29:23 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 Apr 2022 17:29:23 +0800
Message-ID: <f3a64f5c9b1e208177cc89cee617453a67c6b532.camel@mediatek.com>
Subject: Re: [PATCH v18 08/21] soc: mediatek: add mtk-mutex support for
 mt8195 vdosys1
From: CK Hu <ck.hu@mediatek.com>
To: Nancy.Lin <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <wim@linux-watchdog.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
CC: <devicetree@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, <singo.chang@mediatek.com>,
 <llvm@lists.linux.dev>, Nick Desaulniers <ndesaulniers@google.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Nathan
 Chancellor" <nathan@kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>
Date: Fri, 29 Apr 2022 17:29:23 +0800
In-Reply-To: <20220428105408.11189-9-nancy.lin@mediatek.com>
References: <20220428105408.11189-1-nancy.lin@mediatek.com>
 <20220428105408.11189-9-nancy.lin@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_022940_633338_00D7557F 
X-CRM114-Status: GOOD (  17.36  )
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

Hi, Nancy:

On Thu, 2022-04-28 at 18:53 +0800, Nancy.Lin wrote:
> Add mtk-mutex support for mt8195 vdosys1.
> The vdosys1 path component contains ovl_adaptor, merge5,
> and dp_intf1. Ovl_adaptor is composed of several sub-elements
> which include MDP_RDMA0~7, MERGE0~3, and ETHDR.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/soc/mediatek/mtk-mutex.c | 37
> ++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-mutex.c
> b/drivers/soc/mediatek/mtk-mutex.c
> index 981d56967e7a..78197ebf5595 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -110,6 +110,24 @@
>  #define MT8195_MUTEX_MOD_DISP_DP_INTF0		21
>  #define MT8195_MUTEX_MOD_DISP_PWM0		27
>  
> +#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA0	0
> +#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA1	1
> +#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA2	2
> +#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA3	3
> +#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA4	4
> +#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA5	5
> +#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA6	6
> +#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA7	7
> +#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE0	8
> +#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE1	9
> +#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE2	10
> +#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE3	11
> +#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE4	12
> +#define MT8195_MUTEX_MOD_DISP1_DISP_MIXER	18
> +#define MT8195_MUTEX_MOD_DISP1_DPI0		25
> +#define MT8195_MUTEX_MOD_DISP1_DPI1		26
> +#define MT8195_MUTEX_MOD_DISP1_DP_INTF0		27
> +
>  #define MT2712_MUTEX_MOD_DISP_PWM2		10
>  #define MT2712_MUTEX_MOD_DISP_OVL0		11
>  #define MT2712_MUTEX_MOD_DISP_OVL1		12
> @@ -313,6 +331,21 @@ static const unsigned int
> mt8195_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>  	[DDP_COMPONENT_DSI0] = MT8195_MUTEX_MOD_DISP_DSI0,
>  	[DDP_COMPONENT_PWM0] = MT8195_MUTEX_MOD_DISP_PWM0,
>  	[DDP_COMPONENT_DP_INTF0] = MT8195_MUTEX_MOD_DISP_DP_INTF0,
> +	[DDP_COMPONENT_MDP_RDMA0] = MT8195_MUTEX_MOD_DISP1_MDP_RDMA0,
> +	[DDP_COMPONENT_MDP_RDMA1] = MT8195_MUTEX_MOD_DISP1_MDP_RDMA1,
> +	[DDP_COMPONENT_MDP_RDMA2] = MT8195_MUTEX_MOD_DISP1_MDP_RDMA2,
> +	[DDP_COMPONENT_MDP_RDMA3] = MT8195_MUTEX_MOD_DISP1_MDP_RDMA3,
> +	[DDP_COMPONENT_MDP_RDMA4] = MT8195_MUTEX_MOD_DISP1_MDP_RDMA4,
> +	[DDP_COMPONENT_MDP_RDMA5] = MT8195_MUTEX_MOD_DISP1_MDP_RDMA5,
> +	[DDP_COMPONENT_MDP_RDMA6] = MT8195_MUTEX_MOD_DISP1_MDP_RDMA6,
> +	[DDP_COMPONENT_MDP_RDMA7] = MT8195_MUTEX_MOD_DISP1_MDP_RDMA7,
> +	[DDP_COMPONENT_MERGE1] = MT8195_MUTEX_MOD_DISP1_VPP_MERGE0,
> +	[DDP_COMPONENT_MERGE2] = MT8195_MUTEX_MOD_DISP1_VPP_MERGE1,
> +	[DDP_COMPONENT_MERGE3] = MT8195_MUTEX_MOD_DISP1_VPP_MERGE2,
> +	[DDP_COMPONENT_MERGE4] = MT8195_MUTEX_MOD_DISP1_VPP_MERGE3,
> +	[DDP_COMPONENT_ETHDR_MIXER] =
> MT8195_MUTEX_MOD_DISP1_DISP_MIXER,
> +	[DDP_COMPONENT_MERGE5] = MT8195_MUTEX_MOD_DISP1_VPP_MERGE4,
> +	[DDP_COMPONENT_DP_INTF1] = MT8195_MUTEX_MOD_DISP1_DP_INTF0,
>  };
>  
>  static const unsigned int mt2712_mutex_sof[DDP_MUTEX_SOF_MAX] = {
> @@ -498,6 +531,9 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
>  	case DDP_COMPONENT_DP_INTF0:
>  		sof_id = MUTEX_SOF_DP_INTF0;
>  		break;
> +	case DDP_COMPONENT_DP_INTF1:
> +		sof_id = MUTEX_SOF_DP_INTF1;

This is not strongly related to mt8195, so move this to an independent
patch.

> +		break;
>  	default:
>  		if (mtx->data->mutex_mod[id] < 32) {
>  			offset = DISP_REG_MUTEX_MOD(mtx->data-
> >mutex_mod_reg,
> @@ -538,6 +574,7 @@ void mtk_mutex_remove_comp(struct mtk_mutex
> *mutex,
>  	case DDP_COMPONENT_DPI0:
>  	case DDP_COMPONENT_DPI1:
>  	case DDP_COMPONENT_DP_INTF0:
> +	case DDP_COMPONENT_DP_INTF1:

Ditto.

Regards,
CK

>  		writel_relaxed(MUTEX_SOF_SINGLE_MODE,
>  			       mtx->regs +
>  			       DISP_REG_MUTEX_SOF(mtx->data-
> >mutex_sof_reg,


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
