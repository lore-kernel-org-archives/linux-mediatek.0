Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7865FE65D3F
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Nov 2024 09:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1hd6q8zDhHex0K31D5UPVNO7yeK6NJNFYGAAxQqzFbc=; b=JGGlATvWBqC0Qk9z4P5ySpkkQj
	Y11pOrAKG8L7JTDbhrGtBnhN8Sf79uUbX9lqH0qYnH0qX+z/yvCjy0Zp359FUAPYE4AA/DawSaFit
	9XolnUtpEaU+rOVsnOGpck8ADiLbod00RdNLwn4YsS8/kSnc27K2p4AkiwIVM8yiqSu94QB6qHhwZ
	aWfUHS3/tJTuR/5rqRnOXEnR2co2CdIJDSBTq7qD02twXu1Gn7kudH0zJ4bOUNnuhquVt7yN2GqeF
	7d7zHsU0ZChZu/kuTSazCa9jKldlQilZCxUU6twuf04BTHQvdbtuOaGi4OIUREOO2hfDDXvcyjwBg
	DJwyGXyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEQDr-000000028A6-32vp;
	Fri, 22 Nov 2024 09:45:07 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEQDp-0000000289P-0UKq
	for linux-mediatek@lists.infradead.org;
	Fri, 22 Nov 2024 09:45:06 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-aa20c733e92so237320766b.0
        for <linux-mediatek@lists.infradead.org>; Fri, 22 Nov 2024 01:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732268703; x=1732873503; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hd6q8zDhHex0K31D5UPVNO7yeK6NJNFYGAAxQqzFbc=;
        b=RzO2jx9Zb7xfWoZr6gMrY5hB32i9KxiesJJLf6QmHYCKSTfCUpS3Xp//cj2BteqK4U
         CW7SIgig+0gNhfTlvT3tuquL+DvuQlhYpk5InLUhkA7BXw/Hpj+4O9yRSjsKKLMeZ8S/
         hpv9KE2lbEwJ1SFhkJUzj49xZw7I2fpW5tUTrf9CmZaecT3zmFAWQRWznfabylcXs+UO
         k+tJ9PhcgSqvpv1A+enmc++ypxVDlHaxiTr58U2e28Dd1+DtV5s7MPLdxdUxLzjI9zW9
         PM/c83YZEpdjhyJshmBqnGDFy3Pid2EnPk6m7D4demTKUJ5z/K/Dhbsiq2DP4krCGvc5
         K8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732268703; x=1732873503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1hd6q8zDhHex0K31D5UPVNO7yeK6NJNFYGAAxQqzFbc=;
        b=Vmw4+978g2xWjY0GPE2jf5Q5WzkB5MqUly92hl7rruPmww0RBHTphuADESKjBmBpjN
         thnP2i+ROrApT3PS1FaNgBl8VJcNN5XdY0eHbZLkKhGbeeDWHJ6CoZgMU2iNBNxwTJBU
         w1Hu8h/KWpfvTB24nXismDOr69UNFyIh9aVWN4Y9Q5B/RjTRSb7jcgRSTgT/SYckSD7o
         pZs8V0/HcpcmnVkDTq0K7rIt6f24xNB0WyaImff+xAztb4ftFRMxXqRQZElcrOoIx8aY
         gXk3DHE05uDLmwglGE2Mav5uYdgy7eU0c6U1iiLgTs6QFs+2gHwhFwlriGgzekRNKaAC
         hHOg==
X-Forwarded-Encrypted: i=1; AJvYcCU0l0fLSG54PY2n+1fJGvSsRKfXTIc4rxDJUjKc8nVW2Vl3k4/0Hto6+M0Dg0XM98USr5Gx/0OzNGCf3E21Eg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/Fb2Ld/6rK9h730EIxwPfQgKKFGY9JbXnpDUU0hAFZ3xJBUZw
	BWiiu3tpHLsBIjymsg9qKo+bpp4j5rxVRGRbnjuRj61pvSgK2HeN+tkPo3+7CAFjcWQPTy9aB95
	KnJHZgPtJu6gJx1EqlCgHrUeR07r8HEQenwpu9g==
X-Gm-Gg: ASbGncuoaXR7LORhLW0xrvkkwlsmck7YKkcRII0H06KZceUx1JSTZGyAwxR5v+qt9Jo
	/ZWX5DkiWAqI69DumbzAWCxAcHssbZQ==
X-Google-Smtp-Source: AGHT+IF2siysXCL8AuQk/Zj9BKQZImmKFwTANKrD+H57DhSj6YZ4aXozWUBRbTyiMmt32yK0vwfP+uNoBA8OHC90tE4=
X-Received: by 2002:a17:906:310b:b0:aa5:2237:67af with SMTP id
 a640c23a62f3a-aa522376878mr15619866b.9.1732268703393; Fri, 22 Nov 2024
 01:45:03 -0800 (PST)
MIME-Version: 1.0
References: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
 <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com> <b0af0ec1545b33fed81f34a866bc7b7222c78ad7.camel@mediatek.com>
In-Reply-To: <b0af0ec1545b33fed81f34a866bc7b7222c78ad7.camel@mediatek.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Fri, 22 Nov 2024 10:44:52 +0100
Message-ID: <CAEHHSvbFw+MC0R3w7isgrF15JAAfBWQmSkh1PoiU7y+P4O2psw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241122_014505_160647_CE6E308A 
X-CRM114-Status: GOOD (  25.50  )
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

Le ven. 22 nov. 2024 =C3=A0 10:19, CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89) <ck.=
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
> > +static void mtk_cam_vb2_buf_queue(struct vb2_buffer *vb)
> > +{
> > +       struct mtk_cam_dev *cam =3D vb2_get_drv_priv(vb->vb2_queue);
> > +       struct mtk_cam_dev_buffer *buf =3D to_mtk_cam_dev_buffer(vb);
> > +       unsigned long flags;
> > +
> > +       /* Add the buffer into the tracking list */
> > +       spin_lock_irqsave(&cam->buf_list_lock, flags);
> > +       if (list_empty(&cam->buf_list))
> > +               (*cam->hw_functions->mtk_cam_update_buffers_add)(cam, b=
uf);
> > +
> > +       list_add_tail(&buf->list, &cam->buf_list);
> > +       (*cam->hw_functions->mtk_cam_fbc_inc)(cam);
>
> I think fbc_inc should together with update_buffers_add.
> After update_buffers_add then fbc_inc.
> So squash fbc_inc into update_buffers_add and drop fbc_inc function.
>

No, this is not true.
mtk_cam_update_buffers_add is used to indicate which buffer should be
used for dma write. This is the first entry in the buf list.
mtk_cam_fbc_inc is used to increase the number of available user space buff=
ers.

If the buffer list is not empty and user space calls buf_queue again,
we need to call mtk_cam_fbc_inc to increase the number of available
user buffers, but we don't want to change the buffer for DMA write.

mtk_camsv30_update_buffers_add is called on irq to update the address
to the next buffer (if available).

Maybe the name mtk_camsv30_update_buffers_add is confusing then?
What do you think about:
- mtk_camsv30_update_buffers_add -> mtk_camsv30_update_buffers_address
- mtk_cam_fbc_inc -> mtk_camsv30_buffer_add

Cheers
Julien

 > Regards,
> CK
>
> > +       spin_unlock_irqrestore(&cam->buf_list_lock, flags);
> > +}
> > +
>
> >
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

