Return-Path: <SRS0=qtn6=LB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59996C47094
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 18:24:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 075FC60FE4
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 18:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 075FC60FE4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ufX2d7OWVgpYviYwUAOSr2IipVlvMzEYXEkO70y60S8=; b=odlfMiyhJgoCEH
	v6hT6mC1CxTPvn+vc2H/RMvdZKYZqpiZGgMjemT4Le42wm18aUDjpsdbA7e49mgxyX2ujXMgH7uXG
	FP8epwM+erJBj9OrfQwGy+Q58r9LvnP9QtYYtlAVtNENcouuFUQl6j7fO+NAA7vsT8tPOf0ZZOvNk
	IPFcV8NOcBqXbSSnoVHmeqXtfuS/jOntLdR5nKVITVXdI/QtGneukOa/iwKMVMI4Lsq4XiKkNlT8j
	+Rz/8FWSh/1rF2Kgil4qqdwKSu8Mt3u7826hCuwlwoE7Ze4gxqEzrzPcNAnCgCzx7ftxeM92Eg0SI
	TAjDC1ynj9r1eY+QBDjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqJv4-0050oK-Gw; Mon, 07 Jun 2021 18:24:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqJv2-0050nI-B7; Mon, 07 Jun 2021 18:24:13 +0000
X-UUID: 27f64fbeeb2b42eaad8e33083d83a47e-20210607
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=PN7JBWtgxmf7/uIMG1dcP+OTj65LMSIEioGytzk3zGo=; 
 b=tlC/AxD0yliqE5j7XfLUERVz6CIlAW5dDtitXHNzdfFnF0R/Fui7kDAmyxAqNJOCVTdWrwuACPKdKGKnrra5Ygo3nuMYy3rxqw9akTwgysHEyI3/qIOsTmEd3lMC6eNzghibkTQhQgBWocFikeDM6KvhRFC/iYbcKmLMmXbav2c=;
X-UUID: 27f64fbeeb2b42eaad8e33083d83a47e-20210607
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1252575933; Mon, 07 Jun 2021 11:24:07 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Jun 2021 11:14:05 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 02:14:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 8 Jun 2021 02:14:03 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <rostedt@goodmis.org>
CC: <catalin.marinas@arm.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <mark-pk.tsai@mediatek.com>, <matthias.bgg@gmail.com>, <mingo@redhat.com>,
 <will@kernel.org>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH] arm64: ftrace: don't dereference a probably invalid
 address
Date: Tue, 8 Jun 2021 02:14:03 +0800
Message-ID: <20210607181403.4017-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210607105217.772214e5@oasis.local.home>
References: <20210607105217.772214e5@oasis.local.home>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_112412_411108_81E14DCA 
X-CRM114-Status: GOOD (  18.16  )
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

> On Mon, 7 Jun 2021 22:15:22 +0800
> Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> 
> > And the crash is becuase kernel trying to read *rec->ip in print_ip_ins() if
> > ftrace_bug() get error code -EINVAL.
> 
> Right, so the actual fix should be something like this:
> 
> [ not tested, nor even compiled ]
> 
> -- Steve
> 

I just test this patch, and turns out it work well.
All my modification is only rename copy_from_kernel_nofault
into probe_kernel_read because the older kernel version
I use.
Then the kernel will show the error mesage instead of panic as following.

[    0.000000] ftrace failed to modify
[    0.000000] [<0000000000000020>] 0x20
[    0.000000] actual:   [FAULT](0000000000000020)

Should I resend this patch as v2?
Or you will upstream this fix?

> 
> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index 2e8a3fde7104..72ef4dccbcc4 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c
> @@ -1967,12 +1967,18 @@ static int ftrace_hash_ipmodify_update(struct ftrace_ops *ops,
>  
>  static void print_ip_ins(const char *fmt, const unsigned char *p)
>  {
> +	char ins[MCOUNT_INSN_SIZE];
>  	int i;
>  
> +	if (copy_from_kernel_nofault(ins, p, MCOUNT_INSN_SIZE)) {
> +		printk(KERN_CONT "%s[FAULT](%px)", fmt, p);
> +		return;
> +	}
> +
>  	printk(KERN_CONT "%s", fmt);
>  
>  	for (i = 0; i < MCOUNT_INSN_SIZE; i++)
> -		printk(KERN_CONT "%s%02x", i ? ":" : "", p[i]);
> +		printk(KERN_CONT "%s%02x", i ? ":" : "", ins[i]);
>  }
>  
>  enum ftrace_bug_type ftrace_bug_type;
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
