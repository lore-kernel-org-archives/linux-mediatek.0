Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00145C001B0
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jul 2023 03:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zwd59nP/ASw/HFlV4EhBtFBCnyrWO7K1fZtY0DydADo=; b=ghMJVSqiNf16MX3ZDGAbEEGt6r
	S0mS+IhJvuZSgQScIsThRV3z6tB2BDBMzAGziv5Re/6xBag+xU1LgNtt/GS0XS5bjqPP2o6ipqG87
	58BNc86n5BhvS31G1p54x4jkMbVaXwMo8zXclD4axI1Rp7c6mIlMCS/CrirOEA9A8M0L3LHQDdOXG
	jAztLDzom+/e+bgRRbemOKgD4JvS4hY3CY3HpO7V0e4EzXZtMuHjFds/GQQkRYI77UYBhJSE9gsx4
	NZFE+e+9P1e1oXRcAEPiDRKeykTddfDYkURrXET3PeMycSsJ9U2z3VhKzSOwyiKZ7KDX+q6yjR0Ua
	psxXgFyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qK9It-004sp2-1Y;
	Fri, 14 Jul 2023 03:17:11 +0000
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qK9Ip-004snK-03;
	Fri, 14 Jul 2023 03:17:09 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R391e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046051;MF=hsiangkao@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0VnK7oAI_1689304613;
Received: from 172.20.10.3(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0VnK7oAI_1689304613)
          by smtp.aliyun-inc.com;
          Fri, 14 Jul 2023 11:16:56 +0800
Message-ID: <058e7ee9-0380-eb1b-d9a8-b184cba6ed53@linux.alibaba.com>
Date: Fri, 14 Jul 2023 11:16:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v1] rcu: Fix and improve RCU read lock checks when
 !CONFIG_DEBUG_LOCK_ALLOC
To: paulmck@kernel.org, Sandeep Dhavale <dhavale@google.com>
Cc: Frederic Weisbecker <frederic@kernel.org>,
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
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Joel Fernandes <joel@joelfernandes.org>
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
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <7d433fac-a62d-4e81-b8e5-57cf5f2d1d55@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_201707_256854_14FDD92E 
X-CRM114-Status: GOOD (  17.05  )
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



On 2023/7/14 10:16, Paul E. McKenney wrote:
> On Thu, Jul 13, 2023 at 09:33:35AM -0700, Paul E. McKenney wrote:
>> On Thu, Jul 13, 2023 at 11:33:24AM -0400, Joel Fernandes wrote:

...

>>>
>>> >From what Sandeep described, the code path is in an RCU reader. My
>>> question is more, why doesn't it use SRCU instead since it clearly
>>> does so if BLK_MQ_F_BLOCKING. What are the tradeoffs? IMHO, a deeper
>>> dive needs to be made into that before concluding that the fix is to
>>> use rcu_read_lock_any_held().
>>
>> How can this be solved?
>>
>> 1.	Always use a workqueue.  Simple, but is said to have performance
>> 	issues.
>>
>> 2.	Pass a flag in that indicates whether or not the caller is in an
>> 	RCU read-side critical section.  Conceptually simple, but might
>> 	or might not be reasonable to actually implement in the code as
>> 	it exists now.	(You tell me!)
>>
>> 3.	Create a function in z_erofs that gives you a decent
>> 	approximation, maybe something like the following.
>>
>> 4.	Other ideas here.
> 
> 5.	#3 plus make the corresponding Kconfig option select
> 	PREEMPT_COUNT, assuming that any users needing compression in
> 	non-preemptible kernels are OK with PREEMPT_COUNT being set.
> 	(Some users of non-preemptible kernels object strenuously
> 	to the added overhead from CONFIG_PREEMPT_COUNT=y.)

I'm not sure if it's a good idea, we need to work on
CONFIG_PREEMPT_COUNT=n (why not?), we could just always trigger a
workqueue for this.

Anyway, before we proceed, I also think it'd be better to get some
performance numbers first for this (e.g. with dm-verity) and record
the numbers in the commit message to justify this.  Otherwise, I guess
the same question will be raised again and again.

Thanks,
Gao Xiang

