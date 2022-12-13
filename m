Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFB5C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Dec 2022 13:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pgDRSp/f16xzmWzxjmFxCL6xZadwIS7cOwIn0PxoaZk=; b=aZT3Es0PRasrhA0jxcK7b7nCDC
	hiRpraBCze7PzBy5d9CoCFvaebpO4pQ91Gnrte7sCScFDp0Kwf33wKlJfM0sOUQLJxqvOGhpBs2yi
	/h6aNMjgxpkgc6y9JoDGk4STSPsseAJDZw0Tj3CHBCDgrLnbf05S33bpRxzww6Fk4Ass4LPtRMbWM
	XJFc7PGZUS8QjfOxgTv5maUhpN8+XaAEjIXZSeMQGabkltraL9ZsHvvCnbf3+cS2htw+DkEZD+nUy
	Ya86uqa1czLDPqfYMDosRbL3+9kObBo3ConHV4LsBJLyqHU7wjRPB3szU3gVDCqupV/mj109AC7e/
	fa6K5utg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p55TO-000Vwk-B5; Tue, 13 Dec 2022 13:37:30 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p55TK-000VtL-Nk
	for linux-mediatek@lists.infradead.org; Tue, 13 Dec 2022 13:37:28 +0000
Received: by mail-lf1-x12b.google.com with SMTP id z26so4918139lfu.8
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Dec 2022 05:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pgDRSp/f16xzmWzxjmFxCL6xZadwIS7cOwIn0PxoaZk=;
        b=fCRVoT/qejeKPXkjsA03s0w3u8M3gNLb5e6NMC9zTJZh8WllhV/TonZ0p+3rj3UJwl
         4N3uARm5ptBQhQGA9mxpDUKejEfnp4HKyMm2szoY7sA+fc79jiG5GgAWdkpPwuApVgzV
         /araw8sN0023f+0ZsNhTVzIyeEKSpzcXVzCBGawQP6wY7kLUolzLMLHKjRY50jqHgtLC
         OCJKvognIPibkDtuO11IdTh9WMgg26DHle3iYXpxWf24OndKLPQzPAHPWVfpwCjgbds/
         6uQkn6rC5HWN3W8qiR7c+7gvWlv2xShB02Pv6bO70dPKz3VGN3fpSfZ0FZka+PmORwWh
         snAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pgDRSp/f16xzmWzxjmFxCL6xZadwIS7cOwIn0PxoaZk=;
        b=Rx/TrN4z2hlQi5CIi50uKy1baN1frjCvIVTFuvQFs2fEBbVeupDl3uHUc9ejN62np3
         gd09pdJAiuipu6U1L5c0ETwewRtOIxB1i5l2e/4320URk1+gHGmr5gVGxITJJb1p0nwM
         O/pmStUtOrYhgNem7jBPJUEmS5BhcqLMp70SRoE18+oHM6XbKkB94qUZosIbIU4WgbSL
         /KIFz2i4SoDcE107BISu2WKPQ4gWbgjPSxWKWvlHSph0CL9znOVVqrVmjojwiUcIpRIo
         PoB9QUD2J8tLn0BI5fQZxVScMYFw0uekJiThaeVnLrHFtWgG+tPky2OmU378txit2AmD
         ZR2w==
X-Gm-Message-State: ANoB5pn2GhpJw32RUHS8XoOByx8G95mwq2YjD6uQ3CVSDHuxUdPUmGUN
	TA0DX/0oefZ5EwBT+ayy0WjT6A==
X-Google-Smtp-Source: AA0mqf6TyCH12rWSC74gVlzA99xf93VjcY1KeD9BJiNKIo2LXA9ZiCDDJIhBIEGVDjJd/nSfcI89dQ==
X-Received: by 2002:a05:6512:3e06:b0:4b5:9bfa:801a with SMTP id i6-20020a0565123e0600b004b59bfa801amr6392757lfv.46.1670938644846;
        Tue, 13 Dec 2022 05:37:24 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id 3-20020ac25f03000000b004b700ba3cf3sm127631lfq.203.2022.12.13.05.37.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 05:37:24 -0800 (PST)
Message-ID: <769dbb36-2223-91a3-0d6b-e23304827c43@linaro.org>
Date: Tue, 13 Dec 2022 14:37:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 12/12] dt-bindings: mediatek: mt8188: add mt8188-mt6359
 document
