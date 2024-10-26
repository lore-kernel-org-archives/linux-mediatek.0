Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D334AD10BE3
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Oct 2024 05:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eY8ZkEywyfjVgvKb0PE6wkcMqGE2Q4geJi7aoCgEDmQ=; b=2+y75R/8FVsoteYDDzXtICPtDE
	hV4iD4aXMBsK03yWSbJJ8zEfq+Pal2wsSaDVq/XNYUgl8JBDoaXf9R5Nk0sob/+X3QqArznqf7wPT
	rCtb3cXtzVupy2gT3Utn42bfTQjVTejIsMkAY0AnJIfu0SkkRkVFBTcsIu4e03MAtZ/h97suiCbgx
	fbtFeVhcUN2jmyvIo2/jwNrfVBsua+aWhQguGQ4DRwrAwc3yNKoY01gzxhM7AswfVDK8tcUcnT+q+
	mpvzQTJw6ixj8Zp6h80BTgA1CTXjlERlgo7bB1htgD9KziNW32Y6oqPu+ytgnUUDdfKVsgVawspYL
	wNQKL5hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4ZeU-00000005zjT-3IHn;
	Sat, 26 Oct 2024 05:47:54 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Zcv-00000005zc2-3yH9
	for linux-mediatek@lists.infradead.org;
	Sat, 26 Oct 2024 05:46:19 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-20c87b0332cso53935ad.1
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Oct 2024 22:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729921573; x=1730526373; darn=lists.infradead.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eY8ZkEywyfjVgvKb0PE6wkcMqGE2Q4geJi7aoCgEDmQ=;
        b=RPgvAJi5VKyTEyj3LbMYx7Icd3XrPICKiqF5ame5/m34eEPTPGMPeseOzcNFCTuDoz
         6hINkv2UaK7SV0+Z7Uk2i1IKfAQdU90zk8QdJmMROjy3Zevj/SJabddO38Ioe3CGWovl
         7HhFmGoYJd72hhozbk4KQTnIUx6v1FNI5lnKwcAV3NzlNhmTlfFlWCmSS9YbU2b2Luhr
         9URqWcHk+NTMRUPHvOM1Xu5Qm2mlBTPkS2IZncpwLE/Vkb501quote1grNP+k1v03oBF
         EGvx/Pn7t4i9qatcd1LWy+d3AadtmX29tumQQzrgHrEr/48khuV25JU73yQ6OUkSSdng
         7W0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729921573; x=1730526373;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eY8ZkEywyfjVgvKb0PE6wkcMqGE2Q4geJi7aoCgEDmQ=;
        b=PBYlSRacq9+xuxGHF7MU/hoxWvXqQ1l408Zqu8IR4WBLLOFLj3CmHbQ6EQzq7Q5un7
         ZkFlLMz1r7acM70Sj6QJjZWWMBRFlHJBq9J/ftbZGuzUeiwntcCDPEuqextlhbgB2Zw4
         /P5kS561wf8aaM49ACee+c1X7V0TRwc7n3TgXCfz7fRoncSgevdkopVtwtzZtljHlnRR
         Q2MRg/ZmSw4tDIyy1KB11ffmKQkRtZ7waWDp3aF/cenmbw/Hapgn7NX29mQJ/wWTO2Zq
         68AscEzRbuAKMWu9cV8sJp3xS8ZJhXzTN4NwbAoGIsKAMQ6J4yt2TmhnN6aYe9uVenbc
         k+Jg==
X-Forwarded-Encrypted: i=1; AJvYcCVZkgFiNaq0gNxlEslW9xJx1MIVf4F78ksxaLQn3f2eXlDZPOh1y2k7HsIDYaISLrSjyW/DB5HYT12e9APpJw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzIhQywE7vclkO/B+afIz6mThHU3c5jraso0lQqG3R7x31Mw4jx
	eXGZ0kqKRJTQdrrrNFn6uJ5KcuBAR2BTd+VhxM8MD1t0OMYiiY/bFYBFaSVb0g==
X-Google-Smtp-Source: AGHT+IHQJgLq26FeZB3qU743EYM2bPcmmi3fesK4osKTr3JrdwHB+K8I+X1vHhJIGYtKvNJXamqCdQ==
X-Received: by 2002:a17:902:fb84:b0:200:97b5:dc2b with SMTP id d9443c01a7336-210c7b885b5mr803385ad.15.1729921573136;
        Fri, 25 Oct 2024 22:46:13 -0700 (PDT)
