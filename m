Return-Path: <SRS0=3MyJ=C3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B60B5C43463
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 16:08:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6590D2388B
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 16:08:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G5H43EaH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="emUrEqNi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6590D2388B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j9hAPYjylCpR1S2B3GQklVAl1mVhdUKM/JqXLc8Ky2s=; b=G5H43EaHgCoIfsVADVt1v4IOK
	MdJlU6zoVVTTorDSFyHvS308pJz82aZRnygE9z0uGSmbOr3spMfacR8psrgZF+QTjG39r/yXolhsP
	SKWFurn+2IC0IYABWooe/a4ypSoIcSyexQ/73YFeZDvl9GzP5YpZJnKRx2IvBOFPh9i6u6mmi54m6
	F/XBk+wiwq5Jdg+khvl8Jd4z1yXRz7Fo4SY4OUousyfJ9cnthHN9LtksinKsbAWmpb8NByBqjS7j6
	wdDX1pBTTHQto/c/TmX8ohUIkfhWNd3MGzh3ETeknP5RuIVtQbFyetPaCO2oNKtTUQrUgjhiS0l67
	u/xz5gyXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJIvm-0007GP-0w; Fri, 18 Sep 2020 16:08:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJIvd-0007Ca-C1; Fri, 18 Sep 2020 16:08:06 +0000
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ED12A2389E;
 Fri, 18 Sep 2020 16:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600445284;
 bh=HsD1zmlNgcDp2ntiGGXDt1Iu4ADx6rxNh/Bto2esBP8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=emUrEqNiAaIypaaqR0DFyojY3bKTuLzedv4LJNpN6r92gOZux9m/t+i1gDj1JpGUw
 XdzfnJhSce31jn8yRunVP1TffGoAH3jyT3yCKqPfFryCodyr5Ku1NvsvKOnpWwHFs+
 9mXeIHyvZEiaP3nGp2V20W14pf9i4HBfMJMoBQV8=
Received: by mail-ot1-f47.google.com with SMTP id m12so5891907otr.0;
 Fri, 18 Sep 2020 09:08:03 -0700 (PDT)
X-Gm-Message-State: AOAM531Jur4Ady7/yV948tBpGCTx9st/WxxahTRABC60EldDWWGHBDtx
 IyW6KUjHUBhsGHv4dCd8tPM6SMhaqNgE4CnZfA==
X-Google-Smtp-Source: ABdhPJwgdQQ94kk1CAJVTaLgyAzK5jSLiZzPbGFE5cSpTlp+14Bb87D1OUAiLGeIZ3x+kwKNZ39GOoJ1D5VzhOMWVEw=
X-Received: by 2002:a05:6830:1008:: with SMTP id
 a8mr21705872otp.107.1600445283255; 
 Fri, 18 Sep 2020 09:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200905080920.13396-1-yong.wu@mediatek.com>
 <20200905080920.13396-2-yong.wu@mediatek.com>
 <20200914232204.GA457962@bogus> <1600148980.25043.11.camel@mhfsdcap03>
In-Reply-To: <1600148980.25043.11.camel@mhfsdcap03>
From: Rob Herring <robh@kernel.org>
Date: Fri, 18 Sep 2020 10:07:51 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKj+-_vvZfoLiJ-ox255cFaAD4SPmrk2qCusGWAs-b+XQ@mail.gmail.com>
Message-ID: <CAL_JsqKj+-_vvZfoLiJ-ox255cFaAD4SPmrk2qCusGWAs-b+XQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/23] dt-bindings: iommu: mediatek: Convert IOMMU to
 DT schema
To: Yong Wu <yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_120805_529603_C764473C 
X-CRM114-Status: GOOD (  18.22  )
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
Cc: Youlin Pei <youlin.pei@mediatek.com>, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, Chao Hao <chao.hao@mediatek.com>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Ming-Fan Chen <ming-fan.chen@mediatek.com>, Anan Sun <anan.sun@mediatek.com>,
 Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Sep 14, 2020 at 11:51 PM Yong Wu <yong.wu@mediatek.com> wrote:
>
> On Mon, 2020-09-14 at 17:22 -0600, Rob Herring wrote:
> > On Sat, Sep 05, 2020 at 04:08:58PM +0800, Yong Wu wrote:
> > > Convert MediaTek IOMMU to DT schema.
> > >
> > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > ---
>
> [...]
>
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - mediatek,mt2701-m4u #mt2701 generation one HW
> > > +      - mediatek,mt2712-m4u #mt2712 generation two HW
> > > +      - mediatek,mt6779-m4u #mt6779 generation two HW
> > > +      - mediatek,mt7623-m4u, mediatek,mt2701-m4u #mt7623 generation one HW
> >
> > This is not right.
> >
> > items:
> >   - const: mediatek,mt7623-m4u
> >   - const: mediatek,mt2701-m4u
> >
> > And that has to be under a 'oneOf' with the rest of this.
>
> Thanks for the review. Is this OK?
>
>   compatible:
>     oneOf:
>       - const: mediatek,mt2701-m4u # mt2701 generation one HW
>       - const: mediatek,mt2712-m4u # mt2712 generation two HW
>       - const: mediatek,mt6779-m4u # mt6779 generation two HW
>       - const: mediatek,mt8173-m4u # mt8173 generation two HW
>       - const: mediatek,mt8183-m4u # mt8183 generation two HW
>       - const: mediatek,mt8192-m4u # mt8192 generation two HW

It is correct, but I prefer all these to be a single enum. So 'oneOf'
would have 2 entries.

>       - description: mt7623 generation one HW
>         items:
>           - const: mediatek,mt7623-m4u
>           - const: mediatek,mt2701-m4u
>
> >
> > > +      - mediatek,mt8173-m4u #mt8173 generation two HW
> > > +      - mediatek,mt8183-m4u #mt8183 generation two HW
> > > +
> > > +  reg:
> > > +    maxItems: 1
>
> [snip]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
