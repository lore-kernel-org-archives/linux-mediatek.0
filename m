Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0B0C28B2B
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Aug 2022 18:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ldPR8SPOd9mlNUaQYSK+Gq96cyHsu+cvJybydre7Q38=; b=M3RVEgqYIT5tXJR8sLp4bIP1O4
	OHn61kB/4xETKHbG3qDknjKkCO3eQCnyhXU81Hon4CEp/XhilFcSSkjsPLY7xazcAPFHbQB2g0snx
	N3EUo8yWoovzFySzGybC3RZTZCVnYzr51iwHCHRdsqrrb+nGXEFZobp7FWteF9yIiKFDnMPePwss9
	t2EdqqBuAEEBNO/IiU7QX6yk41hQ/wcywPP9e6ixWIDeRezOf4/u0MQMYE99y6Js+6fjcysSHbHGE
	XOFxZHvTiQ2wLN/6c+hZaI6x/DqSepeLoE0bkP6HbNymrkvkeAE2CUk5jvjxowUmQKKWiP9TpwSIS
	FbSwxkzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP78P-00BKPL-90; Fri, 19 Aug 2022 18:54:21 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP78D-00BKId-Ef; Fri, 19 Aug 2022 18:54:10 +0000
Received: from notapiano (unknown [70.107.189.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 240DC6601DC5;
	Fri, 19 Aug 2022 19:54:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1660935245;
	bh=K0YLkb0y8E7IJjuV74dUqvmMPhGIIPSjh8y+QKSzuUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NnetjEoq0ZAPXfWQ9ci9nv05AU+ZorGb7w0REYn9xsxSKYfG+1B4H7QoC6Ee2r3oo
	 eHx9NNBXej7nZ7pvMxtwRVBkhVA+/gvbWUmAk4NvzaifkQNUyfdZ8MGZtDWsif7nGk
	 CS1hzqBGqDlZdmPpzSNFQ4A2CIMJYO+qPZHVIOlHRd8K/GLCzpVKAUnu9z5ZUEXTKp
	 I55hbtVYs7VwTxzDdPQ4oJN830xsylunDdRgCia0JXtMqGElmaG9ctyR1FxGrWCWqK
	 RMyvuMFRD9Gbx+8K3NfvyF1oRrlsi/12sDrqsHUM0v14tBtHfkwjVBs9/4z9fML1jU
	 TR6pxUAL4Ojfw==
Date: Fri, 19 Aug 2022 14:54:00 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: xinlei.lee@mediatek.com
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
	daniel@ffwll.ch, matthias.bgg@gmail.com,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v2,1/2] soc: mediatek: Add mmsys func to adapt to dpi
 output for MT8186
Message-ID: <20220819185400.aokd53xln6rmc3xk@notapiano>
References: <1659693461-27057-1-git-send-email-xinlei.lee@mediatek.com>
 <1659693461-27057-2-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1659693461-27057-2-git-send-email-xinlei.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_115409_663761_3987729A 
X-CRM114-Status: GOOD (  14.81  )
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

Hi Xinlei,

On Fri, Aug 05, 2022 at 05:57:40PM +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add mmsys func to manipulate dpi output format config for MT8186.

func -> function
config -> configuration

> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>

Same thing about the co-developed-by.

> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> ---
>  drivers/soc/mediatek/mt8186-mmsys.h    | 1 +
>  drivers/soc/mediatek/mtk-mmsys.c       | 8 ++++++++
>  include/linux/soc/mediatek/mtk-mmsys.h | 3 +++
>  3 files changed, 12 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mt8186-mmsys.h b/drivers/soc/mediatek/mt8186-mmsys.h
> index eb1ad9c37a9c..620c062e4893 100644
> --- a/drivers/soc/mediatek/mt8186-mmsys.h
> +++ b/drivers/soc/mediatek/mt8186-mmsys.h
> @@ -3,6 +3,7 @@
>  #ifndef __SOC_MEDIATEK_MT8186_MMSYS_H
>  #define __SOC_MEDIATEK_MT8186_MMSYS_H
>  
> +#define MT8186_DPI_OUTPUT_FORMAT		0X400

0x400

(lowercase "x")

>  #define MT8186_MMSYS_OVL_CON			0xF04
>  #define MT8186_MMSYS_OVL0_CON_MASK			0x3
>  #define MT8186_MMSYS_OVL0_2L_CON_MASK			0xC
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 9bbf0103b225..0e71a3296046 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -252,6 +252,14 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>  }
>  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
>  
> +void mtk_mmsys_ddp_dpi_confing(struct device *dev, u32 mask, u32 val,

confing -> config

But I'd add something to the name to indicate it handles specifically the
format:

mtk_mmsys_ddp_dpi_fmt_config

Thanks,
Nícolas

