Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884BEC54E94
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 19:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XCu7hF0XsK65JOzXs+6ZmCQ+Q5pOhHMgb8RXoQpNbGQ=; b=pFW1QTXq9FqWiGjqZINpVQTfL5
	Y6O8CYwbrJWhTsszrzZUhfMoscpTVvAHb2sqGWOXWjC9lLJAe0EFtFs9+sdBEfwf+QVgTZPF5fd20
	ySgqU4wsobeBmQUWWia778CIonRV+dQyr892q704FgPc+iGy5Zr+AiGvAbSMZ8cYrjiYw8ryp1qwu
	PSHm9jlBm/YThwRcsICLUbbGkuuU8QvDYgDzp9rIsCmGPRNFosXrAhVHVQtOBBGm6FdEYLFb1hhI6
	ZAM5eAMA1ypgRV9mYwDRC5pp4Ub8ym/Lr+bmEgbWMti9OIMO2raD6r4Av9QoFSyPZgs21zcj1MsUB
	dTxfImGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKlB6-008RLq-9m; Wed, 25 Jan 2023 19:11:24 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKlAu-008RHB-7H; Wed, 25 Jan 2023 19:11:13 +0000
Received: by mail-wm1-x32d.google.com with SMTP id f19-20020a1c6a13000000b003db0ef4dedcso1925850wmc.4;
        Wed, 25 Jan 2023 11:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XCu7hF0XsK65JOzXs+6ZmCQ+Q5pOhHMgb8RXoQpNbGQ=;
        b=o6shlmjuRvcuo0LrFpm3pYEt33fIoxAPTEqm4InMwR2PJ52eJPAYqo86P/sg2g1M4S
         mIHbdkW/HBMfRQvBs5uxwl8cRqlnT5poX3YYXT+lL0f4r7nfGXAC0S1wuzAx2awWEoTs
         N89dwzQt0w4RyTUTPy91gjprPhHmfL9xmeEhW9cSmZ+kcubyws6h62cj0Dg+8kIr84DT
         Q7+7CdJw4I7lss8kye+k4bcio3jmMevX1lOdpOtQRLBg8PTfyA/ZJdfyN4EOEmsBUbt8
         o2zU1TvFJaQg/xn2IE8Xzo5/+K2MGLFqHu7pwpiZwsnW1qSuaoC3vtATQYQQfsDbU67i
         /u3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XCu7hF0XsK65JOzXs+6ZmCQ+Q5pOhHMgb8RXoQpNbGQ=;
        b=u6mIfDjdkSTCDpkWuFF/X8DPCGKrOv96D59pTRu3Ys4OZT/f5HVhp8Z2F0FBzhJFzk
         0p5bKN11yFfzrZJOg9fW56uyyUb0g7uz3yoizzX74VqgTXfl0F9Z50w1BcuaB9YI+hmp
         M6EvdMdfBnd1dQvrQ3ZaliMJFbLOZEYLtl2kWAQaYTHz8a5tpm83ArtAN8wjiLFLpOrv
         PxNM3Zz/SIMYZ2Zahi+qw40HZXDOLEgLh6/aJC4U5AD1dm+JLgWmqTIyqWptZJ9X5TGw
         QnAJzWPvh+0vI6qjCFKwgCgunbJLIT6UkanDNIqZgO1xspugboShkVC/A8G3G5jNx0Bk
         YtgA==
X-Gm-Message-State: AFqh2ko1i3za1rtVAPFgEfYHivBK9HjYXhNebVO9BxCSunfBNLFMFTs9
	D52ooTffHaoDUc1u6PPvwUg=
X-Google-Smtp-Source: AMrXdXsp5al+0K46OvxCZvD0/e8/m3DMiHOLLHh8WHcHeGbbf3oHno5usWF0lHKay5C/p5SKpvjgxQ==
X-Received: by 2002:a05:600c:1e1f:b0:3db:2063:425d with SMTP id ay31-20020a05600c1e1f00b003db2063425dmr24863447wmb.2.1674673863760;
        Wed, 25 Jan 2023 11:11:03 -0800 (PST)
Received: from [192.168.1.135] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id t16-20020a5d49d0000000b002bfb0c5527esm4645045wrs.109.2023.01.25.11.11.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 11:11:03 -0800 (PST)
Message-ID: <36e7ab30-8e59-5fb1-adc8-1a9f0e213b52@gmail.com>
Date: Wed, 25 Jan 2023 20:11:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] soc: mediatek: mtk-svs: Enable the IRQ later
Content-Language: en-US
From: Matthias Brugger <matthias.bgg@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>, Roger Lu <Roger.Lu@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221127-mtk-svs-v2-0-145b07663ea8@chromium.org>
 <12f4d25e-fb2e-8f4d-1874-46f7404b05b6@gmail.com>
In-Reply-To: <12f4d25e-fb2e-8f4d-1874-46f7404b05b6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_111112_280731_0F7DC975 
X-CRM114-Status: GOOD (  11.61  )
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



On 21/12/2022 09:56, Matthias Brugger wrote:
> 
> 
> On 20/12/2022 22:35, Ricardo Ribalda wrote:
>> If the system does not come from reset (like when is booted via
>> kexec()), the peripheral might triger an IRQ before the data structures
>> are initialised.
>>
>> Fixes:
>>
>> [    0.227710] Unable to handle kernel NULL pointer dereference at virtual 
>> address 0000000000000f08
>> [    0.227913] Call trace:
>> [    0.227918]  svs_isr+0x8c/0x538
>>
>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> 
> Thanks Ricardo. Roger I'll wait for a Tested-by tag from you to make sure this 
> time everything is fine.
> 

Given the chinese new year holidays I don't expect a Tested-by tag from Roger in 
time. So I just took this one without it.

Thanks!
Matthias

