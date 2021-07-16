Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D96C636CA
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 05:57:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1213611AB
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 05:57:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1213611AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XrMVkWyXO/vURLVHZbiMEWOiKoXLmIVPiyvssLqLptY=; b=M5G0hYM1h2555L
	k48n6lrHbV5WA53Ew20k2Rw0DOxM0XScZmiyx+kexjORK5oWlAjVK1ZQqF0WKd1BMlaFaz3NN0lCI
	Ld3OSYch/svRFI78SxctE+/FZesL8ggq/vHkc323eC0wEehuFB9Rhi+Ek/OSRYdUlHi7PLmnT6zIW
	So6FoZlWUVnAZ80vtIzs3rkAzjEAeJOcu1FEksvgcpxc6lpNF6sIHq/wCL5W+xUuWrcBW6pnRGK9F
	Asyo45YCWcEu+Hce8aAxZ3SiD0duF/jxDyyYG/O3VT8M8NhMTqAyiQ2CRBpq+MSKRE/V8QqdtC3uM
	r5nqB4Q6tm7t6VLST+Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4GqN-003IKy-5L; Fri, 16 Jul 2021 05:57:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4GqJ-003IK8-LA; Fri, 16 Jul 2021 05:57:02 +0000
X-UUID: 52c29ad39bd840b0bd9c44ef9fd2f95c-20210715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=huBBs74sIuYd7dGr/eJzbVMsc2ILmvG+DwEkvTlnfDg=; 
 b=V0h4sPD2kSQc64NCjkS75QfsM0a4xFJNvIB9E3Q/XrhU/eWKKn1Epmso88Ojdryjq47pclQA5U5qk0Eah1/WCLtxmS3248e7w7JO8K5fsi0ErhLGqTqvJ5xLsn53bP/5aA8BgoOKfRGHPIleDkFaW06RUhxclDhpE/iOs/RptLA=;
X-UUID: 52c29ad39bd840b0bd9c44ef9fd2f95c-20210715
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1342143132; Thu, 15 Jul 2021 22:56:56 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 22:46:53 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Jul 2021 13:46:52 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 16 Jul 2021 13:46:52 +0800
Message-ID: <1626414412.24603.0.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: mtk-dpi: Set out_fmt from config if not
 the last bridge
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi
 <jitao.shi@mediatek.com>, David Airlie <airlied@linux.ie>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Rex-BC
 Chen" <rex-bc.chen@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>
Date: Fri, 16 Jul 2021 13:46:52 +0800
In-Reply-To: <20210712094657.1159299-1-hsinyi@chromium.org>
References: <20210712094657.1159299-1-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_225659_729472_D9333ED5 
X-CRM114-Status: GOOD (  17.14  )
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

Hi, Hsin-yi:

On Mon, 2021-07-12 at 17:46 +0800, Hsin-Yi Wang wrote:
> atomic_get_output_bus_fmts() is only called when the bridge is the last
> element in the bridge chain.
> 
> If mtk-dpi is not the last bridge, the format of output_bus_cfg is
> MEDIA_BUS_FMT_FIXED, and mtk_dpi_dual_edge() will fail to write correct
> value to regs.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Fixes: ec8747c52434 ("drm/mediatek: dpi: Add bus format negotiation")
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index bced555648b01..25c565f9179cc 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -610,6 +610,10 @@ static int mtk_dpi_bridge_atomic_check(struct drm_bridge *bridge,
>  
>  	out_bus_format = bridge_state->output_bus_cfg.format;
>  
> +	if (out_bus_format == MEDIA_BUS_FMT_FIXED)
> +		if (dpi->conf->num_output_fmts)
> +			out_bus_format = dpi->conf->output_fmts[0];
> +
>  	dev_dbg(dpi->dev, "input format 0x%04x, output format 0x%04x\n",
>  		bridge_state->input_bus_cfg.format,
>  		bridge_state->output_bus_cfg.format);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
