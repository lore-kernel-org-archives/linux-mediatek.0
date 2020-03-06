Return-Path: <SRS0=MFJx=4X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F0FDC3F2D2
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2020 02:44:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5A9920714
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2020 02:44:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H2pBGKEr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="E+5Hc2Ro"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5A9920714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=akkKZYydj7O3O570GU46v93P013FNHJnmCr1dRCz1d0=; b=H2pBGKErUkyvMg
	swhWg74V/OhlrfriQU7RWRGhKiSVeUy6cJmiXLHsZRdqG4PPugqYpg46p0LVhWWhqHOsH3VsOZKy3
	P5YN8LpVpDcpxGcs9bPJEoGGDsi9QDMrh1y4FuqxFlkIjO5WeEYCd7957D8hnsDbzF9cZuJN/bsIf
	0x1j01YJ2E1V3fbu8nmvMkSHzM3fsmBSDJ5neKb5hURhAVT9lqZOUAtIanzvAIcetz0KbhBSmd7HK
	jOXNDikZk1AuJCVs8Zzc2hpa/GBgg7pKbYXRCz2H+NHhbxE2Bm6KO0YHwpgjG1GzIO94uf8o3NEG0
	tA0i91KnBNv59y+63DJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jA2xt-00088E-LN; Fri, 06 Mar 2020 02:43:53 +0000
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jA2xq-000874-Mj
 for linux-mediatek@lists.infradead.org; Fri, 06 Mar 2020 02:43:52 +0000
Received: by mail-vs1-xe41.google.com with SMTP id n27so638352vsa.0
 for <linux-mediatek@lists.infradead.org>; Thu, 05 Mar 2020 18:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9J7QUZ3c6oiJJHOCislF9UdZETLylotw3HiKvwmAMXw=;
 b=E+5Hc2RoJaRGHZP8HBhUfdRXIeqRGN8m1mX+ZoYWKE5rFmO3rqVE3tD2ahZFs+pdHi
 /4HyvgWRRhRjVfxlEvKX9ZPO9o/jWmDyGVazqEkLQNal6+cTur8SCs2MkknKUJJlpzN5
 DZe43h++B4igVoAiSlhNUnAYvsmvti3qQYbV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9J7QUZ3c6oiJJHOCislF9UdZETLylotw3HiKvwmAMXw=;
 b=Q7lXxXT47N+ErEkbPWHJ0TQOzcC755ufWsBl41vCmH09qqpEAdye9V/gIRCUZzIQTx
 W3r/osT0ZuT4QVlkuNFPPSpF4duM0RS5B7gjEs33i3MQeeRv/uW846yySGaDVmwEe5vL
 ISIAcCcQVbu1TOBtkKms5i8yYr3B/TuYC121MiideuB+Fb1Eymbs0+Q823/vFFCqAbw2
 YwKhikUNW64XQHcDdqDnLA84mAwUWH13bHA3Qb5M49yqagFhoDG4fR4JzscNCWEdha4k
 jT5Ngc0+bAPU7VPsmWNIj/1mcYj4V0wReiiz1EQt8XUBADjcg4a3GJucVUxLg1MMgX8O
 sVzQ==
X-Gm-Message-State: ANhLgQ3Ww6fq0C8cIjIE0z3xNh4HxsLtbwJ4EbURLn+IqXRTL8H1wlYH
 CaruHpjiAh985XU2m198+qECp6alt5V1gPAA5sK8pg==
X-Google-Smtp-Source: ADFU+vv6/yy6QpFMc26UByJ8foEiCd0tx3UtqsQqGWflBPyiIzZovmd5yFBvcuNwqosvDrUuX+XkrYPkCEaxbPFJbJY=
X-Received: by 2002:a67:d81b:: with SMTP id e27mr927920vsj.79.1583462626960;
 Thu, 05 Mar 2020 18:43:46 -0800 (PST)
MIME-Version: 1.0
References: <20200207052627.130118-1-drinkcat@chromium.org>
 <20200207052627.130118-2-drinkcat@chromium.org> <20200225171613.GA7063@bogus>
 <CANMq1KAVX4o5yC7c_88Wq_O=F+MaSN_V4uNcs1nzS3wBS6A5AA@mail.gmail.com>
 <1583462055.4947.6.camel@mtksdaap41>
