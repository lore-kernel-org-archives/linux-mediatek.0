Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA23C77B61
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Apr 2023 16:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQPzlQXVK7yiO98rLUpsr4qSlOZNSd2wUC44NfOzC5o=; b=xNq0TiwK6JNj1KR9ucRdegLIR3
	i446Pyx0p/1gECGwFmu9bJ36DBI29gxzciqum6QfDojpLeQq7WPLvQzdiHG7CP7YU3CpbNZEGM/AX
	rr5FSHW4iZCjcWgdg0BBkxOvkmCx+UytIx4DHHkPOc5M/kypLSVb1fePK01tyZ14nmIE0QDEeBqdJ
	JrXBuQozOc5UfdFU0rVzHYvUBiwLnG0+1S5wpcZ/d8Pmgb2YiW/JWGd9F7xJ+MgVndtnG1cv+f9AN
	3B0iTyHWm2ym+43d9U91FNnz7bqLsYd3b18Z4QFQYJzTA56YBxCnJpyCiHcbqwp/UKGdG8BnrX2TV
	QTqeezOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqzNV-00GqgZ-1J;
	Mon, 24 Apr 2023 16:49:25 +0000
Received: from mail-pj1-f45.google.com ([209.85.216.45])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqzNR-00Gqf2-1n;
	Mon, 24 Apr 2023 16:49:23 +0000
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-24b89b9a72cso1662370a91.1;
        Mon, 24 Apr 2023 09:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682354957; x=1684946957;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pQPzlQXVK7yiO98rLUpsr4qSlOZNSd2wUC44NfOzC5o=;
        b=QMQVqmuNKW5RE8siJhDoL5v4TEGC8XzFSOT4MQwHi3RV0FSoZaPX1XmYzHnNzgTE7R
         7BCncy8OcInBNtUUrNtVWOla8jNZ6GVouMh/vO500gm3WD7qbfIxvc+KRCw656Kaj88W
         L+lvysa3HM0lhNiCtATsTztUNwDFNTDPE0A4zM2LB8jEpbHZchwMbKxbuqfMhNpvnsv9
         KUFW5/CwN7EBnKruD9dTx5HPJphLG4wb9zv6VA2Nd9MQWjNte/ON2PegKIfp6lKKTbG/
         u6Fv1ZKaO2oQhjlAvhegjWfWuGryyfYGPdyu6LF5BwRspvJSRQiA1rx2BPCelcE7h7Bm
         htOw==
X-Gm-Message-State: AAQBX9eFd4wWPC0bgCU26Ld0cOyqIalp9NtxhtgbSuFG79dpJdo9wt0V
	iMlYbFJMTgfYJPQOFXrAELc=
X-Google-Smtp-Source: AKy350buLU0OlbzX25JOXcAqUZe69CK7FS254G2Wob6KCJ3eWiKz4m8UCiG1J0FN5j8wYX04LKmdtg==
X-Received: by 2002:a17:90a:ca81:b0:247:a272:71be with SMTP id y1-20020a17090aca8100b00247a27271bemr14748647pjt.46.1682354957075;
        Mon, 24 Apr 2023 09:49:17 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:1f14:a83c:1e8:6ae2? ([2620:15c:211:201:1f14:a83c:1e8:6ae2])
        by smtp.gmail.com with ESMTPSA id o5-20020a17090aac0500b0024677263e36sm6528524pjq.43.2023.04.24.09.49.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Apr 2023 09:49:16 -0700 (PDT)
Message-ID: <8948f2b1-e11f-8f84-62e7-e5b13be587b4@acm.org>
Date: Mon, 24 Apr 2023 09:49:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 1/1] scsi: ufs: core: Fix &hwq->cq_lock deadlock issue
Content-Language: en-US
To: Alice Chao <alice.chao@mediatek.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Can Guo <quic_cang@quicinc.com>, Asutosh Das <quic_asutoshd@quicinc.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: peter.wang@mediatek.com, chun-hung.wu@mediatek.com,
 powen.kao@mediatek.com, naomi.chu@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, wsd_upstream@mediatek.com,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230424080400.8955-1-alice.chao@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20230424080400.8955-1-alice.chao@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_094921_589641_C3556A35 
