Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AADB6C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 11:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k1MArKAOM+urebegyWsy4WNkzN1RERPKIZE7UIlq5Ls=; b=rx8ZDle+nLp0TY0xNqK6q9ECAg
	otTO+g5/Za7S8egmqrGG/74k0SylvkXXAvyYpTBgb0xEknRR7wULdNNQ1bOmJoDgue+xblIxJXZzz
	s+RrUDjB00/VD4kZaVKRCwfnJ/QrY9PVz617aVMJ2opIOq895mqILXl22mwMiCQGCkd/BI/+2Bml/
	9i4w9F57YvOqRwQG61xK5kTx4M9ajb9Vl/JdvUsuDIomVTRwshEFvYxHTxnG2i0uk740yx4p+sPCq
	TnnqPFWQc6868Y52V0QBMKXvgzClS/LDjx40hj+wJ6WB1iGfOKyHSayeXHOcRbPtwSBRp0ItEvUt+
	4Z5YKNAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68S6-00EIDW-8O; Fri, 16 Dec 2022 11:00:30 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68S3-00EI9Z-H9
	for linux-mediatek@lists.infradead.org; Fri, 16 Dec 2022 11:00:28 +0000
Received: by mail-qt1-x835.google.com with SMTP id bw27so241269qtb.3
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Dec 2022 03:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k1MArKAOM+urebegyWsy4WNkzN1RERPKIZE7UIlq5Ls=;
        b=O+egyYiNPXuY7maexntNNrb9vVTa13ZU+tuiL1zrp4rciqHdF9qEXG57HR9eN0DAtC
         17SNouJipCmzrRYIYjNQwSN7dO68erJwv7Ja0do+EusGrbevsCsvIsojMUG0FgR23gXA
         013TSs636Xg7VGoEO1IXd2W02ifGk772/OGTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k1MArKAOM+urebegyWsy4WNkzN1RERPKIZE7UIlq5Ls=;
        b=UdPP7rt8qy5SIovtvFeArlmANzj56NlImhZyeU2x1/2At9Nbo73f1nBOgFi3S5OAMM
         xETRCn2J5itRxOqdPAapJljbWulk/XQpXxUFB14FOF77nskyGJ6vUMVGUezpZH3cOylI
         zjZ1qGgQ6iFhzyvFc/hVwCJzk2PD5frSu0JM5v4SBPSPpZlh2mKCmQ2dNGxOIKDEr/y5
         kUlNCgJ3DxxfBaYetAoZb22W0+YzmyY2yKpaCkM0BopphPNy1iDT1UzqoJ4IHG5SYrP4
         TXxwtA3wpVBZRwuAdZqAHhTOlbkcH4fESZYK5/0mN7XpnYMwGtQSzqqIjpHQLTKSCE/h
         Ma0Q==
X-Gm-Message-State: ANoB5plkgnVLDPyI/CZCyjhGmoUGTl8KMsY2J6oaa6fCjWWlM1u526Cb
	t3mp+TclmozANWuPz0DfBhfJLdeRNC8yuXBIbYyC0A==
X-Google-Smtp-Source: AA0mqf4xtARx2pPM0l3bTE0DN6T5GabCjvxl7BAtHhBMi/dSJDbNIxBrO80BUq106XsPBtl75V/YCMEHVFJB2bD4f6k=
X-Received: by 2002:ac8:4a87:0:b0:3a7:f5e4:87dc with SMTP id
 l7-20020ac84a87000000b003a7f5e487dcmr5617640qtq.562.1671188422166; Fri, 16
 Dec 2022 03:00:22 -0800 (PST)
MIME-Version: 1.0
References: <20220527045353.2483042-1-hsinyi@chromium.org> <CAJMQK-jWwDm4dy-ELzJ5gzLby37Ztqn9qhGT9zqFhmowdok51g@mail.gmail.com>
 <e7f8b106-b71e-eac9-c2a0-83579382f0f4@linaro.org>
In-Reply-To: <e7f8b106-b71e-eac9-c2a0-83579382f0f4@linaro.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 16 Dec 2022 18:59:56 +0800
Message-ID: <CAJMQK-h=H9c+sEhVs27PH4CGvefjNuXcLbXCuSkiekL-C9eucA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mt8183: kukui: Split out keyboard node and
 describe detachables
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_030027_618904_84722CCE 
X-CRM114-Status: GOOD (  14.37  )
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

On Fri, Dec 16, 2022 at 6:58 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 16/12/2022 11:54, Hsin-Yi Wang wrote:
> > On Fri, May 27, 2022 at 12:54 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >>
> >> Kukui devices krane, kodana, and kakadu use detachable keyboards, which
> >> only have switches to be registered.
> >>
> >> Change the keyboard node's compatible of those boards to the newly
> >> introduced "google,cros-ec-keyb-switches", which won't include matrix
> >> properties.
> >>
> >> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> >> ---
> >
> > hi Matthias,
> >
> > Kindly ping on this patch. Thanks.
>
> It's a merge window, so for what do you ping now?
>
Okay I should ping after the merge window.

> Best regards,
> Krzysztof
>

