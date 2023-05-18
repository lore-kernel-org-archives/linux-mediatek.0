Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB71AC77B7A
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 May 2023 09:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VzKc2k7NyA2mLL2kPW75AO8NqD4wuUtpSGNCGowpuLY=; b=KkfEuXcVlzFPBbfrZBqrU7zXBh
	9WwoJ5YEaaKADeVNCog65HX7hWO7S3l+S76UJwKQNNLypHetxz6USgs0oxqESrtTiknuyHN7AhYMc
	XmGscyE6RXEk8iKDYtvbnqT8Ov4h7j8uZSr2Xi0aIHMIMx14hMouQ8LU9aD12MGGHOYBRBx9CkrNQ
	Rj7uYLsDSXleYjY1jEHPAocKI/yIMpNqsk2OWM3Llj1S8pT3a7POmffjVpMXBstgtoAMtGiK3aVGd
	1DD5oaBYmhhDX+rHFGDXRryK8IeWGmCEE1zpTJldYMmjTu/06JgjLMz2SHcgV6W0DgsTaM/CvrJLq
	9be4hUqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzZxa-00CSan-2v;
	Thu, 18 May 2023 09:30:10 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzZxX-00CSZc-13;
	Thu, 18 May 2023 09:30:08 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 458946605861;
	Thu, 18 May 2023 10:30:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684402206;
	bh=epaDxPUKGiUHtcaIMP9idK9r5/SmG+H5QBtTlJTabkA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xjk6dQScD/4Lqb4N1yvNXuHLgxgcEni4Air2wJNCcrLCEja5mSdgEwLTDHw/f+98N
	 2ABmSe8hkXaXnvPfiQViffbOdMc5wJ5mR/HEvtRnVOBkr7UiRMrf6rWI+vB6EI5uhq
	 JAU5Kwma1Cxd/xSjMEEqTLKpc2T9yR3Z0lclVStyEdg5r18USJBk6p5XaNhnjjMQ6U
	 qZG8ChlKhEVQJLHCbiwZ6bOp/qOpKaeXKSLjyxmUtYQdJtk0lpwGSsgZIsBx4aynaq
	 3fBycQsd2qYcTTjzOhv/x/6Vt5IWfpoLGEQdnOdAwRg9mX2juKhMHg9tj+IeVw5leF
	 16uRSYz3z3c1Q==
Message-ID: <baee4956-b346-9009-2e60-200a64bad80e@collabora.com>
Date: Thu, 18 May 2023 11:30:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 2/2] drm/mediatek: Add DSI support for mt8188 vdosys0
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Nathan Lu <nathan.lu@mediatek.com>
References: <20230509150737.8075-1-jason-jh.lin@mediatek.com>
 <20230509150737.8075-3-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230509150737.8075-3-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_023007_494045_4F5D0B46 
X-CRM114-Status: GOOD (  12.42  )
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

Il 09/05/23 17:07, Jason-JH.Lin ha scritto:
> Add DSI as main display output for mt8188 vdosys0.
> 
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_disp_drv.h     | 1 +
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 1 +
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 5 +++++
>   drivers/gpu/drm/mediatek/mtk_dsi.c          | 9 +++++++++
>   4 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> index 72c57442f965..bf06ccb65652 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -48,6 +48,7 @@ int mtk_dpi_encoder_index(struct device *dev);
>   
>   void mtk_dsi_ddp_start(struct device *dev);
>   void mtk_dsi_ddp_stop(struct device *dev);
> +int mtk_dsi_encoder_index(struct device *dev);

unsigned int mtk_dsi_encoder_index(...)

Regards,
Angelo



