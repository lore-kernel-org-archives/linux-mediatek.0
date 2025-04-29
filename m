Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F81C369DC
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Apr 2025 15:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fBCQ7yC4DZE+Brh4t/wNH1fz7LCB0Tusx2dGusJqi60=; b=OixZnwLfuNKCvjQgZp7wW5pL6Q
	LawBDXV/dFQ2lO15hEeoQXL5w+ENmQrDqvV98sFib+sfsh0yEuTsciQ6O66PkWXmBmMbevVCPOyTm
	vKVcl6CrfNkBO2BZMsaZVoqh86JG/fRam/kC2g/lalJat+iQ5Xse0dRGurcN1oI3IlVucANGQP3dN
	snekVCVygsWqTpwH67FH3WFGVCsVSCRL3IWx+etGocFkA7zUnAoq1ogH822cnHNjYm6+xM+9Tq0vE
	wTHsDpod0VafisFZC7iksBx2aMicE4LuaWh2s97K7sZbGCweSQg2/oGwe72AyKa1KBs1n7I2sbQ7E
	RXDTuUcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mSV-0000000A2wv-1n3G;
	Tue, 29 Apr 2025 15:01:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9m2t-00000009yV1-2mFV
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Apr 2025 14:34:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745937289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fBCQ7yC4DZE+Brh4t/wNH1fz7LCB0Tusx2dGusJqi60=;
	b=etcDz7JQcxASr818JR3UxlOVWGDJ5Dwa7nCFieb8vSXCEfeM2jRhhPmOns88ybs2BCogHD
	ObFEtS8/9/AFzURh9NUl/xgvItpVOn8jS9FYTT+RSTU16Hq+VlZngSpG4Ik245Y/pHXzjf
	I7vfvParOOWaKZT6Scd+Vm6+4iDW+U8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-7KBbjxq8O4KxkB1KJH_isw-1; Tue, 29 Apr 2025 10:34:47 -0400
X-MC-Unique: 7KBbjxq8O4KxkB1KJH_isw-1
X-Mimecast-MFC-AGG-ID: 7KBbjxq8O4KxkB1KJH_isw_1745937286
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-440667e7f92so30181425e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 29 Apr 2025 07:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745937286; x=1746542086;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fBCQ7yC4DZE+Brh4t/wNH1fz7LCB0Tusx2dGusJqi60=;
        b=Kb4kk0kGSAoT1NnFTr9WZWQ4M0e4aaAPASkG3TU+DYT/4AqM2MmWjTOZDTSHpbCRx9
         jC4ipqoLnmg3E4KoFr/oeV55/31X+CWkIJVADI0fd4/c8H85MCYuLcw0NL8so75HaNXr
         xHiAqUOW6L/HqONJ6pKuudDMZSA0nR/CmRUlQFgeaJOo3LNEDgISRPQwwOUhbC3ohAgB
         1mUVHSNtWrLm5xo/8y4QYUwIWnFfssOgnFTtxJSCEYHQKKZuyNp3qQu77T6/kk+X4Gsm
         OXdEnb925akTw6a2lou9suFWgA2Us6D0pJv1kpt1RsXL6QVhPXZEKbI6Oc5OpXI9Q9Xg
         5CDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpHCwkIiGMpTZfFpq1wF5eBQh90OA1T94zObt1R6WdnAw+LcJrc9uBZUpyHTTlZBF3MnxS0e1bzelXBxM80A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUnaLunwf8aoYELwEuQygLGNvRMJ1Giell0uLlWspsf2PIN5H+
	ptB4WzOeueXOuzQXJxkVt71JfeDvQW0gMhGgATvLg++1Hl0zq4TE24IGEd3ReIRK03z/URIRLqw
	nLCdXbLkyZpcg4UOZ65C8qaPcXpk9HRc6NDph9HCBNtIBbgzWootJUc7iYg7CAwf634AO9w==
X-Gm-Gg: ASbGnctV6q8r6ELUKKGfcNSxjw71PFd4zojY4cqVxIOnK+a6LwD5+sJ9XfKKHW2LihN
	91+cESyOdCz21cgrR8qqh5m0IbvWZ7YS6Glz0b2bjBgo67gAqPwATxlgFW4d1IbkKpuS+vn4aAZ
	czp+KAmvnVWOVekuNzlLyoexdriRZNL52q6gAvt3lU7ro/pScVyDjrC1TwFUomrSHtyMk1u6Hac
	52dRrkNuMdmT8kJ6NAkUuuB24RMSclukCo386d0FwHA4IJcEx1ckC2Bw7u8TYdkgyrLSFFY2d/s
	H1tb7Qd8QWPAG/vBm/g=
X-Received: by 2002:a05:600c:1e0e:b0:43c:fcbc:9680 with SMTP id 5b1f17b1804b1-441ac88acb9mr28922535e9.25.1745937286068;
        Tue, 29 Apr 2025 07:34:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzFC7JTH1cCKfCoD0KtL/PJnk0rLhxxGRVYh+6Vv8ZU7rmNtMiOe/2tPKSMhGhjoS8cjz9Pw==
