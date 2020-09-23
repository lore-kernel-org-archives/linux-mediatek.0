Return-Path: <SRS0=E7TL=DA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD650C2D0A8
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2020 16:12:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A3CF20936
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2020 16:12:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dc/APGvu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A3CF20936
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aFBuipJ3sncNoOLWCJos5LM6RNYk1etVfz/pqR6rtrM=; b=dc/APGvucEKXuO7AcpZ9BzDEY
	gJYrYAjkfdOZyMjvZ+fVZSKn1ZfMB7ussHnKZQ1mksdiDjkVeD4CcDSW9UF+ox5fS2T1cEger2gso
	6mVNAiKtVUJGKnvxrQRn1zNotqM93MUpqQgewWRPbh7ggOpR25q1FUPemSGHQt4IyJQbQBApeYwKZ
	Ik4xpbsMwtqkWnTxb1DCg1KzDjAjMTYs1JqGwHJ7QmRwFFzZmCNJwFdZYlZITr9BTF6cjs56czyjr
	9zNMhicn6LGdXQj0+NHSt5QU2ijq6N7IC9cQ90/u0EtD/xx4OXgl6Aq24Z+3rGI+VeE79izMrgt5K
	I4AqLvngQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kL7Nn-0002OE-9g; Wed, 23 Sep 2020 16:12:39 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kL7Ni-0002Mo-HB; Wed, 23 Sep 2020 16:12:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id C160629C96F
Subject: Re: [PATCH 01/12] dt-bindings: power: Add bindings for the Mediatek
 SCPSYS power domains controller
To: Rob Herring <robh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20200910172826.3074357-1-enric.balletbo@collabora.com>
 <20200910172826.3074357-2-enric.balletbo@collabora.com>
 <20200911230255.GA2972120@bogus>
 <7a1c89b6-f483-5d57-f154-b80b72964077@gmail.com>
 <CAL_JsqLCOXKCTbjw=8MMhnq0YdhrOb7tY6QpT7d3XTAgUrbg=w@mail.gmail.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <434e922d-bec2-66db-7ace-31756a1097a9@collabora.com>
Date: Wed, 23 Sep 2020 18:12:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLCOXKCTbjw=8MMhnq0YdhrOb7tY6QpT7d3XTAgUrbg=w@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200923_121234_737301_71E0D416 
X-CRM114-Status: GOOD (  25.48  )
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 Weiyi Lu <weiyi.lu@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Fabien Parent <fparent@baylibre.com>, Matthias Brugger <mbrugger@suse.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Rob,

Thank you for your answer. I have some doubts, see below.


