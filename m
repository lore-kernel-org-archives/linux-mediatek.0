Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D56C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 05:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tHGjbbQsUCMB5b67jIVnAYTFg3tBbm+YtSjjO1+TutY=; b=iuWH1fupdoTu3j
	F8rNCEa9P9jS/8O33qKt7CS/6JITtCh6gAnUA1lLeOMgBeFI3PAlq1WY/vzAYMfSaHwFC83q0eybE
	XeUehng89LZUrhOzO7MNeNRJLg5/qUd4Pmv6WTr9uABUGW4epqzKTgvjBgHSjhgvjXT4Am3fECIVY
	zyATpqmEaRLmwXf0VGIFV0n27jBoWm9p0rGgmBdRLOOmOPl7zAdjrWfZRRTj7usBL27QMTCtjOwhn
	47snmf2TzJ5Ceo0qL9kC6MYSfzy8s2w87EOMi2KC85FdJwFvhm1IZdQNDJkZ/7W67imgSxnYnzXmr
	8hvqwWaHWk3CDSkoJANQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncKSB-009Teu-Gg; Thu, 07 Apr 2022 05:13:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncKS8-009TaO-0m; Thu, 07 Apr 2022 05:13:05 +0000
X-UUID: 72e1d9fa91f44c3bb1b00eae7702f2e8-20220406
X-UUID: 72e1d9fa91f44c3bb1b00eae7702f2e8-20220406
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 892866963; Wed, 06 Apr 2022 22:12:48 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Apr 2022 22:12:46 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 7 Apr 2022 13:12:44 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 Apr 2022 13:12:44 +0800
Message-ID: <1a0d91869ffd85581aa733065bd45d914830bab1.camel@mediatek.com>
Subject: Re: [RESEND v17 2/7] dt-bindings: arm: mediatek: mmsys: add mt8195
 SoC binding
From: CK Hu <ck.hu@mediatek.com>
To: jason-jh.lin <jason-jh.lin@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Thu, 7 Apr 2022 13:12:44 +0800
In-Reply-To: <20220407030409.9664-3-jason-jh.lin@mediatek.com>
References: <20220407030409.9664-1-jason-jh.lin@mediatek.com>
 <20220407030409.9664-3-jason-jh.lin@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_221304_159112_351685DA 
X-CRM114-Status: GOOD (  14.30  )
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
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 singo.chang@mediatek.com, hsinyi@chromium.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, postmaster@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fabien Parent <fparent@baylibre.com>, moudy.ho@mediatek.com,
 linux-mediatek@lists.infradead.org, roy-cw.yeh@mediatek.com,
 Daniel Vetter <daniel@ffwll.ch>, John
 'Warthog9' Hawley <warthog9@eaglescrag.net>,
 Philipp Zabel <p.zabel@pengutronix.de>, nancy.lin@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Jason:

On Thu, 2022-04-07 at 11:04 +0800, jason-jh.lin wrote:
> In the SoC before, such as mt8173, it has 2 pipelines binding to one
> mmsys with the same clock driver and the same power domain.
> 
> In mt8195, there are 4 pipelines binding to 4 different mmsys, such
> as
> vdosys0, vdosys1, vppsys0 and vppsys1.
> Each mmsys uses different clock drivers and different power domain.
> 
> Since each mmsys has its own clock, they could be identified
> by the different name of their clock.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml      | 4
> ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git
> a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index 6c2c3edcd443..f71c8dd07bf9 100644
> ---
> a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++
> b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -31,6 +31,7 @@ properties:
>                - mediatek,mt8183-mmsys
>                - mediatek,mt8186-mmsys
>                - mediatek,mt8192-mmsys
> +              - mediatek,mt8195-mmsys
>                - mediatek,mt8365-mmsys
>            - const: syscon
>        - items:
> @@ -65,6 +66,9 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      maxItems: 1
>  
> +  clocks:
> +    maxItems: 1
> +
>    "#clock-cells":
>      const: 1
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
