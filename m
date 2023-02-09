Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB419C636D4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 18:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z6XnIAiAClL5oAiPclHzd+Qs8gc/SNlQ6u+IiIFu1NM=; b=DyMB/zRt2jniJc6hbv/ILiWg4a
	xvkC1sQLOUQ8LKLhkoaiAsU7Iqte/fvn410ihYw9z3vnj74O5xX1/QXIiJmIUvL9kqM7MZeGhHVkE
	AV02FmWVZQzxpHceNtAJN10L6l2yneWauIxeVVjPKemgfqJNWbG/0BijLt8UVyoSwNLzcaTypVoYd
	uUDknSUamdZBvnSyCFGRa/bGngxV7hcyy9WfEHVepCRpcCH2HPFKr9qm0xKTZwxxQtyZXhYHr7MjN
	me2kSPYgiqm1nUhapzyYubjF8JsYj573Q1P+cE2ikQMyDQFZk7/qkK14AcZ5/NByygMRf8/jMNIcB
	bX6Q6u3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQBQ6-002kpt-M3; Thu, 09 Feb 2023 18:13:18 +0000
Received: from mail-oa1-f53.google.com ([209.85.160.53])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQBOi-002k5V-64; Thu, 09 Feb 2023 18:11:53 +0000
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-16aa71c1600so3586085fac.11;
        Thu, 09 Feb 2023 10:11:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z6XnIAiAClL5oAiPclHzd+Qs8gc/SNlQ6u+IiIFu1NM=;
        b=aDqJjUHBflw/0z9fDpYviQPi0WKekVJ3KdJ2hPYSG/HR7o8rDRorWqpvkkq+o1UEAS
         ownk1D8YTXukoFEUYFNokAxiSinTla1ZpXNnfMpv0uqu15931GAy7jIcZJ4NdFN5Eus/
         toudZh58VqwnTsevbBlYLrLAgvciQGby0+x/Lj70ohcCQSLfBg/Umvg96twRKkHgqMjE
         MrJtYWAhOlI/KPJ3NN7jl0+nIYY0T5s0xGvT/uTJbduGSfVjLV1yH/PxowHpypmCwrky
         KOtruhaUIDIDwf+0ecXe4Nfen75JFT/rxfU/fN/cH/ZgpJYFL+QWNa5Jy7Prv77flgEG
         Gq0Q==
X-Gm-Message-State: AO0yUKUvfpzo+H6vanQroyCwzNa8vpOBKu/hmYUtf1zU5FaERON3Hv1z
	NV+IExvkc+iok9Iw7TZiOZ6E9I3XIA==
X-Google-Smtp-Source: AK7set8RezWLgO8rJBbJEYH7HXlrkAborpT0Rbl7VhLs+8Jkmk2Zcuf8wsK3c7crwWe+tqDB/W2o0A==
X-Received: by 2002:a05:6870:e0cf:b0:163:3b10:d366 with SMTP id a15-20020a056870e0cf00b001633b10d366mr6740835oab.47.1675966309737;
        Thu, 09 Feb 2023 10:11:49 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v35-20020a056870956300b0016a9f1616b0sm998708oal.5.2023.02.09.10.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 10:11:49 -0800 (PST)
Received: (nullmailer pid 584278 invoked by uid 1000);
	Thu, 09 Feb 2023 18:11:48 -0000
Date: Thu, 9 Feb 2023 12:11:48 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, airlied@gmail.com, tomeu.vizoso@collabora.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, steven.price@arm.com, linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/9] dt-bindings: gpu: mali-bifrost: Don't allow
 sram-supply by default
Message-ID: <20230209181148.GA575482-robh@kernel.org>
References: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
 <20230208103709.116896-2-angelogioacchino.delregno@collabora.com>
 <CAGXv+5Gm=Onu2RK+skLgN4Kzo9yP1n5Zb48oQNkQ019838QeEQ@mail.gmail.com>
 <0faf89cb-4709-17c9-0d67-da7ef2ddb7e6@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0faf89cb-4709-17c9-0d67-da7ef2ddb7e6@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_101152_255880_4A42428C 
X-CRM114-Status: GOOD (  27.47  )
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

On Thu, Feb 09, 2023 at 10:15:33AM +0100, AngeloGioacchino Del Regno wrote:
> Il 09/02/23 03:50, Chen-Yu Tsai ha scritto:
> > On Wed, Feb 8, 2023 at 6:37 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> > > 
> > > The sram-supply is MediaTek-specific, it is and will ever be used
> > > only for the mediatek,mt8183-mali compatible due to the addition of
> > > the mediatek-regulator-coupler driver: change the binding to add
> > > this supply when mediatek,mt8183-mali is present as a compatible
> > > instead of disabling it when not present.
> > > 
> > > This is done in preparation for adding new bindings for other
> > > MediaTek SoCs, such as MT8192 and others.
> > > 
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > ---
> > >   Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 4 +---
> > >   1 file changed, 1 insertion(+), 3 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > > index 78964c140b46..69212f3b1328 100644
> > > --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > > +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > > @@ -57,8 +57,6 @@ properties:
> > > 
> > >     mali-supply: true
> > > 
> > > -  sram-supply: true
> > > -
> > 
> > Have you tried actually validating the device trees against this?
> > Based on my previous tests this gives out errors.
> 
> I did... and I didn't get any complaint... but perhaps something went wrong
> on my side?
> 
> I mean, I can retry just to be sure.

You should need unevaluatedProperties instead of additionalProperties 
for this to work. The latter cannot 'see' into an if/then schema.

But really we want the default top level to allow this and then disallow 
it in an if/then schema.

Rob

