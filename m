Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B5CC678D4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 07:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Cc:To:Subject:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Omx5oHf0JnIS1Sef0sR/U5gX7Qg/sqJ2a4muWjko1WQ=; b=YDChQjlH167DX1w9sCiZPtRYU1
	h+V+c4Su8E7IqSuiMxJhNqQYx4OjyMcddbO0tCQacjsaemr0A6YNOk6STKDpRNnPuiAsvUd5ihxIu
	AihAoS3ueyHrPKftPuqNldBVejHtj1VE2a5QorDbhArFJe6nHWtbHAMRbhLa/B3/fzFjF106Gg/e7
	B3dj6kRjPFUVRbSmSe0ofaND4pPEOYkX03H5kON4feO3SjJtaGCwwoE4Z8zUJQgOKTNWJze+H9CxS
	BsUFCHa+NX9egxwkUtso5MaM98CTUJrQkkJs4X8G8Hd+xIA6sMedLou8IS4q/bZKGEy5qxyqYZlsh
	GWyrx8mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY08B-005H2N-EI; Fri, 03 Mar 2023 07:47:07 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY087-005H0v-IY; Fri, 03 Mar 2023 07:47:05 +0000
Received: by mail-ed1-x529.google.com with SMTP id f13so6852792edz.6;
        Thu, 02 Mar 2023 23:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677829621;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Omx5oHf0JnIS1Sef0sR/U5gX7Qg/sqJ2a4muWjko1WQ=;
        b=ozc1VrHETnrLhQtBcnplwt73aiOVOejbuXeswiFjg0HWLRLQOy3gEvhXlzf/FARwmO
         FvUHYQzrNvPMqc2elIVOaZWMmO+L7M9ehaPkcOuXD5zXJ52ZUNogyOQjHr761hsQI8AD
         QrCwlblgvnyRS6ffpq0NUAlQRp9redAtRmyosagwbE+t1uoCzcqh0awzf/NflocnaBv3
         QYhXEIzN2IY4IoRgWCmxr5fpJj8v70caDmMt0pmeDuesVix00uyIyV+EqdCnwIbmvkwE
         a3bmffeIu9eDx7rZAeO4CSuRRWikb8VMaqwpypJ6OmHT+NjNf6gIna6tszLa1z5BUZzg
         ELeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677829621;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Omx5oHf0JnIS1Sef0sR/U5gX7Qg/sqJ2a4muWjko1WQ=;
        b=XvzUmY3k71leoDTG4Ou67ltSoAp50mXHfZWohKC3lRABom0qaBcS5myk5z+UsVmjO1
         fiEWv1kK6iTQmrfrL/ZtL8rF9jboS51XuAjpM2v4TMFoiDgH/ElC4HutONcXcz3Zmkb5
         bk6ZzbGcDShoeny8nOZfWtDyIKFXFYWFEGKw0zdbpuJfvyeEV4w10WH/9J5dkqNavsuU
         pfbSfDzwtAKRw5bVcfe3WBJlSQ/E369DLK3Q8hw4p5zBGCbWCcp84YbFvcdU6280VnMO
         Y9Jeqi9r4YrRE2Cij54Qad2f5YsThgl96VLZ3YeKVfhSrruPdC1d2/miHQnhEjOXUOep
         JkmA==
X-Gm-Message-State: AO0yUKXt8C8vqmiOJctq6rqVXvbPkduoEL6hCiDTIPg71+hI8S2AFWtV
	nW2JcRU0ciwu9YUqvXuhUeU=
X-Google-Smtp-Source: AK7set9P2tOy3fmUEkyPvahxzEgIJcBPccB35rreiCFEC2kbf7LU1iSxpNhOStPDkAOGDwzPoyYmWA==
X-Received: by 2002:aa7:d6c6:0:b0:4af:59c0:d303 with SMTP id x6-20020aa7d6c6000000b004af59c0d303mr1014386edr.26.1677829620883;
        Thu, 02 Mar 2023 23:47:00 -0800 (PST)
Received: from [10.33.2.246] ([95.183.227.97])
        by smtp.gmail.com with ESMTPSA id 19-20020a508e13000000b004acbdf23cd2sm820955edw.29.2023.03.02.23.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 23:47:00 -0800 (PST)
Date: Fri, 03 Mar 2023 10:46:49 +0300
From: Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display: mediatek: Compatible list
 cleanup
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, Yassine Oudjana
	<y.oudjana@protonmail.com>, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Message-Id: <1MPXQR.LIW1MS7NJON23@gmail.com>
