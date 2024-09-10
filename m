Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE78BECE564
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Sep 2024 08:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=COZawt3UlZzAincu0cuJv2dZKQF6NSD6iWK0Nr6gDqQ=; b=IwOv/DBsk14JYrdPaMYhlUa0lN
	s/CKA2N9aQN9V5uk41FdxezCIj4veX2EiGs++AyRU8beNOEOPJvvBBrKfZ52bzFxl+xqbGMwzi1u1
	D/vtX2eLdE+orLg/j3sNGwrlJ/fC04dj6QldCI1O6BFPZLP327ntngMbynLyUNqolX5zoo4HyiXgZ
	MyZw8eIxMYG7pWTZimeGydyfggC3IhD/q2biVjefsvSlFdsa2OZoX9dBtFqbk6MD20CAtKdDAuMDC
	H+9e/QqyIBDqX8fCPBwpK3T3DTWm5tBAZTnYQ+4KNu4O3tQ4Mco/ecAGGwdsaF6bVE+w+f1bFhIWW
	6s+T/oBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snvw6-00000004k2n-1P9f;
	Tue, 10 Sep 2024 08:09:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snvva-00000004jxl-3yEJ;
	Tue, 10 Sep 2024 08:08:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=COZawt3UlZzAincu0cuJv2dZKQF6NSD6iWK0Nr6gDqQ=; b=iby5I3SWv2EURU7a35KORGaex1
	aGjlDqG93t30po6AT29KcXWjyAwrTV45dNaauhjlp/3TsySuSI6t3dmclZ+ajjbCxS7v4ZuM9Sm/M
	Ot0qCo87ZR3kpnRpRRFB3+dUWWB1oR5eB3c2r/tGxN5FL6p5Uilu9c7sY9du+4+qn8DmYHwZOOtkW
	9CdAO8h/wLz4HODobz+tzr230n3jzT+CiklxqobztIjJ18Qxf+WAfYjGq5bywPA8oiIpRKyEzfIVw
	UgrGYq+o8Vl4WF8WUYO47r1mmNC/FqNp+Yz7adQzhN16scDpFLNqghCT5rEK/OZI/6qa5MstYYODC
	y5M/5EXQ==;
Received: from a7-44.smtp-out.eu-west-1.amazonses.com ([54.240.7.44])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1snvvX-00000000hws-3xtw;
	Tue, 10 Sep 2024 08:08:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725955720;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=CMzM2OmUAjHBG7xyXlb5CqeG7AYsJx3XrH0ReYN+K80=;
	b=P6+nbddx9e8GQe8AEJCW5t1Wu7f5l0l96bnP+ujVgcAgIROuRWvJIdBhySUQsOtw
	j7Lt8UqBZNfztPGgr2ARPCEnl56LBm9jkfZf0QVfToehnx62GnGlNRMErQ+ChNLBb4Z
	r2GGVsh0pt3C//K7D2A6oQuCNUMNRSSF/Y65xC2lWU6p7bUmjbMiaq2iLsXx7oOVKOV
	I95MP0BzEtmWEcJQG134t3/sHo5NuSb3dODZ0MyM2H1QE/JpGjQmDxicFxhZNED7pR+
	aEL7JGQC1PCW1LWMH5FtGsZjq/xJ6X8hrh9SbVIkDmgqXdiae8NqFmflFz4f1lyifQv
	2ZI1Aee8lA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725955720;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=CMzM2OmUAjHBG7xyXlb5CqeG7AYsJx3XrH0ReYN+K80=;
	b=MSdY733JFvyqSrkXqPdO6T2dgUOs8csMz301DyjJ3BBiuHbsC/UDV8fx4LaXZQae
	oY+V2/L9RO7BgNdUoLzsEsTCawwLhgru3Q4yqIi4sL3zoBjs3KA5BjJm/se1Ny4FoA7
	1ZmGsBhP2uozcYc/b6rxC2EQEW0DD71Dfujeh9cc=
