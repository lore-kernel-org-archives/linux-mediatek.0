Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0EBEB64DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jul 2023 15:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fpz2cT1U0dIEg2tdq492uCXBZjuIPKBmJ/ufwC84Axw=; b=dHPrDRtpFsZp3ujufbCWLWFVRR
	5ZAF7SgtGlpMistC8i7Pi4YUCMlyKEzWOkNEvKYSXbBt2Bxff2ylqqpi73oF6ef2GCT9D1H5npAHD
	4J/1ea72Qf5prxdqHjoQZDce1Dz+88MkXtixJx5bfZ9zjj2TVeYYbp+rB474F3gcVs90+xx8rwqBN
	H35KX5KK9ug+1DpfbX3GLfwD7M4ujVu4VWYjBoTq8ns1tt5+o8JpAtJ1/K21suaIA+pbAgbh8m7to
	6jJIP4YmkOHkBMycCSBfFXwSU1PQclkdxY8koTDspSHXU9t529hd4aCfmSj9iFiIIf2ApEerVtLAk
	mZFD7WIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKKq8-006XTQ-2L;
	Fri, 14 Jul 2023 15:36:16 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKKq4-006XRq-0H;
	Fri, 14 Jul 2023 15:36:13 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-666e97fcc60so1371041b3a.3;
        Fri, 14 Jul 2023 08:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689348970; x=1691940970;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fpz2cT1U0dIEg2tdq492uCXBZjuIPKBmJ/ufwC84Axw=;
        b=D/MfzZQPzXbyphdVAKY+n1yWRwuQBRtRNDXrr/lrTlscIlsD3cpJGt0YHN/DTsDwop
         aHXpVEcS5UOsrDjKvepVBobvquuwQJHfNPs0W6FkPS3cS/NXfuBNF/tGxE2RBZEpkWrG
         RfcZVCJuOY0kpS/HrHB62kFzA7JYOWcGEqUwS7HUEDPA4DWUs1pPeoD7Hjguapt0OCZs
         psIQWo9LHX3hw1fcbvsRwyuIrHPfmTrRp0fA/3vgJ+0FBUhlexlVRsOrWfA7+NrHOT5g
         Wvh07epPduxmWURcEqg7KsQp/Pk7d01yPbIvpEY6soFffGaKrg9kgJySGYrcP5LQaMKm
         ZglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689348970; x=1691940970;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fpz2cT1U0dIEg2tdq492uCXBZjuIPKBmJ/ufwC84Axw=;
        b=en3F4pJ7aDBOPpkzNR4J8y0g3MzfINNJq7GcXtRIdRRH3me+EeIHe35OpjabKvhwJG
         /lBiAxE2dU7YUuzsRi8/+JL5RVq7Y8lScUnVYVoh+ka1UT4bjNyBHjLRjnchy1anpdaU
         o31ifm4cJCbdn6RdE+JEFR5o6vAqbLhM8p0IqS2e+G9R/qmsa/+scgHc/7ChbRXBZO6D
         4YxcFNI9KsfNNBjGfRDuZRL0czVw88sFGLm4cHjFzz07MpmYq16oIBUwp4ITySzaR087
         M5S0JvCIah0IZQ9XSf7Ac+VpLjuLD/Wv55VRNe38zgzfVjK/AVhD36r7nxddLspVJT48
         lopQ==
X-Gm-Message-State: ABy/qLbA9GEp906tqDL0g4WQHa1teAPbREV0HcpF5beU5fJ/nFecz/Ny
	5DaELhgsKLIYGaSmFXSd97I=
X-Google-Smtp-Source: APBJJlHBJdkxDW050IMIR4XLuEleCEyFXsRGr4qAiwb/yUkzTuJWrCEAfmfUXn76DOtOmGxcYD5KSw==
X-Received: by 2002:a05:6a20:144b:b0:12d:e596:df21 with SMTP id a11-20020a056a20144b00b0012de596df21mr4329858pzi.7.1689348970485;
        Fri, 14 Jul 2023 08:36:10 -0700 (PDT)
Received: from smtpclient.apple ([2402:d0c0:2:a2a::1])
        by smtp.gmail.com with ESMTPSA id e26-20020a62aa1a000000b006749c22d079sm7248937pff.167.2023.07.14.08.35.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jul 2023 08:36:10 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH v1] rcu: Fix and improve RCU read lock checks when
 !CONFIG_DEBUG_LOCK_ALLOC
