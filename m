Return-Path: <SRS0=1nN3=KH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 706B3C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 16:15:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B18B061E81
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 16:15:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B18B061E81
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fEWCwlax3f2ytwtfl+nmvSBS3ugrB9xC0Bjx1Z3dipE=; b=PAcgsrBeC/K0kx0XwdvBWiLoV
	PAB+NCeZk0XvaTF6F3phD+4SxjkPlwOHTm/gZLYeAcrZLRsk6Xq23w1z1znMK+bxiHAp0pu1NFXpQ
	Mm4TYLKQyygVWdFUMPIhA6jstTdG/2eKPV5qSABksD9AL9L+pqTHOpRdn3oBgjplM4T9++L4efEHu
	ns29sNLWlapYpWXLLi4+T79M672oygJ/KPAX3GwznWYsW3uOjaxBrsO172dDw2qFQgqUii7DgbYDb
	dYtayNtNNvuLZt5EitN9hN8jFWxauj40uELZcV5+By7mIhg9pO2+OprEsM1B/uM6Eha8jRff0a+ZW
	2QY0r/P3g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgrWG-003IU2-LD; Wed, 12 May 2021 16:15:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgrW5-003ISS-Qg; Wed, 12 May 2021 16:15:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=4dXRt3gBqmG1lnWDQNvq4bNc22ow7fsbIt7uW/qj3fQ=; b=W1fNYr+NLW0Jx+JwPySjXQeRai
 gwy98bhAnfYwANqR7fX3twHC7/P23eYChqurPxZx48V3N7cW4cOcZFfZiW0Xytx6SWp+FcyRhPJEy
 381PnhNgcBdnwgxnSUCD4TjJ30eR6tcysoaKYzMR2ny4wQ43o8efiBSulnE5qCyBkkPXq27eIENbo
 3wjzsuWqyj+p9R9Yftd4dXGo+l8ldKoeWI70CwJe5qX1ktuL9HtRZKBXRszykbBnmv+ADTKFXIQvI
 tzFTvfrU3lIGj6dhFpBc4DWoPD8cdQoN1mvwlYEPpU/zUyCmIOUSXdIMGp8ZY3bRH+m+7WE3ThzDC
 cl3SIBfg==;
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgrW2-00AZvL-TP; Wed, 12 May 2021 16:15:20 +0000
Received: by mail-pl1-x62a.google.com with SMTP id b3so12754359plg.11;
 Wed, 12 May 2021 09:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4dXRt3gBqmG1lnWDQNvq4bNc22ow7fsbIt7uW/qj3fQ=;
 b=DzrSBX4cBxQIUymkfhZIREDWeEUnkqcStbEHBIbNGyIV7ZGaeyX2QhZG/fu3oaEQnE
 pV1eSDourdYjCM4f/C2lzNYRbdfcJP6VNoyN8kPsuFKcoyAZdxWsVOsVQlPssil0QSfH
 Del2xpuUqsfGIcuutKAIuUCAFFo5nLaRlGoW+X2K7Gbcl8Fefa9GWpQzphdsez8JnDJa
 7PomwyhYsS5s72fiOuP9gKk24CLSPR29dIVFqYxZqgGUWRNh0sw3bltaKdw6GSTe0OMM
 aCCwGDxE5OYk9AGLVBZjADFzzvmyXfyJGCBPo6CaNE2UMb3taYAUS6vT0BTlRwHv796H
 n/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4dXRt3gBqmG1lnWDQNvq4bNc22ow7fsbIt7uW/qj3fQ=;
 b=NAI9OG6+yGKwyVAyfLtUs5wXknCH0GhpA8yIzzvJSvWGFL8LmtGFbhIUkpCFyPJCbX
 tVZUGYOr+fsuLPoKToyOiTpFMWPideobzEuaG3ibHgBG0IqUVW8rF2KIAiBtoeu3VMjB
 AgZMk1835UPMtD4tfW23MviiKn6ymGrKkWBv/Yt98sOl5iS1emTm9TEvM6DN1uzAfKi8
 8AJtNYYr45G99vbJVeAg0IUl9hJWn8e2e6AQrDtjEWJ6Mr6SVJrtPIZ5FOa7fgR4mq1W
 epx52yhoqJSJ+IhTsa4+1GFR3LplNp4BxDhAC+JL3jhAq4/jz/mvJe1/HrRwJ0ZIQPWi
 cdNA==
X-Gm-Message-State: AOAM5307HglknfRC1FSBi2a//dvNz2vn3h4Uahkx5K/vCPG214D1+RRQ
 ijIbDImcxHjah6vLkUOV6FZJOL9NuMFLsBiWuNs=
X-Google-Smtp-Source: ABdhPJwnnQS1P8kn6kX2/fdWBq0IpBA8btxrtuDPjgZ07gZEHD80t4OjpyYLUqwCv+FRfAGG4eNrCOJRMpmybwWDyXU=
X-Received: by 2002:a17:90b:1d8a:: with SMTP id
 pf10mr11636606pjb.145.1620836117765; 
 Wed, 12 May 2021 09:15:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210511113257.2094-1-rocco.yue@mediatek.com>
 <CAM_iQpVWSJ8BdRoLDX0MdiqmJn2dp+U9JM4mcfzRbVn4MZbzcg@mail.gmail.com>
 <1620808712.30754.62.camel@mhfsdcap03>
In-Reply-To: <1620808712.30754.62.camel@mhfsdcap03>
From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Wed, 12 May 2021 09:15:06 -0700
Message-ID: <CAM_iQpXbigquRvTF6nBM5732i_dPZ7YZX7egdRqtvydiiP-6vw@mail.gmail.com>
Subject: Re: [PATCH][v3] rtnetlink: add rtnl_lock debug log
To: "Rocco.Yue" <rocco.yue@mediatek.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Masahiro Yamada <masahiroy@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, 
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 LKML <linux-kernel@vger.kernel.org>, 
 Linux Kernel Network Developers <netdev@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_091518_954355_8D83289F 
X-CRM114-Status: GOOD (  19.64  )
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

On Wed, May 12, 2021 at 1:38 AM Rocco.Yue <rocco.yue@mediatek.com> wrote:
>
> On Tue, 2021-05-11 at 10:00 -0700, Cong Wang wrote:
> > On Tue, May 11, 2021 at 4:46 AM Rocco yue <rocco.yue@mediatek.com> wrote:
> > >
> > > From: Rocco Yue <rocco.yue@mediatek.com>
> > >
> > > We often encounter system hangs caused by certain process
> > > holding rtnl_lock for a long time. Even if there is a lock
> > > detection mechanism in Linux, it is a bit troublesome and
> > > affects the system performance. We hope to add a lightweight
> > > debugging mechanism for detecting rtnl_lock.
> >
> > Any reason why this is specific to RTNL lock? To me holding
> > a mutex lock for a long time is problematic for any mutex.
> > I have seen some fs mutex being held for a long time caused
> > many hung tasks in the system.
> >
> > Thanks.
>
> Thank you for a good question.
>
> It's a problem to hold rtnl_lock for a long time, and other locks are no
> exception.

Then please try to make it generic so that other mutex locks will
benefit too.

Thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
