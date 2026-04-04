Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2BAE88D80
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Apr 2026 11:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0G1qQkwBhPOCSaPNNZcA5R2UExCpSWly+t1LnZq/nHI=; b=kZrrIJEmn/lIzycE/nr98TzhTH
	cnFzcA+WF40fIUJxQ766Z9pCQie/KVOTgyRDP+ccPb4yPlzMqP8+TQtONTohABdOtLR2UXEyqwFwo
	UVba3nXeKjSHBdzSU8qYtYNBYnun1kEiUc+O72WgUIfIM790LUekAeMcBIgcTp3D4E5qsOJxdX6yt
	RJ24uCc3Co/VDYlQpSbrAS7C9FAouJkRdt0FwGlGLeetxjmEj5rZi/NKjIdT4mbc7iAqzVcgX/QsM
	IGsh+mmxik89TmeIjNjTixpBO43dMMdkX7an5io23Gr4tAqDhTTqBao2Pomj3rC2oySpTbyP7GQtu
	LBBiP5cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8zTq-00000003QsN-25d9;
	Sat, 04 Apr 2026 11:47:58 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8zTn-00000003Qri-2uQb
	for linux-mediatek@lists.infradead.org;
	Sat, 04 Apr 2026 11:47:56 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2b2497cc190so23946415ad.0
        for <linux-mediatek@lists.infradead.org>; Sat, 04 Apr 2026 04:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775303274; x=1775908074; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0G1qQkwBhPOCSaPNNZcA5R2UExCpSWly+t1LnZq/nHI=;
        b=Y2enxEnaUeBEdLqeMCqQU2e+w5uIa/6fK4vU+AylPbecMzugHncNsHglNnp7ccEkru
         23Q1e33F8st+XG4KmUsoI2gAmDAzeA6+2Ms61e5Ga0dJ+20mm6I2EQbg3a3a4J0oOSzc
         TLfk2nREdWzm07dnUjYzhONCedt6xQG9VRi07B8NIf2rI03yPcvN173wepffURKoGbtm
         IQIor0qJbQqP0CP50dpKrIwPjIgMpeCpHk+6SR4ULhCdJfM7oFR45FuAPECWUIO6S6tx
         JoIgxAw9FZfSwziYs7wFzCijHgT+OWRdaSjd9x2Kf5ljpvr2Xumt1S6SKyztjdPBqWbP
         IVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775303274; x=1775908074;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0G1qQkwBhPOCSaPNNZcA5R2UExCpSWly+t1LnZq/nHI=;
        b=iLgv+MJNcpVR4jU/60eOD+uuvJK3niG0zWYo8pmxhQW0zNU3gngtwoUon17UZ8ZdwP
         zbGov4A1PHE37OsAc7Ztpw6tManlJ2D3Iq3CIYXYWi9LmacWLigkKH3RHz9aKSQ3mDNs
         xvTJPORMjVSFhuSMxQT+9l9s5aQC5bZY7vQT8CXjsPoLlQSPwX7q0hHLHTa5y7YghiXa
         lYZLckrRiQHwhujX99AnNPnv3SGUQ2vnPJeOx5HMDVXFZUUwwoby3eYs7gYOZzpsdlty
         bNi+1Yr7or/DGEwEg4HJ2y/TQyBDGrnmuVv3LClRIXoViebo25r1RM1+dou3E56sBCoc
         fBmA==
X-Forwarded-Encrypted: i=1; AJvYcCXL9B3Nlubzn8MB8MeeZWynsm0AUT3BUE4VzNVNcOpvsfjXIIeGXLf8pE0F1Dg5G7UCgTUgm6v408NqVUex7w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyY61YOJHoujAQe4lLm6stYYCSoaxxby68/hV35NU7sF1f8zW4s
	/Z57X64sICLlSe0ALZcHcKXtf/E7cz0YpSkAAdn/m+QXdM79f5RW4q4eNl4ArWszRbUIoJRZID4
	jZaiuxQOdWN0hDg6dYy4Dq9fGqQ==
