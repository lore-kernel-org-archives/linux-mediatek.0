Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BEBAC001B0
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jul 2023 14:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GanWv/qhphxEifkSCj5tVDmGktuIYb8hVRR/qpQN078=; b=pV144WSnpJWOVXM7VAsk6dpk4l
	qJk2sccUIpaZKFUOguxtU3w+d+Gihm1RBwSZS7N1j3KBbotF0uhWVsP2CdgGy9q+nb8U9/77FGXGv
	hSOrN6MddzKgZUptPify9pgNOZsa8ikn3V26bsrf5WlZT8Yhsu7MXGplC6ECRoHV5f2vVJYH0toN+
	zwTMfXYOFZBpnnMu7AppwyX3bCAusjPb5Y4DQ40iDOByEUOSQgRmsq1OGyPACke2S92lQ1vGJZbXD
	0Xqaa/lN7Zx2+wlyw9mZd+7gKmwFitVhMj/Pb0NgT4CF4vjWujGq4gSH+adEjleFv7EsngCXIEkYp
	ectU5+fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKKDa-006SEe-00;
	Fri, 14 Jul 2023 14:56:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKKDW-006SDO-0n;
	Fri, 14 Jul 2023 14:56:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5D4CC61D47;
	Fri, 14 Jul 2023 14:56:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99B6CC433C7;
	Fri, 14 Jul 2023 14:56:18 +0000 (UTC)
Date: Fri, 14 Jul 2023 10:56:15 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: Joel Fernandes <joel@joelfernandes.org>, paulmck@kernel.org, Sandeep
 Dhavale <dhavale@google.com>, Frederic Weisbecker <frederic@kernel.org>,
 Neeraj Upadhyay <quic_neeraju@quicinc.com>, Josh Triplett
 <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, linux-erofs@lists.ozlabs.org,
 xiang@kernel.org, Will Shiu <Will.Shiu@mediatek.com>,
 kernel-team@android.com, rcu@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1] rcu: Fix and improve RCU read lock checks when
 !CONFIG_DEBUG_LOCK_ALLOC
Message-ID: <20230714105615.1ff9b8d2@gandalf.local.home>
In-Reply-To: <fccca41d-8a72-27cf-e589-409f54cd5811@linux.alibaba.com>
References: <20230713003201.GA469376@google.com>
	<161f1615-3d85-cf47-d2d5-695adf1ca7d4@linux.alibaba.com>
	<0d9e7b4d-6477-47a6-b3d2-2c9d9b64903d@paulmck-laptop>
	<f124e041-6a82-2069-975c-4f393e5c4137@linux.alibaba.com>
	<87292a44-cc02-4d95-940e-e4e31d0bc6f2@paulmck-laptop>
	<f1c60dcb-e32f-7b7e-bf0d-5dec999e9299@linux.alibaba.com>
	<CAEXW_YSODXRfgkR0D2G-x=0uZdsqvF3kZL+LL3DcRX-5CULJ1Q@mail.gmail.com>
	<894a3b64-a369-7bc6-c8a8-0910843cc587@linux.alibaba.com>
	<CAEXW_YSM1yik4yWTgZoxCS9RM6TbsL26VCVCH=41+uMA8chfAQ@mail.gmail.com>
	<58b661d0-0ebb-4b45-a10d-c5927fb791cd@paulmck-laptop>
	<7d433fac-a62d-4e81-b8e5-57cf5f2d1d55@paulmck-laptop>
	<058e7ee9-0380-eb1b-d9a8-b184cba6ed53@linux.alibaba.com>
	<CAEXW_YQCpUsPz24H4Mux6wOH1=RFRR-gsXLFTbJ37MgUJo3kCw@mail.gmail.com>
	<fccca41d-8a72-27cf-e589-409f54cd5811@linux.alibaba.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_075622_341915_C466A3EC 
X-CRM114-Status: GOOD (  13.00  )
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

On Fri, 14 Jul 2023 21:51:16 +0800
Gao Xiang <hsiangkao@linux.alibaba.com> wrote:

> >> we need to work on
> >> CONFIG_PREEMPT_COUNT=n (why not?), we could just always trigger a
> >> workqueue for this.
> >>  
> > 
> > So CONFIG_PREEMPT_COUNT=n users don't deserve good performance? ;-)  
> 
> I'm not sure if non-preemptible kernel users really care about
> such sensitive latencies, I don't know, my 2 cents.

CONFIG_PREEMPT_COUNT=n is for *performance* but not for *latency*. That is,
they care about the overall performance (batch processing) but not
interactive performance.

-- Steve