In-Reply-To: <1583462055.4947.6.camel@mtksdaap41>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Fri, 6 Mar 2020 10:43:35 +0800
Message-ID: <CANMq1KCi1ee87zz6cEWaB04=vEhkTdtW7C+UKW5EFn+1j6Cf3Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
To: Nick Fan <nick.fan@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200305_184350_769704_1534E83B 
X-CRM114-Status: GOOD (  20.10  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Devicetree List <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Sj Huang <sj.huang@mediatek.com>,
 Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Mar 6, 2020 at 10:34 AM Nick Fan <nick.fan@mediatek.com> wrote:
>
> Sorry for my late reply.
> I have checked internally.
> The MT8183_POWER_DOMAIN_MFG_2D is just a legacy name, not really 2D
> domain.
>
> If the naming too confusing, we can change this name to
> MT8183_POWER_DOMAIN_MFG_CORE2 for consistency.

Thanks! I think I'll keep MT8183_POWER_DOMAIN_MFG_2D (that's fine if
that's the domain name you use internally in your HW design), but I'll
modify power-domain-names to core0/1/2 in the binding.

> Thanks
>
> Nick Fan
>
> On Wed, 2020-02-26 at 08:55 +0800, Nicolas Boichat wrote:
>
> > +Nick Fan +Sj Huang @ MTK
> >
> > On Wed, Feb 26, 2020 at 1:16 AM Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Fri, Feb 07, 2020 at 01:26:21PM +0800, Nicolas Boichat wrote:
> > > > Define a compatible string for the Mali Bifrost GPU found in
> > > > Mediatek's MT8183 SoCs.
> > > >
> > > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > > > Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> > > > ---
> > > >
> > > > v4:
> > > >  - Add power-domain-names description
> > > >    (kept Alyssa's reviewed-by as the change is minor)
> > > > v3:
> > > >  - No change
> > > >
> > > >  .../bindings/gpu/arm,mali-bifrost.yaml        | 25 +++++++++++++++++++
> > > >  1 file changed, 25 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > > > index 4ea6a8789699709..0d93b3981445977 100644
> > > > --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > > > +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > > > @@ -17,6 +17,7 @@ properties:
> > > >      items:
> > > >        - enum:
> > > >            - amlogic,meson-g12a-mali
> > > > +          - mediatek,mt8183-mali
> > > >            - realtek,rtd1619-mali
> > > >            - rockchip,px30-mali
> > > >        - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
> > > > @@ -62,6 +63,30 @@ allOf:
> > > >            minItems: 2
> > > >        required:
> > > >          - resets
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            const: mediatek,mt8183-mali
> > > > +    then:
> > > > +      properties:
> > > > +        sram-supply: true
> > > > +        power-domains:
> > > > +          description:
> > > > +            List of phandle and PM domain specifier as documented in
> > > > +            Documentation/devicetree/bindings/power/power_domain.txt
> > > > +          minItems: 3
> > > > +          maxItems: 3
> > > > +        power-domain-names:
> > > > +          items:
> > > > +            - const: core0
> > > > +            - const: core1
> > > > +            - const: 2d
> > >
> > > AFAIK, there's no '2d' block in bifrost GPUs. A power domain for each
> > > core group is correct though.
> >
> > Good question... Hopefully Nick/SJ@MTK can comment, the non-upstream DTS has:
> > gpu: mali@13040000 {
> > compatible = "mediatek,mt8183-mali", "arm,mali-bifrost";
> > power-domains = <&scpsys MT8183_POWER_DOMAIN_MFG_CORE0>;
> > ...
> > }
> >
> > gpu_core1: mali_gpu_core1 {
> > compatible = "mediatek,gpu_core1";
> > power-domains = <&scpsys MT8183_POWER_DOMAIN_MFG_CORE1>;
> > };
> >
> > gpu_core2: mali_gpu_core2 {
> > compatible = "mediatek,gpu_core2";
> > power-domains = <&scpsys MT8183_POWER_DOMAIN_MFG_2D>;
> > };
> >
> > So I picked core0/core1/2d as names, but looking at this, it's likely
> > core2 is more appropriate (and MT8183_POWER_DOMAIN_MFG_2D might just
> > be a internal/legacy name, if there is no real 2d domain).
> >
> > Thanks.
> >
> > > Rob
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
