Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770CFC61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Mar 2023 07:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=15UYhlhz1IXSQqcZGCs4zzHqQAACKYlRVryD8U2iAvc=; b=O7e5fOVhC+9Ui8nSUQIKhCbeR2
	nYvZrE22MVz5nnRCB6rICyUoj+I0MeJJEX+T+6nHndzA7KCOrWl683+d1j0LZj8u2yDUM+mEHtwjW
	IsMum4Axyuv+Qx3rTUqGjTEyPCsFZjbIBCaPlpzV+0mobw7YWt4NDiROJIl1ORcp4XQkcaC0Oko9x
	82wkM4lxe/Ylscv9e1hamdXtCrNCivmNccxid7Rhig/Osds08lkc2GZxGjLeYSDzUlB+bkS/tvM/Y
	OohMnmigWP7VCiHay1zi9Da2zAjXoXJlSe4GH1i7oA6OlCPjBKUdjrwdyo0JUsPnwjbT2tajyMxkB
	hdQBNNAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcLNA-00Cd8n-0D;
	Wed, 15 Mar 2023 07:16:32 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcLN6-00Cd7m-0D
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Mar 2023 07:16:30 +0000
Received: by mail-ed1-x534.google.com with SMTP id cy23so71534630edb.12
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Mar 2023 00:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678864586;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=15UYhlhz1IXSQqcZGCs4zzHqQAACKYlRVryD8U2iAvc=;
        b=iJGj0anLJQkuJMX4vMtkDO26mqykPTiqpS9NWhtdw2gyZxN5hMBZJiWyeJoM0tTSrC
         zlK2ApSWx8RpxH+0C+1moEh7djeyr+ie0jm+zay4Oujr/P8EDRl/guD/K0e+qbZY47Kt
         s4viZh8F8vShYfQDEx5IXsu9EfdExiWDh1xscFGQx5uv7MgtZIvXM8bGspf6CWOLRCyn
         ZeBs3MLk39+m19oqBfMQNv4/IS3w8siPnKHoBMTCxKSKLt4q2cyAYPoJVcwExH9XoIKJ
         AKKQEMSBRSYmncs5DmEpzH3Z2ENBnmamY+JtbBKZfEckwsOhm/EHNXDca8LScpNuGD9y
         2Evw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678864586;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=15UYhlhz1IXSQqcZGCs4zzHqQAACKYlRVryD8U2iAvc=;
        b=W+3U+dnlvMBppvH+YfBGgiC5E9FjekwR+t96WbJfSOCAM/BfJRX+oS5MrJ1zvzw9gy
         BOaAKbCiKCW1xXE3aoW+mWBq0XA/dKhx7SeShuiw6yJlTEGv33J/74jkq7xSpjOrJ5Da
         rUSwoHkKebM1oSNZigPySMoFK7gk+19YZtyHFGNT+C4j29yM/smMkQmxaBg3+NejRfSX
         k6sqJB75oukkHuonQWBvNjrZ5ZTowoRJ8QoNDxL+kjsJwv4W2Ydfx+Y7+tMhfks86XYf
         soZ3Vwgr1yUiNZBEq168p9SISC9Uf5kVcBzDslIjaTfuBbJC4JWxZm/B6gGCgu839tWd
         X8ow==
X-Gm-Message-State: AO0yUKWiktR3LXVGFYaNMfrR+Joue2DhQxj7MSLlD++BHQalb4jy1cM2
	vrpm6g9kWikCa3x3L8bzyVM2Qw==
X-Google-Smtp-Source: AK7set/MhHrEStcc+CxV1ZdoTopYFKMl0VHdR7lOekmtggRtHS1J1cAYKNfERbssDeuOYmFJnClbOQ==
X-Received: by 2002:a17:906:b7d8:b0:927:d9ad:804d with SMTP id fy24-20020a170906b7d800b00927d9ad804dmr5539572ejb.7.1678864586285;
        Wed, 15 Mar 2023 00:16:26 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:940e:8615:37dc:c2bd? ([2a02:810d:15c0:828:940e:8615:37dc:c2bd])
        by smtp.gmail.com with ESMTPSA id v1-20020a50c401000000b004acbda55f6bsm1929246edf.27.2023.03.15.00.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 00:16:25 -0700 (PDT)
Message-ID: <2700bd6c-f00d-fa99-b730-2fcdf89089fa@linaro.org>
Date: Wed, 15 Mar 2023 08:16:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v29 1/7] dt-bindings: mediatek: add ethdr definition for
 mt8195
Content-Language: en-US
To: =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
Cc: "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "nathan@kernel.org" <nathan@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?=
 <ck.hu@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "ndesaulniers@google.com" <ndesaulniers@google.com>
References: <20221227081011.6426-1-nancy.lin@mediatek.com>
 <20221227081011.6426-2-nancy.lin@mediatek.com>
 <4aff6a7a3b606f26ec793192d9c75774276935e0.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4aff6a7a3b606f26ec793192d9c75774276935e0.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_001628_256321_E519899D 
X-CRM114-Status: GOOD (  16.10  )
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

On 15/03/2023 04:45, Nancy Lin (林欣螢) wrote:

Trim the replies and remove unneeded context. You want to get the
attention of other people, not force them to read entire email.

>> +  mediatek,gce-client-reg:>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description: The register of display function block to be set by
>> gce.
>> +      There are 4 arguments in this property, gce node, subsys id,
>> offset and
>> +      register size. The subsys id is defined in the gce header of
>> each chips
>> +      include/dt-bindings/gce/<chip>-gce.h, mapping to the register
>> of display
>> +      function block.
>> +    items:
>> +      items:
>> +        - description: phandle of GCE
>> +        - description: GCE subsys id
>> +        - description: register offset
>> +        - description: register size
>> +    minItems: 7
>> +    maxItems: 7
>> +
> 
> Hi Rob and krzysztof,
> 
> I got the two messages when running dt_binding_check [1]. This binding
> patch was sent previously in [2]. 
> 
> If I remove the following items/minItems/maxItems in the mediatek,gce-
> client property, the two message disappear. I don't know what's wrong
> with the original syntax. Do you have any suggestions for this?
> 
> -    items:
> -      items:
> -        - description: phandle of GCE
> -        - description: GCE subsys id
> -        - description: register offset
> -        - description: register size
> -    minItems: 7
> -    maxItems: 7
> 
> 
> [1].
> Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.examp
> le.dtb
> /proj/mtk19347/cros/src/third_party/kernel/v5.10/Documentation/devicetr
> ee/bindings/display/mediatek/mediatek,ethdr.example.dtb: 
> hdr-engine@1c114000: mediatek,gce-client-reg:0: [4294967295, 7, 16384,
> 4096, 4294967295, 7, 20480, 4096, 4294967295, 7, 28672, 4096,
> 4294967295, 7, 36864, 4096, 4294967295, 7, 40960, 4096, 4294967295, 7,
> 45056, 4096, 4294967295, 7, 49152, 4096] is too long
>         From schema:

This looks like known issue with phandles with variable number of
arguments. Either we add it to the exceptions or just define it in
reduced way like in other cases - only maxItems: 1 without describing items.


Best regards,
Krzysztof


