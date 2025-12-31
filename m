Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9C9EE57D1
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Dec 2025 04:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7VNylGeHty3hhb1+O1+8twZmND0tnjr8y4TdbwY0GSg=; b=JQCVIdaCnddhzp4the1lDrGpHk
	OMITIDNfjOUtHivuAwrMutWPYyIdf/HeWqY3Uq25gfRp9FG0l2fyd+ogg9lHECdmpcOrfhTvBLE5V
	juLhkOmqrFFCyj7Si/ndCX6fhqrJUpUCcQlbbJNfv+O3jcC5Fhq1iB9YHvBlbMLo3b3+WTUpjrDS+
	AFfEEmhnYbO/LpTp/eS4t6LgbnzsXvYSXrOc7Az+aDmvjxecGDC9KpJ4ePPCQpQHQO/wfHepVPYJU
	5lZzMl6A/Dvy4+/we+XF9DlVB/DfNVBjIv7oOGeZ39CXDeW0NtVgr7H1+3OqZHuitiaUmbfFn1Bge
	ssN1wRUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vanON-00000005fJU-2xkC;
	Wed, 31 Dec 2025 04:00:59 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vanOK-00000005fIo-2joZ
	for linux-mediatek@lists.infradead.org;
	Wed, 31 Dec 2025 04:00:57 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-7c6e815310aso8614578a34.0
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Dec 2025 20:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1767153655; x=1767758455; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7VNylGeHty3hhb1+O1+8twZmND0tnjr8y4TdbwY0GSg=;
        b=aiYD1rl92DlsqkfHGzwW1QIGnNnmb9nlolHDW8aHt+yQvxAqgrX1c0juMnx+0BrKUw
         PUjrMDUYbhUuGntw9U+RYntlqUI8xr2SA2qUxXNhW6THITf5C7G/u0+fnYRNPNR+q0PQ
         sJ19udJD/KUfAxfNO7/gUSzBqyX8TfYx6Fp9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767153655; x=1767758455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7VNylGeHty3hhb1+O1+8twZmND0tnjr8y4TdbwY0GSg=;
        b=fwnGPjDGMCXSh6ClohoaURB3KrazmsHgtT0pMtGApop0mFfCzOz3s1q6xnwT4617iZ
         ++e7hmXTXnCRxDvlo3jjpTZrdDBLF7VgDImGE2qVUpbEVk+8j3Bor/tgPA1D1xu7SM/G
         YSw3aVk4vWBrUnKLFCPoEF+tgH9mXETAVtQkHGxkSAytXnroMCYBC88b3nLgUNbObDaW
         RvGAZRKIAyzsWbzZ/+CSH7iFKNUzNHPJCsFPT5nFiwa0wwYvD+Na8XJZ8WrIAKEzpDML
         7i5rQM4RzEWcvMsag7+4f5tLKQ91u/R1Nv2gyoTiXzGqSOfAqB40U6YVBTE7lpBVP2i0
         CBFA==
X-Forwarded-Encrypted: i=1; AJvYcCVCja0cNBtcXfwp0YmPLg2AIzfhvMkEmURiZhXTMlEDCsSj7bqiKHHfFKHwtkqVyPGhzsWLnen4F4bT74pyVg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb05sJiS6GAaZxaLXchH8+rmHN8QqxR/R6JBgTaQEgeZl90gxZ
	0mWIqToAmvxzRKlh5jQJiDgOtBRNkuDPzdOVcjUYsU/6r5nNkDZNlPO8v2Mllg4al8s=
X-Gm-Gg: AY/fxX7j9ZurkLGz/N7sHJ06hXwtdIVYRqP0EXvqrWRVlRIDCjqyhJkqfFhNZy+Fwcz
	ZHaA85b13tbRMgQb4NTPeaaww0EQG8JWsA0aE/AVWqJs2giQ+H5xmUa4H3F8CBbREbxq0kk8xqh
	S5lrOdsEJnCw8wTLSpHIg/jrA6xVPNHoRnyTc9xtDG2IWsrZwgqD21cN1Lhg6kiOYb+WmO3qy/Q
	l4ydBLtPEPL0uWb1fsTGRnxiQ76X+fTXcU9rsfisJke3q1My11psNVZNYLdsTZkap1HNr7aS6xx
	O3II2ENzciLnkN9/9d+sgwP+i5gSz62VCjN1cUO43QhnIV4rbV7B7hyM4eoSw6NZ5Qtlvn1Tp4B
	Fh/7v1jfIx/vZFh6o925Y3nj5QqYfMabnKoOEf5aE1mwKFf2VG+Q1q0PgCogEigVP7ommTZjL5K
	BVVEabP9AkKjIOgY8qp6h7ISQ=
X-Google-Smtp-Source: AGHT+IF9F/siqhgAslvMOnVu4nsfQJ2/g/8vSzR2SppngNQxxoARtodDwAouloJqhdkdH2KDxgw/hQ==
X-Received: by 2002:a05:6830:6688:b0:7c7:5974:3563 with SMTP id 46e09a7af769-7cc66a15846mr16285625a34.29.1767153655626;
        Tue, 30 Dec 2025 20:00:55 -0800 (PST)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc66727e37sm24112013a34.1.2025.12.30.20.00.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 20:00:54 -0800 (PST)
Message-ID: <fdebed60-264d-4f05-9423-618bc3ec6d6d@linuxfoundation.org>
Date: Tue, 30 Dec 2025 21:00:53 -0700
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
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20251231015712.GA2299@sol>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_200056_699698_2C89E521 
X-CRM114-Status: GOOD (  15.19  )
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

On 12/30/25 18:57, Eric Biggers wrote:
> On Tue, Dec 30, 2025 at 05:27:13PM -0800, Linus Torvalds wrote:
>> On Tue, 30 Dec 2025 at 15:57, Shuah Khan <skhan@linuxfoundation.org> wrote:
>>>
>>> I would recommend reverting f804a5895eba instead of trying
>>> fix it. Then find a better way to eliminate extra newline that
>>> shows up in dmesg when firmware build date happens to have
>>> a newline.
>>
>> Yeah. Let's revert it.
>>
>> And the way to fix the extra newline is trivial: just remove it from
>> the "dev_info()" format string.
>>
>> Our kernel printing logic will add a newline for the next line anyway
>> if it is missing (unless somebody explicitly uses PR_CONT).
>>
>> Can whoever saw the problem confirm that just a revert and a "remove
>> \n from that dev_info()" fixes the output for them?
> 
> That works for me.  The revert by itself makes the FORTIFY_SOURCE crash
> go away and reintroduces a blank line in the log.  Removing the \n from
> the string passed to dev_info as well makes the blank line go away.
> 

I just sent the revert. I will try removing \n from dev_info()
later on tomorrow.

My quick trial still showed extra line which didn't make sense
to me. More trials have to wait for tomorrow.

thanks,
-- Shuah


