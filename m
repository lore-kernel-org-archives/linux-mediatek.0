Return-Path: <SRS0=sOPI=HH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B2B5C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 07:11:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCBE764DDC
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 07:11:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCBE764DDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z9tyRnTVbohbHFKiOOKSKpMiPG4cmfiLUjo1qdPKBm0=; b=vVUb2OgZlxoP2GXNLQRXlfHX6
	j10ZC+ZTgFXqLhxtXlWIp2fBao6eAG6M7m7NUu1dVTPQgL29qL/atokRPQASSSlr41jsS3HIbEuFT
	HcHi7mVHtyKLOZNfNftjOUTMnzIrSBaFoAfW/0RACk4EsW1qQ1J/WYTpg1PWqsjAlyBnDHUzg4sL1
	BJqGIE+/pXmPQm2u7KoesygS4VMh52nW85hvBjaiPOgvROsBzRmoBd0rixAg6KtvF+eWijRSi5m/q
	bXM1MdaaBV4L40y0DdnIa7m/LAihzPzy0BkE5YUL9O50vnbTsWWhEA6gJ/8uBELS/5UycQXqN5P3Y
	UvzgzKbiw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7vH3-0005vT-Bw; Fri, 05 Feb 2021 07:11:25 +0000
Received: from mail-ed1-f54.google.com ([209.85.208.54])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7vH1-0005ux-Q0; Fri, 05 Feb 2021 07:11:24 +0000
Received: by mail-ed1-f54.google.com with SMTP id t5so7521069eds.12;
 Thu, 04 Feb 2021 23:11:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c6300FPJgdNhEYdiFOY4v3mF7KUoaPzekcF12DCQngw=;
 b=oNitWHNChFtYaCLjkZI8BM7Sfr2KFhawAHXPQV6u6IscYic+VC9M+2Qd6F8l6qUsSa
 Frk1CCnXnXOygmYJyZV5BypfKpoU8MuysLrReiats06nJoQeXB89dWNaBBPQXxkTROut
 svZ+la3UMXndTND59FHDF4seQqBOodE/2V8l6PqW0cQk35VFajtQYcCXdfY/Amsqp3l4
 G6ki07TZYpfGC3/JDEsAh5p7KErkE+Gi7FmbJtu10DxSzjvvszQhZtLlFoVLo3k7spm+
 AFuK2Ia62fsQNqy2FPJHEJFe/nL/0wtGl02d4K5VjwPB/INM4p9asPRRqxdA3pMzVKa9
 +RRg==
X-Gm-Message-State: AOAM533BWvygO/AQtKKzY69j/6subfCFXNEAqy68ffr4icgEUqF270um
 zy5LwGC9mpp+U1bWGq2ivu4=
X-Google-Smtp-Source: ABdhPJzMsS7GJ3tNPHi18Tl9yXVfbJrYFFNhnZea/BS4TtA/CfEwjxcggsZUsuEjnlIp7/Nj3dKCog==
X-Received: by 2002:aa7:dc17:: with SMTP id b23mr2263816edu.139.1612509080553; 
 Thu, 04 Feb 2021 23:11:20 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id e6sm3746713edv.46.2021.02.04.23.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 23:11:19 -0800 (PST)
Date: Fri, 5 Feb 2021 08:11:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] dt-bindings: pinctrl: Group tuples in pin control
 properties
Message-ID: <20210205071118.obqsdlu64udsp5b2@kozik-lap>
References: <20210204125718.1646082-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210204125718.1646082-1-geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_021123_870301_CC65DACC 
X-CRM114-Status: GOOD (  13.02  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Fabio Estevam <festevam@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 Sean Wang <sean.wang@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Stefan Agner <stefan@agner.ch>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Feb 04, 2021 at 01:57:18PM +0100, Geert Uytterhoeven wrote:
> To improve human readability and enable automatic validation, the tuples
> in "pinctrl-*" properties should be grouped using angle brackets.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/pinctrl/brcm,ns2-pinmux.txt    |  2 +-
>  .../devicetree/bindings/pinctrl/brcm,nsp-pinmux.txt    |  2 +-
>  .../devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt  |  2 +-
>  .../devicetree/bindings/pinctrl/pinctrl-bindings.txt   |  4 ++--
>  .../devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt   |  2 +-
>  .../devicetree/bindings/pinctrl/pinctrl-mt65xx.txt     |  2 +-
>  .../devicetree/bindings/pinctrl/pinctrl-single.txt     | 10 +++++-----
>  .../devicetree/bindings/pinctrl/samsung-pinctrl.txt    |  2 +-
>  8 files changed, 13 insertions(+), 13 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
