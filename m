Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 059ECF99C73
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Apr 2026 03:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G+ETtzwm86y2ubyHKvTZyBSdg3SjvxcOgxe973ohm5w=; b=XV+4K+uYyrcU9ljU2rN5WDadTe
	ZvoklDiZb3eByJCb0uSrd3o7wsuAx0LPolctiBsE/hXHxcttUox/RP7EsDunXQ5bvgEz+d19gyYcl
	ycnuACZvdwYZYe96isgbxhTmznQ5S1B51u0NszqFc/as/0BWAy3VngDvsCvsSxnrdCD+jCPPE83Bp
	24Kq8wHWIa334QzOktfnTdDjd23r5bHVpPQizoYpIRpaPoCgL+d4LrsO5rcAwKyACM6dsSlVa3k2t
	oLJu6z7KaC4eXHXDKOO4hZnwB9U1Uw908wujOxBYkfsBSOdhaVvS+P10nWncRp+mAGtF9e60axYsJ
	lxFyVI9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDwWR-00000004i6O-17UO;
	Sat, 18 Apr 2026 03:39:07 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDwWO-00000004i5e-3pcW
	for linux-mediatek@lists.infradead.org;
	Sat, 18 Apr 2026 03:39:06 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-c7973e22399so541412a12.0
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Apr 2026 20:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776483543; x=1777088343; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+ETtzwm86y2ubyHKvTZyBSdg3SjvxcOgxe973ohm5w=;
        b=sHwSnBuUdOE6NYJlTrmyIQVgahl3OAL2p6r5aIWY4c98UKT+++YwChzTaa9HBMwSuF
         IPsvCYc1WfqEiUO/czTm01lo0j87feT1ePP1JX7Nv5vYNtltBy+2Rko3gp05jo4VsnhA
         JA13RPyIJwWVyB3iGk1Rdr9++ZftgurOzfuXurkbyIrG6KYi0IaHz1gksWGWBd9jTkxT
         Imrasvba/MQ/8rzYU4iY4NCw00Ok2rIw8g5OEqmnjW91YOWy8Iqje2c8+6uDZOEzztk9
         fht347KLDEeALh8BbRPtWnbS0sZGololOguuRYjmGXttTaMph+3eF9HgzZi3tIrD2klD
         lNsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776483543; x=1777088343;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G+ETtzwm86y2ubyHKvTZyBSdg3SjvxcOgxe973ohm5w=;
        b=GJn+5r2/nXvsYcYU0HyRwL3coY0GRf3saUAvVwKnDDX/hnJvgSMsQSbrtiZKYQeNCS
         k1y/tqTxMcnz0fbLteeJMGAVEsDVo/vnlbboyvMI6iqlo9jbGKNtYk9nTgQNM9EDpsZW
         8TgRuTqEnxFMHn5FHK8yC7NatEiVdePnFWjqIrZO1JN0FWSvKOYi/Uh2eTvahWgwcHaH
         IqA2as9S0GObSTg9pWJjliNdinTH+vTeb4Ftfkgj4attVuKST3trlDIn53YKuHu2lWn1
         U0uAu4cBiEoyHDJHe5U3WhgHXcBMfEoz0tX8SUzWsKSn6f5eDIf3JFTkWYn2/AMl36/d
         RClQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Z2rOnTKpXXbw2tJEC30WivVPHFdthvX0kjpZR3BMVbc8/uuvv8LQ3SpbykVQSLjI4lBd8JxITCJe5FisZaw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxjGBIeV9HmJSrqvfsawonayKXThKsPOInzL5IeCyvJKuMjNEZi
	gZxwGnwFx7afJPzZ3AuzrQAzhpUzbcO5UpHWVOvMyHtkydgy17Toj+0UJcmL2ThHnuGpr40Er6w
	MwBijOM8TX/8XonaxgMA/JXDGgA==
X-Received: from pgbfp6.prod.google.com ([2002:a05:6a02:2ce6:b0:c76:a6b1:ed23])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6300:8088:b0:39f:216:f400 with SMTP id adf61e73a8af0-3a08d708cc3mr4939472637.14.1776483542721;
 Fri, 17 Apr 2026 20:39:02 -0700 (PDT)
