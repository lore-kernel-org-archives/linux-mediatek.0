Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 875AFC54EBD
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 19:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B70jAnXcMDlhhFo6pygi7wm6qqiPd8cSnbuhQtDGWGM=; b=KUg48YxAX048bsSv+fL6hJum9e
	DwZoTVk/vS9Mfjts97xDiCI0d8RZAz8lBdSoOrwS9Yr+jWu4y/MluXOMR5NN2G5t1AD7et25ibC5/
	PzFkBXu8gadnSWBGhJkKDl6yh3OXuaJRV+MtkJzTEShpNf6dHjeeyMHlL1RjIgFOYloG7ulIQgS30
	VKnjTdg1wRikU3UdDbrBgFw8YC8J2dzYIvcxLXFicG25bqJ3Uliig3bCCu6t/AQO/KLMaWKBCrimG
	y18yEMSamJidSS3jyok4g/jPYoZEAOy31iQQ8+J4A91aGgLSRS7GKbsbfneTdPq29QHjEf3e+6dNg
	Lwfbdpbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGPZK-004Bpb-QV; Fri, 13 Jan 2023 19:18:26 +0000
Received: from mail-oo1-f46.google.com ([209.85.161.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGPZ9-004BlO-CD; Fri, 13 Jan 2023 19:18:16 +0000
Received: by mail-oo1-f46.google.com with SMTP id s10-20020a4aa54a000000b004f240f120b3so1970512oom.1;
        Fri, 13 Jan 2023 11:18:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B70jAnXcMDlhhFo6pygi7wm6qqiPd8cSnbuhQtDGWGM=;
        b=USeIuAq9Q2538zJvG5ZBehDZXCQMgjhvqfE06uqPhOcwcCfcU4HlfpIfYlOuInX9R3
         A6gBKZZ2b/b3X7FURtYP6vk9T4Gv/eym3dOrsnn+G/o6Oct/07VOC1lT8UWQW+VuoWvJ
         UEhLIzwPPmtz4GfVl6YQZ0IRyybmy8J3zyQum/OmSC6F7tcqpI7KiDickTB4Cl1HJG19
         c/t3ZaKqBqJ5+pK67JJ35mJyShfeIyuC7ninbvbs7wV7HGX+PhBV261Hj9dLod8Im0S6
         fDO/bv9q+jDq051Iwy8Mg2tyBeeJmN+M6NHI8ZMd8yv70cI4VUZs+69LE3P8MzhCTgrM
         VDUg==
X-Gm-Message-State: AFqh2kp/u6cPdlCA1tvGzkcrcni7V/7TtbJt39iZrR1uPzfkehBscWlI
	ToIBxp8yS50GQ5B8qtlQ3A==
X-Google-Smtp-Source: AMrXdXukJHRMoqZxa1jYf9MRBpcU3E+hcrJeeafUboM+qJLEIF0oaVFK9ocAmkIX+lr/RAHkjYQj+w==
X-Received: by 2002:a4a:2c97:0:b0:4f2:6b72:6f75 with SMTP id o145-20020a4a2c97000000b004f26b726f75mr3770772ooo.7.1673637494125;
        Fri, 13 Jan 2023 11:18:14 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m22-20020a4ac696000000b0049bfbf7c5a8sm10035924ooq.38.2023.01.13.11.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 11:18:13 -0800 (PST)
Received: (nullmailer pid 2763911 invoked by uid 1000);
	Fri, 13 Jan 2023 19:18:12 -0000
Date: Fri, 13 Jan 2023 13:18:12 -0600
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, hsinyi@chromium.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 8/9] dt-bindings: display: mediatek: Fix the fallback for
 mediatek,mt8186-disp-ccorr
Message-ID: <167363749222.2763683.4659795598968970100.robh@kernel.org>
References: <20230111123711.32020-1-allen-kh.cheng@mediatek.com>
 <20230111123711.32020-9-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111123711.32020-9-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_111815_435528_19278CB0 
X-CRM114-Status: GOOD (  14.10  )
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


On Wed, 11 Jan 2023 20:37:10 +0800, Allen-KH Cheng wrote:
> The mt8186-disp-ccorr is not fully compatible with the mt8183-disp-ccorr
> implementation. It causes a crash when system resumes if it binds to the
> device.
> 
> We should use mt8192-disp-ccorr as fallback of mt8186-disp-ccorr.
> 
> Fixes: 8a26ea19d4dc ("dt-bindings: display: mediatek: add MT8186 SoC binding")
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

