Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D44D6AAEC
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Apr 2026 18:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M0TW/KELxmP6HAx/s1ZGX6uuibSSGSUbIAcodT49xPg=; b=NT9+tZP97VLoWWxIquJAaTFeBt
	dTS7D/NNCs7Zs76feeyOI/fhCvWD4PDx3085MnmYzv8zUFTzeJmyHNgP8d0igpRTNT2Po8VB8T8XW
	jLlfbnFk/5Y2BdcyT/9B3irAlbLfIn0U+mRDjhyUPds0K3IRemqhmi9UuZCXKNl7sCpV3c285anq9
	4GkDK2OSMyWi4Rj7BLzGSEgvtXIAojXZnELOuYOyC3KgfjhIaURM9Nv38nW4iZUk/xI/ghrLwkpgv
	jhN19cgRmZex6nTK+qufF+RmadcOctdYbJ1iOBO9A5mJhiPajecXH8TOfDU73EagoldzICQk5fjIu
	Gx4+UyMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8MO2-00000000czK-0pzR;
	Thu, 02 Apr 2026 18:03:22 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8MNy-00000000cyM-0E3d
	for linux-mediatek@lists.infradead.org;
	Thu, 02 Apr 2026 18:03:20 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7d9bba96f7dso634459a34.1
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Apr 2026 11:03:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775152997; cv=none;
        d=google.com; s=arc-20240605;
        b=hEpzhkC0ItkyQT2DyUR1JtSgyEKoIqd1p7lOfHLOupeVjSMQnfMHhlFd7XcFN/70wR
         Jn8rJVgL9H5iaiVEgbj4S2srNk42QxnvGEx5bhHYVBOWbEjkveRewD/Ucb+jLT9B/xER
         29kMxr6Bn8O1Cd6Mx2bwPs8cwz2AM4ekbqEDlfuJP4GMn4E5EBXND56NJQ0Fp8rCCeqC
         ZR7miUhFgJbqXGO+MlG7XjKAnHse+0Tc8O+oFiYExEniH1ELUkYIqSZkGMuZlBwydBnB
         rvh5dylIzYaQYD/gh+YY1vOEK949wzIQc7lEhouDo99JRXNlJT6LSXQueaOrX+5y0uWw
         jcXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M0TW/KELxmP6HAx/s1ZGX6uuibSSGSUbIAcodT49xPg=;
        fh=UezqdiTLLR2clp9huHr/ZHW3rWCAlacBdAoVoshZYTY=;
        b=Cvk00v0fvly8Qn7MpkXNC5GvIfKM6kZRNLAvV064v5zFxwEVeOhjSi1T5PIIMyRmRk
         I+fRIlD+K9k4myg7LBclHsbw1Z2dhA+/fjbDIQ8cUr15T+FJQfMsih7mVYURGrM9Ng87
         QcHCN4VgjswLpWltmSjUwVLJzEVn123N2AEKO7ZBLa0ePGCSTSLrTwqH5Mbeff1NDKo8
         2TujIRUsKTpMtt8fOzObsVB5FwT7wMHKAjhnAOQqa/d1b9iLHVkkxZt7yE8W/jSfVfm3
         BdhuX5SPmbdTng37WhO0T3DWcl0mZQTWYOEcvKC24VFdpg8tP0E8zGwVcue1pbGdJ5+c
         00Kg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775152997; x=1775757797; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0TW/KELxmP6HAx/s1ZGX6uuibSSGSUbIAcodT49xPg=;
        b=QXd4MwR2bxRVxN9h6LhCc1ep+Ivt7/e5xN9nEDGngzHFbbfauBwLi8UUABag5Xp4vZ
         hbfwseQWbJX9jWRrv6QRVRpU5CsVOTqIylwi+/TR9fr7YA6U1ftEcrDlRkWbNVDKMn2o
         yKIMDmMMHbEXaUxsEMcq2iWa9W1bAh0AHPD0LJcnQfaNL2HZP6GGk9AxMJq0ughleq5Z
         oIuPhbe5Jhv9hoU1cCcErp4vG7dJWlOwjuXbN1EMyIz2ieAh6CzE7sxWgmudLDU0n8Um
         ceTq6386FKoYDWNEeFClJ0pQsFl3mNyMu01azXLAyIPQkjVbEFqI6/opd1FknMbrB3/V
         S93Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775152997; x=1775757797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M0TW/KELxmP6HAx/s1ZGX6uuibSSGSUbIAcodT49xPg=;
        b=FEC2yF3hdfnKyl5EPMbtTBSCwWgEiMGmF8DY3nHavDs7y+o17AnUUj4SjRtY3k/jyf
         ur599C3G2PAetAN0zno3BSGOQyKDbiYcKRe6OIq8LbumhOReNzK+3uJ0JbGYorwLiuiR
         v8C6i3n+NsnbbKYK9qp9zcNSzN0Q7Z+TFYpNuUlQC0x3sXSmnc1YSoKAq02+NEENWccA
         i2qoYsuGGyTbehcydDm5YOVodWVIz6iBhjXpFAzc5+pD2AqbumtsDxKYBH1lZZRskn+g
         0kJblqoLT+nBeOwcBz3qSXRKXgiNdAPaykMdULPsmcBSqHQSqdFrwGfCy8kjLuopKY7N
         wnbg==
