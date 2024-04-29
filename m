Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DEB1C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Apr 2024 12:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7EKWBgytODZQU31rywUVJiOdjv7GH+YZfkGd8P3Apls=; b=yGKiMLrSs8u68W+dCeMeo9Zoi0
	c168N+LRWBxXteRcawEa56r+eIHSIn0FdHgAhl6fGGL5olNwpia5kk8qje/lcNc/a8eAmHqDplqtn
	v4HHGMu8sNzCe+Xai3Zpg22Egj6Pf5ohbkxOyxVp2XZaykxNX/ivyQeT7J+ZWihnXZo8fTWcYOz91
	A6ykZtX6MClQIMnRXDwufWapzVsnMobcT8p2LbPB6BdzZPaPjot+lkM0Az3l+1SrAqxsUdlOLtFIs
	5awecROcigrw57Y7L973DfsXWmQd9QS+qciJLeDSneadijbOHg4y/rJIQq40Kp5P/Q/jo3giUuZcz
	LVVfTQcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Qb2-00000002ocM-42Kc;
	Mon, 29 Apr 2024 12:59:04 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Qaz-00000002obS-2NUN;
	Mon, 29 Apr 2024 12:59:03 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5176f217b7bso7527126e87.0;
        Mon, 29 Apr 2024 05:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714395538; x=1715000338; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7EKWBgytODZQU31rywUVJiOdjv7GH+YZfkGd8P3Apls=;
        b=Lt5re9UdOtzIlJW3N07o6wnvRjLoWug/RXczHIvCXTbzaJg4T5BzlYreSX2ot9yNop
         VGcc3+Wj4msvfguedQCNoENvoS750beHBuB4w8X28vPywFHHttAYsYH5x7F5Ryirli+b
         kuJMwXx4S2W2wkJaRPkNAW6VUVSmRhVg+wTu/7PzV0YXJ4pY6/wPPOpX3wQp2kWY1wc7
         eRKBx+GBxlDgzHOwNkWEi+7ASeIzyfjUIBbYOdnahx3iRERIPOEFq/3piXPbcP5q6YKd
         G38yOy1eqh9EPoe6gzowLwPIy0kOgb3l0PgRnc9EIObny8P8mWLFl/ae13BWWm+ynNPr
         weRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714395538; x=1715000338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7EKWBgytODZQU31rywUVJiOdjv7GH+YZfkGd8P3Apls=;
        b=BFaQ+Bu6A4w9+EWO5J7zl0mtC2erZNd9T9h5Qj9JfaKqcevpAq2C+6b3/a3xZLWP2z
         0r8PWS3a6OLnhdhyyzHG7VFfPMA0Kac4zGHy+na2agnpanhCEw8kl086uPOBkPkC856b
         b/qeScrT9k0UIr14+GdhLNWM5/4TI3qyUpjgnwTfwQFkSXXgX+l6GLfAPOqNZ7FC0iYl
         dQdQk83E0YTToi4Wy29PTjxyudV6K8oc2RbOYFLpUPh3txNKfey8Ftcp0ANE7ffB5P1A
         U8XYxVB+J7JM+P9lE3qKUHP/KqiEM29iWF7fU1jpEpkCHipeQtWYNNxz4tNt8xCsa3Xp
         K/XQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUIj+PUq3woX2jiLP5payojZzwiphkiQqnwls7lOGczUO26L+nM6QjHVOHJQnEN6yF81MBFYlG0w7zWabMUqcLObme7lHWM/jN13KCaXeGB3u/p12jRpVu/b5S3+47T6V54+y36M6yD2CKxVN/cb0cvfbERTf5o88=
X-Gm-Message-State: AOJu0Yw3b5Npe3zE6rRnFZ5jUJIX9P3bsQOCzvqwQA5z0TCe+In5w8H6
	g3E3WFX5HpnM81A6Au5FiSGh7YsqC2Nt8OWOT/N6EncxFbr7iP8s
