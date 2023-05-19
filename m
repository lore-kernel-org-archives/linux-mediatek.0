Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9003C77B75
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 May 2023 10:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VI5tgplCEt4jHAaMyiKalfapGPWMDCQqKZuSohEz4I8=; b=f7CYk/h7FrBgqfznzufWJcMTO1
	jaq6LfsBqeA3NPiPnnEKnJFd52J1sWM/JJ+snI2lx1BFhgPRJMQNpMQeaP+7Swu5aNA3u5+xLKRXK
	ch3HyrYrsukROHF0TC0kF0TxRu3/tOtxDNDsw9BKSf+mEFDkz/v8UTDU8Bu4RPgKpjx9KxQ1YEcYI
	faEgbEe1vFJRwMceGmbvTSBNl6OwPV91At8y0/UYxH0qEr8t4aR4KYjzoWH+0nJkDdC0Iy/VeQo/3
	W1Qe5SwnCLVHgsaed0Zz5j9kV/5P6Y+DsU7WQNegYVn+dnnRvGXuqHCzJWLyYP9cvDwMWC5vhnMyL
	qKi2Mo4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzwvb-00Fp4F-0Q;
	Fri, 19 May 2023 10:01:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzwvW-00Fp13-17
	for linux-mediatek@lists.infradead.org;
	Fri, 19 May 2023 10:01:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684490493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VI5tgplCEt4jHAaMyiKalfapGPWMDCQqKZuSohEz4I8=;
	b=fW7E5ik3ixS54q8fvuGmgtOPz9MXDOZcRGvsqBnz+x06ajAyZPe5Uq15VhkZHriN+4i65d
	0c7DsTQiVeUMBFTm3ChTyWoxcobdXLWbibzjKWepR6zYxE6HLHLr2NXTmn9y+88MB7VwNT
	yw4KW+Pk2n8IHEg8rFGy4jw5kOHXg8g=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-oHwIEQroOVKkOqYsSbSL7Q-1; Fri, 19 May 2023 06:01:24 -0400
X-MC-Unique: oHwIEQroOVKkOqYsSbSL7Q-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3095483ea29so262426f8f.1
        for <linux-mediatek@lists.infradead.org>; Fri, 19 May 2023 03:01:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684490483; x=1687082483;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VI5tgplCEt4jHAaMyiKalfapGPWMDCQqKZuSohEz4I8=;
        b=TP0Nre5IWhA9hYD8vN/+DIytqLWFBjoLjRxkWLo1OrcQ48xG0W5WE1lOksatCrwOYZ
         HECnHKeMGbTu82IykSlkqTb0GCQ7ERo/ZAo8RJj1CSNxsxBM7aE2P6LkItXWBJNS7esH
         QH9kg2VRN/hcYrAoiF5TeXyzIE2zm9jKXHHjo4wrhSVzdIYqS9yzI9CSN2E1Pj3NkRLC
         k/5MoXpxoqjj69q7FyWXQNVBtiwDbgWnwR618vtNEaxKGYFW7QFNMiqYbh6pjjR+JvTx
         dr/LRtMynDw43cKb2kruRF0uz3Xq0c9bW/89wHWsoDJbMMBh1QIzr6YhVHfn1sK1/Q8w
         GLzg==
X-Gm-Message-State: AC+VfDw9Te8f110mREPql2Az/1kicCxBnmsewcO6Q5A6oNTNy7cgkE7x
	4AhGd4dtvBT2vgfCsq70Xhk7jOu3HVC7hBPq9iDrxc6CrC+s+Vd4rK01hswW4KlOmtGwF5Ip3z2
	vuMIQvXjXc0ynRVxaVrmqVunXtDLDLB9+
X-Received: by 2002:a5d:4b43:0:b0:309:5068:9ebe with SMTP id w3-20020a5d4b43000000b0030950689ebemr1226770wrs.50.1684490483438;
        Fri, 19 May 2023 03:01:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6bW0gym5bX5jcXG9w5DVs/9Wlup2M96haNB0vR03K3c+zLetIbvoA2UiOPc9NtNRwR6l97Vg==
X-Received: by 2002:a5d:4b43:0:b0:309:5068:9ebe with SMTP id w3-20020a5d4b43000000b0030950689ebemr1226745wrs.50.1684490482941;
        Fri, 19 May 2023 03:01:22 -0700 (PDT)
Received: from ?IPV6:2003:cb:c722:9d00:7421:54d8:9227:a3e8? (p200300cbc7229d00742154d89227a3e8.dip0.t-ipconnect.de. [2003:cb:c722:9d00:7421:54d8:9227:a3e8])
        by smtp.gmail.com with ESMTPSA id k13-20020a5d518d000000b00306344eaebfsm4801755wrv.28.2023.05.19.03.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 03:01:22 -0700 (PDT)
