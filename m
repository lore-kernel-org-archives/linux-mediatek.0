Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A5CC77B7A
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 11:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qKJRw70btDvw6dzoRPZe1V0n3W0ShFothndLD85zokQ=; b=gPHuWvrWC4qpv71P6Ekfxw+XPx
	MhEpoeiG1gBQgjo9bE8PQZnwIRf6OKczXROh8REg5dOiP339MZsPGHIt5hqxXayWeF2xFnMoZMjhg
	kf9LPS2ty9CHoeZfbRc50bS/Y8k3lCKv6ywSxRzoxA7BYu2kh9YADXPAYEzk9DcVt14KlmqeHZTEJ
	DSN6FV1Ef1YxrIq3OsBVptAyPPmMRtvHiDomeZqkZ9NI1vAfkr+6KN6Wr1FzMamkeorRTpg54qfSK
	GCz7gHwJFhL+ZMylTGvGx3ccx4fb/I366RULt9uuCoIIK/2xXHEepDztx6so6dCBPQ1pFDjYjczKL
	cjwo5igg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3x7l-00DYwu-0a;
	Tue, 30 May 2023 11:02:45 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3x7h-00DYw5-1g
	for linux-mediatek@lists.infradead.org;
	Tue, 30 May 2023 11:02:42 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-61cd6191a62so22172726d6.3
        for <linux-mediatek@lists.infradead.org>; Tue, 30 May 2023 04:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685444558; x=1688036558;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qKJRw70btDvw6dzoRPZe1V0n3W0ShFothndLD85zokQ=;
        b=ddbwUXkiE48vFE2zz7Fh1VMI2SkkBKiWtS23kb1YI4nSv4xUWs+Sg5xz0/ycdXsjEp
         oDENZSNXp5erZRt6f2KyTXTxvHMrKcNjdXaKHrZKzQMTP3EN6ZqhJP+vsY8PFHg9ZFlt
         PVJiuE50WxSwHfeprajWksMW0MTA/psTVfTeynP/GufAWpcfH/B+Y726AcHvzTG5jw28
         9Dc08fAC4vXudjSv6+aLOEdHLaJeDcwSvJTV0L20WFENfPnjGxoTFE/xi+WlYylVUxDk
         wVhJ3zjBf564+7o9sdAWXw6YxZ69wGlS0qcSFZ9NQ89s9tHIm5tR2/7KpOdEhqTvHaAj
         yiww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685444558; x=1688036558;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qKJRw70btDvw6dzoRPZe1V0n3W0ShFothndLD85zokQ=;
        b=e3EmdimCHR3riWFaRYxtGjxx49tJNsiPVD0Fy6W4GoA82KCelMc1shjtCSO0k6kchX
         CiLmLq3ON5Sc9k1OntkrMPA0stUJ0Pm1/14LYM7UuZC6P30P3ayUAwLTnjculc9Pkf4H
         NWMHYUe2kqvWMgBL9+GmJ0GMvbwXJhWocNIaoLTkCoIXzTeyts2YK47DLXgo+9jzdiuD
         iFDdNabavMR5GPto7I9Z8zfYeNPe68UAbaVqbpmXY2B9JyKWXvullDOBL2X/NeAin4uo
         4hT8jUZ71vOxa6TAn1+rBMwwWTjkikNKMkAJ9b9q8reuFGNCMlD+dOXlKFhbcjr1f2LL
         HLPw==
X-Gm-Message-State: AC+VfDz7iKQfDgDMWtKmgkopkpAIkFVkMlgQZ/k5hQ3qlZVWhRDsRhWX
	epCjPVhEHiLELJ8at8QQTl9tPN3ouQHGet1c2IU=
X-Google-Smtp-Source: ACHHUZ6V2oyzYSC9B8OgIPn2MIpfB098Yw//lpK0uP02DNwlKin+3aIcnmVspzn0674k6LFbXQu1RHfDfYo4IpheSfk=
X-Received: by 2002:ad4:5baa:0:b0:626:1be5:1777 with SMTP id
 10-20020ad45baa000000b006261be51777mr1296836qvq.52.1685444558153; Tue, 30 May
 2023 04:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230524160352.19704-1-osmtendev@gmail.com> <87v8gajeni.fsf@kernel.org>
In-Reply-To: <87v8gajeni.fsf@kernel.org>
From: Osama Muhammad <osmtendev@gmail.com>
Date: Tue, 30 May 2023 16:02:27 +0500
Message-ID: <CAK6rUAPUKNREyYL-d5Y23SOV__-zPY8KJL+MMzWX8ShOhDGWLA@mail.gmail.com>
Subject: Re: [PATCH] debugfs.c: Fix error checking for debugfs_create_dir
To: Kalle Valo <kvalo@kernel.org>
Cc: nbd@nbd.name, ryder.lee@mediatek.com, lorenzo@kernel.org, 
	shayne.chen@mediatek.com, davem@davemloft.net, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_040241_582085_82AD94A3 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

I will keep that in mind and send with the right subject while
submitting a revision of the patch.

Regarding the patch after researching more into it I have come to know
that the debugfs
API will not return null on error but an ERR_PTR. The modern wisdom
about it is to ignore the errors returned by the function as stated in
the comment  above the function debugfs_create_file.

> * NOTE: it's expected that most callers should _ignore_ the errors returned
 >* by this function. Other debugfs functions handle the fact that the "dentry"
 >* passed to them could be an error and they don't crash in that case.
> * Drivers should generally work fine even if debugfs fails to init anyway.
Here is the link to comment :-
https://elixir.bootlin.com/linux/latest/source/fs/debugfs/inode.c#L451

Considering this, I will send the revision of the patch by removing
error checks. Please correct me if  there are any concerns with this.

Thanks,
Osmten

On Tue, 30 May 2023 at 15:29, Kalle Valo <kvalo@kernel.org> wrote:
>
> Osama Muhammad <osmtendev@gmail.com> writes:
>
> > This patch fixes the error checking in debugfs.c in
> > debugfs_create_dir. The correct way to check if an error occurred
> > is using 'IS_ERR' inline function.
> >
> > Signed-off-by: Osama Muhammad <osmtendev@gmail.com>
>
> The title is wrong, please see the wiki page below how to create titles.
>
> Also no need to say "This patch fixes..", saying "Fix..." is enough.
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

