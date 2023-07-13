Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A418C0015E
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 18:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CRTSQeUdEcnOajeYoZyJyVr14RVak3GBVUbXP0XQdD8=; b=mHZ7iEcfZfqn4b+JyAuBxcy4st
	mrDnNzUDen7vHmvj7usbTneVA9NNACB/M1Cu5pzegsSs+yIe02JtYC9UmQj79UreY1H9S9JSZoIBi
	aIIagQgW8JxNVz7Y7dqkkE5w2xRuChssa8WwtsPtpXQI+atqnmJU7ilhF2BqpgFy+yYBBwlEer/rj
	8qu+3RF1sFd+tYfMADWj5J/PxmcD+y/QFfGYsle46RhUrZeWGqdUXkRO1jcfVXu7xGyQHrN6vYdZL
	Jiugsv7o95scqrEbjGGt4+ifgaM7sBJZR9fwey6oFIpVvb4tiiQEWey+L7+05Rm/67sRqqPsppj8U
	gpCc/BAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qK1Pr-004ANf-11;
	Thu, 13 Jul 2023 18:51:51 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qK1Pn-004AKw-2Y
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jul 2023 18:51:49 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fbea14706eso9991115e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Jul 2023 11:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689274306; x=1691866306;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CRTSQeUdEcnOajeYoZyJyVr14RVak3GBVUbXP0XQdD8=;
        b=k7idrVD3RsqeuHqTO9rpH6mwpxtDc61Ezz3IEiqaaW+yycMVDXcOUK25k1gnwf3Tsa
         JNYyr6Xt7TBgsP42SCshexrnS4RlNtEsTI1sxsMokh2ipYJ175NJ/sj/+SDABByQ9sKL
         N5zc+A76cNhWElOj+UaRMc7Ent2H9DfxvXu+mWuAuNcQ74m+MTlg9/zuGBdBj3NUimGx
         7xWiLwHjZy3mHoNfQpJWazMejVBv5uZDM1IlQHjtRbUqOImER0W9F3FfI653/qlEvG9u
         zdM9vIxR4Mj08dzzi3QzD8fp50AFpOqNq4Es0vBevPJUNy7DTazzlN78ZURrj0n94R0g
         bk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689274306; x=1691866306;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CRTSQeUdEcnOajeYoZyJyVr14RVak3GBVUbXP0XQdD8=;
        b=HdI7QXyziu3DhPhQghYGEeuuoWy6zHtYjqRtFBr1KSlbmC5jp6PTledv0xu4ZdH9wt
         5azcNnuqeB1twKGaJ8OVadBEpOo7QgBvetFPjCTN6PJcHY4c79ZsA2cr7JiM/CfQOsRM
         0aEUq/IKOlBnSptkuYSfhvo2f/YqDRTCvAQaTmpSgjxfQdsPtGWqY7F0xIfpR5rEXA47
         fcqbZYftBaNp8mGuYzouSqMl6MPMOvSdWuXaY21SnL4Hc8SWstza4mj1qldhQdSOsLEg
         1Z2iODWzvk4Y6fIAu2ku4C04rcbXAW+RsmzDqGs089Pgu0Gq436k1GYxGXfQSCCa47AV
         Wrcg==
X-Gm-Message-State: ABy/qLZkytunWQm+bbz2mJla3B8VE/IZxXrtZHZJEkRSAEPFBntgt2e3
	Sc16PYtr5xAzkBBdiTa2YmCypPzRezS3evaUvflgxw==
X-Google-Smtp-Source: APBJJlGvHzvAe/oR+TTlkHcVqp0fo8lpXt8SG+ObjVCv6Vz7ojUSg+bE3wo3qfu/bC0DdnxZh+XcOdlxLsXIEcAD5hA=
X-Received: by 2002:a7b:c5c5:0:b0:3fa:99d6:47a4 with SMTP id
 n5-20020a7bc5c5000000b003fa99d647a4mr2316810wmk.22.1689274305706; Thu, 13 Jul
 2023 11:51:45 -0700 (PDT)
MIME-Version: 1.0
References: <161f1615-3d85-cf47-d2d5-695adf1ca7d4@linux.alibaba.com>
 <0d9e7b4d-6477-47a6-b3d2-2c9d9b64903d@paulmck-laptop> <f124e041-6a82-2069-975c-4f393e5c4137@linux.alibaba.com>
 <87292a44-cc02-4d95-940e-e4e31d0bc6f2@paulmck-laptop> <f1c60dcb-e32f-7b7e-bf0d-5dec999e9299@linux.alibaba.com>
 <CAEXW_YSODXRfgkR0D2G-x=0uZdsqvF3kZL+LL3DcRX-5CULJ1Q@mail.gmail.com>
 <894a3b64-a369-7bc6-c8a8-0910843cc587@linux.alibaba.com> <CAEXW_YSM1yik4yWTgZoxCS9RM6TbsL26VCVCH=41+uMA8chfAQ@mail.gmail.com>
 <58b661d0-0ebb-4b45-a10d-c5927fb791cd@paulmck-laptop> <CAB=BE-QSaRKvVQg28wu6zVoO9RwiHZgXJzUaEMdbtpieVLmT8A@mail.gmail.com>
 <39923da8-16a1-43a8-99f1-5e13508e4ee4@paulmck-laptop>
In-Reply-To: <39923da8-16a1-43a8-99f1-5e13508e4ee4@paulmck-laptop>
From: Sandeep Dhavale <dhavale@google.com>
Date: Thu, 13 Jul 2023 11:51:34 -0700
Message-ID: <CAB=BE-QNFhOD=xe09hiZOLmDN7XQxnaxyMz1X=4EeU7SFKaRKA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230713_115147_834784_792C3029 
X-CRM114-Status: GOOD (  15.21  )
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

> Thank you for the background.
>
> > Paul, Joel,
> > Shall we fix the rcu_read_lock_*held() regardless of how erofs
> > improves the check?
>
> Help me out here.  Exactly what is broken with rcu_read_lock_*held(),
> keeping in mind their intended use for lockdep-based debugging?
>
Hi Paul,
With !CONFIG_DEBUG_ALLOC_LOCK
rcu_read_lock_held() -> Always returns 1.
rcu_read_lock_any_held()-> returns !preemptible() so may return 0.

Now current usages for rcu_read_lock_*held() are under RCU_LOCKDEP_WARN()
which becomes noOP with !CONFIG_DEBUG_ALLOC_LOCK
(due to debug_lockdep_rcu_enabled()) so this inconsistency is not causing
any problems right now. So my question was about your opinion for fixing this
for semantics if it's worth correcting.

Also it would have been better IMO if there was a reliable API
for rcu_read_lock_*held() than erofs trying to figure it out at a higher level.

> I have no official opinion myself, but there are quite a few people
...

Regarding erofs trying to detect this, I understand few people can
have different
opinions. Not scheduling a thread while being in a thread context itself
is reasonable in my opinion which also has shown performance gains.

Thanks,
Sandeep.



>                                                         Thanx, Paul
>
> > Thanks,
> > Sandeep.
> >
> > [1] https://lore.kernel.org/linux-erofs/20230208093322.75816-1-hsiangkao@linux.alibaba.com/
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>

