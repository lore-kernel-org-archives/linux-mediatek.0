Return-Path: <SRS0=xNtl=OL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7038FC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Sep 2021 20:13:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 266C861100
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Sep 2021 20:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 266C861100
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=koeoET9Kml8qx646SE3G+Uoai8dDArni+Nch0SsCJ3U=; b=U/Pj35DKneZLf6
	jwyJ4tOPISzx90nLRVH+0TDUHpQHNodDZc+lVKh8/yIvvb8DcSAY07HJZQKQvhEk/hEwojudKPNdf
	ls/wDI4mquRgXtX8twMryF06qJWLWavUHTaL2jaZNiMdRgdGW6Zzt9P0u4BN9M84tf4PjhsvnxctG
	TNwAyG1aPaAwu0nkV3DVCUS+6i23UwnSy5+enmGu8PS4VtrsEfTNGqkQBxQX5cT4mZ8nSoXmiH7DV
	T4o0Al1ZsHJgkZlCY41LC88Q+WrIupenOcGgfJXzYQZsFZGa7RFXS4knDvx2avf0JYhIDCyWl8UGx
	9LuOXSJ2QMN7dzGI0yXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSm8R-005grx-62; Tue, 21 Sep 2021 20:12:59 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSm8M-005gqd-AP
 for linux-mediatek@lists.infradead.org; Tue, 21 Sep 2021 20:12:56 +0000
Received: by mail-pj1-x1033.google.com with SMTP id dw14so418298pjb.1
 for <linux-mediatek@lists.infradead.org>; Tue, 21 Sep 2021 13:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vl75DagWXnUNTjQ1RM6YlSoItnxX94Uk5/hqJPmHyJU=;
 b=I/qz8GnNcrbNEqxPNTRxXrd/BKi6Ma+0lXEGQe/CIq5lpmUmpuMH696cxuL35WmdF8
 LNBTe5GcfB370Qv71qnjVn4ZhkvxnPP/9so6TlzQQ5C2QMdGoGH6wsT5fT1BqHgUH0uj
 6HgM/NcUq6DXo2GQLmP46XDtV62jeCkJLF8AE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vl75DagWXnUNTjQ1RM6YlSoItnxX94Uk5/hqJPmHyJU=;
 b=SfNVjjOBDaRLS1qAn0YyFRTeSyZEzvO2vdK/588QDlnfVfQyu0cJTxJ4Xfy6oaKkuw
 i36P/LXFI+qvDxQydCWjRlJWT5fO+FmInkXzX9kzATOWNm6MTWi/inNDjwdT98t6mp5k
 77XrqUjDByUZxjTn76OD1XAUdIloKovwlh1FV9gzVXtKtd5JtzBz4xZnKlyRbF3efHF9
 /yYr5wdGkknmBKcaye4rElMbVbUND0p+m/YetbDNZbAlrjdoZWeLP4U7oiRDokt5kOni
 kGAxY/8TzOdHvrJeMANctsE6iygAUvhisQv7Scme1+HOS7sRfFCxK9VCQfvdnFslI9Yz
 I+Wg==
X-Gm-Message-State: AOAM532owvd/jx2H9rcPxF+UcRXWWemq44L55AViN5SNaQAGT4XgXkCp
 54ZA5UolpcPWVl/dZPh8powAZg==
X-Google-Smtp-Source: ABdhPJzb5+j1rA9KpjQ3FqhH1zGoMA4VnVYQqzGH8mO19Cyb72+ef4WEbykAMpnMF0MGf22SbLnYcg==
X-Received: by 2002:a17:90a:353:: with SMTP id 19mr7333779pjf.83.1632255172289; 
 Tue, 21 Sep 2021 13:12:52 -0700 (PDT)
Received: from lbrmn-mmayer.ric.broadcom.net ([192.19.228.250])
 by smtp.gmail.com with ESMTPSA id v12sm11903pjd.9.2021.09.21.13.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 13:12:51 -0700 (PDT)
Received: by lbrmn-mmayer.ric.broadcom.net (Postfix, from userid 1000)
 id A367929D3B19; Tue, 21 Sep 2021 13:06:09 -0700 (PDT)
