Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D4EC7619A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 23:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Q95Knbpjeo78pZINMZAvNZ8f1W6NvaHbQpZHgZ+DhU=; b=vJsGqZrs+XOfwjvKEarsjlKJpO
	XTAIzr5iA2N6zn9hR/XjsvnN+V91fRB9ely4pX0UhxzVRUkCzRQlvWNaSfk44dYBp3XFpy2Om/+kf
	a1ZGojkHOI39zT5rmOp2BMIQ2PSbM6Y9AUWkm92QxjkpuF2NuqjueQk3kvWARauTYkpMMrsaIDUVL
	duErgFz6K9bLILlBX8OTBlP1XhQ8mLFnh58slwatyFPeME8CUzpVfKiOa5CPjwh8xskzNZvekAjmD
	3gHsuCl+TeDbn0aZMYm5vjGCLJaGO9oIZrm/1Jnc9O2+w1ztYKwwcza/ZPNgm85J7oJOiORvEu0Yc
	3MwyOgKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmjS7-004apt-1a;
	Wed, 12 Apr 2023 23:00:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmiHl-004RQQ-0j;
	Wed, 12 Apr 2023 21:45:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+Q95Knbpjeo78pZINMZAvNZ8f1W6NvaHbQpZHgZ+DhU=; b=nJ+iYZLmz4XUhzAryq8Hy0wAse
	vL8+gtJKLaNRhxHZhACLwRl9N1uXFliJI1r3lRS9bERJD+P8+gns/hSeakaVc+OnC7pVCT+SQBF0s
	GpKnX7IF7cGlVYfyVUUp/XfGRKBKa/DCVY/dAwlcO3wHWS7bMwuCUuHXLe27j0TQglrZZIfV8/5gJ
	mA4V07b6uPt8m2tB9Dg09VdOKkL5Fi+t87+0ndXOhPj815HXBTGO3nUuVFSar/tsPtve5En6F7Smr
	wkQ/qU+GdhGko9o8sNCFasjf2jPimR0a0PGjFIUgIasu9wf3ROS5x1yv2ecJ8Uf/VNM1jQZ8hyhtq
	5N30JQ+Q==;
Received: from mail-oi1-f182.google.com ([209.85.167.182])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmhdE-00E2MR-2X;
	Wed, 12 Apr 2023 21:04:26 +0000
Received: by mail-oi1-f182.google.com with SMTP id bh10so8771146oib.1;
        Wed, 12 Apr 2023 14:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681333435; x=1683925435;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+Q95Knbpjeo78pZINMZAvNZ8f1W6NvaHbQpZHgZ+DhU=;
        b=VkozsTLcaI1mZbcFBHBMqUmO0iscbnL2wjYk1pfJLinKNdxJ+Da87VjJYvK8e71qX7
         bXZWseSEsTsvnoAlnlKrblokSLI+IlUEz9iBWRVfJzkfxoKenY1a5pWQEUkkW3djUFd4
         iGYDp9jJKg22bDTqFsUaM0HY5hh7wZkt3D6aK3IFu1uiLZQhBfuUKiHndRVlOc4+O6qW
         sPt/pgJxmMPLOQz89HWhyQCVFXGc6T54dA49E0jUUY00NUt8UdKSZPRmzU7/0guTkSRF
         oOe/5xQscaT1LVc75YUzUP6ncBlmolZlzDLkojuHV+VT4wXGubRad2siFcM2AI7r/KYE
         N8pQ==
X-Gm-Message-State: AAQBX9e4YlpfUjO7YQWXeCYLp9xSHdNdMLfhTAgAfffYhpl3GdGz7BOR
	0S7QNoxOO72jfZCkbUrcHg==
X-Google-Smtp-Source: AKy350ZAQUKENqZQK/BkT1GzRkK8etcW3v2rWKWM1oDiBBATLa6RSgxvv4SclTk2dvtCGsASeNojAw==
X-Received: by 2002:a05:6808:4b:b0:387:12e5:543a with SMTP id v11-20020a056808004b00b0038712e5543amr7422991oic.29.1681333434837;
        Wed, 12 Apr 2023 14:03:54 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id i128-20020acaea86000000b00386eff32f58sm7148418oih.13.2023.04.12.14.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 14:03:54 -0700 (PDT)
Received: (nullmailer pid 3200537 invoked by uid 1000);
	Wed, 12 Apr 2023 21:03:44 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: thierry.reding@gmail.com, kishon@kernel.org, ~postmarketos/upstreaming@lists.sr.ht, linux-pwm@vger.kernel.org, airlied@gmail.com, robh+dt@kernel.org, chunfeng.yun@mediatek.com, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, u.kleine-koenig@pengutronix.de, kernel@collabora.com, xinlei.lee@mediatek.com, ck.hu@mediatek.com, linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org, matthias.bgg@gmail.com, krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, vkoul@kernel.org, p.zabel@pengutronix.de, jassisinghbrar@gmail.com, chunkuang.hu@kernel.org, houlong.wei@mediatek.com, jitao.shi@mediatek.com, daniel@ffwll.ch
In-Reply-To: <20230412112739.160376-10-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-10-angelogioacchino.delregno@collabora.com>
Message-Id: <168133319583.3191294.4759319842761199183.robh@kernel.org>
Subject: Re: [PATCH 09/27] dt-bindings: display: mediatek: color: Add
 compatible for MediaTek MT6795
Date: Wed, 12 Apr 2023 16:03:44 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_220418_893133_8864A822 
X-CRM114-Status: UNSURE (   9.89  )
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


On Wed, 12 Apr 2023 13:27:21 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible string for MediaTek Helio X10 MT6795's COLOR block: this
> is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,color.yaml     | 1 +
>  1 file changed, 1 insertion(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230412112739.160376-10-angelogioacchino.delregno@collabora.com


color@1400b000: 'power-domains' is a required property
	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dtb
	arch/arm/boot/dts/mt7623n-rfb-emmc.dtb


