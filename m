Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 569FEC001B0
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 02:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z5/JeE3zQnJ9DUhySoLRyUVCp8wgTu1iGnq4oo2CITw=; b=P8UqWJk081Z9h7NU+cAX7fktSo
	PkWvToPCLkHcKOo3kbm9kI8y605JcMEOM66gGg/G4e2z8/cfgziMw7b3f0/YWMzXp+x7AzmpanQ4R
	J+z6D1rSYrNAnH+J0IMlFFF+mWDtCTv/bOut60/q9Rg0CE1Nt96D0V/cTbn1/pAnqPh1LTWjStN91
	7z895yCwUvhS85vAHBIA8bLfgU01aTlhO3+LxMVL+oaEORHOtCj0XebrOKPp0c5PJv4NOLyXQR+aM
	upKHpNpJCLMQTFSWODCZNnISCrgGaqAN3gt3yDG530J+0JFQ1bxbLkMYp0eDGJGH0H626KSPm284k
	ZC+5b7dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJlf4-001gHd-2J;
	Thu, 13 Jul 2023 02:02:31 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJlf0-001gFc-2q;
	Thu, 13 Jul 2023 02:02:29 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046050;MF=hsiangkao@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0VnEzPEY_1689213737;
Received: from 30.97.48.217(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0VnEzPEY_1689213737)
          by smtp.aliyun-inc.com;
          Thu, 13 Jul 2023 10:02:19 +0800
Message-ID: <161f1615-3d85-cf47-d2d5-695adf1ca7d4@linux.alibaba.com>
Date: Thu, 13 Jul 2023 10:02:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v1] rcu: Fix and improve RCU read lock checks when
 !CONFIG_DEBUG_LOCK_ALLOC
To: Joel Fernandes <joel@joelfernandes.org>,
 Sandeep Dhavale <dhavale@google.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
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
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20230713003201.GA469376@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_190227_115225_A3E34671 
X-CRM114-Status: GOOD (  15.27  )
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



On 2023/7/13 08:32, Joel Fernandes wrote:
> On Wed, Jul 12, 2023 at 02:20:56PM -0700, Sandeep Dhavale wrote:
> [..]
>>> As such this patch looks correct to me, one thing I noticed is that
>>> you can check rcu_is_watching() like the lockdep-enabled code does.
>>> That will tell you also if a reader-section is possible because in
>>> extended-quiescent-states, RCU readers should be non-existent or
>>> that's a bug.
>>>
>> Please correct me if I am wrong, reading from the comment in
>> kernel/rcu/update.c rcu_read_lock_held_common()
>> ..
>>    * The reason for this is that RCU ignores CPUs that are
>>   * in such a section, considering these as in extended quiescent state,
>>   * so such a CPU is effectively never in an RCU read-side critical section
>>   * regardless of what RCU primitives it invokes.
>>
>> It seems rcu will treat this as lock not held rather than a fact that
>> lock is not held. Is my understanding correct?
> 
> If RCU treats it as a lock not held, that is a fact for RCU ;-). Maybe you
> mean it is not a fact for erofs?

I'm not sure if I get what you mean, EROFS doesn't take any RCU read lock
here:

z_erofs_decompressqueue_endio() is actually a "bio->bi_end_io", previously
which can be called under two scenarios:

  1) under softirq context, which is actually part of device I/O compleltion;

  2) under threaded context, like what dm-verity or likewise calls.

But EROFS needs to decompress in a threaded context anyway, so we trigger
a workqueue to resolve the case 1).


Recently, someone reported there could be some case 3) [I think it was
introduced recently but I have no time to dig into it]:

  case 3: under RCU read lock context, which is shown by this:
https://lore.kernel.org/r/4a8254eb-ac39-1e19-3d82-417d3a7b9f94@linux.alibaba.com/T/#u

  and such RCU read lock is taken in __blk_mq_run_dispatch_ops().

But as the commit shown, we only need to trigger a workqueue for case 1)
and 3) due to performance reasons.

Hopefully I show it more clear.

Thanks,
Gao Xiang

