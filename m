Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102F9C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 13:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8e7TPT/536Gni9vyg2HEi4i8heCxJKZTLqmItzP+KAE=; b=DZbNTdUQTK9lZk
	UMbmHIiXHq39+l5jaCahqRi6IjPZZRNUyDp0O/T8NcUPOCp/QjbbqAOxLWCzfy6oNZ14MhI8X6CA1
	LzJXfNnRUeTrQAU+XmMtMsdwSmqKjRpF/r1UvoxKWtL2iQ4esFpVkrD5VWRmAIf7z6n/f4SEVzThM
	URPh+op2EnKqihKZpJS+XRClD76DbZLUmNGu73ZPm8wi9Qyn90h6I6EZRK25uAlmi+eLx/ZAVUrni
	ijoSHK/ZA5wAcpf2b5c2Uru1wt+5T5PBrzM1Yay9hTeQlNsVYtKnP1P5Vx2l2BoXNv3uBoY1ZngEo
	y09k4FeRhLKjGMyVpzgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNaS7-0051Rb-PI; Fri, 25 Feb 2022 13:16:07 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNaRr-0051K9-Ph; Fri, 25 Feb 2022 13:15:53 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 482B21F380;
 Fri, 25 Feb 2022 13:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1645794949; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PmNIIM3gpZH3rKjV9RV8YeTjUMiihTOkooMrV/E9GyM=;
 b=ZSrW6K79vK/zTZhgRs6T7UlP4hs6EUqsHsiSUV/My/ujlxqJ316FZPZVfSn/2Mnqf4GaUM
 wT5ysHhyfe82zyDrREof/bqZqIM4PWuXHAYmjrRQqwBy2PFrvNMRePKzBEG2uXwyibPu7R
 UMh+UPy5ffqL0H6S/rd2bXklgMFI368=
Received: from suse.cz (unknown [10.100.216.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id A46FFA3B83;
 Fri, 25 Feb 2022 13:15:48 +0000 (UTC)
Date: Fri, 25 Feb 2022 14:15:48 +0100
From: Petr Mladek <pmladek@suse.com>
To: Lecopzer Chen <lecopzer.chen@mediatek.com>
Cc: linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 davem@davemloft.net, Matthias Brugger <matthias.bgg@gmail.com>,
 Marc Zyngier <maz@kernel.org>, Julien Thierry <jthierry@redhat.com>,
 Kees Cook <keescook@chromium.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Wang Qing <wangqing@vivo.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Xiaoming Ni <nixiaoming@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-mediatek@lists.infradead.org, sumit.garg@linaro.org,
 kernelfans@gmail.com, yj.chiang@mediatek.com
Subject: Re: [PATCH 3/5] kernel/watchdog_hld: Ensure CPU-bound context when
 creating hardlockup detector event
Message-ID: <YhjWhCoZelIhBMyS@alley>
References: <20220212104349.14266-1-lecopzer.chen@mediatek.com>
 <20220212104349.14266-4-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220212104349.14266-4-lecopzer.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_051552_040204_94C2B910 
X-CRM114-Status: GOOD (  14.12  )
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

On Sat 2022-02-12 18:43:47, Lecopzer Chen wrote:
> From: Pingfan Liu <kernelfans@gmail.com>
> 
> from: Pingfan Liu <kernelfans@gmail.com>
> 
> hardlockup_detector_event_create() should create perf_event on the
> current CPU. Preemption could not get disabled because
> perf_event_create_kernel_counter() allocates memory. Instead,
> the CPU locality is achieved by processing the code in a per-CPU
> bound kthread.
> 
> Add a check to prevent mistakes when calling the code in another
> code path.
> 
> Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
> Co-developed-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
