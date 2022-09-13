Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FB0C6FA86
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 15:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jvR+5cYBN/jmH4LHizAk50e3xiA5DYoi3s75z6jiRMY=; b=Hw7/B5cGUBTQF1UGA2x6qI5TVZ
	l3LYxhRDis+pnd+faWwwFayjSznB+64N9Qai1l8hJBV0udLrhivF4B76WTMBYrsZQv7/1amzAlH4f
	iBn2F4S4N/XIiA4MlQSZi/yJynLMyxX/rmlht1Ym2dOHlVHJHzmc+v8Eu82lYt/Mt5N44mnN8vpHW
	mY1GZSIJjj07ReyqJwJqHhv7HA5TmKt1nN3I5WoyjzEFRD8LXaJHSr4p4Tf5QVNstS9UJ/QV3M5Az
	y38kgQWIii81dW8n/H85+6qayFRedun64u5O1ZQtZ3E2RNUvbnnL0Vp5z7eE5fgbcayP98D8nG4Wl
	KSQB5Vfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY86G-00CkOV-91; Tue, 13 Sep 2022 15:45:24 +0000
Received: from mail-oa1-f44.google.com ([209.85.160.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY863-00CkHH-Fw; Tue, 13 Sep 2022 15:45:12 +0000
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-127f5411b9cso33205360fac.4;
        Tue, 13 Sep 2022 08:45:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=jvR+5cYBN/jmH4LHizAk50e3xiA5DYoi3s75z6jiRMY=;
        b=eb0FwaOeBlCilqDZqp4Sl4niIzjRTfS0O7Z9Xq/eJLnye0zgyiz0M7nKKeb9yxEx7l
         J2Y/P8HDbVaDu2ITctMQpqHQVLSwr3l3krYg6C995XO7SyR/mpstFUyuYNsovdpChtlB
         kTBoRo35cwrtLJtSgsZ8yeeDIXecaA1i43tbj02WL0C/qeIzbDfmMIATUu6kl6bKYYRb
         ZvGAZw0pydjOJrfYn4YNStoZ24S7I9p2fy/QbswjIy6uMys5mWIbiX/4BpCNczvjfEbr
         3HZTAeLaU/dp4yVx1l5CXpW17PaSiu5EMyvfxZYDIHoTC4fhY+5wAen6hHz+hLKnPv8r
         43eg==
X-Gm-Message-State: ACgBeo37s1KZgQ3SzBVV6yBV+16zXexEz/OQEju1Q/cR+5yv4mlnD1cm
	y/fAE69kjTouCmu7PSNa5w==
X-Google-Smtp-Source: AA6agR4JV7aKGKcSsm/3hcxmvaWfyHewMBq/2OdrrF0X9TNee1VdFTzf2OpU9JWPH89OowjsDjeoJA==
X-Received: by 2002:a05:6808:1441:b0:333:3929:d079 with SMTP id x1-20020a056808144100b003333929d079mr1859152oiv.21.1663083908038;
        Tue, 13 Sep 2022 08:45:08 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r196-20020acaa8cd000000b0034fd36e95bfsm1733767oie.31.2022.09.13.08.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 08:45:07 -0700 (PDT)
Received: (nullmailer pid 3793676 invoked by uid 1000);
	Tue, 13 Sep 2022 15:45:06 -0000
Date: Tue, 13 Sep 2022 10:45:06 -0500
From: Rob Herring <robh@kernel.org>
To: Peter Chiu <chui-hao.chiu@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Evelyn Tsai <evelyn.tsai@mediatek.com>, Sam Shih <sam.shih@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, Ryder Lee <ryder.Lee@mediatek.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sean Wang <sean.wang@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: pinctrl: update bindings for MT7986 SoC
Message-ID: <20220913154506.GA3793619-robh@kernel.org>
References: <20220912092440.21011-1-chui-hao.chiu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220912092440.21011-1-chui-hao.chiu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_084511_550050_F8617B3C 
X-CRM114-Status: GOOD (  10.98  )
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

On Mon, 12 Sep 2022 17:24:40 +0800, Peter Chiu wrote:
> Add wifi pins in the description and set 'maxItems' for groups and pins.
> 
> Reviewed-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
> ---
> v2:
> - Set 'maxItems' for groups and pins.
> - Update commit message.
> - Remove '$ref: /schemas/types.yaml#/definitions/string-array'.
> ---
>  .../pinctrl/mediatek,mt7986-pinctrl.yaml      | 48 +++++++++++--------
>  1 file changed, 28 insertions(+), 20 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

