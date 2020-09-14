Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD2DC433E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 08:59:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E188221E8
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 08:59:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T/rWXs/2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JFph4kBz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E188221E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qXGMtsFP7wOYqlMwgJRSPizYrfmdO2xh4x1wIDa9MVw=; b=T/rWXs/20RZgtceIP2n73Kv/O
	G/WwLlRmHgJy/IdMyqqBXS6FluYZzmPJlecySWQBeDT+MuBcXRQBRBaQ/3NGYjel1kdVz+wYwpse5
	PIxPqfpuZoIbKzRKgHMh0uwEJqxvINr4TtVVCm88QYZYVnEz9l9fiUB4KH+xb2l95XmXFIVWKeMDk
	rNRuryOLGGlUSf+8HnouyJo3tus3fI4t/frxAmYTwnh60tyDS+OZYryVyrp2oVSunIkBYNY1qVJcj
	2MUTWCEsA1iRvrEqQMAmiYRjzlaa5OmcwbHWagQXJvBuF+iJJP+M6Anb1uRqeJZFYBQDA6R0pbZRA
	Ea48x5NqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHkKw-0001cY-3f; Mon, 14 Sep 2020 08:59:46 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHkKt-0001bH-Iq; Mon, 14 Sep 2020 08:59:44 +0000
Received: by mail-wm1-x344.google.com with SMTP id l15so5414213wmh.1;
 Mon, 14 Sep 2020 01:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/MIKedoIOUsFjweTslvur4pBQa9SNFf9T3eSu+x3ZqE=;
 b=JFph4kBzYlVFBa10GDi5JH43OZeeNU4SUMmmwxnl5A/9diq+SmrOMfPD/GLMH3oxDe
 hhOuJgoNfWUovkwB1tKcMiGQTDGPqZEsJjInlTw7pW7SVQNr/d680yEthOrM4IEmJSNE
 hzdp0ZcibpG2ByVJqTWNgHax8h6YshM4TPFcP/gjlXkb1NbkxqQjozb+U3eRzibzBdAH
 hCs6kK1VTuZS+pINj4LH0Q33/Zgbxzb4lvWYQkpUwiDMqdpNVZJV/xV5fLEqhonnjJhW
 1jWCE44sTq0W7LbmYBbBHjScJk28qHgH5DmVJxrcUhAPjm2ja9RNQYm4AucjQAtdwQ2m
 fZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/MIKedoIOUsFjweTslvur4pBQa9SNFf9T3eSu+x3ZqE=;
 b=SCJdwLtoS/NHDURe5Ps543CB5jS64JrbN0Rjp1MJzjibwec9VvvfKXkpY5xyswoagk
 39X7UHq0EN5ZxhK57PxoY5yVL1AALX+io8aP9nmhmTmVYq4tePF8IgG5U/JV6DdW+klC
 LTWk3CqDVUggbbaBqMAOPeRfvU4a5OsgNh+cgv4qeKrr1ziKUQPSIneYqG9K3oC+dw+x
 91Lzx4RBR4qgslA0hb2YtHGKecInatVSK8ErO1wCeb9lg7A0Fu0SIa9zRCphzaC//HiU
 UYSaUQrwCChLZM71plhq8+GpE+fWqa0cf+VuLqesQblSv8wIQDBXPvKMUj9KHJamniHk
 yEJQ==
X-Gm-Message-State: AOAM531YnqadDd2F0F3SFX3sMjIt9Sk3Q9WxzrrDTYF5YtEI3qbvPnyg
 /veNf1AWVP3/XtVvDm58KCW2W48s9PIV8A==
X-Google-Smtp-Source: ABdhPJxdQrb1I8Rlz09G/IfEfX9kFrBzNcFYdPCZNmq0bpJ7m6Td4pGvrxBHZyfwPP2YvhAb4HCi5g==
X-Received: by 2002:a1c:9654:: with SMTP id y81mr14000152wmd.9.1600073980332; 
 Mon, 14 Sep 2020 01:59:40 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id z13sm19391670wro.97.2020.09.14.01.59.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2020 01:59:39 -0700 (PDT)
Subject: Re: [PATCH 01/12] dt-bindings: power: Add bindings for the Mediatek
 SCPSYS power domains controller
To: Rob Herring <robh@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
References: <20200910172826.3074357-1-enric.balletbo@collabora.com>
 <20200910172826.3074357-2-enric.balletbo@collabora.com>
 <20200911230255.GA2972120@bogus>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <7a1c89b6-f483-5d57-f154-b80b72964077@gmail.com>
Date: Mon, 14 Sep 2020 10:59:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200911230255.GA2972120@bogus>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_045943_648598_DA6DFFD3 
X-CRM114-Status: GOOD (  33.40  )
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
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org, weiyi.lu@mediatek.com,
 linux-kernel@vger.kernel.org, fparent@baylibre.com,
 Matthias Brugger <mbrugger@suse.com>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 12/09/2020 01:02, Rob Herring wrote:
