Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851FDC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 16:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pTg51jBMu1oyvJhkgZpSl3pR5E/lD+i8uuXQoE3SmyU=; b=jasKnI0YZCWP/B
	ry84G9Bv9zcH7qK7XYPO0gYseetWgLyIi5fhuDoLmC9n496JsvU0idBdXgkLIJ7qmCZZkw2wPidZP
	Nuk0Mraedo2K5p9xzTGWr3Het2ebJw+txjr9p4HisNycc461mIEkJxpswxcFTirWuKstFoWLWfErz
	cKxbhoiEcvsYMDTQUZuvksKd+MFXWcDma68uZZVhAStkq8CVy2Yym0DUFdLHDJs0s31YY7RMXetBn
	o2MFHODW6HuYI0LVw3a1Kdv42HAMMtgEbTZsntdlWDUUADnmbb5kxNeYIFtwnBzYXggBu/fXV5XB0
	9q9ytJQe6/R429XHTqCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhD3v-009fUR-Lv; Wed, 20 Apr 2022 16:20:15 +0000
Received: from mail-oa1-f50.google.com ([209.85.160.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhD3k-009fQs-4p; Wed, 20 Apr 2022 16:20:05 +0000
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-e656032735so1195491fac.0; 
 Wed, 20 Apr 2022 09:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4wNQpDsXtJxhnvH20Z3+ZVt5KBTN3mlzQxKe6VzUSMU=;
 b=mof0L5NveRcrUA5OYE27ZKKEYaO9C8SFG42Sl3WfucrdO9gxo+D+LwxtSbI9LK+1ks
 HB7JPnQwcnTVvTLIAlWSn4YOy+qFH43lfqHayLal7a2HvN28PbBO+TyvXG791/6l/Z7V
 0rtMxt0Ffu+kubZBY7Y7Sxdm9Y7GlDSxJWze0i4kSorNlgwPiFE6bGSiBgF/13AqIpJD
 PHypibXMK7fV2YYzO68UL1hltJCtNfhFgA5AFUrd/HwayrhXc66jSAWQ7P+wv2w08ceo
 zcUjiyUkN+o3W6JIUwlV+UOHi/Me4FrdXeYXvolq3vnlzFcA0j+kCovE2Nkw8cnLvBYF
 dgcQ==
X-Gm-Message-State: AOAM531Kq2/pqJg0A/L9ADz9FN4ZXZFHlPYPSitRJuecoMeemJfQak6H
 CIyl0RC4Po6Y9+yL5y3xSA==
X-Google-Smtp-Source: ABdhPJyFDGzvkuLBDNOHCYtbkcqXp8jhoHSTHMVganFNXtZpFpev677iq4zGD+x/GQzQQd8c69FZDA==
X-Received: by 2002:a05:6870:b4a7:b0:e5:bff5:b537 with SMTP id
 y39-20020a056870b4a700b000e5bff5b537mr2080931oap.64.1650471601284; 
 Wed, 20 Apr 2022 09:20:01 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 f21-20020a056830205500b005cdb59d5d34sm6592605otp.81.2022.04.20.09.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 09:20:00 -0700 (PDT)
Received: (nullmailer pid 1416786 invoked by uid 1000);
 Wed, 20 Apr 2022 16:19:59 -0000
Date: Wed, 20 Apr 2022 11:19:59 -0500
From: Rob Herring <robh@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Landley <rob@landley.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>,
 tfiga@chromium.org, drinkcat@chromium.org, pihsun@chromium.org,
 hsinyi@google.com, Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, allen-kh.cheng@mediatek.com,
 xiandong.wang@mediatek.com, randy.wu@mediatek.com, jason-jh.lin@mediatek.com,
 roy-cw.yeh@mediatek.com, river.cheng@mediatek.com, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v13 1/3] dt-binding: mt8183: add Mediatek MDP3 dt-bindings
Message-ID: <YmAyrzjtWGrk5pNn@robh.at.kernel.org>
References: <20220418022213.23826-1-moudy.ho@mediatek.com>
 <20220418022213.23826-2-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220418022213.23826-2-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_092004_229091_C5AF4ECB 
X-CRM114-Status: GOOD (  19.60  )
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

On Mon, Apr 18, 2022 at 10:22:11AM +0800, Moudy Ho wrote:
> This patch adds DT binding documents for Media Data Path 3 (MDP3)
> a unit in multimedia system combined with several components and
> used for scaling and color format convert.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../bindings/media/mediatek,mdp3-rdma.yaml    | 166 ++++++++++++++++++
>  .../bindings/media/mediatek,mdp3-rsz.yaml     |  54 ++++++
>  .../bindings/media/mediatek,mdp3-wrot.yaml    |  57 ++++++
>  .../bindings/soc/mediatek/mediatek,ccorr.yaml |  47 +++++
>  .../bindings/soc/mediatek/mediatek,wdma.yaml  |  58 ++++++
>  5 files changed, 382 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> new file mode 100644
> index 000000000000..45b7c075ebf5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> @@ -0,0 +1,166 @@
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
> +
> +description: |
> +  Mediatek Read Direct Memory Access(RDMA) component used to do read DMA.
> +  It contains one line buffer to store the sufficient pixel data, and
> +  must be siblings to the central MMSYS_CONFIG node.
> +  For a description of the MMSYS_CONFIG binding, see
> +  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +  for details.
> +  The 1st RDMA is also used to be a controller node in Media Data Path 3(MDP3)
> +  that containing MMSYS, MUTEX, GCE and SCP settings.
> +
> +properties:
> +  compatible:
> +    items:
> +      # MDP3 controller node
> +      - const: mediatek,mt8183-mdp3
> +      - const: mediatek,mt8183-mdp3-rdma

This *still* makes no sense. I'm not looking at this further.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
