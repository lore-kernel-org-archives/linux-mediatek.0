Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9721CC00140
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 03:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IARz1toyVxe2HEfXFShiS/q8AGQuTpTxAvAR8tfiMlI=; b=M6HmLKpaGNHBfqOwHRzFinpkXr
	/h3YUo7gkgBbBKKGZMxItUpmWGENN5r5gDD6dW7EY+W3ufobRnbQLxliq778qw8YB8DKVW8croE9x
	977K1Ec3uDx4spm75aeV+H2Pst9FXHXE2FjBxj7rn2dHRJIxgDyDv/Qm4CHNyq1EWz4JfxkHL8zcO
	FfP3O4bQwbe8syWvgcxghIdEb0fuWmTetzpwRaB/1y3NSORkWQByoU3nbntAYHIBBNU+zrxHkZfEl
	Qtfkeonhg6eXBbZkwzwq+0ChuJ+sGo6Gkt2QUafH/5BIjI6SXyyCkB1Uo2Qat8TGDmt+qo6BK9+qK
	fLDCVYcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHGF2-0005ZD-RP; Fri, 29 Jul 2022 03:00:44 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHGEr-0005Pe-NG
	for linux-mediatek@lists.infradead.org; Fri, 29 Jul 2022 03:00:35 +0000
Received: by mail-wm1-x32b.google.com with SMTP id w8-20020a05600c014800b003a32e89bc4eso1883647wmm.5
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Jul 2022 20:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IARz1toyVxe2HEfXFShiS/q8AGQuTpTxAvAR8tfiMlI=;
        b=PEMKgRBg0/b8wGG06Ge61tOAZBg5440Z+J7QOYbD12FX41/2XsVQyh4TznJ+UHK5kH
         NryQjFW2ZK2KTD8qQxn3ZgSFKXRI1VjMcXjDvrtle5B2LdnezzkZrl3qN4w4bcm0Qlvu
         faD6K2VU+v8jypIBrG+P6iJUKSnGYh2oH6csw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IARz1toyVxe2HEfXFShiS/q8AGQuTpTxAvAR8tfiMlI=;
        b=W+w9gyt8bSpedRrFlWjyZjKRJ7jmsrPcGs4pDJfBGiZdS8NzIwU5qMsAOcQ7ipcq3A
         xBrfEtKvon9wzHZU5TvXhv9cl37/2WwDYV7EMg35BwQEvftFS+EOj/rwUBa4a8RnIE2j
         76/qrRp9gYfrmLorS30sKOMgQ52W5qY+CvAzbRC6zyoCyrbf5noWv8Fg+3DTK+s/DbfU
         uLE96Tkfghz0LEf7eS2hIwYbL39d1m1a3VXTapUvw1Rc2FlZA5B6xjRO/2krxxgHM9mz
         LHzFu02Kycw3ehfRRn7wSysMEU97WN6+QowUdNAYnLArt3FFByz2VJC6C5aobgYg5lBv
         NLhg==
X-Gm-Message-State: AJIora8vyO8+jr7TPTJV69KM9aKhnDtMt60DqfDLuu1pD0m3bGSm4Ily
	kAE2ydObzxwxOu8xr81H6CRDGeUmNLQCL9n/vZ1qXA==
X-Google-Smtp-Source: AGRyM1s4J7+PVpOZXKBLR/RL1MJ9PGiF4IXC/hzBc5uB4snB/tWt+HG0unw+G16sBk8ZRvUykWi1YgJdBM4Iqn6UzPo=
X-Received: by 2002:a7b:c7d1:0:b0:3a3:1890:3495 with SMTP id
 z17-20020a7bc7d1000000b003a318903495mr1284023wmk.18.1659063630016; Thu, 28
 Jul 2022 20:00:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220728153913.2652153-1-treapking@chromium.org> <2640c637-68c7-641d-9b15-c57bdd5adca2@linaro.org>
In-Reply-To: <2640c637-68c7-641d-9b15-c57bdd5adca2@linaro.org>
From: Pin-yen Lin <treapking@chromium.org>
Date: Fri, 29 Jul 2022 11:00:19 +0800
Message-ID: <CAEXTbpdpOE=9U2ZNPBZDqBVS3AU9-cO6G9kjBy3tuVAbGrDNQA@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: mt8173-oak: Switch to SMC watchdog
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Eizan Miyamoto <eizan@chromium.org>, Evan Benn <evanbenn@chromium.org>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_200033_802073_AC0467C1 
X-CRM114-Status: GOOD (  18.39  )
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

On Fri, Jul 29, 2022 at 1:54 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 28/07/2022 17:39, Pin-yen Lin wrote:
> > Switch to SMC watchdog because we need direct control of HW watchdog
> > registers from kernel. The corresponding firmware was uploaded in
> > https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/3405.
> >
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > ---
> >
> > Changes in v3:
> > - Remove /delete-node/ and create a new node for SMC watchdog.
> >
> > Changes in v2:
> > - Move the modifications to mt8173-elm.dtsi and add some comments.
> >
> >  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> > index e21feb85d822..fc8203297bac 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> > @@ -161,6 +161,19 @@ hdmi_connector_in: endpoint {
> >                       };
> >               };
> >       };
> > +
> > +
>
> Why?
>
> > +     smc_watchdog {
>
> No, you need to read the comment you receive one more time. So to be
> clear: "watchdog"
>
Ah I see. I'll fix this in v4.
>
>
> Best regards,
> Krzysztof

