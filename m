Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A7DC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Oct 2023 19:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q/Mg5F6La/20y5nY7HjoLsNGzq3KbPcPoL2CAQLIaos=; b=JGYCjuwJwTp1OKoj0VmVj9aR8D
	YGh5uIhj1YrVFsEyCoCWjELmQw93ZPgA25vdsbTBn07tj7Uird0igkBAYgtmDbwCwWROWto/uAkS5
	lDOS76sym4QiXxwwr9qsX5MpvQaXTpwhAtAmfKfLMEtrlDHk+93W4x6l0KsjZvunDbLEJ4vrqp/mD
	6HAoCQqVSnaIL7vjjt981BnEDUAk38N/B8UX6AWn1z0Dk6IQptzGqcsQTG/JxKkN8iOxhmn43rJ3F
	jqr9ee4jldiFrfbwwHq41O9VV08+FwJCF7C+aF/9xdNGbBnHeEfPFFPaI4T/fsue+MC1IxK7uHFoZ
	F8wu0iHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxXuG-003vKq-2y;
	Mon, 30 Oct 2023 19:26:36 +0000
Received: from mail-oa1-f53.google.com ([209.85.160.53])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxXuE-003vJb-00;
	Mon, 30 Oct 2023 19:26:35 +0000
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1ea98ad294cso2097426fac.3;
        Mon, 30 Oct 2023 12:26:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698693992; x=1699298792;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/Mg5F6La/20y5nY7HjoLsNGzq3KbPcPoL2CAQLIaos=;
        b=bkqAVrWPqAfwKzN4mFZKY4jVYXYsjPr9pXJ21u7xF/Ui3APUnpNNwSHTa1p0zRohi+
         zqcsy/XjfP3LfxE3Vtgz07FoAROU3xSFRQiXaQVJZdVf8M6h7SFyeArn7IexvsC94UjJ
         uH/ovSOZvN/Gd4Z0cHn7O+FlU+BF7QAnuS02D8QXEFhqtvMBiqYYEM7McDZRxCDpPvt0
         4TImCHAB9BdEaqhAY4mANv+Kr0TWtzBLKCkbUe/oPC7G/pc0rwkHR0SOGTZ1x3f3Hn6L
         udgNIB+0KSGe8VzOUAtowZ7eAIUnovbQ4WAQ+8Lyv5XOTFIhCw4he15MTvMLRzfXaP15
         OyLg==
X-Gm-Message-State: AOJu0YxOisem8GyIdEIf/EOM1jr5W/nmPK7lEnrx4tkRCOp8kaL2ztGR
	g63E0QXLrXLHgiMA83jrPw==
X-Google-Smtp-Source: AGHT+IGjMO5D8Ov5wU38v/9/dkRYq9nZFsMu08o0lQAqpCGW3B8LLDEUaF6w7sann/7TDndLmBvhpA==
X-Received: by 2002:a05:6870:35d0:b0:1ea:2447:5181 with SMTP id c16-20020a05687035d000b001ea24475181mr9546452oak.9.1698693991826;
        Mon, 30 Oct 2023 12:26:31 -0700 (PDT)
Received: from herring.priv ([2607:fb91:e6c7:c3eb:a6fd:69b4:aba3:6929])
        by smtp.gmail.com with ESMTPSA id lh5-20020a05687c350500b001eace5491c8sm1694876oac.18.2023.10.30.12.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 12:26:31 -0700 (PDT)
Received: (nullmailer pid 1991165 invoked by uid 1000);
	Mon, 30 Oct 2023 19:26:29 -0000
Date: Mon, 30 Oct 2023 14:26:29 -0500
From: Rob Herring <robh@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 03/16] dt-bindings: media: mediatek: mdp3: add config
 for MT8195 RDMA
Message-ID: <20231030192629.GA1979065-robh@kernel.org>
References: <20231030100022.9262-1-moudy.ho@mediatek.com>
 <20231030100022.9262-4-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231030100022.9262-4-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_122634_036897_7C31CA92 
X-CRM114-Status: GOOD (  17.59  )
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

On Mon, Oct 30, 2023 at 06:00:09PM +0800, Moudy Ho wrote:
> Added the configuration for MT8195 RDMA. In comparison to MT8183, it
> no longer shares SRAM with RSZ, and there are now preconfigured 5 mbox.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/media/mediatek,mdp3-rdma.yaml    | 26 ++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> index c043204cf210..504334a76fb3 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> @@ -22,6 +22,7 @@ properties:
>    compatible:
>      enum:
>        - mediatek,mt8183-mdp3-rdma
> +      - mediatek,mt8195-mdp3-rdma
>        - mediatek,mt8195-vdo1-rdma
>  
>    reg:
> @@ -58,7 +59,7 @@ properties:
>  
>    mboxes:
>      minItems: 1
> -    maxItems: 2
> +    maxItems: 5
>  
>    interrupts:
>      maxItems: 1
> @@ -98,6 +99,29 @@ allOf:
>          - mboxes
>          - mediatek,gce-events
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8195-mdp3-rdma
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: RDMA clock
> +
> +        mboxes:
> +          items:
> +            - description: used for 1st data pipe from RDMA
> +            - description: used for 2nd data pipe from RDMA
> +            - description: used for 3rd data pipe from RDMA
> +            - description: used for 4th data pipe from RDMA
> +            - description: used for the data pipe from SPLIT

Following the prior comments, add these entries to the top-level 
'mboxes' and then here just put 'minItems: 5'.

Rob

