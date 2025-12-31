Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CDAEEE49BD
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Dec 2025 04:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rEWpU9UfmDCYEMxA6nsMxalblaTS4cfYkzlnNo+UBaQ=; b=xTpJqWq2NnLzpGHhntc/xmG0w5
	+qFX3HA8JB+efXNpSCmPBn1urR05KC2VE+JqvxNA7s33owJ5BwmB3Va/TC9puYZsmw6maAvbRR89T
	xJM8Hrm1h31e0AyRX5hceMbdOvu3jtg4E7rsv26R2D2Szrvhwxl9lHGQ0NLbvuI/ME8htB+XR/wxH
	BfWgGjXjNTwVg9PwFYgnjbF5jqOXRy6KMLmMEinq4GUUtTek46ZYRsqUXxkw9naVNwqIChm0KAKvj
	G4cN1oIb9EguVJJitqayxJL2j4NwEYzA/L9w1zRDCfdRUsQANhC9WJmZAHDS/0g4uHcVT44FQlt3Q
	h+/WXztw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vanV8-00000005fcb-3QZU;
	Wed, 31 Dec 2025 04:07:58 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vanV6-00000005fbv-0qP4
	for linux-mediatek@lists.infradead.org;
	Wed, 31 Dec 2025 04:07:57 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-450b5338459so6011063b6e.2
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Dec 2025 20:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1767154075; x=1767758875; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rEWpU9UfmDCYEMxA6nsMxalblaTS4cfYkzlnNo+UBaQ=;
        b=Y3iFhbKPiwWXkXJRI3mw9pYNGjTNwPnaIPlVWDegltzIjnNbo9JPG3aNyTNv/LF812
         /hP11cXozt5sKmBLozhHPTKlyAK2xH7uDihL+Zkrj6tpX9ydlU65kYNeBhLC5mps1Gk4
         W41NFPp/qZTHvklw80pLWMB3cLdMCvuH5t3bA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767154075; x=1767758875;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rEWpU9UfmDCYEMxA6nsMxalblaTS4cfYkzlnNo+UBaQ=;
        b=FzyEiG/eoDbTQQVZM3PS/GbQwyA9akp9q2ZeORO67v7LXqCgbPZFJYPTfbzDXDhXQI
         fg+Wb5njtpEzV1A9Zr+I8j9DCXTyBMwQBmOJvu9aCAF/KMiOiJ++mzV39frDI4ZlFHVu
         sHqLUUeG4Jn75Y59M0VA8xFBQC2ULr/CzeB4lcJbbzd8Ag+yonoczI7VMKwhVoRNhyLW
         aX1tFPoKqJPUUNcTxHg+LylRbzgecuaCiWWXo6B8Zc7EM7AyKUJVPulZQ0zXOL6vpmEY
         3f2OBOtVYeypCmmc4E8DlpvMi2IxdxsMPH9k4YpTZsw1EXoQdzmzD5uhaWHY4gYWgxci
         OU9w==
X-Forwarded-Encrypted: i=1; AJvYcCXe7sWrqeQyeFVy7CeNuNiHj9Njo5EKpjMmHf4cKBFe+y9K9Cy0zG9s7iZg73gt9f6wXmYb5c8tYRtGuCQlrg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzzHNbYJMaK1lGPULb/FfYOc+Q06TZDPozi10WLlBEMZf/iyj65
	DQnlXp3MZopUpjBAGo+l2oqvzDabotRGndvqQpkAr7RubyVAkPVEU4lAuJhLSDdaEso=
X-Gm-Gg: AY/fxX79FYPdasqATVNOTWUUsnAiERZCBXzRwTtz9wSsxh2ltCxVEvY0QKZ527iCMT2
	ok++4wsVaOW4hxQzAjbzSx8FakU6fC8Vr3JzJHyBpvyAP08S0RewN81afN10yX9ZOKz9DLX7Uri
	d+xggzV2oIknBEpAtNUw2G9Bbz/1MW0uUMprqSbHjJ4T7Vw8toJCEhPQGqkVIphhSHEWrD8hdJ+
	LQ/fO9DeqrY9/w2MtO1PAgi0M/lqCQQCgxiaANtSLkGANy28G8ATD2y2RISiO0tdkhYHH9PnuoX
	6PSbGdGhHRB5aAFLZcAiLyJ0ju5FiDOAfmk44dMtnQ0tvwjzzJItblMtSmIHivo9AM5/Qdl9/uN
	5p2lGNF3N3v3HL38rH05TPpwswdp5X9Bz8fT2LZhGOa+cWkF+90L5rHug7F0bTLx6xTpC7wuez+
	jgAMbk7C5BvFYfk3K+IP9iq+A=
