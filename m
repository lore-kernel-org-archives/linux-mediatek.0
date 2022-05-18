Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CEDC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 00:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I0Wn7uGv26xhlnULtBjDyK31eBX4wguqXtcP0jkYAxQ=; b=Xbna6owO/WHhiP
	gWTp6+QJxDWpO5HyoEgfPHqAwqpFwJTu7OQE08lb/KOH6K6yrXAD2bAK0efYKTTelfK8rUNSWD8eT
	kKWI41eQX7Y1DnXqnzLcGW41D4j64cywIx826DuNJQOW9/q+7KZR1avQL9eP0gRmD5h+MyIk/yPEI
	Khp+yqjCwb72kEAuYI1mywIXZXd/wsWIX5kiZUa9W8ejr5lLXUHCTsnAaudgda1hye0HHAU7LHlPH
	tNyQ65tAMT4CEL5Yg8uxgr0oHNSrHFgvL/2FpIr0OqdcrkCDoKXRKF+cUT1QfOXEb5DcR7gxUmXiI
	uvhHYn1CponqSYwF0IuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nr7gD-00GNYz-JH; Wed, 18 May 2022 00:36:45 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nr7g2-00GNX7-6t; Wed, 18 May 2022 00:36:35 +0000
Received: by mail-oi1-f169.google.com with SMTP id w130so957031oig.0;
 Tue, 17 May 2022 17:36:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=g3fk2r+VdltCJs0tLhP3Og3NkDOH8LnSswk63V92fI0=;
 b=R1FgnELIO0zVIAvHxyKfM8Cx7ntxROP3OASkWqWt75ddZlEwUBUaev2MiD+hEVykJG
 Q9sVKvnw/RwWplu3bONPmDnbJzWJLtS6PqZPl417JUJLbKf7cZW4FNbaoUHOdL0WcImU
 MV3LDRskl+050zQ0CAcnCut5zZTaDKDaXLZgE6WDzNKEUgBkGRFUhvrNBHGBziJSklNT
 b8ZvwN7Hn93VUAtUC0QyCMTuP6g1dmPqQWFQI3wu/S03k8JOc30G0KAph/EttKgd8uta
 lqUy0t8E0JNc+PVDAAAFrcKNp8od/x3Lt9v2SGGlYatQROd/aPLOCliR2FYH7jeFZa7P
 dq5Q==
X-Gm-Message-State: AOAM530Njct6oHdIbYda32eEYaRreSLZM9m29E6zcYYD9BGbTVhRfD14
 rf2UvI8v+VHDlyML5EfbJg==
X-Google-Smtp-Source: ABdhPJzn9MyNf0yAEImhtz5Vy7C/Luds182CEZZVvFMqqdR4rHl5Uc2AY+2a3qIN5fLX5xwtyFrOOA==
X-Received: by 2002:a05:6808:1244:b0:322:6925:3f4f with SMTP id
 o4-20020a056808124400b0032269253f4fmr17196680oiv.39.1652834192947; 
 Tue, 17 May 2022 17:36:32 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 z3-20020a056870d68300b000e686d13897sm439885oap.49.2022.05.17.17.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 17:36:32 -0700 (PDT)
Received: (nullmailer pid 1950589 invoked by uid 1000);
 Wed, 18 May 2022 00:36:31 -0000
Date: Tue, 17 May 2022 19:36:31 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org,
 kernel@collabora.com, matthias.bgg@gmail.com, konrad.dybcio@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-mediatek@lists.infradead.org, marijn.suijten@somainline.org,
 yong.wu@mediatek.com, paul.bouchara@somainline.org,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org
Subject: Re: [PATCH v2 1/2] dt-bindings: memory: mtk-smi: Add MT6795 Helio
 X10 bindings
Message-ID: <20220518003631.GA1950529-robh@kernel.org>
References: <20220513150633.387200-1-angelogioacchino.delregno@collabora.com>
 <20220513150633.387200-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220513150633.387200-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_173634_290846_39565611 
X-CRM114-Status: UNSURE (   9.14  )
X-CRM114-Notice: Please train this message.
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

On Fri, 13 May 2022 17:06:32 +0200, AngeloGioacchino Del Regno wrote:
> Add SMI bindings for the MediaTek Helio X10 (MT6795) SoC
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/memory-controllers/mediatek,smi-common.yaml         | 1 +
>  .../bindings/memory-controllers/mediatek,smi-larb.yaml           | 1 +
>  2 files changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
