Return-Path: <SRS0=VH+m=2X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6098C3276C
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jan 2020 23:10:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8982721655
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jan 2020 23:10:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U0NAn88Q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dxzt9YBu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8982721655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KzIaiHCQheZB+x2N0L5QOzsVDdbiOgPXTTHX9866XW8=; b=U0NAn88QFwjaVO
	fH++uJqvFuVhfJd1z4ZNtr8guQuD+iR8qX8xFLMjK6+LndsE4e8hrB2G8mxGZmg7fwcNa5TlL3byD
	7WFDW94CKB9gLfqTqbqBIYOz0nt9HpxL9vAc0f0H+Mk2fGWjosXFhh7uAeNqlYGJSyVnHfhcHuiqf
	fxB2mcuZvGyLDEhsKD0pM6+SRTywVwoiMPiq2Ot8YSmsQdef+KOd/phuUyVKEx3PeApSjJMppwJME
	SygiAB7hPyUAGO6Mf92KtPbc39CuwrmxkKSH5ieXz9xqrJow5bbM1DM4s8ZYplmZxZOpsc0bznQAm
	w2mkNL3JLJekFYvVa6ow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1in9cG-0007A1-3i; Thu, 02 Jan 2020 23:10:56 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1in9cD-000799-6e
 for linux-mediatek@lists.infradead.org; Thu, 02 Jan 2020 23:10:54 +0000
Received: by mail-pf1-x442.google.com with SMTP id x6so21626663pfo.10
 for <linux-mediatek@lists.infradead.org>; Thu, 02 Jan 2020 15:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XvwcmHPY3xBaQylUvcjtExsV2WDnCVvAIv7xx9ewrvM=;
 b=Dxzt9YBu8oeqt/j6Eu0JWQqyuJpR1+jeacinGdmNDZ55iC+LG4UjhokanjOyB7djcv
 geMioTAVEbQE9/T2CnfB1uC6yhOIdBiSuG/B7l+cQofZpSrpM557p9rkGNqcWPZab8Ig
 +1ebPWNDYNQmkFDR9tkxM9eIGDUPrFPRJmj8Rm+jXl7qidwDeiCvubseh2nXSFH5PGEb
 HLRPzti/U8fNr2E0GZIssYCmTuhQlidCgB2H4vA/5QPULPRdrVKlHtS/SjV+2V5zQ7oF
 TeV0LbwWuJD5LlVMwM4rlBKOVjWUqWy9/p5CXWmUTAQuBuU42eBFqWi2PYwWI7AJ/NKf
 E3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XvwcmHPY3xBaQylUvcjtExsV2WDnCVvAIv7xx9ewrvM=;
 b=dCxKkkCYgMkl+gygf26qlKtJ97Ra0mUVUS+0Sm+STWLQcuL10cnaPUyPe18vRfybbg
 8F5zmMZgKtfUjWzi/twqduoqnkQpAmnhoF3YiisBB5CB7fvFAU/PGNiDTDHyykqSrvVe
 Kn5JTQYWmkugY+3fNFEZhSxKgScqPWfuW2aEBxrf7Nq7tE9kyRKL/uKyItLEcrJeSA+1
 yjtKkL/UOuigIoPHTPln8dR4J83ctn4SNyTAt0cqndZlAWr1KQDHHrZwYfz106f+kt2y
 wmkS9+QuhopebRf3b1/3DQcB591WITdu7H8lKwFBU0mg+f+CMybr6jgqSCBcpSJtxMTy
 sUVQ==
X-Gm-Message-State: APjAAAWm9hkVTgcxHI823lgpdzoo8AKo2SXvuaEyIPpnnlja2Znm+m0l
 2DBSF1wAJJ+JX7h0J/HlTt+3FWXA
