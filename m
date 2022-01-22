Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9021AC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jan 2022 00:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ksJ3Hh8c58YARmxEzinyrvJN3tSpjSLUDlT9CON6D8A=; b=W3hPbTbXJZteXo
	nAS/neekWKrwi8dC2yVVtbH4+OdFHcRARAUJslczOoBVcEV8wc8cekkkPCBRlwWJcm+/o+MD36E4z
	GT593v6T20mr0UfGFuIPEah9wyfxpnovwm9DAFzS2W7pmuKrvUBchcbSgP32NalsY/8d3SfGNxfRK
	ECgetp0UihJFbtHsQxo7Dnc6DIpeGpZY7RdFbK2N6+MFYRKIzQFLHMlJFh1SvgTlLh81nVM+6kdxj
	dYFuRO6f/SAl4qGJnfA3iS/CD5sKlMlbkJTpGEcbBY4MAKxUsuBdENbWtm/KQUeM54gZXfEALnScc
	fWfTYpzxv3fMpegUiUgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nB4iq-00GKXX-JC; Sat, 22 Jan 2022 00:57:40 +0000
Received: from mail-oo1-f42.google.com ([209.85.161.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nB4id-00GKTZ-I1; Sat, 22 Jan 2022 00:57:28 +0000
Received: by mail-oo1-f42.google.com with SMTP id
 x21-20020a4a2a55000000b002ddf492c201so3803569oox.6; 
 Fri, 21 Jan 2022 16:57:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UCFVPsYIbWn5LSHXfQRNXq3VUxkbUc2dAX7qlE1mnBI=;
 b=AkrOnX2ytFtEiPYx+q5w4i3YKXKWoWJ8pKM8fpjHXZYIKRm3TwXDShi8aaqeB+HFlo
 ytxXVrfj1j+NL3gH6oAwS0PnPWCBGXQNps3cwL10vkWblIR1NftFuEy3sMLt4lPr0qG8
 /8nyEIcZIYpuu7oZRLwU/0SifCVAh2E0iPoGbXuy8U2XTq2uervWg6OMyzRPzmIZursT
 xxusUzFI5LCw+gI2a0e0DmRPrHwDxc10ydju0ozfkhw0c7IfzNicqSg+VhbSgVZLvbj0
 u0eWnhlKSiq/ugwjhmisnfCVIto+mUNGaNYG8gQFb/QCoNtPJ1FIUP36qDoKW0okZ3a9
 4eVQ==
X-Gm-Message-State: AOAM530I3ubb8VYxwOKnr6CspsJW9zOPhaUYFwpGWeszLfqaKnXSwxmn
 vQKqlD5UcSCqzDRZkqWCaw==
X-Google-Smtp-Source: ABdhPJyco54px60GtmKl9r/Bro32Hth5e2wl+B7OHmLSFZXoTB8yx2Z2qpiBX2veogSbGhFQF1Kl7Q==
X-Received: by 2002:a4a:94d3:: with SMTP id l19mr4140263ooi.94.1642813046635; 
 Fri, 21 Jan 2022 16:57:26 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id g91sm1877484otg.21.2022.01.21.16.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 16:57:26 -0800 (PST)
Received: (nullmailer pid 1956568 invoked by uid 1000);
 Sat, 22 Jan 2022 00:57:25 -0000
Date: Fri, 21 Jan 2022 18:57:25 -0600
From: Rob Herring <robh@kernel.org>
To: Leilk Liu <leilk.liu@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-spi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 3/3] dt-bindings: spi: Add compatible for Mediatek
 MT8186
Message-ID: <YetWdZnqEODQtBMU@robh.at.kernel.org>
References: <20220112103609.17421-1-leilk.liu@mediatek.com>
 <20220112103609.17421-4-leilk.liu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220112103609.17421-4-leilk.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_165727_620636_BD626D8B 
X-CRM114-Status: GOOD (  10.03  )
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

On Wed, 12 Jan 2022 18:36:09 +0800, Leilk Liu wrote:
> This commit adds dt-binding documentation of spi bus for Mediatek MT8186 SoC
> Platform.
> 
> Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
