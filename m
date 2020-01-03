Return-Path: <SRS0=lxIO=2Y=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D1C0C32767
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2020 05:36:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02BCD24649
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2020 05:36:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L5FkA0em";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Q8NtEqV5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02BCD24649
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GBrTiFFmsjg8y7LHqUlmlYt6AMmLlugVMBepIpp37Ug=; b=L5FkA0emfYRhai
	yWrDOmEFstuyqWlzsPV41Hjj8RA1frIvpXI2umw1bchrVGkIM6fWjNDry3NlDwDKsK1hyvbHw587U
	JKxIS+m7rWWeaenCIH8aWX1AuwRIsDnGSA2hUqED9j90QXYb1x3pUxgLgPEEYqaKGty9TMspFzIJu
	JkYLMQbRIvLkQefW3VBtdvQgwHsToVfUqtsfJtkzUvxe6YdmYHOhjj7UaqlAzd+blbgwsXfXHXIY3
	/CfOx+dg8weA6Lia28m9U+kVW6QR8lz0m2oRx3ZNPH7RihWYrTTF3TEp80KEGjnJLbfuBV62q110u
	uWieG2gH4telZzSRkGRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1inFdm-0000a2-9m; Fri, 03 Jan 2020 05:36:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1inFdd-0000SA-UN; Fri, 03 Jan 2020 05:36:47 +0000
X-UUID: 8b66a59c2f654f05afddba74bd8861b2-20200102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=99ZrQnQ1iPB152bOaNM5TfX+bomBz2uWbjIND87FRX0=; 
 b=Q8NtEqV5m41LXDFZ9e7KbSlPZjOWLUl8DCtSf3sNb3XWOcLXX6LnZJ5iPRrWcUAwOe64BK0qXtJFRF/QrNkYamTpGVBAd4FCNNAGkGQ+ORtlmFOtjzvsk6PFiL3tDovIZ0IsYrYdlJkLr9hhTg8UIRbyX8pBAuurF+E66pFi7Tk=;
X-UUID: 8b66a59c2f654f05afddba74bd8861b2-20200102
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1052841253; Thu, 02 Jan 2020 21:36:40 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 2 Jan 2020 21:36:41 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 3 Jan 2020 13:36:03 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 3 Jan 2020 13:36:32 +0800
Message-ID: <1578029793.31107.5.camel@mtksdaap41>
Subject: Re: [RESEND PATCH v6 03/17] drm/mediatek: move dsi/dpi select input
 into mtk_ddp_sel_in
From: CK Hu <ck.hu@mediatek.com>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Date: Fri, 3 Jan 2020 13:36:33 +0800
In-Reply-To: <1578021148-32413-4-git-send-email-yongqiang.niu@mediatek.com>
References: <1578021148-32413-1-git-send-email-yongqiang.niu@mediatek.com>
 <1578021148-32413-4-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: DCF20F9DAAF3DBA7A01483A62A5004296DD1B8FCF4A251B8896B0FB66EF4AA542000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200102_213645_989134_1B55249A 
X-CRM114-Status: GOOD (  13.73  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Yongqiang:

On Fri, 2020-01-03 at 11:12 +0800, Yongqiang Niu wrote:
> move dsi/dpi select input into mtk_ddp_sel_in
> DPI_SEL_IN_BLS is zero, it is same with hardware default setting,
> DISP_REG_CONFIG_DPI_SEL no need set when bls connect with
> dpi0

I think you have done two things in this patch. One is remove
DISP_REG_CONFIG_DPI_SEL setting, and the other is move
DISP_REG_CONFIG_DSI_SEL from mtk_ddp_sout_sel() to mtk_ddp_sel_in(). So
separate this into two patches.

Regards,
CK

> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> index 39700b9..d66ce31 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> @@ -376,6 +376,9 @@ static unsigned int mtk_ddp_sel_in(enum mtk_ddp_comp_id cur,
>  	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
>  		*addr = DISP_REG_CONFIG_DSI_SEL;
>  		value = DSI_SEL_IN_BLS;
> +	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
> +		*addr = DISP_REG_CONFIG_DSI_SEL;
> +		value = DSI_SEL_IN_RDMA;
>  	} else {
>  		value = 0;
>  	}
> @@ -393,10 +396,6 @@ static void mtk_ddp_sout_sel(struct regmap *config_regs,
>  	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
>  		regmap_write(config_regs, DISP_REG_CONFIG_OUT_SEL,
>  				BLS_TO_DPI_RDMA1_TO_DSI);
> -		regmap_write(config_regs, DISP_REG_CONFIG_DSI_SEL,
> -				DSI_SEL_IN_RDMA);
> -		regmap_write(config_regs, DISP_REG_CONFIG_DPI_SEL,
> -				DPI_SEL_IN_BLS);
>  	}
>  }
>  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
