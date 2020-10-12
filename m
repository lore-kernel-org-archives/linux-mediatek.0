Return-Path: <SRS0=Vqxm=DT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34DCAC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 12:12:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9292D206BE
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 12:12:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cjAlMpeN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Q83HusVU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9292D206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oL02qzLvzInLfOh83AYQGv9sI0NkaLWLE1KmQMB9t54=; b=cjAlMpeN5LFk6PoWTFdvHwdiR
	HjYjB1BKFsXpOgwse0M2IwmZSTjMxgVrpf/KKEx5FTkiXNZtaClW6k54RcH5XpgmxCXTc2E8OHv2W
	5iNv1gCdqJXDvk9M7DwFkUjEDVMbBqCvIr1qnYWB/sEfcPvSwwu7Q0VMYLBFUonBeXTWtwmDPYVks
	jBdKDeOF84UZoCsgEPeunRFHEjq0ahUBDW9N60VAmX2n/SjH5aSYF577FRF234boO7sC9Xb6DAiO4
	Bo4hsVCAfMy7ZMCUK7YPcJuf3FOtM5UHFK90c1udySIhIgtNE5HYB/FXPc48CfvXm+nZ9ZURWGG0u
	I1Ll7j+GA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRwgh-0007hT-H5; Mon, 12 Oct 2020 12:12:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRwge-0007gj-Ej; Mon, 12 Oct 2020 12:12:22 +0000
X-UUID: e97ac839869f40e59bd9019c6b658804-20201012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Bm1nD1Rni6NjuejkSKF6tuW+1OZNvmAl+g7ZgtGLPq8=; 
 b=Q83HusVUoIPt4LmvIp0EA8lONkXn0OY0gdobVbwH/3zi8suo4ZoXxW9Zo1S+xJGOXbrRQ99JSDoys3ijdaufuACIg8gSwjZRMOnfKizKAwa4rD5pGY8DqwRU7fSG/16zp35lCZidwyWzhL/mQQpAnJvWAFv6piT3gm68QfktNRM=;
X-UUID: e97ac839869f40e59bd9019c6b658804-20201012
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1401816764; Mon, 12 Oct 2020 04:12:06 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Oct 2020 05:02:03 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 12 Oct 2020 20:02:00 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Oct 2020 20:01:58 +0800
Message-ID: <1602504119.26323.54.camel@mhfsdcap03>
Subject: Re: [PATCH v3 02/24] dt-bindings: memory: mediatek: Convert SMI to
 DT schema
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>
Date: Mon, 12 Oct 2020 20:01:59 +0800
In-Reply-To: <20201012071843.GA1889@pi3>
References: <20200930070647.10188-1-yong.wu@mediatek.com>
 <20200930070647.10188-3-yong.wu@mediatek.com> <20201002110831.GD6888@pi3>
 <1601958428.26323.26.camel@mhfsdcap03>
 <CAJKOXPfOOGnJeNCa58WEZqbzaAFdLHSm-7pyMyGkYgCBEt0+RA@mail.gmail.com>
 <1602310691.26323.39.camel@mhfsdcap03> <20201012071843.GA1889@pi3>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1FA9AD3A565A7DE7F33FFEDBC7D6A606B4EFC4E07A07FFF66367021A06DDA1692000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_081220_749112_9966A898 