In-Reply-To: <0969ff46-3fba-f679-7943-52da7528185a@collabora.com>
References: <20230302141234.169985-1-y.oudjana@protonmail.com>
	<0969ff46-3fba-f679-7943-52da7528185a@collabora.com>
X-Mailer: geary/43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_234703_681078_8B223C71 
X-CRM114-Status: GOOD (  22.14  )
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


On Thu, Mar 2 2023 at 05:08:30 PM +01:00:00, AngeloGioacchino Del Regno 
<angelogioacchino.delregno@collabora.com> wrote:
> Il 02/03/23 15:12, Yassine Oudjana ha scritto:
>> From: Yassine Oudjana <y.oudjana@protonmail.com>
>> 
>> Several DT bindings of MediaTek display blocks make unnecessary use 
>> of
>> "oneOf" and "items". Remove them and replace them with enums where
>> necessary.
>> 
>> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>> ---
>> Changes since v1:
>> - Leave enums with 1 element as they are.
>> 
>>   .../bindings/display/mediatek/mediatek,ccorr.yaml   |  7 +++----
>>   .../bindings/display/mediatek/mediatek,color.yaml   | 10 ++++------
>>   .../bindings/display/mediatek/mediatek,dither.yaml  |  3 +--
>>   .../bindings/display/mediatek/mediatek,dsc.yaml     |  4 +---
>>   .../bindings/display/mediatek/mediatek,gamma.yaml   |  7 +++----
>>   .../bindings/display/mediatek/mediatek,merge.yaml   |  8 +++-----
>>   .../bindings/display/mediatek/mediatek,od.yaml      |  8 +++-----
>>   .../bindings/display/mediatek/mediatek,ovl-2l.yaml  |  7 +++----
>>   .../bindings/display/mediatek/mediatek,ovl.yaml     | 13 
>> +++++--------
>>   .../display/mediatek/mediatek,postmask.yaml         |  3 +--
>>   .../bindings/display/mediatek/mediatek,rdma.yaml    | 13 
>> +++++--------
>>   .../bindings/display/mediatek/mediatek,split.yaml   |  4 +---
>>   .../bindings/display/mediatek/mediatek,ufoe.yaml    |  4 +---
>>   .../bindings/display/mediatek/mediatek,wdma.yaml    |  4 +---
>>   14 files changed, 35 insertions(+), 60 deletions(-)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
>> index b04820c95b22..dc22bd522523 100644
>> --- 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
>> @@ -21,10 +21,9 @@ description: |
>>   properties:
>>     compatible:
>>       oneOf:
>> -      - items:
>> -          - const: mediatek,mt8183-disp-ccorr
>> -      - items:
>> -          - const: mediatek,mt8192-disp-ccorr
>> +      - enum:
>> +          - mediatek,mt8183-disp-ccorr
>> +          - mediatek,mt8192-disp-ccorr
> 
> This change is ok.
> 
>>         - items:
>>             - enum:
>>                 - mediatek,mt8188-disp-ccorr
>> diff --git 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
>> index 62306c88f485..d0ea77fc4b06 100644
>> --- 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
>> @@ -22,12 +22,10 @@ description: |
>>   properties:
>>     compatible:
>>       oneOf:
>> -      - items:
>> -          - const: mediatek,mt2701-disp-color
>> -      - items:
>> -          - const: mediatek,mt8167-disp-color
>> -      - items:
>> -          - const: mediatek,mt8173-disp-color
>> +      - enum:
>> +          - mediatek,mt2701-disp-color
>> +          - mediatek,mt8167-disp-color
>> +          - mediatek,mt8173-disp-color
> 
> OK.
> 
>>         - items:
>>             - enum:
>>                 - mediatek,mt7623-disp-color
>> diff --git 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
>> index 5c7445c174e5..9d74de63fe63 100644
>> --- 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
>> @@ -22,8 +22,7 @@ description: |
>>   properties:
>>     compatible:
>>       oneOf:
>> -      - items:
>> -          - const: mediatek,mt8183-disp-dither
>> +      - const: mediatek,mt8183-disp-dither
> 
> OK.
> 
>>         - items:
>>             - enum:
>>                 - mediatek,mt8186-disp-dither
>> diff --git 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
>> index 49248864514b..37bf6bf4a1ab 100644
>> --- 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
>> @@ -19,9 +19,7 @@ description: |
>>     properties:
>>     compatible:
>> -    oneOf:
>> -      - items:
>> -          - const: mediatek,mt8195-disp-dsc
>> +    const: mediatek,mt8195-disp-dsc
> 
> This will grow, and you'll get devicetree declaring something like:
> 
> compatible = "mediatek,(different-new-chip)-disp-dsc";
> 
> and
> 
> compatible = "mediatek,(current-chip)-disp-dsc", 
> "mediatek,mt8195-disp-dsc";
> 
> Note: Some smartphone SoCs (Dimensity series) do have the same 
> disp-dsc as
> the Chromebook variant MT8195! :-)
> 
>>       reg:
>>       maxItems: 1
>> diff --git 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
>> index a5c6a91fac71..6c2be9d6840b 100644
>> --- 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
>> @@ -21,10 +21,9 @@ description: |
>>   properties:
>>     compatible:
>>       oneOf:
>> -      - items:
>> -          - const: mediatek,mt8173-disp-gamma
>> -      - items:
>> -          - const: mediatek,mt8183-disp-gamma
>> +      - enum:
>> +          - mediatek,mt8173-disp-gamma
>> +          - mediatek,mt8183-disp-gamma
> 
> This change is ok.
> 
>>         - items:
>>             - enum:
>>                 - mediatek,mt8186-disp-gamma
>> diff --git 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
>> index 69ba75777dac..c474ee6fa05b 100644
>> --- 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
>> @@ -20,11 +20,9 @@ description: |
>>     properties:
>>     compatible:
>> -    oneOf:
>> -      - items:
>> -          - const: mediatek,mt8173-disp-merge
>> -      - items:
>> -          - const: mediatek,mt8195-disp-merge
>> +    enum:
>> +      - mediatek,mt8173-disp-merge
>> +      - mediatek,mt8195-disp-merge
> 
> I'm mostly sure that you (yes, you, Yassine) will sooner or later 
> write a
> devicetree node containing the following compatible string on merge0:
> 
> compatible = "mediatek,mt6735-disp-merge", 
> "mediatek,mt8173-disp-merge";
> 
> Am I wrong? :-)

