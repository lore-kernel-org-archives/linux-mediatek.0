Return-Path: <SRS0=Rt7e=MF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDF10C11F66
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jul 2021 08:55:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81BB361374
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jul 2021 08:55:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81BB361374
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OCYRgQRU0t048oObuPBxauNdCTe8foCEWB6xWv6Y5Wk=; b=zSl6hdm9Vqrnzp
	GAZ/JRmhTGV59uF8AKU8Jr2hFXrMFbcICQV6hMpXAstI8eIttqpRM7Xov4LHqX8kjyQIab2G+xpiQ
	izadqGXik/1e1d1ugZMdJQDLbAIe1Ji4IvT2bCeV+eRmUkF6i3KuHGs1H+s8TmkcicjOBUqCR/cb8
	ri8TuGOUxtiEdzFvoMnJykPJp/wmD/YFYVn5wRvOpUoWonrqr02kY5o9JDLK40mnOI3gjo1gXbKYH
	h8QbwHRQjGEE4CxVuxwqOZUdn/I5U9Q+aTAMQr+KoOmXjjnE4mR5dLrjhqGcgoKGcy1oWbTJ6he6F
	Om41NHf3ZMcw394GOT3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3ECf-009WeU-E8; Tue, 13 Jul 2021 08:55:45 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3ECQ-009WaF-Uy
 for linux-mediatek@lists.infradead.org; Tue, 13 Jul 2021 08:55:32 +0000
Received: by mail-io1-xd31.google.com with SMTP id x10so7383725ion.9
 for <linux-mediatek@lists.infradead.org>; Tue, 13 Jul 2021 01:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8N5vxZ+XOSZKbHdolxGC0+lxunV1DuxqjzH0fWfK6pg=;
 b=Ea/lB5m0qpzAGNCrLW9/eTdpJ7fn5dESxi0iIvMUhhUK2sxTbNryT7fLdpsZXugZFg
 XjYS9dPFFEQVnQHtkmx0ZzReho38PIyLQycr1pfiKaPA/CG0ixp7jlObGt/hJE0vrbaU
 ZaJfrlRKnEAVO9o4Fc3k1TM7wAEYcTf7xB0y1IqqvmZYOhUc8iIXZIMy+gakPO20WqzD
 VnCaove9rBf4m99Wa4nrM22HnkP1gCmTpCYt+QIjpHgPI1x8IYui/sV11kDUBtQIc8wH
 RIc9nhoeM05hl6Xk01iGKgFPsCER7Z44FNNgTIBkWW86Oengfug0Tk3ZP9DAnsOrd7K8
 vjlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8N5vxZ+XOSZKbHdolxGC0+lxunV1DuxqjzH0fWfK6pg=;
 b=A5FFtpKKrAd03ykj8Ov6vCAMuEf8b5/wn75RaIjtPChh3wM+MCVQ0xoLxtO2IOSMr7
 bSh+ayB4GEHN49W2OVfR+ShQo1l+P6IDQsZzXqIKqYqsMikH+5fb4XJTUp7mTWqJ3DTm
 Up0K3oaJU+jhJJddKfYX8tvI7TS49qMw68lYcwmBfYN1lDoIEQAoMN7Ob/84HB0P23/L
 V4vFA1Ov7z5m9fDX3jP15BHdKarwNALnP/KNTa1ufBcvLWUlMLYerx3i65p4VpoPGWtt
 q3yFETaqLFT26rlG1mugC/RswRDzzMvmkGLdcmP+hnz+xoSE7ZzUwAyoM9DseZBYOy1c
 QEXA==
X-Gm-Message-State: AOAM5322UbAxQ9Wx/0JQaETe++odhs6U8NkI5LPMFWs6VX8N8f7pvD5N
 WZrsSNqjLm9baVQrmWOK7ZgpjWIpXajE67egB8b+mA==
X-Google-Smtp-Source: ABdhPJwQFi0gughVz6hGyUli3OcpQDysiaCpxIUKrfimeC3Iqz/Ng2CI6wAEyfv1x/QZryBR/5jbWzTe3QxDljMJNNg=
X-Received: by 2002:a5d:87d0:: with SMTP id q16mr2438017ios.109.1626166527031; 
 Tue, 13 Jul 2021 01:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210707062157.21176-1-yunfei.dong@mediatek.com>
 <20210707062157.21176-8-yunfei.dong@mediatek.com>
 <CA+Px+wUjJwksVfU6N8VZ9WMw-F-DHu67XwvDvMoiMcUBKF=P6Q@mail.gmail.com>
 <1626074875.7221.15.camel@mhfsdcap03>
In-Reply-To: <1626074875.7221.15.camel@mhfsdcap03>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Tue, 13 Jul 2021 16:55:16 +0800
Message-ID: <CA+Px+wUK=4iAk+OG1wCFHMdi5+japOngCEoY9g9bSbNNLKca2Q@mail.gmail.com>
Subject: Re: [PATCH v1, 07/14] media: mtk-vcodec: Add msg queue feature for
 lat and core architecture
To: mtk12024 <Yunfei.Dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Tzung-Bi Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Fritz Koenig <frkoenig@chromium.org>, Irui Wang <irui.wang@mediatek.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_015531_033564_19E08769 
X-CRM114-Status: GOOD (  37.67  )
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

