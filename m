Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2EBC05027
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 14:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y2O8IXbwntgqpzPKwbw1Aev8+c15Xxh/E8XGeMKjxfY=; b=J9eJ7CrvI2YFsa07adOECpIz+Y
	7CwhSYtxwF335KZu8uThcmKOE1u9ab+Rjc+VziHV2UB/dFwINLJsq1v0CqVr2ZkQXi+y2CwEFuLgM
	jzMz8TrQI4ogZpSdipiQhm7JZiwbwVGUIL/1KHVXQZS2XcQTvdQ+MhCk6h+nfKThcatcOnliQXauv
	+OEO6nwphhNUlFcF7/XoH3FYKDUdysx88OlbQv/VmNITrASrXVWCN5BIc99DQyoLOtqO0iatnIyKK
	RH+cH+nzGLMYOI3m2g5v5yMvQ5ir+nJfU9GpRTWSriyQawVje1drNeHa7/pyCAZPqkyRa8/5MZhcA
	dXJ1BXPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL3JF-00BCuq-1S; Thu, 26 Jan 2023 14:33:01 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL3J3-00BCt1-DM; Thu, 26 Jan 2023 14:32:50 +0000
Received: by mail-ej1-x636.google.com with SMTP id kt14so5582195ejc.3;
        Thu, 26 Jan 2023 06:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y2O8IXbwntgqpzPKwbw1Aev8+c15Xxh/E8XGeMKjxfY=;
        b=UoxSsfQ+4YXUyobuuxig3tHEsdLwYpWmEB8Na6HmP/suhG/NdYOfQA3lPi1jcVDGw+
         8B5UPANUwhsgob+lC5b5tqYaI3XZcNIaS4GntFHiJcLNpNf07U0wDKBtAoeOtAl7G0qr
         nEhtMO4rmFrW524FR5F1jB2tEYN2fGHrZ6am+pJjcm+fWYqT1oUDoNgnooLnU2Xt/H8L
         pvG9JexWtfstPuordvp/Ii1x74L4b37K87LWBi34KbGWJC4cuy85DK9fH6j7bz6BszBX
         xXUDN13U4sObAoR21RwB7+34Sm8HNjO7EZqzlVKTr74Uj61ZwEwaY8PV8+aH7/r4T9rf
         sbxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y2O8IXbwntgqpzPKwbw1Aev8+c15Xxh/E8XGeMKjxfY=;
        b=mECsM2VLXJnSxbnhY8u3YVyAHO6IRa5qxjMSt5xfXLEGcMTUUVow4PYhryEFuHUgG0
         4Yw6qk97F7m+X/RUSFqbBiPgpj95s34SXki5ss3kAZ7AMWHmpreYCyxzgL+j4XmTRvV8
         yvKQXf/AlboDH7fYtg6dRDFGY3aTXNNnRiF+PX/sO57NHBJkFznKT2DnrUABI01d5pdd
         fWXKjQQs+l9sKxZr14zP1mNay2JQDttyx3o8O0tMJY4q2DDHkb7rX8OW/KjIkOD03Cqg
         OAdPlEWWU53lqSxO+Jcf7djryuJ08gaiD0yVsbTop8RC4me6do9ciST4VVI3F7JqOdHE
         IlRw==
X-Gm-Message-State: AFqh2kqofxaJfQNz51Zz7j6gV3W8iAucgcZwjIO6eHml8ssH6UX+abod
	fCBAG/8u9rFOQ09lOof1b98=
X-Google-Smtp-Source: AMrXdXs8jVxgA1YdKfSSwjoisrGGqkjV4MBjiUaAA+cRf3N0uInFrzD0m5uzElZJ6Ja1lQxBDEDKqw==
X-Received: by 2002:a17:907:7da0:b0:86d:67b0:6292 with SMTP id oz32-20020a1709077da000b0086d67b06292mr53631924ejc.73.1674743564695;
        Thu, 26 Jan 2023 06:32:44 -0800 (PST)
Received: from [192.168.1.135] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id o25-20020a170906861900b008675df83251sm670962ejx.34.2023.01.26.06.32.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 06:32:43 -0800 (PST)
Message-ID: <c4633d6a-9aa5-5c43-bfcb-611cd96e1c5b@gmail.com>
Date: Thu, 26 Jan 2023 15:32:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 1/4] dt-bindings: arm: mediatek: migrate MT8195
 vppsys0/1 to mtk-mmsys driver
Content-Language: en-US
To: Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Moudy Ho
 <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230118031509.29834-1-moudy.ho@mediatek.com>
 <20230118031509.29834-2-moudy.ho@mediatek.com>
 <8ae4469e-ed2c-5019-605b-013a49af77ea@gmail.com>
 <124f081819a80482b3bffd8e12d747fc.sboyd@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <124f081819a80482b3bffd8e12d747fc.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_063249_515957_6959D123 
X-CRM114-Status: GOOD (  11.30  )
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



On 26/01/2023 03:05, Stephen Boyd wrote:
> Quoting Matthias Brugger (2023-01-19 08:08:48)
>>
>>
>> On 18/01/2023 04:15, Moudy Ho wrote:
>>> MT8195 VPPSYS 0/1 should be probed from mtk-mmsys driver to
>>> populate device by platform_device_register_data then start
>>> its own clock driver.
>>>
>>> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
>>
>> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
>>
>> Stephen, if you want I can take 1/4 and 3/4 through my tree. 3/4 shouldn't be a
>> problem, not sure about this patch. In any case if you want me to do so, I'd
>> need a Acked-by from you.
> 
> Do you need to take them? I'm picking up mediatek patches currently so I
> can probably just take 1 and 3 if there isn't any build dependency.

No I don't need to, no build depencies. Ok, I'll take 1 and 3 then.

