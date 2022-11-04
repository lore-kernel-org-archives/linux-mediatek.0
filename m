Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7B3C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Nov 2022 21:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+4AWz3heTvW9/SjNGOnADQKijVdWZEZo5RmZcyg0wzU=; b=srDvHkjNbC/JOzRoiQoUfptfub
	Ls3OoImESyGMuW+241D3qAmNkRdeEojC7D2xhh7TTCDE1KVc4gWOBJpOF6y1Z0KSXoIJsR0HK+sRX
	wz6Q7JjNdWzeo3shnXDQUqDYfcjd3b3t9q2MA9+bnuuFb0LKXEqI1/NnQtnZVs4Vd4MF8Mx7KeLYa
	AWZv6aROyxqh1zbgWDPLCgr6cQnxZW7U87N7jqdOJFwqBCFli4+Xq1C2/9LHrMLi5K5h5PCdzE2lD
	9c68ree4HY3p//twstwRqiQDGpn+ip6hWvFXUTXWza7iiwk46NiciD7Fe1+KjLmK0UoJ33p6qXuF9
	svcxyMfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or4Xm-005G4E-Gf; Fri, 04 Nov 2022 21:48:06 +0000
Received: from mail-oa1-f50.google.com ([209.85.160.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or4Xb-005G1S-2L; Fri, 04 Nov 2022 21:47:56 +0000
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-13bef14ea06so6969988fac.3;
        Fri, 04 Nov 2022 14:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+4AWz3heTvW9/SjNGOnADQKijVdWZEZo5RmZcyg0wzU=;
        b=tL3s+IGgeagfv5ouqod3nqTmcGJCNQ6MSUPDL/fghzfrTFutZ/Kp/80j2wVbMvWd8j
         Y5q6V50+ep8hET0M04FGJPFNO1jVThxa3T5++EZ5hsoWHWDH6QAONPiBdKWE39iKf/FV
         mTi8RtiA4Fnwxbb+1td+sTy3U/0AsFeFhs5NNtFs/MOiG51Wi1ApqWwvNQvEFOoc/X8T
         K5EgFJjVDPN+KMygAeqXCG3LaNFZpRrPCWb7PaoxUsvlbdc+f7GJpsPmPce0TzfyBWF7
         MIbpm8+5jP1pM+10kSePCroDbPu82fOV0uKvWpI0EqgrR8n5AERCwc63XOOakwpC8W38
         ZXng==
X-Gm-Message-State: ACrzQf0Z6fuFwXUKWShl3H5Deu7yrybo6/hNYVu4y4oBXJkJ3v1x04u/
	ivZANDzSgKK3NodJLWU2KINscDMxOg==
X-Google-Smtp-Source: AMsMyM75XqDPp8F1ac7KnwNd5teq4r4YMJDMqo39kggUwLf7Jw9pTQVKqM7XDouGLMc4cawPhnXH7Q==
X-Received: by 2002:a05:6870:8911:b0:13b:69b2:86b2 with SMTP id i17-20020a056870891100b0013b69b286b2mr23730705oao.253.1667598463241;
        Fri, 04 Nov 2022 14:47:43 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ek17-20020a056870f61100b0013c50b812a2sm72744oab.36.2022.11.04.14.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 14:47:42 -0700 (PDT)
Received: (nullmailer pid 2885635 invoked by uid 1000);
	Fri, 04 Nov 2022 21:47:44 -0000
Date: Fri, 4 Nov 2022 16:47:44 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: examples: add a list of templates and
 solutions
Message-ID: <20221104214744.GA2878314-robh@kernel.org>
References: <20221028233701.572280-1-krzysztof.kozlowski@linaro.org>
 <20221101130720.GA963805-robh@kernel.org>
 <34f40c1c-f933-cee6-f022-14c37650dc3a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34f40c1c-f933-cee6-f022-14c37650dc3a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_144755_131589_1F888CE2 
X-CRM114-Status: GOOD (  35.45  )
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

On Fri, Nov 04, 2022 at 10:52:22AM -0400, Krzysztof Kozlowski wrote:
> On 01/11/2022 09:07, Rob Herring wrote:
> > On Fri, Oct 28, 2022 at 07:37:01PM -0400, Krzysztof Kozlowski wrote:
> >> It is useful to start from existing bindings when writing new ones,
> >> especially when one does not know that much DT schema.  However we have
> >> several bindings which are not the best examples, so people tend to copy
> >> their issues into new bindings.
> >>
> >> Beginners also might not know how to achieve some more complex solutions
> >> in DT schema, e.g. how one of two properties should be required by the
> >> bindings.  Some of such solutions are already in example-schema.yaml,
> >> but several other are missing.  Add reference with such re-usable
> >> design-patterns.
> > 
> > My main concern here is what's a good example today is not tomorrow... 
> 
> Yes, I agree. The problem I want to solve is some folks copy-paste some
> existing schema as starting point and then are surprised when receive
> basic style feedback.
> 
> Of course the optimal solution would be to make all schemas in same
> (proper) style, but this is going take some time...
> 
> How to solve this problem other way? I don't know.

shrug


> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> ---
> >>  .../devicetree/bindings/examples.rst          | 63 +++++++++++++++++++
> >>  Documentation/devicetree/bindings/index.rst   |  1 +
> >>  2 files changed, 64 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/examples.rst
> >>
> >> diff --git a/Documentation/devicetree/bindings/examples.rst b/Documentation/devicetree/bindings/examples.rst
> >> new file mode 100644
> >> index 000000000000..710eea81d8b7
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/examples.rst
> >> @@ -0,0 +1,63 @@
> >> +.. SPDX-License-Identifier: GPL-2.0
> >> +
> >> +Examples of Devicetree Bindings to use a base
> >> +=============================================
> >> +
> >> +Following Devicetree Bindings in DT Schema are a known good starting point when
> >> +writing new bindings:
> >> +
> >> +1. Simple SPI device:
> >> +   Documentation/devicetree/bindings/iio/adc/maxim,max11205.yaml
> >> +
> >> +2. PMIC (MFD) with several sub-devices:
> >> +   Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
> >> +
> >> +3. Battery charger (power supply):
> >> +   Documentation/devicetree/bindings/power/supply/bq256xx.yaml
> >> +   (but use vendor prefix in filename)
> >> +
> >> +4. Clock controller for several devices with different clock inputs:
> >> +   Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
> >> +
> >> +5. GPIO controller:
> >> +   Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml
> >> +
> >> +
> >> +Re-usable design patterns when writing your own bindings
> >> +========================================================
> >> +
> >> +Following bindings show how to use common pattern of writing bindings:
> >> +
> >> +1. Property required and present only for one variant.  Property cannot appear
> >> +   on other variants:
> >> +   Documentation/devicetree/bindings/example-schema.yaml
> >> +   Line: 212
> >> +
> >> +2. Excluding properties, but none are required:
> >> +   Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
> >> +   Line: 155
> >> +
> >> +3. Excluding required properties, but one is required:
> >> +   Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
> >> +   Line: 91
> >> +
> >> +4. Array with numbers (items) from given range - min/max:
> >> +   Documentation/devicetree/bindings/arm/l2c2x0.yaml
> >> +   Line: 74
> >> +
> >> +5. Array with numbers (items) from given range - enum:
> >> +   Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> >> +   Line: 101
> >> +
> >> +6. Uint32 matrix, variable length of two-items:
> >> +   Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> >> +   Line: 278
> >> +
> >> +7. Phandle to syscon with offset:
> >> +   Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> >> +   Line: 42
> >> +
> >> +8. Variable length of array (e.g. clocks and clock-names) but narrowed to
> >> +   specific variant:
> >> +   Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
> >> +   Lines: 33 and 71
> > 
> > It seems like some of these that are just a single property we could add 
> > to example-schema.yaml.
> 
> I am afraid the example-schema will grow too big for folks to look into.
> It's already quite complicated, with explanations of the dtschema
> behavior itself.

How about splitting up the top-level descriptions and property examples?

> How about then RST file with small code snippets?

Then they don't validate.

> 
> > Also, perhaps a reference to this from writing-schema.rst.
> 
> I can do this as well.
> 
> The problem with my approach above (and adding these to writing-schema)
> is that examples above can change, lines can be inadequate.

I just meant a link in writing-schema.rst to this doc. We already have 
that for example-schema.yaml.

Rob