Message-ID: <83a846a9-8f88-3f66-b840-e84d072bb0fb@redhat.com>
Date: Fri, 19 May 2023 12:01:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: =?UTF-8?B?WGlhb21pbmcgRGluZyAo5LiB5pmT5piOKQ==?=
 <Xiaoming.Ding@mediatek.com>, "hch@infradead.org" <hch@infradead.org>,
 "sumit.garg@linaro.org" <sumit.garg@linaro.org>
Cc: =?UTF-8?B?RmVpIFh1ICjlvpDpo54p?= <Fei.Xu@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "srv_heupstream@mediatek.com" <srv_heupstream@mediatek.com>,
 "jens.wiklander@linaro.org" <jens.wiklander@linaro.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "op-tee@lists.trustedfirmware.org" <op-tee@lists.trustedfirmware.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
References: <20230517031856.19660-1-xiaoming.ding@mediatek.com>
 <ZGSDoVKKVqCkbaCB@infradead.org>
 <CAFA6WYO+AvnbuAdWyBAQ8HkLaOno7PXdsPb9SubxrGNvAm4UnQ@mail.gmail.com>
 <ZGSLiiK/JzD5KMd7@infradead.org>
 <CAFA6WYPOMwmrA3J84AHzoD2eAtNkpMxr754qHpc-j6XRkgFFvQ@mail.gmail.com>
 <ZGSgCZrg+RjAbGO1@infradead.org>
 <CAFA6WYO+EpiECFxdVgmd-Ey9jq1Ybt78WupK_bW5+oDcW-soVQ@mail.gmail.com>
 <781d993204fbbdf30a6ca495b59b3b0aa7a2e496.camel@mediatek.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] tee: add FOLL_LONGTERM for CMA case when alloc shm
In-Reply-To: <781d993204fbbdf30a6ca495b59b3b0aa7a2e496.camel@mediatek.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_030134_467950_AFE80948 
X-CRM114-Status: GOOD (  21.02  )
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

On 18.05.23 08:40, Xiaoming Ding (丁晓明) wrote:
>  From 35fd062d5cbc4d182eee0183843cd6350d126788 Mon Sep 17 00:00:00 2001
> From: Xiaoming Ding <xiaoming.ding@mediatek.com>
> Date: Wed, 10 May 2023 10:15:23 +0800
> Subject: [PATCH v2] tee: add FOLL_LONGTERM for CMA case when alloc shm
> 
> CMA is widely used on insufficient memory platform for
> secure media playback case, and FOLL_LONGTERM will
> avoid tee_shm alloc pages from CMA region.
> without FOLL_LONGTERM, CMA region may alloc failed since
> tee_shm has a chance to use it in advance.
> 
> modify is verified on OPTEE XTEST and kinds of secure + clear playback
> 
> 
> Fixes: 033ddf12bcf5 ("tee: add register user memory")
> Signed-off-by: Xiaoming Ding <xiaoming.ding@mediatek.com>
> ---
> v1 -> v2: take off the ifdef and apply FOLL_LONGTERM by default
> 
>   drivers/tee/tee_shm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> index 673cf0359494..38878e549ca4 100644
> --- a/drivers/tee/tee_shm.c
> +++ b/drivers/tee/tee_shm.c
> @@ -257,7 +257,7 @@ register_shm_helper(struct tee_context *ctx,
> unsigned long addr,
>   	}
>   
>   	if (flags & TEE_SHM_USER_MAPPED)
> -		rc = pin_user_pages_fast(start, num_pages, FOLL_WRITE,
> +		rc = pin_user_pages_fast(start, num_pages, FOLL_WRITE |
> FOLL_LONGTERM,
>   					 shm->pages);
>   	else
>   		rc = shm_get_kernel_pages(start, num_pages, shm-
>> pages);

I didn't dive deeply into that code, but I can spot that we can end up 
long-term pinning multiple pages -- possibly unbound or is there any 
sane limit on the number of pages?

Take a look at io_uring/rsrc.c and how we account long-term pinned pages 
against user->locked_vm/ctx->mm_account->pinned_vm in io_account_mem().

If user space could only end up pinning one or two pages via that 
interface, ok. But it looks like this interface could be abused to 
create real real trouble by unprivileged users that should be able to 
long-term pin that many pages.

Am I missing something important (i.e., interface is only accessible by 
privileged users) or should there be proper accounting and 
RLIMIT_MEMLOCK checks?

-- 
Thanks,

David / dhildenb


