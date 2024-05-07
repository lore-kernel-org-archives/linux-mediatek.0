Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0379DC10F1A
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 May 2024 19:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ROP560d9B/HYZwB5uId2pVMefTKn++eX7J1U2+mp4Xo=; b=ve1FXn/JSIBPz/jwfCBCmY2JbL
	LArHm48qvD9uWHZw5SZ1awZjFpCLLqIB9MVMELaEbU4HR8Lauoa8NJQWeDZVvLomFvvz2nJ7JQHbQ
	5OrM4NwtaPXRAhXAKo/8nixp37FAIOSWqeStZVp8PZtypRJ26gK86fE0WGvCw6wAeBu9w9sFh1W5S
	m9ckkf73Uzjk7J67qE9T8WZUqERJ6wKY8oc2bxcug8z47vgW47ITXRGq3ep0eWCUvrWG4Y/Eac1ok
	z4kfi2NCvIn+/ehk5XNrIvYpg6EQUaVE9R8rUmKZ7y1tWLRxIw/e/UxthQanlPswrFkXRa/NA3Lne
	DaMuMghA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4QVI-0000000CYoZ-2Py7;
	Tue, 07 May 2024 19:29:32 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4QVF-0000000CYo7-0R99
	for linux-mediatek@lists.infradead.org;
	Tue, 07 May 2024 19:29:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0B75CCE167C
	for <linux-mediatek@lists.infradead.org>; Tue,  7 May 2024 19:29:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40EC9C4AF63
	for <linux-mediatek@lists.infradead.org>; Tue,  7 May 2024 19:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715110165;
	bh=YA3vrAt5ghTUgBT/wl1g2ybOyF2Dm7BJbFH3IgYhJQk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LgSqjBdyXvuZAFBAirjp+OXT4c1wV2tRSE1ZZg0iV4XnCvq2xoVi3IpgV+motAvTB
	 iAChl0yAOZ2bcaWkN3irXXWZnC96szXE/3cOrZtYglNd+cwdu2wagZRu38RlMzqHge
	 4dIaa0Aj8bC3kxkIUUyeo0Lvo3QjnA0M4cg18jT6i2dh7y9Hh41J6FiIHc38EG4THu
	 r19w0WcR3OEjNGcWIV86+QIHjZ3ZaHJQisxP305ZfBPFeU3hl8OXKdNBpSO0Whe9HN
	 bKzayfZPnB3RKSaKt6v/m5D8VAOWTie80NmFues3liCVYCutBcYcr2tP6EG225GUa0
	 qvGXf3681+7WA==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a599b74fd49so88321666b.2
        for <linux-mediatek@lists.infradead.org>; Tue, 07 May 2024 12:29:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXUL+CexmSaP77C2gw8Nwor8d+CMV0t6xdhaeypK3A/wMY3GTWGkoY903+n0SN0m8Be5PSzZyUt9KNzCpaoGmwmqPLT3aTRkQKEWQWnlHnQNAZd
X-Gm-Message-State: AOJu0YzCZwqQXzlHTXYe64vnW5zQkDtIn3IrQ1/yMNaywL7u24wTCkay
	/sXGMugX3UFM4eRk5bDNgxkg+MKuOmlt8uiHEBQy4WNrAtPeUVzJns1G4Lg4wRCVc0FZNTHwZf5
	HbEewhjOZIKDB7c7sHeiBlw9rsAA=
X-Google-Smtp-Source: AGHT+IEByuVf6m8ECWyAQP2z5SKrVhqt0T0clfFQazWHlWdEvX3IQG+zZQYGAX9Sn7FPQMTkdGRAMLoNYnu6b+HjNXA=
X-Received: by 2002:a17:907:910c:b0:a59:bfab:b24f with SMTP id
 a640c23a62f3a-a59fb9e5f9fmr22357066b.3.1715110163810; Tue, 07 May 2024
 12:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240412095713.25641-1-hao.qin@mediatek.com> <CABBYNZJ-rvMuqHjFmQuxhmWv_K5fGFktAk-CeZfx8rw36L-Etg@mail.gmail.com>
