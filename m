Return-Path: <SRS0=MFJx=4X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB24C3F2D4
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2020 06:53:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B48DD20866
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2020 06:53:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fe5yM4gF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YRWfWW+P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B48DD20866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UUv7Fc2WU8jl1vPCYSvL15ddYFYOVrt1Gx5KeDswH7M=; b=fe5yM4gFBVFLjM
	+GH6MR0AdqTihkHenhA9cES3TyzP5SbGnqqgmvkIdgD+1a1z5v/BMxwtzA4UJG5uELtXFw562RiwU
	nIcwK9yT3aPdYx3QmTp33qNLPLfHJvNtVGhfkxiXBsd7JpqfhBMvXSeQFcyNZUecx3bC5CIUJ++Q7
	GCTqmym4rBPEdRmD4SVBkd9L6Ai0isNXlTLVKdZU0iB3nC8YfyAo0wYGEz7JC3vOkNUbG6pf9zUBG
	u0f+5MPn+J1TFNusS2Ci9csZZHHj6UT6uU811grNlFeSKGJrX6DYYgZop33U2xVfHHGKP+Puix5fT
	GuuL5QyR6fDTFa05/odA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jA6r4-0006IQ-LT; Fri, 06 Mar 2020 06:53:06 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jA6r1-0006Gj-Mq
 for linux-mediatek@lists.infradead.org; Fri, 06 Mar 2020 06:53:05 +0000
Received: by mail-io1-xd42.google.com with SMTP id d8so1078292ion.7
 for <linux-mediatek@lists.infradead.org>; Thu, 05 Mar 2020 22:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/mARJYGslAJ8V9v0TPSw6dreIR1LiKX4t1V7F/dU3ew=;
 b=YRWfWW+PdyHfSJi8ExaraGhfeX3ywJEpqzVaR0lechfwGLoxZMXLGK1taQExIrWiG8
 f7PX1JZaQ5oqFVc9EK+KAIuiZw4ej3DT0TAQsbrspHVY7K30dxLJtrHvU0R08CgCdRZM
 5fVxO4+8GdjL2jH1+edlQ+EuSO9YD5E36+OZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/mARJYGslAJ8V9v0TPSw6dreIR1LiKX4t1V7F/dU3ew=;
 b=qUrOvQQO/4cW3zEhGXXAHrAhDu+6SDdBuW0Bek4SoNzCD9d15abdQbvNXvuxg2vVn6
 YGppeihrK18/yBH8A4ej0A698KCkDUPMSeEWvTFo6xjDdqXN4lg28txF5nRXRfPjpMP0
 2U7X2FgHPCHfT8zxSoXxWQkWq3JMf46fSW7FnVVLAwfhviUiAgr8rrpa0ikcTK3VYv11
 +723OjITkjh11Y7Fu+6X4DrRlZkkaIMib7gTae9MFl60LfUb852mEprVVc3MIwoJuiOO
 VP2PauSV2gH3XogysA3t29GiNK+ucsHwz7X2scKcNsfxV5TYEG8KH8EEcrCFFUZ7kQ6J
 KY8A==
X-Gm-Message-State: ANhLgQ1B2Px+zmeWgsz8LIS/jy0GlNrgkboOWHJegAc4ncT3hPK4Z3ty
 28gFh7EBbwFMFLBgw+hJ59O1BrAcSgFL00+AdMnqaQ==
X-Google-Smtp-Source: ADFU+vtNwg97u+UdTWVYb6/mwYd7ahxnbfnrbtAicFiBrYZA15JA9SwdltGuhno/l4EXfmmq9upRMGTPd78cxG76KAI=
X-Received: by 2002:a6b:5b15:: with SMTP id v21mr1895802ioh.100.1583477581773; 
 Thu, 05 Mar 2020 22:53:01 -0800 (PST)
MIME-Version: 1.0
References: <20200302044021.97415-1-hsinyi@chromium.org>
 <46f27a3b-de4c-8d43-d6d7-d6332ee30451@xs4all.nl>