On 23/9/20 0:36, Rob Herring wrote:
> On Mon, Sep 14, 2020 at 2:59 AM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>>
>>
>>
>> On 12/09/2020 01:02, Rob Herring wrote:
>>> On Thu, Sep 10, 2020 at 07:28:15PM +0200, Enric Balletbo i Serra wrote:
>>>> The System Control Processor System (SCPSYS) has several power management
>>>> related tasks in the system. Add the bindings to define the power
>>>> domains for the SCPSYS power controller.
>>>>
>>>> Co-developed-by: Matthias Brugger <mbrugger@suse.com>
>>>> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
>>>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>>>> ---
>>>> Dear Rob,
>>>>
>>>> I am awasre that this binding is not ready, but I prefered to send because I'm
>>>> kind of blocked. Compiling this binding triggers the following error:
>>>>
>>>>      mediatek,power-controller.example.dt.yaml: syscon@10006000: mfg_async@7:
>>>>      '#address-cells', '#size-cells', 'mfg_2d@8'
>>>>      do not match any of the regexes: 'pinctrl-[0-9]+'
>>>>
>>>> This happens when a definition of a power-domain (parent) contains
>>>> another power-domain (child), like the example. I am not sure how to
>>>> specify this in the yaml and deal with this, so any clue is welcome.
>>>
>>> You just have to keep nesting schemas all the way down. Define a
>>> grandchild node under the child node and then all of its properties.
>>>
>>>>
>>>> Thanks,
>>>>    Enric
>>>>
>>>>   .../power/mediatek,power-controller.yaml      | 171 ++++++++++++++++++
>>>>   1 file changed, 171 insertions(+)
>>>>   create mode 100644 Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
>>>> new file mode 100644
>>>> index 000000000000..8be9244ad160
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
>>>> @@ -0,0 +1,171 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Mediatek Power Domains Controller
>>>> +
>>>> +maintainers:
>>>> +  - Weiyi Lu <weiyi.lu@mediatek.com>
>>>> +  - Matthias Brugger <mbrugger@suse.com>
>>>> +
>>>> +description: |
>>>> +  Mediatek processors include support for multiple power domains which can be
>>>> +  powered up/down by software based on different application scenes to save power.
>>>> +
>>>> +  IP cores belonging to a power domain should contain a 'power-domains'
>>>> +  property that is a phandle for SCPSYS node representing the domain.
>>>> +
>>>> +properties:
>>>> +  $nodename:
>>>> +    pattern: "^syscon@[0-9a-f]+$"
>>>> +
>>>> +  compatible:
>>>> +    items:
>>>> +      - enum:
>>>> +        - mediatek,mt8173-power-controller
>>>> +      - const: syscon
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +patternProperties:
>>>> +  "^.*@[0-9]$":
>>>
>>> Node names should be generic:
>>>
>>> power-domain@
>>>
>>
>> Enric correct me if I'm wrong, if we want to see the power domains in debugfs,
>> they are listed by their name. If all are called power-domain then the listing
>> is pretty much useless.
> 
> Sorry, but not a binding problem.
> 
> Maybe if debugfs shows what devices are contained within a power
> domain then it doesn't matter so much.
> 
>>>> +    type: object
>>>> +    description: |
>>>> +      Represents the power domains within the power controller node as documented
>>>> +      in Documentation/devicetree/bindings/power/power-domain.yaml.
>>>> +
>>>> +    properties:
>>>> +      reg:
>>>> +        description: |
>>>> +          Power domain index. Valid values are defined in:
>>>> +              "include/dt-bindings/power/mt8173-power.h" - for MT8173 type power domain.
>>>> +        maxItems: 1
>>>> +
>>>> +      '#power-domain-cells':
>>>> +        description:
>>>> +          Documented by the generic PM Domain bindings in
>>>> +          Documentation/devicetree/bindings/power/power-domain.yaml.
>>>
>>> No need to redefine a common property. This should define valid values
>>> for it.
>>>
>>>> +
>>>> +      clocks:
>>>> +        description: |
>>>> +          A number of phandles to clocks that need to be enabled during domain
>>>> +          power-up sequencing.
>>>
>>> No need to redefine 'clocks'. You need to define how many, what each one
>>> is, and the order.
>>>
>>
>> Do you mean we have to define each clock for each power domain of each SoC?
> 
> Yes.
> 

But every power domain can use totally different clocks I.e in the scpsys
controller for MT8173 we can have:

clocks:
    items:
      - description: MMSYS reference clock
      - description: Video Encoder reference clock

That matches with:

+            power-domain@MT8173_POWER_DOMAIN_VENC {
+                reg = <MT8173_POWER_DOMAIN_VENC>;
+                clocks = <&topckgen CLK_TOP_MM_SEL>,
+                         <&topckgen CLK_TOP_VENC_SEL>;
+                clock-names = "mm", "venc";
+                #power-domain-cells = <0>;
+            };

But then we can have another power-domain (inside) with another clock.

+            power-domain@MT8173_POWER_DOMAIN_MFG_ASYNC {
+                reg = <MT8173_POWER_DOMAIN_MFG_ASYNC>;
+                clocks = <&clk26m>;
+                clock-names = "mfg";
+            };

Should we add a new item like this then?

      - description: 26MHz reference clock

But clocks will not match with the order for this power-domain (as MMSYS and
VENC clocks are missing here). AFAIK is not possible to specify different clocks
for different power-domains that are inside the SCPSYS power controller node.

For other SoCs we can have something more complex like this:

+	power-domain@MT8183_POWER_DOMAIN_CAM {
+		reg = <MT8183_POWER_DOMAIN_CAM>;
+		clocks = <&topckgen CLK_TOP_MUX_CAM>,
+			 <&camsys CLK_CAM_LARB6>,
+			 <&camsys CLK_CAM_LARB3>,
+			 <&camsys CLK_CAM_SENINF>,
+			 <&camsys CLK_CAM_CAMSV0>,
+			 <&camsys CLK_CAM_CAMSV1>,
+			 <&camsys CLK_CAM_CAMSV2>,
+			 <&camsys CLK_CAM_CCU>;
+		clock-names = "cam", "cam-0", "cam-1",
+			      "cam-2", "cam-3", "cam-4",
+			      "cam-5", "cam-6";
+		mediatek,infracfg = <&infracfg>;
+		mediatek,smi = <&smi_common>;
+		#power-domain-cells = <0>;
+	};

Thanks,
  Enric


> Rob
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
