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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84DA8C43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 20:23:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDA3C21D7E
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 20:23:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fFbpO6q/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Md9/FDi2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDA3C21D7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GD2sKXam/+OPBsbv6oJiw1Ee9ABnCAxhdJeZ8EWiylo=; b=fFbpO6q/PUVjbT8ZhJbG2Cxtq
	g73s9wT0c0jAcqyWIRvRvSgNHbJsm2T0U45PSLXgk/a2hS1TUIf8zO9UV4Uzg0hC5JU+P1iXX0DhV
	5LDNuZ77VHwfomfBKvaAgSqau2biC0TPNuKJmLhGXke5xeFVnv3sl7fBUifQkuj55ZD38UrkB8Ww5
	pTZ5WmkVnTEjBTELxZB/OSsoZuW+uqqDqp4DICR1RLmTimsKVcXz1JlXa6W+JilE7nqqyAOiULOex
	ijuiczvz9ZwfTwfLcfRngPiZvJ88MyjAFNrYr9QYMFLx4JbKjysFJmfZG5GYoKE8b8XecZCYmnajo
	jYGvGQGug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGT6O-0002oT-01; Thu, 10 Sep 2020 20:23:28 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGT6K-0002nw-VU; Thu, 10 Sep 2020 20:23:25 +0000
Received: by mail-ed1-x544.google.com with SMTP id l17so7638672edq.12;
 Thu, 10 Sep 2020 13:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dW7YjxHc1ZzJ6SX3ZapZTyVcg2BZ2MrVhHy85wYAM7s=;
 b=Md9/FDi2UjXqMZ/r9zTDvWPc7EStWF1BrZkVX0n0rB6Plr9i6GajBhtdIytxV3tKuX
 rgEuLKaAvTuXJnRCs8eDnunMlw7oe9kT+MLG4tXOH6el8N3ZQwISu5/L/Bu9YEtUicla
 iOhWNNLMURqUJ+LO3LLtuDmtQvpHsdwz+WDLjF0vvuDVySEH1qig9lfrF6nu2cVQGcQr
 I/87h+NoyYId+iaX2/sZQrMw342JCxOwhgjf+hW2vos7DOoRnmVTIjgUEBcOe2Qow6v3
 u4UxPzPTvmwMl5FZv9AvU3DuxVXQU+vpkM6rEpSe99BS+70BxtwObtsc056guNjXKbmx
 Mwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dW7YjxHc1ZzJ6SX3ZapZTyVcg2BZ2MrVhHy85wYAM7s=;
 b=uY8PQ13MZDyH3wp1LVnVZ5Mgn8/8bwxswxGwqWy6b7ShWnXWzS1gQKw2Lor7ZL7RwM
 +644vHYS2A4//SAz7VdI0B0LuSPFTHJDxgMkO97BYOmphBwlgYccESzYZjVaCyZ/qaKk
 704iFC8T/1DbRE5v7nnBAxJp9E4jr3p4VZzu7Z3c6x6ZP6mt0g60uC1OyQ/9VFt3k3B/
 nGknNmHpHTxumVbkhhdqYzVUeHeJ6wKrO+RiqdYA0kE4QJ4oU+U8N1sAW3UQJ/48jvOF
 7+n3RvYzMrchAqufU3smFiD1QGSVO8HgmJptxuyAg3TDgR1HM7SPSb3qdV1+UyM2TTnm
 AtJg==
X-Gm-Message-State: AOAM532GckrNC7tUCAUGslVQjjahxE8pHIUB6S9PhLolapei2chZ0OaU
 SiM1WYEIxDP2Z0K65NsNJUk=
X-Google-Smtp-Source: ABdhPJz5MaQV71/AFS75F/hFw0qE/EwQO1ZoaAl2WyDBhKG+riuqvQJ28JycZSAGOmthz7MbQu3otw==
X-Received: by 2002:aa7:dc16:: with SMTP id b22mr11083008edu.252.1599769401165; 
 Thu, 10 Sep 2020 13:23:21 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:a856:4fc0:9f1:73f6?
 ([2a01:110f:b59:fd00:a856:4fc0:9f1:73f6])
 by smtp.gmail.com with ESMTPSA id dh3sm8455572edb.84.2020.09.10.13.23.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2020 13:23:20 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] leds: mt6360: Add LED driver for MT6360
To: Pavel Machek <pavel@ucw.cz>, Gene Chen <gene.chen.richtek@gmail.com>
References: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
 <1599474459-20853-2-git-send-email-gene.chen.richtek@gmail.com>
 <20200908222544.GF1005@bug>
 <CAE+NS34h9qbdHkYDYDnHGgk+9mFNTRpKEMKNEFZ+Secf6JyoZg@mail.gmail.com>
 <20200910122958.GF7907@duo.ucw.cz>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <489fc92f-f6f5-839e-e417-7761d404e6ae@gmail.com>
Date: Thu, 10 Sep 2020 22:23:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200910122958.GF7907@duo.ucw.cz>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_162325_043299_90CA5EC2 
X-CRM114-Status: GOOD (  14.69  )
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
 Wilma.Wu@mediatek.com, linux-leds@vger.kernel.org, shufan_lee@richtek.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 9/10/20 2:29 PM, Pavel Machek wrote:
> Hi!
> 
>>>> +{
>>>> +     struct mt6360_led *led = container_of(lcdev, struct mt6360_led, flash.led_cdev);
>>>> +     struct mt6360_priv *priv = led->priv;
>>>> +     u32 enable_mask = MT6360_TORCHEN_MASK | MT6360_FLCSEN_MASK(led->led_no);
>>>> +     u32 val = (level) ? MT6360_FLCSEN_MASK(led->led_no) : 0;
>>>> +     u32 prev = priv->fled_torch_used, curr;
>>>> +     int ret;
>>>> +
>>>> +     dev_dbg(lcdev->dev, "[%d] brightness %d\n", led->led_no, level);
>>>> +     if (priv->fled_strobe_used) {
>>>> +             dev_warn(lcdev->dev, "Please disable strobe first [%d]\n", priv->fled_strobe_used);
>>>> +             return -EINVAL;
>>>> +     }
>>>
>>> So... how does its userland interface look like?
>>>
>>
>> 1. set FLED1 brightness
>> # echo 1 > /sys/class/leds/white:flash1/flash_brightness
>> 2. enable FLED1 strobe
>> # echo 1 > /sys/class/leds/white:flash1/flash_strobe
>> 3 . turn off FLED1 strobe (just used to gaurantee the strobe mode
>> flash leds must be turned off)
>> # echo 0 > /sys/class/leds/white:flash1/flash_strobe
> 
> I believe I'd preffer only exposing torch functionality in
> /sys/class/leds. .. strobe can be supported using v4l2 APIs.

Actually having LED flash class without strobe is pointless.
If you looked at led_classdev_flash_register_ext() you would see that
it fails with uninitialized strobe_set op. And V4L2 API for strobing
flash calls strobe_set from LED flash class beneath.

That was the idea behind LED and V4L2 flash API unification - there
is one hardware driver needed, the V4L2 Flash layer just takes over
control over it when needed.

-- 
Best regards,
Jacek Anaszewski

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
