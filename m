Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62081C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Dec 2021 16:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=beFn2LDEp01YLAcCCrg4daSBLkNkNQKXpx0lidNi0yE=; b=kbbBYsReNYooMq
	dFeoi/xLjlowK+GRpHUvvIL+/Ern2og8olUANDeP411DxJTJXutbO4et64LlAK09Eu+0Cz+M76HZF
	TkQUfcES/HTnOqCvnAAYqdbfxnKO+CJ2HPtG1umS9KVapVXDvZOp3kcTAOg5mXCaqTa1qbnSz6mAO
	G5yeHvWUocaP186ZW23n4UyItzbEcg+YrPg9h0WoP7iXB3Yds/kag7cHSKg7gF0UcmdrTkL/qxCXt
	3oZPUUuTA9O1Qf9Hsv4HzTOjUi/N58G+sHA//YuerONd/dJktVpJwoEdXEjxUbhBuE+1oyYoUiAIW
	G5rfpXxLdZmCg66R2bPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxAde-00ErT2-AL; Tue, 14 Dec 2021 16:26:50 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxAdR-00ErQM-3e; Tue, 14 Dec 2021 16:26:38 +0000
Received: by mail-oi1-f182.google.com with SMTP id r26so27798161oiw.5;
 Tue, 14 Dec 2021 08:26:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ecdypzCN+U6v6zglYX7zDMYbOxt+qYg8f/j8Yv3wCxY=;
 b=HmVxLQOwhu19rXwAFRqfXP4//w2MY0avs/hec3smGRJ1EsQGb4Q4fuzzh61Cbe/UES
 MawMdWPeRCJWkTCkd9yCRS8FkGxVQkX3+GBAPfN16DLeu7ZOqS9x15V4FcqEOtlJ7HCf
 e9Q81KwUIwy3kwa89ZkFa0Dhk9cA/Q2RbwEBbSFXn6wjzk+3easEvZLuGcy5EVcSJTzy
 vZxBqdJqyB79biTyiuMG11fGGRcnJs57E9JqzBDAakPakbiQcJ/3sP0eVvxRuqdqPBIE
 b47RFjIujV4xzox+ByZVFcPqa8ZytpNZCkxoFeUUhIyWGkQmN2YQImBd2tMrG0H4buKT
 QMHA==
X-Gm-Message-State: AOAM532+QKsduXmPBLVk/nz8fY9JTEphh2TFUz3EpbaK5vqu+solOSqI
 0bR/2IeOPm4n5ev0wR3tPddi5kWo7A==
X-Google-Smtp-Source: ABdhPJyGSv7DXMKuwKAuUktDv2PCkL1nzWMMyeVxqFI6hpsoBQPH6hLLO1tq01FrxwqqJFeG4ib/gw==
X-Received: by 2002:a54:4701:: with SMTP id k1mr34049401oik.37.1639499194932; 
 Tue, 14 Dec 2021 08:26:34 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id t11sm48314otj.24.2021.12.14.08.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 08:26:34 -0800 (PST)
Received: (nullmailer pid 3502704 invoked by uid 1000);
 Tue, 14 Dec 2021 16:26:33 -0000
Date: Tue, 14 Dec 2021 10:26:33 -0600
From: Rob Herring <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>, Tinghan Shen <tinghan.shen@mediatek.com>
Cc: linus.walleij@linaro.org, matthias.bgg@gmail.com, bgolaszewski@baylibre.com,
 sean.wang@mediatek.com, bayi.cheng@mediatek.com, gch981213@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-spi@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6 2/4] dt-bindings: spi: add new clock name 'axi' for
 spi nor
Message-ID: <YbjFuQxL+Wp8tU6r@robh.at.kernel.org>
References: <20211211204014.8014-1-tinghan.shen@mediatek.com>
 <20211211204014.8014-3-tinghan.shen@mediatek.com>
 <YbdvIPq1hKPmKXXs@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YbdvIPq1hKPmKXXs@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_082637_174392_89D112F8 
X-CRM114-Status: GOOD (  12.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Dec 13, 2021 at 04:04:48PM +0000, Mark Brown wrote:
> On Sun, Dec 12, 2021 at 04:40:12AM +0800, Tinghan Shen wrote:
> 
> > Some mtk spi nor has dedicated dma(s) inside. Add a new clock name, axi,
> > for spi nor dma bus clock.
> 
> >    clock-names:
> > +    minItems: 2
> >      items:
> >        - const: spi
> >        - const: sf
> > +      - const: axi
> 
> This will cause any existing DTs that don't have both spi and sf clocks
> defined to fail to validate which doesn't seem great.

That was true before this. The default for 'minItems' is the number of 
entries in 'items' (this is not the default for json-schema, but default 
for DT bindings as that's the common case).

> Given that your
> commit message says this is only required for some SoCs shouldn't the
> minimum clocks requirement depend on which particular SoC/IP version is
> being used?  Not exactly sure how one specifies that in the YAML format.

With an if/then schema adding maxItems/minItems constraints (e.g. 
'maxItems: 2' for existing compatibles). There are many examples in the 
tree.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