Content-Language: en-US
To: =?UTF-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com"
 <lgirdwood@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20221208033148.21866-1-trevor.wu@mediatek.com>
 <20221208033148.21866-13-trevor.wu@mediatek.com>
 <6350def8-bb1f-8aeb-4c98-4d02a4c59aed@linaro.org>
 <aeb2bbac8ad5ede2396408a20ff8c8942029451a.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <aeb2bbac8ad5ede2396408a20ff8c8942029451a.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_053727_193333_77F219EC 
X-CRM114-Status: GOOD (  25.33  )
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

On 12/12/2022 16:34, Trevor Wu (吳文良) wrote:
> On Fri, 2022-12-09 at 11:18 +0100, Krzysztof Kozlowski wrote:
>> On 08/12/2022 04:31, Trevor Wu wrote:
>>> Add document for mt8188 board with mt6359.
>>>
>>> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
>>> ---
>>>  .../bindings/sound/mt8188-mt6359.yaml         | 60
>>> +++++++++++++++++++
>>>  1 file changed, 60 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/sound/mt8188-
>>> mt6359.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/sound/mt8188-
>>> mt6359.yaml b/Documentation/devicetree/bindings/sound/mt8188-
>>> mt6359.yaml
>>> new file mode 100644
>>> index 000000000000..eac1c87b693a
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/sound/mt8188-mt6359.yaml
>>
>> Missing vendor prefix. You got comments for it already.
> Hi Krzysztof,
> 
> I will correct it in V4.
> 
>>
>>> @@ -0,0 +1,60 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: 
>>> https://urldefense.com/v3/__http://devicetree.org/schemas/sound/mt8188-mt6359.yaml*__;Iw!!CTRNKA9wMg0ARbw!nw_OzBIRlXrEP6K_EtxEWAIZzuvnD3Dm_KDuv8gpLRqlnnSfVLksNfKqMmeYiFlEVVy6F2BXwmXB8oQkDPeBuEXMtfLX2w$ 
>>>  
>>> +$schema: 
>>> https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!nw_OzBIRlXrEP6K_EtxEWAIZzuvnD3Dm_KDuv8gpLRqlnnSfVLksNfKqMmeYiFlEVVy6F2BXwmXB8oQkDPeBuEXodFoCJA$ 
>>>  
>>> +
>>> +title: MediaTek MT8188 ASoC sound card
>>> +
>>> +maintainers:
>>> +  - Trevor Wu <trevor.wu@mediatek.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: mediatek,mt8188-mt6359-evb
>>> +
>>> +  model:
>>> +    $ref: /schemas/types.yaml#/definitions/string
>>> +    description: User specified audio sound card name
>>> +
>>> +  audio-routing:
>>> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
>>> +    description:
>>> +      A list of the connections between audio components. Each
>>> entry is a
>>> +      sink/source pair of strings. Valid names could be the input
>>> or output
>>> +      widgets of audio components, power supplies, MicBias of
>>> codec and the
>>> +      software switch.
>>> +
>>> +  mediatek,platform:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description: The phandle of MT8188 ASoC platform.
>>> +
>>> +  mediatek,dptx-codec:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description: The phandle of MT8188 Display Port Tx codec node.
>>> +
>>> +  mediatek,hdmi-codec:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description: The phandle of MT8188 HDMI codec node.
>>
>> Why you do not use DAI links for all these?
> 
> Are the following examples "DAI links" you mean?
> 
> hdmi-dai-link {
>             link-name = "HDMI Playback";
>             cpu {
>                 sound-dai = <&q6afedai TERTIARY_MI2S_RX>;
>             };
> 
>             platform {
>                 sound-dai = <&q6routing>;
>             };
> 
>             codec {
>                 sound-dai = <&lt9611_codec 0>;
>             };
>         };

Yes, this one. I think this is preferred. But anyway the point is to use
sound-dai-cells, not pure (non-DAI) phandles).

> 
> or
> 
> headset-codec {
> 		sound-dai = <&rt5682s>;
> };
> 
> 
> As far as I know, only "mediatek,platform" was used at the beginning.
> Next, hdmi-codec was introduced, and it followed the same style to get
> phandle. Finally, it became three properties in mt8195, and the
> implementation of mt8188 was inherited from mt8195.

OK, if you share common code it is fine.
> 
> I just glanced over the usage of dai links.
> As I see it, I will replace the codec parts with dai link structure
> like the example above first. It seems to be easier to extend more
> codecs with the same tyle.

Would be good.

> 
> For platform part, I need more time to check if it is better to keep
> the original implementation, because we still have to take SOF related 
> implementation into consideration.

OK


Best regards,
Krzysztof


