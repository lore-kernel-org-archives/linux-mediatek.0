Return-Path: <SRS0=DDi+=L7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E58BC07E95
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 04:33:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEFF961C84
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 04:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEFF961C84
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z9oryKmCUuoa0p6zMBrC+E+S/JvNI5RtqoW/DLvKExk=; b=JGOKfL+lyfdWw4
	nqHqiXYLGCuM9pPt2IuIg8JShwG3DkE4RjhJu4e3FnfGJJAMxz0MyjTY0s8AjYYCk8+vyx7ZdXoA7
	2ybpG0nQWNy/eqcwsj1OWIwmuaUvvdLwOpDcxjWS8uyqy90l7bOZzmoQcl2WlmyQo6lNkwhz6Yamj
	jMFEwEKYnfvSSoUWhyiXULlz6SGh9VL/QyyFcanxQQeUCJk6ubYdfJxk4Q6xJ3uLV/T5TZz49/fmb
	3jQo3QEkuRPROID7D4CVrkcEyL4ccEr1hjw7GUFqtqBmi9PjBsDLRC1a6noqdz8aChefZtpon14Jv
	99rOLFXwcnRS+CoG1qiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0zFJ-00DQuz-KB; Wed, 07 Jul 2021 04:33:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0zFH-00DQu1-1A; Wed, 07 Jul 2021 04:33:12 +0000
X-UUID: f2b957458bd94b69a5fb343ee1066c5c-20210706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=bg+3FOQBX4MYPnTBMzrEjQK7Mho0GboTOIlAI8qps7E=; 
 b=KrL7K4S1gUMTkhZQUw2uaW/0Uv/prQOmCvdafjPpqhUd17e8bCYIV1VOtgxlhm6vIZCnbA4/cIFVCl6oIh+nUH81QKtMoRuyp7ENt7voLKlS7uBZdaVb+Bi0x2bUljou7wIYWAr3pVKld7v/QmnBGbzy7uKgb6r5SkH6RFzi9Uk=;
X-UUID: f2b957458bd94b69a5fb343ee1066c5c-20210706
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 140909881; Tue, 06 Jul 2021 21:33:07 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Jul 2021 21:33:05 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Jul 2021 12:33:03 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 7 Jul 2021 12:33:03 +0800
Message-ID: <1625632383.7824.2.camel@mtksdaap41>
Subject: Re: [PATCH v1 01/17] dt-bindings: mediatek: add definition for
 mt8195 display
From: CK Hu <ck.hu@mediatek.com>
To: jason-jh.lin <jason-jh.lin@mediatek.com>
CC: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>
Date: Wed, 7 Jul 2021 12:33:03 +0800
In-Reply-To: <20210707041249.29816-2-jason-jh.lin@mediatek.com>
References: <20210707041249.29816-1-jason-jh.lin@mediatek.com>
 <20210707041249.29816-2-jason-jh.lin@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_213311_128481_01A80AFB 
X-CRM114-Status: GOOD (  19.72  )
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

Hi, Jason:


On Wed, 2021-07-07 at 12:12 +0800, jason-jh.lin wrote:
> Add definition for mt8195 display and add DSC module description.

Break this patch to two patch. One is mt8195 display, another one is DSC
and describe more about what is DSC.

Regards,
CK

> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  .../bindings/display/mediatek/mediatek,disp.txt     | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> index fbb59c9ddda6..a5859e7883d5 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> @@ -37,6 +37,7 @@ Required properties (all function blocks):
>  	"mediatek,<chip>-disp-aal"   		- adaptive ambient light controller
>  	"mediatek,<chip>-disp-gamma" 		- gamma correction
>  	"mediatek,<chip>-disp-merge" 		- merge streams from two RDMA sources
> +	"mediatek,<chip>-disp-dsc"		- compressing / decompressing image display streams
>  	"mediatek,<chip>-disp-postmask" 	- control round corner for display frame
>  	"mediatek,<chip>-disp-split" 		- split stream to two encoders
>  	"mediatek,<chip>-disp-ufoe"  		- data compression engine
> @@ -44,7 +45,7 @@ Required properties (all function blocks):
>  	"mediatek,<chip>-dpi"        		- DPI controller, see mediatek,dpi.txt
>  	"mediatek,<chip>-disp-mutex" 		- display mutex
>  	"mediatek,<chip>-disp-od"    		- overdrive
> -  the supported chips are mt2701, mt7623, mt2712, mt8167, mt8173, mt8183 and mt8192.
> +  the supported chips are mt2701, mt7623, mt2712, mt8167, mt8173, mt8183, mt8192 and mt8195.
>  - reg: Physical base address and length of the function block register space
>  - interrupts: The interrupt signal from the function block (required, except for
>    merge and split function blocks).
> @@ -60,7 +61,7 @@ Required properties (DMA function blocks):
>  	"mediatek,<chip>-disp-ovl"
>  	"mediatek,<chip>-disp-rdma"
>  	"mediatek,<chip>-disp-wdma"
> -  the supported chips are mt2701, mt8167 and mt8173.
> +  the supported chips are mt2701, mt8167, mt8173 and mt8195.
>  - larb: Should contain a phandle pointing to the local arbiter device as defined
>    in Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
>  - iommus: Should point to the respective IOMMU block with master port as
> @@ -195,6 +196,14 @@ ufoe@1401a000 {
>  	clocks = <&mmsys CLK_MM_DISP_UFOE>;
>  };
>  
> +dsc0@1c009000 {
> +	compatible = "mediatek,mt8195-disp-dsc";
> +	reg = <0 0x1c009000 0 0x1000>;
> +	interrupts = <GIC_SPI 645 IRQ_TYPE_LEVEL_HIGH>;
> +	power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
> +	clocks = <&mmsys CLK_VDO0_DSC_WRAP0>;
> +};
> +
>  dsi0: dsi@1401b000 {
>  	/* See mediatek,dsi.txt for details */
>  };

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
