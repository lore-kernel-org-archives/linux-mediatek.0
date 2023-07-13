Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD6AC001B0
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 19:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eQ5u6MMUPF+MU3TJiFFXwEJWNv37diyQvtdLXOOnmdQ=; b=IdkI7rZhKVhhdo+U0ZgcCvAtH3
	NRLDME0Y+by4GRaYjBArHzhRxtHyphQa6tDykPpRCv6tmGVGF+Ha/pPeOGLpdlf/yS1+cRYLCczD6
	NJk4pCSz1mqNJtDIO9dEq9MTx/0FJnsCcf5JFgi84UllvLg36+MWXkGw7WbHAQq3RxugfabBJJx7L
	f1gKMse39MGeGe4PyVXL6QcQES+7+RTMhyFUR3GQySzTny/m8pAtSzGHc4Om4a4Jr8g+S5Dd/s9UN
	n2Zs0WXYyuiEoqwFCqZht1Y7UA8TiCJ7l8gVYbmkXkqzl5UHcSqoreaP3WUPf75q6JPXN3QPMm0Bl
	8eOppe+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qK1YM-004CAr-1N;
	Thu, 13 Jul 2023 19:00:38 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qK1YH-004C86-2g;
	Thu, 13 Jul 2023 19:00:37 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R291e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046051;MF=hsiangkao@linux.alibaba.com;NM=1;PH=DS;RN=22;SR=0;TI=SMTPD_---0VnIsiAx_1689274825;
Received: from 192.168.3.2(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0VnIsiAx_1689274825)
          by smtp.aliyun-inc.com;
          Fri, 14 Jul 2023 03:00:27 +0800
Message-ID: <57b07fc3-6049-6ace-2523-2d013273c456@linux.alibaba.com>
Date: Fri, 14 Jul 2023 03:00:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v1] rcu: Fix and improve RCU read lock checks when
 !CONFIG_DEBUG_LOCK_ALLOC
To: paulmck@kernel.org, Alan Huang <mmpgouride@gmail.com>
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
References: <20230713003201.GA469376@google.com>
 <161f1615-3d85-cf47-d2d5-695adf1ca7d4@linux.alibaba.com>
 <0d9e7b4d-6477-47a6-b3d2-2c9d9b64903d@paulmck-laptop>
 <f124e041-6a82-2069-975c-4f393e5c4137@linux.alibaba.com>
 <87292a44-cc02-4d95-940e-e4e31d0bc6f2@paulmck-laptop>
 <f1c60dcb-e32f-7b7e-bf0d-5dec999e9299@linux.alibaba.com>
 <CAEXW_YSODXRfgkR0D2G-x=0uZdsqvF3kZL+LL3DcRX-5CULJ1Q@mail.gmail.com>
 <894a3b64-a369-7bc6-c8a8-0910843cc587@linux.alibaba.com>
 <CAEXW_YSM1yik4yWTgZoxCS9RM6TbsL26VCVCH=41+uMA8chfAQ@mail.gmail.com>
 <F7D5032D-908E-4227-8A38-AF740AC86CDC@gmail.com>
 <c62bd3db-5ed3-4dbf-bba9-d9dace23312c@paulmck-laptop>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <c62bd3db-5ed3-4dbf-bba9-d9dace23312c@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_120034_043547_AEC74DF0 
X-CRM114-Status: GOOD (  25.61  )
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



On 2023/7/14 02:14, Paul E. McKenney wrote:
> On Fri, Jul 14, 2023 at 12:09:27AM +0800, Alan Huang wrote:

...

>>>
>>>  From what Sandeep described, the code path is in an RCU reader. My
>>> question is more, why doesn't it use SRCU instead since it clearly
>>> does so if BLK_MQ_F_BLOCKING. What are the tradeoffs? IMHO, a deeper
>>> dive needs to be made into that before concluding that the fix is to
>>> use rcu_read_lock_any_held().
>>
>> Copied from [1]:
>>
>> "Background: Historically erofs would always schedule a kworker for
>>   decompression which would incur the scheduling cost regardless of
>>   the context. But z_erofs_decompressqueue_endio() may not always
>>   be in atomic context and we could actually benefit from doing the
>>   decompression in z_erofs_decompressqueue_endio() if we are in
>>   thread context, for example when running with dm-verity.
>>   This optimization was later added in patch [2] which has shown
>>   improvement in performance benchmarks.”
>>
>> I’m not sure if it is a design issue.

What do you mean a design issue, honestly?  I feel uneasy to hear this.

> 
> I have no official opinion myself, but there are quite a few people
> who firmly believe that any situation like this one (where driver or
> file-system code needs to query the current context to see if blocking
> is OK) constitutes a design flaw.  Such people might argue that this
> code path should have a clearly documented context, and that if that
> documentation states that the code might be in atomic context, then the
> driver/fs should assume atomic context.  Alternatively, if driver/fs


I don't think a software decoder (for example, decompression) should be
left in the atomic context honestly.

Regardless of the decompression speed of some algorithm theirselves
(considering very slow decompression on very slow devices), it means
that we also don't have a way to vmap or likewise (considering
decompression + handle extra deduplication copies) in the atomic
context, even memory allocation has to be in an atomic way.


Especially now have more cases that decodes in the RCU reader context
apart from softirq contexts?


> needs the context to be non-atomic, the callers should make it so.
> 
> See for example in_atomic() and its comment header:
> 
> /*
>   * Are we running in atomic context?  WARNING: this macro cannot
>   * always detect atomic context; in particular, it cannot know about
>   * held spinlocks in non-preemptible kernels.  Thus it should not be
>   * used in the general case to determine whether sleeping is possible.
>   * Do not use in_atomic() in driver code.
>   */
> #define in_atomic()	(preempt_count() != 0)
> 
> In the immortal words of Dan Frye, this should be good clean fun!  ;-)

Honestly, I think such helper (to show whether it's in the atomic context)
is useful to driver users, even it could cause some false positive in some
configuration but it's acceptable.


Anyway, I could "Always use a workqueue.", but again, the original commit
was raised by a real vendor (OPPO), and I think if dropping this, all
downstream users which use dm-verity will be impacted and individual end
users will not be happy as well.

Thanks,
Gao Xiang

