Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98848C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 17:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pgOtzCMYoc/KcMRJsNMlpxTDw6ZAtfQtHYgkWlAFvbs=; b=IvPL054NMS9edV
	RtaOw/+DH8+hSljo9vzCm2gCsRgOQi1uIz0R4EoHUCNjgewO2hXEqRwwtkkItqgHsglHsyJiCXsDa
	Hs7fIjfaj7D/teTQ6XIZuj9Tw4Dq9/dvlLi0Ofglb2Sfj+QkIqSXGJpDtO+Y2w0QJoMZkAmAg+Fkc
	B46R3MwHAiyjsGLPFnuUvUKtoYyqzZmcG/mK+r9mZIFUsHVml4d+W157Ft6WTCfurEURTBXzinhkM
	0iVZc3XY+tE9lZgYhaTr+U5GqZVNq4RUeEGsuS+pSxZbM6JPASTHVN/Y96ts6Fz8h0l6S79Rxi1Xn
	QEaAIl7G7O8e23/4g9TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlwcN-0074sI-Tj; Tue, 03 May 2022 17:47:23 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlwcB-0074nj-Nh; Tue, 03 May 2022 17:47:13 +0000
Received: by mail-ot1-f44.google.com with SMTP id
 i25-20020a9d6259000000b00605df9afea7so11779360otk.1; 
 Tue, 03 May 2022 10:47:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aO1OGtoH2etVzYDvjSj5yfVREBvoZxIuagbUCkaDNyQ=;
 b=0A+ZnLcyxB2/m32lU3BqG415evRt4rvdnr2yBxVZuM0qFQ7o9GHPJE8JXv0/kt+wKl
 CnVWWJe+LB3K9bkj40yWGEuCa4ZTkqhOwDdSEByMOmnmi1baTQnVQdxTenvKso4sa4PR
 96YoToJbXn+q51dQEkzFc/kZ/OVUf9EVjiuBUTeeS5BSpgMMTYYSRMjqbuR/ZxTML+18
 SJhrtGvja1ZGDKnm9+eDa1CgslcGz2YDFFc0PtdV+AQLvpRpXlVnFWumRrgsxHA1LpJx
 sA6eZPrT7ywZKSN5F3B1XBKxu4RWqTnp35m5G/jijBB1NQoDGqM1j30FtZNk4DKg8/MV
 l9cQ==
X-Gm-Message-State: AOAM5323I6xkGwn2XaN7HyKo2YrZL47oCLQpV/lCMWmC9ZIW3Tgksc3b
 E/DsF36TXj4V7C1150SuVw==
X-Google-Smtp-Source: ABdhPJze3Fkqbmp2HHrsmVNQEF4ygGLxm/5otqwB5/dtD+F7rMTjhoKQLjNh01bIzTUwlBzUvEcyZg==
X-Received: by 2002:a05:6830:14d4:b0:606:cc5:32cd with SMTP id
 t20-20020a05683014d400b006060cc532cdmr5173680otq.359.1651600030474; 
 Tue, 03 May 2022 10:47:10 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 x10-20020a056830408a00b006063f1f05dfsm395787ott.18.2022.05.03.10.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 10:47:09 -0700 (PDT)
Received: (nullmailer pid 3943569 invoked by uid 1000);
 Tue, 03 May 2022 17:47:08 -0000
Date: Tue, 3 May 2022 12:47:08 -0500
From: Rob Herring <robh@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Landley <rob@landley.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Alexandre Courbot <acourbot@chromium.org>, tfiga@chromium.org,
 drinkcat@chromium.org, pihsun@chromium.org, hsinyi@google.com, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, 
 allen-kh.cheng@mediatek.com, xiandong.wang@mediatek.com, 
 randy.wu@mediatek.com, jason-jh.lin@mediatek.com, roy-cw.yeh@mediatek.com, 
 river.cheng@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v14 1/3] dt-binding: mediatek: add bindings for MediaTek
 MDP3 components
Message-ID: <YnFqnEI16B+xrxdQ@robh.at.kernel.org>
References: <20220427070514.10355-1-moudy.ho@mediatek.com>
 <20220427070514.10355-2-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220427070514.10355-2-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_104711_814835_1A74D962 
X-CRM114-Status: GOOD (  22.05  )
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

On Wed, Apr 27, 2022 at 03:05:12PM +0800, Moudy Ho wrote:
> This patch adds DT binding documents for Media Data Path 3 (MDP3)
> a unit in multimedia system combined with several components and
> used for scaling and color format convert.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../bindings/media/mediatek,mdp3-rdma.yaml    | 82 +++++++++++++++++++
>  .../bindings/media/mediatek,mdp3-rsz.yaml     | 61 ++++++++++++++
>  .../bindings/media/mediatek,mdp3-wrot.yaml    | 66 +++++++++++++++
>  .../bindings/soc/mediatek/mediatek,ccorr.yaml | 54 ++++++++++++
>  .../bindings/soc/mediatek/mediatek,wdma.yaml  | 67 +++++++++++++++
>  5 files changed, 330 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> new file mode 100644
> index 000000000000..ce24eda14cb6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek Read Direct Memory Access
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +  - Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> +
> +description: |
> +  Mediatek Read Direct Memory Access(RDMA) component used to do read DMA.
> +  It contains one line buffer to store the sufficient pixel data, and
> +  must be siblings to the central MMSYS_CONFIG node.
> +  For a description of the MMSYS_CONFIG binding, see
> +  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +  for details.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: mediatek,mt8183-mdp3-rdma
> +
> +  reg:
> +    maxItems: 1
> +
> +  mediatek,gce-client-reg:
> +    $ref: '/schemas/types.yaml#/definitions/phandle-array'
> +    maxItems: 1

Like your other patches this needs 'items' describing each cell.

> +    description: |
> +      The register of client driver can be configured by gce with
> +      4 arguments defined in this property, such as phandle of gce, subsys id,
> +      register offset and size. Each GCE subsys id is mapping to a client
> +      defined in the header include/dt-bindings/gce/<chip>-gce.h.

Other than other cases of this property, the rest looks fine.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