Date: Tue, 21 Sep 2021 13:06:09 -0700
From: Markus Mayer <mmayer@broadcom.com>
To: Miles Chen <miles.chen@mediatek.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Kubecek <mkubecek@suse.cz>,
 Jisheng Zhang <jszhang3@mail.ustc.edu.cn>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jisheng Zhang <jszhang@kernel.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wsd_upstream@mediatek.com
Subject: Re: [PATCH] scripts/sorttable: riscv: fix undelcred identifier
 'EM_RISCV' error
Message-ID: <20210921200609.GA919124@lbrmn-mmayer.ric.broadcom.net>
References: <20210913030625.4525-1-miles.chen@mediatek.com>
 <20210915215432.02a5e08e@xhacker>
 <20210915160526.tittz3fewddjrqu3@lion.mk-sys.cz>
 <b96f2415d14bcf00338b036155ea7f54b25d9a6d.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b96f2415d14bcf00338b036155ea7f54b25d9a6d.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_131254_496343_0B4B73B2 
X-CRM114-Status: GOOD (  30.86  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Sep 17, 2021 at 12:27:24PM +0800, Miles Chen wrote:
> cc Andrew,
> 
> On Wed, 2021-09-15 at 18:05 +0200, Michal Kubecek wrote:
> > On Wed, Sep 15, 2021 at 09:54:32PM +0800, Jisheng Zhang wrote:
> > > On Mon, 13 Sep 2021 11:06:25 +0800
> > > Miles Chen <miles.chen@mediatek.com> wrote:
> > > 
> > > > Fix the following build break by adding a conditional
> > > > definition of EM_RISCV in order to allow cross-compilation on
> > > > machines which do not have EM_RISCV definition in their host.
> > > > 
> > > > build break log from [1]:
> > > > scripts/sorttable.c:352:7: error: use of undeclared identifier
> > > > 'EM_RISCV'
> > > 
> > > Looks strange I can't reproduce it.  FWICT, this may be seen with
> > > some old toolchains.
> > 
> > I checked the history and EM_RISCV was added to <elf.h> in glibc
> > 2.24 so builds on systems with glibc headers < 2.24 should show
> > this error.

This is happening for us when we try to build ARM(64) cross-builds on
Ubuntu 16.04. Yes, I know, that's a fairly old distro. At the same
time it isn't ancient (extended support is still available), and it
*should* be possible to build the 5.15 kernel on it.

And yes, some of our build machines have been updated to Ubuntu 20.04,
but not all of them. We'll get there eventually. For now this error is
posing a bit of a problem.

> > Michal
> > 
> > > > [1] 
> > > > https://urldefense.com/v3/__https://lore.kernel.org/lkml/e8965b25-f15b-c7b4-748c-d207dda9c8e8@i2se.com/__;!!CTRNKA9wMg0ARbw!2wBeUUDf3Z2m7uJLF51GeZnBFWXRlEQrzGJ72JWIT0MPUcS_RgW98QWTXkEjy9-lhg$
> > > >  
> > > > 
> > > > Cc: Jisheng Zhang <jszhang@kernel.org>
> > > > Reported-by: Stefan Wahren <stefan.wahren@i2se.com>
> > > > Fixes: 54fed35fd393 ("riscv: Enable BUILDTIME_TABLE_SORT")
> > > > Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> > > 
> > > Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
> 
> 
> Hi Andrew,
> 
> I cannot find the maintainer for scripts/sorttable.c, would you pick
> up this change, please?

Yes, please. I've been looking at failed nightly builds since September
12. It's only a forward looking build (so nothing mission critical),
but it would still be nice to have it build again.

Regards,
-Markus
 
> thanks
> Miles
> 
> > > 
> > > > ---
> > > >  scripts/sorttable.c | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > > 
> > > > diff --git a/scripts/sorttable.c b/scripts/sorttable.c
> > > > index f355869c65cd..6ee4fa882919 100644
> > > > --- a/scripts/sorttable.c
> > > > +++ b/scripts/sorttable.c
> > > > @@ -54,6 +54,10 @@
> > > >  #define EM_ARCV2	195
> > > >  #endif
> > > >  
> > > > +#ifndef EM_RISCV
> > > > +#define EM_RISCV	243
> > > > +#endif
> > > > +
> > > >  static uint32_t (*r)(const uint32_t *);
> > > >  static uint16_t (*r2)(const uint16_t *);
> > > >  static uint64_t (*r8)(const uint64_t *);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
