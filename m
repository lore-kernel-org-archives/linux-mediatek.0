Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215FAD75E2D
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Nov 2024 12:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4awdIKHOc9tiTWW/sGRWFK525oUkjPltfSOQCltNHK8=; b=QCc68lwAbxu2pafhGr6rl4VC17
	GoIlb+455vcR2vMhPU381rUaX0f3otWsr8BVAq+/4CyNjv8Ra85N954iKZJATrVp2nUXJWeP/h8Rx
	MFBW4xjZe0JyCDOEkdoGhjNzL/DsbRTL4LjABJriB49JGmw5ufIKV/46h7YVw4+TLxjXyxnUDv1lT
	JzACurYrNsxpZIHzSTNMSXVzbIaZ2Anrq0RAmF0Yg6oCosm3sVgJ7r9+6HjY2C1TjWMQtXM9UUnF8
	RJt7iCQm7xlLFEvvIQJABN5KVGMRTxPH5aETCfCalKUaYhjxD3wrDUmsAYy++fsovsSrwvoB+Si6P
	yY2IB2Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tESR2-00000002Pp4-0EyH;
	Fri, 22 Nov 2024 12:06:52 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tESQ3-00000002PjD-44th
	for linux-mediatek@lists.infradead.org;
	Fri, 22 Nov 2024 12:05:54 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-aa20944ce8cso563780866b.0
        for <linux-mediatek@lists.infradead.org>; Fri, 22 Nov 2024 04:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732277150; x=1732881950; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4awdIKHOc9tiTWW/sGRWFK525oUkjPltfSOQCltNHK8=;
        b=QjdjcV+sEl6fo6xydgvIz735k353BPcQTc5sLfs29V7KUVTDKogkfUs2xKIEtpYPAz
         3sK6g1OSPpjA3Imv91L5RD85qQQsTyT1+epUW0zu1R5heSo5gEdA+11DFR7uqdnnOyRB
         dUpeuCCise+AoLQNp/dxFKI7nuw+QUOm3pnYcV53FZZRyQamIRo+ZFSGcUgJGK87WkKk
         gpPSVa7oZWnTrhxoPcMNj9fHvIWD8lKecyYyz3tj46rQ/rYo0fVdEyhNqj301bK0tiRk
         D/tSd5BQCsPGgUoog3Sco+M28yyEp0ddFSwG2QE3dR2+l9+LcEtY9YGg2ds7xDpRt7/C
         ecnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732277150; x=1732881950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4awdIKHOc9tiTWW/sGRWFK525oUkjPltfSOQCltNHK8=;
        b=ZSuWNBxAHQ1SjWY4vvgfFWjqoZPJjxoZ7oD8hTqrc30qcNlyJshy3iW0mNtlf9i3bO
         Uzivhu7Te6CLIef02toWeOOImbWWLbrAUeGQ8THeAb1KsMnHhiH/LBDqNtritPefXOTo
         HIEbf71HM7Bxb2XPYtKwmBE2GKH0+RWkNj0P9kuvuMNnr4A4wKy7Rsnt+Xn5thSflQlP
         cp6yLdURwQA2tI4jhR4ykYStcy8XuV9zKuuzoiTG61HlLGlajME6C0pDiEaQ4CnD/yu/
         dJ4Sn/oqLN+lijIFPZ87nILVBqAwwGA68f2boAQW0ZwaeHSMobDnna7xEndHZoieVCom
         txhg==
X-Forwarded-Encrypted: i=1; AJvYcCVyr26ecNQYJPvxllRcqetlWXviNsQNTkcFDwj7+Z4EdnrKYQLT94wY7sxND+zzlWcsBTbdWFpYSW5P8sEq2w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7GosHoSZRGypLjJqsTZ3t8xrNck7gzHp6mer1WsrAlGmK5ctO
	SXqjROiozcPpV8f3HZuyLxWBe06hoTnIc6XIiJyIcX+ijgYNjvAuwPpvnuP9cwUq793Qu51AlEA
	IqW5gQepXKeihUmJ05Cc4jFUOGf9o2i45hSLGaAz99eHTG2JM
X-Gm-Gg: ASbGncsi/c2/cQsTJ2ALk296Tbg2LwN0mQaB9EIf8iJx2xFBQ2eGwb5VA7/nSoSkGcU
	jSNvYs+sZQOn1jodGF2y6eMTEKatkfA==
X-Google-Smtp-Source: AGHT+IFWFYdsVIpAWJgT1gtIynsJvUXbIXbPCzIef0ApS6AMShnnTq5vw0bsEUMO1YOnSWNsqqmfLQ4iMDl5v7PuDGo=
X-Received: by 2002:a17:907:31c5:b0:a9a:e0b8:5bac with SMTP id
 a640c23a62f3a-aa4efe2a1f6mr606014366b.23.1732277150378; Fri, 22 Nov 2024
 04:05:50 -0800 (PST)
