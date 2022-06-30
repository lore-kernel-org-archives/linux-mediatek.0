Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 508E6C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 22:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ak3+dnp61amEiQ9u+EY3cuHBMwvFNkOIcVD4cKlddrk=; b=4wDyPzEZud1MW1OleB8iSyuMDl
	L+RCexL73eLYyI64XTFeS0jlgWcEcdUQQ7ZUr9PXjbuu+IQW7IsXxrURa9bVK6QyefxLLe5Q3VRKP
	AiSr7uslPMGtMnbrYTqeIgFyqukhofrx9sKDvEBibmtNRAp4QZn3TuD7GfNupFbKRCzOcfgFLJT7+
	/3l6D2TSHDzzRa7gPy8e32AaP0uGJSXmNTFfc074PVfeTCytTjqci79QXFis0EImYLxU3SxZX7SxS
	8NZGKF1mIO6zMOLa9PCJbV/VJV3Dy4NAMoits8YHBmwAKlJyq/0eF07sOCbnQP31LeloB/ibcQcMN
	5MvJYQnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o72SK-001nWk-0R; Thu, 30 Jun 2022 22:16:12 +0000
Received: from mail-io1-f48.google.com ([209.85.166.48])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o72S9-001nTk-3C; Thu, 30 Jun 2022 22:16:02 +0000
Received: by mail-io1-f48.google.com with SMTP id u20so544315iob.8;
        Thu, 30 Jun 2022 15:15:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ak3+dnp61amEiQ9u+EY3cuHBMwvFNkOIcVD4cKlddrk=;
        b=OA1JrLkKqIf9D18J0yyUghLH9LL8cURy+9O3FlGspleL6Ljrkt0SB3fVMIjUsD+rEu
         JteBSZdV0hvn59NyXJx6+p9LLOoRg0qt6rPum9LAzgNoGlem9h6W3zWA/ugWqj+mA760
         eEaCl+lqZyy2zj1wQf2DEcyVMOvwn10U/lAU+mMQ+MK6A0I//LkLpvaz0L5bv/P9S/dL
         RZF4zhhfyTIyu3RFAk+AselG8lmwG03nVI49dVF/cuFah3H4q9MRtvP/0NQRXs4Tck6b
         nyQW56Qo/+Wldc+neTg4/bb11kkuXspXsVK+5DaLA4CLpi67dHDFaVT4XVC3q0qmiECO
         CeTA==
X-Gm-Message-State: AJIora+TtYLUPglOcJ+RICBd6DQViDQ02dJmy1JbgdyYOXr6qK+Qzgnu
	7Gfs/DF6eF4Oy0XIBld9lQ==
X-Google-Smtp-Source: AGRyM1vE/h3cXANQTxAFuDv4VQARTKgj8HZVod3l/44O5+NhZJF0h2bjCBppIfPdZR/32eQjnyvy7g==
X-Received: by 2002:a05:6602:13c8:b0:669:c3de:776f with SMTP id o8-20020a05660213c800b00669c3de776fmr5469069iov.124.1656627359098;
        Thu, 30 Jun 2022 15:15:59 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id b9-20020a05660214c900b006762d8becd4sm139051iow.55.2022.06.30.15.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 15:15:58 -0700 (PDT)
Received: (nullmailer pid 3418639 invoked by uid 1000);
	Thu, 30 Jun 2022 22:15:56 -0000
Date: Thu, 30 Jun 2022 16:15:56 -0600
From: Rob Herring <robh@kernel.org>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Cc: airlied@linux.ie, ck.hu@mediatek.com, devicetree@vger.kernel.org, granquet@baylibre.com, matthias.bgg@gmail.com, msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com, chunkuang.hu@kernel.org, linux-arm-kernel@lists.infradead.org, p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, jitao.shi@mediatek.com, angelogioacchino.delregno@collabora.com, daniel@ffwll.ch, wenst@chromium.org, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v14 01/15] dt-bindings: mediatek,dpi: Add DP_INTF
 compatible
Message-ID: <20220630221556.GA3418578-robh@kernel.org>
References: <20220624030946.14961-1-rex-bc.chen@mediatek.com>
 <20220624030946.14961-2-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220624030946.14961-2-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_151601_173880_DEE5CD1A 
X-CRM114-Status: GOOD (  12.16  )
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

On Fri, 24 Jun 2022 11:09:32 +0800, Bo-Chen Chen wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> DP_INTF is similar to DPI but does not have the exact same feature set
> or register layouts.
> 
> DP_INTF is the sink of the display pipeline that is connected to the
> DisplayPort controller and encoder unit. It takes the same clocks as
> DPI.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> [Bo-Chen: Modify reviewers' comments.]
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/display/mediatek/mediatek,dpi.yaml       | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

