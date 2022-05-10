Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B6B3C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 04:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XLcAo3XOwcSIzG7y9Z3mnB7rZaMKhY6oq2Fr/y1uatY=; b=eR9rx+b+1YnWVw
	f5wcff5wicI405wqpzpfEw+l1zZE/Cih+W0TP0GDh59Bm3paP0YE0r1JMchS0ugtJayat2bLWuBCC
	ktCVZoka2w+G2rtzSv+7LVnwHHbCg7mGtuExF61PcAYE7oe/4gtmo1Bb2xtsS8m/kn1MJDTwSxrhl
	rp9XNNZ5oAiWfc3r2/huUikWOyYNbJdRyJwykez43uM+sf1cZZK7462oI/AWlBZeKWBSNLaCFf3z/
	BOkvZxGYdqy4zgbzX3J1z+9QiMrs8zYIoM6D82h6OzHhluOuyNVQyEFL3aho2jvfhEoWjfX4ViU1S
	48THjy0vStRFVk1wfjWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noHTT-00HTz7-Vm; Tue, 10 May 2022 04:27:52 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noHTH-00HTqx-Pd; Tue, 10 May 2022 04:27:41 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id h13so11920450qvh.0;
 Mon, 09 May 2022 21:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=vMpaHuuuOG4MGEWXiRfaUjNNiANU4+C8012F//qkXo8=;
 b=VC4yVVFd/at+KN9tejUb+tTTTy3SktsyRsPMmN1Xbj4dRCy1d0ArQwTL4vrl6r4qwt
 CVogS8g3yw3RYsC2GXSpWF4m27QOcRMgcTv73Y0G2UpLUCvdo7i6Dg3KiZsWD1TcSGR3
 BicwMdlaVxi2OMw+EzdJg/5A+gYjQEWwut5p+K0SpMG3UOADxORAJBJXTLxgI+iO5Sgi
 eZjTgLxzmEKb5yOH3G5IYGMGcw+mSdtlzslM2jxAYrvyH0WTMgy3KmDGqGnf2/MmV29U
 7QnqYWAl9Crd7HZSw6ukvHvCjoYfLzqJXFAHGZqIlp1fE8KuroZyYlPQ1JwKaua3+oD7
 yHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=vMpaHuuuOG4MGEWXiRfaUjNNiANU4+C8012F//qkXo8=;
 b=CnyMj9PWvuBboctgSl8FWzgiyGW+kUDPto2idL0X6VGwqUSGxKwrLaX93ZBaUpgvyj
 1esqJHt7uLKcN1hWhZdqJyKBSkMIqvat1TIHR5g79y4pqVuvi2Rg5FIdhQQdq6f8LQVE
 PvRqO3nGj07Kj130KD8m+Aw/8W5cwPFCHbhz3XZFSB5em9vjU28fGE5SXC94NtSVWbd8
 Jw+iF/LId4NKPZKUbCL0He2/x5bQkRKlKJs8j5TksCiMczjVo85BR8djPeK0QifKuhZl
 PufD8JXQ516hSeL2AQQ8U9U9Lge5xcSn2vEFoyNB0j8r+O9lM6Bf1xKNmMIsp4K93tiy
 4kgA==
X-Gm-Message-State: AOAM530fqWZNPZXRkXW6/u8XGu9L+JGpdOqkmSWbPjlGi0SqGmkeASfr
 js6mJl5IkxkszyGb/iltenWoifodahAzlEDwAW8=
X-Google-Smtp-Source: ABdhPJwO7MdX2N+BxIvvqfhmxboqfMxlBiZaJL3wP1cEl/CpufKLHoQMnnY4JeZx47aYXO2bdL5yKMHOwUpp65u4jnw=
X-Received: by 2002:a05:6214:3017:b0:45a:6c33:2ae9 with SMTP id
 ke23-20020a056214301700b0045a6c332ae9mr16619988qvb.108.1652156856955; Mon, 09
 May 2022 21:27:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220425125546.4129-1-johnson.wang@mediatek.com>
 <20220425125546.4129-2-johnson.wang@mediatek.com>
 <94efefab-918d-2367-4b74-076dd6f23936@gmail.com>
 <e8124721a4ecd591ffea2c4d70853c1f89c83975.camel@mediatek.com>
