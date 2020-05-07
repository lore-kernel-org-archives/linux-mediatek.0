Return-Path: <SRS0=F/ID=6V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0103CC38A2A
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 20:45:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCAB920A8B
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 20:45:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tQ6iLj+6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LENSQd08"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCAB920A8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZUYD3902GCZkehir4t/wUo4Ui3pZnwOLsMS18SxsG/k=; b=tQ6iLj+6S0b+74FRZ9m0+c36M
	zHBwq6l3EzT/Z1+hk5dR3u7V8AXrs3mAxMhHfQfG89RIL7NmoMZE+1tFVXhuzZaPurl/5SnkMsxXW
	nxeoshgS0UudcGcOswlX9c+8LCOmEGJLApNqcBq51Jsd2KaaY8paeiiJvfbYavOoY9f4ROOF+3CMO
	6eOteK1dxzSKL+udLHPUY4OAETjEonzzQ0A9MDvHJfECRH32UHS3LfIhGU9wCzu1peVROC9vlSkbO
	vZMAWYxFuU/I+RL0sYNG67S6e5S48KUl4myW2KRuY9RT48ii2cdGAJXvKGs+zVK3RuVjrcck1aOQ2
	jsMk89iTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWnOo-0004lV-C7; Thu, 07 May 2020 20:45:42 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWnOm-0004kl-6j; Thu, 07 May 2020 20:45:41 +0000
Received: by mail-wm1-x342.google.com with SMTP id h4so8049510wmb.4;
 Thu, 07 May 2020 13:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EgSenpJ9WdkZ8OKwBXP2DgQKftDc5f3xLrRoRS99rrY=;
 b=LENSQd08QX5NaqMQv2LT6RIu0jqhyK1RA9jx74+JCuyjPGutBwzMG1dggwylsZeGry
 zcHma3C9ZM9PMeoGg8/AEkpAaDsrbTW6jSpiysq1eAo7nnR72upnpLcCWRgbNMWb5i2+
 FLcoKaTjjpl2+IVGe+jWgpwcac4SNjKsDq79VncKZlK5ZNsPMff5Qu5U62EsBlmn6hAP
 +PPd57+B2mw4lwDsHNlkjO/y6IttDvZOqt5mvLdgcaiZY0XL3i4kKV83/PvOGtop+nfz
 rN3Q+1gp1pJq4fDV/qddFhuTepVjeKqMlcabI5hUhhsHr5sih40lklDBoxgLn3gXNaq+
 zHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EgSenpJ9WdkZ8OKwBXP2DgQKftDc5f3xLrRoRS99rrY=;
 b=KSH7O1hGyFE6EfmUGk167b3tk70a5TWAaDOFhxXxqfOgojtaiMJY8g4Qr5mNpJ4hHG
 4FcMaCnPxaKnIzrUZWGutIa80wgMnYIySCEvVInPLGwIPWKN4fAqfcVnF7RT8xUxZeSa
 RfM2bTESzLFoDabxYkWsjCG8hDAbswuJagCiGHBQazvaGoYNX7CbpL6ajgQsvTa1/pva
 rNDiYAmByMPseQhSuBDfVwjCkhRqCWAGaslv3Sw4M4HA6Tq2IdD9hC3D0A1Sxt9x5a5W
 0a7kHohMg3u5ci9PDFHSFvgH6iyyB7mSylmca0+fdI0MHlOhEBvjjMrM4mWYk1XWY5Gk
 L6CQ==
X-Gm-Message-State: AGi0Puah1cuB4s7pkASnegF559b410WGBiztYD6Km+qjT8HHITMjTvzC
 aijAX59ACyDSZIq2PUzh8EE=
X-Google-Smtp-Source: APiQypJDPtO7u5KS/TvTk4SarG2mbA6/1SMRO98Kuhx1nMuJH/xjhRVJBu9DL7rHxZEaEaKeYQlR3Q==
X-Received: by 2002:a05:600c:2941:: with SMTP id
 n1mr12743483wmd.25.1588884337413; 
 Thu, 07 May 2020 13:45:37 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:5df1:24f5:998f:ae84?
 ([2a01:110f:b59:fd00:5df1:24f5:998f:ae84])
 by smtp.gmail.com with ESMTPSA id 19sm9451068wmo.3.2020.05.07.13.45.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2020 13:45:36 -0700 (PDT)
Subject: Re: [PATCH v1] Add support for MediaTek regulator vibrator driver
To: Pavel Machek <pavel@ucw.cz>, Xing Zhang <Xing.Zhang@mediatek.com>
References: <20200429081759.26964-1-Xing.Zhang@mediatek.com>
 <20200507174519.GD1216@bug>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <49089bf3-d64b-2a50-269c-623a6ea9c14c@gmail.com>
Date: Thu, 7 May 2020 22:45:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200507174519.GD1216@bug>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_134540_268313_A71E2FFB 
X-CRM114-Status: GOOD (  13.67  )
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
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Dan Murphy <dmurphy@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-leds@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Pavel,

On 5/7/20 7:45 PM, Pavel Machek wrote:
> Hi!
> 
>> This patchset add regulator vibrator driver for MTK Soc. The driver
>> controls vibrator through regulator's enable and disable.
> 
> We'd prefer not to have vibrators in led subsystem.
> 
>>
>> Xing Zhang (3):
>>    dt-bindings: add regulator vibrator documentation
>>    arm64: mediatek: Add regulator vibrator support
>>    Vibrator: Add regulator vibrator driver
>>
>>   .../bindings/leds/regulator-vibrator.txt      |  39 ++
>>   arch/arm64/configs/defconfig                  |   1 +
>>   drivers/leds/Kconfig                          |  10 +
>>   drivers/leds/Makefile                         |   1 +
>>   drivers/leds/regulator-vibrator.c             | 450 ++++++++++++++++++
> 
> OTOH, connecting LED to regulator might make some sense. I can take the driver with
> vibrator functionality stripped, provided it is named the usual way...

We already had an attempt of solving this in more generic way [0],
but you opposed then [1]. Just for the record.

[0] 
https://lore.kernel.org/linux-leds/20170913175400.42744-1-dtwlin@google.com/
[1] https://lore.kernel.org/linux-leds/20170914205804.GA24339@amd/

-- 
Best regards,
Jacek Anaszewski

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
