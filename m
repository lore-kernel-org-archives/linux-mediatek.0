Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4912C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 12:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZTsjUj8RLt2V5VEkWFvUC0HnGzgT0MUSMOHyX4G8zlo=; b=K+MBAd8nLaQQpI
	YUzJcHq+ACLuHzxEq/sguV5xRL0DMicDyS9QNTOhRXY0GIr0mj+EonkaYT1J2T7GMqkFr4gPE1hf3
	SThplFMc+Ld9wROBOZ9DahikQcH7TMawjndjfoQaGblTgNUVZ830D11238IiSvR8QTLHKEC9Yu9BI
	K+qt3i+9B1KlaP4q368Xk5fyRiqpcbHZ1d7tMOADSW9RiJ06sLrNAZO7wXe34/R48lEdb+cJ5DTiK
	W0unB9r5K/GcLyWLvblPJZXnb3+m+cXcAcindPfXGOEdWrE1TQRDggb28HP0pt5BysM9NKcIqC12U
	7e1qKbROrYR/Ic1+3O9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ6fo-009sv3-DC; Fri, 04 Mar 2022 12:04:40 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ6fX-009smj-LW; Fri, 04 Mar 2022 12:04:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 67F321F4666B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646395462;
 bh=Q7gqF6Cr/GfghIpATxHp62aU28rhDa7RTV/PXqHXx1g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OH+AKTlb6ek3omIf2o2SuQ0A7kyXWy4tEYaLR6xn9umGY6Q0VpSPFzHzlq1u5jrFk
 W9YMMDOQidgnxTZPTG89TQpit2yZMMNCRsfsWkaymt+8df0JCJeVS6Go+LUVsy0C9v
 z9jqVJioKacNPGFpuYJ4nF3XfSEsGcKQerKX5VDhuJav08f/CPKvoMeE+B6KUZFGuD
 saPDTDtGH3F2BFBDktlJGrgpkYKPylzgTmxz1yEj1EQw+Agp/4GAfHqb5JBTI+scN/
 yhfic8sgTXbYfjFZ/WHPFYj4lgihbIvY+yg8midrgZlDIKGFK9wn049Q9tXRg6/1Ym
 q2wZztZzB9Udw==
Message-ID: <01950f1f-6f13-9dcc-a2fb-c9617c06d5d1@collabora.com>
Date: Fri, 4 Mar 2022 13:04:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2, 2/3] dt-bindings: display: mediatek: dsi: Add
 compatible for MediaTek MT8186
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, jitao.shi@mediatek.com,
 allen-kh.cheng@mediatek.com, rex-bc.chen@mediatek.com
References: <1645178869-18048-1-git-send-email-xinlei.lee@mediatek.com>
 <1645178869-18048-3-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1645178869-18048-3-git-send-email-xinlei.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_040423_874251_891C444A 
X-CRM114-Status: GOOD (  11.05  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 18/02/22 11:07, xinlei.lee@mediatek.com ha scritto:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add dt-binding documentation of dsi for MediaTek MT8186 SoC.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   .../devicetree/bindings/display/mediatek/mediatek,dsi.yaml       | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> index 552a013786fe..cdacb2d0d11c 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> @@ -17,6 +17,7 @@ properties:
>         - mediatek,mt2701-dsi
>         - mediatek,mt8173-dsi
>         - mediatek,mt8183-dsi
> +      - mediatek,mt8186-dsi
>   
>     reg:
>       maxItems: 1



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
