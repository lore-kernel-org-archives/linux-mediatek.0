Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9531AC433E6
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 10:30:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41D1B64E11
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 10:30:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41D1B64E11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hXb7giSRjki5t/FLAeJ2iIlQYIcmeFY9NaP7l7sdyNM=; b=hHka+jMwW+PRG2dAveyW2e0Oh
	2BWThhYPYpcgr7tO/kQ95Rmn0KDdtkzXDeSm9/KWAlH20onrP6l0Gz6yRu45awAf/JQ48JsFWL5b5
	rpNL2rsRPj1MkeutnH7LE9NdlIIisAIR0p3t2j1TpCSbv6vSnDuqWT0bVZDx7CS2v1hWrSyS3TxI1
	KGNKRGTA0w9dMjlXezofw/eC2tj7fFOmYjStzZoSWrsqoFhF09/wd/wpr5xigoApAuqA0dKrcpM2g
	/099yB7ZY/ludlAvizHICDpjGrab6qjwIf4x6TBi1ZxIBERnWJUARQFt1oIU3sbXvu9e9Cd+YkbTy
	1EJKBwe1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6WTo-0008HI-9A; Mon, 01 Feb 2021 10:30:48 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6WEY-00088U-TR; Mon, 01 Feb 2021 10:15:03 +0000
Received: by mail-wr1-x432.google.com with SMTP id a1so15933588wrq.6;
 Mon, 01 Feb 2021 02:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ANsARq6fL07NGibn8cbk7oUpbzEAXo/i2Ol65lcGXGk=;
 b=auV2FdGYh4MkV590dDE95x07nWp+vQjkQhprR0m03LfdKoR6gqTNf/rdCs03rgO3P3
 5dRPyI0yeutlaDLKS+KOUEIvTHP3j/fAC3lGmwbM4DXDC6wk7B/36RhA6PJNgy0WpdcC
 DS1DQWajtK4tl5W1oCYLX1sV/N6YtnKgXeiVyczFQuRyYs0l7PD7UEeVb/BHZ53i5xfi
 YRSCkQcuvj6/rPuA1cK4h+n0/TUgW8HNG/7w6Rw3tX0Iq1cqs/VcmZAuXEnrl5kQgtVZ
 rtmfkTYNN0qq3BjqP81vzpTeu56W1Wdsd/84ThscRZulmNU6swRBslleHxnSOKRzdLi1
 HLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ANsARq6fL07NGibn8cbk7oUpbzEAXo/i2Ol65lcGXGk=;
 b=VDjcr2Y8J/WHgmRSmvDfUfTmkVFACyafb1I8Mx3tdNo0VvLkfeF+a5Khw5rB2vI9aX
 nnKh1bGNeoMzQZ/lgds+oHsvdlGzXn9KK9iLD1MBEsOD/1wiurZWcyBmjhhKSdUKaulf
 amEtztJggDM9LZEEa7tWvx3miuuz2MsPt4qSTkqb5Wtr1F91zHkFIpUIkrJgEYzjkKPL
 A0NHZowiTVXNXnToqaF6ZZpnYA9POkGpktrbcdVESujdVTT3hzv3XIdVoH98AapvaIy6
 ByxO8eL5Qc3gKLj9E9W13SEjZYI/W7nr6L8KeLWXlgXTMeZzkGFg2HZ411dTtVbXN6eu
 KdXg==
X-Gm-Message-State: AOAM533RRwlA82T0g+D4xVirccW+BYKJclbKhbyA7CGTdFe2FjXGvvfM
 jfMO7l8NGrmnByziFgX8nAyQOWgAR/AMnNDj
X-Google-Smtp-Source: ABdhPJw2bUOgz+nMZFzakj6FRbaxaWpLQcIPs4OFTUfWc/C3daSngW+6ZM4wCuPndF5BEXIGMZjVag==
X-Received: by 2002:a05:6000:192:: with SMTP id
 p18mr17067580wrx.69.1612174501673; 
 Mon, 01 Feb 2021 02:15:01 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id e12sm25284137wrs.67.2021.02.01.02.15.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 02:15:01 -0800 (PST)
Subject: Re: [PATCH 0/2] Add MediaTek MT8192 clock provider device nodes
To: Weiyi Lu <weiyi.lu@mediatek.com>
References: <1608644414-17793-1-git-send-email-weiyi.lu@mediatek.com>
 <4536e0a3-8e64-d2b0-df83-33705d10359a@gmail.com>
 <1612171903.18201.6.camel@mtksdaap41>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <61667c50-edee-d9ef-0731-ce59e6c19995@gmail.com>
Date: Mon, 1 Feb 2021 11:15:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1612171903.18201.6.camel@mtksdaap41>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_051503_037308_D0550A6F 
X-CRM114-Status: GOOD (  20.12  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Weiyi,

On 01/02/2021 10:31, Weiyi Lu wrote:
> On Sun, 2021-01-31 at 14:27 +0100, Matthias Brugger wrote:
>>
>> On 22/12/2020 14:40, Weiyi Lu wrote:
>>> This series is based on v5.10-rc1, MT8192 dts v6[1] and
>>> MT8192 clock v6 series[2].
>>>
>>> [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=373899
>>> [2] https://patchwork.kernel.org/project/linux-mediatek/list/?series=405295
>>>
>>
>> [1] is already mainline. You could add this patch as a new one to [2]. But
>> please try to improve the series, before sending just a new version with this
>> patch added.
>>
>> Regards,
>> Matthias
>>
> Hi Matthias,
> 
> Actually I'm a little confused now. Stephen suggested me to send clock
> dts separately because dts may not go through his tree.
> So I separated it from the MT8192 clock series since clock v6.
> What do you suggest me to do next time?
> 

Yes, now that you mention that, I remember...
OK, then I'd propose to resend the DTS patches once the clock patches are accepted.

Regards,
Matthias

>>> Weiyi Lu (2):
>>>   arm64: dts: mediatek: Add mt8192 clock controllers
>>>   arm64: dts: mediatek: Correct UART0 bus clock of MT8192
>>>
>>>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 165 ++++++++++++++++++++++-
>>>  1 file changed, 164 insertions(+), 1 deletion(-)
>>>
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