X-Google-Smtp-Source: AGHT+IEj2BMZHDIBuNJn1hbnu7Hgi2WDKZTw2Vu62n0umPjAWJzgMApXkwlF0Akz0AeulTOhq8uyRg==
X-Received: by 2002:ac2:5b9c:0:b0:51d:3acb:1d8b with SMTP id o28-20020ac25b9c000000b0051d3acb1d8bmr4865274lfn.62.1714395537432;
        Mon, 29 Apr 2024 05:58:57 -0700 (PDT)
Received: from [10.214.35.248] ([109.245.231.121])
        by smtp.gmail.com with ESMTPSA id v12-20020a056512348c00b0051af75b5b93sm3037276lfr.226.2024.04.29.05.58.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 05:58:57 -0700 (PDT)
Message-ID: <f90f5352-30ed-419f-803b-7885b4298868@gmail.com>
Date: Mon, 29 Apr 2024 14:57:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm: kasan: clear stale stack poison
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 =?UTF-8?B?Qm95IFd1ICjlkLPli4Poqrwp?= <Boy.Wu@mediatek.com>
Cc: "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "andreyknvl@gmail.com" <andreyknvl@gmail.com>,
 "dvyukov@google.com" <dvyukov@google.com>,
 "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>,
 =?UTF-8?B?SXZlcmxpbiBXYW5nICjnjovoi7PpnJYp?= <Iverlin.Wang@mediatek.com>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 =?UTF-8?B?TGlnaHQgQ2hlbiAo6Zmz5pix5YWJKQ==?= <Light.Chen@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "glider@google.com"
 <glider@google.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "vincenzo.frascino@arm.com" <vincenzo.frascino@arm.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
References: <20240410073044.23294-1-boy.wu@mediatek.com>
 <CACRpkdZ5iK+LnQ0GJjZpxROCDT9GKVbe9m8hDSSh2eMXp3do0Q@mail.gmail.com>
 <Zi5hDV6e0oMTyFfr@shell.armlinux.org.uk>
 <292f9fe4bab26028aa80f63bf160e0f2b874a17c.camel@mediatek.com>
 <Zi+Vu29rmNZ0MIFG@shell.armlinux.org.uk>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <Zi+Vu29rmNZ0MIFG@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_055901_669662_80298B81 
X-CRM114-Status: GOOD (  22.34  )
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



On 4/29/24 14:42, Russell King (Oracle) wrote:
> On Mon, Apr 29, 2024 at 07:51:49AM +0000, Boy Wu (吳勃誼) wrote:
>> On Sun, 2024-04-28 at 15:45 +0100, Russell King (Oracle) wrote:
>>>  On Fri, Apr 12, 2024 at 10:37:06AM +0200, Linus Walleij wrote:
>>>> On Wed, Apr 10, 2024 at 9:31 AM boy.wu <boy.wu@mediatek.com> wrote:
>>>>
>>>>> From: Boy Wu <boy.wu@mediatek.com>
>>>>>
>>>>> We found below OOB crash:
>>>>
>>>> Thanks for digging in!
>>>>
>>>> Pleas put this patch into Russell's patch tracker so he can apply
>>> it:
>>>> https://www.armlinux.org.uk/developer/patches/
>>>
>>> Is this a bug fix? If so, having a Fixes: tag would be nice...
>>>
>>
>> This is a patch for cpuidle flow when KASAN enable, that is in ARM64
>> but not in ARM, so add to ARM.
>>
>> The reference commits did not mention fix any commits.
>> [1] commit 0d97e6d8024c ("arm64: kasan: clear stale stack poison")
>> [2] commit d56a9ef84bd0 ("kasan, arm64: unpoison stack only with
>> CONFIG_KASAN_STACK")
> 
> These are not suitable for use as a Fixes: tag because these commits
> refer to code in another part of the tree that has nothing to do with
> the BUG() dump that is contained within your commit message.
> 
> I ask again... Is this a bug fix?
> 
> Is it a regression?
> 
> Is it something that used to work that no longer works?
> 
> When did it break?
> 
> Has it always been broken?
> 
> Has it been broken since KASAN was introduced on 32-bit ARM?
> 

Yes, this is a bug fix and it has been broken since KASAN was introduced on 32-bit ARM.
So, I think this should be
	Fixes: 5615f69bc209 ("ARM: 9016/2: Initialize the mapping of KASan shadow memory")

