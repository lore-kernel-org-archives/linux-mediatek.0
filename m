Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611DDC0032E
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 18:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJP3exTpHoNYEw/4xkY7H/xfld7IzY+KbGZCq5/4uIM=; b=Du+ZeBhsV91qvcCVlvQJEo4UMN
	wplhQWSbkVTK87NO4TvzUC3lZxPiqs5iCDa0HCNQxGP2LUfiVHu1pN8nsRo1+b40+5PYF1lh99l1l
	mkIVTkGsp/lR2sqiwXscWHSYaOpVWtv8iGB+MnWxvNvaxx22Hv2nGxdyRDegbYacSkrD3geAKkbRS
	S5qOz3yjMwtdJg7zZDpdf60pRrgN8MEYMtPYBpjAh3DKhmnwkLLligiHmvcKKBH5zRwI2+99Miqra
	CdNWgRKRZW/OyuJrHnO9iLV/MkSFzjpAMpKvBdIctxalSx0BuiywgdOUT+5TnZeDib1miA5+0EK9r
	iYwdHjVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qviVc-00Cr7b-0Q;
	Wed, 25 Oct 2023 18:21:36 +0000
Received: from mail-oo1-f41.google.com ([209.85.161.41])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qviVZ-00Cr75-20;
	Wed, 25 Oct 2023 18:21:35 +0000
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5845b7ee438so11219eaf.1;
        Wed, 25 Oct 2023 11:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698258091; x=1698862891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hJP3exTpHoNYEw/4xkY7H/xfld7IzY+KbGZCq5/4uIM=;
        b=Q8LWOtuLhq82wdwRpYhVE+i4EXVB0IV+2/VJHE6mGgjk4bMYPWjhlsJctArD5ZkJEg
         5njn6r6lFb9dwz/9JdWmkdvYeWj9HkYAgjmwAXjKgsUMf/j3QPq10t/BEqCC6TV8MZKy
         n6lankLrZe9CdfzCkOKn3qYqHwoL5kckfzk50XvtPvts9XP9bVu8JFrnGhZUv1hI/GDk
         AfTnXs377nti7Yf2/A7hmg2xsmShlpIC7OGviF5k/jx6lALuqO38/PtCaCUkM2rPR1E6
         WzRH1lr8W0DSU/badnHRrMgecZ4mFGmLzE07dYeIwY82jjqd9vcWjVoLpr0/mJSmJbdj
         71DQ==
X-Gm-Message-State: AOJu0YxeVq1oJWxPhJboZGCEYnU2KF1zDB+UheeLW1NotWQE/j1pRu2G
	FfZ1THgkcHYF2TVBgDaX7jHSw82lR+Tm679Nbdw=
X-Google-Smtp-Source: AGHT+IE+CaOUFZcFyjiAi786fFQlNLiN1pR6zgonMuMC+C3tqb97Fo8IXQNJTHsDlFw3uFwIgFs2fQ0e3icA23qUFGc=
X-Received: by 2002:a05:6870:fb86:b0:1e9:e605:27a1 with SMTP id
 kv6-20020a056870fb8600b001e9e60527a1mr17719277oab.2.1698258091022; Wed, 25
 Oct 2023 11:21:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230916113327.85693-1-bo.ye@mediatek.com> <542a64a842d715329b35654db908681e074b0db5.camel@mediatek.com>
 <148c8e2d10bbb932177f732dfc44230681dc4d91.camel@mediatek.com>
In-Reply-To: <148c8e2d10bbb932177f732dfc44230681dc4d91.camel@mediatek.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 25 Oct 2023 20:21:20 +0200
Message-ID: <CAJZ5v0hSeCcpOr4qOpji8sbN89GnsYYc1pYBhV+LmS=TiJQMnA@mail.gmail.com>
Subject: Re: [PATCH] thermal: Fix potential race condition in suspend/resume
To: =?UTF-8?B?Qm8gWWUgKOWPtuazoik=?= <Bo.Ye@mediatek.com>
Cc: "rui.zhang@intel.com" <rui.zhang@intel.com>, 
	"daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	"amitk@kernel.org" <amitk@kernel.org>, "rafael@kernel.org" <rafael@kernel.org>, 
	=?UTF-8?B?WW9uZ2RvbmcgWmhhbmcgKOW8oOawuOS4nCk=?= <Yongdong.Zhang@mediatek.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	=?UTF-8?B?QnJvd3NlIFpoYW5nICjlvKDno4op?= <Browse.Zhang@mediatek.com>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
	=?UTF-8?B?WXVnYW5nIFdhbmcgKOeOi+eOieWImik=?= <Yugang.Wang@mediatek.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_112133_679929_6549C812 
