Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06743C19F2A
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Aug 2022 09:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pPnoh77QEcb+sKjdUBUVtHO5SMPJaPgXOLcl+ed6QOk=; b=I4a6bOe5kI1FNE2d/4rXL8xoa8
	jjxN4yxWxxz1U3h794LZ6+i25ppJWCWD2iApMgPGLxWNLneqkr8dJG/Fm2aGxsllnQblqFe6EtRG4
	Q2+3AV8Xt+7Hzq6X3crlAJdFwd5RP36Dwx+R3/MUrcVPZnF0nF1oU5m0+4gXkw83ExVNfhxqxWLQx
	nYiFtVUn5+rzHvUN17tFpndPxc9+kUV7bvNvHiB7iH8HubPlv+Alrr/BKs/GIT9NT6wA1Fb+QToX0
	R00h0J3l9pgwUH1+tvMoH1lR/+7RsEPYFPaktfcxVuqJ40NTwdR3k6ItmYF50M+lQikmAlHjF+OY5
	eO/TTR2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM45g-00AWx4-ED; Thu, 11 Aug 2022 09:02:56 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM45c-00AWqy-RM
	for linux-mediatek@lists.infradead.org; Thu, 11 Aug 2022 09:02:54 +0000
Received: by mail-ej1-x631.google.com with SMTP id gb36so32332675ejc.10
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Aug 2022 02:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=pPnoh77QEcb+sKjdUBUVtHO5SMPJaPgXOLcl+ed6QOk=;
        b=IXX6jMMZyMHVMk0TiNF4dt/q+pPM6XZ8yg81aYk029NESvkf12Emw9btUPkil0WEsR
         1PMsQYO3PUCDYDfz81FzleYvJu9C3c03jCBPzl1ijNceaeE6bJX3o0Hca9Jxiw8yEQbx
         h2UPY1i+ss4F9YZlzZB/qlZmF5zfClDJqZl1RVycUixhb5d57s5YhFIyuVntEeoHTy1c
         jvokit9Y2qe1qFgn6RkshFkMYyAwBtSTaNO2JYG5eCad4tafI3zXVnlW3EBU+qOAQdSy
         ZJIPxKeLkt2QIZCy/ieehi0trHlCci1uPzvqgvgoRFF00YWE2cg/M+l/viKARC3jLOpT
         oWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=pPnoh77QEcb+sKjdUBUVtHO5SMPJaPgXOLcl+ed6QOk=;
        b=V+5ub0okJwZT6k/rykmXSRczdznzMI6LhVkXRE293mGWR4aqNnLVqkW53ZTCsjgUSS
         iXMvVqt2udvw+b44Fmim8MRdH3ADUWC7LxTrmSZcF4GtiE3FU7L4nXmMM0iDNZBbVC0Q
         x0OFcOuYXhAGzwWYbEOyKU2HZjnKG6rWao/3mk5dmhRe67J9PNtuS8mzpERehntYysCw
         jW1s+ZruFN4xUEIpksnS2xwXtNBaK3A533Nf4o1OI95ibb5lnlL2a2wPtRzsvM5hAfRo
         2hpZKBCtYR+q7CKq/XPKinRagZDmONbejb4phLYPQtlnjFk/ykxmFjU7afABFa0qTDdf
         /Teg==
X-Gm-Message-State: ACgBeo00cqWos6AxlnajYeE/j+dkenVp14PD80yt0FilboAa1T3SLEQG
	WmYdGd6xoCictY4nWCt5pnb4BQ==
X-Google-Smtp-Source: AA6agR6sVb8BEuxDhpl4+d5fPlqr2RhhkvOY8mq+n60l4jTmNyzMGtr3zfbk0tsLoxqb7bKLwfs+2w==
X-Received: by 2002:a17:907:7292:b0:733:1965:3176 with SMTP id dt18-20020a170907729200b0073319653176mr3867288ejc.318.1660208570424;
        Thu, 11 Aug 2022 02:02:50 -0700 (PDT)
Received: from blmsp ([2001:4090:a243:8036:200c:a862:4253:884])
        by smtp.gmail.com with ESMTPSA id n6-20020aa7c786000000b0043a554818afsm8782252eds.42.2022.08.11.02.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 02:02:49 -0700 (PDT)
Date: Thu, 11 Aug 2022 11:02:49 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Fabien Parent <parent.f@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: mediatek: add bindings for
 MT8365 SoC
Message-ID: <20220811090249.ymetmw5xacc2dhin@blmsp>
References: <20220811084433.2598575-1-msp@baylibre.com>
 <20220811084433.2598575-2-msp@baylibre.com>
 <efe20cbf-485c-548c-933c-ffddb6c81d02@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <efe20cbf-485c-548c-933c-ffddb6c81d02@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_020252_922843_CEBCFEB5 
X-CRM114-Status: GOOD (  17.54  )
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

Hi Krzysztof,

On Thu, Aug 11, 2022 at 11:50:05AM +0300, Krzysztof Kozlowski wrote:
> On 11/08/2022 11:44, Markus Schneider-Pargmann wrote:
> > From: Fabien Parent <fparent@baylibre.com>
> > 
> > Add the clock bindings for the MediaTek MT8365 SoC.
> > 
> > Signed-off-by: Fabien Parent <fparent@baylibre.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > ---
> >  .../bindings/clock/mediatek,mt8365-clock.yaml |  42 ++
> >  .../clock/mediatek,mt8365-sys-clock.yaml      |  47 +++
> >  .../dt-bindings/clock/mediatek,mt8365-clk.h   | 374 ++++++++++++++++++
> >  3 files changed, 463 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8365-clock.yaml
> >  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8365-sys-clock.yaml
> >  create mode 100644 include/dt-bindings/clock/mediatek,mt8365-clk.h
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8365-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8365-clock.yaml
> > new file mode 100644
> > index 000000000000..31cd248e772b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8365-clock.yaml
> > @@ -0,0 +1,42 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: "http://devicetree.org/schemas/clock/mediatek,mt8365-clock.yaml#"
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> 
> No quotes needed in both lines.
> 
> > +
> > +title: MediaTek Functional Clock Controller for MT8365
> > +
> > +maintainers:
> > +  - Fabien Parent <fparent@baylibre.com>
> 
> Are you sure this is correct and working email? Let's try not to add
> non-existing emails to Git maintainers. It's a bit of pain to fix it
> later. :/

thank you, good point. I will fix everything you mentioned here and
above and below for v4.

Best,
Markus