From: Alan Huang <mmpgouride@gmail.com>
In-Reply-To: <7d433fac-a62d-4e81-b8e5-57cf5f2d1d55@paulmck-laptop>
Date: Fri, 14 Jul 2023 23:35:41 +0800
Cc: Joel Fernandes <joel@joelfernandes.org>,
 Gao Xiang <hsiangkao@linux.alibaba.com>,
 Sandeep Dhavale <dhavale@google.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Neeraj Upadhyay <quic_neeraju@quicinc.com>,
 Josh Triplett <josh@joshtriplett.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Zqiang <qiang.zhang1211@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-erofs@lists.ozlabs.org,
 xiang@kernel.org,
 Will Shiu <Will.Shiu@mediatek.com>,
 kernel-team@android.com,
 rcu@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <F160D7F8-57DC-4986-90A9-EB50F7C89891@gmail.com>
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
To: paulmck@kernel.org
X-Mailer: Apple Mail (2.3731.400.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_083612_126208_8D1362E0 
X-CRM114-Status: GOOD (  26.13  )
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


> 2023=E5=B9=B47=E6=9C=8814=E6=97=A5 10:16=EF=BC=8CPaul E. McKenney =
<paulmck@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Thu, Jul 13, 2023 at 09:33:35AM -0700, Paul E. McKenney wrote:
>> On Thu, Jul 13, 2023 at 11:33:24AM -0400, Joel Fernandes wrote:
>>> On Thu, Jul 13, 2023 at 10:34=E2=80=AFAM Gao Xiang =
<hsiangkao@linux.alibaba.com> wrote:
>>>> On 2023/7/13 22:07, Joel Fernandes wrote:
>>>>> On Thu, Jul 13, 2023 at 12:59=E2=80=AFAM Gao Xiang =
<hsiangkao@linux.alibaba.com> wrote:
>>>>>> On 2023/7/13 12:52, Paul E. McKenney wrote:
>>>>>>> On Thu, Jul 13, 2023 at 12:41:09PM +0800, Gao Xiang wrote:
>>>>>>=20
>>>>>> ...
>>>>>>=20
>>>>>>>>=20
>>>>>>>> There are lots of performance issues here and even a plumber
>>>>>>>> topic last year to show that, see:
>>>>>>>>=20
>>>>>>>> [1] =
https://lore.kernel.org/r/20230519001709.2563-1-tj@kernel.org
>>>>>>>> [2] =
https://lore.kernel.org/r/CAHk-=3DwgE9kORADrDJ4nEsHHLirqPCZ1tGaEPAZejHdZ03=
qCOGg@mail.gmail.com
>>>>>>>> [3] =
https://lore.kernel.org/r/CAB=3DBE-SBtO6vcoyLNA9F-9VaN5R0t3o_Zn+FW8GbO6wyU=
qFneQ@mail.gmail.com
>>>>>>>> [4] https://lpc.events/event/16/contributions/1338/
>>>>>>>> and more.
>>>>>>>>=20
>>>>>>>> I'm not sure if it's necessary to look info all of that,
>>>>>>>> andSandeep knows more than I am (the scheduling issue
>>>>>>>> becomes vital on some aarch64 platform.)
>>>>>>>=20
>>>>>>> Hmmm...  Please let me try again.
>>>>>>>=20
>>>>>>> Assuming that this approach turns out to make sense, the =
resulting
>>>>>>> patch will need to clearly state the performance benefits =
directly in
>>>>>>> the commit log.
>>>>>>>=20
>>>>>>> And of course, for the approach to make sense, it must avoid =
breaking
>>>>>>> the existing lockdep-RCU debugging code.
>>>>>>>=20
>>>>>>> Is that more clear?
>>>>>>=20
>>>>>> Personally I'm not working on Android platform any more so I =
don't
>>>>>> have a way to reproduce, hopefully Sandeep could give actually
>>>>>> number _again_ if dm-verity is enabled and trigger another
>>>>>> workqueue here and make a comparsion why the scheduling latency =
of
>>>>>> the extra work becomes unacceptable.
>>>>>>=20
>>>>>=20
>>>>> Question from my side, are we talking about only performance =
issues or
>>>>> also a crash? It appears z_erofs_decompress_pcluster() takes
>>>>> mutex_lock(&pcl->lock);
>>>>>=20
>>>>> So if it is either in an RCU read-side critical section or in an
>>>>> atomic section, like the softirq path, then it may
>>>>> schedule-while-atomic or trigger RCU warnings.
>>>>>=20
>>>>> z_erofs_decompressqueue_endio
>>>>> -> z_erofs_decompress_kickoff
>>>>>  ->z_erofs_decompressqueue_work
>>>>>   ->z_erofs_decompress_queue
>>>>>    -> z_erofs_decompress_pcluster
>>>>>     -> mutex_lock
>>>>>=20
>>>>=20
>>>> Why does the softirq path not trigger a workqueue instead?
>>>=20
>>> I said "if it is". I was giving a scenario. mutex_lock() is not
>>> allowed in softirq context or in an RCU-reader.
>>>=20
>>>>> Per Sandeep in [1], this stack happens under RCU read-lock in:
>>>>>=20
>>>>> #define __blk_mq_run_dispatch_ops(q, check_sleep, dispatch_ops) \
>>>>> [...]
>>>>>                 rcu_read_lock();
>>>>>                 (dispatch_ops);
>>>>>                 rcu_read_unlock();
>>>>> [...]
>>>>>=20
>>>>> Coming from:
>>>>> blk_mq_flush_plug_list ->
>>>>>                            blk_mq_run_dispatch_ops(q,
>>>>>                                 __blk_mq_flush_plug_list(q, =
plug));
>>>>>=20
>>>>> and __blk_mq_flush_plug_list does this:
>>>>>           q->mq_ops->queue_rqs(&plug->mq_list);
>>>>>=20
>>>>> This somehow ends up calling the bio_endio and the
>>>>> z_erofs_decompressqueue_endio which grabs the mutex.
>>>>>=20
>>>>> So... I have a question, it looks like one of the paths in
>>>>> __blk_mq_run_dispatch_ops() uses SRCU.  Where are as the alternate
>>>>> path uses RCU. Why does this alternate want to block even if it is =
not
>>>>> supposed to? Is the real issue here that the BLK_MQ_F_BLOCKING =
should
>>>>> be set? It sounds like you want to block in the "else" path even
>>>>> though BLK_MQ_F_BLOCKING is not set:
>>>>=20
>>>> BLK_MQ_F_BLOCKING is not a flag that a filesystem can do anything =
with.
>>>> That is block layer and mq device driver stuffs. filesystems cannot =
set
>>>> this value.
>>>>=20
>>>> As I said, as far as I understand, previously,
>>>> .end_io() can only be called without RCU context, so it will be =
fine,
>>>> but I don't know when .end_io() can be called under some RCU =
context
>>>> now.
>>>=20
>>>> =46rom what Sandeep described, the code path is in an RCU reader. =
My
>>> question is more, why doesn't it use SRCU instead since it clearly
>>> does so if BLK_MQ_F_BLOCKING. What are the tradeoffs? IMHO, a deeper
>>> dive needs to be made into that before concluding that the fix is to
>>> use rcu_read_lock_any_held().
>>=20
>> How can this be solved?
>>=20
>> 1. Always use a workqueue.  Simple, but is said to have performance
>> issues.
>>=20
>> 2. Pass a flag in that indicates whether or not the caller is in an
>> RCU read-side critical section.  Conceptually simple, but might
>> or might not be reasonable to actually implement in the code as
>> it exists now. (You tell me!)
>>=20
>> 3. Create a function in z_erofs that gives you a decent
>> approximation, maybe something like the following.
>>=20
>> 4. Other ideas here.
>=20
> 5. #3 plus make the corresponding Kconfig option select
> PREEMPT_COUNT, assuming that any users needing compression in
> non-preemptible kernels are OK with PREEMPT_COUNT being set.
> (Some users of non-preemptible kernels object strenuously
> to the added overhead from CONFIG_PREEMPT_COUNT=3Dy.)

6. Set one bit in bio->bi_private, check the bit and flip it in =
rcu_read_lock() path,
then in z_erofs_decompressqueue_endio, check if the bit has changed.

Not sure if this is feasible or acceptable. :)

>=20
> Thanx, Paul
>=20
>> The following is untested, and is probably quite buggy, but it should
>> provide you with a starting point.
>>=20
>> static bool z_erofs_wq_needed(void)
>> {
>> if (IS_ENABLED(CONFIG_PREEMPTION) && rcu_preempt_depth())
>> return true;  // RCU reader
>> if (IS_ENABLED(CONFIG_PREEMPT_COUNT) && !preemptible())
>> return true;  // non-preemptible
>> if (!IS_ENABLED(CONFIG_PREEMPT_COUNT))
>> return true;  // non-preeemptible kernel, so play it safe
>> return false;
>> }
>>=20
>> You break it, you buy it!  ;-)
>>=20
>> Thanx, Paul



