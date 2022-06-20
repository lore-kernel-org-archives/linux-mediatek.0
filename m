Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2325C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jun 2022 08:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rvDozfpUth1u46mvzNNqlITVPQfdrkhSHQIaeMfchFw=; b=M7hR1f9c7YA+AT2YcgDcdpoWBJ
	3H0CSh4iT4DebDNRFzQgOi59PySnzrqq6wRAzaHGAN9cGBS6AP7GWqej6JkJwK5SLAgNwlOzUbL2K
	cqm8Pv8tgw09H9Ojj1CstLyhWnLX1bxh2mXXYQb6hrduLC3dgJoinODtv4P7+4mzIQCUOzxhAksuq
	jeDTRjXfnHbOUzvJtuItncl70iOzDVTSUKwZlIW97uAADSfi0LxWgzlYmTLQzJhe34MtUAGr8Sgqv
	imk9rPV9p8qsf7xX6boxkgbM9BhsWwNlzVvOfsvKxh7FHa8MJV0asAwG8kAvUUwvMan9wc/1soUBr
	/c4MrjVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3D8g-00H0h2-Sk; Mon, 20 Jun 2022 08:52:06 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3D8d-00H0bM-7S
	for linux-mediatek@lists.infradead.org; Mon, 20 Jun 2022 08:52:04 +0000
Received: by mail-ej1-x633.google.com with SMTP id g25so19662201ejh.9
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Jun 2022 01:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=rvDozfpUth1u46mvzNNqlITVPQfdrkhSHQIaeMfchFw=;
        b=C3NCc0tF7vEHhwoLV0fuSwQQIdJuEh+/1DuVypXeKHJnwkCcSHrmhXUgIbDi/L9BLi
         8Orf+wD6b2kDhmDd9Nx4V2N6lIibh6/j96lUI/QRAYTmmnA+ouosoTOPn3KBFbMgXlfE
         XLC8aHRK8eGaWHD3rzsEYVpnB0K0vQ5WEQZkaL3Xk/0/2QwFJnsZFAHCvg4uWUMWK1WY
         dMrBZ0Q8zegFPHU+iguKm6Zl2sREi1gowFLvAHmsBBpeMJJwPizzSETXOKDjHsvSozKV
         5l5gDPUqzvCLt66o1728YU9XUBBUN0SX5eZk9pkk/NbjN68tygMCwaPF0mTY4OhK37Uw
         PVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rvDozfpUth1u46mvzNNqlITVPQfdrkhSHQIaeMfchFw=;
        b=HvNkc+1pP9iiVRJnVpcqwda6scIphS8j3rhGmt1rezcvp7vGM48ItUMs5J7craXgto
         DndcRpLrayINBOEAufwJav2WyXqDESoB2GPI9HvWGgGjttRg8z7jIQMYaN+Qey28/ExQ
         cTyP7HXB2y1cPa8d7EkUES/6WdOxW+Vg/1B6QZctP56i3eoY4E0B6rd9slXzApcq+icN
         PnEBiJYfg8gPzZoKAD65Wo+luCsA6DQ1rPGUGHPiqU84g8LpJab8TvJ+MzUErO+bC+5O
         0UtY0v/oGbUPvwOlTq4Zl3sHnLqdQ8N6yUe7n6YkVWYZX/fIuEFPKoupsouj0dObZu7a
         NlzQ==
X-Gm-Message-State: AJIora89tVC5Ya6LATyvgJLw2VG05QPONQIH0n/Q7z0+cF3aB+y+Tt2t
	O+4ckW+9ILZNtYNkUzJaOXr7SA==
X-Google-Smtp-Source: AGRyM1vosA5HJnj8GWCVoK53xdzGqpfYGN+DOWudxrPO+Dwn2p+1IKeZuKxi1oeqArmKrujW/Cs3og==
X-Received: by 2002:a17:906:d550:b0:704:ae79:7db1 with SMTP id cr16-20020a170906d55000b00704ae797db1mr19958640ejc.478.1655715117980;
        Mon, 20 Jun 2022 01:51:57 -0700 (PDT)
Received: from [192.168.0.207] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id a24-20020aa7cf18000000b004356c18b2b9sm5577856edy.44.2022.06.20.01.51.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 01:51:57 -0700 (PDT)
Message-ID: <3830efc5-298d-7887-5718-2cb2a7ad4895@linaro.org>
Date: Mon, 20 Jun 2022 10:51:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 1/4] dt-bindings: dsp: mediatek: Use meaningful names
 for mbox
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 YC Hung <yc.hung@mediatek.com>, Curtis Malainey <cujomalainey@chromium.org>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220616073042.13229-1-tinghan.shen@mediatek.com>
 <20220616073042.13229-2-tinghan.shen@mediatek.com>
 <629e761b-e3ad-0861-1937-ad660a8a900b@linaro.org>
 <af32751dd7013a96dac5d165c35e132fda87f2ac.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <af32751dd7013a96dac5d165c35e132fda87f2ac.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_015203_330707_E9027BD3 
X-CRM114-Status: GOOD (  14.72  )
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

On 20/06/2022 08:40, Tinghan Shen wrote:
> Hi Krzysztof,
> 
> On Thu, 2022-06-16 at 06:55 -0700, Krzysztof Kozlowski wrote:
>> On 16/06/2022 00:30, Tinghan Shen wrote:
>>> Rename mbox according to actions instead of 'mbox0' and 'mbox1'.
>>>
>>> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
>>> ---
>>>  .../devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml   | 10 +++++-----
>>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
>>> b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
>>> index b7e68b0dfa13..ca8d8661f872 100644
>>> --- a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
>>> +++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
>>> @@ -50,13 +50,13 @@ properties:
>>>  
>>>    mboxes:
>>>      items:
>>> -      - description: ipc reply between host and audio DSP.
>>> -      - description: ipc request between host and audio DSP.
>>> +      - description: mailbox for receiving audio DSP requests.
>>> +      - description: mailbox for transmitting requests to audio DSP.
>>>  
>>>    mbox-names:
>>>      items:
>>> -      - const: mbox0
>>> -      - const: mbox1
>>> +      - const: rx
>>> +      - const: tx
>>>  
>>
>> Commit msg lacks important piece - do you break any users with this? Do
>> you have any users of this binding?
>>
>>
>> Best regards,
>> Krzysztof
> 
> The 8195 dsp node, which uses this binding, has not yet been added to the 8195 devicetree.

Could you mention it in the commit msg? Such one sentence is enough.

With commit msg extended:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

