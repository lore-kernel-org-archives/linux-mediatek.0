Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B09FEE644C
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Dec 2025 16:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4VxsJvPd3cI1KTNnl7L01TZ9c0Oijs9ErHb2bvB+BxA=; b=DxcAnWD3yZg5qeE5IJZIsHSXrA
	yes+dSKu9wu5pfm+ikUS2zC+aNewSMN/eGDl6hRFVzXr/zZA/n9zRvnm4rGMR4PlR3wCuS/FcA/Cf
	PXt5mPAep9tg7EzmDl/EzS0SZcGYKEQn4xIRgIcMhuMSPM2qgplYPQOYv2Rcuo2qd+TVQySjvSKGq
	R9LA/B3UV+NcAsBJkhHLORlG35JkoM53bimPw62E3i8pMkruAEkafXJM+TsBav2qM72NAxZptBR20
	2TDBxDFl6Esl5sheXYRJtBgPYytjUoaDX2Ovf2AgNnmbLkC0gn6QxRdGW2nOY8yFMvuEMsJvzSjjL
	DdfMPZ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vayx6-000000068Ll-2Cdo;
	Wed, 31 Dec 2025 16:21:36 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vayx0-000000068Iq-0TGj
	for linux-mediatek@lists.infradead.org;
	Wed, 31 Dec 2025 16:21:35 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-3f0cbfae787so9236165fac.3
        for <linux-mediatek@lists.infradead.org>; Wed, 31 Dec 2025 08:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1767198089; x=1767802889; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4VxsJvPd3cI1KTNnl7L01TZ9c0Oijs9ErHb2bvB+BxA=;
        b=UOc7rZgQ4ti5Chzcg8vmu0BOmyjLVcyKDlaPVgIEep5aKVyVZtWzRicDZwwW2xPS7/
         EF9TM/LBrJ8RXicYrbY6Ls+f0zIu/UdhNZoPhn/SRw5TV/k7zx9mZKVOpWNyczi2NpUE
         QhTe0Lk1123vk5IHvisFv0/O8MHCrZkJdnUPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767198089; x=1767802889;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4VxsJvPd3cI1KTNnl7L01TZ9c0Oijs9ErHb2bvB+BxA=;
        b=sP1BFlEzE0hbVgySk/G3LwfI9XwjILzllDplRgbJ2x7dv23RndP+6rKQIQjFiuOLmZ
         o9ibDyrKFiwraD4oZ4MOEO/8pZIC98KGWjwD3brOj+spbdFBIIuLKXrE19hO5nkFo36d
         CD7O5dq3dN6Q6mZyQn2uLXXt7JMlpUIBgB12af8utlaF7rILh0340LGmF5SLjcBzsDWD
         i0IQeA9UjquF3SAhfHGwSW/8/yvCM/g1G7bQiebe7PAwhApq+i60rQZFgDssWn56hERC
         R0lJQn0EFsSesHBJ3reOwYCfBXJ/y07BOyM74d0CV9K+HHrsnR6NcvKpOyxbz+W2G1WA
         kA7g==
X-Forwarded-Encrypted: i=1; AJvYcCUXU/783eb7/0DLE4s18onyiX94hZm1Z3QqNAFjY9KFZholJqigUaB16bbK4Zv8ObX3EvJ90Ohvalu8aOc80w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4gVT5sjIHu+//RnHKN+tDiBPSOPwL5LiIc5ymhVVVhoBrXjae
	uQK03hu1ka2oACcGgKhqJNoLKXxcy0eYnoduuHYs1wIDHnBQQdL/pgY8cU2nwoy5Zs8=