X-Received: from plbjz3.prod.google.com ([2002:a17:903:4303:b0:2b0:6207:5fd3])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2ec8:b0:2b0:aebe:259 with SMTP id d9443c01a7336-2b2821a7fbemr58943675ad.19.1775303273972;
 Sat, 04 Apr 2026 04:47:53 -0700 (PDT)
Date: Sat,  4 Apr 2026 11:47:51 +0000
In-Reply-To: <CABb+yY23aTXeXu6G-8sHjw32DCqmhsJLu2Mt-txenOgTBiyv+A@mail.gmail.com>
Mime-Version: 1.0
References: <CABb+yY23aTXeXu6G-8sHjw32DCqmhsJLu2Mt-txenOgTBiyv+A@mail.gmail.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260404114752.3052748-1-joonwonkang@google.com>
Subject: Re: [PATCH v3 2/2] mailbox: Make mbox_send_message() return error
 code when tx fails
From: Joonwon Kang <joonwonkang@google.com>
To: jassisinghbrar@gmail.com
Cc: akpm@linux-foundation.org, angelogioacchino.delregno@collabora.com, 
	jonathanh@nvidia.com, joonwonkang@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	matthias.bgg@gmail.com, stable@vger.kernel.org, thierry.reding@gmail.com, 
	lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_044755_742993_677ADBC7 
X-CRM114-Status: GOOD (  42.76  )
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

mbox_send_message() in blocking mode is not only for submitting the message=
 in
the first place if we read through the API docs.

From the API doc for `mbox_send_message()`:
```
 * If the client had set 'tx_block', the call will return
 * either when the remote receives the data or when 'tx_tout' millisecs
 * run out.
```

From the API doc for `struct mbox_client`:
```
 * @tx_block:		If the mbox_send_message should block until data is
 *			transmitted.
```

With the docs, I think it is apparent that the API covers "transmission" of=
 the
message, not only submission of it. If sumbitting is the sole purpose of th=
e
API, what does the API block for in the first place? We would not need the
blocking mode at all then.

The current return value of the API in failure cases is as follows:

 - When submission fails, returns failure.
 - When submission succeeds but timeout occurs during transmission, return
   failure, i.e. -ETIME.
 - When submission succeeds but transmission fails without timeout, return
   success.

The third case looks problematic. This patch is focusing on this. There is =
also
disparity to handle the failure between timeout(the second case) and
non-timeout(the third case). Why does it not return failure when non-timeou=
t
error occurs during transmission whereas it does when timeout occurs during
transmission? If the API is solely for submission, why does it return failu=
re
instead of success in the second case?

In the third case, the controller(or the client) will inform the mailbox co=
re
of the transmission failure. Then, why not return that failure as a return
value of the API despite having this information in the core?

An alternative to fixing this issue would be adding the API doc by saying l=
ike:

 - In blocking mode, the send API will return -ETIME when timeout occurs du=
ring
   transmission, but it will not return failure but success(since submissio=
n
   itself was successful before transmission) when other errors occur durin=
g
   transmission. Users have to register a callback to collect the error cod=
e
   when non-timeout error occurs.

But, I think we can go away with this unnecessary confusion by fixing the A=
PI
just to return the error code when error occurs regardless of whether it is
timeout or not. Then, we could simply say:

 - In blocking mode, the send API will return failure when error occurs.

Since this patch is pointing out this anomaly of the send API's behavior, I
am not sure what scenario we would need more. In other words, the current w=
ay
of working would be more surprising to the users than the fixed version of =
it
as it was when I found out this issue for the first time.

Do you think that this change will cause any other problem on the client si=
de
than fixing the existing issue? If not, I am wondering why not go fix the
issue with this patch.

Thanks,
Joonwon Kang

