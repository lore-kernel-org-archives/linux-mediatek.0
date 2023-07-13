Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C712EB64DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 01:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qaRxxdr7002yjY9Sb9rO/hl+wvbOVuHe+f71rQQmNs8=; b=fHJ1klrEt490vrWieTl+NSILip
	ipoXJQzu2KUEfjjxvRQQHLVJUhsP55nwO8IFVwzH56jB10LzlWpynpskNZmdYgXvJMePNcxwFHmyg
	evZncZNLMdbkNEPByg3Uzfg+OUIvIyc1Nm2QAJXAbP8q5BMvvM2n2HjhHTtG2CS9kJSISJSeHn6NQ
	1nT3V3/dy9sUu2AhNNfdsqaFxY/+kY/BnIZMgYOn7HzsRUzjQZ24ANXtWtWkPL3yXSlbCJVuNcais
	opQPMNizSm9u4ve4+wsyo+DoGUWkWahKdcBVqYpiBucnKVxixv6tx2dhjN+cADgJXozF7cCmMAxJj
	lJlTGL6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJlF1-001dmk-39;
	Thu, 13 Jul 2023 01:35:35 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJlEy-001dlj-2J
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jul 2023 01:35:34 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-345d6dc271dso714275ab.0
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jul 2023 18:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1689212130; x=1691804130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qaRxxdr7002yjY9Sb9rO/hl+wvbOVuHe+f71rQQmNs8=;
        b=ZMHAvknOnwQhd7hwVntmR134VIf/xa8j7HZiHjXQ9avrdkys1ATjg4U+6vtSQiEsvf
         GhRM6CAI2OjvDFIornwXuZ348pIlr8Y+MbRK0iFbTN3mULWh7l5Wo6vG2kDv1f1xKnde
         +1VhH8VNCIxNdnXEyC9Uhgl1/ul6MJ6kfbsvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689212130; x=1691804130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qaRxxdr7002yjY9Sb9rO/hl+wvbOVuHe+f71rQQmNs8=;
        b=efPunFaX5hHHCWhEpB4LdODEeUjA2trCRymRFo8SRx78JcuyoGcOi1Tg4HQHMuRe/B
         tQp0zRFjeZU9GSt+UgGiEXwgvcJdiRjgn0cRb2SeYntywEZeBrAfpXYhU2QE0/i28Yjf
         y107ws0YJjG49QOgPGquWQ91Gh76E+GuGoisHEpuweoKxwnC6sqQZx1OvN+FScNUa6bM
         wMLeRK3oeCq190GLFi70vTBd14XOWdeDL3E5uQueJKQOXfMo3BhKp6dTyP/+qPZOk/x8
         aYi2czrBcGSTVmDYeD8S7ettXBrHIsNmmUX+IjZ21PEFm4armlJZCgbHsrLmUnjjlEX1
         aCGA==
X-Gm-Message-State: ABy/qLakTmfg6OY8XXKbEgjGWVLtEtLnS5d2qeuRwHisRxsWg6wNNqtO
	3YCrjJKFajdapvxtdrQe/UPUYQ==
X-Google-Smtp-Source: APBJJlEreT5I7mhbY3CrgO4nPjdHks9kWfD2/wzw3a1D2fzQTpHAli4eHhivkahHLSwBjGrsEf0UHQ==
X-Received: by 2002:a92:de0e:0:b0:347:70a8:1749 with SMTP id x14-20020a92de0e000000b0034770a81749mr71357ilm.24.1689212130076;
        Wed, 12 Jul 2023 18:35:30 -0700 (PDT)
Received: from localhost (243.199.238.35.bc.googleusercontent.com. [35.238.199.243])
        by smtp.gmail.com with ESMTPSA id k1-20020a02a701000000b0042b2df337ccsm1483077jam.76.2023.07.12.18.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 18:35:29 -0700 (PDT)
Date: Thu, 13 Jul 2023 00:32:01 +0000
From: Joel Fernandes <joel@joelfernandes.org>
To: Sandeep Dhavale <dhavale@google.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
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
	linux-erofs@lists.ozlabs.org, xiang@kernel.org,
	Will Shiu <Will.Shiu@mediatek.com>, kernel-team@android.com,
	rcu@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1] rcu: Fix and improve RCU read lock checks when
 !CONFIG_DEBUG_LOCK_ALLOC
Message-ID: <20230713003201.GA469376@google.com>
References: <20230711233816.2187577-1-dhavale@google.com>
 <CAEXW_YQvpiFEaaNoS=Msgi17mU3kZD+q8bNBaHYasMArG9aPig@mail.gmail.com>
 <CAB=BE-Rm0ycTZXj=wHW_FBCCKbswG+dh3L+o1+CUW=Pg_oWnyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAB=BE-Rm0ycTZXj=wHW_FBCCKbswG+dh3L+o1+CUW=Pg_oWnyw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_183532_783417_93501334 
X-CRM114-Status: GOOD (  26.39  )
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

On Wed, Jul 12, 2023 at 02:20:56PM -0700, Sandeep Dhavale wrote:
[..]
> > As such this patch looks correct to me, one thing I noticed is that
> > you can check rcu_is_watching() like the lockdep-enabled code does.
> > That will tell you also if a reader-section is possible because in
> > extended-quiescent-states, RCU readers should be non-existent or
> > that's a bug.
> >
> Please correct me if I am wrong, reading from the comment in
> kernel/rcu/update.c rcu_read_lock_held_common()
> ..
>   * The reason for this is that RCU ignores CPUs that are
>  * in such a section, considering these as in extended quiescent state,
>  * so such a CPU is effectively never in an RCU read-side critical section
>  * regardless of what RCU primitives it invokes.
> 
> It seems rcu will treat this as lock not held rather than a fact that
> lock is not held. Is my understanding correct?

If RCU treats it as a lock not held, that is a fact for RCU ;-). Maybe you
mean it is not a fact for erofs?

> The reason I chose not to consult rcu_is_watching() in this version
> is because check "sleeping function called from invalid context"
> will still get triggered (please see kernel/sched/core.c __might_resched())
> as it does not consult rcu_is_watching() instead looks at
> rcu_preempt_depth() which will be non-zero if rcu_read_lock()
> was called (only when CONFIG_PREEMPT_RCU is enabled).

I am assuming you mean you would grab the mutex accidentally when in an RCU
reader, and might_sleep() presumably in the mutex internal code will scream?

I would expect in the erofs code that rcu_is_watching() should always return
true, so it should not effect the decision of whether to block or not. I am
suggesting add the check for rcu_is_watching() into the *held() functions for
completeness.

// will be if (!true) when RCU is actively watching the CPU for readers.
bool rcu_read_lock_any_held() {
	if (!rcu_is_watching())
		return false;
	// do the rest..
}

> > Could you also verify that this patch does not cause bloating of the
> > kernel if lockdep is disabled?
> >
> Sure, I will do the comparison and send the details.

Thanks! This is indeed an interesting usecase of grabbing mutex / blocking in
the reader.

thanks,

 - Joel