Actually MT6735 doesn't have this block so no, I won't be doing that :)

> 
> In that case, that `oneOf:` will have to return back to this file, so 
> it's
> not worth removing it.
> 
>>       reg:
>>       maxItems: 1
>> diff --git 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
>> index 853fcb9db2be..7e6bbf8b5c60 100644
>> --- 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
>> @@ -20,11 +20,9 @@ description: |
>>     properties:
>>     compatible:
>> -    oneOf:
>> -      - items:
>> -          - const: mediatek,mt2712-disp-od
>> -      - items:
>> -          - const: mediatek,mt8173-disp-od
>> +    enum:
>> +      - mediatek,mt2712-disp-od
>> +      - mediatek,mt8173-disp-od
>> 
> Same story with this one...

It doesn't have this one either.

> 
>>     reg:
>>       maxItems: 1
>> diff --git 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
>> index 4e94f4e947ad..c7dd0ef02dcf 100644
>> --- 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
>> @@ -21,10 +21,9 @@ description: |
>>   properties:
>>     compatible:
>>       oneOf:
>> -      - items:
>> -          - const: mediatek,mt8183-disp-ovl-2l
>> -      - items:
>> -          - const: mediatek,mt8192-disp-ovl-2l
>> +      - enum:
>> +          - mediatek,mt8183-disp-ovl-2l
>> +          - mediatek,mt8192-disp-ovl-2l
> 
> This change is ok.
> 
>>         - items:
>>             - enum:
>>                 - mediatek,mt8186-disp-ovl-2l
>> diff --git 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
>> index 065e526f950e..92e320d54ba2 100644
>> --- 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
>> @@ -21,14 +21,11 @@ description: |
>>   properties:
>>     compatible:
>>       oneOf:
>> -      - items:
>> -          - const: mediatek,mt2701-disp-ovl
>> -      - items:
>> -          - const: mediatek,mt8173-disp-ovl
>> -      - items:
>> -          - const: mediatek,mt8183-disp-ovl
>> -      - items:
>> -          - const: mediatek,mt8192-disp-ovl
>> +      - enum:
>> +          - mediatek,mt2701-disp-ovl
>> +          - mediatek,mt8173-disp-ovl
>> +          - mediatek,mt8183-disp-ovl
>> +          - mediatek,mt8192-disp-ovl
> 
> This is ok too.
> 
>>         - items:
>>             - enum:
>>                 - mediatek,mt7623-disp-ovl
>> diff --git 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
>> index 27de64495401..12ec410bb921 100644
>> --- 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
>> @@ -21,8 +21,7 @@ description: |
>>   properties:
>>     compatible:
>>       oneOf:
>> -      - items:
>> -          - const: mediatek,mt8192-disp-postmask
>> +      - const: mediatek,mt8192-disp-postmask
> 
> Should be fine as well.
> 
>>         - items:
>>             - enum:
>>                 - mediatek,mt8186-disp-postmask
>> diff --git 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
>> index 3ade2ece3fed..42059efad45d 100644
>> --- 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
>> @@ -23,14 +23,11 @@ description: |
>>   properties:
>>     compatible:
>>       oneOf:
>> -      - items:
>> -          - const: mediatek,mt2701-disp-rdma
>> -      - items:
>> -          - const: mediatek,mt8173-disp-rdma
>> -      - items:
>> -          - const: mediatek,mt8183-disp-rdma
>> -      - items:
>> -          - const: mediatek,mt8195-disp-rdma
>> +      - enum:
>> +          - mediatek,mt2701-disp-rdma
>> +          - mediatek,mt8173-disp-rdma
>> +          - mediatek,mt8183-disp-rdma
>> +          - mediatek,mt8195-disp-rdma
> 
> OK.
> 
>>         - items:
>>             - enum:
>>                 - mediatek,mt8188-disp-rdma
>> diff --git 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
>> index 35ace1f322e8..54b7b0531144 100644
>> --- 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
>> @@ -20,9 +20,7 @@ description: |
>>     properties:
>>     compatible:
>> -    oneOf:
>> -      - items:
>> -          - const: mediatek,mt8173-disp-split
>> +    const: mediatek,mt8173-disp-split
>> 
> 
> compatible = "mediatek,mt6795-disp-split", 
> "mediatek,mt8173-disp-split";
> 
> I have exactly that in my local devicetree for Xperia M5 (not 
> upstream yet) so
> no, I wouldn't do that :-)

