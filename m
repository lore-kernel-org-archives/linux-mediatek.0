Return-Path: <SRS0=olbE=LX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF585C11F67
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jun 2021 15:10:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72FE761DC4
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jun 2021 15:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72FE761DC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/8nhiqZe8WiqpRRMeV3pEJVHc48QLVmazSswc+TwOc0=; b=kLTYTeLhD8dLpM
	p3bVIGMZBZ0A7EFGf3EiCdyB5OrnVoEh+bVswu/W5akKdU0ifNHGJZox3X+K5Zouxbe7DpEaLArQR
	XMH1ZD2OFAxbnBWyIxSJFNmhd4BKZBnl6cI83bfZ5ZO8y3GqEwIm3wexHL7vfrUk3waG6tDJk33Pl
	NbQh3ubcvlrj+WEIX05fydo30Mq0jK3TJV5wZLNttAJKAK87oGwCkP1uKvXLeG7QVngSE6napKMsa
	kYbzYZmmFBlRr0/jUaH+ibiGnQ8C4osiUCb3BwPfj2ELzypiFMcNfKnmfxbF7vsZo1fxY+96ZoBcH
	gpxj/CKUvBSpUA/DzR2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyFMu-00BPkt-A2; Tue, 29 Jun 2021 15:09:44 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyFMr-00BPjM-TF
 for linux-mediatek@lists.infradead.org; Tue, 29 Jun 2021 15:09:43 +0000
Received: by mail-ua1-x92a.google.com with SMTP id e20so8477586ual.9
 for <linux-mediatek@lists.infradead.org>; Tue, 29 Jun 2021 08:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LuyBMZGhtBgcRJwd1A74SaR7qMVubxg4OKYSD7bf0Rg=;
 b=TGHWWV8kcyBivyZX88cWdYDh6ISxpSSnB+a3I2IZObT877GfF5myGHJDavSsywsD/+
 HRNudBk1MUSh5BxtRJ1ScnfRqOaOuhXBHdXG62OzrMB44GRE6P1JiknjAtVrJ4pZdj/i
 U5pXLro/rLS+ZY7yTlGCYle3qxXqCC9tPc4MXrPuipukj2QsFk68V37sCwZSf2hn+0J1
 aKCbqF+sjF004LTaqivSO4eR3lo+h9VcydpASTFhp0b+bOVi84Wsx33m1aSAIudIK1xx
 2rBMCcA0SsSfBjmlNB2BC67QUKQpheGAtnghLDKEJdOOrsg/Qq9BeURftGLO1HzvYeTT
 eBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LuyBMZGhtBgcRJwd1A74SaR7qMVubxg4OKYSD7bf0Rg=;
 b=NCNPzA0xdVz69CJcwdbVaTSLMWSWMP24rx9h15mmFZoKa0mF0wS5UfyXZm9C3OrqBA
 AnCsqqKCXTybALKj+3odfSOt1sYWMkSwUSMth8rVO4Bndp/bVgRG7QJXdBb3OPMrJOgh
 qMSEuotOvUNS4les72rZNNGuPcel3sNIdsGiGBPx7oTDisdFjXuBhnZZowf2lFyZe++h
 3f64VtNQABtFB5ibumzGEIyVh1RgnRiDgjuQFJJUTlIp30ox0PK82ZRv8s6HIw1Hphj6
 5G6ni3W9EKUntOdH8LdeBzWxCeuL4t8nej+n7QJ68c4J//dnL8j0REzAwHbJ+xHx2fJ7
 EFcg==
X-Gm-Message-State: AOAM533mssRDeK/KJNiCoWNNczUXRKDmUltokHQmkKnQHcju4TCXtFhq
 0arfoFchDiJ5l7w6GVafYpNMMuxOfesF8P2RPjYgaQ==
X-Google-Smtp-Source: ABdhPJzVIVyqLzXURZxn0TF1D1Ma0QIbM2IQTwNlaEsIhbBauCsjME4JZOq/bDRZJCt6zyyzOdYNbQVJX7NZ4PfyH7M=
X-Received: by 2002:ab0:484b:: with SMTP id c11mr27684290uad.100.1624979377958; 
 Tue, 29 Jun 2021 08:09:37 -0700 (PDT)
MIME-Version: 1.0
References: <1623726033-16073-1-git-send-email-wenbin.mei@mediatek.com>
 <1623726033-16073-2-git-send-email-wenbin.mei@mediatek.com>
In-Reply-To: <1623726033-16073-2-git-send-email-wenbin.mei@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 29 Jun 2021 17:09:01 +0200
Message-ID: <CAPDyKFrqeYbxDyrcicS=DQLntF8PfNm9E4tZf7KgvzRJmciLog@mail.gmail.com>
Subject: Re: [PATCH v1] dt-bindings: mmc: change compatiable string for MT8195
 mmc host IP
To: Wenbin Mei <wenbin.mei@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Seiya Wang <seiya.wang@mediatek.com>, 
 linux-mmc <linux-mmc@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_080941_973224_9DBC3AA6 
X-CRM114-Status: GOOD (  17.31  )
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

On Tue, 15 Jun 2021 at 05:01, Wenbin Mei <wenbin.mei@mediatek.com> wrote:
>
> MT8195 mmc host IP is compatible with MT8183, and currently it shows:
> properties:
>   compatible:
>     oneOf:
> ...
>       - items:
>          - const: mediatek,mt8192-mmc
>          - const: mediatek,mt8195-mmc
>          - const: mediatek,mt8183-mmc
> which means the compatible string in the device tree would be:
>         compatible = "mediatek,mt8192-mmc", "mediatek,mt8195-mmc",
>                      "mediatek,mt8183-mmc";
> The bindings is wrong and that isn't the result we want.
> instead we want:
> properties:
>   compatible:
>     oneOf:
> ...
>       - items:
>          - const: mediatek,mt8192-mmc
>          - const: mediatek,mt8183-mmc
>       - items:
>          - const: mediatek,mt8195-mmc
>          - const: mediatek,mt8183-mmc
> which would give us:
>         compatible = "mediatek,mt8192-mmc", "mediatek,mt8183-mmc";
> and
>         compatible = "mediatek,mt8195-mmc", "mediatek,mt8183-mmc";
>
> Fixes: eb9cb7227e5c (dt-bindings: mmc: Add compatible for Mediatek MT8195)
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index 8648d48..adaba90 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -31,6 +31,8 @@ properties:
>            - const: mediatek,mt2701-mmc
>        - items:
>            - const: mediatek,mt8192-mmc
> +          - const: mediatek,mt8183-mmc
> +      - items:
>            - const: mediatek,mt8195-mmc
>            - const: mediatek,mt8183-mmc
>
> --
> 1.9.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
