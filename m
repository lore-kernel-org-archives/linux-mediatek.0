Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B23C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 10:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=11mnd8IfDBu6K4rdPwapHXMXYdSBjIEsZ6UElR0JRgU=; b=od/wffQAqcCM8L
	v0BGKRZPYfYF95tTvZgmTR6Frh6mhjJpvHrtRjXJMm9q80TjhK6g8EuxUV8z6CSEcB0CV+/u6Zw7O
	pGjA9tmY1JjCrl2IK8RBXsREQi1r/0xTpUkcNO1/zg7yg7VIE4iRfmBZX/iTDKVlPKLAQoIHoHz5L
	rSYSzOggIhwWkBAmr2aFgnmtviDjv9rbtBfkr3Oba57w0NsE3pH9mcJQBiSmu5IMd+zwvCfb+bNC2
	5zGa/xjR9cUVGo5gQUC6v6wtcK8XPIvDIyfYmKmXmSvlIAuoqHhpW4W487+0XEZQ1aKJu4yyBdAla
	qXZ+Ings7LjuGysswcAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nojtF-006Qrm-SG; Wed, 11 May 2022 10:48:21 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nojtD-006Qr6-He
 for linux-mediatek@lists.infradead.org; Wed, 11 May 2022 10:48:21 +0000
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2f7c57ee6feso16120147b3.2
 for <linux-mediatek@lists.infradead.org>; Wed, 11 May 2022 03:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=drfygkTowvuBLUYKKqSn7wnL9G7tj7fcltIt86mentk=;
 b=U0Z5PRzaDD8HlY7u+vcRl3tjjLWmlEi4zx9guX+v+HnsRNi1BsPtGOFeWg7v/H8I/n
 v8vG/2LxavvFpGWW5BtLREFEtxUtULs9eeO/YBB3EKYbe7VGIk6aT6klVarI5nC8mODC
 7nHyamuW4M6cY0v2L3Jr6ofjaRUER+LJwoBuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=drfygkTowvuBLUYKKqSn7wnL9G7tj7fcltIt86mentk=;
 b=l48WTFEo3i8Mn5FIjdEDMVwEEJEhww7+Yq4SczLnye0fDo1syirYwOBMh5vVmY9t00
 NCUt50AFI975ObyD9UGl77tat8653mQbuHfisTWBukrCDFRuu0Frmvwjk/cphUITh6LF
 qbH0XQ9Vy/7XgZtCBE1FP6h8Cw6NyWvJRTnS72yI3J2tNoifC0BYmxyiT0baalwN+w7h
 rU+cmnS4yWtz5SThfa/5KDEv8uaz1J10T+z0jddyF72h4mehVKTIs9o6Zg0WuKHrMkVx
 w1HQUOjcH0LkaAlgEfZl+Z9K6WTEIVRx0zrZgtLSimXVUzFguJVpoPggFwyjl/eyRS4O
 QLxg==
X-Gm-Message-State: AOAM5338RrV/WyIRKIKXAThbkDxp5ktgCGffZplA27FXRcKNVmcTfFTW
 pdLqo8+mLLV/TdVJyYSb31A0XIoKhKTPga83s9rZgQ==
X-Google-Smtp-Source: ABdhPJxGVBQnozICEIYWYYUmj2XDVy7Iv/cHfh2VaMsWkzahJc7RVRiArSA2H274bdeXvoIWUvYywB06XduA/JHWTxw=
X-Received: by 2002:a81:23cc:0:b0:2f8:1a60:a215 with SMTP id
 j195-20020a8123cc000000b002f81a60a215mr24030993ywj.295.1652266097218; Wed, 11
 May 2022 03:48:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220425125546.4129-1-johnson.wang@mediatek.com>
 <20220425125546.4129-2-johnson.wang@mediatek.com>
 <CAGXv+5HgyN+kp86M2GgFtbruXSAMSLxsh9vf8zVE5TxRMyTyaA@mail.gmail.com>
 <a8e5fd9de1feece9051e1624c5cf3b672131a122.camel@mediatek.com>
In-Reply-To: <a8e5fd9de1feece9051e1624c5cf3b672131a122.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 11 May 2022 18:48:06 +0800
Message-ID: <CAGXv+5G6Qv1JcsZNrw5=USJSzPkczW42FgXRYqAK=xS-moO6nw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: interconnect: Add MediaTek CCI
 dt-bindings
