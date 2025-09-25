Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4031CAC5B1
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Sep 2025 16:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+lassDmCrGUqK1j75W06mPpLprXWJRC5SDVpvwTaVY=; b=u8Y/izi2UMAODVRDBC26hxBNmt
	H/zo1KUCmo6ubFfErBtA57NxTFHaE5tT1yPAu5hKKvSln9a1l/I6fepuzrZSwg72taJAzZoKVou3k
	51odW95nTWfsATKPqM6LfFc77hwBrcHwspQ0dtqtu+MiaPvTvtsq+9HzeDameQWVZxMU2MGyeI8v7
	X2H94BVedruhRnny7qgurLeILBxTXkLpAD7lqh9EJ4mVy2a3U0v8XGBOQNxEXp0LYS7LTXPdrSSZs
	7NqVMctj0iBG5V5HgwPECCqVLbbIfIZKw942B59nsfLCzLLvqgxQjyhLQXpb8GYtvs9va2WDi2dE0
	jAfLGXBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1oUo-0000000AyLr-2Iq5;
	Thu, 25 Sep 2025 16:07:02 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1oUm-0000000AyJG-00xH
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Sep 2025 16:07:01 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3f42b54d1b9so1396846f8f.0
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Sep 2025 09:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758816418; x=1759421218; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v+lassDmCrGUqK1j75W06mPpLprXWJRC5SDVpvwTaVY=;
        b=Jo8u2IxHJxP/SFbH1nKYTeDSgYECDmv9AiansSjNyIrPsHbL1FlMT4UbbArip5Z3jC
         XCKg9YAEOu4uKKQW1Rs2mACsCcWrFcLRQlCsTrIieavr5AbzkMf/T+9CyllOn61EWbGA
         hmCeE9J6JKqQj43t3dc5I59DkTfGaqWsBFNGY/Bzz9AEV82dMddl4ANxSMj3q/JQISZe
         9aDj80j2QeCfquPlTkaPDCfsasH6XtQq32LeEXBmeK/CLDMfTnLY9HewpaIx9mtGJU4x
         lixMrQ2KXjIZEOW0dpBj7UMtn1iDRAufPl2nQ8q+HnydugITa+0zEj89eDas8yg2aq8d
         X06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758816418; x=1759421218;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+lassDmCrGUqK1j75W06mPpLprXWJRC5SDVpvwTaVY=;
        b=t/CndKHrZ5G/j+oC13k7WVo9zNUJAx9G2qREpZQwUcp+XIZ314BIwenWcmUE1TIhiu
         6jfwneAFcHQpVQNqwqbztFr5zk9/Pd3+JbM20yhLTkZHX0H5QmHQbvYV82frzlRB3exn
         VqQjNpxxilZQWFZkzQjyfwowBpGWb3v9g1WNXHitwsRDVbNk7LUiRkb7S1qWTY9Tv/eP
         kY6kX+cNoTNDNA204gR3CgNDKNgc9GJspS/08kU3t8XyCITAqnvn7Uhg6e5mwWZg/YER
         J67QS+ar4A+yc7/3joctUWADJl3G9lLWKz/y+yeWTt+mLMe+OUQNMI8Hg2NnDQLzkJ5g
         1vNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSuunCIkt9bedhNgNDQNo/br6TaQEyt90ETMDPclxmubVgrM3oWz09m7ShAWiQwo7oIKoEgWuLr8n47po95w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4jkeeIFkOM1A981BB63aLqT/RP60i/R+N3BEJn6GFOsYiv/b/
	I/HQyjXiLnFhocTtjjJT7fUzP4PwSLeZ7Yoc2VauHmPrb9GX5ApOSjt/
X-Gm-Gg: ASbGncuuyUGxyoV8FG7leKSElLx074w+x+iY8rudR03riMYm6QSI072JT0sn0gwPVxn
	W7qIpiq0sL5BnOldPSri3BSVChzf9pkJL022pMVCTdoXiu3ghxQAvyAd92nbl2YqrzbhzxsiKVW
	TqFIR1iKh8rHMNTHytg0KdA9heaem9gDpBvB2lzuXV2Xganceoj6fbWci1TbZcQfRDWmksTMl96
	yars4bVNa6r/3hLnVQaFVtDXNFGQdgoBkzGyiMHE+63Gp4eMzGoIvPXRyW7y9GhEyZQKUtCAZb1
	x7wmPPJed/Z7kG/tyo/xmoRKafhbvb/OMyQR/IkBPF+bk/Fgpz5N8UxTKfwRFiGOB55z2d4aanb
	OEVESyBALvo6UE7uVkr3oplDMhMJJ8tsw7Ot9zBAAJZEnxua+00Ei5X1Vi5qSYQ9TvL55pOZxlY
	Sr2l0g
X-Google-Smtp-Source: AGHT+IEHMIJU9u8ueZDndaal17u8mfKe0TgyHQU77XQdzJ/EbxOIGOMX4Q6Ld8eqXuhgbWlq5qhIfQ==
X-Received: by 2002:a05:6000:2486:b0:3d4:f5c2:d805 with SMTP id ffacd0b85a97d-40e4458c89bmr4101481f8f.16.1758816417869;
        Thu, 25 Sep 2025 09:06:57 -0700 (PDT)
Received: from Ansuel-XPS. (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e32c49541sm20807025e9.5.2025.09.25.09.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 09:06:56 -0700 (PDT)
Message-ID: <68d568a0.050a0220.19f5c.8cb6@mx.google.com>
X-Google-Original-Message-ID: <aNVonSpnm70dLOUL@Ansuel-XPS.>
Date: Thu, 25 Sep 2025 18:06:53 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: mediatek: Fix wrong
 compatible list for hifsys YAML
References: <20250923201244.952-1-ansuelsmth@gmail.com>
 <20250923201244.952-2-ansuelsmth@gmail.com>
 <20250924140347.GA1556090-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924140347.GA1556090-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_090700_056634_9325D05C 
X-CRM114-Status: GOOD (  21.65  )
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

On Wed, Sep 24, 2025 at 09:03:47AM -0500, Rob Herring wrote:
> On Tue, Sep 23, 2025 at 10:12:29PM +0200, Christian Marangi wrote:
> > While converting the hifsys to YAML schema, the "syscon" compatible was
> > dropped for the mt7623 and the mt2701 compatible.
> 
> Is "syscon" really needed? AFAICT, the clock and reset drivers don't 
> need it.
>

Ok I also searched downstream and can't find any patch that would make
use of syscon. Guess I will replace this patch with a patch that drop
the syscon from the dts.

> > 
> > Add back the compatible to mute DTBs warning on "make dtbs_check" and
> > reflect real state of the .dtsi.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  .../devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml
> > index 9e7c725093aa..aa3345ea8283 100644
> > --- a/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml
> > +++ b/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml
> > @@ -16,13 +16,15 @@ maintainers:
> >  properties:
> >    compatible:
> >      oneOf:
> > -      - enum:
> > -          - mediatek,mt2701-hifsys
> > -          - mediatek,mt7622-hifsys
> > +      - items:
> > +          - const: mediatek,mt2701-hifsys
> > +          - const: syscon
> > +      - const: mediatek,mt7622-hifsys
> >        - items:
> >            - enum:
> >                - mediatek,mt7623-hifsys
> >            - const: mediatek,mt2701-hifsys
> > +          - const: syscon
> >  
> >    reg:
> >      maxItems: 1
> > -- 
> > 2.51.0
> > 

-- 
	Ansuel

