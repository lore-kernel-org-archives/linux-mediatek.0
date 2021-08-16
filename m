Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7874C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 23:01:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E20760E09
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 23:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7E20760E09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QhRGtQRQqKnvB/Bth11h6eIZcRO6V2RI7mKwWa0T7Hc=; b=DnNZlinz0VbKmr
	x9//5dtLta0nanb02a4ju5hdnMouAvA1OJyXlNgg2rhNdM++q2H4bwQHqAJri9Orv2Lcy4Ub38u4W
	VwFOuuK+xbq5uSgWd6K+WvyM3Gqu7xUvPMNbgd1FB2fNua45NOGd/p7EEb3TkzEJag3yniUBdIAV2
	ai7dPpfPVKlgD7AKFobnCDMZX/DuzoTXYFDXQSR1H4SAunuolTF+q/v3ZGlerniMVQOcHtVAniDg7
	OaCiDol3aAWUdfzBULcg56zb5/+CRfqzBEcqCVp0YnRjX6z5ghY1xJ8QE75SMA/BrQ6HGdsgu7j7M
	APG60eGgbjVruTTZJ27A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFlbF-000TCL-Hl; Mon, 16 Aug 2021 23:00:57 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFlay-000T8f-VK
 for linux-mediatek@lists.infradead.org; Mon, 16 Aug 2021 23:00:44 +0000
Received: by mail-lj1-x22e.google.com with SMTP id n7so29877104ljq.0
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Aug 2021 16:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qCWu86tois4HzDjhxB5sPemRVqiKsSoDbxypDi9Z5+0=;
 b=z1v7oH+A7DDJ+ZpK2dUBsqz+f3S5ioTGJlgemaOwMO/L1AfOi49FHv8vz2Gyw2Iib1
 cOikpkgggD63UmFz1/ychby9CDBTIMxUrHzJcpJr90wnfh64TPArcOReOXV6qvNB/W3j
 iX2vHy8T/MHeKjU1mY5t6zsezU78E7DcyjiUoJ4bC2dI8EiV0EH6h0LwCQM3Kp1cL+wI
 cgdJpqHJiHNMSx8jUT0YcbhCDOGCJ18DbQjQC0pTRuHO4Yx3p4k1MTUgVWeIWbGmsTZ3
 86XeyMe22JZhDxgOpJeLpCINFeRPUIDOiYjfXU/sKuhlT+/TrYCjtXzL5V7X14ElwzLS
 k2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qCWu86tois4HzDjhxB5sPemRVqiKsSoDbxypDi9Z5+0=;
 b=rUXtNUNCMd+mGONcr1lGYk7FTMlU6ekQgu2AbIDVAgD+/lrCpGcxneO6R+HEslYe9T
 dehRR2rtnx1ZO/o79nsdmP0f3a69zi3uFapLsjB0LBk3fWMxmMyhUGY3RzjVqDtCndEj
 zOUUDGNogUSPBycnKph0VdM5fPTYfr5/HfrSdMc1R9tD3s2FKv+rqwJj08qs26y1SU5G
 4MNOXX2CeFJv92y1mFUzMIFmCu0oYg9a2Z2e6H+2+mkjtYF9Twzt2z89MloO4jU/wGvq
 6o53dhaW8U/su+BbPCxf9aTakkrN8z7306YkKCeV9MqmeD7wEmz5uqNhGR3X2gryTej0
 McSQ==
X-Gm-Message-State: AOAM530US9m36Z0X5lZqveOkQftNQACOAJ4o2X0wAjwcJJ1dFbIz5YxX
 IzSjEyS0ZgCwRX4acg6QqQhi38LrxxMVNTP/KbjCkg==
X-Google-Smtp-Source: ABdhPJxKcr3tDBh889ZdkpDoJwN0ES9RscVrpyGEFVwDUZlW9BP1duIsjDpHOms2QM93AclfvKwqHgphf+CtZyBXZVA=
X-Received: by 2002:a05:651c:1507:: with SMTP id
 e7mr491801ljf.368.1629154836469; 
 Mon, 16 Aug 2021 16:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210710081722.1828-1-zhiyong.tao@mediatek.com>
 <20210710081722.1828-2-zhiyong.tao@mediatek.com>
 <CAGXv+5GXg0RuOQkh4vaRmcLpehZiXnEUXBvEaObiatAa1sXvaA@mail.gmail.com>
 <1626940470.29611.9.camel@mhfsdcap03>
 <CAGXv+5F_-W4aNt0WVSDBGLo_t8orNUq59GMKk_4xVr+hMb9Ctg@mail.gmail.com>
 <07388dac4e25e0f260725e8f80ba099d5aa80949.camel@mediatek.com>
 <CAGXv+5EagmhYYpri+nzo6WgGz8A=oiU3Vy+2AVjho=eo6Z+DLw@mail.gmail.com>
 <CACRpkdZ4k9Km3vBtdN6AnBM89c4355GtPMzCQ0_YHaTb4V5cKA@mail.gmail.com>
 <CAGXv+5HohMwU8jow5QXO5MK1tO+u=5YsfhArBWCP4Dgm1Q8igg@mail.gmail.com>
 <4fd12d5c53f6492e5fa3ba94a78b9a149f5b6ed9.camel@mediatek.com>
 <CAGXv+5GCuNK=-z9VAOjkpJdZLUSZFPfUsQ09m1FhfTsbCYLLRw@mail.gmail.com>
In-Reply-To: <CAGXv+5GCuNK=-z9VAOjkpJdZLUSZFPfUsQ09m1FhfTsbCYLLRw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Aug 2021 01:00:25 +0200
Message-ID: <CACRpkdbZKh8cqqiDRUik6Ooo33e+feGwYsLjcLRvBQnT3x5M3A@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: pinctrl: mt8195: add rsel define
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: "zhiyong.tao" <zhiyong.tao@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>,
 hui.liu@mediatek.com, 
 Eddie Huang <eddie.huang@mediatek.com>, Light Hsieh <light.hsieh@mediatek.com>,
 Biao Huang <biao.huang@mediatek.com>,
 Hongzhou Yang <hongzhou.yang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>, 
 Devicetree List <devicetree@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_160041_042024_B11F2184 
X-CRM114-Status: GOOD (  17.55  )
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

On Mon, Aug 16, 2021 at 5:38 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
> On Mon, Aug 16, 2021 at 6:48 PM zhiyong.tao <zhiyong.tao@mediatek.com> wrote:

> > > I'll take that as "use SI units whenever possible and reasonable".
> >
> > ==> so It doesn't need to change the define, is it right?
> > we will keep the common define.
>
> Actually I think it would be possible and reasonable to use SI units
> in this case, since you are the vendor and have the resistor values
> to implement the support. Having different sets of values for different
> chips is nothing out of the ordinary. We already have to account for
> different number of pins and different pin functions. That is what
> compatible strings are for.

I fully agree with Chen-Yu's analysis here.

Zhiyong can you make an attempt to use SI units (Ohms) and see
what it will look like? I think it will look better for users and it will
be less risk to make mistakes.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