In-Reply-To: <46f27a3b-de4c-8d43-d6d7-d6332ee30451@xs4all.nl>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 6 Mar 2020 14:52:35 +0800
Message-ID: <CAJMQK-i2Cht5YMMMQsyz0UGhpiU3kF67C_j8pD0pHDwzkyz6VA@mail.gmail.com>
Subject: Re: [PATCH v4] media: mtk-vpu: avoid unaligned access to DTCM buffer.
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200305_225303_771578_17760775 
X-CRM114-Status: GOOD (  17.95  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 lkml <linux-kernel@vger.kernel.org>, Houlong Wei <houlong.wei@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Mar 3, 2020 at 10:24 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 02/03/2020 05:40, Hsin-Yi Wang wrote:
> > media: mtk-vpu: avoid unaligned access to DTCM buffer.
> >
> > Previously, vpu->recv_buf and send_buf are forced cast from
> > void __iomem *tcm. vpu->recv_buf->share_buf is passed to
> > vpu_ipi_desc.handler(). It's not able to do unaligned access. Otherwise
> > kernel would crash due to unable to handle kernel paging request.
> >
> > struct vpu_run {
> >       u32 signaled;
> >       char fw_ver[VPU_FW_VER_LEN];
> >       unsigned int    dec_capability;
> >       unsigned int    enc_capability;
> >       wait_queue_head_t wq;
> > };
> >
> > fw_ver starts at 4 byte boundary. If system enables
> > CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS, strscpy() will do
> > read_word_at_a_time(), which tries to read 8-byte: *(unsigned long *)addr
> >
> > vpu_init_ipi_handler() calls strscpy(), which would lead to crash.
> >
> > vpu_init_ipi_handler() and several other handlers (eg.
> > vpu_dec_ipi_handler) only do read access to this data, so they can be
> > const, and we can use memcpy_fromio() to copy the buf to another non iomem
> > buffer then pass to handler.
> >
> > Fixes: 85709cbf1524 ("media: replace strncpy() by strscpy()")
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> > Change in v4:
> > - Remove forced casting recv_buf from tcm. Copy iomem data before passing
> >   to handler.
> > Change in v2, v3:
> > - fix sparse warnings.
> > ---
> >  drivers/media/platform/mtk-mdp/mtk_mdp_vpu.c  |  9 ++--
> >  .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  6 +--
> >  .../media/platform/mtk-vcodec/venc_vpu_if.c   | 12 ++---
> >  drivers/media/platform/mtk-vpu/mtk_vpu.c      | 45 ++++++++++---------
> >  drivers/media/platform/mtk-vpu/mtk_vpu.h      |  2 +-
> >  5 files changed, 38 insertions(+), 36 deletions(-)
> >
> > diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_vpu.c b/drivers/media/platform/mtk-mdp/mtk_mdp_vpu.c
> > index 6720d11f50cf..dc95b8a44759 100644
> > --- a/drivers/media/platform/mtk-mdp/mtk_mdp_vpu.c
> > +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_vpu.c
> > @@ -15,7 +15,7 @@ static inline struct mtk_mdp_ctx *vpu_to_ctx(struct mtk_mdp_vpu *vpu)
> >       return container_of(vpu, struct mtk_mdp_ctx, vpu);
> >  }
> >
> > -static void mtk_mdp_vpu_handle_init_ack(struct mdp_ipi_comm_ack *msg)
> > +static void mtk_mdp_vpu_handle_init_ack(const struct mdp_ipi_comm_ack *msg)
> >  {
> >       struct mtk_mdp_vpu *vpu = (struct mtk_mdp_vpu *)
> >                                       (unsigned long)msg->ap_inst;
> > @@ -26,10 +26,11 @@ static void mtk_mdp_vpu_handle_init_ack(struct mdp_ipi_comm_ack *msg)
> >       vpu->inst_addr = msg->vpu_inst_addr;
> >  }
> >
> > -static void mtk_mdp_vpu_ipi_handler(void *data, unsigned int len, void *priv)
> > +static void mtk_mdp_vpu_ipi_handler(const void *data, unsigned int len,
> > +                                 void *priv)
> >  {
> > -     unsigned int msg_id = *(unsigned int *)data;
> > -     struct mdp_ipi_comm_ack *msg = (struct mdp_ipi_comm_ack *)data;
> > +     unsigned int msg_id = *(const unsigned int *)data;
> > +     const struct mdp_ipi_comm_ack *msg = data;
>
> Why not just do:
>
>         const struct mdp_ipi_comm_ack *msg = data;
>         unsigned int msg_id = msg->msg_id;
>
> Much cleaner.
>
> Other than this small issue this patch looks nice. No more sparse/smatch warnings
> and no more weird casts :-)
>
> Regards,
>
>         Hans
>
Updated in V5, thanks :)

https://lore.kernel.org/lkml/20200304025851.173570-1-hsinyi@chromium.org/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
