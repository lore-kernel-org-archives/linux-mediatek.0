Return-Path: <SRS0=KQlx=E6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 451C4C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 21:15:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DCB0206E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 21:15:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K0dkvIgD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kB+JIj6u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DCB0206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kUhINWWxr5t/SWAoJTVE5ksv4HuraCnAGPqyJk+L6bs=; b=K0dkvIgDsLh3JTzHC4DCEKXTv
	6ccURhqTycTUQdyeQpVZoYQQIwsrVipgUzZHCbayYkUJnoReiFqlwGEN0KCDwWaahkyvjEnbcAW56
	DAhttrhd7IPfSbTpxMuEEBNqErLy9VYPrq3OWYJ/dGK6iTHQtpdl7ExXwcU3BM8WapBnPqOn5wzCN
	cG4uLwnqkmGt6sc6KlOiw7NYZW9u70OaSvTYaSzFtRxXZn6lUp2TNnuCML6Sxep8VFc4SgF/N7Nt1
	t6waRpzXEJsGmumSwflzxf5yVISZzXL8xgp3QJidhvO9/1aLqgnH/43qTcixvqPp6x4ezZYM+9lpJ
	nbUEbplxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khfer-0000DR-9o; Tue, 24 Nov 2020 21:15:29 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khfeo-0000Cy-AR; Tue, 24 Nov 2020 21:15:27 +0000
Received: by mail-ej1-x644.google.com with SMTP id bo9so24771424ejb.13;
 Tue, 24 Nov 2020 13:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w1qiBNDdA1JwHw+2ZKcim6vrSTIhQv+8rDMvJ+E/JrQ=;
 b=kB+JIj6u4ow4o9fOz1GCL4oA8OsRunaz/tLguMU6KPdHTamjb0OfniiJjyeu8yJEdA
 AeX9sTZ8Vbjqsyx5jQTLdXQfienb1ojx0Xet2YY3X18T37cNyr0OCSNXJYGKT0mXIhbU
 TTnqyqP+tMM9UgQbhDgaK0eCjyFrQDNZU0Tv8/PSEjZzWUGLiwUKS8DQfUzzL1MSWDlk
 loGdrZvHX/GSUGQqynhVkJxnhwCSht/W2QPf/i02wSm1t87Rzf3og4hcgAQwPkcck6FW
 WNJ+W5DQDs7kZ/oYNf9lfLHrs8lumLy/vv4m8fE/aiMzezk2jyXE0hCEw13W3P8WyQbP
 ThxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w1qiBNDdA1JwHw+2ZKcim6vrSTIhQv+8rDMvJ+E/JrQ=;
 b=WKswxFWgRs8/8XL1l6rjWAJ6gtRXBI8nE2W8/kDxy3v1HJ+IL3x9cgefZUvLCtzbyL
 f7n+smJVdBylk7rhcbW/llZ0ITEM9RFUXxK4Btpzl2MEqL2Ba7jgy9hCymJElSE6Wgzq
 JhRjBKqXvHFK+T7e7+D+CAZV7o1hWTl5AoYX0RXf7PJz5poD+rBi7RzXJauBplio0fFP
 Mfl/VRcE+tQYm4ReM71Bl4ZzhpNTzQdbtWKhAvDx3UhE+QASm7W+P6yC9EqFH3xmpdnz
 KrU5WJeHX8lolNekzZxLlRwVNTulnKgu47daeR38MKI64KDm3tzg3MqmbdUeQuRt0TxH
 b7ZQ==
X-Gm-Message-State: AOAM530f76NPs+3r7dH0acrwWGxnO8n3YEZSKM3RrN/RBCjGe26hsZB2
 77l7abzfKSFmIwtJLGmJxq4=
X-Google-Smtp-Source: ABdhPJzYs+ib7boCpe0azznlmvJsLrs8rSJXM0GayRzIyyD7uhJFKjTe3LSeK1BW6W6MACfIua3Zew==
X-Received: by 2002:a17:906:5847:: with SMTP id
 h7mr344686ejs.124.1606252523461; 
 Tue, 24 Nov 2020 13:15:23 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:b507:ec4b:7acf:a836?
 ([2a01:110f:b59:fd00:b507:ec4b:7acf:a836])
 by smtp.gmail.com with ESMTPSA id gf6sm94382ejb.80.2020.11.24.13.15.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 13:15:22 -0800 (PST)
Subject: Re: [PATCH v7 1/5] leds: flash: Add flash registration with undefined
 CONFIG_LEDS_CLASS_FLASH
To: Gene Chen <gene.chen.richtek@gmail.com>
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-2-git-send-email-gene.chen.richtek@gmail.com>
 <3164b1ed-9e47-88cd-d492-ff5a9243e5ef@gmail.com>
 <CAE+NS350vuY1qNwn4_7ow8Z22_DfHrJAnKX1dsFM_WbaHziZiw@mail.gmail.com>
 <5c4a5780-afec-fa7f-307e-b969192ec677@gmail.com>
 <CAE+NS36yU_ho5eV=j2rd36XqGXBKj3d8KP-bsrCCnWvxzV3Afw@mail.gmail.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <e792dbfc-4b98-058d-bbe5-fd556463a757@gmail.com>
Date: Tue, 24 Nov 2020 22:15:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAE+NS36yU_ho5eV=j2rd36XqGXBKj3d8KP-bsrCCnWvxzV3Afw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_161526_431007_D042440F 
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
Cc: linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>, cy_huang@richtek.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, benjamin.chao@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
 Matthias Brugger <matthias.bgg@gmail.com>, Wilma.Wu@mediatek.com,
 Linux LED Subsystem <linux-leds@vger.kernel.org>, shufan_lee@richtek.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 11/24/20 7:08 AM, Gene Chen wrote:
[...]
>>>> This function should be placed after #ifdef block because its
>>>> shape is the same for both cases.
>>>>
>>>>> +static inline void led_classdev_flash_unregister(struct led_classdev_flash *fled_cdev) {};
>>>>> +static inline int devm_led_classdev_flash_register_ext(struct device *parent,
>>>>> +                                  struct led_classdev_flash *fled_cdev,
>>>>> +                                  struct led_init_data *init_data)
>>>>> +{
>>>>> +     return -EINVAL;
>>>>
>>>> /-EINVAL/0/
>>>>
>>>> Please do the same fix in all no-ops in the led-class-multicolor.h,
>>>> as we've discussed.
>>>>
>>>
>>> I think return -EINVAL is correct, because I should register flash
>>> light device if I define FLED in DTS node.

OK, I think I'm getting your concerns now. So you're only partially
correct - the driver should register flash LED device if there is
corresponding node in DT, but only if CONFIG_LEDS_CLASS_FLASH is 
enabled. In case it is disabled the no-op will come into play
and return 0, allowing the probe() to proceed as if the registration
succeeded.

 From the driver point of view nothing changes, except that flash LED
ops will not be called afterwards. This is common pattern. If in doubt
skim through the headers in include/linux.

>>
>> I don't quite follow your logic here.
>>
>> No-op function's purpose is to simplify the code on the caller's side.
>> Therefore it should report success.
>>
>> Please return 0 from it.
>>
> 
> Just like those functions in led-class-multicolor.h, caller may use
> return value to check whether FLED is registered successfully or not.
> For this case, is returning 0 a little bit misleading?

Please note that I've already admitted that led-class-multicolor.h
class is buggy and should also be fixed to return 0 from its no-ops.
Please apply the "s/-EINVAL/0/" fixes to it as well - your driver will
need that.

-- 
Best regards,
Jacek Anaszewski

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