X-CRM114-Status: GOOD (  13.22  )
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

On 4/24/23 01:03, Alice Chao wrote:
> [name:lockdep&]WARNING: inconsistent lock state
> [name:lockdep&]--------------------------------
> [name:lockdep&]inconsistent {IN-HARDIRQ-W} -> {HARDIRQ-ON-W} usage.
> [name:lockdep&]kworker/u16:4/260 [HC0[0]:SC0[0]:HE1:SE1] takes:
>    ffffff8028444600 (&hwq->cq_lock){?.-.}-{2:2}, at:
> ufshcd_mcq_poll_cqe_lock+0x30/0xe0
> [name:lockdep&]{IN-HARDIRQ-W} state was registered at:
>    lock_acquire+0x17c/0x33c
>    _raw_spin_lock+0x5c/0x7c
>    ufshcd_mcq_poll_cqe_lock+0x30/0xe0
>    ufs_mtk_mcq_intr+0x60/0x1bc [ufs_mediatek_mod]
>    __handle_irq_event_percpu+0x140/0x3ec
>    handle_irq_event+0x50/0xd8
>    handle_fasteoi_irq+0x148/0x2b0
>    generic_handle_domain_irq+0x4c/0x6c
>    gic_handle_irq+0x58/0x134
>    call_on_irq_stack+0x40/0x74
>    do_interrupt_handler+0x84/0xe4
>    el1_interrupt+0x3c/0x78
> <snip>
> 
> Possible unsafe locking scenario:
>         CPU0
>         ----
>    lock(&hwq->cq_lock);
>    <Interrupt>
>      lock(&hwq->cq_lock);
>    *** DEADLOCK ***
> 2 locks held by kworker/u16:4/260:
> 
> [name:lockdep&]
>   stack backtrace:
> CPU: 7 PID: 260 Comm: kworker/u16:4 Tainted: G S      W  OE
> 6.1.17-mainline-android14-2-g277223301adb #1
> Workqueue: ufs_eh_wq_0 ufshcd_err_handler
> 
>   Call trace:
>    dump_backtrace+0x10c/0x160
>    show_stack+0x20/0x30
>    dump_stack_lvl+0x98/0xd8
>    dump_stack+0x20/0x60
>    print_usage_bug+0x584/0x76c
>    mark_lock_irq+0x488/0x510
>    mark_lock+0x1ec/0x25c
>    __lock_acquire+0x4d8/0xffc
>    lock_acquire+0x17c/0x33c
>    _raw_spin_lock+0x5c/0x7c
>    ufshcd_mcq_poll_cqe_lock+0x30/0xe0
>    ufshcd_poll+0x68/0x1b0
>    ufshcd_transfer_req_compl+0x9c/0xc8
>    ufshcd_err_handler+0x3bc/0xea0
>    process_one_work+0x2f4/0x7e8
>    worker_thread+0x234/0x450
>    kthread+0x110/0x134
>    ret_from_fork+0x10/0x20
> 
> ufs_mtk_mcq_intr() could refer to
> https://lore.kernel.org/all/20230328103423.10970-3-powen.kao@mediatek.com/
> 
> When ufshcd_err_handler() is executed, CQ event interrupt can enter
> waiting for the same lock. It could happened in upstream code path
> ufshcd_handle_mcq_cq_events() and also in ufs_mtk_mcq_intr(). This
> warning message will be generated when &hwq->cq_lock is used in IRQ
> context with IRQ enabled. Use ufshcd_mcq_poll_cqe_lock() with
> spin_lock_irqsave instead of spin_lock to resolve the deadlock issue.

For future patches, please make sure that the patch description occurs 
before the call traces. Anyway:

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

