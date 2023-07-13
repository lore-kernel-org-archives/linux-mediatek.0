Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F728C001B0
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 17:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZyYOdDl3xwqmWSMjOherr+Wl4DKR7ur8sLJjiZ8B/A8=; b=STMbkIHCeBmI9vDPqx3SxyW0z5
	/NqmvjONsgcyrZ+w4qyExcyuZfs1Jf1gLzgWB5ImBR/T+V26JoutImLOvcORFpreUelFD1BLF0wBX
	ttRE5/kCKYZ2+FsfFEiYrOU3w7ruuffSTiUTeGDUJ3Edh/j+iqnv/8LA9WDF6aPzPcuXMozNa80j3
	nOzAzrNDN2Oi/1KXzGTK9dWa7MmgJeyjSN6Y61/fFlDKVnlHprMFE1+IgAqbKgzfL/cOZ/ispC3Lx
	4a1ao6W7+fF8Eu6wybmZ734yizj1THC+1vHRknzedUml5aU8op1l8wLKGeU69JVNaA/3TAZsjFa9r
	fV1qHkzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJzlU-0040oV-21;
	Thu, 13 Jul 2023 17:06:04 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJzlR-0040nM-2i
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jul 2023 17:06:03 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3142a9ff6d8so955921f8f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Jul 2023 10:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689267958; x=1691859958;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZyYOdDl3xwqmWSMjOherr+Wl4DKR7ur8sLJjiZ8B/A8=;
        b=ISi2RxOz/XjuM66n48IOkikI7XXE3OyE7hhKTNn3HNphrdUsa/GUYf7O0uVCwt2y09
         cScuT25FQi38FZxchBN8b+rO7TgnmRjMctjxhIaN16lH+0IQDPrQJYuElO9MaBlRyI/C
         LM1uyL4ArgrKIXBlMbWqwKSOs1NbxSR2jZPB6EsD+0FTfPYMqIhd9mUY+edk0P1w2mCV
         Tmk1k8M0leGUgjnLgmtseCHLOeKuQIzj5scCqI+wYZNHKisNmRefRs1yR+5HqppiSv55
         xIoPd8d3lYDqkd2X/HwHnhbtzDVXZu6T+YX/J8EXugnOAcBLI6b2ApHR96P+NDIJivLy
         sUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689267958; x=1691859958;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZyYOdDl3xwqmWSMjOherr+Wl4DKR7ur8sLJjiZ8B/A8=;
        b=VNdipjOsm4YB9cB3QI8szdbads5uTQWx4N/Q2a9sFcQmvOZK3vqQqkFsR114zF0luP
         NsqW/e6+7iD4AtQvi1vvHV6VQ0/Ah+5S9frgjXT/z1wuRk1Jr+R8Z236CVWatagRGTsR
         /27AycEokdAEQVgK3eVhFBDK7eGwCk8bqRh9Nwe0tUCooQlx98cXoj4f04NOtVnddRI4
         h0ZIlxZOaaU1n5pGSmhDTP+9hC8nN1mMttRcDCJXEyIO/ROXRwO/Cias5L5Oez3mHyBT
         afWV4fqs5HQEUJAQYvEkKqs6mfZkLsKEf57vFo5AMTBx3Sw8MZpsGMcU1wrKd8udQ0zU
         7hug==
X-Gm-Message-State: ABy/qLbY90GkN9yPvSUIvs2pp4efZnAII8leQSSqtidJI+KGHFTIpN5I
	jtCBQWLxj+FrANuPemexqSZHGEDMV1CbO4MSjDttlQ==
