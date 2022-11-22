Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1321C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 15:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iejRpG5xmG3AVT59k2korzV+i4h+JxFeIQ6F9nhVYVE=; b=0vbyG1gBSzE54Xd6mnLq69yQwy
	8H0vYvJSNGC+2OGrCSByfWxOnX6bibIK9e4lvClFIGSywn93AHhtcgFhT2Qp05TkLIrTFrmIX3wtT
	gZXu80CQ4N4zFBaKLmdPE9wtMmL/W9yNrHAxLYaN7jWJaTgOrYcNNVrogRMnwqWYyNu6a6nULu6bV
	rxFediQrKtpvYFQddvtkWWDoDeT9bCHI9g4wl8Ls+H8EE/fTzeMkRp7QtvJDhM1s4pNpjWkLp96TF
	miNUahcSw6zFTvOY0LfRkA/hvKUKaikgcMA3KBn6pXHdpoPl0z2EGG5kDYlHq2y92tmAdjZnJIbNf
	6n8h/0lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxVW6-00ATaw-Lj; Tue, 22 Nov 2022 15:48:58 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxVW2-00ATXe-VP; Tue, 22 Nov 2022 15:48:57 +0000
Received: by mail-wr1-x433.google.com with SMTP id z4so10759270wrr.3;
        Tue, 22 Nov 2022 07:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iejRpG5xmG3AVT59k2korzV+i4h+JxFeIQ6F9nhVYVE=;
        b=ERJaFk4RY2JkFY1qv6TQODE0AZ/ynMZlyKjqpHHZeLeGVUineTumgeSDCVdaBTDoCE
         k3JFmtpqgr2rwK2uCB+hzbXD4Lu+hEHgql6SJVCdw7yOg3rP2YZgXzJaDpEvv9VMzxEO
         envg5y6jmXVxTExN5qMcUhLl8tIAoNNfOCRXBoBRGS/MqWlfpz9kH9EYVqDHKh/deueG
         J9CNjTwJ5Bt6sLbAhD3sUZWhQF/yFlSocEihRmiNKnnbgdfeB+fWGAMd6rFZkji9ZWfB
         FDhyCf+fte3sj9Ss2mq8SnVDVPA45GnYCwfS2Gj/tGOYAEEbE2XxgXL9OmhNnlXIzQf1
         FVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iejRpG5xmG3AVT59k2korzV+i4h+JxFeIQ6F9nhVYVE=;
        b=A28UMkuSAr+vZtMUz16xro++Gs048+ZuSn6vlEglLtUd63aTFdVx/gGHEnRrYsM88X
         f+WKBTMc9PQ/X4SXiGYclxOScrEePHRvOfmTD/GruhLPCa3ROyP1RRplcSY88LPvPS8o
         IvS2UsAiwh1N0KBklqgrgGEf7LYMoCcQ/6Bdrm+P64homeb6Z+zeBVgtRSrzecn6JmgK
         jA6i/U83dzTrL6f5ohVT1mqlaYBP/EKntZBiP1q3MLdb5J4AJKMOOoqxd70P35fyOpUL
         sbxnZV8Z8IsWX03xfdctFguGSNkt5LN2itsAIaCEIL8jJ3L9St4KycDMoVZxguneN5j3
         ZuOA==
X-Gm-Message-State: ANoB5pm1uZJ2ldCHQ03zFLhGHrqxzOxeTEX+KeEkKYsVGnjpXC/dR1ND
	772+XX9ykqCKdM5P41gc4As=
X-Google-Smtp-Source: AA0mqf5NEgw8nrH93u2bY10c05fdm/Tx+wCnuYxy3cVf0cNE/5kLDJeWbVYnyzre7ISbHsO3k7PUGQ==
X-Received: by 2002:adf:e84f:0:b0:22e:37c1:b225 with SMTP id d15-20020adfe84f000000b0022e37c1b225mr13795647wrn.428.1669132130446;
        Tue, 22 Nov 2022 07:48:50 -0800 (PST)
