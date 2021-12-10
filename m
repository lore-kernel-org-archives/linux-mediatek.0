Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7898C43217
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 20:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LUw3MuCRu4wSxVRdq6gK59x0YaBt7e9Sd4tBX/L2p6s=; b=PyAE0AppwyCCPf
	HjNs4bHLc6ASHVVcagcZABckYLPNmDgqB0Zf1sssagGQ/os+C/TVIuv7KP2B5OX7sqQr3iI7uoFDS
	b0WB94GFCcDXntY+/NAnBG+TJIU4EJCKqQMlDq853cDRtJoNbzc85x6nqHSDYvcR9lxxSbb1tnmW2
	vof8xGF+Il9yxlJoCITKztAlgOiRb8t+0aUME6cMUck65pUdoCl8haHpBZhVj/JB2cFtxcWeoBM8J
	4kfC14RwLG/Mg0hScorv9W18rJVFf2VpaB1c6XM46NpI6uGNSM2HcEK6odF+ZcYiFJ8AwJ9QWgcfV
	baoXOU/RC4jN9YCHHrdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvmE2-003hDu-LJ; Fri, 10 Dec 2021 20:10:38 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvmDr-003h8m-IM; Fri, 10 Dec 2021 20:10:29 +0000
Received: by mail-oi1-f179.google.com with SMTP id q25so14841599oiw.0;
 Fri, 10 Dec 2021 12:10:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PaqEpE42JwT8DXwsVY8kEv7gNunVXJQXAeFfbCH81XM=;
 b=SP1w2ld69SZr63S4E6GJkWEbmS4bd5aTL/CytiA6tBi5TaEtO3K92A7w9MTHxqWGgv
 cbJlFotPLStPVgluChVxXxeMrEDvpg8PNKyRwPPDBJUNdCuEGcM4RiiyN8MbYRDxR53Y
 gw5Yod8Sl2crz4UqRHeTZk5RrBAz/e4BZFxxc58ZGQANAff+oZ1jKNY+hD0vUAKi9Ou1
 jswunP5Nme9hwpdOHxVmHJTlbk4tvYv02zKWuI68p3qf3pR1s/I8wfqhy8xDuBIZ0tpV
 GYpR9GL4LMbFQS+YoCVfNzbLygu+mAM+OD79ydUxGLpbkUgjAr7qDkz+KdD/C+hDFz99
 Xigg==
X-Gm-Message-State: AOAM5301Sm/5n+p8GAy+4+qrnTreJMpKAA/Hw7p4t2hjsyBSR18fs+Xk
 vSxX2lfahAvAjP/6R/1TXa8FWIqx2Q==
X-Google-Smtp-Source: ABdhPJxQHE8T/q7gJ37kD0SDsARybgtPjuYbEctbSQdiMZTsg/lr1mlPRTFIcqwOt2DpMwICm7YI0Q==
X-Received: by 2002:a05:6808:60e:: with SMTP id
 y14mr13980733oih.162.1639167026601; 
 Fri, 10 Dec 2021 12:10:26 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id u6sm1020552oiu.34.2021.12.10.12.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 12:10:25 -0800 (PST)
Received: (nullmailer pid 1813329 invoked by uid 1000);
 Fri, 10 Dec 2021 20:10:24 -0000
Date: Fri, 10 Dec 2021 14:10:24 -0600
From: Rob Herring <robh@kernel.org>
To: YC Hung <yc.hung@mediatek.com>
Cc: broonie@kernel.org, tiwai@suse.com, matthias.bgg@gmail.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, daniel.baluta@nxp.com, peter.ujfalusi@intel.com,
 trevor.wu@mediatek.com, allen-kh.cheng@mediatek.com
Subject: Re: [PATCH v6] dt-bindings: dsp: mediatek: Add mt8195 DSP binding
 support
Message-ID: <YbO0MKXKYN48+kzN@robh.at.kernel.org>
References: <20211202144818.31626-1-yc.hung@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211202144818.31626-1-yc.hung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_121027_665847_BE02B791 
X-CRM114-Status: GOOD (  16.75  )
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

On Thu, Dec 02, 2021 at 10:48:18PM +0800, YC Hung wrote:
> From: "yc.hung" <yc.hung@mediatek.com>
> 
> This describes the mt8195 DSP device tree node.

This doesn't match the change.

> 
> Signed-off-by: yc.hung <yc.hung@mediatek.com>
> ---
> Changes since v5:
>     Remove sub node "sound" and "mediatek,platform", "mediatek,dptx-codec",
>     "mediatek,hdmi-codec" properties. Let dsp node as an individual node and
>     sound card has phandle of this dsp node per discussion in 
>     https://github.com/thesofproject/linux/pull/3239
> 
> Changes since v4:
>   - remove patch 1 with clocks as it will be reviewed and merged to SOF tree.
>     https://github.com/thesofproject/linux/pull/3237
>   - refine DT file binding files with Rob's comments.
> ---  
>  .../bindings/dsp/mtk,mt8195-dsp.yaml          | 19 -------------------
>  1 file changed, 19 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml b/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
> index f8bacd50b018..33db11ee2336 100644
> --- a/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
> +++ b/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
> @@ -70,22 +70,6 @@ properties:
>        - description: A phandle to a reserved memory region is used for dma buffer between host and DSP.   
>        - description: A phandle to a reserved memory region is used for DSP system memory.
>  
> -  model:
> -    $ref: /schemas/types.yaml#/definitions/string
> -    description: User specified audio sound card name
> -
> -  mediatek,platform:
> -    $ref: "/schemas/types.yaml#/definitions/phandle"
> -    description: The phandle of MT8195 ASoC platform.
> -
> -  mediatek,dptx-codec:
> -    $ref: "/schemas/types.yaml#/definitions/phandle"
> -    description: The phandle of MT8195 Display Port Tx codec node.
> -
> -  mediatek,hdmi-codec:
> -    $ref: "/schemas/types.yaml#/definitions/phandle"
> -    description: The phandle of MT8195 HDMI codec node.
> -
>  required:
>    - compatible
>    - reg
> @@ -98,7 +82,6 @@ required:
>    - power-domains
>    - mbox-names
>    - mboxes
> -  - mediatek,platform
>  
>  additionalProperties: false
>  
> @@ -130,6 +113,4 @@ examples:
>         power-domains = <&spm 6>; //MT8195_POWER_DOMAIN_ADSP
>         mbox-names = "mbox0", "mbox1";
>         mboxes = <&adsp_mailbox0>, <&adsp_mailbox1>;
> -       mediatek,dptx-codec = <&dp_tx>;
> -       mediatek,platform = <&afe>;
>         };
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
