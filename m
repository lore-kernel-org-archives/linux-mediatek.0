Return-Path: <SRS0=lKUU=7K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D77C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 06:01:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3E7C2071A
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 06:01:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X+JaboD2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AqgX9832"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3E7C2071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Frs1780hJ2sfKv04lHqySxtBVMpfqgyhhP0lCdj3ols=; b=X+JaboD2ZVlfmO
	SkaJoRw5RQFU4WBCbei/TMR37DtKbYJYnlmYnp6LdDj8IgLCMlBPp2o70Le/BgPBTX2KriXXbUr5d
	xbMvbONKV+PpY+pPKbV6ftcy0uIjToF46ThbOm2hoCnA1/KQUDXcad0NnCa9h/9QBkribgMq0S/na
	wOcYXIDsGK+GNI0I+5foZCyt5F3iabYnPZJE59cQyMs98ceG5mGooOA/U05b728t0q+Lcyb96Mg4t
	nps2f0niHNBBfjLbePh8B9CN25HfEv+HtvmYAjhbvUggAE6DmWfV9sw8lzO3eW05k6JtE0FSmSw4h
	AJ68pomOyJNZ/sO0HrlA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeBc0-0008Dk-2J; Thu, 28 May 2020 06:01:52 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeBbx-0008DE-8W
 for linux-mediatek@lists.infradead.org; Thu, 28 May 2020 06:01:50 +0000
Received: by mail-ed1-x543.google.com with SMTP id c35so5870992edf.5
 for <linux-mediatek@lists.infradead.org>; Wed, 27 May 2020 23:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+4G7LztfhKefqislvGUwGcaLm9pBFDOhcjn0F/Q53GA=;
 b=AqgX98324qc7v88oMBNXmxv6ZIWYQ8Q91wG8IRXL86xb3RDlvEjUyyUIfkNMbTZa87
 3aLiJZWfASX81Lh6axF218c69z186jXm1r3nX+w0XFcXm//gwlBuiBQprYUpGvNwtQF1
 7v9qN9dRsqT3mC4foN6sj/rLbegA1ZZgbhTAtoCG1a4xApPa1Fm+ADtgnNcVlQQWOGuD
 EwCNWZtHmuDFiT1pyLNb7gj3n8sCyqCMA/+piGrolDYHymQq+rH0XifEvcbGcFP1JMN3
 p3BRLpG9QtrJEBDe2RNTA/efIUT69m16YzqQ4tskKpTEKsB8+wCmAD7hL9rdutuYxP8t
 GTzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+4G7LztfhKefqislvGUwGcaLm9pBFDOhcjn0F/Q53GA=;
 b=LICJnXldLR+FwcWwTq0CFvU/gRdyr2R3PMu3fDJwypGcfQOnL0rjn95g3otBh0LF4F
 g91P6PdX396QmPgnrnP/kWFfvg5Nj2cB7VKhHWYIwqLKbwmqd1+tTDV5uqBXA3H8nkp6
 xu5r36nf8kSTR2bh1xgYfR6e/3Oumd23UIBHexphc73+XNlh4AX1PMQZ5La8wClKwugr
 8nirLaj0OZZkffri1MEM+0ATVAuKWertlkLwwo8AVenukvYskJkWuhdr75OzZG4hq+Y6
 Acfq1GS7myQeeToeGDpEYhbcI+nCIjLFW43n1DdyFprneX6zvSwS9czPpoR+jsVWLNHJ
 PTVg==
X-Gm-Message-State: AOAM531u7EvSKBXUu0jfgeW8enficizEr6sHN36vmT3o7pMim7EXZxMJ
 OokCR1xHc67aRmM6FH4MVZCPc+qLYJWT3HIkPtg=
X-Google-Smtp-Source: ABdhPJwIk1Z2LwvbqGSnf8PWVoUKndg0g1dzxhJ5rxuKA894xH0b5zaDXP/mOvPqmIXLsQ2D8KrHPxM8vVGTDq9e1aA=
X-Received: by 2002:a50:9547:: with SMTP id v7mr1564141eda.78.1590645706837;
 Wed, 27 May 2020 23:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAAOTY_8tz9nNbCHFJhk9xX8fm9Jd8ETcdNCQfE31AOjZLpNKog@mail.gmail.com>
 <CAPM=9txm_fdy_+Kg=cdXe5SosbYBoXHtsDWYMFm2WQh1QtC_YQ@mail.gmail.com>
 <CAPM=9tzqQ5G82mSACX5speUF2j-8vz7SrOcj7XLsKCjhe3GT6A@mail.gmail.com>
 <9870ea53-cdd9-e34c-dcbd-f087f5abf619@gmail.com>
In-Reply-To: <9870ea53-cdd9-e34c-dcbd-f087f5abf619@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 28 May 2020 16:01:34 +1000
Message-ID: <CAPM=9tw9zn5tCw_tGVgn53Si2NXsVC35JmU_NwBE3NKVvfsfCw@mail.gmail.com>
Subject: Re: [GIT PULL v2] mediatek drm next for 5.8
To: Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_230149_302506_17B1B253 
X-CRM114-Status: GOOD (  19.59  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 David Airlie <airlied@linux.ie>, Bernard Zhao <bernard@vivo.com>,
 YueHaibing <yuehaibing@huawei.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Anand K Mistry <amistry@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 23 May 2020 at 01:58, Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 20/05/2020 07:46, Dave Airlie wrote:
> > On Wed, 20 May 2020 at 15:44, Dave Airlie <airlied@gmail.com> wrote:
> >>
> >> On Mon, 18 May 2020 at 10:06, Chun-Kuang Hu <chunkuang.hu@kernel.org> wrote:
> >>>
> >>> Hi, Dave & Daniel:
> >>>
> >>> This include dpi pin mode swap, config mipi_tx current and impedance,
> >>> and some fixup. I drop drm_bridge patches in this version.
> >>>
> >>> The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:
> >>>   Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)
> >>> are available in the Git repository at:
> >>>   https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git
> >>> tags/mediatek-drm-next-5.8
> >>> for you to fetch changes up to 007d274a017bb4e2ef7b922c2f54f40cf2073664:
> >>
> >> Did you edit this by hand or pass it through some mailserver that
> >> chewed it up, I had to reconstruct this pull from the above bits, I've
> >> no idea why it's so messed up in the first place.
> >
> > and why does it contain an unexplained backmerge?
> >
> >  Merge tag 'v5.7-next-drm-stable' of
> > ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux
> > into mediatek-drm-next
> >
> > Please don't ever backmerge fixes into next pull, without a long
> > explaination or if you really need it ask us first,
>
> It's not fixes. I suppose my tagging strategy helps to create confusion. The tag
> is v5.7-*next*, which relates to v5.8 (next version after v5.7). Maybe not the
> best way to do it.
>
> We had to merge a series that changed the drivers/gpu/drm, drivers/soc and
> drivers/clk.
> So I took the series through my branch and Chun-Kuang merged a stable tag in his
> branch so that he can take commits on top of this changes.
>
> Maybe the explanation comes too late, but I just wanted to clarify.

Okay so whenever a submaintainer tree has a merge in it, two things
need to happen.

a) the merge needs a commit msg explaining what it is, why it's there.
b) the subsequent pull request should mention it's existence.

I'm not used to pulling trees from submaintainers with merges in them
and usually it's a red flag that they've backmerged something they
shouldn't have.

Dave.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