Would only removing "items" and keeping "oneOf" be alright then?

> 
>>     reg:
>>       maxItems: 1
>> diff --git 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
>> index b8bb135fe96b..87523b45a210 100644
>> --- 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
>> @@ -21,9 +21,7 @@ description: |
>>     properties:
>>     compatible:
>> -    oneOf:
>> -      - items:
>> -          - const: mediatek,mt8173-disp-ufoe
>> +    const: mediatek,mt8173-disp-ufoe
>> 
> Same, and I think UFOE is present on your MT6735 as well.

It isn't. In fact its input and output muxes are present, but the UFOE 
block itself
is absent. My guess is Mediatek reused the dispsys skeleton in several 
SoCs and
plugged in processing blocks as needed. Removing the muxes would've 
probably required
additional work to reroute the connections between blocks before and 
after UFOE, so
they just kept the muxes untouched.

BTW, this patch comes in preparation for adding bindings for almost all 
MT6735 display
blocks, so I haven't gotten rid of something that I'd need later. 
Although I didn't reuse
MT8173 and MT8167 compatibles (the 2 SoCs functionally closest to 
MT6735 in terms of
display) but instead added new MT6735 compatibles to the drivers (none 
of this is sent yet
of course).

> 
>>     reg:
>>       maxItems: 1
>> diff --git 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
>> index 7d7cc1ab526b..52f233fe1c0f 100644
>> --- 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
>> @@ -20,9 +20,7 @@ description: |
>>     properties:
>>     compatible:
>> -    oneOf:
>> -      - items:
>> -          - const: mediatek,mt8173-disp-wdma
>> +    const: mediatek,mt8173-disp-wdma
>> 
> This is present on all MediaTek SoCs - literally. The issue is that 
> the driver
> currently does not support command mode panels for real, so this 
> binding is...
> ...well, somehow in forgotten-land...

What does it have to do with command mode panels? I thought it was used 
for off-screen
image processing. Or was that MDP WDMA?

Also with all the command mode stuff the driver currently has, it 
doesn't properly support
command mode panels? I mean it even switches to command mode to send 
configuration commands
to video mode panels rather than using VM_CMD (something that took me a 
while to get right
on MT6735, because its DSI controller acts funny when modes are 
switched frequently), so I
imagined it had better support for command mode.

> 
> I would hope that command mode panels get implemented 
> soon(er-than-later), but
> I'll leave the choice to you and Krzysztof - I'm only providing the 
> information
> here. :-)
> 
>>     reg:
>>       maxItems: 1
> 
> Thanks for the effort!
> 
> Cheers,
> Angelo
> 

Anyway, I don't mind dropping the changes you NACKed, especially since 
they don't
affect me at all, but I do want to know the motive behind discouraging 
simplifying
the bindings now and adding these things back if needed in the future.

Thanks,
Yassine




