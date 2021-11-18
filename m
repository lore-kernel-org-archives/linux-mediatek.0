Return-Path: <SRS0=mmGE=QF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0CC7C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 14:39:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B48661155
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 14:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B48661155
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8TTSbIqcRxXF/vDzqkazpnNbeuRJJYXv5Ns+T92LuEg=; b=0/4iFw99fDNh7N
	jR+ItSANmYaP8ZkhD5OFNGDl7dQdq4ez9ppIttzh+J8ZRTIOzOl5UO2bp6kXz3keoSTEO3zFznVQD
	BmCzFuzU6247PtXSxJSLGPTPbD8BA7ZGAIEidPx/v9sQ5UoNHh1HNvvjtMSVslvhbwYcEe9fW3/ay
	h0RlNHpo/JfT0NW+ojlid/XUthXz/hZposBGue5zHQbVqWi+4DKCBrYPtBbyX4iHV1V9hR3lfxbv0
	rObVy8eT80ZR2zBNbEVDn0dvzLyR3KnCg3bFuN6BGzAGYzpTRUOSr90WXvQFHipqXsJoa4CdKWv1o
	m5J8U8uE/hkCLFcdZJgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mniYx-0089Kp-TM; Thu, 18 Nov 2021 14:38:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mniYk-0089GR-E6; Thu, 18 Nov 2021 14:38:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 294F861B6F;
 Thu, 18 Nov 2021 14:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637246322;
 bh=pD4G7qW+x2KbwwtQMCGnHfxLMGX7bM3IVbUSdTzZuoo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Nl335lEOgtonooJ1AmxqZ7gbLg2ZK4bE1yqe+Bu2OfQt/0hU8hVoTN7cuODAvARuO
 /oTUvMQkWowi6fH6yh9lHnIKSDCIil0ugwkY1nKPp9tputgevhuG9+NqSYl1aXhiSJ
 eQKaQBfJxIwS8B2MFxnArZ44v0RpQ4wyC+JouWZa0TBsMLZjfEpP/uOjbCiPYpA0o7
 lAQVbWU1Yy1s2clw9ojoKaRgdzPruZLN1CVtZ4epWel8RbNvBr18nUk/MG2Wpqqcmy
 aCpNn/12I977252NzAYDYn0rZnUssFZlk5lUdaU4yEmWSrKqCqV6uEd7OaZZ0Ny0Ad
 vGTBcLtck74+w==
Received: by mail-ed1-f51.google.com with SMTP id x6so16273381edr.5;
 Thu, 18 Nov 2021 06:38:42 -0800 (PST)
X-Gm-Message-State: AOAM530c9ixwShQYWz2zu3UHktUkIXxNrLkMpDYTzetCO3Bs/xvfBPZb
 LNXkuELJxkn1F7gILKt8oaIVUbUokwdSexN6xQ==
X-Google-Smtp-Source: ABdhPJyOhXQHvTcURpMYCd+ExjovfdgFB53E0/G+tY3NoX68Ljj4B0aI15Jv0BevTj64Nx8D/hi2bSWPp2mlCQoC7kc=
X-Received: by 2002:a17:907:7f25:: with SMTP id
 qf37mr34307372ejc.147.1637246320480; 
 Thu, 18 Nov 2021 06:38:40 -0800 (PST)
MIME-Version: 1.0
References: <1637133726-6581-1-git-send-email-u0084500@gmail.com>
In-Reply-To: <1637133726-6581-1-git-send-email-u0084500@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 18 Nov 2021 08:38:29 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJim5emHCnP4JLbxuuPcaLYiW5e6g9GCq1iEUg4vvr+nw@mail.gmail.com>
Message-ID: <CAL_JsqJim5emHCnP4JLbxuuPcaLYiW5e6g9GCq1iEUg4vvr+nw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: leds: Replace moonlight with indicator in
 mt6360 example
To: cy_huang <u0084500@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Gene Chen <gene.chen.richtek@gmail.com>, 
 Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, 
 wilma.wu@mediatek.com, benjamin.chao@mediatek.com, 
 ChiYuan Huang <cy_huang@richtek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_063842_514377_2F60442D 
X-CRM114-Status: GOOD (  13.75  )
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

On Wed, Nov 17, 2021 at 1:22 AM cy_huang <u0084500@gmail.com> wrote:
>
> From: ChiYuan Huang <cy_huang@richtek.com>
>
> Replace moonlight with indicator in mt6360 example to prevent the below
> build error:
>
> Error: Documentation/devicetree/bindings/leds/leds-mt6360.example.dts:114.24-25
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:385:
> Documentation/devicetree/bindings/leds/leds-mt6360.example.dt.yaml]
> Error 1
>
> Link: https://lore.kernel.org/lkml/CAL_JsqJRMVE163LaHTbtFARc4f_qg33bfQx+sD3ukce_xQF+gA@mail.gmail.com/
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
> Hi, Gene:
>
> I saw you have removed LED_FUNCTION_MOONLIGHT in v14.
> But you may forget to remove it from the binding example.
>
> Please help to review this change.
> ---
>  Documentation/devicetree/bindings/leds/leds-mt6360.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
