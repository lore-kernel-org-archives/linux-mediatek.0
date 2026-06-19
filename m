Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C383CD98F2
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2026 14:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbcGH9ITMmOI3YSas2gsikCqBTKnvtgdWwDyBNbyusg=; b=tEuw8lZOgNrAx6Xqm552NL6i1v
	iUj1HpsS0+l0rrRptZ+dzbleGGmY1RJkQaguwhSCP9oXH0asYDy20wXjgxabvpv5bkdfGgP6Axh60
	lzoevij9SC8vvoQL3Y/AISspLsRdMs/7lnm4TlMa+4LJVBBLOeDNudRMIBx7KufYI/KHNiOB1mJz8
	mvpc2NUmeIZCgZBfI8y4fVGnTD2z9p2DUOdrHoBrfF+qg7dWSc6OtzYfG76Po8WkvVVscAFPyuh+s
	Mz5LbCew4lg4K4E5yET8qtltn6pPmgdqZe/vuKMrV7N3oLRFlprt5FXFUj1edvve+xJFtKUbjNz0b
	MyXOfFkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waa5L-00000002ZMe-26Sp;
	Fri, 19 Jun 2026 14:20:43 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waa5J-00000002ZLx-0zAY
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Jun 2026 14:20:42 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-8dd21386a9aso17371516d6.2
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Jun 2026 07:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781878840; x=1782483640; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbcGH9ITMmOI3YSas2gsikCqBTKnvtgdWwDyBNbyusg=;
        b=F9TQyuJOLI01hE1MVO3wbBsIdCx6fkXi0TplQKymOqIdHRblfr9lSViRXLckQoP6Hv
         rFbv8y5mxBi/agAHapds4Osl5oIapjNSQ2RMglKXLpQBBFh0qH2RMPYiUeAE9lh0p3SI
         cxjGO/RB+GwMMB4fFk72BJfrpeGRGUB5OUGNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781878840; x=1782483640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fbcGH9ITMmOI3YSas2gsikCqBTKnvtgdWwDyBNbyusg=;
        b=scG58yAw0CKwiK/Na8LYeTmgsgw12WRSGMZGp1CHQVw3GCj53eDurHTVaZm2n2h0R+
         v5p9lgCI1P934iWhVUFrAYoTYrR/sNLY+ukKA1e3fxE4n3suLqdbB0/74fMSAjX4FRSj
         oCsIk0MVhp7tjIpJbp4zwJAg2VbPfVqUtnSm7B/TCN14EZZ1lAycuryWWXop4bH1W8bT
         noPIT+whJBGdV8SW+qhJWWxPPqNhekR/7nNQJ3N9cpjcMGnp/CoJ4mhp65l8/LuJPRAB
         veavWdybKyupCFtJAz0ohwqFmW/lRRoImBfsdp9AWoDJAxfhKUNHcbR33abmpwGAssfG
         uA5A==
X-Forwarded-Encrypted: i=1; AFNElJ85TeW14xxRMpAN+zj60ngbIb9VtILF2e9corCyVSNgOUbVEnr0O+iT6kKyN43LzKaHnyr3P24wxE0OdHVC4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzseCViVbVe4+0WRoZUJwXFaiTALxFjRiM1HbSN7ncBF+r2IjbL
	N6SZC5R2rsK4NPaSZZW7xPvDMDe5r/qn+nPWTkJwwC6sDpIvFKM/3ZAsAmJme01jj6IvUPBuQYH
	LpJsbwQ==
X-Gm-Gg: AfdE7cn5pHlTdvpg4e+QUXiT4q/c1wusrVOB/Szmc6/W00CWqTApnTv3HNQV+3Yammz
	M0tY4TyRc87HWaWkMZJ3w7FrhSBds/rl6OOeCIwwM/ANoCP+DTapu8/kfh6VPeddFS2pLb30vSX
	W6HGzhDA3JBosYGwaI0HAr3gebe5zUrx+mXG6HrJdaYvPiLyNsjqjBWqElFJ7PhY5ednPTXbkUw
	O9g0G/9lTnUdm9XQ2wV1KzC1/pMGs7jtOK5jPkl/VRFFFlsS090DrpLSTBjVTOFiNgs2CgLy1u4
	grOrp+QC9sfxiaFkGtGl1oS8BcwuI/HUOGm70eJSYrSpQrKQRsTETjSNJrkvKdocAwekYbltM3A
	qtrJM5CFNI6MvdBgk9dM38RpGjlWJgpYn2wk0OUh9XHdzabby0bn8oufsGAri+/kJHzq7pteoyS
	zHkypqXXFZvcna/0EKunrwdvk2yGorpa5ElovF/Zk2W//5UNVJN24=
