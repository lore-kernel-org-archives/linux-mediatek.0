Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6515BC54EBE
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 09:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ww7Hxrw6n0J7k//JManeo1d6RMBOH6s8LbvXGDtzj+w=; b=NCprwmRRlkucPE4dnE4M5ffJ0b
	d1sRsTnEDIR8QFDOgCIAuCGC7IYOs0euAWJCo9knurj6ZifGL6n0GbshtgHHzfFDeS6uAYOO2Ha7f
	63Wh1q2/Kkk7DR8audzQbVt31sdHY6ofJjzSsRZTWrrbTZRGyn3/JcZ3OPMox3JQJ2v7rLb+wB/uT
	DpFrOZ1ASV7QNCpCoTtxLnC4T8jerk2ghpSEignLeogCcq949qE/Q9x3Wz/ff0SfwCfj1ubJjmp5U
	X3bbhYahcOYZUxpOzxLh74mZZSHjfaTXQvbLnIVLceTPBkkRi6+JB+mrv60R1lZGqf0yZCw7eJCwz
	r+JcuTlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHLck-009JSt-Gd; Mon, 16 Jan 2023 09:17:50 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHLcg-009JQf-PA
	for linux-mediatek@lists.infradead.org; Mon, 16 Jan 2023 09:17:48 +0000
Received: by mail-ej1-x62e.google.com with SMTP id u19so66489933ejm.8
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Jan 2023 01:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ww7Hxrw6n0J7k//JManeo1d6RMBOH6s8LbvXGDtzj+w=;
        b=v5qDCDI2V1SvQnjE03DuLKYjo6tGrNOI1fmyfrbtX1bfPSDjMuEb6AkRNNQjQqF4w9
         xvQA/XAhZyZU2S+cwiw5px7dPh6bGcR+xr6ngwFz5eeZXFQq5i9BbV7hirtq4T8QTrOJ
         4hPL6DWur+wbtCguPVrmyHlClK3FNqe73Xvc3EDFkvIuCX9VLZhXiC8qbzyFAwlvPi12
         AZXKsEJlsfb46On51cFyrW8NFIzom4xbLrii2c8cGPecK2Run3frV1V/pyOdDqs/qdwk
         WZqGxdYN+iUbvIBhL9SH0SnYV4aqeLBt8ThmSoPPW9TCZ4CRAwTB1bBAW2Ur3HV1UbxG
         tA1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ww7Hxrw6n0J7k//JManeo1d6RMBOH6s8LbvXGDtzj+w=;
        b=7Gmqias0Pe5IltxQjN3AacT7P0uIIyERIwyM0v0z96+RbdVJ+dOha5+PRjJT/mWkbU
         lB7RucG9SH3uBG17jyVolggFrI4+ZStlA97/gA/5REoWYRSySatkXVKl4PJyg0LjwqGp
         +IvOLER3plf5h+s15jjC6ZLCr5nXRYCAfXUc3/PW4REJOIVxQ2zrrd5d2hIYnFx9GXp0
         kjIvo9zMX6X79FREGehqS32VpcxrRyfpGE04ZLT1ybKAiZVpLIMDCYioAGWY/H419uAo
         FNy9qibuhBAygDT49j6TFcF5GtePXojMwlafjtQPN/l/y4GNjF97iWZNrpxQUyR3T3Xr
         WImw==
X-Gm-Message-State: AFqh2koIc4JClBCs/lSikcUusTHShkh8WY3QNZKkjvw6/IXfTWhubz/W
	/U/X3WPgBbV8/6CQBcKshwtTctr3RZ2GGN0D
X-Google-Smtp-Source: AMrXdXsKA+xBsKYbyxr+liaowz9b+i0Yta2/1SABcEZ2fAZj9G6NDYjCiRPwvXY9TodJyFWT6Ret/w==
X-Received: by 2002:a17:906:4acc:b0:870:b53e:86b9 with SMTP id u12-20020a1709064acc00b00870b53e86b9mr2489239ejt.39.1673860665533;
        Mon, 16 Jan 2023 01:17:45 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id g13-20020a170906538d00b0085a958808c6sm6941007ejo.7.2023.01.16.01.17.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 01:17:45 -0800 (PST)
Message-ID: <ea718cd4-db3c-12a8-aac6-688d7189fbf9@linaro.org>
Date: Mon, 16 Jan 2023 10:17:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RESEND v3 02/13] arm64: dts: mediatek: mt8195: add MDP3 nodes
Content-Language: en-US
To: =?UTF-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20230116032147.23607-1-moudy.ho@mediatek.com>
 <20230116032147.23607-3-moudy.ho@mediatek.com>
 <63f3d41a-1aa3-396a-b515-bc805f4a19b4@linaro.org>
 <47f79e0ffda3fe72e574596aad8c4562a3b6e14a.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <47f79e0ffda3fe72e574596aad8c4562a3b6e14a.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_011746_850545_B3BE84F7 
X-CRM114-Status: UNSURE (   8.92  )
X-CRM114-Notice: Please train this message.
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

On 16/01/2023 10:14, Moudy Ho (何宗原) wrote:
>>> +		mdp3-fg0@14002000 {
>>
>> Node names should be generic.
>>
> https://urldefense.com/v3/__https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html*generic-names-recommendation__;Iw!!CTRNKA9wMg0ARbw!gmuIIk9pHTEGcVTtOXNeP3a8XUucoiTd5vTmxNK8lCHtytRDc3R8Eh44WOWNEUkJlv_pPCtg_DvPCHsCHNscg6_0cfJe$ 
>>  
>>
>> "0" suffix is definitely nothing generic. Drop such suffixes
>> everywhere.
>> Drop also "mdp3" prefix everywhere.
>>
>>
>> Best regards,
>> Krzysztof
>>
> 
> Hi Krzysztof,
> 
> May I uniformly name all MediaTek's media data path ver.3(MDP3) nodes
> as "mdp3@xxx"?

No, because it does not describe generic class of a device. Some nodes
are probably quite specific, thus we do not have generic names for them,
but then any prefixes are also not neeeded. If node is image-scaler, it
is just image-scaler, not "mdp3-image-scaler". If node is video-codec it
is not mdp3-video-codec. etc.

Best regards,
Krzysztof


