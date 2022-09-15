Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085BBECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 01:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z3Oe28/QXiDkr7yWQ6i1he7Rpb6F2Yud6yOu5wE6qqY=; b=30c0wJ81/31sXpins/9fn42+pi
	H9u2WoeO/878rq9LZjvBLqxRYcr6yIG1l6mch4b7M6c5EOJlIWMeiWwdYli0ApQ9bOt9UEglZduG+
	V50PcjUW3mLIamIpBeI+Ae0RmvrodH8q8pmtapdO+IEptPGza67OOfSGfUxTkcYk3U3H0gde/7aMM
	AmGexS/H4IOYh8invxvT0SKzmZHBWZd7JxqZd9aRGo8+hTuYOEV/jwjqEcxFjFV8gl2Y8ZqPCvVRk
	jw+L0tpU06cQhncP+ahAcAn2u5hyBGZomf5Mb1KqAaGmRrbeKkW93YNUjxK7Q2iZVG7QhqlNF1dcH
	oxMT87pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYe8P-00EiIr-Lf; Thu, 15 Sep 2022 01:57:45 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYe8M-00EiEl-GL
	for linux-mediatek@lists.infradead.org; Thu, 15 Sep 2022 01:57:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id AD003CE16C8
	for <linux-mediatek@lists.infradead.org>; Thu, 15 Sep 2022 01:57:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B3B9C43141
	for <linux-mediatek@lists.infradead.org>; Thu, 15 Sep 2022 01:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663207055;
	bh=aoSRSTCag8l0MVvAawlhHyEVLuGR7v1VAyAi5bDVdV0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pN9YnBUGFwz4p4F0zvwLmYf/rW/NWhUuGFlUjRSaDtid21lXc6Upb5MqPOu5abrxy
	 A1/1lTkaYiI4L7BHqggJU6AQ3/k5EjG/LIQLUH7OqXC4TZxGCPrYsiuKR7yjnr6u8d
	 XFBC3F77ft5J1SB9Ip5tzQSaA4k2HVTPeQFYnETLpRWKWYZ9OEOf/PNscYfyhCcrsJ
	 epTcMieYUBQY5+6dHyqpvYszTUG8Q/EhK9C4WdHn942wZ9/yJCtsLiam+Ok7vIF/o7
	 QD0z7ZGQ2xD7tukqFGIJy7lGQI3nkIryNAOdV0etGyGpq8tmYWjhp3Lyn6zQ0IOQM1
	 JKtOYb6gbQF6w==
Received: by mail-wm1-f52.google.com with SMTP id c2-20020a1c3502000000b003b2973dafb7so16750217wma.2
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Sep 2022 18:57:34 -0700 (PDT)
X-Gm-Message-State: ACgBeo1751uqPZRudtBqHoi5m5gIlRwotzSmW/N0sgYEmYT2+OZJ5c36
	tf0GKliXLA8Ew7nLeOegh4la0pIkFdIIzC5za24=
X-Google-Smtp-Source: AA6agR5buy/tXnCUXXG3a+BHycJDxuOdO5maD2LttOCF+4xw0zjN1zk3rj4LnQ1oaVye1Z0dlKBUprQ6WPEnuG7yhtw=
X-Received: by 2002:a05:600c:4e15:b0:3b4:a621:b54e with SMTP id
 b21-20020a05600c4e1500b003b4a621b54emr3312685wmq.47.1663207053256; Wed, 14
 Sep 2022 18:57:33 -0700 (PDT)
MIME-Version: 1.0
References: <43b68b1f48c20b1dfcd7e6663c3dcb38e4e0648c.1663020936.git.objelf@gmail.com>
 <a432abf4cf95e93783864b27bafa53d45bdd5212.1663020936.git.objelf@gmail.com> <CABBYNZ+Z+BApMOPEgVBxf6j0sTYFE0tH6Eab-hQW8FKVFqfvqA@mail.gmail.com>