Message-ID: <01020191dafa43a8-cca2fb3f-7eda-4e39-9ca1-eccb78c566a4-000000@eu-west-1.amazonses.com>
Date: Tue, 10 Sep 2024 08:08:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] dt-bindings: display: mediatek: Add OF graph
 support for board path
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"sui.jingfeng@linux.dev" <sui.jingfeng@linux.dev>, 
	"wenst@chromium.org" <wenst@chromium.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"tzimmermann@suse.de" <tzimmermann@suse.de>, 
	=?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>, 
	"mripard@kernel.org" <mripard@kernel.org>, 
	=?UTF-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>, 
	"michael@walle.cc" <michael@walle.cc>, 
	"daniel@ffwll.ch" <daniel@ffwll.ch>, 
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
	"robh@kernel.org" <robh@kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"airlied@gmail.com" <airlied@gmail.com>, 
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, 
	"kernel@collabora.com" <kernel@collabora.com>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	=?UTF-8?B?WXUtY2hhbmcgTGVlICjmnY7nprnnkosp?= <Yu-chang.Lee@mediatek.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"amergnat@baylibre.com" <amergnat@baylibre.com>
References: <20240618101726.110416-1-angelogioacchino.delregno@collabora.com>
 <20240618101726.110416-2-angelogioacchino.delregno@collabora.com>
 <3e58a224e6323e28c370d460fa72e23b958bcf62.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <3e58a224e6323e28c370d460fa72e23b958bcf62.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.10-54.240.7.44
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_090844_118449_F6711BC4 
X-CRM114-Status: GOOD (  17.66  )
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

Il 08/08/24 05:45, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Tue, 2024-06-18 at 12:17 +0200, AngeloGioacchino Del Regno wrote:
>> The display IPs in MediaTek SoCs support being interconnected with
>> different instances of DDP IPs (for example, merge0 or merge1) and/or
>> with different DDP IPs (for example, rdma can be connected with either
>> color, dpi, dsi, merge, etc), forming a full Display Data Path that
>> ends with an actual display.
>>
>> The final display pipeline is effectively board specific, as it does
>> depend on the display that is attached to it, and eventually on the
>> sensors supported by the board (for example, Adaptive Ambient Light
>> would need an Ambient Light Sensor, otherwise it's pointless!), other
>> than the output type.
>>
>> Add support for OF graphs to most of the MediaTek DDP (display) bindings
>> to add flexibility to build custom hardware paths, hence enabling board
>> specific configuration of the display pipeline and allowing to finally
>> migrate away from using hardcoded paths.
>>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
>> Tested-by: Alexandre Mergnat <amergnat@baylibre.com>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
> 
> [snip]
> 
>>   
>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
>> index 677882348ede..98db47894eeb 100644
>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
>> @@ -110,6 +110,28 @@ properties:
>>         include/dt-bindings/gce/<chip>-gce.h, mapping to the register of display
>>         function block.
>>   
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +    description:
>> +      Input and output ports can have multiple endpoints, each of those
>> +      connects to either the primary, secondary, etc, display pipeline.
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: ETHDR input, usually from one of the MERGE blocks.
> 
> Sorry, I find one question now.
> I think ETHDR may have multiple input, and ETHDR receive data from all input at the same time.
> Why here has only one input port?
> 
> MERGE -->+-----------------+
>           |                 |
> MERGE -->|                 |
>           |      ETHDR      |
> MERGE -->|                 |
>           |                 |
> MERGE -->+-----------------+
> 

Because ETHDR takes one input (ex. "one image", or "one data stream") port, which
is composed of multiple input endpoints (where each endpoint is a MERGE block) :-)

Cheers,
Angelo

> Regards,
> CK
> 
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description:
>> +          ETHDR output to the input of the next desired component in the
>> +          display pipeline, for example one of the available MERGE blocks,
>> +          or others.
>> +
>> +    required:
>> +      - port@0
>> +      - port@1
>> +
>>   required:
>>     - compatible
>>     - reg
>>