In-Reply-To: <e8124721a4ecd591ffea2c4d70853c1f89c83975.camel@mediatek.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
Date: Tue, 10 May 2022 13:27:00 +0900
Message-ID: <CAGTfZH1dipThTeaZiD1JucYYQB+M19wVrhRy0aCC+7TydNFXjQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: interconnect: Add MediaTek CCI
 dt-bindings
To: Johnson Wang <johnson.wang@mediatek.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, krzk+dt@kernel.org, 
 Rob Herring <robh+dt@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, 
 Kevin Hilman <khilman@kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek@lists.infradead.org, 
 jia-wei.chang@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_212739_877982_4A78DACE 
X-CRM114-Status: GOOD (  37.19  )
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
Reply-To: cwchoi00@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, May 10, 2022 at 11:59 AM Johnson Wang <johnson.wang@mediatek.com> wrote:
>
> Hi Chanwoo,
>
> On Mon, 2022-05-09 at 21:09 +0900, Chanwoo Choi wrote:
> > Hi,
> >
> > On 22. 4. 25. 21:55, Johnson Wang wrote:
> > > Add devicetree binding of MediaTek CCI on MT8183 and MT8186.
> > >
> > > Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> > > Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > > ---
> > >   .../bindings/interconnect/mediatek,cci.yaml   | 139
> > > ++++++++++++++++++
> > >   1 file changed, 139 insertions(+)
> > >   create mode 100644
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
> > > https://urldefense.com/v3/__http://devicetree.org/schemas/interconnect/mediatek,cci.yaml*__;Iw!!CTRNKA9wMg0ARbw!z6ogArqzuIzPR3TYO1aW-Z-scpuZJxIriWMofdfnvrKTXAYBBLZeitAPIKyZayMYZGsR$
> > >
> > > +$schema:
> > > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!z6ogArqzuIzPR3TYO1aW-Z-scpuZJxIriWMofdfnvrKTXAYBBLZeitAPIKyZa9f2pALd$
> > >
> > > +
> > > +title: MediaTek Cache Coherent Interconnect (CCI) frequency and
> > > voltage scaling
> > > +
> > > +maintainers:
> > > +  - Jia-Wei Chang <jia-wei.chang@mediatek.com>
> >
> > Why did you add your author information?
> > Please add your author information.
>
> Sorry, I don't really understand what you mean.
> Could you please explain your advice again?
>
> The author of this driver is 'Jia-Wei Chang'.
> We have added author information to the driver code and this binding
> document as above.

Firstly, sorry for the confusion.

I have discussed this patch with you. I think that you (Johnson Wang)
should be added to 'maintainers' of this binding document as following:

+maintainers:
+  - Jia-Wei Chang <jia-wei.chang@mediatek.com>
+  - Johnson Wang <johnson.wang@mediatek.com>

