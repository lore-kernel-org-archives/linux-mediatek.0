Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCC4EB64DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jul 2023 19:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cWpYs8CNOdGMvN7PUCKK7yk/Bn/GzPi3qlDukGM0svY=; b=3Oyfd9QYj88KtyLf+T2MGACMP5
	URqGbpN5ehBNpb3ygtkCFfdPztIdMbh2p9msvQBtrGzkC/z8UklB4PuQmH3akP0JwpmNNJbt118qC
	hrP5iYyvHR5fmfN+18Ms676OuM+qEBr68Y0yGb5Sl6COs/v43wU1Rc/RwAmPw+5GjlFwsd6hEzLJ8
	IDkYSYds5jgr6+yvFSLLxFsDUlMbqFR74lIhXmr3iTl3o3cnQIy3MA0TlKfMJqbiU8vtsbehOhaWX
	yR6zMkvZ1yVI8cv27wIVxmFcAKKPrUK+uFnZdAPcUrgvF+5w6swiK8WYham6bEdXxir6quryYkFiG
	uUvXzhBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKOGR-0074N5-2X;
	Fri, 14 Jul 2023 19:15:39 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKOGP-0074Ly-18
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Jul 2023 19:15:38 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-313e742a787so1429318f8f.1
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Jul 2023 12:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689362135; x=1691954135;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cWpYs8CNOdGMvN7PUCKK7yk/Bn/GzPi3qlDukGM0svY=;
        b=u6PqySub/kl2NX7TsnMPUgsANCQef+gR/n+Nhu9kgZ21hTNFF+QyOkoQ+7bqrPZe+E
         UdkMBztk103Z31sNAKjHV6KrDcrynswJO7k3ORSB/DQhRFKAlb6qohsTScwFM0uHTJwd
         70+51BNdlcX1ExDblhdHUhVMApT6fVpjxauHF3xkSf+Cpnaim3AYc8Q7z0ni83fW7erv
         LjIKwOLvevXt/I+PVeReVV0TMhCbnEz9+kU0/CP1ZclewPwNX5kZzxxulJMxVF6+Sb2N
         8qXhi2DpmbpHi0HT1wLRgi82sfikmTqLoht0QdiFfQx4nbeAibmSfARYGtPbClXL7FGr
         vqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689362135; x=1691954135;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cWpYs8CNOdGMvN7PUCKK7yk/Bn/GzPi3qlDukGM0svY=;
        b=lvTSI3MGf6GtMzcvLo1XU5vBSZv8T9TqSGqJWjIdEZzNkiMsdu+EBf04ZetFsopVKg
         ZvKO+r1HVxhm10NUK+rSEL3J2CT6oG828MKArIxWDCgZmSjD7eGRCJH2eeKFKOflaRqY
         CjdCQqxBnP2ZuLijf/sy3i2Q5qIek7SrIOVywS7Ir08fcmKCJBx/sxRGFYWHoZr+0JMh
         5pLyElGHACLuSLiqKL05NDy27lhH10qau+ofY51Pk/+e2rcD7sNGm7nAly5hRV/d/0Ei
         dwAbI8/Ltyzbcji5Hq8tK065JQ0blmGueMaFl/4/nriAdR3uFLMH8/f1QIxvP4CVP+RX
         eUtg==
X-Gm-Message-State: ABy/qLbATqmGRfogNoY4akcNKyJojj5zXhE+sOL2VcAY0SC6oxe6KlRI
	fvwB+T6ZToLI3/K9hpEov6RHJabSob/+UMVgTLPK7Q==
X-Google-Smtp-Source: APBJJlHX6dLj7c4mGTpQQffA8nPlc153rMil3AEv5RNyi1HYhhgbFITU/Tv7HZL6ycDAMJ2p0B6XqAyqBusI0MosC4I=
X-Received: by 2002:adf:e8d0:0:b0:313:e2e3:d431 with SMTP id
 k16-20020adfe8d0000000b00313e2e3d431mr3161529wrn.12.1689362135219; Fri, 14
 Jul 2023 12:15:35 -0700 (PDT)
MIME-Version: 1.0
References: <f1c60dcb-e32f-7b7e-bf0d-5dec999e9299@linux.alibaba.com>
 <CAEXW_YSODXRfgkR0D2G-x=0uZdsqvF3kZL+LL3DcRX-5CULJ1Q@mail.gmail.com>
 <894a3b64-a369-7bc6-c8a8-0910843cc587@linux.alibaba.com> <CAEXW_YSM1yik4yWTgZoxCS9RM6TbsL26VCVCH=41+uMA8chfAQ@mail.gmail.com>
 <58b661d0-0ebb-4b45-a10d-c5927fb791cd@paulmck-laptop> <7d433fac-a62d-4e81-b8e5-57cf5f2d1d55@paulmck-laptop>
 <F160D7F8-57DC-4986-90A9-EB50F7C89891@gmail.com> <6E5326AD-9A5D-4570-906A-BDE8257B6F0C@gmail.com>
 <e8ee7006-c1d0-4c04-bd25-0f518fb6534b@paulmck-laptop> <D042B1CB-2ED4-4DF9-8CF5-5E455E7EAB73@gmail.com>
 <453bcbbd-94f4-46da-98f6-c9fa5f931231@paulmck-laptop>
In-Reply-To: <453bcbbd-94f4-46da-98f6-c9fa5f931231@paulmck-laptop>
From: Sandeep Dhavale <dhavale@google.com>
Date: Fri, 14 Jul 2023 12:15:23 -0700
Message-ID: <CAB=BE-TC0s++t_5H6NjVVcpNvvvubtUpJhRxPsqq2p3ZgaFo9A@mail.gmail.com>
Subject: Re: [PATCH v1] rcu: Fix and improve RCU read lock checks when !CONFIG_DEBUG_LOCK_ALLOC
To: paulmck@kernel.org
Cc: Alan Huang <mmpgouride@gmail.com>, Joel Fernandes <joel@joelfernandes.org>, 
	Gao Xiang <hsiangkao@linux.alibaba.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Neeraj Upadhyay <quic_neeraju@quicinc.com>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Zqiang <qiang.zhang1211@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-erofs@lists.ozlabs.org, 
	xiang@kernel.org, Will Shiu <Will.Shiu@mediatek.com>, kernel-team@android.com, 
	rcu@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_121537_387210_38E3FD81 
X-CRM114-Status: UNSURE (   7.61  )
X-CRM114-Notice: Please train this message.
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
> Sandeep, thoughts?
>
I prefer to modify erofs check and contain the fix there as erofs
cares about it and it's
least invasive. For contexts where erofs cannot tell for sure, it will
always schedule kworker
(like CONFIG_PREEMPT_COUNT=n).

I will also do measurements to see if erofs should continue to check
for context and
what are the benefits.

Thanks,
Sandeep.
>                                                         Thanx, Paul
>

