Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228F5C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 16:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m9Lw9ENK2rLFw2bJ0xdSGt+OkWW41khvVeU9mKgkz4I=; b=aMxFRcEGxy1OnI
	79//see0pi8ZRnBpH/i3injyZpj9TUaVBC1ZHUTarA/4DM/v+yqA1mXQi1649XACHOnQ8ano6gBVb
	4lMfK66uo6Dh7B7r2vn4TteL/n8gn3x8XWEAWlwHajR183NkkiHsikppn+As3k/D2Z3GlqW/G6sWY
	SDOdHxkUcdqthVm3+XGUdYPxN16Q1fNQ4CAQp+80CXKhMJx+nz0WNUPb41n56RlecKq5MiKASasIM
	3VSlQgUgWcVAUYIsGBQsA548lJskM2lnGkHiQ7ySz5/EZ3tdZDGigFNdG+jhmF5u8kfmCYM8995y3
	aMF9fSIwD/+t8g9W6cDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQAT8-00Av7n-9X; Fri, 04 Mar 2022 16:07:50 +0000
Received: from desiato.infradead.org ([90.155.92.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQASy-00AumP-Vq; Fri, 04 Mar 2022 16:07:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=IO1zrbMJCIdW27ZYcLkomHz9MZD/3xTBxiCCeGbY4nY=; b=pD+5TUOxe7Xj7X0QfNsNa/T3q3
 MCdFHKM+e4UOJ7cGmpyjARlhHVDh39HmCcIA3rNwV2fbBCQO5TIFBgHD4ixQCTvZM4Q/RS9x/lXst
 Cj1ehlFXn1pDz+Zk/H32qnT6HMB5ZsHGGuD7WFXUx0oPUSqrUnz7zP037bdRY1Fm/asnGFqOthdwP
 Lkml4dLCJyLg05mP3vHhsI7r53jby7KAng1TCsYz3T0abg7a4Bf36az2kpXnxcSZrIK0l4nCqKdyZ
 FEL82tvavTv31yU2hmRBFfVobJThTS7BCo9Gira/oQUIpWye4BqPgTXPJteQe29tyoWIjEgQSArKN
 JmyrefZA==;
Received: from mail-oo1-f51.google.com ([209.85.161.51])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQA1w-00FF2Y-AH; Fri, 04 Mar 2022 15:39:46 +0000
Received: by mail-oo1-f51.google.com with SMTP id
 x6-20020a4a4106000000b003193022319cso9782350ooa.4; 
 Fri, 04 Mar 2022 07:39:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IO1zrbMJCIdW27ZYcLkomHz9MZD/3xTBxiCCeGbY4nY=;
 b=P3i1nlM42NqOmDLRd/8XiWmlcesaBcdXdQD+CJQPCvkFdx6yN16kjOiz68UbwEG1E4
 Rn41oEEqACfUBq4vbAdBmn7v8T28+9A/GsmzZDqiin5L2ITxxHViaDTmfrQPUH8jroaY
 +uPE53JxbcLZamsqv5zx0yed/UGhNKdv7A2Bq8/N9RPTjAHolVDBZeuYSKu8Be2BsBg6
 zlflF0VvDKs8Rp8wWjyiTpPDB4pnWF4iiNtEqQnM+iXOnX9V7aL0JQzgQb0GqAJ+0nLg
 VTjRIQ9U8gMM4NVJB38UPwOiEGHL+9iKvc6lKF2X62sbV/dxWSkvx6DZO6whxz5ncumP
 3WSA==
X-Gm-Message-State: AOAM533y/2ir1I9j9yVMrjPc0o1GihXUcZ/GLSR8nRhGMVBt68HKEp4d
 IeN6/NVFkjb3I3R1dNGgjg==
X-Google-Smtp-Source: ABdhPJzV3nnvTE6V/swPLdnnc8Rt2egbCzhY1OPkkrIIw8e54gAgN9Xe2bv5Gl3lRvSRncaFjcChng==
X-Received: by 2002:a05:6870:248c:b0:d7:19f3:a52c with SMTP id
 s12-20020a056870248c00b000d719f3a52cmr8397016oaq.149.1646408380509; 
 Fri, 04 Mar 2022 07:39:40 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 35-20020a9d0026000000b005ad363440a2sm2376353ota.64.2022.03.04.07.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 07:39:39 -0800 (PST)
Received: (nullmailer pid 3987557 invoked by uid 1000);
 Fri, 04 Mar 2022 15:39:38 -0000
Date: Fri, 4 Mar 2022 09:39:38 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: jason-jh.lin@mediatek.com, daniel@ffwll.ch, chunkuang.hu@kernel.org,
 linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de,
 krzysztof.kozlowski@canonical.com, robh+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 airlied@linux.ie, jitao.shi@mediatek.com, ck.hu@mediatek.com,
 alexandre.torgue@foss.st.com, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, matthias.bgg@gmail.com
Subject: Re: [PATCH 3/3] dt-bindings: display: mediatek: Fix examples on new
 bindings
Message-ID: <YiIyupjEgdiaj0Dv@robh.at.kernel.org>
References: <20220304095458.12409-1-angelogioacchino.delregno@collabora.com>
 <20220304095458.12409-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220304095458.12409-4-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_153944_458079_A8B9ED81 
X-CRM114-Status: GOOD (  11.25  )
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

On Fri, 04 Mar 2022 10:54:58 +0100, AngeloGioacchino Del Regno wrote:
> To avoid failure of dt_binding_check perform a slight refactoring
> of the examples: the main block is kept, but that required fixing
> the address and size cells, plus the inclusion of missing dt-bindings
> headers, required to parse some of the values assigned to various
> properties.
> 
> Fixes: 4ed545e7d100 ("dt-bindings: display: mediatek: disp: split each block to individual yaml")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,aal.yaml        | 24 +++--
>  .../display/mediatek/mediatek,ccorr.yaml      | 23 +++--
>  .../display/mediatek/mediatek,color.yaml      | 23 +++--
>  .../display/mediatek/mediatek,dither.yaml     | 23 +++--
>  .../display/mediatek/mediatek,dpi.yaml        |  3 +-
>  .../display/mediatek/mediatek,dsc.yaml        | 23 +++--
>  .../display/mediatek/mediatek,ethdr.yaml      | 99 ++++++++++---------
>  .../display/mediatek/mediatek,gamma.yaml      | 23 +++--
>  .../display/mediatek/mediatek,merge.yaml      | 49 +++++----
>  .../display/mediatek/mediatek,mutex.yaml      | 25 +++--
>  .../display/mediatek/mediatek,od.yaml         | 14 ++-
>  .../display/mediatek/mediatek,ovl-2l.yaml     | 26 +++--
>  .../display/mediatek/mediatek,ovl.yaml        | 26 +++--
>  .../display/mediatek/mediatek,postmask.yaml   | 23 +++--
>  .../display/mediatek/mediatek,rdma.yaml       | 28 ++++--
>  .../display/mediatek/mediatek,split.yaml      | 17 +++-
>  .../display/mediatek/mediatek,ufoe.yaml       | 19 ++--
>  .../display/mediatek/mediatek,wdma.yaml       | 26 +++--
>  18 files changed, 316 insertions(+), 178 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
