Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8456EE57C2
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Dec 2025 23:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ZRg1doJmXxLNzyi9m4dAo35YsgsZxHf7TH/2wMLs8I=; b=GngJuesQ3Lm/eShpkWvwrO53y7
	9qhjsW2WhQJPQg0Ub8BC5f5NcSTeiXMbCm9CtyCiVMKXJv/hn6sxX9K+EVZ+PI+SlCU+PikmkV7Lc
	y2gK3zX8e7NydHIYtnJzVQ/+R3+hgohtnD2DXnbq9qoAZTeKUnaALKGxSpCM+YDmZmBrLeeIi5Rfp
	S8uR7G9M3J4lnvtVgVNqYbKlyhUzZTUz7YCm2IGlIKZ8s3/bHeP66BMlkkLByk7oldeoauF8MxsF2
	B3Poz4J0WBaKtBFrsBtEYa6q/kKJecoHnUUM0gdJA+24oQ+JIGwB6M2AOGABrS3M4EUHy8dHR2NiV
	oH92WPaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vajag-00000005Ths-3tN1;
	Tue, 30 Dec 2025 23:57:26 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vajad-00000005Th1-3s7v
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Dec 2025 23:57:25 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7c71cca8fc2so6541381a34.1
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Dec 2025 15:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1767139042; x=1767743842; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9ZRg1doJmXxLNzyi9m4dAo35YsgsZxHf7TH/2wMLs8I=;
        b=F1jHHP1yF8KxGS0MaJUGWdfnsoKRk3CW1Bp0tnXMgaiZNKu7RhtErjjXlI04AhPoz0
         +ZcyPkOOSjG23Pyws5JR08Uipigp8VcbN3ok/gEYPSzNXcqY2pd6i+PnglBg3qOzDPg+
         NGLvKzkU1aH9tpP/XPZ6uJOo1V22kurCfl3NI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767139042; x=1767743842;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ZRg1doJmXxLNzyi9m4dAo35YsgsZxHf7TH/2wMLs8I=;
        b=ff2eakJoyiKr3SuKfS6s2LDkJ/mJ/WWA2qe4IKl+3nNXxykxPH3mmq059cXXd5S9+q
         ZlkmH6DX6ehTBUD3vuRBf92cFHeEvPNQp1ahLkN7wEYa895TXQntV59A60UnoOgtDjQh
         VcSkWmz8k8xHYKRxMe/K1Sjq2/6spq6kASxWWsJyWXgxbVbL2bV5On8+b4nWEXNGVpX3
         Ha1jGocnka5tov5Gw6Jacjb77RAfkiacpNW6vXiPbo4fT4sD/OhctbEuijf38YZs+rf3
         Lvb4OBsxpPR4IxRgN6ijnfv+ZW1auQAgBVy9zhHYMsRuTaS2nwvlkjmSFzeldCYhhsmB
         skjg==
X-Forwarded-Encrypted: i=1; AJvYcCU6NI1aPY3XswiSxnUqoi8zLV2nZotM70cpgbXV8W5VHzKLW5cPWwVW1RVCgNdHht04/xRCkuZcYmVfUz+omw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzOTD2IZU+VpyP5lJ8RQ6Bg7qtmQ7pVjFkLjxYz1HizS9mIZfxG
	pyn7t4+QD/jr453/bAYplNjQQ+ehLHV6jZIgrAN3rt6Gy6oqbGQGxeWqqAcy7H4wb/g=
X-Gm-Gg: AY/fxX4pg4jFQOwUi+EOysVChu0pdE964JV9NgiHJ6/sgins5hjvusraztQ7rBBwDEQ
	zmv60qMFB3M5TCkwOB/ueRi1v/6VGuWK4+8IzrGZHnwaNNTJ1LdWG8ET7Ys8uwB9eAAA9dajU5I
	AeRHhhmwe8ftu0soSDDjsxtMaWsAow84QvcAbMfho37HPyLjLW5oCTBqJwlbXKdUlBRsz6oa6FU
	Pg2kioKGs2rXPIaEB2brGRvUW+LZs/BR+Y7p78YJXAkZdgU4dcBI40XWstAeoy2FzWmQqIk28ce
	Pnwt9qjRIbHwyh6Du/j+qkyZrIW/bTsUdZBXUl9T7AiPlafPHCNUO2YNcwWxGgj9JUxeZ/NE+nJ
	9BqL/WpoWKWxPV6YQORsGeX2tQ5vDtwkfFpvBGvTL1ltM0yz09wmEesEb6U9guTp3SgiPEQGkwc
	dhE65dq+nGs2ifSR77jeie8vo=
X-Google-Smtp-Source: AGHT+IFWzRYyQNvTNkw9RmEVarae7rk5zx6WELg3Z4a91hRiSu2BAOlPWkJeyCXLdCBX204JSS8o8g==
X-Received: by 2002:a05:6830:43a4:b0:7c7:6da2:6d67 with SMTP id 46e09a7af769-7cc6689d9a3mr23413145a34.3.1767139042078;
        Tue, 30 Dec 2025 15:57:22 -0800 (PST)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc667f958asm23072914a34.27.2025.12.30.15.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 15:57:21 -0800 (PST)
