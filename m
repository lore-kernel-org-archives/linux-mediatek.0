Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C08EC4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 04:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQyapGaksxc5HPHzYoaRYUc1BPx1RyETpKHLmN7h1N8=; b=pPtZrL08qXIEoga90MvgJdw1mu
	JEmbFsxFmH2icFllxvfSYc+H3GkylxOuOMb+4+X2jvtjdSPa9QJtiqjjXgRirH/bS2HIxRWrm74mG
	kXBO9a9jsh6QhYO7ukO9YzNnJlIuVtdoqZu43jidN6XA3hJSmlthsa/UnTEyTmyMh9P3qywE3GrYd
	ahoL9Tt3ulR3T8eithKeVTHFix2kqxGoRS6sPcBwdYGetp8oKvNaR0N9B6K+A843wiw2r6gorXRhG
	pqgfu52PdF/2gc5ogXHL4fWTTdSX7T1s27x0waLlXG80BXPNsRQlKxRVLkmUNYOFgkGJV0Q9eYAcS
	ANoEmwNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0wmc-005GLJ-1f;
	Thu, 09 Nov 2023 04:36:46 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0wmZ-005GKB-2C
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Nov 2023 04:36:45 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c6b30acacdso4723961fa.2
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Nov 2023 20:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699504600; x=1700109400; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQyapGaksxc5HPHzYoaRYUc1BPx1RyETpKHLmN7h1N8=;
        b=a7Gt41YcEBiqvjLP4iOtVAkMyJl9k2sg09Sr5+3d42V1rKe+IEdCgAg7mDRO93b+nb
         8AoJ0W1oMokwwsoZcmy/VxikkC8GgRKS8JoCkxPOm3/Tlf4ricBl6hGNw6lV0RugyVag
         eNp4IUMiQXZAMR/EIBd6MbPuPUOj5KEed96lQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699504600; x=1700109400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQyapGaksxc5HPHzYoaRYUc1BPx1RyETpKHLmN7h1N8=;
        b=mDCdms2ynOdZhAnEtOI2nx3ivCAroAj90S1ntiIhR4ctF6hwUpCGxggXg9L5I2VYTL
         fzZIm2Ehmyu4wvZ0mHBNfVUU+cQD7sKNYBjOOYiJrMTkM91E/nEhbDc8Varc6BoO6Twe
         QgcPxAghL9bIqX7A6clOSW9DbFJoB5AOHnfuIUwC3c2Uo46Zh17MgHaZWjKLmCLcDo0Q
         Gk54ES7KO6g9mgqAHzoZo7lppUmDbcBguDZ9yAsvAxe6yqqGij+fGL6oHMAOAr4Tb+Pw
         Mjc21QzCIy+eqs/wtwaSgiHj5xGE8Od64VcmCkTkU91Qev9SZrwk8mxRSVktokrkBWHo
         3kGQ==
X-Gm-Message-State: AOJu0YwMXlucBWsqo7KdMyb32rvHYWg7WiDy4L4gRM6V2+pET/5uefe/
	LcB3JUKieHX49SheJ65euMz/WmR9KcYtpy+tqZk96Pu8