X-Received: by 2002:a05:6214:1bc6:b0:8cc:ed49:bdc9 with SMTP id 6a1803df08f44-8de3b43e008mr64823316d6.5.1781878839998;
        Fri, 19 Jun 2026 07:20:39 -0700 (PDT)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com. [209.85.160.181])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8de62900982sm23562716d6.41.2026.06.19.07.20.38
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 07:20:39 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-519ed52bcc6so186211cf.0
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Jun 2026 07:20:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+lf/JrOHuFjyQphVTyIXZZhrt4keJFWCczLJmW0TtdimGHkDet9EJoC7C+7nBFdmTkq3cyHqZ7x+b5aOoyBw==@lists.infradead.org
X-Received: by 2002:ac8:7d8e:0:b0:516:4f62:85ec with SMTP id
 d75a77b69052e-519e8d1f14dmr7406931cf.17.1781878838041; Fri, 19 Jun 2026
 07:20:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260609121329.1262170-1-senozhatsky@chromium.org>
 <CAGp9LzpBUReZtrTEKgUr-+yvB+3tcs5hw7ziC4WaMRFNa2AYpg@mail.gmail.com> <87tsqyirsn.wl-tiwai@suse.de>
In-Reply-To: <87tsqyirsn.wl-tiwai@suse.de>
From: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 19 Jun 2026 23:20:20 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BtO7vL_A2i84CoF1Dk7Bmp_DZQJgoNAB-HyGA89=XDUQ@mail.gmail.com>
X-Gm-Features: AVVi8Cfvj7Tldb-rRHpdw6zA1vefldpMM6jJzOD0R18t-VmMpCoygqlJxAYuFRA
Message-ID: <CAAFQd5BtO7vL_A2i84CoF1Dk7Bmp_DZQJgoNAB-HyGA89=XDUQ@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btmtksdio: fix infinite loop in btmtksdio_txrx_work()
To: Takashi Iwai <tiwai@suse.de>
Cc: Sean Wang <sean.wang@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Mark-yw Chen <mark-yw.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_072041_284603_DA12028C 
X-CRM114-Status: GOOD (  32.14  )
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

[Resending without HTML... Damn Gmail]

On Fri, Jun 19, 2026 at 10:27=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote=
:
>
> On Wed, 10 Jun 2026 08:52:31 +0200,
> Sean Wang wrote:
> >
> > Hi,
> >
> > On Tue, Jun 9, 2026 at 7:19=E2=80=AFAM Sergey Senozhatsky
> > <senozhatsky@chromium.org> wrote:
> > >
> > > Every once in a while we see a hung btmtksdio_flush() task:
> > >
> > >  INFO: task kworker/u17:0:189 blocked for more than 122 seconds.
> > >  __cancel_work_timer+0x3f4/0x460
> > >  cancel_work_sync+0x1c/0x2c
> > >  btmtksdio_flush+0x2c/0x40
> > >  hci_dev_open_sync+0x10c4/0x2190
> > >  [..]
> > >
> > > It all boils down to incorrect time_is_before_jiffies() usage in
> > > btmtksdio_txrx_work().  The btmtksdio_txrx_work() loop is expected
> > > to be terminated if running for longer than 5*HZ.  However the
> > > timeout check is twisted:  time_is_before_jiffies(old_jiffies + 5*HZ)
> > > evaluates to true when old_jiffies + 5*HZ is in the past i.e. when a
> > > timeout has occurred.  Using OR with time_is_before_jiffies(txrx_time=
out)
> > > means that:
> > > - before the 5-second timeout: the condition is `int_status || false`=
,
> > >   so it loops as long as there are pending interrupts.
> > > - after the 5-second timeout: the condition becomes `int_status || tr=
ue`,
> > >   which is always true.
> > >
> > > When the loop becomes infinite btmtksdio_txrx_work() loop never
> > > terminates and never releases the SDIO host.
> > >
> > > Fix loop termination condition to actually enforce a 5*HZ timeout.
> > >
> > > Fixes: 26270bc189ea4 ("Bluetooth: btmtksdio: move interrupt service t=
o work")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> > > ---
> > >  drivers/bluetooth/btmtksdio.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtks=
dio.c
> > > index 5b0fab7b89b5..c6f80c419e90 100644
> > > --- a/drivers/bluetooth/btmtksdio.c
> > > +++ b/drivers/bluetooth/btmtksdio.c
> > > @@ -620,7 +620,7 @@ static void btmtksdio_txrx_work(struct work_struc=
t *work)
> > >                         if (btmtksdio_rx_packet(bdev, rx_size) < 0)
> > >                                 bdev->hdev->stat.err_rx++;
> > >                 }
> > > -       } while (int_status || time_is_before_jiffies(txrx_timeout));
> > > +       } while (int_status && time_is_after_jiffies(txrx_timeout));
> >
> > yes, loop continues only while there is interrupt work and the timeout
> > deadline is still in the future
>
> I stumbled on this while backporting to distro kernels, and I wonder
> whether this change is correct.
>
> IIUC, this essentially makes the loop exiting right after the first
> cycle; the patch changed from time_is_before_jiffies() to *_after_*(),
> not only the logical OR to AND, and *_after_*() returns false, so the
> whole condition becomes false, too.

The intention is for the loop to keep running as long as there is
still an interrupt left to handle (int_status !=3D 0) and the timeout
has not elapsed (jiffies < txrx_timeout).

Note that time_is_after_jiffies(x) returns true if x > jiffies (or jiffies =
< x):

/**
 * time_is_after_jiffies - return true if a is after jiffies
 * @a: time (unsigned long) to compare to jiffies
 *
 * Return: %true is time a is after jiffies, otherwise %false.
 */
#define time_is_after_jiffies(a) time_before(jiffies, a)

Or am I missing something?

Best,
Tomasz