Received: from [192.168.0.25] ([37.222.251.204])
        by smtp.gmail.com with ESMTPSA id f28-20020a5d58fc000000b0022e36c1113fsm14161625wrd.13.2022.11.22.07.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 07:48:48 -0800 (PST)
Message-ID: <a5464d62-bb42-5bdf-e49e-5c3edef4b09b@gmail.com>
Date: Tue, 22 Nov 2022 16:48:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v28 01/11] dt-bindings: arm: mediatek: mmsys: add vdosys1
 compatible for MT8195
Content-Language: en-US
To: =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "nathan@kernel.org" <nathan@kernel.org>,
 =?UTF-8?B?WW9uZ3FpYW5nIE5pdSAo54mb5rC45by6KQ==?=
 <yongqiang.niu@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "airlied@linux.ie"
 <airlied@linux.ie>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "ndesaulniers@google.com" <ndesaulniers@google.com>
References: <20221107072243.15748-1-nancy.lin@mediatek.com>
 <20221107072243.15748-2-nancy.lin@mediatek.com>
 <c6297a1c-e282-4a18-f16c-fa2df08b440a@gmail.com>
 <f6d7eaa0b7e2a3ed6567692616ebc1304500806c.camel@mediatek.com>
 <fd6c1299-4ac9-6d51-247f-3a7b7e39052b@gmail.com>
 <de21390898759ce979da8d2ae76a93982f59c149.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <de21390898759ce979da8d2ae76a93982f59c149.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_074855_104675_59965B20 
X-CRM114-Status: GOOD (  30.80  )
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



