Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9F1EB64DC
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 00:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3MijvoflT0Dtq/ZeXcCS3BgET99hji2sxV55TlAWqxs=; b=TGLtGBE1VhIU9uTCHvbR73Fh0S
	3+m/5sTKog6btMlM0AcZVrqJDjprLOkKfVS2J74DgNOWCswooLpNT6lMt96bFUSq8fdcqr7uRGcPp
	Oio+0VjK4bZxL1/uiIVxy/C8nSiFfwFWnkzkjX46YgZydgVIFF62NO+atyGnIkGoH3YXAESYJytiK
	lx9B3RYFpkxIGhZicjzwLfgINrISzf+aRdrvM+s4qEqfzUU4ksJT1qyk7dBTIGn/5LF7MJIHyP2Ck
	q1fUS2DWAfKZPwXo/Dl8iBFAHtVEyn2xXk4s05C7yWD9HAtg7O7JedldV4+meG/H7uwNXi4Zv5+yl
	RKOpYfuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIf4z-00A1Ol-0q;
	Mon, 10 Jul 2023 00:48:41 +0000
Received: from mx-lax3-1.ucr.edu ([169.235.156.35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIf4t-00A1Ng-0w
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Jul 2023 00:48:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1688950115; x=1720486115;
  h=mime-version:references:in-reply-to:from:date:message-id:
   subject:to:cc:content-transfer-encoding;
  bh=th7GSjcH0mVMigTTb+zNmiXfnwvpUHHXzJpPYfFO42Q=;
  b=L3vkvB2xnUtngsNBqY2xfIznf6vVrkVhXUHRPCjrKvbLWb5gPdnusRGK
   ciRaXxYSq2mYabSFa3zOFyV9svstMTFApBwhdq8WlAesZubb6B1Z+QtwW
   aGn0RwnL6JIHXfS3df5wh/goP5V2xQrovOj4k4wCyaMvG86rfoHSzoP8V
   yCekB09YJxepstMK9YILk4HZ2R3Ei4PUJiLrbxpTM7ZIPlfIZFOHZgh4L
   KxSxhHYs1mn41XzkFhIc5LYOm7msYmA8HiCxV3RkTdDDpYC7hL1SsWr4r
   83wjU75nkZ/3Yisi0aSezLw469AirV24/jRDh9yOnw6RNOutShE9uQc6H
   A==;
Received: from mail-wr1-f70.google.com ([209.85.221.70])
  by smtp-lax3-1.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Jul 2023 17:48:28 -0700
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-2f2981b8364so2163855f8f.1
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Jul 2023 17:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ucr.edu; s=rmail; t=1688950107; x=1691542107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3MijvoflT0Dtq/ZeXcCS3BgET99hji2sxV55TlAWqxs=;
        b=gU2O2AYACfuKmd2gpp2EPO4SlS7tf/658NycMOL2gwLTu/teSH2iPbFyXZ3PAVT1ov
         lTvZDTe5lyhP66oZYz9G8mtDLAy/9poyVaDKEPD6jYer1UW6klLi7iGLyhbvtF7UtaCI
         JJFiy60vOiCsmnJNvOgeY0j/5dGPkCVPHUMUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688950107; x=1691542107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3MijvoflT0Dtq/ZeXcCS3BgET99hji2sxV55TlAWqxs=;
        b=dEjtR70IwOgA3gsxlDcHXxRmWUk9WB5CP+bEaj0OGRZABphIzHhXTVEBL3ahhJaJzH
         Wf1WZvj4Kmr0dQDbkokhYDvenC/Y0QmsLluJ7nuD9sJZaVTL2fpC2NlAkVMMf9AgrqUa
         DJwvPXSBW+JC28Zd5/Qwetg5xlKNgIeyOYRQovFF8WTGemX9l4Bio6pWHWGs1cMFcpgf
         gs4jqfgHtfZgHaBRnukucfiyWK9jKr/dCUDI05sEJM6H7HhIyzxr2mCC3WcpHcOBna9q
         Ix4X9VW9RxciL+tNZngDhasvmZhqhHEM4cGSFhj8ceh6NL82iPoyGr8e79ODsHSAQ/sQ
         g9TA==
X-Gm-Message-State: ABy/qLZdAlkGyudrmn+GWT9bU4OBzfVMvWyTKxj5bgTUm0m8uNUGetl9
	Dr6+Z5fAPeeLyZb9wo+rMUIRmjski+p4Duwk1u+PHObdIuZSwlNZutotInhloj9COF4joZD/iCq
	UUY67DTCCyD1JVM7nt+FWgseBOcgixfruF5T3ut13PorL/DC1zA==
X-Received: by 2002:a5d:428b:0:b0:315:94ea:31ad with SMTP id k11-20020a5d428b000000b0031594ea31admr3610793wrq.66.1688950106801;
        Sun, 09 Jul 2023 17:48:26 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHBZAuOciiBsmSRDr0cO0dz/Q88ySmcmH8vOjd474VLkUORc1RjF+j/z3yBnSYVd0lU7CqFovE+D1ABd70fcDw=
X-Received: by 2002:a5d:428b:0:b0:315:94ea:31ad with SMTP id
 k11-20020a5d428b000000b0031594ea31admr3610777wrq.66.1688950106478; Sun, 09
 Jul 2023 17:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <CA+UBctDxfb6+70+hzuXJ-gwb65E0uoNzXYEhpJT92sXr2CE7OA@mail.gmail.com>
 <20230705080625.02b2bac5@bootlin.com>
In-Reply-To: <20230705080625.02b2bac5@bootlin.com>
From: Yu Hao <yhao016@ucr.edu>
Date: Sun, 9 Jul 2023 17:48:15 -0700
Message-ID: <CA+UBctBqtSvyBWf9ZwKbecTrh9_6sCDm_TyU-ncb+6h5y19K5g@mail.gmail.com>
Subject: Re: [PATCH] usb: mtu3: Fix possible use-before-initialization bug
To: Herve Codina <herve.codina@bootlin.com>
Cc: chunfeng.yun@mediatek.com, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230709_174835_364147_4365F86E 
X-CRM114-Status: GOOD (  31.55  )
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

Hi Herv=C3=A9,

Thanks for the comments. How about this patch?
---
 drivers/usb/mtu3/mtu3_gadget_ep0.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_gadget_ep0.c
b/drivers/usb/mtu3/mtu3_gadget_ep0.c
index e4fd1bb14a55..af2884943c2a 100644
--- a/drivers/usb/mtu3/mtu3_gadget_ep0.c
+++ b/drivers/usb/mtu3/mtu3_gadget_ep0.c
@@ -600,7 +600,7 @@ static void ep0_tx_state(struct mtu3 *mtu)
        mtu3_readl(mtu->mac_base, U3D_EP0CSR));
 }

