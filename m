Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962C6C7EE23
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 May 2023 13:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9G+1XrAaU0cSPGAU040yGSGutqJCVEvC7RcTLOgdsIw=; b=YYbGM1P0Qc97oec2K3IAHVJIH2
	DvO9lrJM7G/VXqxxkojQSX8EOK30ZUQle2A4QFCUK1dyNhzfanuLHgQJdfNG50kvQrTQ/UbnfDsqs
	G2Yerl/NYCtta9nu0Zre0emzvkrNjTTl9a96eHv+DNPB+F3xMYJ5E91EaFyqF5MH1xN/vp3yDG/fc
	XyNIR7rxKj0z/4ekf1ztF6CECbeoczw5gFHHirJErZFWv+UcgNiP+EDxWEvyPtKXP1Q9ldCTAYMSJ
	mP9WmCP7zSmISykrBUDHDPS5fH7+CMrO+BbL0562yZ9wuTC8h8YZSYUyS01L5Crrn8wIDyfZiDp+7
	HqzlgetQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pze79-00D8DE-1Q;
	Thu, 18 May 2023 13:56:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pze77-00D8CW-2A
	for linux-mediatek@lists.infradead.org;
	Thu, 18 May 2023 13:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684418175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9G+1XrAaU0cSPGAU040yGSGutqJCVEvC7RcTLOgdsIw=;
	b=IRBP7pdCeUfMKJ/LRqllgoxn8x/LIhYHIaX7MyrJhG+uGQWO6lNxfyVmYUBMkU+bTSOoP1
	jUPxEIVA8XsQUX4rIA4zxHgAOUOJIbIACQIPFnsGlb9wvQr0KBT3OzYSuF72C1117Hkmh5
	zi4E2kEBy5vkO5R2OmH/5zGs8FeNbrc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-iHfLjw_YNsOnd2wGEy6KEg-1; Thu, 18 May 2023 09:56:14 -0400
X-MC-Unique: iHfLjw_YNsOnd2wGEy6KEg-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3f426ffdbc6so12057605e9.3
        for <linux-mediatek@lists.infradead.org>; Thu, 18 May 2023 06:56:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684418171; x=1687010171;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9G+1XrAaU0cSPGAU040yGSGutqJCVEvC7RcTLOgdsIw=;
        b=HRg9WKmXXk98QNSXGZNDlspRWIR6IUCkJCuwALmCRkLGUsfYqM3ureiqfeatJ42yQU
         vT3UIZE6Az3glm5lRYTqXpQPsLIb9OyVEk99/ncgYLKUCvCTSijXUAdRPt97RgpqTkCJ
         1nWRBtVDVDTmHdubmncXowQ2Fw6bCnU2ObaFu1aDBkqxE1YuKZMesmvVdECeUb+ZQx5y
         Mg+xJJZDrWtIcoJdMwSeujQ6n9+qgiQ2T2nonJf9OfFMbNVHiFRCjgKRO++xat1yBKZh
         CG8YF0UDgH8jjXRWJIASX0hONEIVE0YNQbgOUBpPOR+T1nKTj/HsH1JSCV3wlAtr9GJq
         +X1w==
X-Gm-Message-State: AC+VfDy5tUHcZ2jY5N59U1xUM+6siwX2Uxniy/sIcgr5Zs5pWiXhBpEr
	mDDorUVg5MMxztj6BMIV6EnuyNyr5uhLa2j3kjtJ+GmB0yIqsbrnZeK/omcsZXUnlsl4qhp5nhM
	m82TJo0kMjLT/a4XryQiDNPHtYBn4cn7v
X-Received: by 2002:a1c:7709:0:b0:3f0:7e15:f8fc with SMTP id t9-20020a1c7709000000b003f07e15f8fcmr1815033wmi.14.1684418171629;
        Thu, 18 May 2023 06:56:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4zTN1jfqC6YSkeSA1dlL4CIMd/zs+KIjkUkDS2ygUv3B0QCgzy/yPlAS20AqPmbILcgoLC7w==