On 22/11/2022 11:51, Nancy Lin (林欣螢) wrote:
> Dear Matthias,
> 
> Thanks for the review.
> 
> On Thu, 2022-11-10 at 14:10 +0100, Matthias Brugger wrote:
>> 
>> On 09/11/2022 06:10, Jason-JH Lin (林睿祥) wrote:
>> > On Tue, 2022-11-08 at 18:46 +0100, Matthias Brugger wrote:
>> > > 
>> > > On 07/11/2022 08:22, Nancy.Lin wrote:
>> > > > Add vdosys1 mmsys compatible for MT8195 platform.
>> > > > 
>> > > > For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines
>> > > > binding
>> > > > to
>> > > > 2 different power domains, different clock drivers and
>> > > > different
>> > > > mediatek-drm drivers.
>> > > > 
>> > > > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
>> > > > Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>> > > > ---
>> > > >  
>> > > > .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml      |
>> > > > 4
>> > > > +++-
>> > > >   1 file changed, 3 insertions(+), 1 deletion(-)
>> > > > 
>> > > > diff --git
>> > > > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys
>> > > > .yam
>> > > > l
>> > > > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys
>> > > > .yam
>> > > > l
>> > > > index 0711f1834fbd..aaabe2196185 100644
>> > > > ---
>> > > > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys
>> > > > .yam
>> > > > l
>> > > > +++
>> > > > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys
>> > > > .yam
>> > > > l
>> > > > @@ -48,7 +48,9 @@ properties:
>> > > >             - const: syscon
>> > > >   
>> > > >         - items:
>> > > > -          - const: mediatek,mt8195-vdosys0
>> > > > +          - enum:
>> > > > +              - mediatek,mt8195-vdosys0
>> > > > +              - mediatek,mt8195-vdosys1
>> > > >             - const: mediatek,mt8195-mmsys
>> > > >             - const: syscon
>> > > >   
>> > > 
>> > > I think we had that several times already:
>> > > 
>> > 
>> > 
> https://lore.kernel.org/all/6bbe9527-ae48-30e0-fb45-519223a744d7@linaro.org/
>> > > 
>> > > We will something like this, but please check that this does not
>> > > give
>> > > any 
>> > > errors/warnings:
>> > > 
>> > > diff --git
>> > > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.y
>> > > aml 
>> > > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.y
>> > > aml
>> > > index eb451bec23d3d..8e9c4f4d7c389 100644
>> > > ---
>> > > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.y
>> > > aml
>> > > +++
>> > > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.y
>> > > aml
>> > > @@ -32,13 +32,22 @@ properties:
>> > >                 - mediatek,mt8183-mmsys
>> > >                 - mediatek,mt8186-mmsys
>> > >                 - mediatek,mt8192-mmsys
>> > > -              - mediatek,mt8195-mmsys
>> > >                 - mediatek,mt8365-mmsys
>> > >             - const: syscon
>> > >         - items:
>> > >             - const: mediatek,mt7623-mmsys
>> > >             - const: mediatek,mt2701-mmsys
>> > >             - const: syscon
>> > > +      - items:
>> > > +          - const: mediatek,mt8195-vdosys0
>> > > +          - const: syscon
>> > > +      - items:
>> > > +          - const: mediatek,mt8195-vdosys1
>> > > +          - const: syscon
>> > > +      - items:
>> > > +          - const: mediatek,mt8195-mmsys
>> > > +          - const: syscon
>> > > +      deprecated: true
>> > > 
>> > >     reg:
>> > >       maxItems: 1
>> > 
>> > Hi Matthias,
>> > 
>> > As the vdosys0 previous reviewed patch:
>> > 
>> > 
> https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20220927152704.12018-2-jason-jh.lin@mediatek.com/__;!!CTRNKA9wMg0ARbw!zRdbIyyAsfqob2kapMAcKYATAguhEV0x0qE5cTOAcWUNhzeAbMHzZoos_2QzUCxS$
>> >  
>> > Should I modify the vdosys0 items format like your example?
>> > 
>> > Or should vdosys1 add items format like vdosys0's previous patch?
>> >      - items:
>> >          - const: mediatek,mt8195-vdosys1
>> >          - const: mediatek,mt8195-mmsys
>> >          - const: syscon
>> > 
>> 
>> No, vdosys1 must not have mediatek,mt8195-mmsys fallback.
>> 
>> Regards,
>> Matthias
>> 
> 
> I will fix it and add the following vdosys1 binding base on [1].
> 
>        - description: vdosys0 and vdosys1 are 2 display HW pipelines,
>                       so mt8195 binding should be deprecated.
>          deprecated: true
>          items:
>            - const: mediatek,mt8195-mmsys
>            - const: syscon
>        - items:
>            - const: mediatek,mt7623-mmsys
>            - const: mediatek,mt2701-mmsys
>            - const: syscon
>        - items:
>            - const: mediatek,mt8195-vdosys0
>            - const: mediatek,mt8195-mmsys
>            - const: syscon
>   +    - items:
>   +        - const: mediatek,mt8195-vdosys1
>   +        - const: syscon
> 

Looks good, thanks
Matthias

> [1]
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/matthias.bgg/linux/+/b237efd47df7d25b78c306e90b97c5aa0ff4c4fc/Documentation/devicetree/bindings/arm/mediatek/mediatek%2Cmmsys.yaml
> 
> Regards,
> Nancy
> 
> 
>> > Regards,
>> > Jason-JH.Lin
>> > 
>> > 
>> > 
>> > ************* MEDIATEK Confidentiality Notice
>> >   ********************
>> > The information contained in this e-mail message (including any
>> > attachments) may be confidential, proprietary, privileged, or
>> > otherwise
>> > exempt from disclosure under applicable laws. It is intended to be
>> > conveyed only to the designated recipient(s). Any use,
>> > dissemination,
>> > distribution, printing, retaining or copying of this e-mail
>> > (including its
>> > attachments) by unintended recipient(s) is strictly prohibited and
>> > may
>> > be unlawful. If you are not an intended recipient of this e-mail,
>> > or believe
>> >   
>> > that you have received this e-mail in error, please notify the
>> > sender
>> > immediately (by replying to this e-mail), delete any and all copies
>> > of
>> > this e-mail (including any attachments) from your system, and do
>> > not
>> > disclose the content of this e-mail to any other person. Thank you!
>> 
>> 
> 
> ************* MEDIATEK Confidentiality Notice ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including its
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or believe
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!