X-Google-Smtp-Source: AGHT+IHNgYr+2dXndES150Q4z2wcTZ4RV1va6eRqn/Ti0iXVlwrjySjY3l6jA5fUX2Ecc/ksqnmr6Q==
X-Received: by 2002:a2e:3208:0:b0:2c5:1b82:a533 with SMTP id y8-20020a2e3208000000b002c51b82a533mr3017747ljy.15.1699504599883;
        Wed, 08 Nov 2023 20:36:39 -0800 (PST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id a7-20020a2e88c7000000b002c50ccc579csm1982988ljk.60.2023.11.08.20.36.39
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 20:36:39 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2c594196344so4680151fa.3
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Nov 2023 20:36:39 -0800 (PST)
X-Received: by 2002:a05:6512:3251:b0:509:4b59:d40e with SMTP id
 c17-20020a056512325100b005094b59d40emr327270lfr.49.1699504598991; Wed, 08 Nov
 2023 20:36:38 -0800 (PST)
MIME-Version: 1.0
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-9-benjamin.gaignard@collabora.com> <20231108094223.rprskkeee47vaezy@chromium.org>
 <adc94476-8188-4569-8a39-2a1fb6b2f9dc@collabora.com>
In-Reply-To: <adc94476-8188-4569-8a39-2a1fb6b2f9dc@collabora.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 9 Nov 2023 13:36:21 +0900
X-Gmail-Original-Message-ID: <CAAFQd5C0PG+tP1Sa9BHKOFFpc9K9Fc-SqUxGmBKnd09eJnzDZA@mail.gmail.com>
Message-ID: <CAAFQd5C0PG+tP1Sa9BHKOFFpc9K9Fc-SqUxGmBKnd09eJnzDZA@mail.gmail.com>
Subject: Re: [PATCH v14 08/56] media: videobuf2: Use vb2_get_num_buffers() helper
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: mchehab@kernel.org, m.szyprowski@samsung.com, ming.qian@nxp.com, 
	ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de, 
	gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl, 
	nicolas.dufresne@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_203643_724655_16F1A4C8 
X-CRM114-Status: GOOD (  56.49  )
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

On Wed, Nov 8, 2023 at 10:22=E2=80=AFPM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
>
> Le 08/11/2023 =C3=A0 10:42, Tomasz Figa a =C3=A9crit :
> > On Tue, Oct 31, 2023 at 05:30:16PM +0100, Benjamin Gaignard wrote:
> >> Stop using queue num_buffers field directly, instead use
> >> vb2_get_num_buffers().
> >> This prepares for the future 'delete buffers' feature where there are
> >> holes in the buffer indices.
> >>
> >> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> >> ---
> >>   .../media/common/videobuf2/videobuf2-core.c   | 92 +++++++++++------=
--
> >>   .../media/common/videobuf2/videobuf2-v4l2.c   |  4 +-
> >>   2 files changed, 54 insertions(+), 42 deletions(-)
> >>
> >> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers=
/media/common/videobuf2/videobuf2-core.c
> >> index b406a30a9b35..c5c5ae4d213d 100644
> >> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> >> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> >> @@ -444,13 +444,14 @@ static int __vb2_queue_alloc(struct vb2_queue *q=
, enum vb2_memory memory,
> >>                           unsigned int num_buffers, unsigned int num_p=
lanes,
> >>                           const unsigned plane_sizes[VB2_MAX_PLANES])
> >>   {
> >> +    unsigned int q_num_buffers =3D vb2_get_num_buffers(q);
> >>      unsigned int buffer, plane;
> >>      struct vb2_buffer *vb;
> >>      int ret;
> >>
> >>      /* Ensure that q->num_buffers+num_buffers is below VB2_MAX_FRAME =
*/
> >>      num_buffers =3D min_t(unsigned int, num_buffers,
> >> -                        VB2_MAX_FRAME - q->num_buffers);
> >> +                        VB2_MAX_FRAME - q_num_buffers);
> > I guess it's safe in this specific situation, but was there any reason
> > behind not just calling vb2_get_num_buffers() directly here?
> >
> >>
> >>      for (buffer =3D 0; buffer < num_buffers; ++buffer) {
> >>              /* Allocate vb2 buffer structures */
> >> @@ -470,7 +471,7 @@ static int __vb2_queue_alloc(struct vb2_queue *q, =
enum vb2_memory memory,
> >>                      vb->planes[plane].min_length =3D plane_sizes[plan=
e];
> >>              }
> >>
> >> -            vb2_queue_add_buffer(q, vb, q->num_buffers + buffer);
> >> +            vb2_queue_add_buffer(q, vb, q_num_buffers + buffer);
> > In this case it should also be fine, but actually now this is a loop an=
d if
> > somone doesn't know what the other code in the loop does, one could be
> > concerned that the num buffers actually could have changed, but we stil=
l
> > use the cached one that we got at the beginning of the function.
> >
> > (Ideally I'd imagine vb2_queue_add_buffer() to append the buffer
> > at the end of the queue and increment the num_buffers internally, but i=
t
> > doesn't have to happen now, as this series is already quite complex...)
>
> That will be the case later in the series when I replace num_buffers fiel=
d
> by a bitmap. Until that I prefer to limit the changes in this loop.
>
> >
> >>              call_void_bufop(q, init_buffer, vb);
> >>
> >>              /* Allocate video buffer memory for the MMAP type */
> > [snip]
> >> @@ -2513,7 +2519,8 @@ void vb2_core_queue_release(struct vb2_queue *q)
> >>      __vb2_cleanup_fileio(q);
> >>      __vb2_queue_cancel(q);
> >>      mutex_lock(&q->mmap_lock);
> >> -    __vb2_queue_free(q, q->num_buffers);
> >> +    __vb2_queue_free(q, vb2_get_num_buffers(q));
> >> +    q->num_buffers =3D 0;
> > Unrelated change?
>
> No because I found a case where q->num_buffers wasn't correctly reset whi=
le testing.
>

Could you provide more details about that case? Shouldn't it be fixed inste=
ad?

It's a bit weird to me, because __vb2_queue_free() is supposed to
decrement q->num_buffers by the number of buffers freed and it's
called with vb2_get_num_buffers() just one line above.

> >
> >>      mutex_unlock(&q->mmap_lock);
> >>   }
> >>   EXPORT_SYMBOL_GPL(vb2_core_queue_release);
> >> @@ -2542,7 +2549,7 @@ __poll_t vb2_core_poll(struct vb2_queue *q, stru=
ct file *file,
> >>      /*
> >>       * Start file I/O emulator only if streaming API has not been use=
d yet.
> >>       */
> >> -    if (q->num_buffers =3D=3D 0 && !vb2_fileio_is_active(q)) {
> >> +    if (vb2_get_num_buffers(q) =3D=3D 0 && !vb2_fileio_is_active(q)) =
{
> >>              if (!q->is_output && (q->io_modes & VB2_READ) &&
> >>                              (req_events & (EPOLLIN | EPOLLRDNORM))) {
> >>                      if (__vb2_init_fileio(q, 1))
> >> @@ -2580,7 +2587,7 @@ __poll_t vb2_core_poll(struct vb2_queue *q, stru=
ct file *file,
> >>       * For output streams you can call write() as long as there are f=
ewer
> >>       * buffers queued than there are buffers available.
> >>       */
> >> -    if (q->is_output && q->fileio && q->queued_count < q->num_buffers=
)
> >> +    if (q->is_output && q->fileio && q->queued_count < vb2_get_num_bu=
ffers(q))
> >>              return EPOLLOUT | EPOLLWRNORM;
> >>
> >>      if (list_empty(&q->done_list)) {
> >> @@ -2629,8 +2636,8 @@ struct vb2_fileio_buf {
> >>    * struct vb2_fileio_data - queue context used by file io emulator
> >>    *
> >>    * @cur_index:     the index of the buffer currently being read from=
 or
> >> - *          written to. If equal to q->num_buffers then a new buffer
> >> - *          must be dequeued.
> >> + *          written to. If equal to number of already queued buffers
> >> + *          then a new buffer must be dequeued.
> > Hmm, that's a significant meaning change compared to the original text.=
 Is
> > it indended?
>
> Does "If equal to number of buffers in the vb2_queue then a new buffer mu=
st be dequeued."
> sound better for you ?

Yes, I think now it matches the original meaning. Thanks.

>
> >
> >>    * @initial_index: in the read() case all buffers are queued up imme=
diately
> >>    *         in __vb2_init_fileio() and __vb2_perform_fileio() just cy=
cles
> >>    *         buffers. However, in the write() case no buffers are init=
ially
> >> @@ -2640,7 +2647,7 @@ struct vb2_fileio_buf {
> >>    *         buffers. This means that initially __vb2_perform_fileio()
> >>    *         needs to know what buffer index to use when it is queuing=
 up
> >>    *         the buffers for the first time. That initial index is sto=
red
> >> - *          in this field. Once it is equal to q->num_buffers all
> >> + *          in this field. Once it is equal to num_buffers all
> > It's not clear what num_buffers means here. Would it make sense to inst=
ead
> > say "number of buffers in the vb2_queue"?
>
> Yes I will change that
>
> >
> >>    *         available buffers have been queued and __vb2_perform_file=
io()
> >>    *         should start the normal dequeue/queue cycle.
> >>    *
> >> @@ -2690,7 +2697,7 @@ static int __vb2_init_fileio(struct vb2_queue *q=
, int read)
> >>      /*
> >>       * Check if streaming api has not been already activated.
> >>       */
> >> -    if (q->streaming || q->num_buffers > 0)
> >> +    if (q->streaming || vb2_get_num_buffers(q) > 0)
> >>              return -EBUSY;
> >>
> >>      /*
> >> @@ -2740,7 +2747,7 @@ static int __vb2_init_fileio(struct vb2_queue *q=
, int read)
> >>      /*
> >>       * Get kernel address of each buffer.
> >>       */
> >> -    for (i =3D 0; i < q->num_buffers; i++) {
> >> +    for (i =3D 0; i < vb2_get_num_buffers(q); i++) {
> >>              /* vb can never be NULL when using fileio. */
> >>              vb =3D vb2_get_buffer(q, i);
> >>
> >> @@ -2759,18 +2766,23 @@ static int __vb2_init_fileio(struct vb2_queue =
*q, int read)
> >>              /*
> >>               * Queue all buffers.
> >>               */
> >> -            for (i =3D 0; i < q->num_buffers; i++) {
> >> -                    ret =3D vb2_core_qbuf(q, q->bufs[i], NULL, NULL);
> >> +            for (i =3D 0; i < vb2_get_num_buffers(q); i++) {
> >> +                    struct vb2_buffer *vb2 =3D vb2_get_buffer(q, i);
> >> +
> >> +                    if (!vb2)
> >> +                            continue;
> >> +
> >> +                    ret =3D vb2_core_qbuf(q, vb2, NULL, NULL);
> >>                      if (ret)
> >>                              goto err_reqbufs;
> >>                      fileio->bufs[i].queued =3D 1;
> >>              }
> > Doesn't this part belong to the previous patch that changes q->bufs[x] =
to
> > vb2_get_buffer()?
>
> Yes I will change that too.
>
> >
> >>              /*
> >>               * All buffers have been queued, so mark that by setting
> >> -             * initial_index to q->num_buffers
> >> +             * initial_index to num_buffers
> > What num_buffers?
>
> I will use your wording: "the number of buffers in the vb2_queue"
>

Thanks!

> >
> >>               */
> >> -            fileio->initial_index =3D q->num_buffers;
> >> -            fileio->cur_index =3D q->num_buffers;
> >> +            fileio->initial_index =3D vb2_get_num_buffers(q);
> >> +            fileio->cur_index =3D fileio->initial_index;
> >>      }
> >>
> >>      /*
> >> @@ -2964,12 +2976,12 @@ static size_t __vb2_perform_fileio(struct vb2_=
queue *q, char __user *data, size_
> >>               * If we are queuing up buffers for the first time, then
> >>               * increase initial_index by one.
> >>               */
> >> -            if (fileio->initial_index < q->num_buffers)
> >> +            if (fileio->initial_index < vb2_get_num_buffers(q))
> >>                      fileio->initial_index++;
> >>              /*
> >>               * The next buffer to use is either a buffer that's going=
 to be
> >> -             * queued for the first time (initial_index < q->num_buff=
ers)
> >> -             * or it is equal to q->num_buffers, meaning that the nex=
t
> >> +             * queued for the first time (initial_index < num_buffers=
)
> >> +             * or it is equal to num_buffers, meaning that the next
> > What num_buffers?
>
> Same here

Thanks!

Best regards,
Tomasz