>
> >
> > And add this dt-binding information to MAINTAINERS
> > as following: because I cannot catch the later patch
> > of modification.
> >
> > cwchoi00@chanwoo:~/kernel/linux.chanwoo$ d
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index edc96cdb85e8..a11e9c1947b7 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -5698,6 +5698,7 @@ L:        linux-pm@vger.kernel.org
> >   S:     Maintained
> >   T:     git
> > git://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git
> >   F:     Documentation/devicetree/bindings/devfreq/
> > +F:     Documentation/devicetree/bindings/interconnect/mediatek,cci.y
> > aml
> >   F:     drivers/devfreq/
> >   F:     include/linux/devfreq.h
> >   F:     include/trace/events/devfreq.h
> >
>
> I will add it in the next version.
>
> BRs,
> Johnson Wang
> >
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
> > > +      - description:
> > > +          A parent of "cpu" clock which is used as an intermediate
> > > clock source
> > > +          when the original CPU is under transition and not stable
> > > yet.
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: cci
> > > +      - const: intermediate
> > > +
> > > +  operating-points-v2: true
> > > +  opp-table: true
> > > +
> > > +  proc-supply:
> > > +    description:
> > > +      Phandle of the regulator for CCI that provides the supply
> > > voltage.
> > > +
> > > +  sram-supply:
> > > +    description:
> > > +      Phandle of the regulator for sram of CCI that provides the
> > > supply
> > > +      voltage. When it presents, the cci devfreq driver needs to
> > > do
> > > +      "voltage tracking" to step by step scale up/down Vproc and
> > > Vsram to fit
> > > +      SoC specific needs. When absent, the voltage scaling flow is
> > > handled by
> > > +      hardware, hence no software "voltage tracking" is needed.
> > > +
> > > +required:
> > > +  - compatible
> > > +  - clocks
> > > +  - clock-names
> > > +  - operating-points-v2
> > > +  - proc-supply
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/mt8183-clk.h>
> > > +    cci: cci {
> > > +        compatible = "mediatek,mt8183-cci";
> > > +        clocks = <&mcucfg CLK_MCU_BUS_SEL>,
> > > +                 <&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
> > > +        clock-names = "cci", "intermediate";
> > > +        operating-points-v2 = <&cci_opp>;
> > > +        proc-supply = <&mt6358_vproc12_reg>;
> > > +    };
> > > +
> > > +    cci_opp: opp-table-cci {
> > > +        compatible = "operating-points-v2";
> > > +        opp-shared;
> > > +        opp2_00: opp-273000000 {
> > > +            opp-hz = /bits/ 64 <273000000>;
> > > +            opp-microvolt = <650000>;
> > > +        };
> > > +        opp2_01: opp-338000000 {
> > > +            opp-hz = /bits/ 64 <338000000>;
> > > +            opp-microvolt = <687500>;
> > > +        };
> > > +        opp2_02: opp-403000000 {
> > > +            opp-hz = /bits/ 64 <403000000>;
> > > +            opp-microvolt = <718750>;
> > > +        };
> > > +        opp2_03: opp-463000000 {
> > > +            opp-hz = /bits/ 64 <463000000>;
> > > +            opp-microvolt = <756250>;
> > > +        };
> > > +        opp2_04: opp-546000000 {
> > > +            opp-hz = /bits/ 64 <546000000>;
> > > +            opp-microvolt = <800000>;
> > > +        };
> > > +        opp2_05: opp-624000000 {
> > > +            opp-hz = /bits/ 64 <624000000>;
> > > +            opp-microvolt = <818750>;
> > > +        };
> > > +        opp2_06: opp-689000000 {
> > > +            opp-hz = /bits/ 64 <689000000>;
> > > +            opp-microvolt = <850000>;
> > > +        };
> > > +        opp2_07: opp-767000000 {
> > > +            opp-hz = /bits/ 64 <767000000>;
> > > +            opp-microvolt = <868750>;
> > > +        };
> > > +        opp2_08: opp-845000000 {
> > > +            opp-hz = /bits/ 64 <845000000>;
> > > +            opp-microvolt = <893750>;
> > > +        };
> > > +        opp2_09: opp-871000000 {
> > > +            opp-hz = /bits/ 64 <871000000>;
> > > +            opp-microvolt = <906250>;
> > > +        };
> > > +        opp2_10: opp-923000000 {
> > > +            opp-hz = /bits/ 64 <923000000>;
> > > +            opp-microvolt = <931250>;
> > > +        };
> > > +        opp2_11: opp-962000000 {
> > > +            opp-hz = /bits/ 64 <962000000>;
> > > +            opp-microvolt = <943750>;
> > > +        };
> > > +        opp2_12: opp-1027000000 {
> > > +            opp-hz = /bits/ 64 <1027000000>;
> > > +            opp-microvolt = <975000>;
> > > +        };
> > > +        opp2_13: opp-1092000000 {
> > > +            opp-hz = /bits/ 64 <1092000000>;
> > > +            opp-microvolt = <1000000>;
> > > +        };
> > > +        opp2_14: opp-1144000000 {
> > > +            opp-hz = /bits/ 64 <1144000000>;
> > > +            opp-microvolt = <1025000>;
> > > +        };
> > > +        opp2_15: opp-1196000000 {
> > > +            opp-hz = /bits/ 64 <1196000000>;
> > > +            opp-microvolt = <1050000>;
> > > +        };
> > > +    };
> >
> >
>


-- 
Best Regards,
Chanwoo Choi

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
