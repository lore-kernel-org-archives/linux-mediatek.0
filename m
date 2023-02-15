Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31531C636D4
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Feb 2023 18:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sJGpVnZwHexfDIAUSv5f9IjD3WQOM7IBSTvntQ8PaFw=; b=I5GB8O+5bDpo/+XnAhOyrP7lOL
	zT+dSkEZ0BgtZIV90jSiKZSYC+426YdGeC4AVBgqs6WBYS4b//IAAvY6aF//YyDcnDwsJzyg/7pa8
	rvCcu/6zM5CzOL8VXLsR0ppBCBAWTV5nZwhW805JYA7plqBFcLZMFMx29sPJyVrcZJfxbdJE8wgZk
	Tf30ezkH1ONi4R8Jqbp1x0ooGqLIbPYw4H90zB7+jGuCDHHZbKx4HbAdeFKKGOHEynAcaXDscghU2
	sTyKfacPl37fdTkfPMD+6J3vwmbHaboBZrBuICDCvNHKgFP9depQRN+9PP6S4l9/icOMwaTDVTDXW
	XfUC8FSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSMcw-006sIe-8k; Wed, 15 Feb 2023 18:35:34 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSMct-006sHE-3D
	for linux-mediatek@lists.infradead.org; Wed, 15 Feb 2023 18:35:32 +0000
Received: by mail-wr1-x42f.google.com with SMTP id co8so16364703wrb.1
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Feb 2023 10:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sJGpVnZwHexfDIAUSv5f9IjD3WQOM7IBSTvntQ8PaFw=;
        b=sBau1Tyc7v+7oi4Z/rbpVXMc0paiMMziTYatESS1DT5ohRO7dZKLupWb4vGOTeT676
         RZUCxr+CTwxuKY4Qrhg6z1UujWy05I6FGXZn3is7rv5HTJuxHpVjR1EGnzjhWok+YRLx
         8CjcfIuFF4NkUTrmnHQsG52rDk+OevIfxuzo9Czy5WuNjn68hcPxgzUmovQl7XmSDmhx
         9wmlr69o9ULnOhazSdgk1Ygy6Q2RgphzWo1MOipHYCNb/UBaeJT1eh3eE4xPTKNrlZnA
         QBw42I3LwkVt3f7ymxXpxfMyI+UfhAoi12++ImphwqUUStut/qiDcNXfIg834HigdFjZ
         0LnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sJGpVnZwHexfDIAUSv5f9IjD3WQOM7IBSTvntQ8PaFw=;
        b=x6CsqBqee5XN7PqUR37dXHm1sVQlmwjVO+46JWxbYu6GVoPqgiwFsVNDttipsCmb62
         6w+DgOKN9oSkpvnBcJvMdm6GXq6MQao5/WHwrdH7jXWvZQ9uPsayZ62xPXi0hrsS4wJC
         urJVO5Td/QP1nnbH8MOAAQK3w8WmgsE6cWZOvJflfsGdbScN/4sCM6Z5qV1CvV9/umqE
         odPZwL9ZyFyGkDnT3VtK4IBmHpACSY5waHr+Rs8Ul0z+hjuM2qsmEI9JypiCZWHt9/9d
         /FQsE7VizWgJ8OZ5lZiF3MVGi0D7hwyoIU+TdJAPQr7w9j5A2BfIIxvMo6+yiB6xzooY
         1rmA==
X-Gm-Message-State: AO0yUKUDK+iOpg5ItTSLUpyVzeGQZNoOvFFsd1LMypD3Lr+fqpS2tmYS
	hAyxpp0EeWW02n0WN7Uf8gbwaQ==
X-Google-Smtp-Source: AK7set8mG2u98ECOZQb9+/nLQnDGuY+QpgjSeYr2eRmjoEzTGrhECERQhi8HdBnhJAZFL7twfx++vA==
X-Received: by 2002:a5d:564c:0:b0:2c3:fd2f:f7d2 with SMTP id j12-20020a5d564c000000b002c3fd2ff7d2mr2443592wrw.52.1676486126584;
        Wed, 15 Feb 2023 10:35:26 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id d13-20020adfe88d000000b002c54f4d0f71sm11092704wrm.38.2023.02.15.10.35.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 10:35:25 -0800 (PST)
Message-ID: <12f2d6a8-e16f-5bac-10ee-035c1b4b0356@linaro.org>
Date: Wed, 15 Feb 2023 19:35:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 4/4] clocksource/drivers/timer-mediatek: Make
 timer-mediatek become loadable module
Content-Language: en-US
To: John Stultz <jstultz@google.com>
Cc: walter.chang@mediatek.com, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Maciej W . Rozycki" <macro@orcam.me.uk>, wsd_upstream@mediatek.com,
 stanley.chu@mediatek.com, Chun-hung.Wu@mediatek.com,
 Freddy.Hsin@mediatek.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230214105412.5856-1-walter.chang@mediatek.com>
 <20230214105412.5856-5-walter.chang@mediatek.com>
 <1726f1d2-7411-2b49-79cd-f5aecff2d19e@linaro.org>
 <CANDhNCrYaepM3d-xHybqc9n5j0q0iMfPiTGPZKskEWjqjD6nRA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CANDhNCrYaepM3d-xHybqc9n5j0q0iMfPiTGPZKskEWjqjD6nRA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_103531_185510_96EA02F8 
X-CRM114-Status: GOOD (  15.13  )
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

On 15/02/2023 00:20, John Stultz wrote:
> On Tue, Feb 14, 2023 at 3:09 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>> On 14/02/2023 11:53, walter.chang@mediatek.com wrote:
>>> From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
>>>
>>> Make the timer-mediatek driver which can register
>>> an always-on timer as tick_broadcast_device on
>>> MediaTek SoCs become loadable module in GKI.
>>
>> Other questions are unanswered. Please do not ignore feedback and
>> respond to it.
>>
> 
> Apologies, I know it can be a pain to repeat yourself, but would you
> clarify which questions were unanswered?
> My initial skim made it seem like the items you raised were addressed
> in some form (though maybe not sufficiently?).

Questions were:

1. IOW, does the system boot fine? What's the impact of this being a module?

2. It is not the first time there is a proposal to convert the timers to
modules. After asking, nobody came with a real study regarding the
impact of the modularization of these drivers vs the time core framework
and the benefit.

3. We need to tests that involve loading and unloading of such
modules to see if the transition between this timer as broadcast and one
CPU itself as broadcast happens correctly and system survives across such
loading and unloading of the modules.


All these emails or comments were simply ignored.


Best regards,
Krzysztof


