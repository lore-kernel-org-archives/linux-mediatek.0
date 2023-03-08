Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C11CC64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 22:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BuqaB12E/7ngxaZSj8+nNOabs9E8O9u5mS2YqCJwwyM=; b=mbAVRj4jB7owx0ygGa46PbbhCa
	fAc/Uqbd9ID+RCsJm99eacHAYZqVAqMc5vfN0SEFFPg9tUrtsTCvGn7VbIqkgAyJn+RRNg3JR0CVX
	hi9SND/CJ/pkAlYOZ0N5EyyTfo5dY4tkoqw8rBL1acFwxmRN5lAbtJdi1z/ROwYLVIYHKgYSCv5bO
	DrKIYeExndj81mkMMAUf+e5fcoTh8VLRYh4D2yHyPYE+LGLX2pWpx/rB/STDjqzG1Rt65koxhx6MQ
	7wyWkUet/XyraaIKfoPNUJqaAluJJUgV3Z+yD7BGEmMUEjXx7S2OX/U+oabdf4uI6nB/fhij+gKLx
	3kL2albA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa2ex-0070Ls-2H; Wed, 08 Mar 2023 22:53:23 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa2en-0070J3-DC; Wed, 08 Mar 2023 22:53:14 +0000
Received: by mail-oi1-f171.google.com with SMTP id bk32so276382oib.10;
        Wed, 08 Mar 2023 14:53:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678315991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BuqaB12E/7ngxaZSj8+nNOabs9E8O9u5mS2YqCJwwyM=;
        b=QNt+aMEfgXpTk5cifr0/6Fw0lk/SXWLDehmWNArduNpng58emmpl+jiPMVt1n8xTfi
         A5QnAhDMNZWMcBlnf/SLqP/8AOlrAe8NHEsCGuP4ehZJncfvLbbvReXhMcGpC4W6XMlr
         ZICW9Jehy7iXJRWhsHiP+fk82vrw24NftgaUqvYah+S5E1rMZBZA7KLwmX/Rqg8uA+jE
         KG7N8Yzw2cYnwFtqa73L8pgtEOuMxKCRHCcPz7pn2iY+XNUXO2qI7jRgXdpr/H5iiOat
         /mm3PfjmRWa4/tmXHWQFoBDRZybbQQUFguEKZQd0hRuZqER9zes99YvcQRDU4TWhfGXO
         ozQQ==
X-Gm-Message-State: AO0yUKVPjvFTEkLCkC8n81YJb+mx4UTGkX+pJPz3FKXEN9fRzo11K9Fx
	jR8wq89aL3BpwLY+CQdJ0A==
X-Google-Smtp-Source: AK7set/JsmNvMFZfoHYzJSHo/B2HND/OIf4wuhBQxRS2EIhzSv68ARsX30CfkPjJdX71RA0lvZO0nw==
X-Received: by 2002:a05:6808:994:b0:384:2f05:55e7 with SMTP id a20-20020a056808099400b003842f0555e7mr8215887oic.55.1678315991298;
        Wed, 08 Mar 2023 14:53:11 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y205-20020aca32d6000000b00383eaf88e75sm6883273oiy.39.2023.03.08.14.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 14:53:10 -0800 (PST)
Received: (nullmailer pid 4020456 invoked by uid 1000);
	Wed, 08 Mar 2023 22:53:10 -0000
Date: Wed, 8 Mar 2023 16:53:10 -0600
From: Rob Herring <robh@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Allen-KH Cheng <allen-kh.cheng@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] Fixes dt-bindings: display: mediatek: Fix the fallback
 for mediatek,mt8186-disp-ccorr
Message-ID: <20230308225310.GA4017099-robh@kernel.org>
References: <20230306-ccorr-binding-fix-v1-0-177d81d60c69@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230306-ccorr-binding-fix-v1-0-177d81d60c69@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_145313_469088_0D3AB64E 
X-CRM114-Status: GOOD (  12.61  )
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

On Mon, Mar 06, 2023 at 02:40:11PM +0100, Alexandre Mergnat wrote:
> The item which have the mediatek,mt8192-disp-ccorr const compatible already
> exist above. Remove duplicated fallback.

Drop 'Fixes ' at the beginning of the subject.

> 
> Fixes: 137272ef1b0f ("dt-bindings: display: mediatek: Fix the fallback for mediatek,mt8186-disp-ccorr")
> 

No blank line here.

> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
> Fix MTK color correction binding
> 
> The fallback compatible has been duplicated in the 137272ef1b0f commit.
> 
> To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> To: Philipp Zabel <p.zabel@pengutronix.de>
> To: David Airlie <airlied@gmail.com>
> To: Daniel Vetter <daniel@ffwll.ch>
> To: Rob Herring <robh+dt@kernel.org>
> To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> To: Matthias Brugger <matthias.bgg@gmail.com>
> To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml | 3 ---
>  1 file changed, 3 deletions(-)

With the above,

Reviewed-by: Rob Herring <robh@kernel.org>

