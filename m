Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F261CC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 23:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EV6CjuoOmDJCrT3HK8JiKWVQT6lYUA0pH9U3EEboe7E=; b=pemq9ZqSzUYByhSZzlKAbL1SLX
	RmhZow1txwZc+QWQswNvhIuDhigLRE6Le5X5H3C6ZiQfZae/XkE73IllFQUwynO9cYehQJ+F0eUNg
	g9QqQj9xM8AQookjq6rp6TT19aphTv/YkbGFuZVVyO1vS/7nulvyekagxXkaaozC5RcmecHv+nOT8
	+/sgYwDVD0pGu1GMr/+4cTy41bI983Cb/o8lzB+6aPljHD7plSExg3b7Vu4Oab1V+nBt1IhRy3HJv
	x9RwIg4H3H6HO9wOnOfMH4iFYcKjZZOd4cd1xu0ND8QQoNr2ntQCYBnpFcL3DQzv6QZnnXm9ibodr
	a1yg4FcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0tJZ-00BrGV-62; Thu, 01 Dec 2022 23:50:01 +0000
Received: from mail-oo1-f44.google.com ([209.85.161.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0t3Z-00BiYQ-Cu; Thu, 01 Dec 2022 23:33:30 +0000
Received: by mail-oo1-f44.google.com with SMTP id j1-20020a4ad181000000b0049e6e8c13b4so493843oor.1;
        Thu, 01 Dec 2022 15:33:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EV6CjuoOmDJCrT3HK8JiKWVQT6lYUA0pH9U3EEboe7E=;
        b=0zQ7dWPBmcFh++WseC9TqJt616qZl/p2KU1crhmtqMNW6421Dzeldfv2nwQMa84bMv
         F8LxVcrqRJhwZX/vLW4Xt1fixfe9bjaQBggyTG0uTGWwKJx905CfBKxt8QjKPgXqDsDh
         nfZQaTZGCL8oOfCNbktrT8Mvn/1EP4UXao07RUF2MAoKBwW1liZIaMKsmJyLDCN5pGHH
         vE4DtuT/YTwGrj/0xLi37hJxvlpOhR7CjTPqLziKGqAdYgS6D3StyVRtOlPSWVq1Bs1+
         mGVpk9KPvr67ze7bOz81ZAJ2RMuRRw3pP6liQwzNpXwajMT7eVwtyirkRG9FZwKL3bm4
         o0ZQ==
X-Gm-Message-State: ANoB5pllZ0I5SfRS7t2R0VqJ6oAm8YZWMnDoH2tmbJldwo6rrIhsjkl8
	8Dk4DGLovDqPkbxH/K6ciw==
X-Google-Smtp-Source: AA0mqf5M9nJX9KDi3rKXW1IQ32Xx7g8ROHxHwlWwX5hwmRYB/D8rbNNcafvpX5yJhj0k3R6jjdm63A==
X-Received: by 2002:a4a:ad49:0:b0:49b:c0e:3d5f with SMTP id s9-20020a4aad49000000b0049b0c0e3d5fmr29549672oon.69.1669937605311;
        Thu, 01 Dec 2022 15:33:25 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s34-20020a056870612200b0013d9bd4ad2esm3361315oae.12.2022.12.01.15.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 15:33:24 -0800 (PST)
Received: (nullmailer pid 1686225 invoked by uid 1000);
	Thu, 01 Dec 2022 23:33:23 -0000
Date: Thu, 1 Dec 2022 17:33:23 -0600
From: Rob Herring <robh@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Fabien Parent <fparent@baylibre.com>, 
	devicetree@vger.kernel.org, linux-rtc@vger.kernel.org, 
	Sean Wang <sean.wang@mediatek.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Tianping Fang <tianping.fang@mediatek.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Pavel Machek <pavel@ucw.cz>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Fabien Parent <fabien.parent@linaro.org>, Flora Fu <flora.fu@mediatek.com>, 
	Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org, 
	Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee Jones <lee@kernel.org>, 
	linux-input@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v7 3/8] dt-bindings: soc: mediatek: convert pwrap
 documentation
Message-ID: <166993759991.1686069.16535756664012746082.robh@kernel.org>
References: <20221005-mt6357-support-v7-0-477e60126749@baylibre.com>
 <20221005-mt6357-support-v7-3-477e60126749@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221005-mt6357-support-v7-3-477e60126749@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_153329_469363_5BDFF971 
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


On Tue, 29 Nov 2022 16:57:02 +0100, Alexandre Mergnat wrote:
> - Convert soc/mediatek/pwrap.txt to soc/mediatek/mediatek,pwrap.yaml
> - Add syscon compatible const for mt8186 and mt8195 to match the DTS needs,
>   which is missing from pwrap.txt.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  .../devicetree/bindings/leds/leds-mt6323.txt       |   2 +-
>  Documentation/devicetree/bindings/mfd/mt6397.txt   |   2 +-
>  .../bindings/soc/mediatek/mediatek,pwrap.yaml      | 147 +++++++++++++++++++++
>  .../devicetree/bindings/soc/mediatek/pwrap.txt     |  75 -----------
>  4 files changed, 149 insertions(+), 77 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

