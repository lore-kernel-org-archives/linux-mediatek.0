Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E60C43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 20:31:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CCE8206E9
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 20:31:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f1oivv9h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qAkJzsOT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CCE8206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cC9ZvH9ChJQiShqFkN/yv433hGVEEg3eEgNh2AIjMak=; b=f1oivv9hIeUDjk9SFp4LNLE2T
	ueNuM9oGXEp1GeLPk7VWU1g/FMk0ZNnBbyEfnkKcGXMmQcssU+IpUW+ANvNt7evAMZjqXnlMTSYjL
	k6f8jFL20BKoy4iFXsxjxcODSOnxOGi7MlJpNmqxSiyDAo5Mgt7p6/TDU+EJLoG5r8eLT6M70YXqf
	yZKIA9x6DTGQUV3fWC1vYvaAfCjBq58FzBQqRQX1tJ+xoWX7iTs7HyBT6GchVIlVRsWwaZAzAdfLe
	Q9VRe3Yyvd4iO05d1i1r9TsWjWNzMqxTJIbWCpAkJisTBk9h24PwuquFDvHvVLs0U6izD+4FTZkfN
	ln0P3A9VQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGTEE-00046P-QG; Thu, 10 Sep 2020 20:31:34 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGTEC-00045f-It; Thu, 10 Sep 2020 20:31:33 +0000
Received: by mail-ed1-x543.google.com with SMTP id c8so7708266edv.5;
 Thu, 10 Sep 2020 13:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A48ne1NZlAQmHWx3dwlyO17eMOtVRiN/7Bebdr8XWds=;
 b=qAkJzsOTQfBfqX4KhmgLrREZOhXSHGek4jbzsfgSuMFFH08Wf35AoC/0ivbDoEao+d
 ltUXZhmvykpyQPtAkjR+EB2M+fIDoUOOnbPqLvJqDRAasaLKHHebM3+4OJp49dAzAjm+
 HlT+ha/16Fm+9/z4MAjMexCaHaNc7/FSdIvo2Q2wcwlo+CS7amwG4/HPSfPmwJig1yvY
 GMyUBSUL6B/J1YIomto7fZoQBYOHp7Ja9ZxpDLFBlfwmxPB1X8jI7e0zaQEpWWMo3FnK
 l4+I1llshFvj22o62w8UMZ7Po1b6eRreNY2IOZkEqhNz4aJF+S7XGmQEtVUi1FHlPU4O
 b9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A48ne1NZlAQmHWx3dwlyO17eMOtVRiN/7Bebdr8XWds=;
 b=ak/yg+3eVC7c8wv9emwc6C3BRiuEb1/WlARMyIZpiq9LVmNm24glt1VqYVKijTk4se
 UQUOm1jCqq8XDTb66INra6vmEwGb6R2ofqG90FJQDfSAcZDV4GZyljXdLudgV+8urAES
 3UrGqcSqmPZZJe3wMT4bWSMvv+MFFRHvaOSKYCv5bBNNqAnZ6dJnf2mdwbcZlVHPRChc
 Ct72r/37gSqpgI3mJkyl9KjuUOvkc30+0ovA4ehG+DjRBSEf9+WB964yo0ufhyd0YbS3
 jySbUQL95bXZBIMAtJ5nqGHxhGw1X55fkKkg33BltcyuVzWxVhdGdpH2TCOfb5MhcXrz
 iyZQ==
X-Gm-Message-State: AOAM532m4Jufmi9oFCqwgRlFP+ju4uTJo8rZi6P0UylYy9GC6AbLDJat
 +t7eCkQ2y3+mhEBBWMdeVrs=
X-Google-Smtp-Source: ABdhPJw+zf8rBSPAdo8LdqmvoKcln9GQDEKYZZoP7GcqLXI4914UllNCnLTRXClIOmfeYbqwRTbxIA==
X-Received: by 2002:a50:fc91:: with SMTP id f17mr11652949edq.319.1599769891532; 
 Thu, 10 Sep 2020 13:31:31 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:a856:4fc0:9f1:73f6?
 ([2a01:110f:b59:fd00:a856:4fc0:9f1:73f6])
 by smtp.gmail.com with ESMTPSA id v5sm8181205ejv.114.2020.09.10.13.31.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2020 13:31:30 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] leds: mt6360: Add LED driver for MT6360
To: Pavel Machek <pavel@ucw.cz>
References: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
 <1599474459-20853-2-git-send-email-gene.chen.richtek@gmail.com>
 <20200908222544.GF1005@bug>
 <CAE+NS34h9qbdHkYDYDnHGgk+9mFNTRpKEMKNEFZ+Secf6JyoZg@mail.gmail.com>
 <20200910122958.GF7907@duo.ucw.cz>
 <489fc92f-f6f5-839e-e417-7761d404e6ae@gmail.com>
 <20200910202510.GB18431@ucw.cz>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <7ce924da-5119-0406-7995-560c32097040@gmail.com>
Date: Thu, 10 Sep 2020 22:31:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200910202510.GB18431@ucw.cz>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_163132_668017_67D80A1F 
X-CRM114-Status: GOOD (  17.47  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 cy_huang@richtek.com, linux-kernel@vger.kernel.org,
 Gene Chen <gene_chen@richtek.com>, benjamin.chao@mediatek.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 Dan Murphy <dmurphy@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Gene Chen <gene.chen.richtek@gmail.com>, Wilma.Wu@mediatek.com,
 linux-leds@vger.kernel.org, shufan_lee@richtek.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 9/10/20 10:25 PM, Pavel Machek wrote:
> Hi!
> 
>>>> 1. set FLED1 brightness
>>>> # echo 1 > /sys/class/leds/white:flash1/flash_brightness
>>>> 2. enable FLED1 strobe
>>>> # echo 1 > /sys/class/leds/white:flash1/flash_strobe
>>>> 3 . turn off FLED1 strobe (just used to gaurantee the strobe mode
>>>> flash leds must be turned off)
>>>> # echo 0 > /sys/class/leds/white:flash1/flash_strobe
>>>
>>> I believe I'd preffer only exposing torch functionality in
>>> /sys/class/leds. .. strobe can be supported using v4l2 APIs.
>>
>> Actually having LED flash class without strobe is pointless.
>> If you looked at led_classdev_flash_register_ext() you would see that
>> it fails with uninitialized strobe_set op. And V4L2 API for strobing
>> flash calls strobe_set from LED flash class beneath.
>>
>> That was the idea behind LED and V4L2 flash API unification - there
>> is one hardware driver needed, the V4L2 Flash layer just takes over
>> control over it when needed.
> 
> I agree that one driver is enough.
> 
> But we should not need flash_strobe file in sysfs. Simply use V4L2 for
> that.

Apart from the fact that we can't remove it from LED flash class ABI
now, why would you like to prevent the user from exploiting main feature
of the hardware?

-- 
Best regards,
Jacek Anaszewski

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
