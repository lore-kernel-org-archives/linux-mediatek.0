Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEF8EB64DD
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 04:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JqjdgN8AlrhxKdv2uSYNl79GCpOVaj+oxIMXCnZByBI=; b=28EqCN9slyaq4ccc9i0cJTIk2n
	gxa1UDqzqC2GxQKdRjB+uvd8i3YEOgGXG/RNSOLnEPMRXvovsSA9U7yMV5S+53+ENMUiksKU33s70
	hTAx9uNiVH5ZKN2kpaxrG54R2Tleq3Aqk69BoXKczUbTLRb64LZASHSjyL552W2sTsJ4imnC6X4bN
	M/CtnojS8MA60KFuYpZ+8RMvFunVTqzqzt8nZ6ypHY24gSyiBphD4X1sVxLolEOUnBk8M7MWnDZWK
	Txu6NDMmR6faZbgAlCWFBAIR/3N0OEAn1fSChLia/sl/ERiMwaS8E0y2GkMBuFpQ4Uro3WNMdFjXo
	mFR3YFKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJoIt-001xjW-22;
	Thu, 13 Jul 2023 04:51:47 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJoIq-001xgP-0W;
	Thu, 13 Jul 2023 04:51:45 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046051;MF=hsiangkao@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0VnFjj4L_1689223895;
Received: from 30.97.48.217(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0VnFjj4L_1689223895)
          by smtp.aliyun-inc.com;
          Thu, 13 Jul 2023 12:51:36 +0800
Message-ID: <a7078657-823f-6283-bfeb-b5dc2c4c8d09@linux.alibaba.com>
Date: Thu, 13 Jul 2023 12:51:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v1] rcu: Fix and improve RCU read lock checks when
 !CONFIG_DEBUG_LOCK_ALLOC
To: paulmck@kernel.org
Cc: Joel Fernandes <joel@joelfernandes.org>,
 Sandeep Dhavale <dhavale@google.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Neeraj Upadhyay <quic_neeraju@quicinc.com>,
 Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-erofs@lists.ozlabs.org, xiang@kernel.org,
 Will Shiu <Will.Shiu@mediatek.com>, kernel-team@android.com,
 rcu@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230711233816.2187577-1-dhavale@google.com>
 <CAEXW_YQvpiFEaaNoS=Msgi17mU3kZD+q8bNBaHYasMArG9aPig@mail.gmail.com>
 <CAB=BE-Rm0ycTZXj=wHW_FBCCKbswG+dh3L+o1+CUW=Pg_oWnyw@mail.gmail.com>
 <20230713003201.GA469376@google.com>
 <161f1615-3d85-cf47-d2d5-695adf1ca7d4@linux.alibaba.com>
 <0d9e7b4d-6477-47a6-b3d2-2c9d9b64903d@paulmck-laptop>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <0d9e7b4d-6477-47a6-b3d2-2c9d9b64903d@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_215144_433000_0567980A 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
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



On 2023/7/13 12:27, Paul E. McKenney wrote:
> On Thu, Jul 13, 2023 at 10:02:17AM +0800, Gao Xiang wrote:
>>
>>

... sorry forget some.

> 
> One additional question...  What is your plan for kernels built with
> CONFIG_PREEMPT_COUNT=n?  After all, in such kernels, there is no way
> that I know of for code to determine whether it is in an RCU read-side
> critical section, holding a spinlock, or running with preemption disabled.

I'm not sure if Android (or all targetted) users use or care about
this configuration (CONFIG_PREEMPT_COUNT=n), personally I think
for such configuration we could just fall back to the workqueue
approach all the time.

Anyway, such optimization really comes from real workloads /
experience, users don't live well without such mitigation.

Thanks,
Gao Xiang

> 
> 						Thanx, Paul

