Return-Path: <SRS0=ht0X=4O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29AD0C4BA0A
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 00:56:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFC9D22464
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 00:56:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tKWVdW4P";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y7BmXd6M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFC9D22464
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yaAA0JsttdDGiqrjVcy/BxacpPMxxxmSUADcw4dm5lg=; b=tKWVdW4PlRQp1W
	8WQkbbwtuFjlSJyVLTsX69NlA+cjw+OgoFmANwtWVFDCFMkd8hy5FIWtFrjpjplpPZ+2v2Ewo2R0B
	gyZetk8P7n5EnscNat2yrQeqC1RUedUkvfFCDJUa1rWfrOvKZEY/0ZTzE2rkPM8EJSzoHxKlsh1EC
	0Qoqua6WfFABRezUmySOT9OQGRa1x43dAigJCVNk9ugFmgqn0NOMWlSEPJStVCnO4TrGbQ9BQKMqq
	Rd26VT6nOoZHzwZduTkuOqlbSezkMiMM6sZE3Cv8edtilcBMMJnt2DoT6vwISZ7VdWO/GjKOnPAR6
	oB8NAlfYcuy5rJwh5rkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6kzd-0005lx-Pf; Wed, 26 Feb 2020 00:56:05 +0000
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6kza-0005l2-IA
 for linux-mediatek@lists.infradead.org; Wed, 26 Feb 2020 00:56:03 +0000
Received: by mail-qt1-x843.google.com with SMTP id l21so1063304qtr.8
 for <linux-mediatek@lists.infradead.org>; Tue, 25 Feb 2020 16:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KTr07x+ZuW+Wkx10CmLSTlKU+6ax9EaUyaBXKAF3OqM=;
 b=Y7BmXd6Mfp+6AZ5v7tzuyEct+NldmkDhFbkaCIoOl6/SfR059Z2NK44rQkbVc+4j7t
 n0RrGob1lJqy4jSvVTBHC3x7e53bCvZCs0af4K9zwmRDwcKU3x3vY+Goiu220sgiSxhg
 LkPCOLYG0N6aE3fNLH+xw2IiIErd9z+gBVRxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KTr07x+ZuW+Wkx10CmLSTlKU+6ax9EaUyaBXKAF3OqM=;
 b=aJpR5ZsLm2zYAaeTI2LXP/RUAFRf/KUDgi8clmoJzEWRPkB1MwSkzo+gRXBbwJ/7CW
 vCVAXOBI7UzbdtqGVFdEl0q1yQjFDC+TxXaS1b+A7IIfUG0vd3xgiZF8szazP/iubKl9
 BbW/nLjP3aEc23KECli1DinsxRRyRS0lBkFrcjXn7CRtmj6YzTArjjNPUvJJdswho9sq
 ztYB+TzIRzCeUsSx/hyyucnl35Ug8HOVIc36K9Z/J8jWooa5KpKLEVXlqIyWsH6fIKzn
 K/oRX9v2N8Qsvi28upH+elLAPHgMYvn5YmlOqFAUO18YLtn5uajx68eCsHC7lWlpyS4L
 5DTQ==
X-Gm-Message-State: APjAAAU43Adrd9gerMywDis4m4fdBs/pUEiiYBFsDpfzQnLCKBxOkCkF
 4Jy22TQOEUyNUxi4pNn/CmaCzOb0dLPBrX/67AX6DA==
X-Google-Smtp-Source: APXvYqwn/doZ3Sl5MivNf7aeBY0i9IjKThPIXnCkYsjm6+vHV5atNhFSLqXf91LmG+mgvcdhqR+658LdmJfFTgy7fYc=
X-Received: by 2002:ac8:72d6:: with SMTP id o22mr1774873qtp.174.1582678561028; 
 Tue, 25 Feb 2020 16:56:01 -0800 (PST)
MIME-Version: 1.0
References: <20200207052627.130118-1-drinkcat@chromium.org>
 <20200207052627.130118-2-drinkcat@chromium.org> <20200225171613.GA7063@bogus>
In-Reply-To: <20200225171613.GA7063@bogus>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 26 Feb 2020 08:55:50 +0800
Message-ID: <CANMq1KAVX4o5yC7c_88Wq_O=F+MaSN_V4uNcs1nzS3wBS6A5AA@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
To: Rob Herring <robh@kernel.org>, Nick Fan <nick.fan@mediatek.com>, 
 Sj Huang <sj.huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_165602_603393_237226CD 
X-CRM114-Status: GOOD (  13.63  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

+Nick Fan +Sj Huang @ MTK

On Wed, Feb 26, 2020 at 1:16 AM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Feb 07, 2020 at 01:26:21PM +0800, Nicolas Boichat wrote:
> > Define a compatible string for the Mali Bifrost GPU found in
> > Mediatek's MT8183 SoCs.
> >
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> > ---
> >
> > v4:
> >  - Add power-domain-names description
> >    (kept Alyssa's reviewed-by as the change is minor)
> > v3:
> >  - No change
> >
> >  .../bindings/gpu/arm,mali-bifrost.yaml        | 25 +++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > index 4ea6a8789699709..0d93b3981445977 100644
> > --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > @@ -17,6 +17,7 @@ properties:
> >      items:
> >        - enum:
> >            - amlogic,meson-g12a-mali
> > +          - mediatek,mt8183-mali
> >            - realtek,rtd1619-mali
> >            - rockchip,px30-mali
> >        - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
> > @@ -62,6 +63,30 @@ allOf:
> >            minItems: 2
> >        required:
> >          - resets
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: mediatek,mt8183-mali
> > +    then:
> > +      properties:
> > +        sram-supply: true
> > +        power-domains:
> > +          description:
> > +            List of phandle and PM domain specifier as documented in
> > +            Documentation/devicetree/bindings/power/power_domain.txt
> > +          minItems: 3
> > +          maxItems: 3
> > +        power-domain-names:
> > +          items:
> > +            - const: core0
> > +            - const: core1
> > +            - const: 2d
>
> AFAIK, there's no '2d' block in bifrost GPUs. A power domain for each
> core group is correct though.

Good question... Hopefully Nick/SJ@MTK can comment, the non-upstream DTS has:
gpu: mali@13040000 {
compatible = "mediatek,mt8183-mali", "arm,mali-bifrost";
power-domains = <&scpsys MT8183_POWER_DOMAIN_MFG_CORE0>;
...
}

gpu_core1: mali_gpu_core1 {
compatible = "mediatek,gpu_core1";
power-domains = <&scpsys MT8183_POWER_DOMAIN_MFG_CORE1>;
};

gpu_core2: mali_gpu_core2 {
compatible = "mediatek,gpu_core2";
power-domains = <&scpsys MT8183_POWER_DOMAIN_MFG_2D>;
};

So I picked core0/core1/2d as names, but looking at this, it's likely
core2 is more appropriate (and MT8183_POWER_DOMAIN_MFG_2D might just
be a internal/legacy name, if there is no real 2d domain).

Thanks.

> Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