X-Forwarded-Encrypted: i=1; AJvYcCUisCCtXpKpURe8p8qhuBWPPkgIkm5iDafKRS4lWFdBfAwuwHQ6yDCPLIBL1m/1lJoudawjdiybu+WYaxA6+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yye08r1/l4KgMRO+BNLQzvdYDZv/6IR3lHYegvp7OcP4Z2r754h
	lesrUE8iTFfwH1vQEjJDII7KfYf0BsUkINPvjj8Bdrpj8QwAMAgnFQQ9pB1I6dBFnvndmVFNyyd
	zRrIldR/D9qTxbmrrM0UXVUb8dmBwOBQ=
X-Gm-Gg: ATEYQzwPyTCMNcEOIhv8u3qW8bzoAYhgu3pJAO1nxiV63Yk8CZgD8NhEXt/1za9NQpI
	2EWe9Hs4/s0Mtn5o+rYQjLTgme+JN1OnfODWQNceLm53om5od7S3REBtRQGQdT0uZoT8OMp6SVw
	VqSeNyM2DpXt2oIbVAbxvVDr0wrS/MfDYTzxTKlH+YrcWWUIcCVC+eZnJa4N+1yXsE5fcYrQrGt
	R61ZjRBb8l1yi6jAwohLpEjvJvYtECQbtse+N7uCCO6sd94p1G0NMP4w2D/+vjzAhOdWQOxrlzS
	0b+qd1zm
X-Received: by 2002:a05:6830:611b:b0:7d7:c96c:c5d6 with SMTP id
 46e09a7af769-7dbb6f1aea6mr240409a34.1.1775152996668; Thu, 02 Apr 2026
 11:03:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260402170641.2082547-1-joonwonkang@google.com> <20260402170641.2082547-3-joonwonkang@google.com>
In-Reply-To: <20260402170641.2082547-3-joonwonkang@google.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Thu, 2 Apr 2026 13:03:05 -0500
X-Gm-Features: AQROBzCl5IvjHSRY9VamVjuRyy3ZLLYtLTcWUCKJtq-4tAuHHgLfoU-JXy74tSw
Message-ID: <CABb+yY3hYcJ82QGor3w5KKHUGz9Pc1k64Jdf-94E4Yvv0DTeyQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mailbox: Make mbox_send_message() return error
 code when tx fails
To: Joonwon Kang <joonwonkang@google.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	thierry.reding@gmail.com, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-tegra@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_110318_093138_5CECDDAA 
X-CRM114-Status: GOOD (  25.85  )
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

On Thu, Apr 2, 2026 at 12:07=E2=80=AFPM Joonwon Kang <joonwonkang@google.co=
m> wrote:
>
> When the mailbox controller failed transmitting message, the error code
> was only passed to the client's tx done handler and not to
> mbox_send_message(). For this reason, the function could return a false
> success. This commit resolves the issue by introducing the tx status and
> checking it before mbox_send_message() returns.
>
Can you please share the scenario when this becomes necessary? This
can potentially change the ground underneath some clients, so we have
to be sure this is really useful.

Thanks
Jassi


