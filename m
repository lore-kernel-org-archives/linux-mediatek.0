Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43320C3271E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jul 2024 18:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1l7RkZW4K42K5HhDc9XjSgo16KpDrBeYr4KAsv4pJqw=; b=GPhQv1nuvlDnmHkHgoDx7zrZCG
	g/KTbHI1xi7ZIQrYxmjGsurE7g7I2n/NXtadW7ycFVcK1iwSR8G+idmOplSo2tINkie9+8UugKGFs
	sBUYV9srLRof/hYfUB5SxFqy6petNFw4fOXjPS/6BYqJ088soWcI2LNtoaShOJ5YTdztH3aH+J6fF
	Wv+hI2VQomJVIX26snmAS+kmj7X758cNBndZpGuJpCiSKaAmIysJCALscSJsiP0SB8pvhnRzAqhYq
	J8tyrbN5+4OrmRxz7SobpXPbktdLI6SFhi0YmLS/XT1UX5OjibZfnmnKrPN8emzKsQiwcXN3VVZgu
	MHuVE2EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQtEA-00000004ie9-09wU;
	Mon, 08 Jul 2024 18:36:42 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQtE7-00000004idj-0uTd;
	Mon, 08 Jul 2024 18:36:40 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-70b05260c39so2266391b3a.0;
        Mon, 08 Jul 2024 11:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720463798; x=1721068598; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1l7RkZW4K42K5HhDc9XjSgo16KpDrBeYr4KAsv4pJqw=;
        b=brDoPJXp83FOoIykl56pAUj9F6kp0c+jmAQg1fjL4LoGacodNNx+dBApBklo+Xi9GR
         wLe0PAG5fJ6EKEypuB3Qh/Hp+cMdJBdbWjTnI7jF+3TaOJ8eA1iKnu4Nx9pK7SSzF5sZ
         /DselkiCV61MfpkZJWbls0Fdxfz7quOI2FyQa0F8g6CEs1vys5q07Qo8hJEslLLBaHud
         OnyyY1Tyjkz0Wgh9oMoxHgXeY1hL/eZwwcBbf9+4AIu9F/PX1ZkCnm8iDNBdn9BGN4lq
         lhBst64ngOyK5FyGqDpX82FPs/lMAJMj0uMVA4vGMp2mMwoi96t5LkB+F+1sS/wHVuME
         4v9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720463798; x=1721068598;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1l7RkZW4K42K5HhDc9XjSgo16KpDrBeYr4KAsv4pJqw=;
        b=hDZY+2L3uvaMszbvGgXabXiF0YbDInVBr2hUqAQ1kKHBGemQFIotfdP8O988x6F3ko
         2TSyKI7sK+AfBhIMWopFo4sNNL6Mchg6uJM4Hv+eBH+VgkGdoCxWnqLa881npn2EFMuJ
         pgdlECACYbWayf4TU0JbFUfnnz4FUcXJCpzYcZZrNsfbrTMK0VweN5Yz87txqaLKDdCJ
         zEAz8+fLsQ0NxmyB1nZ/c4CUKcg6T5NyfScQaJZChG44CN+Mk5SJKSuXhzQUszt8h7w1
         R5cvaJF3To4xWeM/u4xwwBQPu0X9RvpsPYZBPDnhSTLSFdprc0Bz40t1un2cQ4x6VONO
         fbAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFe0IdaiTOUn8f1z14zssdRcDr8gURqLv9ALLJBO5zm1eSi9UmrNEjOy2X4Goyp5v2xOjGzlVPKqTDg0lFd9fQ4IvljlOrhE7v5FBBeiWZrghV+5EFyenz0dRt5TByQVi13s6lwd6cXVo894lu6Tcky9em2+/ijFI=
X-Gm-Message-State: AOJu0Yx6JhFzqjE7t/R4MhM4WDjFFrQP8pRW2E39hWuYxm2KemQzafZO
	x0f2gcZ1c4xcUggkPH2pg9pJjG/Bet4URd6dGyJf/r2yXPHEzMAs