> On Thu, Sep 10, 2020 at 07:28:15PM +0200, Enric Balletbo i Serra wrote:
>> The System Control Processor System (SCPSYS) has several power management
>> related tasks in the system. Add the bindings to define the power
>> domains for the SCPSYS power controller.
>>
>> Co-developed-by: Matthias Brugger <mbrugger@suse.com>
>> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>> ---
>> Dear Rob,
>>
>> I am awasre that this binding is not ready, but I prefered to send because I'm
>> kind of blocked. Compiling this binding triggers the following error:
>>
>>      mediatek,power-controller.example.dt.yaml: syscon@10006000: mfg_async@7:
>>      '#address-cells', '#size-cells', 'mfg_2d@8'
>>      do not match any of the regexes: 'pinctrl-[0-9]+'
>>
>> This happens when a definition of a power-domain (parent) contains
>> another power-domain (child), like the example. I am not sure how to
>> specify this in the yaml and deal with this, so any clue is welcome.
> 
> You just have to keep nesting schemas all the way down. Define a
> grandchild node under the child node and then all of its properties.
> 
>>
>> Thanks,
>>    Enric
>>
>>   .../power/mediatek,power-controller.yaml      | 171 ++++++++++++++++++
>>   1 file changed, 171 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
>> new file mode 100644
>> index 000000000000..8be9244ad160
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
>> @@ -0,0 +1,171 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Mediatek Power Domains Controller
>> +
>> +maintainers:
>> +  - Weiyi Lu <weiyi.lu@mediatek.com>
>> +  - Matthias Brugger <mbrugger@suse.com>
>> +
>> +description: |
>> +  Mediatek processors include support for multiple power domains which can be
>> +  powered up/down by software based on different application scenes to save power.
>> +
>> +  IP cores belonging to a power domain should contain a 'power-domains'
>> +  property that is a phandle for SCPSYS node representing the domain.
>> +
>> +properties:
>> +  $nodename:
>> +    pattern: "^syscon@[0-9a-f]+$"
>> +
>> +  compatible:
>> +    items:
>> +      - enum:
>> +        - mediatek,mt8173-power-controller
>> +      - const: syscon
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +patternProperties:
>> +  "^.*@[0-9]$":
> 
> Node names should be generic:
> 
> power-domain@
> 

Enric correct me if I'm wrong, if we want to see the power domains in debugfs, 
they are listed by their name. If all are called power-domain then the listing 
is pretty much useless.

>> +    type: object
>> +    description: |
>> +      Represents the power domains within the power controller node as documented
>> +      in Documentation/devicetree/bindings/power/power-domain.yaml.
>> +
>> +    properties:
>> +      reg:
>> +        description: |
>> +          Power domain index. Valid values are defined in:
>> +              "include/dt-bindings/power/mt8173-power.h" - for MT8173 type power domain.
>> +        maxItems: 1
>> +
>> +      '#power-domain-cells':
>> +        description:
>> +          Documented by the generic PM Domain bindings in
>> +          Documentation/devicetree/bindings/power/power-domain.yaml.
> 
> No need to redefine a common property. This should define valid values
> for it.
> 
>> +
>> +      clocks:
>> +        description: |
>> +          A number of phandles to clocks that need to be enabled during domain
>> +          power-up sequencing.
> 
> No need to redefine 'clocks'. You need to define how many, what each one
> is, and the order.
> 

Do you mean we have to define each clock for each power domain of each SoC?

>> +
>> +      clock-names:
>> +        description: |
>> +          List of names of clocks, in order to match the power-up sequencing
>> +          for each power domain we need to group the clocks by name. BASIC
>> +          clocks need to be enabled before enabling the corresponding power
>> +          domain, and should not have a '-' in their name (i.e mm, mfg, venc).
>> +          SUSBYS clocks need to be enabled before releasing the bus protection,
>> +          and should contain a '-' in their name (i.e mm-0, isp-0, cam-0).
>> +
>> +          In order to follow properly the power-up sequencing, the clocks must
>> +          be specified by order, adding first the BASIC clocks followed by the
>> +          SUSBSYS clocks.
> 
> You need to define the names.
> 
>> +
>> +      mediatek,infracfg:
>> +        $ref: /schemas/types.yaml#definitions/phandle
>> +        description: phandle to the device containing the INFRACFG register range.
>> +
>> +      mediatek,smi:
>> +        $ref: /schemas/types.yaml#definitions/phandle
>> +        description: phandle to the device containing the SMI register range.
>> +
>> +    required:
>> +      - reg
>> +      - '#power-domain-cells'
>> +
>> +    additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/mt8173-clk.h>
>> +    #include <dt-bindings/power/mt8173-power.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        scpsys: syscon@10006000 {
>> +            compatible = "mediatek,mt8173-power-controller", "syscon";

The power domain controller is just one funcionality the SCPSYS block can 
provide. I think it should be child of the SCPSYS.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