To: Johnson Wang <johnson.wang@mediatek.com>
Cc: krzk+dt@kernel.org, cw00.choi@samsung.com, robh+dt@kernel.org, 
 kyungmin.park@samsung.com, khilman@kernel.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 jia-wei.chang@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_034819_625239_5EBA2A83 
X-CRM114-Status: GOOD (  34.41  )
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

On Mon, May 9, 2022 at 8:14 PM Johnson Wang <johnson.wang@mediatek.com> wrote:
>
> Hi Chen-Yu,
>
> On Tue, 2022-04-26 at 11:18 +0800, Chen-Yu Tsai wrote:
> > On Mon, Apr 25, 2022 at 8:56 PM Johnson Wang <
> > johnson.wang@mediatek.com> wrote:
> > >
> > > Add devicetree binding of MediaTek CCI on MT8183 and MT8186.
> > >
> > > Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> > > Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > > ---
> > >  .../bindings/interconnect/mediatek,cci.yaml   | 139
> > > ++++++++++++++++++
> > >  1 file changed, 139 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
> > > b/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
> > > new file mode 100644
> > > index 000000000000..e5221e17d11b
> > > --- /dev/null
> > > +++
> > > b/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
> > > @@ -0,0 +1,139 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id:
> > > https://urldefense.com/v3/__http://devicetree.org/schemas/interconnect/mediatek,cci.yaml*__;Iw!!CTRNKA9wMg0ARbw!zuufEcqpKbditY3eqLTHpL8P8humMCyh4D4QWsximmw124tJUPE3ZBUyBqBtDlQ9pSDO$
> > >
> > > +$schema:
> > > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!zuufEcqpKbditY3eqLTHpL8P8humMCyh4D4QWsximmw124tJUPE3ZBUyBqBtDoE9YHyu$
> > >
> > > +
> > > +title: MediaTek Cache Coherent Interconnect (CCI) frequency and
> > > voltage scaling
> > > +
> > > +maintainers:
> > > +  - Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > > +
> > > +description: |
> > > +  MediaTek Cache Coherent Interconnect (CCI) is a hardware engine
> > > used by
> > > +  MT8183 and MT8186 SoCs to scale the frequency and adjust the
> > > voltage in
> > > +  hardware. It can also optimize the voltage to reduce the power
> > > consumption.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - mediatek,mt8183-cci
> > > +      - mediatek,mt8186-cci
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description:
> > > +          The multiplexer for clock input of CPU cluster.
> >
> > of the bus, not CPU cluster.
>
> Thanks for your suggestion.
> I will correct it in the next version.
>
> >
> > > +      - description:
> > > +          A parent of "cpu" clock which is used as an intermediate
> > > clock source
> > > +          when the original CPU is under transition and not stable
> > > yet.
> >
> > This really should be handled in the clk controller, and not by every
> > device
> > that happens to take a clock from a mux with upstream PLLs that can
> > change
> > in clock rate. The end device hardware only takes one clock input.
> > That's it.
> >
>
> To make this intermediate clock works properly, this driver is also
> responsible for handling the Vproc voltage and ensures the voltage is
> high enough to support intermediate clock rate.
>
> If we move intermediate clock rate control to clock driver, then
> intermediate voltage control may be handled by the clock driver itself
> as well.
>
> We believe that is not reasonable because clock driver shouldn't handle
> voltage control. On the other hand, DVFS driver is more suitable for
> doing this job.

Either way the DVFS driver handles the voltage change.

Right now the driver is doing:

1. Raise voltage if scaling up
2. Mux CCI clock over to stable clock
3. Set rate for CCI PLL
4. Mux CCI clock back to CCI PLL
5. Drop voltage if scaling down

I'm saying that the clock driver should handle 2+4 transparently when any
driver requests a rate change on the CCI clock. So instead the driver would
do:

1. Raise voltage if scaling up
2. Set rate for CCI _clock_
   Here the clock driver would do:
   a. Mux CCI clock over to stable clock
   b. Change clock rate for original parent, i.e. the CCI PLL
   c. Mux CCI clock back to original parent, i.e. the CCI PLL
   and back to the devfreq driver ...
3. Drop voltage if scaling down

Does that make sense?


Regards
ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