In-Reply-To: <CABBYNZ+Z+BApMOPEgVBxf6j0sTYFE0tH6Eab-hQW8FKVFqfvqA@mail.gmail.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Wed, 14 Sep 2022 18:57:21 -0700
X-Gmail-Original-Message-ID: <CAGp9LzrjmKDF_3+Km05eLVkr9ZHKhfMWjVxx=7GvsfRmWNp2dQ@mail.gmail.com>
Message-ID: <CAGp9LzrjmKDF_3+Km05eLVkr9ZHKhfMWjVxx=7GvsfRmWNp2dQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] Bluetooth: btusb: mediatek: reset the device as WMT failed
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: sean.wang@mediatek.com, marcel@holtmann.org, johan.hedberg@gmail.com, 
	Soul.Huang@mediatek.com, YN.Chen@mediatek.com, Leon.Yen@mediatek.com, 
	Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, km.lin@mediatek.com, 
	robin.chiu@mediatek.com, Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, 
	posh.sun@mediatek.com, ted.huang@mediatek.com, Stella.Chang@mediatek.com, 
	Tom.Chou@mediatek.com, steve.lee@mediatek.com, jsiuda@google.com, 
	frankgor@google.com, abhishekpandit@google.com, michaelfsun@google.com, 
	abhishekpandit@chromium.org, mcchou@chromium.org, shawnku@google.com, 
	linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_185742_941112_541B850A 
X-CRM114-Status: GOOD (  32.04  )
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

On Wed, Sep 14, 2022 at 3:46 PM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi Sean,
>
> On Mon, Sep 12, 2022 at 3:18 PM <sean.wang@mediatek.com> wrote:
> >
> > From: Sean Wang <sean.wang@mediatek.com>
> >
> > Reset the BT device whenever the driver detected any WMT failure happened
> > to recover such kind of system-level error as soon as possible.
> >
> > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> > ---
> >  drivers/bluetooth/btusb.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> > index 653f57a98233..dc86726c8271 100644
> > --- a/drivers/bluetooth/btusb.c
> > +++ b/drivers/bluetooth/btusb.c
> > @@ -2576,6 +2576,10 @@ static int btusb_mtk_hci_wmt_sync(struct hci_dev *hdev,
> >         data->evt_skb = NULL;
> >  err_free_wc:
> >         kfree(wc);
> > +
> > +       if (err < 0)
> > +               btmtk_reset_sync(hdev);
>
> Doesn't reset itself can fail?

The reset is supposed not to fail so there is no return value is
designated in the function

>
> >         return err;
>
> It would probably be better to reset on error at the caller IMO, also
> in case it fails during firmware upload does reset even work? Also it

The reset is supposed to work even without the firmware uploaded but I
need to have further confirmation with fw folks to ensure this point.
Anyway, I will try to move the reset on the error at the caller or
based on the context in the next version because I thought again that
will also help
working out a patch to recover any error present at firmware
initialization that the driver currently cannot handle and the patch
cannot cover.

> would probably have been better to have its own file for vendor
> specific commands like this and use btmtk_ prefix as well.

I had tried to move btusb_mtk_hci_wmt_sync to btmtk.c to allow it to
be reused by all mtk bluetooth drivers but some reason stopped me from
doing that.
that is btusb_mtk_hci_wmt_sync has the reference to the data bundled
with btusb.c and it seemed a bit harder for me to split out from
btusb.c for the moment,
such as btusb data->flag the function will refer to and is shared by
all vendors, so I still temporarily leave the vendor-specific commands
there.
I think that would be easy to do if btusb.c can support a pointer in
struct btusb_data pointed to the vendor-specific data area where I can
put the flag and other
vendor-specific stuff the btmtk.c needed there.

             Sean
>
> >  }
> >
> > --
> > 2.25.1
> >
>
>
> --
> Luiz Augusto von Dentz

