Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 750A9C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 12:45:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 405CD60F22
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 12:45:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 405CD60F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7MmQxHE0C9CVthaO7TXysR1DPjkbaIFafizCmD4y63g=; b=xGnIFC25tAz/D0
	xhSPTdciLPE3LYnPml+znJADohoMFZdYKsE9KcyZBbwLlgTOncsSiCozes1hzIZgTTo3Y7+WCGxCF
	EcE54LMYHby7nVBv4e8i6pzvr+XTvgYmgB1RJknRPsutex4oCi4vPuvmcw8DIy3Tm1VlxrOcweDTv
	hjznW0CUYRIS7NahdPaSc1XAxmrPNy1XwyNnse2fYvcopoX+KsP/83N11MKHzp/3OQgaE6R5wGROp
	RjrG+pKVOVeCz43ts4z0pmtL9WbFBRHoHPNocGE970S/p8RltMtAjnpx9A4oj1U3SQf35ssxbkkbF
	TUQhC4bg1Z75m3CN14eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBGGy-0062d6-CA; Wed, 04 Aug 2021 12:45:24 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBGGB-0061zv-B5; Wed, 04 Aug 2021 12:44:36 +0000
Received: by mail-ed1-x52a.google.com with SMTP id f13so3271999edq.13;
 Wed, 04 Aug 2021 05:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zWvy8sh/+lRbS7C72TP9P5YTqZkTi8RR/qpbQTwlVag=;
 b=L8CPcLBLfXrFwcb4XrQhaX62u6eGIqzHpEeaRRcOLVMygMXRcZkS2VhopsFWbJpRJU
 RNLuTOEJoz9lgbbucOd7iaoLZtgLZ/f3Sd0A/afoxBpoZv6gVjlUyyIRdfPDfFUttTVz
 HORx9g6juclSgD8FhRl9ECPwVnIn6rfCJFxNFZrorO2J2BPah8rMIjmw/nIF0LfTowW9
 eL7YgG8ldd6Pm90HH7Av8A5hntUIpf0QOmQZe/apiHcmzxvuozEfHHzy+SRdQeBlE2jp
 y/jWYs0K5WrByOzc49GinBCXyILrf5OX6bUtFMc+juwS5mJhFuWPPlK65fvKo6cTYHn2
 9yfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zWvy8sh/+lRbS7C72TP9P5YTqZkTi8RR/qpbQTwlVag=;
 b=AC/tU2SysnQuetf+ehCewVbSKm+lQPXtgHePQBtlZUw3X2ii98FLUrBCxBul3jmk5Z
 I+m6gjDdZMu0s8TUUxglCfv0S+9njkWVQe3zfl2a8UqwepV2inuM+9+i1v0ivwYU9WIf
 RcCSB2tWCEA3ptaEnf0DjskLqc+7HFzBo1vr8t7RYtuEN5Cn1nxo4GnNtCjeSzY+4A5Q
 9GIPzowzo8njIBzDmyXLb/B/cU2juBrcFpChbnLsTwWow4xZUd8fdQTOsOqebU6qiIYX
 wErYcv2d2utUkaUd0Cnfq17LutpNAeMD71VeCmhTg8iS51Uq0wk1/JXLaVY1n3mevkNb
 AAnQ==
X-Gm-Message-State: AOAM5334IrixRVxJcDNjR5TJHw/uUr3YIT0gFw4AucGCR6m7OCvHc2Mb
 R9yyJdNAixXinbdKNwb0oKRBn8OWg5v9o6vAZIY=
X-Google-Smtp-Source: ABdhPJyqZwWb8jhlSwZs+oxLbWbZf8TnreNbEQ/FtBwKpWytABRTwqEkItzzs798ZiC4vXeEOos3WPMLkVOZ68tFzL4=
X-Received: by 2002:a05:6402:430b:: with SMTP id
 m11mr32140537edc.55.1628081073404; 
 Wed, 04 Aug 2021 05:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210804090957.12393-1-Kuan-Ying.Lee@mediatek.com>
 <20210804090957.12393-3-Kuan-Ying.Lee@mediatek.com>
In-Reply-To: <20210804090957.12393-3-Kuan-Ying.Lee@mediatek.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Wed, 4 Aug 2021 14:44:22 +0200
Message-ID: <CA+fCnZd6d9yFZZBM-zPOC54ZiHGnCxV-XiYrCfbCTzzhRV8H1w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] kasan, slub: reset tag when printing address
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Cc: Nicholas Tang <nicholas.tang@mediatek.com>,
 Andrew Yang <andrew.yang@mediatek.com>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, 
 Marco Elver <elver@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Chinwen Chang <chinwen.chang@mediatek.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 kasan-dev <kasan-dev@googlegroups.com>, 
 Linux Memory Management List <linux-mm@kvack.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_054435_427757_DD89735F 
X-CRM114-Status: GOOD (  17.40  )
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

On Wed, Aug 4, 2021 at 11:10 AM Kuan-Ying Lee
<Kuan-Ying.Lee@mediatek.com> wrote:
>
> The address still includes the tags when it is printed.
> With hardware tag-based kasan enabled, we will get a
> false positive KASAN issue when we access metadata.
>
> Reset the tag before we access the metadata.
>
> Fixes: aa1ef4d7b3f6 ("kasan, mm: reset tags when accessing metadata")
> Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> Reviewed-by: Marco Elver <elver@google.com>
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

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>

Thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
