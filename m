Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70EBFC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 12:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DFZS31orYUzmE7Oui/y7eLseJom8bGmCVAt+PCCfPxg=; b=RF92CWI0/KbXfXmrXy1N1DIPGc
	dg6W5O/7Heeop1eZk7mo0gnil/e6cwGLEdaDKbm0sTseZWA41IZQouaMcX9eyMRJeJTxVAXreqz+U
	KIPW4Ii3cski/G2CCI1GUETlunwDdnta3riuPg1NoSRMsY3SMJ4TugGc3Yhj1wD9E5MAgmKL7q3Hw
	29ktu4K9FXQJihc+TMptO4NMGdawyXN/WT4SBsDx0b/ZXF+HLdjfalBNRKZl4haUugeAZ34DxVUho
	aDugL/Outr8QEZKcUOA6LkC/GGnlbqStmhtfpAw/l8yC7yq4XOPS5F1/i0CNf9oNwVVW0SL3oaMoy
	Q4rjpXpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox62G-00DauJ-2s; Mon, 21 Nov 2022 12:36:28 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox62D-00Daqn-4b; Mon, 21 Nov 2022 12:36:26 +0000
Received: by mail-wr1-x42a.google.com with SMTP id n3so3094763wrp.5;
        Mon, 21 Nov 2022 04:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DFZS31orYUzmE7Oui/y7eLseJom8bGmCVAt+PCCfPxg=;
        b=fW5Mp6sgNTEJLfxwwpa6BIHYLAfya0or8LXwcsASGLmIq9mn1KR9RFWRL/2tWjqqAV
         lqiutzi4AG6MRhTQ4IXBpyEUf/lrKm1bRXVYDE3J7USVRAEZzfY5DHPpfA2sCaPCz9FR
         1WKF62zxbCIT5Eol+OpNmMlDQltt4rdDe5l+YyWNMe1KBTtDcWeeG53oEoI7TpRmWqAW
         MII2+ZrqXss/yMjy24JnfZcXyO+8ZYJG5p9S4xVSnRP/JZExG+jmX0i+siq4xk+M+X4q
         aK1N6gZkupNjcummiw+CrMzd8Cvr7+ctnrzsM/Xui4t94xPO8j0cXaGHiw1p0HvCi3u1
         fuFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DFZS31orYUzmE7Oui/y7eLseJom8bGmCVAt+PCCfPxg=;
        b=MlvOIGgziemtQO9MrpF/Op2HdFQSrwHGqU/cUw82W2xO4nPMZ9Vq9jnQQSA+DrpJGx
         Ev83RN8IeHaxkdXnIiClGbbnSNu4rcarJVRn5+deYrzsImU88AK1adqJ5z9f+oGyuF56
         821Lv++gsG4VcvD6FQVJm0UwBu6w5CTnMl87uJ3b5J3S2xgSz20g2PPft9zuCo7W8wJh
         toFu23GHwYUQ5i8BldRKz11MP2rp3IMuHjmLwtkD8BqV1kfehSHAhvtG45C+BKtiHope
         HM1XL52hrVyX8cVSOJh4Nw7q8Ywu0v2lMacfRZbUWKu2+OtaIzHX7sum0/UdKPE+mLXg
         NjaQ==
X-Gm-Message-State: ANoB5pn2O/fv+ccwJa3oFPgyVi4FKFegnZjZq9hZGnYaiFhG9as3utAl
	ffx8K1Fm52uMqiXf73rDRO4=
X-Google-Smtp-Source: AA0mqf5gaD4WIQX2sbEeb8QjK494DhuNzsLQ1Cu8gU+8er0XjItCmVLNx0maWmXAjD+rlO90gKR4Qw==
X-Received: by 2002:a5d:5a95:0:b0:241:65d4:8b41 with SMTP id bp21-20020a5d5a95000000b0024165d48b41mr10628536wrb.470.1669034183276;
        Mon, 21 Nov 2022 04:36:23 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id 6-20020a05600c024600b003b50428cf66sm13335494wmj.33.2022.11.21.04.36.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 04:36:22 -0800 (PST)
Message-ID: <f3697559-efd0-b3f9-9d64-17d2f8131a97@gmail.com>
Date: Mon, 21 Nov 2022 13:36:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/9] dt-bindings: pinctrl: mediatek,mt65xx: Make
 pins-are-numbered optional
Content-Language: en-US
From: Matthias Brugger <matthias.bgg@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, khilman@baylibre.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
References: <20221121015451.2471196-1-bero@baylibre.com>
 <20221121015451.2471196-4-bero@baylibre.com>
 <8afd5100-9cef-50bd-2b53-e1a550973835@linaro.org>
 <5b28a9b0-3c31-75bd-3161-0ff9bddf0c54@gmail.com>
In-Reply-To: <5b28a9b0-3c31-75bd-3161-0ff9bddf0c54@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_043625_213068_9D383784 
X-CRM114-Status: UNSURE (   8.16  )
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



On 21/11/2022 13:32, Matthias Brugger wrote:
> 
> 
> On 21/11/2022 09:00, Krzysztof Kozlowski wrote:
>> On 21/11/2022 02:54, Bernhard Rosenkränzer wrote:
>>> Don't list the pins-are-numbered property as required
>>>
>>> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
>>> ---
>>
>> And how about making them deprecated? (deprecated: true)
>>
> 
> I think that's we want to do.
> 

Also squash 8/9 into this patch.
Same comments holds for 4/9.

Regards,
Matthias

