Return-Path: <SRS0=r4MK=J3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC53BC433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 11:49:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40BB7613E8
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 11:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40BB7613E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=i-love.sakura.ne.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W2M0+JhKBmV2XtKEwdx+NKjmGTV0/F6ot0Nw1BWOrxw=; b=c6q11kRKGZixE0MeWCsQQtoLw
	B4W9tPekwLB+ldUNlj7RJh4a5/PZQ7+3c/wTF2D9E7ybqAGJhoY8/xiJ65e8jA7IydpItzDwahg4K
	XmrnPTv68GyEXhRrR0uFwaPFtw0cKsLyDN97sTU2DqKVjT3FSWOEVWqCrTN0v/NkoJxe4gJrvQbX6
	GoUHcDVMat573LBcasOQbonriJhldkGUjoi8kBRfM0H3PdbeepWbowGW3sHOhFPTCBOs2jLLNUhVQ
	Z2PTlHMztiPETRxHrHNuesdihWpM1Y/wOMWzro5Ndc6t9HuxdZ0iefinBTCTvQIVUmTqC37mAwVZ6
	qBysH3Ckw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcRdq-007kg0-Qi; Fri, 30 Apr 2021 11:49:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcRdo-007kfI-Pa; Fri, 30 Apr 2021 11:49:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=K17ppss6gpFt8IiSPwStuHxXIpBpLWkqmci0gjnTm2g=; b=qpx+Jnfwkz1lbZsNc1HqbLV/wq
 9Y5g9TcDWa13SCLDdRgQ4LQ3Vc640O2/vN8OF/E27qLRz4kRZ9cyvMkr8GF0dr//yJsBR3xTdivaL
 N/OPUAIFzbIU2J5HkMucf7JzMk1j/ebQqdQYQNqaffeZTAgQsqa3wONre9Onm1sbTp99/tUaaq+zx
 E0uYzMzS+N/ibX0kF1sIhxnsYWzZg0hpu2YtvWm99qnucJWLUNdOoe4jrwRKWVF7kVY1TCac2jsjt
 VG6EjzZoiLZDYXhu1evPTspuq8c7Qt9c9/LWf64T0Q+pof0DDyl8g/WlNOZV3fGZ493l/0g733dIc
 aLMwg9VQ==;
Received: from www262.sakura.ne.jp ([202.181.97.72])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcRdl-001LBw-4C; Fri, 30 Apr 2021 11:49:02 +0000
Received: from fsav303.sakura.ne.jp (fsav303.sakura.ne.jp [153.120.85.134])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 13UBm58U016239;
 Fri, 30 Apr 2021 20:48:05 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav303.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav303.sakura.ne.jp);
 Fri, 30 Apr 2021 20:48:05 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav303.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 13UBm4Lq016232
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 30 Apr 2021 20:48:05 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH] rtnetlink: add rtnl_lock debug log
To: Rocco Yue <rocco.yue@mediatek.com>
Cc: Peter Enderborg <peter.enderborg@sony.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Vitor Massaru Iha <vitor@massaru.org>, Sedat Dilek <sedat.dilek@gmail.com>,
 Wei Yang <richard.weiyang@gmail.com>,
 Cong Wang <cong.wang@bytedance.com>, Di Zhu <zhudi21@huawei.com>,
 Stephen Hemminger <stephen@networkplumber.org>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 Roopa Prabhu <roopa@cumulusnetworks.com>, Andrii Nakryiko
 <andrii@kernel.org>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wsd_upsream@mediatek.com,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, peterz@infradead.org
References: <20210429070237.3012-1-rocco.yue@mediatek.com>
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <27fa19c9-81b2-3604-033c-b7fe5d14b620@i-love.sakura.ne.jp>
Date: Fri, 30 Apr 2021 20:48:02 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210429070237.3012-1-rocco.yue@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_044901_397515_34D8BD4D 
X-CRM114-Status: GOOD (  11.23  )
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

On 2021/04/29 16:02, Rocco Yue wrote:
> +static void rtnl_print_btrace(struct timer_list *unused)
> +{
> +	pr_info("----------- %s start -----------\n", __func__);
> +	pr_info("%s[%d][%c] hold rtnl_lock more than 2 sec, start time: %llu\n",
> +		rtnl_instance.task->comm,
> +		rtnl_instance.pid,
> +		task_state_to_char(rtnl_instance.task),
> +		rtnl_instance.start_time);
> +	stack_trace_print(rtnl_instance.addrs, rtnl_instance.nr_entries, 0);

Do we want to print same traces every 2 seconds? 

Since it is possible to stall for e.g. 30 seconds, printing either only upon
first call to rtnl_print_btrace() for each stalling duration or only upon
end of stalling duration (i.e. from rtnl_relase_btrace()) is better?

> +	show_stack(rtnl_instance.task, NULL, KERN_DEBUG);

Why KERN_DEBUG ?

If you retrieve the output via dmesg, KERN_DEBUG would be fine.
But for syzkaller (which counts on printk() messages being printed to
consoles), KERN_INFO (or default) is expected.

> +	pr_info("------------ %s end -----------\n", __func__);
> +}
> +
> +static void rtnl_relase_btrace(void)
> +{
> +	rtnl_instance.end_time = sched_clock();
> +

You should del_timer_sync() here than

> +	if (rtnl_instance.end_time - rtnl_instance.start_time > 2000000000ULL) {
> +		pr_info("rtnl_lock is held by [%d] from [%llu] to [%llu]\n",
> +			rtnl_instance.pid,
> +			rtnl_instance.start_time,
> +			rtnl_instance.end_time);
> +	}
> +
> +	del_timer(&rtnl_chk_timer);

here in order to make sure that end message is printed only after
rtnl_print_btrace() messages are printed.

> +}
> +#endif
> +


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
