Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B09E65D39
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Nov 2024 09:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8kGVIObe0vVdWgPVNKUPs0E9cZC3gBnTEl6g/zCTMjk=; b=faUSmM3NOOaiaCqmRHLbQ3/6U4
	OrdZVdRlyn1ekT7TdmxMs1zTpJl191EqzPscKHIabmlQ0+nDFuhQlNN0+29we8Ed6RBybDQY9JywL
	jIzNpRTewOrHTLxpAlf1zOJ3EbNyp3QIAVku5Zuyr0YAXLYMwXqdfhawrMf9og4dFgSfsDkqdrln+
	nnCkpfQ0JycPVtAgFGzlXRXkFOqHzLTfvyQnnjJ2xSfX4Ey/joBG+FBktADC5X1MioS060JeYUBxq
	9MDer5Qz5U5X1tfCW6IgXSl+Tp1tPcnvwSascqPu6IJl7JSJIhegDuy6MZQI3lS2qSvR2MLvP9cWN
	TuC1msNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPxo-0000000267v-0cFr;
	Fri, 22 Nov 2024 09:28:32 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPvE-000000025ZS-0XYw
	for linux-mediatek@lists.infradead.org;
	Fri, 22 Nov 2024 09:25:54 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a9a6b4ca29bso271764066b.3
        for <linux-mediatek@lists.infradead.org>; Fri, 22 Nov 2024 01:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732267550; x=1732872350; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kGVIObe0vVdWgPVNKUPs0E9cZC3gBnTEl6g/zCTMjk=;
        b=Tq1pn0ZdKYY0H4LY7y7oxym30M1AsCxDMSNecHug2fqgn1wvV570I3CDJ4lqdxRWjo
         JcKmab0RskzP92JknwiA9lowNienU71iqsMvYji2tr5qLG5nw2hzaEhc3X4lgvBw+1Az
         93q0xKpd0NxuEN7pvLzbJgUKzdrb2xPSfv/q58c9VNz8FugKTJ3tSkaa4aFpCMGgO6kC
         dhhzYQiqS7IRv1favZqiP2ZkR1/3LMzsnHoyYYliU1LcDcw7oXp1C6zcaSCH85Hh4HxD
         GrrHcjkZwJbRyKXRr7dzgxqZHL0cbkGb6JNREI1jZnZtEHtoLAPXtacfJ9Ew4UeJw/8M
         wLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732267550; x=1732872350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8kGVIObe0vVdWgPVNKUPs0E9cZC3gBnTEl6g/zCTMjk=;
        b=RwjKEhXaMJNE0OCCt2hyFv59Ls1FwxKkeTwYPpystdbU4Qvw8weB6xRZOdPif6qqZm
         t0rp0jWq7WTh9Y4rykCiZDZs6KGmj7nbR8kCuHh3/+5ctMHy598udSH47J4obQiySqCJ
         k0K66Y/IM+WAuPwMjYVXN/Cq05GNSPAVehg+nbAQak7nry5QM5Ao5NZOnNmGQEWP2W0v
         XQNLGu6cd4BCGcSZPVMPxuhcHW5f4/nYt2spa7K9B+JLynkZ8rhhdz3atUlra3KUL8l0
         pzfpLrazzl0LSBe3BYzyPOUEXXqXSwBfzLu/BFQxqGv4jVYZcz9o/CdR0glIROPMiGDa
         mq9w==
X-Forwarded-Encrypted: i=1; AJvYcCWnc0yJgXLHU09WtN1k/asJYGfb8mmr4fSaniLlN+7B72wKf1jkLS1fMD2V8iM3iNhyBd6J91U9C4MQQrgNkA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/MygXJq3RsnJUZ2yhelXAqB+hLxlmibE/7YAy222xGgrgWFWU
	j/hhn3XmRtZR2W+iks7qOV2dC7fgitpMiEbbHnwTRTGwFcbfOHt4X2JiMqp5ZVDUPpFE/EEKllm
	qhRYph4otJ9pFl29yxE1XuNZ/2t0oy5Q46lDQ/Q==
X-Gm-Gg: ASbGncubEp/PRMcetC6HqzVL3du3+B+yVTR9cJ6VXGdxLf/lFJ3/xAFq6NUTuV14Vj1
	ztzx+FiAs1c7uuUbGZsDvKqOX4TsryQ==
X-Google-Smtp-Source: AGHT+IGelwCxgal9/XHOQ4gQV2eBA2tvjKzser7OohWcveCSBW6AFI6GvR8S/BH009DfNRCjqG5gbgXZGS6L6ZzyHyQ=
X-Received: by 2002:a17:906:3101:b0:a99:5f16:3539 with SMTP id
 a640c23a62f3a-aa509694028mr173072766b.0.1732267550340; Fri, 22 Nov 2024
 01:25:50 -0800 (PST)
