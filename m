Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6B6C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 May 2022 14:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z27aTwBv5gaDsbL+/qAxSjbA/Xbl/JsbDiuE0VT8TZY=; b=MB3ka6hDPiTlYF
	ZW94PmzoyUfsRpRqFvniWeoACG+Ms+fvLo1kKaQwMfRI4dRp0oM+TLmfPqb2NhGvuJTTiQ+3Mg+zl
	2eYf+sd+68d6kV5pzQb/Du+geBCi/0wiH49LnoTnkEFCwfWntg0JTfnwYgjgvStHVo6sfdmoWDBqp
	THcwryeyZ+SnI2cuYYKZJqZGQwe9KCcsoObRLyy8x2PdbJhuP4ppQcIqpKTOPiWJXimn0RTLAybXu
	8FGOI4c+M8mb0xV8q5cO6kMxHvHbDYy7qobO/jRge2420dSfnLhZUcJk590dcG7ZxhMZv5BxNAIty
	sx/MC+1ga+0Kk9Ok16EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsPjD-00GglF-6Y; Sat, 21 May 2022 14:05:11 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsPj9-00Ggjt-Hn
 for linux-mediatek@lists.infradead.org; Sat, 21 May 2022 14:05:08 +0000
Received: by mail-lj1-x234.google.com with SMTP id a23so12361103ljd.9
 for <linux-mediatek@lists.infradead.org>; Sat, 21 May 2022 07:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=d1kYyv5ThMhL++IEPezH6L3/JQfTCn2bBC3uluzdASE=;
 b=zZBZG+77Ro4UojerpsPaGBJsTYHFLKxtpL9lewzUMg1c4KkDTo4DessCZvZOHpRba8
 DYu7ITDh7Utd+YoskwDItroRXLSYDcUrhqkIeQ/L8wQ+n1ik1FLZPdKe9Yo5kPujQQvy
 HQXhDmawQgnVR/hhTssCDYriad6YcC7bqXo9Sq9jD4ZJfj5611kwAqmwKB6Vn8xP1FBG
 bbj2O/h+Dw/qHNLqZe7kU65yxuxlpmI6BH+c6QfWR8pqemXpQdk+H563662lR/JD/gCq
 dXNAgWllWX901z12Lr5leue7nNUq9DMmvum7jYf2AbVTbT2TXCdYSgQ2xU+iVXw0vYca
 zncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d1kYyv5ThMhL++IEPezH6L3/JQfTCn2bBC3uluzdASE=;
 b=VM4IoOZGdajM2HVFHwM/fGqI6fDqL0iRaYSHphRfFaR2WS1ioduCqG2q6DiC9Qp/Q4
 Bo5ReSNeXWZb02nazCJQMd3o/CGhJKtSrbCKU0RjTna6/iXRCs+luUhdb9DpN1MFmhOz
 oOH9ii8K1Ek+W2UI3H7iTCBuOCpGjkWdwUyyuScA6K9aPMiVVLngRjkdfRwK0/0Dnv4W
 tqJc8n0sIl14Vc3ebaiDkbsPpoeMFmC24YqE8iZfPw3DJQbN9gxqJA10MiwxLakaUwL9
 1GarP1t+OAjakvpFzTTOW/pY+J/WZHPaUBUecWMWFSh0MNsaqPhiGQkbxf1IUQtpR5st
 7TZg==
X-Gm-Message-State: AOAM530zKVkA+4gvCijLfJcn13XzoW+mCKBGO99A358tbf6prtzdNg6K
 LHhuID/crPLaTl66U0xOQhRWJg==
X-Google-Smtp-Source: ABdhPJwZEhOHqoesMgIauedpx3ogq6lMvJjNB5YML4uG6u/SJasUNr+u1EP6LiAEWRpx4u0gHGXrOQ==
X-Received: by 2002:a2e:9348:0:b0:249:7117:b7ad with SMTP id
 m8-20020a2e9348000000b002497117b7admr8023603ljh.85.1653141902955; 
 Sat, 21 May 2022 07:05:02 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 a4-20020ac25204000000b00477a1b603basm1068915lfl.98.2022.05.21.07.05.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 May 2022 07:05:02 -0700 (PDT)
Message-ID: <288690ac-b23b-92f8-64b4-d994f249f21c@linaro.org>
Date: Sat, 21 May 2022 16:05:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 2/2] dt-bindings: arm: mtk-clocks: Set #clock-cells as
 required property
Content-Language: en-US
To: Rob Herring <robh@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 sboyd@kernel.org, chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com,
 wenst@chromium.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220518093631.25491-1-angelogioacchino.delregno@collabora.com>
 <20220518093631.25491-3-angelogioacchino.delregno@collabora.com>
 <20220520221910.GA348732-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220520221910.GA348732-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220521_070507_655538_1A7A53FC 
X-CRM114-Status: GOOD (  13.96  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 21/05/2022 00:19, Rob Herring wrote:
> On Wed, May 18, 2022 at 11:36:31AM +0200, AngeloGioacchino Del Regno wrote:
>> This is a clock-controller binding, so it needs #clock-cells, or
>> it would be of no use: add that to the list of required properties.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml  | 1 +
>>  .../bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml         | 1 +
>>  .../devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml  | 1 +
>>  .../bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml         | 1 +
>>  .../devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml  | 1 +
>>  .../bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml         | 1 +
>>  6 files changed, 6 insertions(+)
> 
> Acked-by: Rob Herring <robh@kernel.org>
> 
> Wasn't there some discussion about moving these to bindings/clocks/? 
> Maybe that was another one, it's all a blur...

Yes, there was such idea although I am not sure if this is worth by
itself - messes up with the git history.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