X-CRM114-Status: GOOD (  24.85  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 kernel-team@android.com, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, chao.hao@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Greg Kroah-Hartman <gregkh@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 ming-fan.chen@mediatek.com, anan.sun@mediatek.com, Will
 Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-10-12 at 09:18 +0200, Krzysztof Kozlowski wrote:
> On Sat, Oct 10, 2020 at 02:18:11PM +0800, Yong Wu wrote:
> > On Tue, 2020-10-06 at 09:15 +0200, Krzysztof Kozlowski wrote:
> > > On Tue, 6 Oct 2020 at 06:27, Yong Wu <yong.wu@mediatek.com> wrote:
> > > >
> > > > On Fri, 2020-10-02 at 13:08 +0200, Krzysztof Kozlowski wrote:
> > > > > On Wed, Sep 30, 2020 at 03:06:25PM +0800, Yong Wu wrote:
> > > > > > Convert MediaTek SMI to DT schema.
> > > > > >
> > > > > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > > > > ---
> > > > > >  .../mediatek,smi-common.txt                   |  49 ---------
> > > > > >  .../mediatek,smi-common.yaml                  | 100 ++++++++++++++++++
> > > > > >  .../memory-controllers/mediatek,smi-larb.txt  |  49 ---------
> > > > > >  .../memory-controllers/mediatek,smi-larb.yaml |  91 ++++++++++++++++
> > > > > >  4 files changed, 191 insertions(+), 98 deletions(-)
> > > > > >  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt
> > > > > >  create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> > > > > >  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
> > > > > >  create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> > > > ...
> > > > > > +properties:
> > > > > > +  compatible:
> > > > > > +    oneOf:
> > > > > > +      - enum:
> > > > > > +          - mediatek,mt2701-smi-common
> > > > > > +          - mediatek,mt2712-smi-common
> > > > > > +          - mediatek,mt6779-smi-common
> > > > > > +          - mediatek,mt8173-smi-common
> > > > > > +          - mediatek,mt8183-smi-common
> > > > > > +
> > > > > > +      - description: for mt7623
> > > > > > +        items:
> > > > > > +          - const: mediatek,mt7623-smi-common
> > > > > > +          - const: mediatek,mt2701-smi-common
> > > > > > +
> > > > > > +  reg:
> > > > > > +    maxItems: 1
> > > > > > +
> > > > > > +  clocks:
> > > > > > +    description: |
> > > > > > +      apb and smi are mandatory. the async is only for generation 1 smi HW.
> > > > > > +      gals(global async local sync) also is optional, here is the list which
> > > > > > +      require gals: mt6779 and mt8183.
> > > > > > +    minItems: 2
> > > > > > +    maxItems: 4
> > > > > > +    items:
> > > > > > +      - description: apb is Advanced Peripheral Bus clock, It's the clock for
> > > > > > +          setting the register.
> > > > > > +      - description: smi is the clock for transfer data and command.
> > > > > > +      - description: async is asynchronous clock, it help transform the smi clock
> > > > > > +          into the emi clock domain.
> > > > > > +      - description: gals0 is the path0 clock of gals.
> > > > > > +      - description: gals1 is the path1 clock of gals.
> > > > > > +
> > > > > > +  clock-names:
> > > > > > +    oneOf:
> > > > > > +      - items:
> > > > > > +          - const: apb
> > > > > > +          - const: smi
> > > > > > +      - items:
> > > > > > +          - const: apb
> > > > > > +          - const: smi
> > > > > > +          - const: async
> > > > > > +      - items:
> > > > > > +          - const: apb
> > > > > > +          - const: smi
> > > > > > +          - const: gals0
> > > > > > +          - const: gals1
> > > > >
> > > > > Similarly to my comment to other properties, this requirement per
> > > > > compatible should be part of the schema within 'if-then'.
> > > >
> > > > I'm not so familiar with this format. Do this has "if-then-'else
> > > > if'-then-else"?
> > > 
> > > These are mutually exclusive conditions, so you can skip else:
> > >  - if-then
> > >  - if-then
> > >  - if-then
> > > It will be more readable then stacking 'if' under 'else'
> > 
> > Thanks. I will use something like this:
> > 
> >  anyOf:
> 
> Then it should be oneOf as only one condition can be valid.

I did do this at the beginning. But I get a warning log when
dt_binding_check.


Below is my schema and the detailed warning log:
//=======================================
  clocks:
    description: |
      xxxxx
    minItems: 2
    maxItems: 4
    items:
      - description: apb is the clock for setting the register.
      - description: smi is the clock for transfer data and command.
      - description: async is asynchronous clock.
      - description: gals0 is the path0 clock of gals.
      - description: gals1 is the path1 clock of gals.    

  clock-names:
    minItems: 2
    maxItems: 4 

required:
  - compatible
  - reg
  - power-domains
  - clocks
  - clock-names

oneOf:
  - if: #only for gen1 HW
      properties:
        compatible:
          contains:
            enum:
              - mediatek,mt2701-smi-common
    then:
       properties:
         clock:
           items:
             minItems: 3
             maxItems: 3
         clock-names:
           items:
             - const: apb
             - const: smi
             - const: async

  - if: #for gen2 HW that have gals
      properties:
        compatible:
            enum:
              - mediatek,mt6779-smi-common
              - mediatek,mt8183-smi-common
              - mediatek,mt8192-smi-common

    then:
      properties:
        clock:
          items:
            minItems: 4
            maxItems: 4
        clock-names:
          items:
            - const: apb
            - const: smi
            - const: gals0
            - const: gals1

    else: #for gen2 HW that don't have gals
      properties:
        clock:
          items:
            minItems: 2
            maxItems: 2
        clock-names:
          items:
            - const: apb
            - const: smi

additionalProperties: false 


//===========warning log=====================

Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.example.dt.yaml
.../Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.example.dt.yaml: smi@14022000: {'compatible': ['mediatek,mt8173-smi-common'], 'reg': [[335683584, 4096]], 'power-domains': [[4294967295, 3]], 'clocks': [[4294967295, 1], [4294967295, 1]], 'clock-names': ['apb', 'smi'], '$nodename': ['smi@14022000']} is valid under each of {'else': {'properties': {'clock': {'items': {'maxItems': 2, 'minItems': 2}, 'type': 'array'}, 'clock-names': {'additionalItems': False, 'items': [{'const': 'apb'}, {'const': 'smi'}], 'maxItems': 2, 'minItems': 2, 'type': 'array'}}}, 'if': {'properties': {'compatible': {'additionalItems': False, 'items': [{'enum': ['mediatek,mt6779-smi-common', 'mediatek,mt8183-smi-common', 'mediatek,mt8192-smi-common']}], 'maxItems': 1, 'minItems': 1, 'type': 'array'}}}, 'then': {'properties': {'clock': {'items': {'maxItems': 4, 'minItems': 4}, 'type': 'array'}, 'clock-names': {'additionalItems': False, 'items': [{'const': 'apb'}, {'const': 'smi'}, {'const'
 : 'gals0'}, {'const': 'gals1'}], 'maxItems': 4, 'minItems': 4, 'type': 'array'}}}}, {'if': {'properties': {'compatible': {'contains': {'enum': ['mediatek,mt2701-smi-common']}}}}, 'then': {'properties': {'clock': {'items': {'maxItems': 3, 'minItems': 3}, 'type': 'array'}, 'clock-names': {'additionalItems': False, 'items': [{'const': 'apb'}, {'const': 'smi'}, {'const': 'async'}], 'maxItems': 3, 'minItems': 3, 'type': 'array'}}}}
{'$filename':
'.../Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml',
 '$id':
'http://devicetree.org/schemas/memory-controllers/mediatek,smi-common.yaml#',
 '$schema': 'http://devicetree.org/meta-schemas/core.yaml#',
 '$select_validator': <jsonschema.validators.create.<locals>.Validator
object at 0x7fb3df378908>,
 'additionalProperties': False,
 'oneOf': [{'if': {'properties': {'compatible': {'contains': {'enum':
['mediatek,mt2701-smi-common']}}}},
            'then': {'properties': {'clock': {'items': {'maxItems': 3,
                                                        'minItems': 3},
                                              'type': 'array'},
                                    'clock-names': {'additionalItems':
False,
                                                    'items': [{'const':
'apb'},
                                                              {'const':
'smi'},
                                                              {'const':
'async'}],
                                                    'maxItems': 3,
                                                    'minItems': 3,
                                                    'type': 'array'}}}},
           {'else': {'properties': {'clock': {'items': {'maxItems': 2,
                                                        'minItems': 2},
                                              'type': 'array'},
                                    'clock-names': {'additionalItems':
False,
                                                    'items': [{'const':
'apb'},
                                                              {'const':
'smi'}],
                                                    'maxItems': 2,
                                                    'minItems': 2,
                                                    'type': 'array'}}},
            'if': {'properties': {'compatible': {'additionalItems':
False,
                                                 'items': [{'enum':
['mediatek,mt6779-smi-common',

'mediatek,mt8183-smi-common',

'mediatek,mt8192-smi-common']}],
                                                 'maxItems': 1,
                                                 'minItems': 1,
                                                 'type': 'array'}}},
            'then': {'properties': {'clock': {'items': {'maxItems': 4,
                                                        'minItems': 4},
                                              'type': 'array'},
                                    'clock-names': {'additionalItems':
False,
                                                    'items': [{'const':
'apb'},
                                                              {'const':
'smi'},
                                                              {'const':
'gals0'},
                                                              {'const':
'gals1'}],
                                                    'maxItems': 4,
                                                    'minItems': 4,
                                                    'type':
'array'}}}}],
 'patternProperties': {'pinctrl-[0-9]+': True},
 'properties': {'$nodename': True,
                'clock-names': {'maxItems': 4, 'minItems': 2},
                'clocks': {'additionalItems': False,
                           'items': [{}, {}, {}, {}, {}],
                           'maxItems': 4,
                           'minItems': 2,
                           'type': 'array'},
                'compatible': {'oneOf': [{'additionalItems': False,
                                          'items': [{'enum':
['mediatek,mt2701-smi-common',

'mediatek,mt2712-smi-common',

'mediatek,mt6779-smi-common',

'mediatek,mt8173-smi-common',

'mediatek,mt8183-smi-common',

'mediatek,mt8192-smi-common']}],
                                          'maxItems': 1,
                                          'minItems': 1,
                                          'type': 'array'},
                                         {'additionalItems': False,
                                          'items': [{'const':
'mediatek,mt7623-smi-common'},
                                                    {'const':
'mediatek,mt2701-smi-common'}],
                                          'maxItems': 2,
                                          'minItems': 2,
                                          'type': 'array'}]},
                'phandle': True,
                'pinctrl-names': True,
                'power-domains': {'maxItems': 1, 'minItems': 1},
                'reg': {'maxItems': 1, 'minItems': 1},
                'status': True},
 'required': ['compatible',
              'reg',
              'power-domains',
              'clocks',
              'clock-names'],
 'select': {'properties': {'compatible': {'contains': {'enum':
['mediatek,mt2701-smi-common',

'mediatek,mt2712-smi-common',

'mediatek,mt6779-smi-common',

'mediatek,mt7623-smi-common',

'mediatek,mt8173-smi-common',

'mediatek,mt8183-smi-common',

'mediatek,mt8192-smi-common']}}},
            'required': ['compatible']},
 'title': 'SMI (Smart Multimedia Interface) Common'}
	From
schema: .../Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml

=================================

Sorry, I didn't find a example of multi "if-then" in oneOf and don't
know how to fix this.

From [1], "allOf" looks also is allowed... In this case, both allOf and
anyOf have no warning when dt_binding_check. only oneOf has the warning
log above.

Any suggestion is appreciated.

[1]
https://elixir.bootlin.com/linux/v5.9-rc1/source/Documentation/devicetree/bindings/example-schema.yaml#L195

> 
> Best regards,
> Krzysztof
> 
> >    - if: #gen1 hw
> >      then:
> >        use apb/smi/async clocks
> > 
> >    - if: #gen2 hw that has gals.
> >      then:
> >        use apb/smi/gals0/gals1 clocks
> >      else: # gen2 hw that doesn't have gals.
> >        use apb/smi clocks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
