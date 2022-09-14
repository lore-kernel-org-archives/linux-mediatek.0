Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E764BC6FA82
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 23:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLE/SkXtP2amDBsbmmzNzmFhHJFP2BueWAE58h7qqFs=; b=WLAhJnW552fWt6vtRA7b9f5oDl
	rICqSTvqb9Q05PlC4/ZYsudRTEpdcGz7OHHOZFpGgXNeOKyNV2GgaTmK+S/bKCJeNnqoVZ3T6ZnQr
	FBy1+gqjqiWirfLgQuLWwH+xaTD9y3da0A1VrAF/crrCWzYBagZoYb/lG0PC7fXb5192n/OOk7Xw2
	nD4mX7BojDeKiv1oUgKiq9aNBKsw53toqmuuM2RUQH1gsBS6Fdqiw3YnKBMTMTKcQg5CpW6Mx7TyO
	5QPNvx0RMDIxgt73LN0Wlou+GhcWj3T0LKkTUa/WjoDaB7J34OZ1PfdWQCO+8jPYjotHwK1iaY38F
	s3I23rmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYbMK-00Bhna-Sb; Wed, 14 Sep 2022 22:59:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYbMH-00Bheu-Sw
	for linux-mediatek@lists.infradead.org; Wed, 14 Sep 2022 22:59:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 34E2961F6E
	for <linux-mediatek@lists.infradead.org>; Wed, 14 Sep 2022 22:59:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 863D2C43140
	for <linux-mediatek@lists.infradead.org>; Wed, 14 Sep 2022 22:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663196392;
	bh=oWqqdyBXsokNJ3n9bzT2vkSRtqN+2pGUWbS5nYnQsTg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WpA7MwY3qrlIOvQJuzLzBuUA0PTGT9Lnje7tnXMz3DteGiR1yFr8oPSS1l4qf9Akr
	 UzUsjPljRzimjKGqUdTNGUtywUef0Bz9EZhHQYgOt1YyXB5dQ1+hq9jNM3dSO6/hop
	 Uo4/a8KV2ySCM1korX2pji1Eaz8L6hq1yL27ztqg2hLAiue7aOgaSmqL5n91DV+kmP
	 56k5gVZDiF7f+jbQ7LfiX71LEVZWfWLEFbQK2Yf4VZXvuI4quEwcFOqipgsrYhAmAJ
	 +0auUWHy1k+ksil4SS5MtvBmgB9pOgg67AVs0XXE1O/OW4haDwKsvARseas6eRwAQK
	 XMMrPzi1sLjtQ==
Received: by mail-wm1-f52.google.com with SMTP id ay36so3061838wmb.0
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Sep 2022 15:59:52 -0700 (PDT)
X-Gm-Message-State: ACgBeo38Gl5nGP2Dq3PMWhJfQ+hEVeajvogSH5u8bU85wNb9a/aZICRY
	WS0rqy5FRJPXRpfYV3FeMZrT9g/evrl8I5dOtlw=
X-Google-Smtp-Source: AA6agR7qaHmVQJjOn3ABWhUEKPyB5dmh5/6FOPhCQ93FD/FBWSx3finiKnKlWC/6fdcKkqMYciv4HAmIrP/+z1PjHoo=
X-Received: by 2002:a05:600c:22d3:b0:3a8:424d:f386 with SMTP id
 19-20020a05600c22d300b003a8424df386mr4636751wmg.57.1663196390712; Wed, 14 Sep
 2022 15:59:50 -0700 (PDT)
MIME-Version: 1.0
References: <43b68b1f48c20b1dfcd7e6663c3dcb38e4e0648c.1663020936.git.objelf@gmail.com>
 <8c734b83-aa2a-83a6-cb12-28e36ace2bbb@collabora.com>
