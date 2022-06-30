Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E173BC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 22:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bwQzM8Z8cc5RUevl243HXV9krJjNefuoRXCjNrL2NnE=; b=P40EPEFA1wRoXl90u1BV+8tolx
	qiQR48N4QP2qZs0mN2/ya3cfQ35Kn803mP9+CMheGPfglpu7IJcCEEDynWrgnLwcBztwsAB7oLbnc
	3ZGFkWlq5kVR0H+1RjR8qrtbnTE2Bsc5RtNMYNlnnVIH4KJNLamPtf+D7YZxBOLzzV/gq6Bjhj34b
	PTESHE8pM6BvCwVWIcJ5YLFwhU0wls9nz0t89+Gs5sE2vuqKX6JwHZQgrfV0UioXVC8xC2YCJnklQ
	pahki8NUDTKN2sZiWaPk4Jx4vExCGv1yyhD7/8AFuoseyN9eXorLQXzCDSphMAoLkIej1aNIZ+SKz
	d436wlDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o72Sa-001nby-Lw; Thu, 30 Jun 2022 22:16:28 +0000
Received: from mail-il1-f174.google.com ([209.85.166.174])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o72SN-001nWy-Hl; Thu, 30 Jun 2022 22:16:16 +0000
Received: by mail-il1-f174.google.com with SMTP id p14so309167ile.1;
        Thu, 30 Jun 2022 15:16:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bwQzM8Z8cc5RUevl243HXV9krJjNefuoRXCjNrL2NnE=;
        b=XcZTjwXekP4IH4LYVo6BbAh3U0jMDp5qD1sfioT2PTtp0j2WtHoACPJlNakqz3N7aV
         c3HbFuuzPU+pKDbVrFOwE2UuD0ZGFSy7myM12NrZF4iNC4bxAdRph31Iwn87ShHQMpX2
         pm9IXxN6cv/4CL9yNw3nvsSBEg0+7j2sush/qnfXxlsCxSqmqYGgjdAhXQXkPIGQTHP/
         eJvP1+olp31bcikP2uc76ZA+xkeimdEoyyWoUeG+Oa9u1He7m6YvUP6OC3/5MqdRBG3+
         FEHBUVSEYKDu6EjDLTpEU6Q10odTCNjZmx83lwbpzbFiKLj2KPg8pI9qWnvabotWi/QO
         eomw==
X-Gm-Message-State: AJIora9cQgF+x535D2Z9TDqVSK4Q68Dtt1iqe8hp6KJHMR0UxW64djk+
	fvZo2QAsXp4NEDWIZru5mw==
X-Google-Smtp-Source: AGRyM1vIk+ofmEwR6kuswgAQlqMcwDrBTvWp70c3wJfdkA9jj0wzSMn+FzZ4UshCMr+WX2wnrh8qjQ==
X-Received: by 2002:a05:6e02:1b84:b0:2da:656a:ce11 with SMTP id h4-20020a056e021b8400b002da656ace11mr6680248ili.261.1656627372649;
        Thu, 30 Jun 2022 15:16:12 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id x8-20020a056638026800b00339c46a5e95sm8947669jaq.89.2022.06.30.15.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 15:16:12 -0700 (PDT)
Received: (nullmailer pid 3419102 invoked by uid 1000);
	Thu, 30 Jun 2022 22:16:09 -0000
Date: Thu, 30 Jun 2022 16:16:09 -0600
From: Rob Herring <robh@kernel.org>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Cc: angelogioacchino.delregno@collabora.com, msp@baylibre.com, airlied@linux.ie, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com, chunkuang.hu@kernel.org, krzysztof.kozlowski+dt@linaro.org, ck.hu@mediatek.com, granquet@baylibre.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, wenst@chromium.org, Project_Global_Chrome_Upstream_Group@mediatek.com, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de, jitao.shi@mediatek.com, robh+dt@kernel.org
Subject: Re: [PATCH v14 02/15] dt-bindings: mediatek,dpi: Revise mediatek
 strings to correct format
Message-ID: <20220630221609.GA3419045-robh@kernel.org>
References: <20220624030946.14961-1-rex-bc.chen@mediatek.com>
 <20220624030946.14961-3-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220624030946.14961-3-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_151615_624546_5819DFCF 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 24 Jun 2022 11:09:33 +0800, Bo-Chen Chen wrote:
> Strings replacement:
> - s/mediatek/MediaTek/ in title.
> - s/Mediatek/MediaTek/ in description.
> 
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml    | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

