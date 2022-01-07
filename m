Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E10C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jan 2022 06:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=prJoIVBVguWp+iSSS4ViDZdBuKpbqUJvyIjqffyZCqo=; b=QB53OUc4e2jlgV
	DUj6gZl6RxdNDEy1NByuYmamp71AzsWbDWHusLut/E6sY+SK2ELgYWz+TkNduoyOOqxTPriWRfpJf
	H2z/5r0E8LTPD35ftPrw/LYUDEz1Hl8ml3cs60INxtcYq+u2+kKGeaN2MTAHMWzIX8hNC04OH2hKO
	H6YyrvRzm9UVZtTG1VK/uiaEjR6afy85eG9x/St4o+cuXRRAZ/4liM4NjiqDOWABsu3M3cJ5OP0D6
	spkWlVsrmMGaCzfcOYyilBRshnIohv5ChtdElvs492KWzOnwRVhxYVsHMUiOtsWRqUPi+vs4jTcLm
	VykNdmkM2/q4hkvLiV3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5ibU-002ajt-Bj; Fri, 07 Jan 2022 06:19:56 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5ibR-002aj6-Q9
 for linux-mediatek@lists.infradead.org; Fri, 07 Jan 2022 06:19:55 +0000
Received: by mail-lf1-x134.google.com with SMTP id h2so11975052lfv.9
 for <linux-mediatek@lists.infradead.org>; Thu, 06 Jan 2022 22:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SmvnTwzlfoB582WhUoZ52uGUh4CYeJAXG7/ftItPFHk=;
 b=dlxgFGDLLwVGl/qH0bSPf2M7NiAjMT/V+HDr+e0lPtrgQPPZeb3tLBDfebm7HnGDxf
 uNu7Ahwy/mSRernbm/DsVrk2v+HxLH40oy4qYOU4sHFXEosPTVh2oMg1I1nZoyepVn0l
 uJO5OO8V1gYyo0Oc/6vg3ANkg7xbR0WZXTpXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SmvnTwzlfoB582WhUoZ52uGUh4CYeJAXG7/ftItPFHk=;
 b=Yl7SGcOhcU0mzEnkLX+s9AZG0Mbs2dSyBBHwvPlVOxt/CeKaXSau5PE8dNlS/xXYLT
 hKa+8Tn0xDWnNX3Vcl0jTuZUfUGA5Ly7YzHLrDPF3t78CgvgMaeXZyZrGHl2d5odpi0P
 NOTkank+jfxZMENMLOQvrJq837BdEnJxH8dZX6xCRtRQMCyvfnGNwhcqG3+sINbbIwjb
 C3adxGdXzNLxabOpKVtz91ePzZBIGspxXURENrE9H6/+4xManinBb9vjS0JKAhb8tdeS
 x/KViLbPyDzuVZdwAvj7OTBHO3vNdGwAQO5BeFkRFFWtKPaL44keHLts878jRqL11CBh
 5Pyw==
X-Gm-Message-State: AOAM530qW8JODj444eQXGYm4QBtYtQ4F7haYKMMkceTsXC7Saucx4CcU
 y4ylRK0IAxkeHXfyhlu18a55vveV330SPn/oLB+oNA==
X-Google-Smtp-Source: ABdhPJzIKh2xp+2CLreJdGK34F+DnUkYpGcKwNfCwUwQutIsw+wpEf0J5q4pU2xOrcpZNnZddD+BrBZQyqtJFjgz570=
X-Received: by 2002:a05:6512:2027:: with SMTP id
 s7mr53435381lfs.678.1641536391822; 
 Thu, 06 Jan 2022 22:19:51 -0800 (PST)
MIME-Version: 1.0
References: <20211220121825.6446-1-tinghan.shen@mediatek.com>
 <20211220121825.6446-5-tinghan.shen@mediatek.com>
 <CAGXv+5GaFikojqYYv0TfQsz3NSqn7QPmTWyCJY8V2g8UYoV4OA@mail.gmail.com>
In-Reply-To: <CAGXv+5GaFikojqYYv0TfQsz3NSqn7QPmTWyCJY8V2g8UYoV4OA@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 7 Jan 2022 14:19:40 +0800
Message-ID: <CAGXv+5FcDAu4yKS6MRjfnsJc0CgoREXAvS1d+UWcPQ24NmCY-Q@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] arm64: dts: Add mediatek SoC mt8195 and evaluation
 board
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: robh+dt@kernel.org, linus.walleij@linaro.org, matthias.bgg@gmail.com, 
 broonie@kernel.org, bgolaszewski@baylibre.com, sean.wang@mediatek.com, 
 bayi.cheng@mediatek.com, gch981213@gmail.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-spi@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Seiya Wang <seiya.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_221953_907401_1FD1C8BB 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
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

On Thu, Dec 23, 2021 at 5:59 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
> On Mon, Dec 20, 2021 at 8:20 PM Tinghan Shen <tinghan.shen@mediatek.com> wrote:

> > +                       infracfg_rst: reset-controller {
> > +                               compatible = "ti,syscon-reset";
> > +                               #reset-cells = <1>;
> > +                               ti,reset-bits = <
> > +                                       0x140 18 0x144 18 0 0 (ASSERT_SET | DEASSERT_SET | STATUS_NONE)
> > +                                       0x120 0 0x124 0 0 0     (ASSERT_SET | DEASSERT_SET | STATUS_NONE)
> > +                                       0x730 10 0x734 10 0 0     (ASSERT_SET | DEASSERT_SET | STATUS_NONE)
> > +                                       0x150 5 0x154 5 0 0     (ASSERT_SET | DEASSERT_SET | STATUS_NONE)
>
> This should be 7 cells per entry:
>
>     ti,reset-bits =
>         <0x140 18 0x144 18 0 0 (ASSERT_SET | DEASSERT_SET | STATUS_NONE>,
>         <0x120 0 0x124 0 0 0 (ASSERT_SET | DEASSERT_SET | STATUS_NONE)>,
>         <...>,
>         <...>;

Please ignore this comment. It looks like I misread the binding, and your
version is correct. However please format the columns so they align.

ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
