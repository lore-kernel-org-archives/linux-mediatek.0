Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42505C43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jul 2022 04:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/9UsxqfGhm1a6OwLGUJb8N93t1+xZxP9+itj9IWn8Wg=; b=uFrrE9oHd4V1d4qODbalaUWYR8
	ZcIyUDGdKgRgTwiygwgeDCPhG5G9yYF6wIwaY7jHnadxP/6LqGeGxxfeFCz0g1Gz0dj1ev+AQWvrb
	78KcLl7xLBgKSarYhFP2cowaHRU8kPcU1qqucjbhJOebuWW1tHT1dXBbG+5UARXmgzS7IE5FeyXJu
	bGCJEJ//ic0Y2Qo8IgtQsWT8liP3dOqcT1s08qOZlSTmzDdgCBf9tMAh5FYRlVUs5A5Yz+WcqLPqy
	9ySrXLJmFhkrksbOl+CzPPXp0fahxd7rS0hfZ8bLAPUNLAi7Nz/N5RpdSgJatpf4MYH30/9ENFeg0
	I68OWGSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Zxx-00EOXD-Fh; Tue, 05 Jul 2022 04:15:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Zxn-00EOUV-5s; Tue, 05 Jul 2022 04:15:04 +0000
X-UUID: 4fba989945d0452c909c04ab6e700c4f-20220704
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:5fd1150d-e084-4176-8a1e-6a8898a72fca,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:17d96b63-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 4fba989945d0452c909c04ab6e700c4f-20220704
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 103197131; Mon, 04 Jul 2022 21:14:59 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 5 Jul 2022 11:44:20 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 5 Jul 2022 11:44:20 +0800
Message-ID: <a50ede187d6a9015c8458d23b88f9690f380129b.camel@mediatek.com>
Subject: Re: [PATCH v15 03/16] drm/mediatek: dpi: Add kernel document for
 struct mtk_dpi_conf
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
	<p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
	<airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<xinlei.lee@mediatek.com>, <liangxu.xu@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 5 Jul 2022 11:44:19 +0800
In-Reply-To: <20220701035845.16458-4-rex-bc.chen@mediatek.com>
References: <20220701035845.16458-1-rex-bc.chen@mediatek.com>
	 <20220701035845.16458-4-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_211503_272248_543C069C 
X-CRM114-Status: GOOD (  15.60  )
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

Hi, Bo-Chen:

On Fri, 2022-07-01 at 11:58 +0800, Bo-Chen Chen wrote:
> This driver will support dp_intf and there are many configs between
> dpi
> and dp_intf. Therefore, we will add many configs in "struct
> mtk_dpi_conf".
> To let this structure more readable, we add this kernel doc.

Applied to mediatek-drm-next [1], thanks.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-next

Regards,
CK

> 
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index e61cd67b978f..f66a121ba0c9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -118,6 +118,15 @@ struct mtk_dpi_yc_limit {
>  	u16 c_bottom;
>  };
>  
> +/**
> + * struct mtk_dpi_conf - Configuration of mediatek dpi.
> + * @cal_factor: Callback function to calculate factor value.
> + * @reg_h_fre_con: Register address of frequency control.
> + * @max_clock_khz: Max clock frequency supported for this SoCs in
> khz units.
> + * @edge_sel_en: Enable of edge selection.
> + * @output_fmts: Array of supported output formats.
> + * @num_output_fmts: Quantity of supported output formats.
> + */
>  struct mtk_dpi_conf {
>  	unsigned int (*cal_factor)(int clock);
>  	u32 reg_h_fre_con;


