Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F25C001DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 23:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7MIq8bTzHJaUBMG7MB1mjwVxSlLGLbSF+iBBc0I9Blo=; b=e4HKuvy0Adg2k5Tb9TuCvlozZ4
	/fRzGjYBBMas/qpjUxLtWQ9qGXEKZ72dAOYoLV0HzSgIF8MpAjUCwKpTgJG6E7Ii5B7N1g7xjTcFb
	E6PDZspU2UmptBRLZ/3XCqHMgAugRMIj/MNtX/n0iWRqzg5ZjMA+odp9xjwPHEfFLa8JYOFvpfrz6
	yCtWQwdzPFKbKj8fFsC9g2qCnFUaCCD4SMSamYpwyTv3Dg4rWMKmiAHUYWWYmJGrHwW0LvPrvxbuw
	32N2lJd7pSFuGotnEI14lwvFT+VWuLXHFMktQdnhRkIsF0Kd0DRBQmZSNDbqH3W7GHY5aeTtAhANC
	kAN5MXtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qK5QY-004Wrr-0I;
	Thu, 13 Jul 2023 23:08:50 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qK5QU-004Wr3-2s
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jul 2023 23:08:48 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fbea14700bso11870215e9.3
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Jul 2023 16:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689289721; x=1691881721;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7MIq8bTzHJaUBMG7MB1mjwVxSlLGLbSF+iBBc0I9Blo=;
        b=GmGWN0bFc/PuVur7Q3f0M7RB/m2bVuZ/rjjDnClPiEHktBfSiDlNMY0qUGFdXlmqbD
         +kn+ROYAjwpRPL/TF1HntuFpaXzJMSHEJqWKZiULfXvUFbsIBj34i3AC6SwCoAmbm2MN
         jnGjQv4MTyLFByIC0XtbCGR0TNjfVBmXQFXpel9qRRXaQyj0fUojIye3Th8aPTHjr4MY
         fFjNTzULgGP00gMxv8B7W6WNa8+hj29Wh3lpfQM5V5aO/GTAESEa5Lp7v6jyfeGse339
         G7DGlkPHcjog6PrMcMGg0H7+d0gxOMShEsgDWoAJ5ooPEavrn1Nqxc1oIBcGKYrZKQCm
         CFVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689289721; x=1691881721;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7MIq8bTzHJaUBMG7MB1mjwVxSlLGLbSF+iBBc0I9Blo=;
        b=U8x+kKjrgdm8+rFC81yfOwMzBn5CVvEK2S1M1kQ8wkZVQC+mXTgI41m8w4LiywdNdD
         WQ3gJ0oEwhyCn1nKoOqluBfioIeCsZs0CUCvIzSYYuqggmzeBVo4rK0WoX5iydGD5OIn
         WxiBbETsnjNcF3gppj4kEou4AkD4rvlwllDqvSPjyxfaMCxLJCb2uRvv8F3lqFU+KggF
         L9sFvpAEcuofvlY5Q467aIVn5LApR+ZvFfdbN5qotCblP2sFvq38gCQ6ZRk9V73fssk8
         9WC3tGO49WwEM+bit6apmOxVwR11WB3rJSBg0YSDSxaxd5pOrQk1y6YdkRhXctrpafK7
         FiAA==
X-Gm-Message-State: ABy/qLZ8nHUKaQQuW/iEdw3zMjObuK2PIAu/uGYdDandmNpXmlHKrMjC
	S8Zp2yCfkkqW/RUV5R4/dabj+MJVgDYeg19tP0Mt/w==
X-Google-Smtp-Source: APBJJlEXzrAclXWVxYwGAmtlIpk6nS9KAbCBTtui9wvHi9uUzxWq0odQGTMSmxgCGTjogJzTvdm61WONNB0CrmpkFeo=
X-Received: by 2002:adf:ff8c:0:b0:313:eadf:b827 with SMTP id
 j12-20020adfff8c000000b00313eadfb827mr2503418wrr.56.1689289721521; Thu, 13
 Jul 2023 16:08:41 -0700 (PDT)
MIME-Version: 1.0
References: <f124e041-6a82-2069-975c-4f393e5c4137@linux.alibaba.com>
 <87292a44-cc02-4d95-940e-e4e31d0bc6f2@paulmck-laptop> <f1c60dcb-e32f-7b7e-bf0d-5dec999e9299@linux.alibaba.com>
 <CAEXW_YSODXRfgkR0D2G-x=0uZdsqvF3kZL+LL3DcRX-5CULJ1Q@mail.gmail.com>
 <894a3b64-a369-7bc6-c8a8-0910843cc587@linux.alibaba.com> <CAEXW_YSM1yik4yWTgZoxCS9RM6TbsL26VCVCH=41+uMA8chfAQ@mail.gmail.com>
 <58b661d0-0ebb-4b45-a10d-c5927fb791cd@paulmck-laptop> <CAB=BE-QSaRKvVQg28wu6zVoO9RwiHZgXJzUaEMdbtpieVLmT8A@mail.gmail.com>
 <39923da8-16a1-43a8-99f1-5e13508e4ee4@paulmck-laptop> <CAB=BE-QNFhOD=xe09hiZOLmDN7XQxnaxyMz1X=4EeU7SFKaRKA@mail.gmail.com>
 <32b8c9d5-37da-4508-b524-fc0fd326c432@paulmck-laptop>
In-Reply-To: <32b8c9d5-37da-4508-b524-fc0fd326c432@paulmck-laptop>
From: Sandeep Dhavale <dhavale@google.com>
Date: Thu, 13 Jul 2023 16:08:29 -0700
Message-ID: <CAB=BE-SwUTDkVvd5s3-NjEzBTqoZnHFdZg0OU-YVK+h3rxnEuw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230713_160846_947049_E270A723 
X-CRM114-Status: GOOD (  18.62  )
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

>
> Sorry, but the current lockdep-support functions need to stay focused
> on lockdep.  They are not set up for general use, as we already saw
> with rcu_is_watching().
>
Ok, understood.

> If you get a z_erofs_wq_needed() (or whatever) upstream, and if it turns
> out that there is an RCU-specific portion that has clean semantics,
> then I would be willing to look at pulling that portion into RCU.
> Note "look at" as opposed to "unconditionally agree to".  ;-)
> > > I have no official opinion myself, but there are quite a few people
> > ...
> >
> > Regarding erofs trying to detect this, I understand few people can
> > have different
> > opinions. Not scheduling a thread while being in a thread context itself
> > is reasonable in my opinion which also has shown performance gains.
>
> You still haven't quantified the performance gains.  Presumably they
> are most compelling with large numbers of small buffers to be decrypted.
>

Maybe you missed one of the replies. Link [1] shows the scheduling overhead
for kworker vs high pri kthread. I think we can all see that there is non-zero
cost associated with always scheduling vs inline decompression.

> But why not just make a z_erofs_wq_needed() or similar in your own
> code, and push it upstream?  If the performance gains really are so
> compelling, one would hope that some sort of reasonable arrangement
> could be arrived at.
>
Yes, we will incorporate additional checks in erofs.

Thanks,
Sandeep.

[1] https://lore.kernel.org/linux-erofs/20230208093322.75816-1-hsiangkao@linux.alibaba.com/

