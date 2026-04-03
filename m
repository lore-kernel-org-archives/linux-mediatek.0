Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75959E85373
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Apr 2026 14:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UsueJAB8iWMZmH12hTqYKPYVxfUoBPtsPuD5qctzJns=; b=BkW9CJwnQ5NqeDVaKvpjhowMSt
	x/cUmCobJ4LRhQdxXHKRkpJhv03XWKyhKTqf0hT/p+4W2ExAAubGB76l+dX/2KHrOvFl7X788S3xN
	K3TrOjL7x+eJdbiTa7LWLxq+LAmxWReyQIIl5hqGl18jYAdKwaxv9z1AunNcjJhVlLGCYM0C53knD
	Dz0tckE6rsWZG8cN2A7Uk6DeTpC3Qxok4VntRxLldidbX+vEi0fE+O4Z0rud80xCJEYZeGmX+8oNg
	pG6qb8FGPN9Bg3WTArOa56DkyMB+jFMNTDskFEq1dombhrK29AUrJMOhVJulmwOOAgGAlPM0UdvcC
	T5r/7xLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8frp-00000002Aio-2CY6;
	Fri, 03 Apr 2026 14:51:25 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8frn-00000002Ai1-113J
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Apr 2026 14:51:24 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2b0cac007cdso13464575ad.3
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Apr 2026 07:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775227881; x=1775832681; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UsueJAB8iWMZmH12hTqYKPYVxfUoBPtsPuD5qctzJns=;
        b=HJCrItKAvttm+Jv6Kb5ktB8DwJU0518nYXHijn/Rz7LB+Zrt015lBFVNioNkPHNhXp
         +HrsMhJcQMozx3dFgmuIwpgqfzE74g1nfZXvLhKbtOGPapdZL7zYt9IDx5dplB0wM2g8
         v19hectQerDEsjajayKYcKHp0dpte9Lbk2eGOzov+Q9QrOl14NQk7NBI2CZEOYgKQ4kC
         M8N6a/HXXU8ffRQYVMIvF6trxcPSYumlKJnB/Nc8w0o3WOeudFVO+6reCQyKKTLfzBYK
         8wxrfix7/oucCOR2S0kNBmiosS6qxC08i5lNR0bmaVDRmCo0ILTDUqri8RlE5E4OzjY0
         bQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775227881; x=1775832681;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UsueJAB8iWMZmH12hTqYKPYVxfUoBPtsPuD5qctzJns=;
        b=fQaWl7vI2ANKcbNwtvHNch4DfLMOLgQMIvLmk6b7lkS37qEeHyyiFylukYjYgRK0iT
         mwGVsj0sdJ7Qn5xImR7kqkDe8fw6vFkK9/HsozsAxhvBBpGHNYco8CFArHe63hJcn26Z
         tms3JtuL4MPgZLpU0UAYxF90xiz4/VMUU78jRw+sGQdsWjLPU779gcaRZ/0MejSKvoNZ
         Z3QyLxY5IJFLEt1UeiOIxjD43xGWGXqYBsSCUTi35PWyQqT4OfgIFvkBwahRu1Fv6SBx
         ALaKQGqQZV9ixlmvqKy4F650wx56wq9yQKnNHsWgkkTuxrH1iIn5JYSrYt8zqIQZF0lb
         COzA==
X-Forwarded-Encrypted: i=1; AJvYcCVuLR3CjnNGQa6etKWadPZNR2olqaJgJ8oO+TeVTR5ah5qfWc+iLrghP6RiD70KYzkzkriHW2QMVX/unHs0hA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5b+OSgcxHT8v3N3qXnZz1faeNYlyxJ9mqYkmuMFG//8eJ4iJe
	0oT/Ao5fk9EUo8mLf96v5CPWIdWdQaMJsNkhRnV42TIeVxoyeTjk9spZfGE7/xdVqo30Syq/vmI
	aLUCRxApFeozwie3JnGiEsm8mNA==
X-Received: from plblw8.prod.google.com ([2002:a17:903:2ac8:b0:2b0:af9b:aa3c])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2ac5:b0:2b2:42da:25cc with SMTP id d9443c01a7336-2b28163ad55mr35530115ad.1.1775227881118;
 Fri, 03 Apr 2026 07:51:21 -0700 (PDT)
Date: Fri,  3 Apr 2026 14:51:18 +0000
In-Reply-To: <CABb+yY0ub51k-eFpPfgARXtwYjWzRSjbPDLtoMD77YQR8JH+=Q@mail.gmail.com>
Mime-Version: 1.0
References: <CABb+yY0ub51k-eFpPfgARXtwYjWzRSjbPDLtoMD77YQR8JH+=Q@mail.gmail.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260403145119.2581034-1-joonwonkang@google.com>
Subject: Re: [PATCH v3 1/2] mailbox: Use per-thread completion to fix wrong
 completion order
From: Joonwon Kang <joonwonkang@google.com>
To: jassisinghbrar@gmail.com
Cc: angelogioacchino.delregno@collabora.com, jonathanh@nvidia.com, 
	joonwonkang@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-tegra@vger.kernel.org, matthias.bgg@gmail.com, stable@vger.kernel.org, 
	thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_075123_279274_8E278D29 
X-CRM114-Status: GOOD (  19.40  )
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

> On Thu, Apr 2, 2026 at 12:07=E2=80=AFPM Joonwon Kang <joonwonkang@google.=
com> wrote:
> >
> > Previously, a sender thread in mbox_send_message() could be woken up at
> > a wrong time in blocking mode. It is because there was only a single
> > completion for a channel whereas messages from multiple threads could b=
e
> > sent in any order; since the shared completion could be signalled in an=
y
> > order, it could wake up a wrong sender thread.
> >
> > This commit resolves the false wake-up issue with the following changes=
:
> > - Completions are created just as many as the number of concurrent send=
er
> >   threads
> > - A completion is created on a sender thread's stack
> > - Each slot of the message queue, i.e. `msg_data`, contains a pointer t=
o
> >   its target completion
> > - tx_tick() signals the completion of the currently active slot of the
> >   message queue
> >
> I think I reviewed it already or is this happening on
> one-channel-one-client usage? Because mailbox api does not support
> channels shared among multiple clients.

Yes, this patch is handling the one-channel-one-client usage but when that
single channel is shared between multiple threads. From my understanding, t=
he
discussion back then ended with how to circumvent the issue rather than whe=
ther
we will eventually solve this in the mailbox framework or not, and if yes, =
how
we will, and if not, why. I think it should still be resolved in the framew=
ork
for the reasons in the cover letter. Could you help to give a second review
with regards to those aspects?

Thanks,
Joonwon Kang

