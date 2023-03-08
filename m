Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B3FC64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 19:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9il/DGJIQiu6Ue8jvxZUwoY7ORjCm0v/Im7Io+dDxPs=; b=bRmMFrwSrtuWft9eAqpIdsbmf1
	7wavQWzO7HHIGTsm0l9oNPX35Z7s/sH4FH3kw8hGwJgV92IWnSwg/J91HRjn9iHUruHsuZqYpvPmQ
	Aye8oTazB0/oPNZWY6S/UnaaTQgLhL0PQTlxyT1Os0CgElBiL+xsQ7c8azCCjUuw9jLtP/S3d23FP
	f0AwNynn/kmqsZXuoeDsQtNiTYOygiBg/7P8FNj1m3nWsBuP3auJ9RInKOS1jv2sT/wWr9fcdQzIk
	onD6ydycySjFY1cVlIvuJGIjrKnHWYoHjcy2uGVvXiwFFnfjVlWGYT44NLWtU5Wlx40oGsAVcUkkt
	X15Yzw3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZz4o-006TiW-TZ; Wed, 08 Mar 2023 19:03:50 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZz4P-006TOn-Ba; Wed, 08 Mar 2023 19:03:29 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-176eae36feaso9055215fac.6;
        Wed, 08 Mar 2023 11:03:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678302202;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9il/DGJIQiu6Ue8jvxZUwoY7ORjCm0v/Im7Io+dDxPs=;
        b=T2hjRSl0UzKUskanx7HJlcwZx1QawrY+SlMRPy0sOlK4zXZa+CrXBu/7Gf10d1y4Np
         v7FzRyltNFPNyhYwrqdVl0fHi/euCJCaUcc0lM2mIvt/1QEdex+bhYHR/6UykqP5CDaC
         EabxjwhBzDmKc9z2qk/GA8PRN6VTMHxTRrRG5wQ3n//sLjiNkBxwPWNCs7gji1YHzJB0
         li9WWBKCt44Lj2p1jJG4ir7CUvo7wG2lL7xXZ2DJX8F29Prt9u3k43AB9C+qkgUNFxww
         AAbnNLoRrHHZjPQmsDQdpf3FkwHkLvw1/6q61Nw+lv3FlFc4qf4aEB/Ud2/Iwo70GOyj
         /dhw==
X-Gm-Message-State: AO0yUKXW0O8QkpkpSKW0YHNli4nZNFRO3rtBN2kAt/ktXFy7Lp9omgnH
	bjBSWWGwhcda8zEnJmWntw==
X-Google-Smtp-Source: AK7set/POqWuscJib/lrSJTB9epA2owd4C+73BtnHIuJFrEFJL2xeHZhaNT4yQoIOLqI2Iaqknu/XQ==
X-Received: by 2002:a05:6870:f292:b0:172:c578:d78b with SMTP id u18-20020a056870f29200b00172c578d78bmr1164117oap.23.1678302201744;
        Wed, 08 Mar 2023 11:03:21 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id dx12-20020a056870768c00b0017281100b75sm6506505oab.42.2023.03.08.11.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 11:03:21 -0800 (PST)
Received: (nullmailer pid 3605141 invoked by uid 1000);
	Wed, 08 Mar 2023 19:03:20 -0000
Date: Wed, 8 Mar 2023 13:03:20 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: steven.price@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, wenst@chromium.org, linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com, daniel@ffwll.ch, alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, airlied@gmail.com
Subject: Re: [PATCH v4 06/12] dt-bindings: gpu: mali-bifrost: Add support for
 MediaTek MT8186
Message-ID: <167830220018.3605078.16960763301333635462.robh@kernel.org>
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
 <20230228102704.708150-6-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230228102704.708150-6-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_110325_418539_298AA322 
X-CRM114-Status: GOOD (  10.73  )
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


On Tue, 28 Feb 2023 11:26:58 +0100, AngeloGioacchino Del Regno wrote:
> MT8186 has a Mali-G52 MC2 2EE GPU (two cores): add a binding with
> two power domains (one per core) for it.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  .../bindings/gpu/arm,mali-bifrost.yaml         | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


