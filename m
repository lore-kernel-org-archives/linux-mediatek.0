Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4864F8DFEA
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Apr 2026 08:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JMis1PWBmQ2nY0YUn8Z/PvKMUmrRKtNhJv6gZchAt+s=; b=w2GGByV6NtswY9SVkiwoOsuFuK
	BgyuiPqyOwBcweKYaAcEPxdyFYSt1bKou3fJo1ZVULPmjzCYYMJr4V6VWZPUCpZhzxrT75tcYJZhB
	k1ddoYtPeCyNNZQ2m7UoiVFQAyjhrX0v3qjbiznYBzL3lggXHRiLzS6b+p6K81tZLS59dIpnbP0Z0
	srvRKHub6434e/tgfFEg/YmX8EpVIbBq44Ewlzso4Uu94zTOSbEp6PQ+WkBGvMdyHWiWriQeu25k/
	r7aiO61XCA7dwXm1HizTLTeua1ywpyBFHV5w+BaK3+29PW8UBHf7Jda5RHWpFXff/ZQk3uXhN1/KJ
	mWCm1Z8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDend-00000003hLW-2JWL;
	Fri, 17 Apr 2026 08:43:41 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDena-00000003hKf-3ByV
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Apr 2026 08:43:39 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-c7977177675so220457a12.0
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Apr 2026 01:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776415417; x=1777020217; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JMis1PWBmQ2nY0YUn8Z/PvKMUmrRKtNhJv6gZchAt+s=;
        b=mCDQcMjYPrOryhL5hV01CR1ng7YFC8lUi4M+E+mIpp0sFGMJtN8bpyZU3Z/sHFsLNr
         ljjBEYezSxwZb0A4iykCz4CmtdNLLqvPfdcTg1T3hvINFBEk/cQWdsn0VfnIusXrlT1T
         YPSt0Dv7ZxsTsUzgWYQvnwS3eXubkfxVDwPWB+LlGPFYbvSZFqmkUvrYA7fCXMaHT+6l
         HonKkTvqEq/OPyhHCRVMOi7Okct3lzdtI04J5Bzp4oOLxzWa2hgyFc8YnttC7bqXIUyE
         Q3QRv2L8HExbH24ShttM6fbGghKyHGYyyxxVtxrlNBNzqb5eg6q3gSlTWT4FL/J1AmOY
         m7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776415417; x=1777020217;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JMis1PWBmQ2nY0YUn8Z/PvKMUmrRKtNhJv6gZchAt+s=;
        b=NWxNYSlw79Yrd23DJcCfCfrqo/pFwZ7b/f9+FelFIBxmPWNI7Qt+UasZKFup9ltgV2
         sc8cEDQKNHp/8BqGvVhRuaWvQbG/h1o0app6eV/VqQ+eESXp1UMfeOWpkbg6v+FTuaLb
         PLE8vu/wpw0NYaVofYP7L8yUMsLsuiOqFVaTzZoqddr58fsXuiFcVLytfvrcBKzQYz/b
         CkZRxaj2oDpS98huCxQJFiCclhtkUUdLgn19CPva/GaMWxMO0oimIWcNYoWcvoYnXksJ
         euuUmfIlN9e05tNs6GI7DwxWpchk89h8wNcWkresf9DxWsFwMqCekfn/Cc9saUS23grq
         ZKsQ==
X-Forwarded-Encrypted: i=1; AFNElJ9H/i0GMzIfqbKqlVtT53PwaGGM78iJclL0lxPxmSDtDJ8o2kV6hVqpecDnNx4YTO33/jsV42QSmfu6NEwVGw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBwDJrgFRHBe0C2XbCoCN8lndNdqXJiUX7HT7lWD0dR6fKxJiC
	Ip8j+id2jE+Y4HtlWW6Rk3gSAOxyGzWNZPizWrtbpRT8azXB2UbAtArDwMa4lXNJHL3CSUwURjt
	B1azitZJYkMuSNVx68S72DBEGEA==
X-Received: from pfhx21.prod.google.com ([2002:a05:6a00:1895:b0:82f:7163:35c4])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:a248:b0:82f:316:3208 with SMTP id d2e1a72fcca58-82f8c8fb879mr1813947b3a.29.1776415417107;
 Fri, 17 Apr 2026 01:43:37 -0700 (PDT)
Date: Fri, 17 Apr 2026 08:43:34 +0000
In-Reply-To: <CABb+yY23aTXeXu6G-8sHjw32DCqmhsJLu2Mt-txenOgTBiyv+A@mail.gmail.com>
Mime-Version: 1.0
References: <CABb+yY23aTXeXu6G-8sHjw32DCqmhsJLu2Mt-txenOgTBiyv+A@mail.gmail.com>
X-Mailer: git-send-email 2.54.0.rc1.555.g9c883467ad-goog
Message-ID: <20260417084335.2092188-1-joonwonkang@google.com>
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
X-CRM114-CacheID: sfid-20260417_014338_791340_5C4D265D 
X-CRM114-Status: GOOD (  30.73  )
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

> On Fri, Apr 3, 2026 at 10:19=E2=80=AFAM Joonwon Kang <joonwonkang@google.=
com> wrote:
> >
> > > On Thu, Apr 2, 2026 at 12:07=E2=80=AFPM Joonwon Kang <joonwonkang@goo=
gle.com> wrote:
> > > >
> > > > When the mailbox controller failed transmitting message, the error =
code
> > > > was only passed to the client's tx done handler and not to
> > > > mbox_send_message(). For this reason, the function could return a f=
alse
> > > > success. This commit resolves the issue by introducing the tx statu=
s and
> > > > checking it before mbox_send_message() returns.
> > > >
> > > Can you please share the scenario when this becomes necessary? This
> > > can potentially change the ground underneath some clients, so we have
> > > to be sure this is really useful.
> >
> > I would say the problem here is generic enough to apply to all the case=
s where
> > the send result needs to be checked. Since the return value of the send=
 API is
> > not the real send result, any users who believe that this blocking send=
 API
> > will return the real send result could fall for that. For example, user=
s may
> > think the send was successful even though it was not actually. I believ=
e it is
> > uncommon that users have to register a callback solely to get the send =
result
> > even though they are using the blocking send API already. Also, I guess=
 there
> > is no special reason why only the mailbox send API should work this way=
 among
> > other typical blocking send APIs. For these reasons, this patch makes t=
he send
> > API return the real send result. This way, users will not need to regis=
ter the
> > redundant callback and I think the return value will align with their c=
ommon
> > expectation.
> >
> Clients submit a message into the Mailbox subsystem to be sent out to
> the remote side which can happen immediately or later.
> If submission fails, clients get immediately notified. If transmission
> fails (which is now internal to the subsystem) it is reported to the
> client by a callback.
> If the API was called mbox_submit_message (which it actually is)
> instead of mbox_send_message, there would be no confusion.
> We can argue how good/bad the current implementation is, but the fact
> is that it is here. And I am reluctant to cause churn without good
> reason.
> Again, as I said, any, _legal_, setup scenario will help me come over
> my reluctance.
>=20
> Thanks
> Jassi

Hi Jassi, can we continue discussing this issue from where we left off last
time?

Thanks,
Joonwon Kang