X-Google-Smtp-Source: APBJJlFyLvmhQCX5nI+rcMbwxp+/tcnDtwevbdff0qrkn1BHI5o5JXj5DeDKLsClwiabVGsQxskCQa+dsFm1gWGhye4=
X-Received: by 2002:adf:e483:0:b0:314:db7:d132 with SMTP id
 i3-20020adfe483000000b003140db7d132mr2106439wrm.61.1689267957936; Thu, 13 Jul
 2023 10:05:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAB=BE-Rm0ycTZXj=wHW_FBCCKbswG+dh3L+o1+CUW=Pg_oWnyw@mail.gmail.com>
 <20230713003201.GA469376@google.com> <161f1615-3d85-cf47-d2d5-695adf1ca7d4@linux.alibaba.com>
 <0d9e7b4d-6477-47a6-b3d2-2c9d9b64903d@paulmck-laptop> <f124e041-6a82-2069-975c-4f393e5c4137@linux.alibaba.com>
 <87292a44-cc02-4d95-940e-e4e31d0bc6f2@paulmck-laptop> <f1c60dcb-e32f-7b7e-bf0d-5dec999e9299@linux.alibaba.com>
 <CAEXW_YSODXRfgkR0D2G-x=0uZdsqvF3kZL+LL3DcRX-5CULJ1Q@mail.gmail.com>
 <894a3b64-a369-7bc6-c8a8-0910843cc587@linux.alibaba.com> <CAEXW_YSM1yik4yWTgZoxCS9RM6TbsL26VCVCH=41+uMA8chfAQ@mail.gmail.com>
 <58b661d0-0ebb-4b45-a10d-c5927fb791cd@paulmck-laptop>
In-Reply-To: <58b661d0-0ebb-4b45-a10d-c5927fb791cd@paulmck-laptop>
From: Sandeep Dhavale <dhavale@google.com>
Date: Thu, 13 Jul 2023 10:05:46 -0700
Message-ID: <CAB=BE-QSaRKvVQg28wu6zVoO9RwiHZgXJzUaEMdbtpieVLmT8A@mail.gmail.com>
Subject: Re: [PATCH v1] rcu: Fix and improve RCU read lock checks when !CONFIG_DEBUG_LOCK_ALLOC
To: paulmck@kernel.org
Cc: Joel Fernandes <joel@joelfernandes.org>, Gao Xiang <hsiangkao@linux.alibaba.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <quic_neeraju@quicinc.com>, 
	Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-erofs@lists.ozlabs.org, 
	xiang@kernel.org, Will Shiu <Will.Shiu@mediatek.com>, kernel-team@android.com, 
	rcu@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_100601_899065_0E449C83 
X-CRM114-Status: GOOD (  16.22  )
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

Hello All,

Let me answer some of the questions raised here.

* Performance aspect
EROFS is one of the popular filesystem of choice in Android for read
only partitions
as it provides 30%+ storage space savings with compression.
In addition to microbenchmarks, boot times and cold app launch
benchmarks are very
important to the Android ecosystem as they directly translate to
responsiveness from user point of view. We saw some
performance penalty in cold app launch benchmarks in a few scenarios.
Analysis showed that the significant variance was coming from the
scheduling cost while decompression cost was more or less the same.
Please see the [1] which shows scheduling costs for kthread vs kworker.

> Just out of curiosity, exactly how much is it costing to trigger the
workqueue?
I think the cost to trigger is not much, it's the actual scheduling latency for
the thread is the one which we want to cut down. And if we are already in
thread context then there is no point in incurring any extra cost if
we can detect
it reliably. That is what erofs check is trying to do.

>One additional question...  What is your plan for kernels built with
CONFIG_PREEMPT_COUNT=n?
If there is no reliable way to detect if we can block or not then in that
case erofs has no option but to schedule the kworker.

* Regarding BLK_MQ_F_BLOCKING
As mentioned by Gao in the thread this is a property of blk-mq device
underneath,
so erofs cannot control it has it has to work with different types of
block devices.

* Regarding rcu_is_watching()

>I am assuming you mean you would grab the mutex accidentally when in an RCU
reader, and might_sleep() presumably in the mutex internal code will scream?

Thank you Paul for explaining in detail why it is important. I can get
the V2 going.
From the looking at the code at kernel/sched/core.c which only looks
at rcu_preempt_depth(),
I am thinking it may still get triggered IIUC.

> The following is untested, and is probably quite buggy, but it should
provide you with a starting point.
..

Yes, that can fix the problem at hand as the erofs check also looks
for rcu_preempt_depth().
A similar approach was discarded as rcu_preempt_depth() was though to
be low level
and we used rcu_read_lock_any_held() which is the superset until we
figured out inconsistency
when ! CONFIG_DEBUG_LOCK_ALLOC.

Paul, Joel,
Shall we fix the rcu_read_lock_*held() regardless of how erofs
improves the check?

Thanks,
Sandeep.

[1] https://lore.kernel.org/linux-erofs/20230208093322.75816-1-hsiangkao@linux.alibaba.com/

