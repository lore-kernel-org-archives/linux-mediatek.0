Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23011C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 22:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mwc2QljBmtH+raWuJt9DhqdEW9aXS5WfsPokVQwnUY0=; b=UPzDgGFmRPAzBG
	DuF5C4/0f6VJRv8kvrRxwqn8Noxihs3vmX0T/SMQzS9eVzvlxt7RfEW9TQ0zinQmVIhRg56BdAedm
	dZRG6zQ7Y6csPDKgiQe1xn8rux4dgjZ+xxUeuCwMdZEcrwGATTRdUG5MUrgwudmO2qYfgVhcacWnU
	ca3SdaAMyDt7RhvC0wZIoAR9MYrYhj52zYRey3z2QXJ03TDmzj/tB+Z0K2/83XbmfzDArbQY72vgD
	qX4M14i+kXRxMgVNXuBy9q3ujXVuvd7YtdPCR0mVLCwF75qeV7yCfSp0YRO0TRDOhg7nr+zFrXDmk
	amAWtd/Kju8bHGfk+fCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ni1Ri-002fDE-1J; Fri, 22 Apr 2022 22:08:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ni1RC-002eyl-2F; Fri, 22 Apr 2022 22:07:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9440862073;
 Fri, 22 Apr 2022 22:07:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D2E3C385AB;
 Fri, 22 Apr 2022 22:07:36 +0000 (UTC)
Date: Fri, 22 Apr 2022 18:07:34 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: <mingo@redhat.com>, <matthias.bgg@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH v3 2/2] tracing: make tracer_init_tracefs initcall
 asynchronous
Message-ID: <20220422180734.225718b7@gandalf.local.home>
In-Reply-To: <20220323152257.7871-3-mark-pk.tsai@mediatek.com>
References: <20220323152257.7871-1-mark-pk.tsai@mediatek.com>
 <20220323152257.7871-3-mark-pk.tsai@mediatek.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_150738_202325_76694E57 
X-CRM114-Status: GOOD (  12.66  )
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

On Wed, 23 Mar 2022 23:22:57 +0800
Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:

> +static __init int tracer_init_tracefs(void)
> +{
> +	int ret;
> +
> +	trace_access_lock_init();
> +
> +	ret = tracing_init_dentry();
> +	if (ret)
> +		return 0;
> +
> +	INIT_WORK(&tracerfs_init_work, tracer_init_tracefs_work_func);
> +	if (!eval_map_wq)
> +		tracer_init_tracefs_work_func(&tracerfs_init_work);

Why go through the bother of doing the INIT_WORK if eval_map_wq is not
created? Just do:

	if (eval_map_wq) {
		INIT_WORK(&tracerfs_init_work, tracer_init_tracefs_work_func);
		queue_work(eval_map_wq, &tracerfs_init_work);
	} else {
		tracer_init_tracefs_work_func(NULL);
	}

But that's just a nit anyway.

-- Steve



> +	else
> +		queue_work(eval_map_wq, &tracerfs_init_work);
>  
>  	return 0;
>  }

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