Received: from [2620:0:1008:15:a73a:2b46:3ef7:2150] ([2620:0:1008:15:a73a:2b46:3ef7:2150])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc02ea63sm18221395ad.220.2024.10.25.22.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 22:46:09 -0700 (PDT)
Date: Fri, 25 Oct 2024 22:46:09 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
To: Qun-Wei Lin <qun-wei.lin@mediatek.com>
cc: Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, 
    Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Vlastimil Babka <vbabka@suse.cz>, 
    Roman Gushchin <roman.gushchin@linux.dev>, 
    Hyeonggon Yoo <42.hyeyoo@gmail.com>, 
    Matthias Brugger <matthias.bgg@gmail.com>, 
    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
    Danilo Krummrich <dakr@kernel.org>, catalin.marinas@arm.com, 
    surenb@google.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
    bpf@vger.kernel.org, Casper Li <casper.li@mediatek.com>, 
    Chinwen Chang <chinwen.chang@mediatek.com>, 
    Andrew Yang <andrew.yang@mediatek.com>, John Hsu <john.hsu@mediatek.com>, 
    wsd_upstream@mediatek.com
Subject: Re: [PATCH] mm: krealloc: Fix MTE false alarm in __do_krealloc
In-Reply-To: <20241025085811.31310-1-qun-wei.lin@mediatek.com>
Message-ID: <3740cf07-594a-d484-29de-5d76e2e97be3@google.com>
References: <20241025085811.31310-1-qun-wei.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_224617_994360_B102A07C 
X-CRM114-Status: GOOD (  13.06  )
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

On Fri, 25 Oct 2024, Qun-Wei Lin wrote:

> This patch addresses an issue introduced by commit 1a83a716ec233 ("mm:
> krealloc: consider spare memory for __GFP_ZERO") which causes MTE
> (Memory Tagging Extension) to falsely report a slab-out-of-bounds error.
> 
> The problem occurs when zeroing out spare memory in __do_krealloc. The
> original code only considered software-based KASAN and did not account
> for MTE. It does not reset the KASAN tag before calling memset, leading
> to a mismatch between the pointer tag and the memory tag, resulting
> in a false positive.
> 
> Example of the error:
> ==================================================================
> swapper/0: BUG: KASAN: slab-out-of-bounds in __memset+0x84/0x188
> swapper/0: Write at addr f4ffff8005f0fdf0 by task swapper/0/1
> swapper/0: Pointer tag: [f4], memory tag: [fe]
> swapper/0:
> swapper/0: CPU: 4 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.12.
> swapper/0: Hardware name: MT6991(ENG) (DT)
> swapper/0: Call trace:
> swapper/0:  dump_backtrace+0xfc/0x17c
> swapper/0:  show_stack+0x18/0x28
> swapper/0:  dump_stack_lvl+0x40/0xa0
> swapper/0:  print_report+0x1b8/0x71c
> swapper/0:  kasan_report+0xec/0x14c
> swapper/0:  __do_kernel_fault+0x60/0x29c
> swapper/0:  do_bad_area+0x30/0xdc
> swapper/0:  do_tag_check_fault+0x20/0x34
> swapper/0:  do_mem_abort+0x58/0x104
> swapper/0:  el1_abort+0x3c/0x5c
> swapper/0:  el1h_64_sync_handler+0x80/0xcc
> swapper/0:  el1h_64_sync+0x68/0x6c
> swapper/0:  __memset+0x84/0x188
> swapper/0:  btf_populate_kfunc_set+0x280/0x3d8
> swapper/0:  __register_btf_kfunc_id_set+0x43c/0x468
> swapper/0:  register_btf_kfunc_id_set+0x48/0x60
> swapper/0:  register_nf_nat_bpf+0x1c/0x40
> swapper/0:  nf_nat_init+0xc0/0x128
> swapper/0:  do_one_initcall+0x184/0x464
> swapper/0:  do_initcall_level+0xdc/0x1b0
> swapper/0:  do_initcalls+0x70/0xc0
> swapper/0:  do_basic_setup+0x1c/0x28
> swapper/0:  kernel_init_freeable+0x144/0x1b8
> swapper/0:  kernel_init+0x20/0x1a8
> swapper/0:  ret_from_fork+0x10/0x20
> ==================================================================
> 
> Fixes: 1a83a716ec233 ("mm: krealloc: consider spare memory for
> __GFP_ZERO")
> Signed-off-by: Qun-Wei Lin <qun-wei.lin@mediatek.com>

Acked-by: David Rientjes <rientjes@google.com>