X-Google-Smtp-Source: APXvYqwSvmaLX95NvO8LIdQ8euTG4ZVQh7OZlfvKpWGv4sL/HQeB/U+QZ/AKjl2E0D+b412ohrAgew==
X-Received: by 2002:a63:e4b:: with SMTP id 11mr92876003pgo.5.1578006651943;
 Thu, 02 Jan 2020 15:10:51 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
 by smtp.gmail.com with ESMTPSA id c1sm66249432pfa.51.2020.01.02.15.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2020 15:10:51 -0800 (PST)
Date: Thu, 2 Jan 2020 15:10:49 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH] Input: evdev - convert kzalloc()/vzalloc() to kvzalloc()
Message-ID: <20200102231049.GD8314@dtor-ws>
References: <20191118054727.31045-1-miles.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191118054727.31045-1-miles.chen@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200102_151053_270545_F6EC08BA 
X-CRM114-Status: GOOD (  16.55  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 wsd_upstream@mediatek.com, linux-input@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Nov 18, 2019 at 01:47:27PM +0800, Miles Chen wrote:
> We observed a large(order-3) allocation in evdev_open() and it may
> cause an OOM kenrel panic in kzalloc(), before we getting to the
> vzalloc() fallback.
> 
> Fix it by converting kzalloc()/vzalloc() to kvzalloc() to avoid the
> OOM killer logic as we have a vmalloc fallback.
> 
> InputReader invoked oom-killer: gfp_mask=0x240c2c0
> (GFP_KERNEL|__GFP_NOWARN|__GFP_COMP|__GFP_ZERO), nodemask=0, order=3,
> oom_score_adj=-900
> ...
> (dump_backtrace) from (show_stack+0x18/0x1c)
> (show_stack) from (dump_stack+0x94/0xa8)
> (dump_stack) from (dump_header+0x7c/0xe4)
> (dump_header) from (out_of_memory+0x334/0x348)
> (out_of_memory) from (__alloc_pages_nodemask+0xe9c/0xeb8)
> (__alloc_pages_nodemask) from (kmalloc_order_trace+0x34/0x128)
> (kmalloc_order_trace) from (__kmalloc+0x258/0x36c)
> (__kmalloc) from (evdev_open+0x5c/0x17c)
> (evdev_open) from (chrdev_open+0x100/0x204)
> (chrdev_open) from (do_dentry_open+0x21c/0x354)
> (do_dentry_open) from (vfs_open+0x58/0x84)
> (vfs_open) from (path_openat+0x640/0xc98)
> (path_openat) from (do_filp_open+0x78/0x11c)
> (do_filp_open) from (do_sys_open+0x130/0x244)
> (do_sys_open) from (SyS_openat+0x14/0x18)
> (SyS_openat) from (__sys_trace_return+0x0/0x10)
> ...
> Normal: 12488*4kB (UMEH) 6984*8kB (UMEH) 2101*16kB (UMEH) 0*32kB
> 0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 139440kB
> HighMem: 206*4kB (H) 131*8kB (H) 42*16kB (H) 2*32kB (H) 0*64kB
> 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 2608kB
> ...
> Kernel panic - not syncing: Out of memory and no killable processes...
> 
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>

Applied, thank you.

> ---
>  drivers/input/evdev.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/input/evdev.c b/drivers/input/evdev.c
> index d7dd6fcf2db0..cf5d7d63fd48 100644
> --- a/drivers/input/evdev.c
> +++ b/drivers/input/evdev.c
> @@ -484,10 +484,7 @@ static int evdev_open(struct inode *inode, struct file *file)
>  	struct evdev_client *client;
>  	int error;
>  
> -	client = kzalloc(struct_size(client, buffer, bufsize),
> -			 GFP_KERNEL | __GFP_NOWARN);
> -	if (!client)
> -		client = vzalloc(struct_size(client, buffer, bufsize));
> +	client = kvzalloc(struct_size(client, buffer, bufsize), GFP_KERNEL);
>  	if (!client)
>  		return -ENOMEM;
>  
> -- 
> 2.18.0

-- 
Dmitry

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