In-Reply-To: <8c734b83-aa2a-83a6-cb12-28e36ace2bbb@collabora.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Wed, 14 Sep 2022 15:59:38 -0700
X-Gmail-Original-Message-ID: <CAGp9Lzq5LrDi0qgOOWFXtGJObYEyxsMz=M_UBObwstBc9p+1=g@mail.gmail.com>
Message-ID: <CAGp9Lzq5LrDi0qgOOWFXtGJObYEyxsMz=M_UBObwstBc9p+1=g@mail.gmail.com>
Subject: Re: [PATCH 1/4] Bluetooth: btusb: mediatek: use readx_poll_timeout
 instead of open coding
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sean.wang@mediatek.com, marcel@holtmann.org, johan.hedberg@gmail.com, 
	luiz.dentz@gmail.com, Soul.Huang@mediatek.com, YN.Chen@mediatek.com, 
	Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, 
	km.lin@mediatek.com, robin.chiu@mediatek.com, Eddie.Chen@mediatek.com, 
	ch.yeh@mediatek.com, posh.sun@mediatek.com, ted.huang@mediatek.com, 
	Stella.Chang@mediatek.com, Tom.Chou@mediatek.com, steve.lee@mediatek.com, 
	jsiuda@google.com, frankgor@google.com, abhishekpandit@google.com, 
	michaelfsun@google.com, abhishekpandit@chromium.org, mcchou@chromium.org, 
	shawnku@google.com, linux-bluetooth@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_155954_046107_EB3C7002 
X-CRM114-Status: GOOD (  29.53  )
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

HI Angelo,

On Tue, Sep 13, 2022 at 1:04 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 13/09/22 00:18, sean.wang@mediatek.com ha scritto:
> > From: Sean Wang <sean.wang@mediatek.com>
> >
> > Use readx_poll_timeout instead of open coding to poll the hardware reset
> > status until it is done.
> >
> > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
>
> Hello Sean, thanks for the patch!
> However, there's something to improve...
>
> > ---
> >   drivers/bluetooth/btusb.c | 32 ++++++++++++++++++--------------
> >   1 file changed, 18 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> > index c3daba17de7f..4dc9cae3e937 100644
> > --- a/drivers/bluetooth/btusb.c
> > +++ b/drivers/bluetooth/btusb.c
>
> ..snip..
>
> > @@ -2910,18 +2918,14 @@ static void btusb_mtk_cmd_timeout(struct hci_dev *hdev)
> >       btusb_mtk_uhw_reg_write(data, MTK_BT_SUBSYS_RST, 0);
> >       btusb_mtk_uhw_reg_read(data, MTK_BT_SUBSYS_RST, &val);
> >
> > -     /* Poll the register until reset is completed */
> > -     do {
> > -             btusb_mtk_uhw_reg_read(data, MTK_BT_MISC, &val);
> > -             if (val & MTK_BT_RST_DONE) {
> > -                     bt_dev_dbg(hdev, "Bluetooth Reset Successfully");
> > -                     break;
> > -             }
> > +     err = readx_poll_timeout(btusb_mtk_reset_done, hdev, val,
> > +                              val & MTK_BT_RST_DONE,
> > +                              100000, 1000000);
>
> I agree with using readx_poll_timeout() instead of open coding the same, but
> there's a catch: this macro uses usleep_range(), which is meant to be used
> for sleeping less than ~20ms.
>
> Even the kerneldoc at include/linux/iopoll.h advertises that:
>
>   * @sleep_us: Maximum time to sleep between reads in us (0
>   *            tight-loops).  Should be less than ~20ms since usleep_range
>   *            is used (see Documentation/timers/timers-howto.rst).
>
> So, if there's any reason for which you can't sleep for less than 100ms
> per iteration, I'm afraid that you can't use readx_poll_timeout()...
> ...otherwise, please change sleep_us to 20000 and keep the timeout at 1 sec.
>

It should be able to be done with polling in 20ms until 1 sec expires
or it is done. It increases some cost in the bus transaction
interacting with the device, but it seemed fine for me because the
code path is cold, it is only working in the device reset which should
rarely happen, and only involves when it is really necessary. That is
a nice catch. I was trying not to break the existing logic
but overlooked the requirements of the API.

    Sean

> Regards,
> Angelo
>
> > +     if (err < 0)
> > +             bt_dev_err(hdev, "Reset timeout");
> >
> > -             bt_dev_dbg(hdev, "Polling Bluetooth Reset CR");
> > -             retry++;
> > -             msleep(MTK_BT_RESET_WAIT_MS);
> > -     } while (retry < MTK_BT_RESET_NUM_TRIES);
> > +     if (val & MTK_BT_RST_DONE)
> > +             bt_dev_dbg(hdev, "Bluetooth Reset Successfully");
> >
> >       btusb_mtk_id_get(data, 0x70010200, &val);
> >       if (!val)
>

