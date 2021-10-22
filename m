Return-Path: <SRS0=WF8g=PK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F103C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 12:29:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BB4060F46
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 12:29:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0BB4060F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u0viVcHhQ4LmKu5xgagi0VJH8Yf5/feAStflMjg8iIE=; b=L675g6J7FnNyf/
	F1Qpg0Qrgga6e5KkNpCbYMDroDVzLIGMFP4lCUuIUB9jnt0bAciVQVs2qPNiIH29WwLTALNPDPsf1
	3BczH13VsHIzjDc6dYg3OaA8CT4djb6gsaLuMAypVVnEB4XXm7+gU9SMB2JGyRMgld8pbknHikLWj
	yk005IhW51JMVmOYATfe/wDbHUE/E1HAfzLswGXy8yKGqkXeTVKQ6C9AeMPHU7chg1X/75gzYoB7O
	d/1Wad+gnPK8rwNK9a22HC6XTW7ZFtfgwdb90AtnhL/zUSyke5A5Lkwh19hHSim7eKvwqKNLmXkPK
	sXftZP2na5GEVD5wwjaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdtfY-00ArqI-DK; Fri, 22 Oct 2021 12:29:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdtfV-00Arox-LB
 for linux-mediatek@lists.infradead.org; Fri, 22 Oct 2021 12:29:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634905743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YuUgTaC7SncRn/56fPFHOc3RSrpIisjOLVPx5zTF8wM=;
 b=Yo0ReFKCg99uRbF4u3kCBENaSLKDOSZjw+mlsShssRvqRbBJ5BLohR3SKBlWL5y3vb8PIB
 GWqsBcijeRMC+fWvviFFpnK2m0fUxTbG24rTD2PidPExpqYAczvbtLkl3D5VtfMTS4NkQ2
 1aNRveSe32j+I3eJw3NwVDwAFt1ikZI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-dlip2EXTNBim7agIzi4iAA-1; Fri, 22 Oct 2021 08:29:02 -0400
X-MC-Unique: dlip2EXTNBim7agIzi4iAA-1
Received: by mail-wm1-f72.google.com with SMTP id
 d73-20020a1c1d4c000000b00329d18a550fso1114856wmd.0
 for <linux-mediatek@lists.infradead.org>; Fri, 22 Oct 2021 05:29:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=YuUgTaC7SncRn/56fPFHOc3RSrpIisjOLVPx5zTF8wM=;
 b=ulC0qk+tfxJBTb+l5NCDyqWZpgptxBrwy+Y9hcKA1NBOLG2DnGE451FKimZymRLBbR
 MlXTQG8TvZIUF1oLaMi8VQN4xaC1GVo6X3hFRGThOHCP47uqWz0K8FrXBOu1UqiSays1
 fOkgp4BwyK5oUlqFxJh0Rx/8yiBzszWWfrmm7ptuE1VNhm3hiJJLajvUWS81QG0Et70T
 pOOxm7sNd707V9Rz5k7tzmPNcRLLTpzNDFcMsF0/2PT1+N3otnyLyFSRRRqiU9tCIeyC
 CqaLrW+akEH6JBqibovT7uSCDxJuJ+7gUXv4lupZVkicHqcPsM2t7+Nr5dUuAzh5xkDu
 k56A==
X-Gm-Message-State: AOAM533VbDoGSzpf+W82IZ1Fq8eLF6BtYcZhMkji/eEeZ+rMZwv5/sg5
 wZTljMcoqWz03zPC9cO4OgRY2n+bTcqHEvuMOoRzWBEqFOQgDUUIbUlJi/uf+DfD/f5W29oDyIE
 jJe0s9yQ8Fk7MSD/RUTIL8QA17THZTPoU
X-Received: by 2002:adf:b355:: with SMTP id k21mr15307038wrd.380.1634905741225; 
 Fri, 22 Oct 2021 05:29:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8b0jvSBO/rDYlcgNKG5q+gpSX25bwLoicK9Z2PsuXIXbBKjkxBVkfERN2zEYyrkQpuyMqbA==
X-Received: by 2002:adf:b355:: with SMTP id k21mr15306985wrd.380.1634905740893; 
 Fri, 22 Oct 2021 05:29:00 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6324.dip0.t-ipconnect.de. [91.12.99.36])
 by smtp.gmail.com with ESMTPSA id
 h14sm3553851wmq.34.2021.10.22.05.28.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 05:29:00 -0700 (PDT)
