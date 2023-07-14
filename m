Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC766EB64DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jul 2023 15:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F6oupQSV0zkTmjGx2upmtzQXF2qyzYgw3skjhCayYt0=; b=QXhfbjgDf9oS6n6U6S0WjJVTMQ
	cy8hoDr/jkiDwid7efbfNalg5+Yu/MFVIclxiqSZBU9FCEGbf7YCKYPzIym4hsZsJ0ERAPApvRHTQ
	7oecUyFbn9vuwZjfaBgKisnr+UbD7ZJEMVyvnDV8vJWQE+U4G1FxXZO6H+sm2FjGjqv2loxd/sox+
	1cKbWmk0TI592S6xM00il2Fjh4qJCFDqArzNwWnF6oCIlfYd8oqabnIwCuyhdfO7qHRdDVeX6sy2F
	OtTctin2JyCadmWtTeNCzkGGMv0uY2xPIrhQD8IVfq5dhE6NV7bWZ3fUV5Hyw/T48BfhFX4om1xCu
	iCK4iUwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKKU6-006UT2-20;
	Fri, 14 Jul 2023 15:13:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKKU2-006USF-2C;
	Fri, 14 Jul 2023 15:13:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2558461D45;
	Fri, 14 Jul 2023 15:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80E96C433C7;
	Fri, 14 Jul 2023 15:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689347605;
	bh=/ms++gXmzcCxNeQJmcaIIDi2dWJOZMkl3ilZS245fbU=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=e9mTxiqT5SFcazYh/KzxJ9wXw+vBIuFDC8WF4/Okvoij7KXNzYOfm/RvZSWaTD8bk
	 nUptLTKsO/05/Wh8tKRGkHihY0wSXI4vimazLsZU168iyWjdxaJCgDVoVz7LoYIY3L
	 7q6/PMuoR0I5oCKZ6WQd4yNHt2rZptHITESUDPUYoc4wPjfNgejAa2ut6QoK115L8e
	 5NyTlO5PXgsHtrE4ApKb00z4ugJQWbtVIM8acy9YeG4fuZVv0XV4v5ectSv7UzbUV3
	 ahQMO2L7JTXmc9ldAL0BnrnNqXo9kYd/JsM8tAjwIE92XDtrbRzldP2YbHZt7qvSQn
	 mXYFq2F+eWAMQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 194ABCE0093; Fri, 14 Jul 2023 08:13:25 -0700 (PDT)
Date: Fri, 14 Jul 2023 08:13:25 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Gao Xiang <hsiangkao@linux.alibaba.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Sandeep Dhavale <dhavale@google.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <quic_neeraju@quicinc.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang1211@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-erofs@lists.ozlabs.org, xiang@kernel.org,
	Will Shiu <Will.Shiu@mediatek.com>, kernel-team@android.com,
	rcu@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1] rcu: Fix and improve RCU read lock checks when
 !CONFIG_DEBUG_LOCK_ALLOC
Message-ID: <41a364d7-9dfa-4cd6-95f0-63f09c3a84b6@paulmck-laptop>
References: <f1c60dcb-e32f-7b7e-bf0d-5dec999e9299@linux.alibaba.com>
 <CAEXW_YSODXRfgkR0D2G-x=0uZdsqvF3kZL+LL3DcRX-5CULJ1Q@mail.gmail.com>
 <894a3b64-a369-7bc6-c8a8-0910843cc587@linux.alibaba.com>
 <CAEXW_YSM1yik4yWTgZoxCS9RM6TbsL26VCVCH=41+uMA8chfAQ@mail.gmail.com>
 <58b661d0-0ebb-4b45-a10d-c5927fb791cd@paulmck-laptop>
 <7d433fac-a62d-4e81-b8e5-57cf5f2d1d55@paulmck-laptop>
 <058e7ee9-0380-eb1b-d9a8-b184cba6ed53@linux.alibaba.com>
 <CAEXW_YQCpUsPz24H4Mux6wOH1=RFRR-gsXLFTbJ37MgUJo3kCw@mail.gmail.com>
 <fccca41d-8a72-27cf-e589-409f54cd5811@linux.alibaba.com>
 <20230714105615.1ff9b8d2@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230714105615.1ff9b8d2@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_081326_804635_3C412521 
X-CRM114-Status: GOOD (  17.74  )
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
Reply-To: paulmck@kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jul 14, 2023 at 10:56:15AM -0400, Steven Rostedt wrote:
> On Fri, 14 Jul 2023 21:51:16 +0800
> Gao Xiang <hsiangkao@linux.alibaba.com> wrote:
> 
> > >> we need to work on
> > >> CONFIG_PREEMPT_COUNT=n (why not?), we could just always trigger a
> > >> workqueue for this.
> > >>  
> > > 
> > > So CONFIG_PREEMPT_COUNT=n users don't deserve good performance? ;-)  
> > 
> > I'm not sure if non-preemptible kernel users really care about
> > such sensitive latencies, I don't know, my 2 cents.
> 
> CONFIG_PREEMPT_COUNT=n is for *performance* but not for *latency*. That is,
> they care about the overall performance (batch processing) but not
> interactive performance.

Users of CONFIG_PREEMPT_COUNT=n do care about latency, but normally not
in the sub-millisecond range.  If the February posting is representative
(no idea, myself), these latencies are in the tens of milliseconds.

So one question is "why not both?"

One way would be for the call chain to indicate when in atomic context,
and another would be use of SRCU, to Joel's earlier point.

							Thanx, Paul

