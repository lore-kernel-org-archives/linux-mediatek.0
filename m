Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA73E743C2
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Sep 2023 20:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OKWBpbr9GZGcrn8erUcxpFzrOnNMl5L0aU62GWwEm5Y=; b=X6Rwy0PLcH+oM34u9SrFrqt2Tw
	Fw+3GmQKv2cyIR1YmKVQ9bV17kcQKh3e6e1cuu+SmYwcDvYT3NrU8GguW0Up4MYm71T+KouUaSl+H
	gI3Z/9uZQ87MLWiH59BIrVodhqIAoRNHJTkN6mJYVtlHjiLqUDbZXVJ1mD/pklQKdto9iXR4zWzKz
	3sHIQAu71bLljT2bqrErY9r6A1sSLzK6x2JVFJpBMoKm54uckKN2BAm+fCqGp9glsgDLftggnpQGJ
	ahm5L8maA2utF+XTOc9yLIqN2YyZfwHfH17UOXc+eJisEfONv8CcsnPaOJcTGUH1oJ6KyfZIOoZWT
	/sVoxw3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlxzG-006fM5-1w;
	Thu, 28 Sep 2023 20:51:54 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlxzC-006fKn-1f;
	Thu, 28 Sep 2023 20:51:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 81B2AB81CE9;
	Thu, 28 Sep 2023 20:51:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D871EC433C7;
	Thu, 28 Sep 2023 20:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695934304;
	bh=+cexd9xmPLNbQCGnjBv9HJvEF+QQ1Nd1d5VSzHVzH18=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Z7rkIB/j1YmxCr4z/ZrRRRXsfgF1Ljmv/fl89nQ4T/Pf/XzfebDzT42ZzyfpzL/ps
	 nonsKXA0xuRMOv4cZGf91IIh8TQwovDKADAY3jWaqxCNJXONw1T3XQj6BymlUcAgK8
	 KystxnT4N60CinN/nqMjLiBJT38YRBE0ulxedxbdC/sl1fR/F5VERWaj9qZrnb3VjL
	 4j/pwg+3ngZyQW+Y2t/lrHCx3Y7knUg/KtnoKgS7aZshJSGNn9rfh5p/OsZnAJGae9
	 FY4NoMkZZQUxOYmFxXdYTOR7i4BUBHBl2APHHL7G3ZbkolcB3anBTfMp7sxPlwS/iF
	 L2dr+nqaokFYQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-504b84d59cbso3212369e87.3;
        Thu, 28 Sep 2023 13:51:43 -0700 (PDT)
X-Gm-Message-State: AOJu0YxRioorot0Az1CBGkRS+TG1AubRn5fLJ/hnV19TtB6H6kxBMXKn
	BRbT24xdDmYz5IgFP/Nlw/K+Ibe9q2YrSoq7TA==
X-Google-Smtp-Source: AGHT+IHQjuWrzI/HJv/GQJ62u9AtMtab4xl4POez9pkIVKXQVDmkWjOO+IdPZzcbrwWIwZANLwwNhMl4ZrVYdeEIVfk=
X-Received: by 2002:a05:6512:ba7:b0:4fe:db6:cb41 with SMTP id
 b39-20020a0565120ba700b004fe0db6cb41mr2673606lfv.39.1695934302090; Thu, 28
 Sep 2023 13:51:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230926164513.101958-1-robh@kernel.org> <ZRXUhSqHPt9R5Zd8@p14s>
In-Reply-To: <ZRXUhSqHPt9R5Zd8@p14s>
From: Rob Herring <robh@kernel.org>
Date: Thu, 28 Sep 2023 15:51:29 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ=rR07tQ8PgdcVRTFkbx=y5Qh1ok0JY+WPeBi7hF7E1Q@mail.gmail.com>
Message-ID: <CAL_JsqJ=rR07tQ8PgdcVRTFkbx=y5Qh1ok0JY+WPeBi7hF7E1Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: remoteproc: mtk,scp: Add missing
 additionalProperties on child node schemas
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Tinghan Shen <tinghan.shen@mediatek.com>, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_135150_705193_104E4431 
X-CRM114-Status: GOOD (  18.79  )
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

On Thu, Sep 28, 2023 at 2:31=E2=80=AFPM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> Hi Rob,
>
> On Tue, Sep 26, 2023 at 11:45:08AM -0500, Rob Herring wrote:
> > Just as unevaluatedProperties or additionalProperties are required at
> > the top level of schemas, they should (and will) also be required for
> > child node schemas. That ensures only documented properties are
> > present for any node.
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml =
b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> > index 895415772d1d..24422fd56e83 100644
> > --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> > +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> > @@ -91,6 +91,7 @@ allOf:
> >
> >  additionalProperties:
> >    type: object
> > +  additionalProperties: false
>
> Things have changed in the remoteproc tree [1] and this patch doesn't app=
ly.
> Please see if it is still needed.

It is not needed any more.

Thanks,
Rob