MIME-Version: 1.0
References: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
 <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com>
 <767085562b5efb43f248e8528bb154a6c30d3999.camel@mediatek.com>
 <CAEHHSvaePj2MUg+zgmkpZF4HTj_F9ED0RxuzQr2oOAUJgOieng@mail.gmail.com>
 <bd73658d8ceac0ce236f08f31065350123056724.camel@mediatek.com>
 <CAEHHSvZLx3MqzK_qheiXm1UsB=i=8f2QbGTpXPkdU2aqUJtvww@mail.gmail.com> <b234ccf388cfc933d7941cbe94ce6ae590ad17e1.camel@mediatek.com>
In-Reply-To: <b234ccf388cfc933d7941cbe94ce6ae590ad17e1.camel@mediatek.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Fri, 22 Nov 2024 13:05:38 +0100
Message-ID: <CAEHHSvbGKOV6x8B9Hr_8_-UJD_AoR3aX9acAtwg4Nkgjsf0yow@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>, "mchehab@kernel.org" <mchehab@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	=?UTF-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?= <Andy.Hsieh@mediatek.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "fsylvestre@baylibre.com" <fsylvestre@baylibre.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"pnguyen@baylibre.com" <pnguyen@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_040552_019245_F09634C9 
X-CRM114-Status: GOOD (  40.14  )
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

Le ven. 22 nov. 2024 =C3=A0 11:01, CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89) <ck.=
hu@mediatek.com> a =C3=A9crit :
>
> On Fri, 2024-11-22 at 10:50 +0100, Julien Stephan wrote:
> > External email : Please do not click links or open attachments until yo=
u have verified the sender or the content.
> >
> >
> > Le ven. 22 nov. 2024 =C3=A0 10:49, CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89) =
<ck.hu@mediatek.com> a =C3=A9crit :
> > >
> > > On Fri, 2024-11-22 at 10:25 +0100, Julien Stephan wrote:
> > > > External email : Please do not click links or open attachments unti=
l you have verified the sender or the content.
> > > >
> > > >
> > > > Le ven. 22 nov. 2024 =C3=A0 09:41, CK Hu (=E8=83=A1=E4=BF=8A=E5=85=
=89) <ck.hu@mediatek.com> a =C3=A9crit :
> > > > >
> > > > > Hi, Julien:
> > > > >
> > > > > On Thu, 2024-11-21 at 09:53 +0100, Julien Stephan wrote:
> > > > > > External email : Please do not click links or open attachments =
until you have verified the sender or the content.
> > > > > >
> > > > > >
> > > > > > From: Phi-bang Nguyen <pnguyen@baylibre.com>
> > > > > >
> > > > > > This driver provides a path to bypass the SoC ISP so that image=
 data
