Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 604FDC43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 09:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BJzyoYM+C3+LQ65i6GY/2PD5e34IEcuiI4P0WwIBVL8=; b=xxmkjJgIrr5SC6
	Y3sj4yeaOsTQD1Ae5VOQWSCN4KtU2v4Ifn7tWORxkf7laDbIbpLe8lpLwJPSXCIyT0MyFhDtCSef5
	JjsoVr4IG7QVO5Q0JJYj3Z4ACYRsc7Saj8KNlCgjGT0NOR+bB7uJVuJuhbvMuPvVjUChuESADittT
	KZ4bejsvLyiteEjApMwvLeHYLMywHJPiwZDOXMSs16Cap2S+qO8d14vOMh25hrZ5aEJth7Tp2wmtp
	hcOaXpu9XAJ5yEXQaRSQlpGrp2f8GhwA1VdsdGT7QZlftVzV3WUC7oZOCSR+cCBJDt3rJkYj6hKY3
	Rz5Uro5KALV4zXyBiFkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVRl-006Bjq-G8; Tue, 07 Jun 2022 09:24:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVJA-0067s2-Pb; Tue, 07 Jun 2022 09:15:30 +0000
X-UUID: 284d33140c0f4fe8a4b938e47d20807c-20220607
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:55d62d8d-ec21-4a49-aa39-79d756a26768,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:2a19b09,CLOUDID:955f777e-c8dc-403a-96e8-6237210dceee,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: 284d33140c0f4fe8a4b938e47d20807c-20220607
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1386274426; Tue, 07 Jun 2022 02:15:21 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Jun 2022 02:15:20 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 7 Jun 2022 17:15:18 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Jun 2022 17:15:18 +0800
Message-ID: <ef822bb6f526c8bfa3a42cfc492bdd9dae22a097.camel@mediatek.com>
Subject: Re: [PATCH v19 2/6] soc: mediatek: mutex: add 8183 MUTEX MOD
 settings for MDP
From: CK Hu <ck.hu@mediatek.com>
To: Moudy Ho <moudy.ho@mediatek.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Landley <rob@landley.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Alexandre Courbot
	<acourbot@chromium.org>, <tfiga@chromium.org>, <drinkcat@chromium.org>,
	<pihsun@chromium.org>, <hsinyi@google.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, daoyuan huang
	<daoyuan.huang@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
	<allen-kh.cheng@mediatek.com>, <xiandong.wang@mediatek.com>,
	<randy.wu@mediatek.com>, <jason-jh.lin@mediatek.com>,
	<roy-cw.yeh@mediatek.com>, <river.cheng@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<cellopoint.kai@gmail.com>
Date: Tue, 7 Jun 2022 17:15:18 +0800
In-Reply-To: <20220531055224.19280-3-moudy.ho@mediatek.com>
References: <20220531055224.19280-1-moudy.ho@mediatek.com>
	 <20220531055224.19280-3-moudy.ho@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_021528_903776_A452BEEE 
X-CRM114-Status: GOOD (  17.76  )
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

Hi, Moudy:

On Tue, 2022-05-31 at 13:52 +0800, Moudy Ho wrote:
> For the purpose of module independence, related settings should be
> moved
> from MDP to the corresponding driver.
> This patch adds 8183 MUTEX MOD settings for MDP.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-mutex.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-mutex.c
> b/drivers/soc/mediatek/mtk-mutex.c
> index a3b054b33826..23009445adb4 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -80,6 +80,15 @@
>  #define MT8183_MUTEX_MOD_DISP_GAMMA0		16
>  #define MT8183_MUTEX_MOD_DISP_DITHER0		17
>  
> +#define MT8183_MUTEX_MOD_MDP_RDMA0		2
> +#define MT8183_MUTEX_MOD_MDP_RSZ0		4
> +#define MT8183_MUTEX_MOD_MDP_RSZ1		5
> +#define MT8183_MUTEX_MOD_MDP_TDSHP0		6
> +#define MT8183_MUTEX_MOD_MDP_WROT0		7
> +#define MT8183_MUTEX_MOD_MDP_WDMA		8
> +#define MT8183_MUTEX_MOD_MDP_AAL0		23
> +#define MT8183_MUTEX_MOD_MDP_CCORR0		24
> +
>  #define MT8173_MUTEX_MOD_DISP_OVL0		11
>  #define MT8173_MUTEX_MOD_DISP_OVL1		12
>  #define MT8173_MUTEX_MOD_DISP_RDMA0		13
> @@ -273,6 +282,17 @@ static const unsigned int
> mt8183_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>  	[DDP_COMPONENT_WDMA0] = MT8183_MUTEX_MOD_DISP_WDMA0,
>  };
>  
> +static const unsigned int mt8183_mutex_table_mod[MUTEX_MOD_IDX_MAX]
> = {
> +	[MUTEX_MOD_IDX_MDP_RDMA0] = MT8183_MUTEX_MOD_MDP_RDMA0,
> +	[MUTEX_MOD_IDX_MDP_RSZ0] = MT8183_MUTEX_MOD_MDP_RSZ0,
> +	[MUTEX_MOD_IDX_MDP_RSZ1] = MT8183_MUTEX_MOD_MDP_RSZ1,
> +	[MUTEX_MOD_IDX_MDP_TDSHP0] = MT8183_MUTEX_MOD_MDP_TDSHP0,
> +	[MUTEX_MOD_IDX_MDP_WROT0] = MT8183_MUTEX_MOD_MDP_WROT0,
> +	[MUTEX_MOD_IDX_MDP_WDMA] = MT8183_MUTEX_MOD_MDP_WDMA,
> +	[MUTEX_MOD_IDX_MDP_AAL0] = MT8183_MUTEX_MOD_MDP_AAL0,
> +	[MUTEX_MOD_IDX_MDP_CCORR0] = MT8183_MUTEX_MOD_MDP_CCORR0,
> +};
> +
>  static const unsigned int mt8186_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>  	[DDP_COMPONENT_AAL0] = MT8186_MUTEX_MOD_DISP_AAL0,
>  	[DDP_COMPONENT_CCORR] = MT8186_MUTEX_MOD_DISP_CCORR0,
> @@ -400,6 +420,7 @@ static const struct mtk_mutex_data
> mt8183_mutex_driver_data = {
>  	.mutex_sof = mt8183_mutex_sof,
>  	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
>  	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
> +	.mutex_table_mod = mt8183_mutex_table_mod,
>  	.no_clk = true,
>  };
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
