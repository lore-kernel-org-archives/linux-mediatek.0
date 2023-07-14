Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9FCEB64DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jul 2023 18:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ofizx6xWGFFIm8/eD5qiUA5FPYKINXGEMTBCRthkA+Y=; b=432cCXP+JxNu5o1LJhvyhwzQpB
	KIA68GFZjuQiCLwfICIhe/o6D3rgXxDlevd7JWdP6PtFqaxo/wyhouSGzXU5Gv7wfyetFAYx2za7c
	DT6laYtT582qfA0MxeJu83cQdQe2zv/35Wb/dyiwFc8aZ64EZLHtLuVyKClg5qH3v/5/Yugc2Qn1H
	jtqGzkinvqZ4pqfACS/6UM2HTltfpeo7gm0+SBnKtWoUDjABA0tRtxtcUaV+qDE49tHGKrvdClFfb
	UYVBPRe79gt5eS93hO9k4X8dzOrolPz+e2ZUjkO1oJQDsvHJEku84o3XCH9qbAUa6FGVnpi78VZ4d
	H7tlAsmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKNm4-0070Y6-1X;
	Fri, 14 Jul 2023 18:44:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKNlx-0070Wz-1v;
	Fri, 14 Jul 2023 18:44:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 59E6761DCD;
	Fri, 14 Jul 2023 18:44:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0E94C433C8;
	Fri, 14 Jul 2023 18:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689360246;
	bh=asCo0dd5mxRE4px5f2OcxTb7m6Zaxpvf3NvcR8uu61U=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=gn+DOEFcqLlkcY/4WoNax0oKj6ls87rLsFfTTD8WPgySn3vvfMtKPn+ZX3JgPGNCd
	 FDm5Ru12kqKyEtQrpw8eWhZHEiMzjezQtAxWJqdrLSOw7DZaip8ChsOhcVh4XLlwlX
	 /Lv4JvjO4R3Xf7fM/4Ex3qeIsneiy75F6Eu5G3XK4ggLCx6b28BobahgmwhU0Tl4Gy
	 s0pz5u2QfVrnJOeioAXRIFecdDNn/usfOcjlOLvra00R6w4n4ADI0cITSLwW5ovXLO
	 5q5AKGMNfILldBZ3L64L3VQzTGpYJSUIfoJ6wKutfTSPPLSRnsLlsvurNEkfVPwzQ0
	 3I4CQNucM7vBw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 45F3ACE03B3; Fri, 14 Jul 2023 11:44:06 -0700 (PDT)
Date: Fri, 14 Jul 2023 11:44:06 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Alan Huang <mmpgouride@gmail.com>
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
	linux-erofs@lists.ozlabs.org, xiang@kernel.org,
	Will Shiu <Will.Shiu@mediatek.com>, kernel-team@android.com,
	rcu@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1] rcu: Fix and improve RCU read lock checks when
 !CONFIG_DEBUG_LOCK_ALLOC
Message-ID: <453bcbbd-94f4-46da-98f6-c9fa5f931231@paulmck-laptop>
References: <f1c60dcb-e32f-7b7e-bf0d-5dec999e9299@linux.alibaba.com>
 <CAEXW_YSODXRfgkR0D2G-x=0uZdsqvF3kZL+LL3DcRX-5CULJ1Q@mail.gmail.com>
 <894a3b64-a369-7bc6-c8a8-0910843cc587@linux.alibaba.com>
 <CAEXW_YSM1yik4yWTgZoxCS9RM6TbsL26VCVCH=41+uMA8chfAQ@mail.gmail.com>
 <58b661d0-0ebb-4b45-a10d-c5927fb791cd@paulmck-laptop>
 <7d433fac-a62d-4e81-b8e5-57cf5f2d1d55@paulmck-laptop>
 <F160D7F8-57DC-4986-90A9-EB50F7C89891@gmail.com>
 <6E5326AD-9A5D-4570-906A-BDE8257B6F0C@gmail.com>
 <e8ee7006-c1d0-4c04-bd25-0f518fb6534b@paulmck-laptop>
 <D042B1CB-2ED4-4DF9-8CF5-5E455E7EAB73@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D042B1CB-2ED4-4DF9-8CF5-5E455E7EAB73@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_114409_722168_AB23E6C6 
X-CRM114-Status: GOOD (  24.08  )
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

On Sat, Jul 15, 2023 at 02:40:08AM +0800, Alan Huang wrote:
> > 2023年7月15日 01:02，Paul E. McKenney <paulmck@kernel.org> 写道：
> > On Fri, Jul 14, 2023 at 11:54:47PM +0800, Alan Huang wrote:
> >>> 2023年7月14日 23:35，Alan Huang <mmpgouride@gmail.com> 写道：
> >>>> 2023年7月14日 10:16，Paul E. McKenney <paulmck@kernel.org> 写道：

[ . . . ]

> >>>>> How can this be solved?
> >>>>> 
> >>>>> 1. Always use a workqueue.  Simple, but is said to have performance
> >>>>> issues.
> >>>>> 
> >>>>> 2. Pass a flag in that indicates whether or not the caller is in an
> >>>>> RCU read-side critical section.  Conceptually simple, but might
> >>>>> or might not be reasonable to actually implement in the code as
> >>>>> it exists now. (You tell me!)
> >>>>> 
> >>>>> 3. Create a function in z_erofs that gives you a decent
> >>>>> approximation, maybe something like the following.
> >>>>> 
> >>>>> 4. Other ideas here.
> >>>> 
> >>>> 5. #3 plus make the corresponding Kconfig option select
> >>>> PREEMPT_COUNT, assuming that any users needing compression in
> >>>> non-preemptible kernels are OK with PREEMPT_COUNT being set.
> >>>> (Some users of non-preemptible kernels object strenuously
> >>>> to the added overhead from CONFIG_PREEMPT_COUNT=y.)
> >>> 
> >>> 6. Set one bit in bio->bi_private, check the bit and flip it in rcu_read_lock() path,
> >>> then in z_erofs_decompressqueue_endio, check if the bit has changed.
> >> 
> >> Seems bad, read and modify bi_private is a bad idea.
> > 
> > Is there some other field that would work?
> 
> Maybe bio->bi_opf, btrfs uses some bits of it.

Sandeep, thoughts?


							Thanx, Paul

> >>> Not sure if this is feasible or acceptable. :)
> >>> 
> >>>> 
> >>>> Thanx, Paul
> >>>> 
> >>>>> The following is untested, and is probably quite buggy, but it should
> >>>>> provide you with a starting point.
> >>>>> 
> >>>>> static bool z_erofs_wq_needed(void)
> >>>>> {
> >>>>> if (IS_ENABLED(CONFIG_PREEMPTION) && rcu_preempt_depth())
> >>>>> return true;  // RCU reader
> >>>>> if (IS_ENABLED(CONFIG_PREEMPT_COUNT) && !preemptible())
> >>>>> return true;  // non-preemptible
> >>>>> if (!IS_ENABLED(CONFIG_PREEMPT_COUNT))
> >>>>> return true;  // non-preeemptible kernel, so play it safe
> >>>>> return false;
> >>>>> }
> >>>>> 
> >>>>> You break it, you buy it!  ;-)
> >>>>> 
> >>>>> Thanx, Paul
> 
> 