In-Reply-To: <CABBYNZJ-rvMuqHjFmQuxhmWv_K5fGFktAk-CeZfx8rw36L-Etg@mail.gmail.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Tue, 7 May 2024 12:29:11 -0700
X-Gmail-Original-Message-ID: <CAGp9Lzquy_NzVwF24va87QViucpF6y-zxv1gECy2sJ5J5pFy_g@mail.gmail.com>
Message-ID: <CAGp9Lzquy_NzVwF24va87QViucpF6y-zxv1gECy2sJ5J5pFy_g@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btusb: mediatek: Support auto revert for MT7922
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Hao Qin <hao.qin@mediatek.com>, Marcel Holtmann <marcel@holtmann.org>, 
	Johan Hedberg <johan.hedberg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, 
	Deren Wu <deren.Wu@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>, 
	Chris Lu <chris.lu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>, 
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_122929_545265_F8664D57 
X-CRM114-Status: GOOD (  18.33  )
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

Hi Luiz,

Please disregard the patch. We will proceed with the journey using the
latest patchset I provided in the following link
https://lists.infradead.org/pipermail/linux-mediatek/2024-May/079017.html

                 Sean

On Wed, Apr 17, 2024 at 2:18=E2=80=AFPM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi,
>
> On Fri, Apr 12, 2024 at 5:57=E2=80=AFAM Hao Qin <hao.qin@mediatek.com> wr=
ote:
> >
> > Add support for auto reverting MT7922 during reset process.
>
> Need some more information of what auto reverting means in this
> context and what problem does it solves?
>
> >
> > Signed-off-by: Hao Qin <hao.qin@mediatek.com>
> > ---
> >  drivers/bluetooth/btusb.c | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> > index 4c0cc13adb47..0ad96ec8d31d 100644
> > --- a/drivers/bluetooth/btusb.c
> > +++ b/drivers/bluetooth/btusb.c
> > @@ -3032,7 +3032,16 @@ static int btusb_mtk_reset(struct hci_dev *hdev,=
 void *rst_data)
> >         usb_kill_anchored_urbs(&data->tx_anchor);
> >         mediatek =3D hci_get_priv(hdev);
> >
> > -       if (mediatek->dev_id =3D=3D 0x7925) {
> > +       if (mediatek->dev_id =3D=3D 0x7922) {
> > +               btusb_mtk_uhw_reg_read(data, MTK_BT_SUBSYS_RST, &val);
> > +               val |=3D 0x00002020;
> > +               btusb_mtk_uhw_reg_write(data, MTK_BT_SUBSYS_RST, val);
> > +               btusb_mtk_uhw_reg_write(data, MTK_EP_RST_OPT, 0x0001000=
1);
> > +               btusb_mtk_uhw_reg_read(data, MTK_BT_SUBSYS_RST, &val);
> > +               val |=3D BIT(0);
> > +               btusb_mtk_uhw_reg_write(data, MTK_BT_SUBSYS_RST, val);
> > +               msleep(100);
> > +       } else if (mediatek->dev_id =3D=3D 0x7925) {
> >                 btusb_mtk_uhw_reg_read(data, MTK_BT_RESET_REG_CONNV3, &=
val);
> >                 val |=3D (1 << 5);
> >                 btusb_mtk_uhw_reg_write(data, MTK_BT_RESET_REG_CONNV3, =
val);
> > @@ -3072,6 +3081,9 @@ static int btusb_mtk_reset(struct hci_dev *hdev, =
void *rst_data)
> >         if (err < 0)
> >                 bt_dev_err(hdev, "Reset timeout");
> >
> > +       if (mediatek->dev_id =3D=3D 0x7922)
> > +               btusb_mtk_uhw_reg_write(data, MTK_UDMA_INT_STA_BT, 0x00=
0000FF);
> > +
> >         btusb_mtk_id_get(data, 0x70010200, &val);
> >         if (!val)
> >                 bt_dev_err(hdev, "Can't get device id, subsys reset fai=
l.");
> > --
> > 2.18.0
> >
>
>
> --
> Luiz Augusto von Dentz
>