Date: Sat, 18 Apr 2026 03:38:59 +0000
In-Reply-To: <CABb+yY2yBZ+hgr-=Uh_sRk-TJZRfsk2AYtoS5rPtUN8kVsUScA@mail.gmail.com>
Mime-Version: 1.0
References: <CABb+yY2yBZ+hgr-=Uh_sRk-TJZRfsk2AYtoS5rPtUN8kVsUScA@mail.gmail.com>
X-Mailer: git-send-email 2.54.0.rc1.555.g9c883467ad-goog
Message-ID: <20260418033900.3652042-1-joonwonkang@google.com>
Subject: Re: [PATCH v3 2/2] mailbox: Make mbox_send_message() return error
 code when tx fails
From: Joonwon Kang <joonwonkang@google.com>
To: jassisinghbrar@gmail.com
Cc: akpm@linux-foundation.org, angelogioacchino.delregno@collabora.com, 
	jonathanh@nvidia.com, joonwonkang@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	matthias.bgg@gmail.com, stable@vger.kernel.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_203905_094562_2B5F7525 
X-CRM114-Status: GOOD (  37.65  )
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

> On Fri, Apr 17, 2026 at 3:43=E2=80=AFAM Joonwon Kang <joonwonkang@google.=
com> wrote:
> >
> > > On Fri, Apr 3, 2026 at 10:19=E2=80=AFAM Joonwon Kang <joonwonkang@goo=
gle.com> wrote:
> > > >
> > > > > On Thu, Apr 2, 2026 at 12:07=E2=80=AFPM Joonwon Kang <joonwonkang=
@google.com> wrote:
> > > > > >
> > > > > > When the mailbox controller failed transmitting message, the er=
ror code
> > > > > > was only passed to the client's tx done handler and not to
> > > > > > mbox_send_message(). For this reason, the function could return=
 a false
> > > > > > success. This commit resolves the issue by introducing the tx s=
tatus and
> > > > > > checking it before mbox_send_message() returns.
> > > > > >
> > > > > Can you please share the scenario when this becomes necessary? Th=
is
> > > > > can potentially change the ground underneath some clients, so we =
have
> > > > > to be sure this is really useful.
> > > >
> > > > I would say the problem here is generic enough to apply to all the =
cases where
> > > > the send result needs to be checked. Since the return value of the =
send API is
> > > > not the real send result, any users who believe that this blocking =
send API
> > > > will return the real send result could fall for that. For example, =
users may
> > > > think the send was successful even though it was not actually. I be=
lieve it is
> > > > uncommon that users have to register a callback solely to get the s=
end result
> > > > even though they are using the blocking send API already. Also, I g=
uess there
> > > > is no special reason why only the mailbox send API should work this=
 way among
> > > > other typical blocking send APIs. For these reasons, this patch mak=
es the send
> > > > API return the real send result. This way, users will not need to r=
egister the
> > > > redundant callback and I think the return value will align with the=
ir common
> > > > expectation.
> > > >
> > > Clients submit a message into the Mailbox subsystem to be sent out to
> > > the remote side which can happen immediately or later.
> > > If submission fails, clients get immediately notified. If transmissio=
n
> > > fails (which is now internal to the subsystem) it is reported to the
> > > client by a callback.
> > > If the API was called mbox_submit_message (which it actually is)
> > > instead of mbox_send_message, there would be no confusion.
> > > We can argue how good/bad the current implementation is, but the fact
> > > is that it is here. And I am reluctant to cause churn without good
> > > reason.
> > > Again, as I said, any, _legal_, setup scenario will help me come over
> > > my reluctance.
> > >
> > > Thanks
> > > Jassi
> >
> > Hi Jassi, can we continue discussing this issue from where we left off =
last
> > time?
> >
> Long passionate essays are difficult to read, so I haven't yet. A
> simple description of some setup that you think is not supported, will
> keep the discussion focused.
> If your platform is supported but you think the api is not clear,
> updates to the documentation are welcome

Sorry that it was hard for you to read. The long form was to explain what i=
s
misaligned and problematic with data and examples for better understanding
because your previous long essays did not make much sense to me. Please go
through it and let me know if anything is unclear to you. In the mean time,=
 I
will prepare a new version of patch with some update to the API doc.

Thanks,
Joonwon Kang

