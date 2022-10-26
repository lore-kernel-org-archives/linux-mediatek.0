Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF9AC38A2D
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Oct 2022 01:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HG4VVkS24N9P28wqi2fW2XTbUe425KORd603IoTp6S0=; b=MRyoxNuJop4aTtNLWbVmji5CpC
	gFJhxq9Mxr3dJAt/QA7gMF/KaqystHAxYOPLgZIl647c8aHD2jMcrtVIzT6wNyeONTLddgidsonBk
	CGjBjoBJADj6IWntk3+tXIrhfJMtzb5IiWvMo7pC2vuGEruQJzfcvx0ZLBmMRi7kZDig4RHDAgl0c
	FLDXXGKrU7tmvcmnqvM6+Rb/wpKzDODw9hf4kisTtZISrbOQuh9qAU5Xooe87YpfyBJJfrB5hIXwH
	sHPHOE0scoxpJCxMIOvlUWhXXcBpz981hZPmjOSBbT/cgbly3JuAicNQVyV4j9ftYPpykI+uh2FE9
	iA6jR6aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onUvU-007mdw-9j; Wed, 26 Oct 2022 01:09:48 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onUvR-007mdI-UR; Wed, 26 Oct 2022 01:09:47 +0000
Received: by mail-oi1-f179.google.com with SMTP id u15so16776697oie.2;
        Tue, 25 Oct 2022 18:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HG4VVkS24N9P28wqi2fW2XTbUe425KORd603IoTp6S0=;
        b=6VQ31CxJSvrb2uAYLBkjatucWGhn6MzyBhevhJEGuYCUpqJRB0QQ/ySeMHB54ruL+K
         O5V5fMvEw9kKgxi2XVP1E+TPG0DZZNUwCc13FmD6HCbq4XqVGN6LR7NCHcZJVLQ8gEgL
         X18hmjQnAMo7ZXWk/BeJR+A3EIdM/zB+WpR46qiqbB3vWkm4ttICANqD2vcVH8rScYKF
         5xsrUdHpSFNZBYuVI+77g58kruhAUpN9k8fOXpq+fn5Ri1kjGJ07oCaKItgLQc1FkzGw
         bdbAfpoCVC+fTfI/wXuy3Sq/1wnj5MTBG67fH2wyNuyQrwz97wGxRG+Z5kENY7g3IgGv
         nOWA==
X-Gm-Message-State: ACrzQf3icIY3uOMnuwD/13xK8zMmkd37k8E/bui5ZeYgBR7UDjRMHIJu
	gqzRDh4wV3ZGKyAmLtqfQA==
X-Google-Smtp-Source: AMsMyM6ZtYFMnBkpqKM2x3pzwsH/yh/j7SGFOypJpp0NROCfS3lVPoCuxyWMxk5quff+xl9pBCy9rw==
X-Received: by 2002:a05:6808:1893:b0:354:b5bc:cd0d with SMTP id bi19-20020a056808189300b00354b5bccd0dmr598596oib.244.1666746584580;
        Tue, 25 Oct 2022 18:09:44 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id i25-20020a9d6259000000b006619533d1ddsm1603477otk.76.2022.10.25.18.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 18:09:44 -0700 (PDT)
Received: (nullmailer pid 3525382 invoked by uid 1000);
	Wed, 26 Oct 2022 01:09:45 -0000
Date: Tue, 25 Oct 2022 20:09:45 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org, kernel@collabora.com, Rob Herring <robh+dt@kernel.org>, Jiaxin Yu <jiaxin.yu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Shane Chien <shane.chien@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: mt8192-mt6359: Set maxItems, not
 type, for sound-dai
Message-ID: <166674658480.3525343.6807644531936287296.robh@kernel.org>
References: <20221024230658.1772907-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221024230658.1772907-1-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_180946_000758_1281D350 
X-CRM114-Status: GOOD (  14.80  )
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

On Mon, 24 Oct 2022 19:06:57 -0400, Nícolas F. R. A. Prado wrote:
> sound-dai is a standard property whose type is already set to
> phandle-array by sound-dai.yaml, so there's no need to set it (and
> wrongly so for headset-codec) in this binding. What should be set
> however is the maximum number of items, which for headset-codec should
> be 1.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> ---
> 
>  .../devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