X-Google-Smtp-Source: AGHT+IGP53V6v/ZzF/GFlM291/YOeHzaTpwzKRY4M+ixCU8gA3K0CAlN8WMbRLVroxdlsy54+98hiQ==
X-Received: by 2002:a05:6a00:198e:b0:70b:122c:856 with SMTP id d2e1a72fcca58-70b43627217mr550042b3a.31.1720463797887;
        Mon, 08 Jul 2024 11:36:37 -0700 (PDT)
Received: from localhost (dhcp-141-239-149-160.hawaiiantel.net. [141.239.149.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b4389bd04sm198121b3a.24.2024.07.08.11.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 11:36:37 -0700 (PDT)
Date: Mon, 8 Jul 2024 08:36:36 -1000
From: "tj@kernel.org" <tj@kernel.org>
To: Boy Wu =?utf-8?B?KOWQs+WLg+iqvCk=?= <Boy.Wu@mediatek.com>
Cc: "boris@bur.io" <boris@bur.io>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"axboe@kernel.dk" <axboe@kernel.dk>,
	Iverlin Wang =?utf-8?B?KOeOi+iLs+mclik=?= <Iverlin.Wang@mediatek.com>,
	"josef@toxicpanda.com" <josef@toxicpanda.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] blk-cgroup: add spin_lock for u64_stats_update
Message-ID: <ZowxtI69yd4IexQY@slm.duckdns.org>
References: <20240705075544.11315-1-boy.wu@mediatek.com>
 <Zogpum23mjHZC8yO@slm.duckdns.org>
 <709276ca279982cf0014e93eafaa2272f847ff4a.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <709276ca279982cf0014e93eafaa2272f847ff4a.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_113639_281536_4D46DF1E 
X-CRM114-Status: GOOD (  16.59  )
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

Hello,

On Mon, Jul 08, 2024 at 02:00:42AM +0000, Boy Wu (吳勃誼) wrote:
> When accessing /sys/fs/cgroup/io.stat, blkcg_print_stat will be called,
> and there is a small chance that four processes on each CPU core are
> accessing /sys/fs/cgroup/io.stat, which means four CPUs are calling
> blkcg_print_stat. As a result, blkcg_fill_root_iostats will be called
> simultaneously. However, u64_stats_update_begin_irqsave and
> u64_stats_update_end_irqrestore are not protect by spin_locks, so there
> is a small chance that the sync.seq.sequence will be an odd number
> after u64_stats_update_end_irqrestore due to the concurrent CPUs acess,
> because sync.seq.sequence plus one is not an atomic operation.
> 
> do_raw_write_seqcount_begin():
> /usr/src/kernel/common/include/linux/seqlock.h:469
> c05e5cfc:       e5963030        ldr     r3, [r6, #48]   ; 0x30
> c05e5d00:       e2833001        add     r3, r3, #1
> c05e5d04:       e5863030        str     r3, [r6, #48]   ; 0x30
> /usr/src/kernel/common/include/linux/seqlock.h:470
> c05e5d08:       f57ff05a        dmb     ishst
> 
> do_raw_write_seqcount_end():
> /usr/src/kernel/common/include/linux/seqlock.h:489
> c05e5d30:       f57ff05a        dmb     ishst
> /usr/src/kernel/common/include/linux/seqlock.h:490
> c05e5d34:       e5963030        ldr     r3, [r6, #48]   ; 0x30
> c05e5d38:       e2833001        add     r3, r3, #1
> c05e5d3c:       e5863030        str     r3, [r6, #48]   ; 0x30
> 
> To prevent this problem, I added spin_locks in blkcg_fill_root_iostats,
> and this solution works fine to me when I use the stress-ng --sysfs
> test.

Ah, okay, so, there are two usages of u64_sync synchronization - one is for
blkg->iostat_cpu and the other for blkg->iostat. The former makes sense and
is safe as there can ever be only one updater with irq disabled. The latter
doesn't work as there can be multiple updaters and should be removed (and
replaced with spinlock). There's already blkg_stat_lock which probably was
added for a similar reason in __blkcg_rstat_flush(). Can you please update
the patch to remove the u64_sync usage for blkg->iostat and replace it with
blkg_stat_lock?

Thanks.

-- 
tejun