MIME-Version: 1.0
References: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
 <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com> <767085562b5efb43f248e8528bb154a6c30d3999.camel@mediatek.com>
In-Reply-To: <767085562b5efb43f248e8528bb154a6c30d3999.camel@mediatek.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Fri, 22 Nov 2024 10:25:39 +0100
Message-ID: <CAEHHSvaePj2MUg+zgmkpZF4HTj_F9ED0RxuzQr2oOAUJgOieng@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, =?UTF-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?= <Andy.Hsieh@mediatek.com>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"fsylvestre@baylibre.com" <fsylvestre@baylibre.com>, "pnguyen@baylibre.com" <pnguyen@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_012552_177558_C7583CD8 
X-CRM114-Status: GOOD (  27.73  )
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

Le ven. 22 nov. 2024 =C3=A0 09:41, CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89) <ck.=
hu@mediatek.com> a =C3=A9crit :
>
> Hi, Julien:
>
> On Thu, 2024-11-21 at 09:53 +0100, Julien Stephan wrote:
> > External email : Please do not click links or open attachments until yo=
u have verified the sender or the content.
> >
> >
> > From: Phi-bang Nguyen <pnguyen@baylibre.com>
> >
> > This driver provides a path to bypass the SoC ISP so that image data
> > coming from the SENINF can go directly into memory without any image
> > processing. This allows the use of an external ISP.
> >
> > Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> > Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
> > [Paul Elder fix irq locking]
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Co-developed-by: Julien Stephan <jstephan@baylibre.com>
> > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > ---
>
> [snip]
>
> > +static irqreturn_t isp_irq_camsv30(int irq, void *data)
> > +{
> > +       struct mtk_cam_dev *cam_dev =3D (struct mtk_cam_dev *)data;
> > +       struct mtk_cam_dev_buffer *buf;
> > +       unsigned int irq_status;
> > +
> > +       spin_lock(&cam_dev->buf_list_lock);
> > +
> > +       irq_status =3D mtk_camsv30_read(cam_dev, CAMSV_INT_STATUS);
> > +
> > +       if (irq_status & INT_ST_MASK_CAMSV_ERR)
> > +               dev_err(cam_dev->dev, "irq error 0x%lx\n",
> > +                       irq_status & INT_ST_MASK_CAMSV_ERR);
> > +
> > +       /* De-queue frame */
> > +       if (irq_status & CAMSV_IRQ_PASS1_DON) {
> > +               cam_dev->sequence++;
> > +
> > +               buf =3D list_first_entry_or_null(&cam_dev->buf_list,
> > +                                              struct mtk_cam_dev_buffe=
r,
> > +                                              list);
> > +               if (buf) {
> > +                       buf->v4l2_buf.sequence =3D cam_dev->sequence;
> > +                       buf->v4l2_buf.vb2_buf.timestamp =3D
> > +                               ktime_get_ns();
> > +                       vb2_buffer_done(&buf->v4l2_buf.vb2_buf,
> > +                                       VB2_BUF_STATE_DONE);
> > +                       list_del(&buf->list);
> > +               }
> > +
> > +               buf =3D list_first_entry_or_null(&cam_dev->buf_list,
> > +                                              struct mtk_cam_dev_buffe=
r,
> > +                                              list);
> > +               if (buf)
> > +                       mtk_camsv30_update_buffers_add(cam_dev, buf);
>
> If buf =3D=3D NULL, so hardware would automatically stop DMA?
> I don't know how this hardware work.
> Below is my imagine about this hardware.
>
> 1. Software use CAMSV_IMGO_FBC_RCNT_INC to increase software buffer index=
.
> 2. Hardware has a hardware buffer index. After hardware finish one frame,=
 hardware buffer index increase.
> 3. After software buffer index increase, hardware start DMA.
> 4. When hardware buffer index is equal to software buffer index, hardware=
 automatically stop DMA.
>
> Does the hardware work as my imagine?
> If hardware could automatically stop DMA, add comment to describe.
> If hardware could not automatically stop DMA, software should do somethin=
g to stop DMA when buf =3D=3D NULL.
>

You are right except that dma is not stopped but frames are
automatically dropped by hardware until a new buffer is enqueued and
software uses CAMSV_IMGO_FBC_RCNT_INC to increase the software buffer
index.

What about adding the following comment:

/*
* If there is no user buffer available, hardware will drop automatically
* frames until buf_queue is called
*/

Let me know if that works for you

Cheers
Julien

> Regards,
> CK
>
> > +       }
> > +
> > +       spin_unlock(&cam_dev->buf_list_lock);
> > +
> > +       return IRQ_HANDLED;
> > +}
> > +
>
> ************* MEDIATEK Confidentiality Notice ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including it=
s
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or beli=
eve
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!

