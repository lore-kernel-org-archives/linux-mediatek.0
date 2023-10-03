Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43295E75456
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 12:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LNO5GJBfVgDppnnjLs8Ey/aGvi+SY8q8n/RPtqg6Lb0=; b=nSYekOsMiw/vYnNc8zCROGWT+K
	8yVyc0RFejHBgH0SstUSpTBzCXqEEGGZ3nt2FsiDjWboSblBIo9YRCQzJiv7tJa8vLa0viitcaCEe
	hLoUpIM4dQWZCeWGt1rKNqkEj1zlyeGsdU4MDXfhYeEcDBr+E0EAEtpraJu19OHgVT+bUklgLt1x7
	L0IpkhIs7LASoRgnCWORHOOZpkgIqC9loGlIgKIjaXD6BrHH5WvMsBOKcjJBYvlc6gV+esX9yoUTz
	Y650VvLvWlmrzN62TXBTmC5Pvl+4OR1enuhxH1WbVXR2kMttO4a+50hWDrNLcQ6xv3ULd3sFKCjIG
	Ic2vfAZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qneTW-00Ebwm-0X;
	Tue, 03 Oct 2023 12:26:06 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qneTT-00Ebve-1Q;
	Tue, 03 Oct 2023 12:26:04 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-d84c24a810dso899264276.2;
        Tue, 03 Oct 2023 05:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696335958; x=1696940758; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNO5GJBfVgDppnnjLs8Ey/aGvi+SY8q8n/RPtqg6Lb0=;
        b=jyB7qEsuvek4zK/IxzuwG/K9wu0A3CqVVTXCBKZk82DnO9r24C5666pl1rfipUsKVi
         3XreLukiK58soezXdtwdZmyRecuPSG3psprBy6ghMPVwC9njlVpXkNt3lfeUP+gXjpb8
         jr80uWsFk/lFeHzg25hF/YQw5v9YMbslqZN1ZhGUs5XxdmtVR25pD1Zd+GZoMquioY1a
         Ql3KuEmEg8YCIxhR0LM68xv4x5Vr7ClEadw8UkQtC/I1YSd7R4qoF5qCkRGzc2/iGgUe
         jjQiLhWIkvzocUfUdRFU1uesEhUuuM7Z9fhxnvYpWuWFu33K7/FwA9yGXw6P1vU25d5v
         rW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696335958; x=1696940758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LNO5GJBfVgDppnnjLs8Ey/aGvi+SY8q8n/RPtqg6Lb0=;
        b=dmSpGLAm0PwdjUjow1GGcTOyuxATSMbULGu+Lt1LihoZEOT7o7pcd6SZXDHACtu17x
         j+y5yL0tbtkeNg+8zeWY3xjMjuyPdx/j3j8B428aHj8mVC0U8KJCMye2wz5Zl+AtMkTb
         uOJyTHCE1Qq+7NEPR32FculpRbW2mbdXR5kDHwUJjraCLbGGYrcTEyCypt9hQPevgJ2z
         WmjbVGG57dxYcJM1QJiik8igMV67E/ikAjbxvMQ18ALW5GYRku06c6WYHGhwBrDnCseA
         9NMUVye1zN+nfjashV1bG/dUo088turvaj8wr1DHLpsbTR+oxMXd4UvphtzSUk5SpzN6
         aBzQ==
X-Gm-Message-State: AOJu0Yz8+K011hMZs/bSuzfd4aoFJd+liMXFSERiYVqLV+RRxY2FkQmo
	y5YUtYtp5rcrll25lmmHZZExMoT1WF3QxoZtlaI=
X-Google-Smtp-Source: AGHT+IH3vFPI8wkZPSB+huGryIAf1o97KjtxkawCjpbmFqLZ7a060PcmeyqhgyDquT7PF4ujt0bcej93HgDs77wHvAQ=
X-Received: by 2002:a05:6902:707:b0:d85:aa81:53f0 with SMTP id
 k7-20020a056902070700b00d85aa8153f0mr16641798ybt.4.1696335957740; Tue, 03 Oct
 2023 05:25:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAH7-e5sb+kT_LRb1_y-c5JaFN0=KrrRT97otUPKzTCgzGsVdrQ@mail.gmail.com>
 <ZRtWcgiH5JhD5NU2@debian.me>
