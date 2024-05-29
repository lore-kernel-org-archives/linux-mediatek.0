Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC94C25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 15:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aTV/N/Q3fP3Vcah0VLqoOxvD6zs2GRo1SBCQqNoRyzU=; b=4wApBfQSSPKqngJ8NI9jVM7EGK
	4mZ2bqGwf9YZNfl+yRs42S57e9wpNMHwi756U3FsJ2k8W6LF1b5B02w6NIQfma3xOlB89dOlIVQ5h
	Lx9NNfZc+OSlpBFb0kRq61JIpUiDDs61e90p3Q93DSC/g5ghIj/p3NPyKzxED3B+9qF4iAyLA3BV4
	+NZuHqXejFMXrRsDGXvvJ3eBbG+faKYeuMCz0+JQ/eLieMNMmSS6nzMISWGLJWaDG4wxc/Ia/c4+o
	IUb2pg7t8wL3iea6wdnIDO40QpSdIZefkEZCs0P1GgyQCQny5eX9fUPXkx/1PBIDYavWDyP9biUWo
	EYCHJT7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCL7F-00000004fLm-1VWl;
	Wed, 29 May 2024 15:21:25 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCL7C-00000004fJf-0d7X
	for linux-mediatek@lists.infradead.org;
	Wed, 29 May 2024 15:21:23 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2e73359b900so23398881fa.2
        for <linux-mediatek@lists.infradead.org>; Wed, 29 May 2024 08:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716996079; x=1717600879; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aTV/N/Q3fP3Vcah0VLqoOxvD6zs2GRo1SBCQqNoRyzU=;
        b=itirPgNNCUKbPSJiHc3YRQgIhfEpMsEf+kOXRjCE0vOJqOiBqwUdXBoPCXqlKcZ1tz
         xeo+hOGFaLfIND2R01HqV9XIfQ/lFPWOCQnkonj/NfHcmvDzN8jvDFUoYdBR28Erp4Ns
         5guZPP6d1O+zy3OGfU0jsbC1TQsHO4GrIM5fDnxMZIfxGJyAudoBAjz5wHe5A+MC7KTc
         goCPwvNsyrchoxa7ZIQy7IwT/Qtmf3AADtfO/fk3N31paBV9fAlXKf65zw0w5yl2DlLQ
         TkT2PrmZXIBlNp0Xirb3ZI34ZXIFqUsiiF1p/JbHm4ZgM2ga/paHMN56SZInisJigptb
         zKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716996079; x=1717600879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aTV/N/Q3fP3Vcah0VLqoOxvD6zs2GRo1SBCQqNoRyzU=;
        b=Qu/CY9ajpFP4s9kQfJvVbIcY874XntLe6NuezA57eOfdgUEH+l+a2arEYDbpMaJzQB
         /7zl9cPe9Mt7qxQ9jNrkGpzbHrOW1OTICP3sTw+wsfwOigX3XPdFXOYhf7spZQUqi0w8
         iLteMmTbn8Fs60/nza6aJFV3wGtkhPBXliG4QMrc8mwrfQw41LNzEHQP9ILlIbzr1UJA
         fkHGrq/0DpUR0zY71gakdLR7tIbWiF9QnkHsjF2tRKGPCsMnDW92NoePAnJgkwsad6Xv
         GIsFnpuzZCYHcuCP5Q8tBD7+ayfzAgxsNZkMkz2OZ61h10v1vo65e3WOXo6FprIbxfXw
         cjHA==
X-Forwarded-Encrypted: i=1; AJvYcCX98SJ1MwGTGkupM/WKAf9iuMnYe9glo30nze4F+qK+tGmhuCLSNZJVvSZWZeztf9JpJOemvfdr0NDVjnWGYdI/hC1H519XGxXzJVQsgKoYLS23
X-Gm-Message-State: AOJu0YwWeZ5e14LME98tBG57VahHj2+3TFAXYgwcQH61HJiID+MsVJM6
	BPW/RIcM/Ds9EV+AGkQU+4G4a8ncq2wyFALspF05u6uoG6rEvu+5pkZudcn8Og1iFH1zqBuLnU4
	aTiB7W3NdPktq8jcFSq/iB6IzyRgBkQ==
X-Google-Smtp-Source: AGHT+IHr6ULrcnT5E/lPVWVaYF04PbQdUY+CLMl9D6kJ5eWkus/DlhrB4/8Oqdw9chZZVdGRAkKgQALZY45Y+brbwxo=
X-Received: by 2002:a2e:bc08:0:b0:2e5:15d0:511c with SMTP id
 38308e7fff4ca-2e95b287586mr129735891fa.40.1716996078653; Wed, 29 May 2024
 08:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240529033038.28458-1-chris.lu@mediatek.com>
In-Reply-To: <20240529033038.28458-1-chris.lu@mediatek.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 29 May 2024 11:21:05 -0400
Message-ID: <CABBYNZLEWCFo_OWvPxaM54S65-mAhZ-3R1XgRqb-UnUChcJV9w@mail.gmail.com>
Subject: Re: [PATCH 0/3] Bluetooth: btusb: MediaTek ISO data transmission support
To: Chris Lu <chris.lu@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Deren Wu <deren.Wu@mediatek.com>, 
	Aaron Hou <aaron.hou@mediatek.com>, Steve Lee <steve.lee@mediatek.com>, 
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_082122_230689_2F18F079 
X-CRM114-Status: GOOD (  11.97  )
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

Hi,

On Tue, May 28, 2024 at 11:30=E2=80=AFPM Chris Lu <chris.lu@mediatek.com> w=
rote:
>
> Since SIG hasn't clearly defined the specification about ISO data over US=
B
> transmission yet, MediaTek adopts a method by adding an additional interr=
upt
> endpoint for ISO data transmission which is different from current way
> on Bluetooth upstream driver using existed bulk. Interrupt endpoint has
> guaranteed bandwidth, sufficient max data length for LE audio packet and
> support error checking. These characteristics are similar to the use of I=
SO data.
>
> Chris Lu (3):
>   Bluetooth: net: add hci_iso_hdr function for iso data
>   Bluetooth: btmtk: add macro to get/set/clear MediaTek defined flags
>   Bluetooth: btusb: mediatek: add MediaTek ISO data transmission
>     function
>
>  drivers/bluetooth/btmtk.c   |  35 +++++
>  drivers/bluetooth/btmtk.h   |  46 ++++++
>  drivers/bluetooth/btusb.c   | 293 +++++++++++++++++++++++++++++++++++-
>  include/net/bluetooth/hci.h |   5 +
>  4 files changed, 378 insertions(+), 1 deletion(-)

This probably needs to be handled in btmtk.c though, since it is not
standard we shall avoid having vendor specific transports like this in
btusb.c


--=20
Luiz Augusto von Dentz

