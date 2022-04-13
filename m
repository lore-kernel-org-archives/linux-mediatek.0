Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9076EC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 23:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zHzsL4tJOlIi/RVFzFLIdhs+9cAcXiRFPhyXkfVa5MM=; b=CToKKSLJjw3WQK
	tow/I0LOu15lMYcmvZ0S+vbxyTmEnYNBYuQcExyHydthuQNZYE0l53iU37uA04+A4X2iMvj5Yo4+J
	sa+bYHSycHEtOE6mr8xf1Q1XG3c60LGFWNfzZM6+zH2AK52lbYvuPzcNP/1atnY2p5Hz6XoI8pxgJ
	btH8ZzK5FdmYQg7brEqDZ2c3ZwCjyAEcyii0hE4REnKw5ECKuWDe4T3izLEQ1bv3Wbvk1qxvDT06w
	7ZNCidgdJXoyhlcrnYxy60weFcmN9MLsoo3WfasDW5JXDDh/WimoLCYDXzG2vn/224WZ3tIIf+hbc
	r9lnhmI/iQvo8bORww1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nem0Z-0031t5-M3; Wed, 13 Apr 2022 23:02:43 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nem0N-0031o2-A1; Wed, 13 Apr 2022 23:02:32 +0000
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-dacc470e03so3591768fac.5; 
 Wed, 13 Apr 2022 16:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YGabHpljtiGxZkQuZz7c7j1W08I1Hvt5N3od6t4IJJo=;
 b=JpE8ac5/6/GILKy1eC1WKroc8pt6JSla3lVF3vDv7kRqDW+44dgj5/nJoO+IPJG6G5
 EVDD7nRGlQTTgM2FgbG73PYYShpdy06a2Mg1bOhnGnAnttImczn3FTRSsJDSEcyw7otY
 nx2jjbOyKgLoS6DnDvlQq3yPhtoPMJ60iawbPc/e6PS9yP3Mcx3M9cyEmnIkLhfrARYH
 U8jamJWI5u7zEO8AJLP1GuQE3/UgU9lkQH81hLq0OicY26jniinXQt9ArCQfOiqE8K6F
 XTxfoPahpfZfOPtq1peKrszVvsPUb6GG3vcp9tDy0Z6HGY7VwGXg5Ypna4a8WynS14lG
 FozA==
X-Gm-Message-State: AOAM533Kws5GsO35MCnpMnwiPMeHhdG427GxdFpRVXjGVe9F00g+skmD
 C/liIUetRJj21ExaaZTR5Q==
X-Google-Smtp-Source: ABdhPJwINphfy50/Q8dN2oFmoDIYgUuh67h7+uBixXRlKaqQgwaNIyYXpCeE6RDA7FisUjBBzeJDPw==
X-Received: by 2002:a05:6870:40c9:b0:e2:d1bb:f4e1 with SMTP id
 l9-20020a05687040c900b000e2d1bbf4e1mr185356oal.243.1649890950111; 
 Wed, 13 Apr 2022 16:02:30 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 x24-20020a056870a79800b000e2e53716fbsm173721oao.31.2022.04.13.16.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 16:02:29 -0700 (PDT)
Received: (nullmailer pid 4100836 invoked by uid 1000);
 Wed, 13 Apr 2022 23:02:28 -0000
Date: Wed, 13 Apr 2022 18:02:28 -0500
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: matthias.bgg@gmail.com, yongqiang.niu@mediatek.com,
 allen-kh.cheng@mediatek.com, linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
 airlied@linux.ie, devicetree@vger.kernel.org, nancy.lin@mediatek.com,
 robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, chunkuang.hu@kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, p.zabel@pengutronix.de,
 jason-jh.lin@mediatek.com, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH V2 1/3] dt-bindings: display: mediatek: Update disp_aal
 binding for MT8183
Message-ID: <YldWhNA6SwNBGXa8@robh.at.kernel.org>
References: <20220411035843.19847-1-rex-bc.chen@mediatek.com>
 <20220411035843.19847-2-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220411035843.19847-2-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_160231_394380_0C393565 
X-CRM114-Status: GOOD (  14.39  )
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

On Mon, 11 Apr 2022 11:58:41 +0800, Rex-BC Chen wrote:
> The driver data of MT8183 and MT8173 are different.
> 
> For MT8173, the gamma module is inside disp_aal. When we need to adjust
> gamma value, we need to use "has_gamma" to control gamma function
> inside disp_aal to adjust the gamma value.
> 
> For successors like MT8183, disp_gamma is separated from disp_aal. We
> just need to control disp_gamma directly and don't need to control gamma
> function inside disp_aal.
> 
> With this modification, the driver doesn't require any functional changes.
> We only update the dt-binding and DTS node to make it clear.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml  | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