> Cc: stable@vger.kernel.org
> Signed-off-by: Joonwon Kang <joonwonkang@google.com>
> ---
>  drivers/mailbox/mailbox.c          | 20 +++++++++++++++-----
>  include/linux/mailbox_controller.h |  2 ++
>  2 files changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> index d63386468982..ea9aec9dc947 100644
> --- a/drivers/mailbox/mailbox.c
> +++ b/drivers/mailbox/mailbox.c
> @@ -21,7 +21,10 @@
>  static LIST_HEAD(mbox_cons);
>  static DEFINE_MUTEX(con_mutex);
>
> -static int add_to_rbuf(struct mbox_chan *chan, void *mssg, struct comple=
tion *tx_complete)
> +static int add_to_rbuf(struct mbox_chan *chan,
> +                      void *mssg,
> +                      struct completion *tx_complete,
> +                      int *tx_status)
>  {
>         int idx;
>
> @@ -34,6 +37,7 @@ static int add_to_rbuf(struct mbox_chan *chan, void *ms=
sg, struct completion *tx
>         idx =3D chan->msg_free;
>         chan->msg_data[idx].data =3D mssg;
>         chan->msg_data[idx].tx_complete =3D tx_complete;
> +       chan->msg_data[idx].tx_status =3D tx_status;
>         chan->msg_count++;
>
>         if (idx =3D=3D MBOX_TX_QUEUE_LEN - 1)
> @@ -91,12 +95,13 @@ static void msg_submit(struct mbox_chan *chan)
>
>  static void tx_tick(struct mbox_chan *chan, int r, int idx)
>  {
> -       struct mbox_message mssg =3D {MBOX_NO_MSG, NULL};
> +       struct mbox_message mssg =3D {MBOX_NO_MSG, NULL, NULL};
>
>         scoped_guard(spinlock_irqsave, &chan->lock) {
>                 if (idx >=3D 0 && idx !=3D chan->active_req) {
>                         chan->msg_data[idx].data =3D MBOX_NO_MSG;
>                         chan->msg_data[idx].tx_complete =3D NULL;
> +                       chan->msg_data[idx].tx_status =3D NULL;
>                         return;
>                 }
>
> @@ -116,8 +121,10 @@ static void tx_tick(struct mbox_chan *chan, int r, i=
nt idx)
>         if (chan->cl->tx_done)
>                 chan->cl->tx_done(chan->cl, mssg.data, r);
>
> -       if (r !=3D -ETIME && chan->cl->tx_block)
> +       if (r !=3D -ETIME && chan->cl->tx_block) {
> +               *mssg.tx_status =3D r;
>                 complete(mssg.tx_complete);
> +       }
>  }
>
>  static enum hrtimer_restart txdone_hrtimer(struct hrtimer *hrtimer)
> @@ -286,15 +293,16 @@ int mbox_send_message(struct mbox_chan *chan, void =
*mssg)
>         int t;
>         int idx;
>         struct completion tx_complete;
> +       int tx_status =3D 0;
>
>         if (!chan || !chan->cl || mssg =3D=3D MBOX_NO_MSG)
>                 return -EINVAL;
>
>         if (chan->cl->tx_block) {
>                 init_completion(&tx_complete);
> -               t =3D add_to_rbuf(chan, mssg, &tx_complete);
> +               t =3D add_to_rbuf(chan, mssg, &tx_complete, &tx_status);
>         } else {
> -               t =3D add_to_rbuf(chan, mssg, NULL);
> +               t =3D add_to_rbuf(chan, mssg, NULL, NULL);
>         }
>
>         if (t < 0) {
> @@ -318,6 +326,8 @@ int mbox_send_message(struct mbox_chan *chan, void *m=
ssg)
>                         idx =3D t;
>                         t =3D -ETIME;
>                         tx_tick(chan, t, idx);
> +               } else if (tx_status < 0) {
> +                       t =3D tx_status;
>                 }
>         }
>
> diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_c=
ontroller.h
> index 912499ad08ed..890da97bcb50 100644
> --- a/include/linux/mailbox_controller.h
> +++ b/include/linux/mailbox_controller.h
> @@ -117,10 +117,12 @@ struct mbox_controller {
>   * struct mbox_message - Internal representation of a mailbox message
>   * @data:              Data packet
>   * @tx_complete:       Pointer to the transmission completion
> + * @tx_status:         Pointer to the transmission status
>   */
>  struct mbox_message {
>         void *data;
>         struct completion *tx_complete;
> +       int *tx_status;
>  };
>
>  /**
> --
> 2.53.0.1185.g05d4b7b318-goog
>

