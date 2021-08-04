Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D7B9C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 08:42:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C241B60200
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 08:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C241B60200
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0BiLkaojD3IhIUzJMcBbAPN8WBCoyE+mm9+haYRgRI4=; b=FW6lKRRHwaQ22k
	enliMmlVvlj5AM2RYkH4PCGy83s8LSCZ6ZNgLlvyxdkNpfd70IoTwGXjaWMv/Ij28zbRecDWGP0g6
	EObTsnjdgPeJuGJt6v+V1BXyyhy1pTcWRUEM8opJavGVkwFueo8VuDQo+GGMHwNyz8nfswVkrU9Y9
	NwX4HdcYD+ca+QGXTsGf4qno8YPJFWc6KCeC3zlcUckoq3Kqaw8mH4ffQ80XJHhIMBtWa6adtgRj7
	tgZ5N5R8MXEiXRhKNI/8RFJ0F0PuxXN51R5dLY/0uR/8LMjJXYuFiqYO3TqTfNWgd498d/Aa5ybm/
	7DqcV/STtbLyAbEEcZkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBCTL-005BZL-48; Wed, 04 Aug 2021 08:41:55 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBCT8-005BV7-BP
 for linux-mediatek@lists.infradead.org; Wed, 04 Aug 2021 08:41:43 +0000
Received: by mail-ot1-x336.google.com with SMTP id
 a5-20020a05683012c5b029036edcf8f9a6so1020025otq.3
 for <linux-mediatek@lists.infradead.org>; Wed, 04 Aug 2021 01:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ry/C788Ax+QRjoem679Qz9xjcGp3R8vxYXF3Ug8T/cU=;
 b=CdeSijkPZlqUImGIAEzCPBTp6l7WQasuELwBXyk/ZoG5VDeh1gjR+9z3QgEETkKMXx
 ESlpE0ZjQ6Hm4EczMgQduF7lq//myVLatAB4ctFpbLT5+96N383jrCYI+6OROefnr406
 vQk/G+owiXqx6JVCRyqvTddr/+DGhRXI+vd61ALTEzm5pGxtmfJp9fAHE+I7gsVluHKn
 HzgA76R4usQfRo5H8GM4t39wQzbxhwP7HYrKHuoMo1v4E8IHXBPydAKh5qHaWXy8oW+Y
 J+Qikv9yXbG5K5ClLtSz4jV/dOrpGWZf0sJpFAB0kWfvC8KHFw9VjvZb5H7RQw8e0C6m
 s+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ry/C788Ax+QRjoem679Qz9xjcGp3R8vxYXF3Ug8T/cU=;
 b=H86hGGuy0IE0dGxCDK8VU+ZHlHhBRxstLkwSmD7xjIWZOdm335kYccRNBpPvrUI8t2
 6uqvcUaWNekUM6gU0+e23ik13R72mAo/naYrRouAVGTZ4qBUr9PFobEDG3wjLO5dm/fa
 inZ1wchhTYKdhaC+LBSqarvU2ca7hf1hz5zO/eRaTJSFnTrHkt01yldGqxyJ32/C8mOa
 EL93u7Msq1xv9GG7hkr/SExZijq8vzm/MXvRauiJr8yPLMROTkD0bbMWM3MnCbO3h2gy
 sqVm1UkICeQgNI+TJrqempCBdOshY/HOsPL51Q26d7oZAf9JaqdYnpCVgqg7Z7mSO3t6
 kiQQ==
X-Gm-Message-State: AOAM5335LCjX/FoFd3HYGoWb/iGVJUfHEpwiuJXFEOQgIV/s6A9E1s96
 RASLqQHzPBUDJcT+z0PdNmN0kRiChS3e8eaqNZbZGw==
X-Google-Smtp-Source: ABdhPJwULOwQJrId2LR6uf4OqnUiOnC6+yQnX9X5/0EP+lRGGxsuaAeYFWMZ2K7UDJwoWl0nMWJTt4uXnmlICOmyUos=
X-Received: by 2002:a05:6830:1490:: with SMTP id
 s16mr2295783otq.233.1628066496794; 
 Wed, 04 Aug 2021 01:41:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210804082230.10837-1-Kuan-Ying.Lee@mediatek.com>
 <20210804082230.10837-3-Kuan-Ying.Lee@mediatek.com>
In-Reply-To: <20210804082230.10837-3-Kuan-Ying.Lee@mediatek.com>
From: Marco Elver <elver@google.com>
Date: Wed, 4 Aug 2021 10:41:25 +0200
Message-ID: <CANpmjNMAw=rcp_V+G_vjRjArj+09AkOxtC+wUNs-e1RRvfQm6w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] kasan, slub: reset tag when printing address
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Cc: Nicholas Tang <nicholas.tang@mediatek.com>,
 Andrew Yang <andrew.tang@mediatek.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Chinwen Chang <chinwen.chang@mediatek.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_014142_444499_93C94CAD 
X-CRM114-Status: GOOD (  19.48  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 4 Aug 2021 at 10:23, Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com> wrote:
>
> The address still includes the tags when it is printed.
> With hardware tag-based kasan enabled, we will get a
> false positive KASAN issue when we access metadata.
>
> Reset the tag before we access the metadata.
>
> Fixes: aa1ef4d7b3f6 ("kasan, mm: reset tags when accessing metadata")
> Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> Suggested-by: Marco Elver <elver@google.com>

Note, in this case Suggested-by is inappropriate, because I did not
suggest the change in any way (you already had it in v1). I just
commented on the fact that it's missing a Fixes so stable can pick it
up and some clarification.

Reviewed-by: Marco Elver <elver@google.com>

> ---
>  mm/slub.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/mm/slub.c b/mm/slub.c
> index b6c5205252eb..f77d8cd79ef7 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -576,8 +576,8 @@ static void print_section(char *level, char *text, u8 *addr,
>                           unsigned int length)
>  {
>         metadata_access_enable();
> -       print_hex_dump(level, kasan_reset_tag(text), DUMP_PREFIX_ADDRESS,
> -                       16, 1, addr, length, 1);
> +       print_hex_dump(level, text, DUMP_PREFIX_ADDRESS,
> +                       16, 1, kasan_reset_tag((void *)addr), length, 1);
>         metadata_access_disable();
>  }
>
> --
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