-static void ep0_read_setup(struct mtu3 *mtu, struct usb_ctrlrequest *setup=
)
+static int ep0_read_setup(struct mtu3 *mtu, struct usb_ctrlrequest *setup)
 {
    struct mtu3_request *mreq;
    u32 count;
@@ -608,6 +608,8 @@ static void ep0_read_setup(struct mtu3 *mtu,
struct usb_ctrlrequest *setup)

    csr =3D mtu3_readl(mtu->mac_base, U3D_EP0CSR) & EP0_W1C_BITS;
    count =3D mtu3_readl(mtu->mac_base, U3D_RXCOUNT0);
+   if (count =3D=3D 0)
+       return -EINVAL;

    ep0_read_fifo(mtu->ep0, (u8 *)setup, count);

@@ -642,7 +644,8 @@ __acquires(mtu->lock)
    struct mtu3_request *mreq;
    int handled =3D 0;

-   ep0_read_setup(mtu, &setup);
+   if (ep0_read_setup(mtu, &setup))
+       return -EINVAL;
    trace_mtu3_handle_setup(&setup);

    if ((setup.bRequestType & USB_TYPE_MASK) =3D=3D USB_TYPE_STANDARD)
@@ -764,7 +767,9 @@ irqreturn_t mtu3_ep0_isr(struct mtu3 *mtu)
            break;
        }

-       ep0_handle_setup(mtu);
+       if (ep0_handle_setup(mtu))
+           break;
+
        ret =3D IRQ_HANDLED;
        break;
    default:
--=20
2.34.1

Yu Hao

On Tue, Jul 4, 2023 at 11:06=E2=80=AFPM Herve Codina <herve.codina@bootlin.=
com> wrote:
>
> Hi Yu,
>
> On Tue, 4 Jul 2023 16:25:50 -0700
> Yu Hao <yhao016@ucr.edu> wrote:
>
> > The struct usb_ctrlrequest setup should be initialized in the function
> > ep0_read_setup(mtu, &setup). However, inside that function,
> > the variable count could be 0 and the struct usb_ctrlrequest setup
> > is not initialized. But there is a read for setup.bRequestType.
> >
> > Signed-off-by: Yu Hao <yhao016@ucr.edu>
> > ---
> >  drivers/usb/mtu3/mtu3_gadget_ep0.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/mtu3/mtu3_gadget_ep0.c
> > b/drivers/usb/mtu3/mtu3_gadget_ep0.c
> > index e4fd1bb14a55..67034fa515d0 100644
> > --- a/drivers/usb/mtu3/mtu3_gadget_ep0.c
> > +++ b/drivers/usb/mtu3/mtu3_gadget_ep0.c
> > @@ -638,7 +638,7 @@ static int ep0_handle_setup(struct mtu3 *mtu)
> >  __releases(mtu->lock)
> >  __acquires(mtu->lock)
> >  {
> > -   struct usb_ctrlrequest setup;
> > +   struct usb_ctrlrequest setup =3D {};
> >     struct mtu3_request *mreq;
> >     int handled =3D 0;
> >
>
> Looks strange to me because, if ep0_read_setup() cannot read the setup da=
ta
> why don't we simply abort the operation ?
>
> With setup =3D {}, the following test is true:
>   if ((setup.bRequestType & USB_TYPE_MASK) =3D=3D USB_TYPE_STANDARD)
>         handled =3D handle_standard_request(mtu, &setup);
>
> handle_standard_request() is called and supposes an USB_REQ_GET_STATUS
> (0x00) request:
>    case USB_REQ_GET_STATUS:
>         handled =3D ep0_get_status(mtu, setup);
>         break;
>
> Then ep0_get_status() supposes USB_RECIP_DEVICE (0x00) and performs some
> operation sending the data related to the GET_STATUS.
>
> All of these are not correct as the setup data that triggered this sequen=
ce
> was never received.
> Aborting the operation if ep0_read_setup() cannot read the setup data see=
ms
> better to me.
>
> Best regards,
> Herv=C3=A9
>
> --
> Herv=C3=A9 Codina, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