X-CRM114-Status: GOOD (  33.03  )
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

On Mon, Oct 23, 2023 at 3:20=E2=80=AFAM Bo Ye (=E5=8F=B6=E6=B3=A2) <Bo.Ye@m=
ediatek.com> wrote:
>
> Yes, it is observed issue.

It does happen, so it's not just "potential" and the subject of the
patch is slightly misleading.  Please adjust it.

> Firstly, it needs to be clarified that this issue occurs in a real-
> world environment. By analyzing the logs, we inferred that the issue
> occurred just as the system was entering suspend mode, and the user was
> switching the thermal policy (this action causes all thermal zones to
> unregister/register). In addition, we conducted degradation tests and
> also reproduced this issue. The specific method is to first switch the
> thermal policy through a command, and then immediately put the system
> into suspend state through another command. This method can also
> reproduce the issue.

OK, so please add this information to the patch changelog.

> On Thu, 2023-10-12 at 07:35 +0000, Bo Ye (=E5=8F=B6=E6=B3=A2) wrote:
> > On Sat, 2023-09-16 at 19:33 +0800, Bo Ye wrote:
> >
> > Correct mail title format: remove "Subject:" from mail title.
> >
> > > From: "yugang.wang" <yugang.wang@mediatek.com>
> > >
> > > Body:
> > > This patch fixes a race condition during system resume. It occurs
> > > if
> > > the system is exiting a suspend state and a user is trying to
> > > register/unregister a thermal zone concurrently. The root cause is
> > > that both actions access the `thermal_tz_list`.
> > >
> > > In detail:
> > >
> > > 1. At PM_POST_SUSPEND during the resume, the system reads all
> > > thermal
> > >    zones in `thermal_tz_list`, then resets and updates their
> > >    temperatures.
> > > 2. When registering/unregistering a thermal zone, the
> > >    `thermal_tz_list` gets manipulated.
> > >
> > > These two actions might occur concurrently, causing a race
> > > condition.
> > > To solve this issue, we introduce a mutex lock to protect
> > > `thermal_tz_list` from being modified while it's being read and
> > > updated during the resume from suspend.
> > >
> > > Kernel oops excerpt related to this fix:
> > >
> > > [ 5201.869845] [T316822] pc: [0xffffffeb7d4876f0]
> > > mutex_lock+0x34/0x170
> > > [ 5201.869856] [T316822] lr: [0xffffffeb7ca98a84]
> > > thermal_pm_notify+0xd4/0x26c
> > > [... cut for brevity ...]
> > > [ 5201.871061] [T316822]  suspend_prepare+0x150/0x470
> > > [ 5201.871067] [T316822]  enter_state+0x84/0x6f4
> > > [ 5201.871076] [T316822]  state_store+0x15c/0x1e8

Well, the connection between the above log snippet and the issue
addressed by the patch is rather hard to establish.  Please include
more of the oops information.

> > >
> > > Change-Id: Ifdbdecba17093f91eab7e36ce04b46d311ca6568
> > > Signed-off-by: yugang.wang <yugang.wang@mediatek.com>
> > > Signed-off-by: Bo Ye <bo.ye@mediatek.com>
> > > ---
> > >  drivers/thermal/thermal_core.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/thermal/thermal_core.c
> > > b/drivers/thermal/thermal_core.c
> > > index 8717a3343512..a7a18ed57b6d 100644
> > > --- a/drivers/thermal/thermal_core.c
> > > +++ b/drivers/thermal/thermal_core.c
> > > @@ -1529,12 +1529,14 @@ static int thermal_pm_notify(struct
> > > notifier_block *nb,
> > >     case PM_POST_HIBERNATION:
> > >     case PM_POST_RESTORE:
> > >     case PM_POST_SUSPEND:
> > > +           mutex_lock(&thermal_list_lock);
> > >             atomic_set(&in_suspend, 0);

It is not clear to me why the above statement needs to be under the lock.

> > >             list_for_each_entry(tz, &thermal_tz_list, node) {
> > >                     thermal_zone_device_init(tz);
> > >                     thermal_zone_device_update(tz,
> > >                                                THERMAL_EVENT_UNSPEC
> > > IFIED);
> > >             }
> > > +           mutex_unlock(&thermal_list_lock);
> > >             break;
> > >     default:
> > >             break;