In-Reply-To: <ZRtWcgiH5JhD5NU2@debian.me>
From: =?UTF-8?Q?Erik_Dob=C3=A1k?= <erik.dobak@gmail.com>
Date: Tue, 3 Oct 2023 14:25:46 +0200
Message-ID: <CAH7-e5uspavg_VBJxKLOKJfU3nAq-OrPqzihF2opffY-ReiC-w@mail.gmail.com>
Subject: Re: bluetooth issues since kernel 6.4 - not discovering other bt
 devices - /linux/drivers/bluetooth/btusb.c
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Stable <stable@vger.kernel.org>, 
	Linux Bluetooth <linux-bluetooth@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Mediatek <linux-mediatek@lists.infradead.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Marcel Holtmann <marcel@holtmann.org>, 
	Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?Q?Tomasz_Mo=C5=84?= <tomasz.mon@nordicsemi.no>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_052603_478480_70CB1812 
X-CRM114-Status: GOOD (  20.66  )
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

On Tue, 3 Oct 2023 at 01:47, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>
> On Sun, Oct 01, 2023 at 07:47:54AM +0200, Erik Dob=C3=A1k wrote:
> > Hello!
> >
> > I bought a new laptop fujitsu life book and everything is going fine
> > on artix just the bt makes trouble:
> >
> > /var/log/error.log
> > Sep 30 18:43:48 nexus bluetoothd[2266]:
> > src/adapter.c:reset_adv_monitors_complete() Failed to reset Adv
> > Monitors: Failed (0x03)
> > Sep 30 18:43:48 nexus bluetoothd[2266]: Failed to clear UUIDs: Failed (=
0x03)
> > Sep 30 18:43:48 nexus bluetoothd[2266]: Failed to add UUID: Failed (0x0=
3)
> > Sep 30 18:43:48 nexus bluetoothd[2266]: Failed to add UUID: Failed (0x0=
3)
> >
> > i searched a bit the webs and found a new commit at kernel org that
> > does do the trouble:
> > https://bugs.archlinux.org/task/78980
> >
> > follow the linkeys inside the commits there or read this one:
> >
> > ---------------before------------------------------------
> > /* interface numbers are hardcoded in the spec */
> >         if (intf->cur_altsetting->desc.bInterfaceNumber !=3D 0) {
> >                 if (!(id->driver_info & BTUSB_IFNUM_2))
> >                         return -ENODEV;
> >                 if (intf->cur_altsetting->desc.bInterfaceNumber !=3D 2)
> >                         return -ENODEV;
> >         }
> > -----------after----------------------------------------------------
> > if ((id->driver_info & BTUSB_IFNUM_2) &&
> >     (intf->cur_altsetting->desc.bInterfaceNumber !=3D 0) &&
> >     (intf->cur_altsetting->desc.bInterfaceNumber !=3D 2))
> > return -ENODEV;
> > --------------------------------------------------------
> >
> > the dude just hooked up 3 conditions in a row with && where before it
> > was 2 conditions in 1 condition. + the comment was removed.
> >
> >
>
> Try latest mainline first (currently v6.6-rc4). Because you have to
> compile your own kernel, please refer to
> Documentation/admin-guide/quickly-build-trimmed-linux.rst if you don't kn=
ow how to do the compilation.
>
> Also, don't top-post when replying; reply inline with appropriate context
> instead.
>
> Thanks.
>
> --
> An old man doll... just what I always wanted! - Clara

Hi i booted now into linux-6.6-rc4 and the issue is still there. No
bluetooth devices are discovered.
with this device: Bus 001 Device 004: ID 04c5:1670 Fujitsu, Ltd Bluetooth R=
adio

E

