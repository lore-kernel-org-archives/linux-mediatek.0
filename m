Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18422C0032E
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Oct 2023 07:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wirm5Q3dcoOD4F+NMOnOVCZSztH47TeUP0VbK8KxV8I=; b=JimCC+GCFRpDPyd+GQwmaVjT8o
	LtgbQ0NdXoKXbWaBi+tMgx4KGft/AhMuE2MbFMPuU+vyXpEX0jvYci38F7oIOA+mB+22QwCTe89ck
	QPKa2FxnqCNkAlHRofo7GMsMZneFKeml+lEyXxBEJYewJwgiAV5H5fzxY/BrSh42p/qTElFPwkaIE
	cbfIzUs/B13BXG5aaneaqSJk60+gmaSy+8OPW3DQifaDarwfr5KXR8Px2BTnijqR7QnFlntpn/mqS
	vpR+ykmAeFwZniFuyd6cEQkYoT6kThRYbTfg18WPRuXgO+w++p5uAmUJOOQDvD/deSD5JaggcqoC1
	xvExbHkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qweCu-0009d2-0k;
	Sat, 28 Oct 2023 07:58:08 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qweCr-0009bh-03
	for linux-mediatek@lists.infradead.org;
	Sat, 28 Oct 2023 07:58:06 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c54c8934abso40672871fa.0
        for <linux-mediatek@lists.infradead.org>; Sat, 28 Oct 2023 00:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698479882; x=1699084682; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wirm5Q3dcoOD4F+NMOnOVCZSztH47TeUP0VbK8KxV8I=;
        b=Xn68ZQmel4TAB+xdrqj834iz4gXsgR94CgGxtRg8aJtk9z23ENdDjXjo6EFJeegNBc
         1KPL49F6xcMKW+RzxFsvP9XuTRvbFkwpJk1Qmi6zGYcsPC6e8rFe3X5XkUHVWchYKB1w
         eIgqO3FW4aR6F+b+jO9e0m+qFVwtIWuu5Z7GDFmyywpDgvHJl6j+W4r81WdiUhOszYzx
         FbnGyUb2jR5MhC656JzCD5WD1WigfE2kcbA8Dv16gK4bBLOLnuhhjanW4PEtHtJR1fu9
         daboqmSqNTujchainhCvf9pos6rJ0YD0xMJyqZVPAH7+yfj6iaPmvyWRsnUK0haVXUks
         a98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698479882; x=1699084682;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wirm5Q3dcoOD4F+NMOnOVCZSztH47TeUP0VbK8KxV8I=;
        b=CQ09MDWTLmSacr/9GoaYWbxNgGLcf5yjS0LRVEZfbFJGTWrI9dpQBJlmfTBs6a7H34
         oNVa/ctbu8iW9QLthiKFuqw57Byz2h2eIcjX3s4kFHPRp88e7+vGqpoGl10pbbW1uoj+
         W8HcySp4183pS13qY/hwyTXHJVvT5EveRyeKg5iTcBTBcGa4QEpg/g7krLNUcKPBW5Js
         JVI5gj9Eupd1JVI84RcUPWveeJOuO45g3k2CuWunWHlawSPjKDxPRo4fI64Ys+jHZP3i
         rtPJ4sX7b8y1LDhTgJ5cQ64P/ysoI1Fw/z+kgVkli3SJ7ySW4/IGngAKx8aILc5+Refw
         ZwFg==
X-Gm-Message-State: AOJu0YwWfzXTextg3b/Q3vDl9A/pI+8PJTy0VMx+DYN8FHrDz8UcUgt1
	nd03TZHr79G1lcEGw2Ow7ViCHg==
X-Google-Smtp-Source: AGHT+IGxGFiRG1NAScIBM73dNIGn1bPLnq8cjpK6Q4S6ezx5gtbaCjjBVAQ/T8ESnBZnRDnq8nm6Hw==
X-Received: by 2002:a05:6512:1107:b0:508:1178:efa4 with SMTP id l7-20020a056512110700b005081178efa4mr4083984lfg.55.1698479881784;
        Sat, 28 Oct 2023 00:58:01 -0700 (PDT)
Received: from [192.168.0.22] ([78.10.206.168])
        by smtp.gmail.com with ESMTPSA id f22-20020ac251b6000000b005007e7211f7sm571734lfk.21.2023.10.28.00.58.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Oct 2023 00:58:01 -0700 (PDT)
Message-ID: <2a29c027-4431-4693-98d4-ba09ad46591b@linaro.org>
Date: Sat, 28 Oct 2023 09:57:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] Add a few mt8183 follower boards.
Content-Language: en-US
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231026191343.3345279-1-hsinyi@chromium.org>
 <7b737537-38f2-4404-b469-c67005cdaf83@linaro.org>
 <CAJMQK-jQUHz8-hEx4DzNU3cOnN59JG1xFBPH5mUndLV-rbk+Jg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAJMQK-jQUHz8-hEx4DzNU3cOnN59JG1xFBPH5mUndLV-rbk+Jg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231028_005805_051474_43114B99 
X-CRM114-Status: GOOD (  10.39  )
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

On 27/10/2023 23:22, Hsin-Yi Wang wrote:
> On Fri, Oct 27, 2023 at 4:17 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 26/10/2023 21:09, Hsin-Yi Wang wrote:
>>> Add makomo, pico, and katsu which are mt8183 followers.
>>>
>>> v4: based on https://lore.kernel.org/all/20231025093816.44327-1-angelogioacchino.delregno@collabora.com/
>>>
>>
>> Where is the changelog? It's already v4 and still no changelog...
>>
> 
> v3:https://patchwork.kernel.org/project/linux-mediatek/cover/20231025215517.1388735-1-hsinyi@chromium.org/
> v2:https://patchwork.kernel.org/project/linux-mediatek/cover/20231024212618.1079676-1-hsinyi@chromium.org/
> v1:https://patchwork.kernel.org/project/linux-mediatek/cover/20231024000724.57714-1-hsinyi@chromium.org/
> 
> changelog with previous version are in each of the patchset. eg:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20231025215517.1388735-5-hsinyi@chromium.org/

One would think but:
https://patchwork.kernel.org/project/linux-mediatek/patch/20231025215517.1388735-7-hsinyi@chromium.org/
https://patchwork.kernel.org/project/linux-mediatek/patch/20231025215517.1388735-3-hsinyi@chromium.org/

Usually expected is in such case to wrote "v4: No changes".

Best regards,
Krzysztof