Message-ID: <d6f6bb06-17a5-92d4-82f9-f8350d0a7b0f@redhat.com>
Date: Fri, 22 Oct 2021 14:28:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3] kasan: add kasan mode messages when kasan init
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Marco Elver <elver@google.com>
Cc: chinwen.chang@mediatek.com, yee.lee@mediatek.com,
 nicholas.tang@mediatek.com, kasan-dev@googlegroups.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-mediatek@lists.infradead.org
References: <20211020094850.4113-1-Kuan-Ying.Lee@mediatek.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211020094850.4113-1-Kuan-Ying.Lee@mediatek.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_052905_780874_3027406C 
X-CRM114-Status: GOOD (  21.18  )
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

On 20.10.21 11:48, Kuan-Ying Lee wrote:
> There are multiple kasan modes. It makes sense that we add some messages
> to know which kasan mode is when booting up. see [1].

s/is/is active/ ?

Looks reasonable to me

Reviewed-by: David Hildenbrand <david@redhat.com>

> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=212195 [1]
> Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> ---
> v3:
>  - Rebase to linux-next
>  - Move kasan_mode_info() into hw_tags.c
> v2:
>  - Rebase to linux-next
>  - HW-tag based mode need to consider asymm mode
>  - Thanks Marco's suggestion
> 
>  arch/arm64/mm/kasan_init.c |  2 +-
>  mm/kasan/hw_tags.c         | 14 +++++++++++++-
>  mm/kasan/sw_tags.c         |  2 +-
>  3 files changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
> index 5b996ca4d996..6f5a6fe8edd7 100644
> --- a/arch/arm64/mm/kasan_init.c
> +++ b/arch/arm64/mm/kasan_init.c
> @@ -309,7 +309,7 @@ void __init kasan_init(void)
>  	kasan_init_depth();
>  #if defined(CONFIG_KASAN_GENERIC)
>  	/* CONFIG_KASAN_SW_TAGS also requires kasan_init_sw_tags(). */
> -	pr_info("KernelAddressSanitizer initialized\n");
> +	pr_info("KernelAddressSanitizer initialized (generic)\n");
>  #endif
>  }
>  
> diff --git a/mm/kasan/hw_tags.c b/mm/kasan/hw_tags.c
> index dc892119e88f..7355cb534e4f 100644
> --- a/mm/kasan/hw_tags.c
> +++ b/mm/kasan/hw_tags.c
> @@ -106,6 +106,16 @@ static int __init early_kasan_flag_stacktrace(char *arg)
>  }
>  early_param("kasan.stacktrace", early_kasan_flag_stacktrace);
>  
> +static inline const char *kasan_mode_info(void)
> +{
> +	if (kasan_mode == KASAN_MODE_ASYNC)
> +		return "async";
> +	else if (kasan_mode == KASAN_MODE_ASYMM)
> +		return "asymm";
> +	else
> +		return "sync";
> +}
> +
>  /* kasan_init_hw_tags_cpu() is called for each CPU. */
>  void kasan_init_hw_tags_cpu(void)
>  {
> @@ -177,7 +187,9 @@ void __init kasan_init_hw_tags(void)
>  		break;
>  	}
>  
> -	pr_info("KernelAddressSanitizer initialized\n");
> +	pr_info("KernelAddressSanitizer initialized (hw-tags, mode=%s, stacktrace=%s)\n",
> +		kasan_mode_info(),
> +		kasan_stack_collection_enabled() ? "on" : "off");
>  }
>  
>  void kasan_alloc_pages(struct page *page, unsigned int order, gfp_t flags)
> diff --git a/mm/kasan/sw_tags.c b/mm/kasan/sw_tags.c
> index bd3f540feb47..77f13f391b57 100644
> --- a/mm/kasan/sw_tags.c
> +++ b/mm/kasan/sw_tags.c
> @@ -42,7 +42,7 @@ void __init kasan_init_sw_tags(void)
>  	for_each_possible_cpu(cpu)
>  		per_cpu(prng_state, cpu) = (u32)get_cycles();
>  
> -	pr_info("KernelAddressSanitizer initialized\n");
> +	pr_info("KernelAddressSanitizer initialized (sw-tags)\n");
>  }
>  
>  /*
> 


-- 
Thanks,

David / dhildenb


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
