Return-Path: <SRS0=lxIO=2Y=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF7BC32771
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2020 05:45:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15652217F4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2020 05:45:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PS/xKebA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="MG90BSh7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15652217F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bZBox9JWDnAY1B5EB5lCjgMl6R7w9kQPbAUu7yJW5rU=; b=PS/xKebAvyFsBU
	RJasWYmer/B2hLUMAAs4nrudoX7lsCni+CMplmK8+QjvwGo24dzmRsWmgKZQ++GetTDc0QcVeV0+C
	9v4hJIPSSJNtfP6DuQnN+izEM0LWgoue+COsOdZDq/fbRSGqLSRyfVMaVKDnizq1gakyTYZ1C6dGT
	o/9PDC1E03ESuESWnzoR3p/dgxOLutpKUETfICfyy4qqY3tCFUupnlQJXDYIDWFZweph31uyVG3r+
	3BuXq7Gs9oavG/ijVFTSQp3vH0HaKDv1e+M/MPP0SFrJia9vTGhJFA4Qv2Fx4i4ihKfI+1dkeUlmy
	iCCkRIUVc/2npSaLWl8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1inFlk-0003Km-O9; Fri, 03 Jan 2020 05:45:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1inFlU-0002Sp-GA; Fri, 03 Jan 2020 05:44:54 +0000
X-UUID: 2bc112590e0a4f959119186fc07b56ae-20200102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=iAyHZ4cFlXp1ARnIl3ujSzsZWrgcDzAuYJCkSJsgRYA=; 
 b=MG90BSh7WCx0zYL9K18yzzFllbOvsRg/Kss8w4Sl97K1SGwWcQbhJ5bSuSSriddUDFXnrFue4gwctmewK19YT+LxCEfjIsIs4Bnfa/9hVeZdf4Al2qNJNt0yRU7JNaKWy1tmUnwZVGbIgdeEnk2iDV9rz9LoImdUswwyht0utTM=;
X-UUID: 2bc112590e0a4f959119186fc07b56ae-20200102
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1743873709; Thu, 02 Jan 2020 21:44:48 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 2 Jan 2020 21:44:49 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 3 Jan 2020 13:43:27 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 3 Jan 2020 13:44:38 +0800
Message-ID: <1578030279.31107.6.camel@mtksdaap41>
Subject: Re: [RESEND PATCH v6 04/17] drm/mediatek: make sout select function
 format same with select input
From: CK Hu <ck.hu@mediatek.com>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Date: Fri, 3 Jan 2020 13:44:39 +0800
In-Reply-To: <1578021148-32413-5-git-send-email-yongqiang.niu@mediatek.com>
References: <1578021148-32413-1-git-send-email-yongqiang.niu@mediatek.com>
 <1578021148-32413-5-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1848600F3CEC16E3DFB594BA8C709B4E788EBFB65D29CB182A8A734332A829032000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200102_214452_548207_9FD12BC6 
X-CRM114-Status: GOOD (  13.62  )
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
> there will be more sout case in the future,
> make the sout function format same mtk_ddp_sel_in
> 

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> index d66ce31..ae08fc4 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> @@ -386,17 +386,23 @@ static unsigned int mtk_ddp_sel_in(enum mtk_ddp_comp_id cur,
>  	return value;
>  }
>  
> -static void mtk_ddp_sout_sel(struct regmap *config_regs,
> -			     enum mtk_ddp_comp_id cur,
> -			     enum mtk_ddp_comp_id next)
> +static unsigned int mtk_ddp_sout_sel(enum mtk_ddp_comp_id cur,
> +				     enum mtk_ddp_comp_id next,
> +				     unsigned int *addr)
>  {
> +	unsigned int value;
> +
>  	if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
> -		regmap_write(config_regs, DISP_REG_CONFIG_OUT_SEL,
> -				BLS_TO_DSI_RDMA1_TO_DPI1);
> +		*addr = DISP_REG_CONFIG_OUT_SEL;
> +		value = BLS_TO_DSI_RDMA1_TO_DPI1;
>  	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
> -		regmap_write(config_regs, DISP_REG_CONFIG_OUT_SEL,
> -				BLS_TO_DPI_RDMA1_TO_DSI);
> +		*addr = DISP_REG_CONFIG_OUT_SEL;
> +		value = BLS_TO_DPI_RDMA1_TO_DSI;
> +	} else {
> +		value = 0;
>  	}
> +
> +	return value;
>  }
>  
>  void mtk_ddp_add_comp_to_path(struct regmap *config_regs,
> @@ -409,7 +415,9 @@ void mtk_ddp_add_comp_to_path(struct regmap *config_regs,
>  	if (value)
>  		regmap_update_bits(config_regs, addr, value, value);
>  
> -	mtk_ddp_sout_sel(config_regs, cur, next);
> +	value = mtk_ddp_sout_sel(cur, next, &addr);
> +	if (value)
> +		regmap_update_bits(config_regs, addr, value, value);
>  
>  	value = mtk_ddp_sel_in(cur, next, &addr);
>  	if (value)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