X-Received: by 2002:a1c:7709:0:b0:3f0:7e15:f8fc with SMTP id t9-20020a1c7709000000b003f07e15f8fcmr1815015wmi.14.1684418171265;
        Thu, 18 May 2023 06:56:11 -0700 (PDT)
Received: from ?IPV6:2003:cb:c715:2a00:ac0a:9a14:a490:dc02? (p200300cbc7152a00ac0a9a14a490dc02.dip0.t-ipconnect.de. [2003:cb:c715:2a00:ac0a:9a14:a490:dc02])
        by smtp.gmail.com with ESMTPSA id d2-20020a5d6442000000b002c70ce264bfsm2289924wrw.76.2023.05.18.06.56.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 May 2023 06:56:10 -0700 (PDT)
Message-ID: <8b898768-a3c0-198d-a70c-9aa96b7f4a29@redhat.com>
Date: Thu, 18 May 2023 15:56:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: FOLL_LONGTERM vs FOLL_EPHEMERAL Re: [PATCH] tee: add
 FOLL_LONGTERM for CMA case when alloc shm
To: Sumit Garg <sumit.garg@linaro.org>, Christoph Hellwig <hch@infradead.org>
Cc: Xiaoming Ding <xiaoming.ding@mediatek.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 fei.xu@mediatek.com, srv_heupstream@mediatek.com, linux-mm@kvack.org
References: <20230517031856.19660-1-xiaoming.ding@mediatek.com>
 <ZGSDoVKKVqCkbaCB@infradead.org>
 <CAFA6WYO+AvnbuAdWyBAQ8HkLaOno7PXdsPb9SubxrGNvAm4UnQ@mail.gmail.com>
 <ZGSLiiK/JzD5KMd7@infradead.org>
 <CAFA6WYPOMwmrA3J84AHzoD2eAtNkpMxr754qHpc-j6XRkgFFvQ@mail.gmail.com>
 <ZGSgCZrg+RjAbGO1@infradead.org>
 <CAFA6WYO+EpiECFxdVgmd-Ey9jq1Ybt78WupK_bW5+oDcW-soVQ@mail.gmail.com>
 <d4773626-6cf0-c929-c775-a84ac41fd719@redhat.com>
 <ZGWnq/dAYELyKpTy@infradead.org>
 <CAFA6WYPgvifYcj_MT7BBcC0BtQDWXV0u+HY8qv0M9nNyiCgkow@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <CAFA6WYPgvifYcj_MT7BBcC0BtQDWXV0u+HY8qv0M9nNyiCgkow@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_065617_807579_731CF5D5 
X-CRM114-Status: GOOD (  15.50  )
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

On 18.05.23 08:08, Sumit Garg wrote:
> On Thu, 18 May 2023 at 09:51, Christoph Hellwig <hch@infradead.org> wrote:
>>
>> On Wed, May 17, 2023 at 08:23:33PM +0200, David Hildenbrand wrote:
>>> In general: if user space controls it -> possibly forever -> long-term. Even
>>> if in most cases it's a short delay: there is no trusting on user space.
>>>
>>> For example, iouring fixed buffers keep pages pinned until user space
>>> decides to unregistered the buffers -> long-term.
>>>
>>> Short-term is, for example, something like O_DIRECT where we pin -> DMA ->
>>> unpin in essentially one operation.
>>
>> Btw, one thing that's been on my mind is that I think we got the
>> polarity on FOLL_LONGTERM wrong.  Instead of opting into the long term
>> behavior it really should be the default, with a FOLL_EPHEMERAL flag
>> to opt out of it.  And every users of this flag is required to have
>> a comment explaining the life time rules for the pin..
> 
> It does look like a better approach to me given the very nature of
> user space pages.

Yeah, there is a lot of historical baggage. For example, FOLL_GET should 
be inaccessible to kernel modules completely at one point, to be only 
used by selected core-mm pieces.

Maybe we should even disallow passing in FOLL_LONGTERM as a flag and 
only provide functions like pin_user_pages() vs. 
pin_user_pages_longterm(). Then, discussions about conditional 
flag-setting are no more :)

... or even use pin_user_pages_shortterm() vs. pin_user_pages() ... to 
make the default be longterm.

-- 
Thanks,

David / dhildenb


