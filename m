Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B196BC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 21:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T4909o+ZJwgi1L8MENIjc0OE7vRQ1YbJuBfUhGjWQ1Y=; b=b0bT6PAbERTKGr8WwVKeXUVuzB
	FBeX54fkL7r7N/LgpQEkfGArg/EM1CkwzxDr0co5szHKUiH50GdEVdpp95AYgqwyS64tvSH/6YTaf
	P1fI4McWVf5hL9ZiuW8ni5Pz+20Q/NdDnJKIrf8tuaqdYvNsNZ6FJT/RAY4zmkT+4110AfGdKSHwf
	KuJsbTR8O6HVzXJh1DU4Wz2ZE4qQ1CUd/P1qtv6dkJjVzErzgBylcEzt97YdsTiSM7usrtYclU1e6
	6x8NnPjxdOcWpmrDUOTaGZ5/4+SLfC6OaSJ2IE/cLQ4vfzfQJNxR52nEO8fUE+ZRrsEmztla+2oeC
	2OWPg82g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o71cY-001cxu-Jt; Thu, 30 Jun 2022 21:22:42 +0000
Received: from mail-il1-f173.google.com ([209.85.166.173])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o71cN-001ctI-Cc; Thu, 30 Jun 2022 21:22:32 +0000
Received: by mail-il1-f173.google.com with SMTP id 9so219060ill.5;
        Thu, 30 Jun 2022 14:22:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=T4909o+ZJwgi1L8MENIjc0OE7vRQ1YbJuBfUhGjWQ1Y=;
        b=24nYzFYbHJNHEvse9eh6i7ErZZY/9/ylkxdaFMmtsKU2wgmjtKkHmzr2CUyR1csP0Y
         tcsJ4RW26fU6QLT9KGZ1O2mT3mE4F4SjTNossGOA3Q+zktW+7LKdjzNZW8Fkai9kl4Ub
         toP+QKFCl6OPJO0eSjEW6r8mZCYzNLdZhQQd7+PZkG/Q71H4mtwRKZ/wZiHsBACGEPvt
         79N71UWghISXbP1MRtgy/v8mcfbKKY2/2BMbuYmgPKRyjk1vzYdevWoSa1SFKQRT8OEL
         nCDMnTMO+hkCsGoAMfxC7Q7AKRhvHn3T//C0caDyk8k0NCgwxREDOQxrSa1RkvTBaULw
         wFFQ==
X-Gm-Message-State: AJIora/NA3NAvL6dLHd/XpV5RT+ScTI2wqSwzupXPbcanZqebsgkaSQN
	bcU6xb8Nf3AToh7m7L5FYw==
X-Google-Smtp-Source: AGRyM1tUHkRznlT3Zwq7RVA5PUw0xyPJTRlCsDeBnrR2kcY+djt+IfRnZuYf80Z7Nv6TfFTCt9EuSA==
X-Received: by 2002:a92:d5cf:0:b0:2d1:d9b0:d5b1 with SMTP id d15-20020a92d5cf000000b002d1d9b0d5b1mr6199947ilq.252.1656624148343;
        Thu, 30 Jun 2022 14:22:28 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id m4-20020a924b04000000b002d3edd935e5sm8402748ilg.53.2022.06.30.14.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 14:22:27 -0700 (PDT)
Received: (nullmailer pid 3323810 invoked by uid 1000);
	Thu, 30 Jun 2022 21:22:26 -0000
Date: Thu, 30 Jun 2022 15:22:26 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, matthias.bgg@gmail.com, sean.wang@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, nfraprado@collabora.com, krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: mt8195: Add and use
 drive-strength-microamp
Message-ID: <20220630212226.GA3323748-robh@kernel.org>
References: <20220630131543.225554-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220630131543.225554-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_142231_464647_D60339A3 
X-CRM114-Status: GOOD (  11.32  )
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

On Thu, 30 Jun 2022 15:15:43 +0200, AngeloGioacchino Del Regno wrote:
> As was already done for MT8192 in commit b52e695324bb ("dt-bindings:
> pinctrl: mt8192: Add drive-strength-microamp"), replace the custom
> mediatek,drive-strength-adv property with the standardized pinconf
> 'drive-strength-microamp' one.
> 
> Similarly to the mt8192 counterpart, there's no user of property
> 'mediatek,drive-strength-adv', hence removing it is safe.
> 
> Fixes: 69c3d58dc187 ("dt-bindings: pinctrl: mt8195: Add mediatek,drive-strength-adv property")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt8195.yaml      | 27 ++-----------------
>  1 file changed, 2 insertions(+), 25 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