X-Google-Smtp-Source: AGHT+IGk43rmMGz2LTVg3do8lOBVQ/ADeo1lfHCAWZcf3O24miuOt3rdd/Qp6y8+P/Y0QEMjm9pUgA==
X-Received: by 2002:a05:6808:2e4d:b0:44f:8f27:e39a with SMTP id 5614622812f47-457b2061b07mr18260342b6e.8.1767154074844;
        Tue, 30 Dec 2025 20:07:54 -0800 (PST)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3fdaabbf2e6sm21907245fac.17.2025.12.30.20.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 20:07:54 -0800 (PST)
Message-ID: <30d14c51-3325-49be-9510-43f4661ff6c4@linuxfoundation.org>
Date: Tue, 30 Dec 2025 21:07:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux 6.19-rc1 mediatek mt7921e broke badly
To: Eric Biggers <ebiggers@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: Matthew Schwartz <matthew.schwartz@linux.dev>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 Mario Limonciello <superm1@kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>, quan.zhou@mediatek.com,
 Felix Fietkau <nbd@nbd.name>, lorenzo@kernel.org, ryder.lee@mediatek.com,
 linux-wireless@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek@lists.infradead.org, shuah <shuah@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <d7f3b00d-beec-41f0-b157-7cfb871f9a46@linuxfoundation.org>
 <756e3f65-b2f2-4da3-985a-17754a7a872d@t-8ch.de>
 <CAHk-=wjO-7uR5HBi-MFnkxAxjhpgfbAQ+HCMKPiXFVwM+AJ7tA@mail.gmail.com>
 <6fc04df5-b753-4b2d-b978-0e59a7f48ff7@linux.dev>
 <c1304430-dd7d-437b-8744-70af9ca85c0d@linuxfoundation.org>
 <CAHk-=wh6WP0Wq=rbC2Md6vsFrV-+nvDjxgfx9NpMzUmVFNkJ9A@mail.gmail.com>
 <20251231015712.GA2299@sol>
 <fdebed60-264d-4f05-9423-618bc3ec6d6d@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <fdebed60-264d-4f05-9423-618bc3ec6d6d@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_200756_257444_4B648B06 
X-CRM114-Status: GOOD (  16.11  )
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

On 12/30/25 21:00, Shuah Khan wrote:
> On 12/30/25 18:57, Eric Biggers wrote:
>> On Tue, Dec 30, 2025 at 05:27:13PM -0800, Linus Torvalds wrote:
>>> On Tue, 30 Dec 2025 at 15:57, Shuah Khan <skhan@linuxfoundation.org> wrote:
>>>>
>>>> I would recommend reverting f804a5895eba instead of trying
>>>> fix it. Then find a better way to eliminate extra newline that
>>>> shows up in dmesg when firmware build date happens to have
>>>> a newline.
>>>
>>> Yeah. Let's revert it.
>>>
>>> And the way to fix the extra newline is trivial: just remove it from
>>> the "dev_info()" format string.
>>>
>>> Our kernel printing logic will add a newline for the next line anyway
>>> if it is missing (unless somebody explicitly uses PR_CONT).
>>>
>>> Can whoever saw the problem confirm that just a revert and a "remove
>>> \n from that dev_info()" fixes the output for them?
>>
>> That works for me.  The revert by itself makes the FORTIFY_SOURCE crash
>> go away and reintroduces a blank line in the log.  Removing the \n from
>> the string passed to dev_info as well makes the blank line go away.
>>
> 
> I just sent the revert. I will try removing \n from dev_info()
> later on tomorrow.
> 
> My quick trial still showed extra line which didn't make sense
> to me. More trials have to wait for tomorrow.
> 

Hmm - there are 3 places that print build_date in  mt76_connac2_load_ram()

3022         dev_info(dev->dev, "WM Firmware Version: %.10s, Build Time: %.15s\n     ",
3023                  hdr->fw_ver, hdr->build_date);


3051         dev_info(dev->dev, "WA Firmware Version: %.10s, Build Time: %.15s\n     ",
3052                  hdr->fw_ver, hdr->build_date);

3127         dev_info(dev->dev, "HW/SW Version: 0x%x, Build Time: %.16s\n",
3128                  be32_to_cpu(hdr->hw_sw_ver), hdr->build_date);

The last one prints %.16s and other two do %.15s - is the fix simply
changing last one on line 3127 to print %.15s - this avoids printing
the extra \n?

thanks,
-- Shuah

