Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822F1C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Feb 2022 08:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zJrvCj9i9denyDBf51/mU/lmBF4aQllt7MQxEmJZJ2Y=; b=xxsf/8JQKjija4
	EWt+FuVRx9qBQ1wCrPDnIfBEvgS/drSDZP4g0m1IK44qO9/2789ntlHC+9ZJRzey67adeKRazbdG+
	Ne+I8flWlwCLQGqaBBpZjPPT28QupaA3Xkv3n3U9PLcHe72u3D+aqYT7+Nfp+xvQ67u1u/Jx+p/WQ
	G+kvqRFAQE7ax6oPC3665C9CUyY/xdFLKF1lvVX0B1gsO3/0bhXQiotNyCluppSsh/Blg8bO2/bg4
	qxWl6TF+mwtUq3xZ8fjKrnpZOniFCcoh/cNYKXN0V8QDfMLHOs9Q95j0rp8conmTgJtw3x+Z2213x
	98b+iSaurqDkgb+SkLqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI51D-0037Ye-Pt; Thu, 10 Feb 2022 08:41:35 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI50g-0037It-Uu; Thu, 10 Feb 2022 08:41:08 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1F71E1F45FED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644482459;
 bh=dxxB5y7E7AReW2OAClnLIQexw3iKhotkP4SOeOAGdAE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lymY0FiuiysUb7/sSKRGIAg4jthJDb4GiQzlbfekQkSWXBOvc5GXsheGI2D39J1Qi
 k3vPiOsX1+GILO03JWThkAH1dG6l+O2/r5mfnGztJ0BOCm05187+jqRK+CupRNXscf
 8dVNhlmp9hrk5o4Ovl1lidzZFLamLR6CSZwgupmALF+H0sAgSH1XA9hwLQqYRDgzh+
 q0WsnrGIZDrVnlsWpC4OslPfBt9Ww3yFdx067aDeyIWs8l4V+hlIwGYGc5mfb1ossx
 jKqVmmQpyz+sUPAhv1UfvSxb/UCIP2+mkls3Ei8ZXuqiZEcWe8v06niHjVo4uepz4E
 k7FeUraA0G4cg==
Message-ID: <f807c862-d327-5b12-7443-c4fed6e1ef6a@collabora.com>
Date: Thu, 10 Feb 2022 09:40:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2, 1/7] dt-bindings: media: mtk-vcodec: Adds decoder
 dt-bindings for lat soc
Content-Language: en-US
To: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>,
 Rob Herring <robh@kernel.org>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>,
 George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220128035440.24533-1-yunfei.dong@mediatek.com>
 <20220128035440.24533-2-yunfei.dong@mediatek.com>
 <YgQl8CtttQ99+8lB@robh.at.kernel.org>
 <aa72bec2064e25990e1a3641b920cb5528cfccd4.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <aa72bec2064e25990e1a3641b920cb5528cfccd4.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_004103_567212_3443FD7B 
X-CRM114-Status: GOOD (  17.23  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 10/02/22 04:06, yunfei.dong@mediatek.com ha scritto:
> Hi Rob,
> 
> Thanks for your suggestion.
> On Wed, 2022-02-09 at 14:37 -0600, Rob Herring wrote:
>> On Fri, Jan 28, 2022 at 11:54:34AM +0800, Yunfei Dong wrote:
>>> Adds decoder dt-bindings for compatible "mediatek,mtk-vcodec-lat-
>>> soc".
>>
>> What's lat soc? How does this relate to what's already there in this
>> binding.
>>
> lat soc is another hardware, is related with some vdec larb ports.
> Won't be used to decode, but must to write it in dtsi, or hardware
> can't work well.

Hello Yunfei,

as a suggestion, writing the meaning of the "LAT" acronym may also
help to clear some doubts around (please, also do that in the yaml file,
other than the commit description).

Thank you!
Angelo

> 
> Need to enable clock/power/iommus, no interrupt.
>> The subject space is limited, avoid saying the same thing twice
>> (dt-bindings).
>>
> 
> Best Regards,
> Yunfei Dong
>>>
>>> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>>> ---
>>>   .../media/mediatek,vcodec-subdev-decoder.yaml | 49
>>> +++++++++++++++++++
>>>   1 file changed, 49 insertions(+)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-
>>> decoder.yaml
>>> b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-
>>> decoder.yaml
>>> index 6415c9f29130..a3c892338ac0 100644
>>> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-
>>> subdev-decoder.yaml
>>> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-
>>> subdev-decoder.yaml
>>> @@ -189,6 +189,55 @@ patternProperties:
>>>   
>>>       additionalProperties: false
>>>   
>>> +  '^vcodec-lat-soc@[0-9a-f]+$':
>>> +    type: object
>>> +
>>> +    properties:
>>> +      compatible:
>>> +        const: mediatek,mtk-vcodec-lat-soc
>>> +
>>> +      reg:
>>> +        maxItems: 1
>>> +
>>> +      iommus:
>>> +        minItems: 1
>>> +        maxItems: 32
>>> +        description: |
>>> +          List of the hardware port in respective IOMMU block for
>>> current Socs.
>>> +          Refer to bindings/iommu/mediatek,iommu.yaml.
>>> +
>>> +      clocks:
>>> +        maxItems: 5
>>> +
>>> +      clock-names:
>>> +        items:
>>> +          - const: sel
>>> +          - const: soc-vdec
>>> +          - const: soc-lat
>>> +          - const: vdec
>>> +          - const: top
>>> +
>>> +      assigned-clocks:
>>> +        maxItems: 1
>>> +
>>> +      assigned-clock-parents:
>>> +        maxItems: 1
>>> +
>>> +      power-domains:
>>> +        maxItems: 1
>>> +
>>> +    required:
>>> +      - compatible
>>> +      - reg
>>> +      - iommus
>>> +      - clocks
>>> +      - clock-names
>>> +      - assigned-clocks
>>> +      - assigned-clock-parents
>>> +      - power-domains
>>> +
>>> +    additionalProperties: false
>>> +
>>>   required:
>>>     - compatible
>>>     - reg
>>> -- 
>>> 2.25.1
>>>
>>>
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
