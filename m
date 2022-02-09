Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC92C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Feb 2022 20:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bJs6utIHEMXbwQRPtINB/ja219EVdp/YwQ0ILyU//FQ=; b=LFDBbyV4J0ctMq
	i97g7ZP/N01s3tHmPYRDk93AZFUObWDr0e6+8EuCW2DqYR5ODWyI539XlDH6qLoQyz0ACSQih5Z9P
	LaUz5uCSB+Q+gG4ToAtOcMXEI1m9VT6APo7qdKhRazJMkIXXQfx1TUgPxhBgSPeCt86VUlE1HbTgz
	Bg2EKgLci4wqh9FpLft99i3M1GRiZ/mwxS1PFEXOPHs9yCA8oeamTlSrmCueZnq70yiqKOfa10FOP
	v/2Cp8LXCRnkxP7WiJQbJdiYKz5AorEgs2aKZ5DppG3fw5JNzwwsZsoYIKY1CIJ+v2RtpH41Vd1pa
	s8CaTj1ANfXQPFN87bAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHtiO-001at7-Qj; Wed, 09 Feb 2022 20:37:24 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHti9-001aly-Gh; Wed, 09 Feb 2022 20:37:10 +0000
Received: by mail-oi1-f178.google.com with SMTP id u3so3720677oiv.12;
 Wed, 09 Feb 2022 12:37:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zIhHhyih/7ZhXtvq9LuF0lqvT9O7H7X5U0jczH+YH4s=;
 b=V6JltIP5LNGSeWEiYUK+9RKDQHHmZ/+vARUWFEBLArlBscEvUW343rY6KTTEL1kbJr
 UFYlVQN9DsGakY2WDjFVf8oB3UDvbs6PbS1lSgmFpThZawy4X4Cjwo7wjPoIY9ewJfTL
 p6dZha5gUNTYHeNy0AZSM6OLHwHf9/Wccq/I9CqBo/BpGl9SrBxNBpl3z3GlG11kAdNm
 c7Zvp1U0W2nnggHnJmRbCqO+RgDKJ4aUvnZTgAiJ8FVx6wTtZMvBLT6ApwrXUK8P4B4j
 mEyFxZaLX1gthP8wswzrqUv/GtVGWurJU+3rZ2ffWLQm0WeD7gIiPConKR+0Wy+DPuVH
 9vBw==
X-Gm-Message-State: AOAM5330fTiiLVYRfkwobiqei0LH2ygWBcjQirq1rfFmyc3CAtZ1CSaK
 iZnj2TdHcAgq+B8kYwTxYg==
X-Google-Smtp-Source: ABdhPJy4JKuU/2pyAT8/RT39URC0YEPefqUshCvwl80gipjwlzTCz6tyUtL+RPSK1CFrfBlAbwLDDQ==
X-Received: by 2002:a05:6808:211c:: with SMTP id
 r28mr1739810oiw.4.1644439027436; 
 Wed, 09 Feb 2022 12:37:07 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bg34sm7485772oob.14.2022.02.09.12.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 12:37:06 -0800 (PST)
Received: (nullmailer pid 862149 invoked by uid 1000);
 Wed, 09 Feb 2022 20:37:04 -0000
Date: Wed, 9 Feb 2022 14:37:04 -0600
From: Rob Herring <robh@kernel.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Tzung-Bi Shih <tzungbi@chromium.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Tomasz Figa <tfiga@google.com>, George Sun <george.sun@mediatek.com>, 
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Fritz Koenig <frkoenig@chromium.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com, 
 linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2, 1/7] dt-bindings: media: mtk-vcodec: Adds decoder
 dt-bindings for lat soc
Message-ID: <YgQl8CtttQ99+8lB@robh.at.kernel.org>
References: <20220128035440.24533-1-yunfei.dong@mediatek.com>
 <20220128035440.24533-2-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220128035440.24533-2-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_123709_582533_90441A1B 
X-CRM114-Status: GOOD (  16.04  )
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

On Fri, Jan 28, 2022 at 11:54:34AM +0800, Yunfei Dong wrote:
> Adds decoder dt-bindings for compatible "mediatek,mtk-vcodec-lat-soc".

What's lat soc? How does this relate to what's already there in this 
binding.

The subject space is limited, avoid saying the same thing twice 
(dt-bindings).

> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../media/mediatek,vcodec-subdev-decoder.yaml | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> index 6415c9f29130..a3c892338ac0 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> @@ -189,6 +189,55 @@ patternProperties:
>  
>      additionalProperties: false
>  
> +  '^vcodec-lat-soc@[0-9a-f]+$':
> +    type: object
> +
> +    properties:
> +      compatible:
> +        const: mediatek,mtk-vcodec-lat-soc
> +
> +      reg:
> +        maxItems: 1
> +
> +      iommus:
> +        minItems: 1
> +        maxItems: 32
> +        description: |
> +          List of the hardware port in respective IOMMU block for current Socs.
> +          Refer to bindings/iommu/mediatek,iommu.yaml.
> +
> +      clocks:
> +        maxItems: 5
> +
> +      clock-names:
> +        items:
> +          - const: sel
> +          - const: soc-vdec
> +          - const: soc-lat
> +          - const: vdec
> +          - const: top
> +
> +      assigned-clocks:
> +        maxItems: 1
> +
> +      assigned-clock-parents:
> +        maxItems: 1
> +
> +      power-domains:
> +        maxItems: 1
> +
> +    required:
> +      - compatible
> +      - reg
> +      - iommus
> +      - clocks
> +      - clock-names
> +      - assigned-clocks
> +      - assigned-clock-parents
> +      - power-domains
> +
> +    additionalProperties: false
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.25.1
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