On Mon, Jul 12, 2021 at 3:28 PM mtk12024 <yunfei.dong@mediatek.com> wrote:
> On Fri, 2021-07-09 at 17:39 +0800, Tzung-Bi Shih wrote:
> > On Wed, Jul 7, 2021 at 2:22 PM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
> > Doesn't it need to call mtk_vcodec_mem_free() and kfree() for any failure paths?
> When allocate memory fail, will call deinit function auto, then free all allocated memory.
I guess you mean: if vdec_msg_queue_init() fails,
vdec_msg_queue_deinit() should be called?

If so:
- It is not "auto".  It depends on callers to invoke _deinit() if _init() fails.
- The API usage would be a bit weird: if the object hasn't been
initialized, shall we de-initialize it?

> > > +struct vdec_lat_buf *vdec_msg_queue_get_core_buf(
> > > +       struct mtk_vcodec_dev *dev)
> > > +{
> > > +       struct vdec_lat_buf *buf;
> > > +       int ret;
> > > +
> > > +       spin_lock(&dev->core_lock);
> > > +       if (list_empty(&dev->core_queue)) {
> > > +               mtk_v4l2_debug(3, "core queue is NULL, num_core = %d", dev->num_core);
> > > +               spin_unlock(&dev->core_lock);
> > > +               ret = wait_event_freezable(dev->core_read,
> > > +                       !list_empty(&dev->core_queue));
> > > +               if (ret)
> > > +                       return NULL;
> > Should be !ret?
> According the definidtion, when condition is true, return value is 0.
Yeah, you're right.  I was confused a bit with wait_event_timeout().

> > > +bool vdec_msg_queue_wait_lat_buf_full(struct vdec_msg_queue *msg_queue)
> > > +{
> > > +       long timeout_jiff;
> > > +       int ret, i;
> > > +
> > > +       for (i = 0; i < NUM_BUFFER_COUNT + 2; i++) {
> > > +              timeout_jiff = msecs_to_jiffies(1000);
> > > +              ret = wait_event_timeout(msg_queue->lat_read,
> > > +                    msg_queue->num_lat == NUM_BUFFER_COUNT, timeout_jiff);
> > > +              if (ret) {
> > > +                     mtk_v4l2_debug(3, "success to get lat buf: %d",
> > > +                            msg_queue->num_lat);
> > > +                     return true;
> > > +              }
> > > +       }
> > Why does it need the loop?  i is unused.
> Core maybe decode timeout, need to wait all core buffer process
> completely.
The point is: the i is unused.  If it needs more time to complete,
could it just wait for (NUM_BUFFER_COUNT + 2) * 1000 msecs?

> > > +       msg_queue->init_done = false;
> > Have no idea what init_done does in the code.  It is not included in
> > any branch condition.
> When call vdec_msg_queue_init will set this parameter to true.
The point is: if init_done doesn't change any code branch but just a
flag, does it really need the flag?

For example usages:
- If see the msg_queue->init_done has already been set to true in
vdec_msg_queue_init(), return errors.
- If see the msg_queue->init_done has already been set to false in
vdec_msg_queue_deinit(), return errors.

In the cases, I believe it brings very limited benefit (i.e. the
msg_queue is likely to _init and _deinit only once).

> > > +/**
> > > + * vdec_msg_queue_get_core_buf - get used core buffer for lat decode.
> > > + * @dev: mtk vcodec device
> > > + */
> > > +struct vdec_lat_buf *vdec_msg_queue_get_core_buf(
> > > +       struct mtk_vcodec_dev *dev);
> > This is weird: vdec_msg_queue's operator but manipulating mtk_vcodec_dev?
> vdec_msg_queue is used to share message between lat and core, for each
> instance has its lat msg queue list, but all instance share one core msg
> queue list. When try to get core buffer need to get it from core queue
> list. Then queue it to lat queue list when core decode done.
I guess you mean: during runtime, it has n lat queues and 1 core queue.

If so, would it be intuitive and simple by:

msg_queue *core_q;
msg_queue *lat_q[LAT_N];

vdec_msg_queue_dequeue(core_q) if it wants to get from core queue.
vdec_msg_queue_enqueue(lat_q[X], data) if it wants to put data to lat queue X.

> > > +/**
> > > + * vdec_msg_queue_buf_to_lat - queue buf to lat for lat decode.
> > > + * @buf: current lat buffer
> > > + */
> > > +void vdec_msg_queue_buf_to_lat(struct vdec_lat_buf *buf);
> > It should at least accept a struct vdec_msg_queue argument (or which
> > msg queue should the buf put into?).
> All buffer is struct vdec_lat_buf, used to share info between lat and core queue list.
The API semantic needs to provide a way to specify which msg_queue the
buf would put into.

> > The position of struct vdec_msg_queue is weird.  It looks like the msg
> > queue is only for struct vdec_lat_buf.  If so, would vdec_msg_queue be
> > better to call vdec_lat_queue or something similar?
> >
> > It shouldn't touch the core queue in mtk_vcodec_dev anyway.  Is it
> > possible to generalize the queue-related code for both lat and core
> > queues?
> Lat queue list is separately for each instance, but only has one core
> queue list.
Suggested to generalize the vdec_msg_queue to handle both lat and core
(and maybe furthermore).  See comment above.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