X-Received: by 2002:a05:600c:1e0e:b0:43c:fcbc:9680 with SMTP id 5b1f17b1804b1-441ac88acb9mr28922245e9.25.1745937285632;
        Tue, 29 Apr 2025 07:34:45 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2726:1910::f39? ([2a0d:3344:2726:1910::f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a0692a22sm177630795e9.2.2025.04.29.07.34.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 07:34:45 -0700 (PDT)
Message-ID: <06953a63-7309-40d4-b515-ffc56e751559@redhat.com>
Date: Tue, 29 Apr 2025 16:34:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: call inet_twsk_put() on TIMEWAIT sockets It is
 possible for a pointer of type struct inet_timewait_sock to be returned from
 the functions __inet_lookup_established() and __inet6_lookup_established().
 This can cause a crash when the returned pointer is of type struct
 inet_timewait_sock and sock_put() is called on it. The following is a crash
 call stack that shows sk->sk_wmem_alloc being accessed in sk_free() during
 the call to sock_put() on a struct inet_timewait_sock pointer. To avoid this
 issue, use inet_twsk_put() instead of sock_put() when sk->sk_state is
 TCP_TIME_WAIT.
To: Shiming Cheng <shiming.cheng@mediatek.com>, edumazet@google.com,
 davem@davemloft.net, dsahern@kernel.org, kuba@kernel.org, horms@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Jibin Zhang <jibin.zhang@mediatek.com>
References: <20250425073120.28195-1-shiming.cheng@mediatek.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250425073120.28195-1-shiming.cheng@mediatek.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: I6Dk8Ix0WXm2byS9GMPM7dMuUFT4OL3m2gIGRAyO-MA_1745937286
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_073451_778010_A8295C14 
X-CRM114-Status: GOOD (  16.76  )
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

On 4/25/25 9:31 AM, Shiming Cheng wrote:
> From: Jibin Zhang <jibin.zhang@mediatek.com>
> 
> mrdump.ko        ipanic() + 120
> vmlinux          notifier_call_chain(nr_to_call=-1, nr_calls=0) + 132
> vmlinux          atomic_notifier_call_chain(val=0) + 56
> vmlinux          panic() + 344
> vmlinux          add_taint() + 164
> vmlinux          end_report() + 136
> vmlinux          kasan_report(size=0) + 236
> vmlinux          report_tag_fault() + 16
> vmlinux          do_tag_recovery() + 16
> vmlinux          __do_kernel_fault() + 88
> vmlinux          do_bad_area() + 28
> vmlinux          do_tag_check_fault() + 60
> vmlinux          do_mem_abort() + 80
> vmlinux          el1_abort() + 56
> vmlinux          el1h_64_sync_handler() + 124
> vmlinux        > 0xFFFFFFC080011294()
> vmlinux          __lse_atomic_fetch_add_release(v=0xF2FFFF82A896087C)
> vmlinux          __lse_atomic_fetch_sub_release(v=0xF2FFFF82A896087C)
> vmlinux          arch_atomic_fetch_sub_release(i=1, v=0xF2FFFF82A896087C)
> + 8
> vmlinux          raw_atomic_fetch_sub_release(i=1, v=0xF2FFFF82A896087C)
> + 8
> vmlinux          atomic_fetch_sub_release(i=1, v=0xF2FFFF82A896087C) + 8
> vmlinux          __refcount_sub_and_test(i=1, r=0xF2FFFF82A896087C,
> oldp=0) + 8
> vmlinux          __refcount_dec_and_test(r=0xF2FFFF82A896087C, oldp=0) + 8
> vmlinux          refcount_dec_and_test(r=0xF2FFFF82A896087C) + 8
> vmlinux          sk_free(sk=0xF2FFFF82A8960700) + 28
> vmlinux          sock_put() + 48
> vmlinux          tcp6_check_fraglist_gro() + 236
> vmlinux          tcp6_gro_receive() + 624
> vmlinux          ipv6_gro_receive() + 912
> vmlinux          dev_gro_receive() + 1116
> vmlinux          napi_gro_receive() + 196
> ccmni.ko         ccmni_rx_callback() + 208
> ccmni.ko         ccmni_queue_recv_skb() + 388
> ccci_dpmaif.ko   dpmaif_rxq_push_thread() + 1088
> vmlinux          kthread() + 268
> vmlinux          0xFFFFFFC08001F30C()

Part of the commit message landed inside the patch subject, the stack
trace should be decoded, the patch should target the 'net' tree and
include a suitable fixes tag.

Please have an accurate read at the process documentation under:

Documentation/process/

and especially to Documentation/process/maintainer-netdev.rst before the
next submission.

> 
> Signed-off-by: Jibin Zhang <jibin.zhang@mediatek.com>
> ---
>  net/ipv4/tcp_offload.c   | 8 ++++++--
>  net/ipv6/tcpv6_offload.c | 8 ++++++--
>  2 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/net/ipv4/tcp_offload.c b/net/ipv4/tcp_offload.c
> index 2308665b51c5..95d7cbf6a2b5 100644
> --- a/net/ipv4/tcp_offload.c
> +++ b/net/ipv4/tcp_offload.c
> @@ -431,8 +431,12 @@ static void tcp4_check_fraglist_gro(struct list_head *head, struct sk_buff *skb,
>  				       iph->daddr, ntohs(th->dest),
>  				       iif, sdif);
>  	NAPI_GRO_CB(skb)->is_flist = !sk;
> -	if (sk)
> -		sock_put(sk);
> +	if (sk) {
> +		if (sk->sk_state == TCP_TIME_WAIT)
> +			inet_twsk_put(inet_twsk(sk));
> +		else
> +			sock_put(sk);

You can simply use sock_gen_put() instead

/P