Message-ID: <c1304430-dd7d-437b-8744-70af9ca85c0d@linuxfoundation.org>
Date: Tue, 30 Dec 2025 16:57:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux 6.19-rc1 mediatek mt7921e broke badly
To: Matthew Schwartz <matthew.schwartz@linux.dev>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Eric Biggers <ebiggers@kernel.org>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 Mario Limonciello <superm1@kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>
Cc: quan.zhou@mediatek.com, Felix Fietkau <nbd@nbd.name>, lorenzo@kernel.org,
 ryder.lee@mediatek.com, linux-wireless@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek@lists.infradead.org, shuah <shuah@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <d7f3b00d-beec-41f0-b157-7cfb871f9a46@linuxfoundation.org>
 <756e3f65-b2f2-4da3-985a-17754a7a872d@t-8ch.de>
 <CAHk-=wjO-7uR5HBi-MFnkxAxjhpgfbAQ+HCMKPiXFVwM+AJ7tA@mail.gmail.com>
 <6fc04df5-b753-4b2d-b978-0e59a7f48ff7@linux.dev>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <6fc04df5-b753-4b2d-b978-0e59a7f48ff7@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_155724_323913_0CA93F56 
X-CRM114-Status: GOOD (  22.73  )
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

On 12/29/25 21:21, Matthew Schwartz wrote:
> On 12/29/25 4:41 PM, Linus Torvalds wrote:
>> On Sat, 27 Dec 2025 at 04:25, Thomas Weißschuh <linux@weissschuh.net> wrote:
>>>
>>> Hi Shuah,
>>>
>>> On 2025-12-27 02:07:24-0700, Shuah Khan wrote:
>>>> mt7921e doesn't load on my primary laptopn on Linux 6.19-rc1 and problem
>>>> still there on 6.19-rc2.
>>>
>>> This should be a duplicate of
>>> https://lore.kernel.org/all/CABXGCsMeAZyNJ-Axt_CUCXgyieWPV3rrcLpWsveMPT8R0YPGnQ@mail.gmail.com/
>>
>> Hmm. I wonder if we could instead do this:
>>
>>    --- a/lib/string.c
>>    +++ b/lib/string.c
>>    @@ -113,7 +113,7 @@ EXPORT_SYMBOL(strncpy);
>>     ssize_t sized_strscpy(char *dest, const char *src, size_t count)
>>     {
>>            const struct word_at_a_time constants = WORD_AT_A_TIME_CONSTANTS;
>>    -       size_t max = count;
>>    +       size_t max = count - 1;
>>            long res = 0;
>>
>>            if (count == 0 || WARN_ON_ONCE(count > INT_MAX))
>>
>> (intentionally whitespace-damaged patch, because I want people to
>> think about it).
> 
> I gave this a try on its own but I was still experiencing a kernel crash:
> 
> [    3.339408] strnlen: detected buffer overflow: 17 byte read of buffer size 16
> [    3.339804] WARNING: lib/string_helpers.c:1035 at __fortify_report+0x41/0x50, CPU#14: kworker/14:0/105
> [    3.352248]  __fortify_panic+0xd/0xf
> [    3.352259]  mt76_connac2_load_patch.cold+0x2b/0x95a [mt76_connac_lib 8f0d0f7b30f881af23462dac0a8cc5ff88d08cd0]
> 
> However, applying a similar diff in the fortify wrapper does prevent the crash:
> 
> --- a/include/linux/fortify-string.h
> +++ b/include/linux/fortify-string.h
> @@ -306,13 +306,13 @@ __FORTIFY_INLINE ssize_t sized_strscpy(char * const POS p, const char * const PO
>        * This call protects from read overflow, because len will default to q
>        * length if it smaller than size.
>        */
> -    len = strnlen(q, size);
> +    len = strnlen(q, size - 1);
>       /*
>        * If len equals size, we will copy only size bytes which leads to
>        * -E2BIG being returned.
>        * Otherwise we will copy len + 1 because of the final '\O'.
>        */
> -    len = len == size ? size : len + 1;
> +    len = len == size - 1 ? size : len + 1;
>   
>       /*
>        * Generate a runtime write overflow error if len is greater than
> 
> Not sure what the implications of such a change would be relative to the proposed
> fix here: https://lore.kernel.org/all/20251205161202.48409-1-mikhail.v.gavrilov@gmail.com/

+ adding Johannes to this thread also.

Reverting the following fixed my problem.
  
f804a5895eba ("wifi: mt76: Strip whitespace from build ddate")

The above fixes an extra newline in the dmesg by making the
code more complex it needs to introducing local buffers and
strscpy() - the proposed fix replaces this with memcpy().

Is there a simple way to do this than introducing memcpy()
or strscpy() to remove an extra newline that might or might
not exist? Why not check if newline exists or not using
strstr()?

I would recommend reverting f804a5895eba instead of trying
fix it. Then find a better way to eliminate extra newline that
shows up in dmesg when firmware build date happens to have
a newline.

thanks,
-- Shuah