X-Gm-Gg: AY/fxX7JYXw5Mj03tL4GcXobHkV+NiYf0N0NcLRbpW22j2drmDB2L+S6AFtY3uG/XyZ
	8E7X86Dr2wCcE3LoRB3CUpdS9/2d1ZLXrLQgouPP3+t3V53eA+I57EoytFwrem3aDKt0p/otrKU
	aS6Rcq9oKag8DDm9VGBj4waL3zSOoxgeeIPMhYZf9NUmSj3pjEseFyugCbNBzVtY2SIkwQ1u1qz
	2u0dWThqIPTTsh8pote4F5iDYhorNAQHEEOPqk6iU9fMYO5UsBP+4BU9Py0Osbzw9lPra6oqv+g
	P9U6pO4gKEuMDKmKJaY0jDbg5ChibGfcEs1giTJN/nCEHGulI6jqeYWxZjhl66WHgy6dRK59IkQ
	Q4NWJufnX3Ql6c6hP0gy++HMr78CPxEvSS6PmeDmE4bue/jDRz06dOfrqD494j7PdEGBTSNarTz
	c5SKgIkS8C/CWedHF/6c89G5I=
X-Google-Smtp-Source: AGHT+IEHyGzJlX9BG5IGxQWI+udvuX8r10ycrsNMN1UZ5U1HR75+jvZ88LGIfUUEQ4FL5FGJJHzKPg==
X-Received: by 2002:a05:6870:c18b:b0:3ec:321c:b2ac with SMTP id 586e51a60fabf-3fda580edb0mr17664156fac.37.1767198088781;
        Wed, 31 Dec 2025 08:21:28 -0800 (PST)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3fdaab65763sm22362927fac.13.2025.12.31.08.21.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 08:21:28 -0800 (PST)
Message-ID: <f9a32a91-e25a-4f25-8c1a-1e4c0e3b07e4@linuxfoundation.org>
Date: Wed, 31 Dec 2025 09:21:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux 6.19-rc1 mediatek mt7921e broke badly
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Matthew Schwartz <matthew.schwartz@linux.dev>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Eric Biggers <ebiggers@kernel.org>,
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
 <8c8c8f27-ba44-48eb-96f6-dae6d2d0cbf8@t-8ch.de>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <8c8c8f27-ba44-48eb-96f6-dae6d2d0cbf8@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_082130_511087_942C1D1C 
X-CRM114-Status: GOOD (  18.16  )
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

On 12/31/25 03:36, Thomas Weißschuh wrote:
> On 2025-12-30 16:57:20-0700, Shuah Khan wrote:
>> On 12/29/25 21:21, Matthew Schwartz wrote:
>>> On 12/29/25 4:41 PM, Linus Torvalds wrote:
>>>> On Sat, 27 Dec 2025 at 04:25, Thomas Weißschuh <linux@weissschuh.net> wrote:
>>>>>
>>>>> Hi Shuah,
>>>>>
>>>>> On 2025-12-27 02:07:24-0700, Shuah Khan wrote:
>>>>>> mt7921e doesn't load on my primary laptopn on Linux 6.19-rc1 and problem
>>>>>> still there on 6.19-rc2.
>>>>>
>>>>> This should be a duplicate of
>>>>> https://lore.kernel.org/all/CABXGCsMeAZyNJ-Axt_CUCXgyieWPV3rrcLpWsveMPT8R0YPGnQ@mail.gmail.com/
> 
> (...)
>   
>> Reverting the following fixed my problem.
>> f804a5895eba ("wifi: mt76: Strip whitespace from build ddate")
>>
>> The above fixes an extra newline in the dmesg by making the
>> code more complex it needs to introducing local buffers and
>> strscpy() - the proposed fix replaces this with memcpy().
>>
>> Is there a simple way to do this than introducing memcpy()
>> or strscpy() to remove an extra newline that might or might
>> not exist? Why not check if newline exists or not using
>> strstr()?
> 
> We do have memtostr() which would be a perfect fit to use here.
> That is still a memcpy() under the hood, but the code is clear and safe.
> It does however require the source to be annotated as __nonstring.
> Which also seems to be the right choice here anyways. However for
> consistency, all other similar fields should also be annotated in the
> same way. So it is a bit of a larger change than a pure bugfix.
> 

I am playing with just removing \n from dev_info() - there are
three dev_info()s in the same routine that print the same
information. I will also take a look to see if they are indeed
needed.

thanks,
-- Shuah