> > > > > > coming from the SENINF can go directly into memory without any =
image
> > > > > > processing. This allows the use of an external ISP.
> > > > > >
> > > > > > Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> > > > > > Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
> > > > > > [Paul Elder fix irq locking]
> > > > > > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > > > > > Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboar=
d.com>
> > > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.=
com>
> > > > > > Co-developed-by: Julien Stephan <jstephan@baylibre.com>
> > > > > > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > > > > > ---
> > > > >
> > > > > [snip]
> > > > >
> > > > > > +static irqreturn_t isp_irq_camsv30(int irq, void *data)
> > > > > > +{
> > > > > > +       struct mtk_cam_dev *cam_dev =3D (struct mtk_cam_dev *)d=
ata;
> > > > > > +       struct mtk_cam_dev_buffer *buf;
> > > > > > +       unsigned int irq_status;
> > > > > > +
> > > > > > +       spin_lock(&cam_dev->buf_list_lock);
> > > > > > +
> > > > > > +       irq_status =3D mtk_camsv30_read(cam_dev, CAMSV_INT_STAT=
US);
> > > > > > +
> > > > > > +       if (irq_status & INT_ST_MASK_CAMSV_ERR)
> > > > > > +               dev_err(cam_dev->dev, "irq error 0x%lx\n",
> > > > > > +                       irq_status & INT_ST_MASK_CAMSV_ERR);
> > > > > > +
> > > > > > +       /* De-queue frame */
> > > > > > +       if (irq_status & CAMSV_IRQ_PASS1_DON) {
> > > > > > +               cam_dev->sequence++;
> > > > > > +
> > > > > > +               buf =3D list_first_entry_or_null(&cam_dev->buf_=
list,
> > > > > > +                                              struct mtk_cam_d=
ev_buffer,
> > > > > > +                                              list);
> > > > > > +               if (buf) {
> > > > > > +                       buf->v4l2_buf.sequence =3D cam_dev->seq=
uence;
> > > > > > +                       buf->v4l2_buf.vb2_buf.timestamp =3D
> > > > > > +                               ktime_get_ns();
> > > > > > +                       vb2_buffer_done(&buf->v4l2_buf.vb2_buf,
> > > > > > +                                       VB2_BUF_STATE_DONE);
> > > > > > +                       list_del(&buf->list);
> > > > > > +               }
> > > > > > +
> > > > > > +               buf =3D list_first_entry_or_null(&cam_dev->buf_=
list,
> > > > > > +                                              struct mtk_cam_d=
ev_buffer,
> > > > > > +                                              list);
> > > > > > +               if (buf)
> > > > > > +                       mtk_camsv30_update_buffers_add(cam_dev,=
 buf);
> > > > >
> > > > > If buf =3D=3D NULL, so hardware would automatically stop DMA?
> > > > > I don't know how this hardware work.
> > > > > Below is my imagine about this hardware.
> > > > >
> > > > > 1. Software use CAMSV_IMGO_FBC_RCNT_INC to increase software buff=
er index.
> > > > > 2. Hardware has a hardware buffer index. After hardware finish on=
e frame, hardware buffer index increase.
> > > > > 3. After software buffer index increase, hardware start DMA.
> > > > > 4. When hardware buffer index is equal to software buffer index, =
hardware automatically stop DMA.
> > > > >
> > > > > Does the hardware work as my imagine?
> > > > > If hardware could automatically stop DMA, add comment to describe=
.
> > > > > If hardware could not automatically stop DMA, software should do =
something to stop DMA when buf =3D=3D NULL.
> > > > >
> > > >
> > > > You are right except that dma is not stopped but frames are
> > > > automatically dropped by hardware until a new buffer is enqueued an=
d
> > > > software uses CAMSV_IMGO_FBC_RCNT_INC to increase the software buff=
er
> > > > index.
> > > >
> > > > What about adding the following comment:
> > > >
> > > > /*
> > > > * If there is no user buffer available, hardware will drop automati=
cally
> > > > * frames until buf_queue is called
> > > > */
> > >
> > > You say DMA is not stopped. Do you mean hardware still write data int=
o latest buffer which would be dequeued to user space?
> > > I think hardware should not write data into the buffer which has been=
 take away by user space.
> > > I think software should do something to stop DMA. Maybe use mtk_camsv=
30_cmos_vf_hw_disable() to stop DMA.
> > >
> >
> > No, I said frame is dropped.. It does not write any data.
>
> OK, for me, DMA mean memory access. Not writing any data is equal to stop=
 DMA for me.
> The comment is OK for me now. But it may change after we discuss fbc_inc.
>

OK, sorry for confusion!
Did you notice my previous reply about fbc_inc?

Cheers
Julien

> Regards,
> CK
>
> >
> > > Regards,
> > > CK
> > >
> > > >
> > > > Let me know if that works for you
> > > >
> > > > Cheers
> > > > Julien
> > > >
> > > > > Regards,
> > > > > CK
> > > > >
> > > > > > +       }
> > > > > > +
> > > > > > +       spin_unlock(&cam_dev->buf_list_lock);
> > > > > > +
> > > > > > +       return IRQ_HANDLED;
> > > > > > +}
> > > > > > +
> > > > >
> > > > > ************* MEDIATEK Confidentiality Notice *******************=
*
> > > > > The information contained in this e-mail message (including any
> > > > > attachments) may be confidential, proprietary, privileged, or oth=
erwise
> > > > > exempt from disclosure under applicable laws. It is intended to b=
e
> > > > > conveyed only to the designated recipient(s). Any use, disseminat=
ion,
> > > > > distribution, printing, retaining or copying of this e-mail (incl=
uding its
> > > > > attachments) by unintended recipient(s) is strictly prohibited an=
d may
> > > > > be unlawful. If you are not an intended recipient of this e-mail,=
 or believe
> > > > > that you have received this e-mail in error, please notify the se=
nder
> > > > > immediately (by replying to this e-mail), delete any and all copi=
es of
> > > > > this e-mail (including any attachments) from your system, and do =
not
> > > > > disclose the content of this e-mail to any other person. Thank yo=
u!
> > >
> > > ************* MEDIATEK Confidentiality Notice ********************
> > > The information contained in this e-mail message (including any
> > > attachments) may be confidential, proprietary, privileged, or otherwi=
se
> > > exempt from disclosure under applicable laws. It is intended to be
> > > conveyed only to the designated recipient(s). Any use, dissemination,
> > > distribution, printing, retaining or copying of this e-mail (includin=
g its
> > > attachments) by unintended recipient(s) is strictly prohibited and ma=
y
> > > be unlawful. If you are not an intended recipient of this e-mail, or =
believe
> > > that you have received this e-mail in error, please notify the sender
> > > immediately (by replying to this e-mail), delete any and all copies o=
f
> > > this e-mail (including any attachments) from your system, and do not
> > > disclose the content of this e-mail to any other person. Thank you!
> >
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

