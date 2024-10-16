Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C818D2A53F
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 19:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cfoPyOsmNKBpbW4UUVilRw1fzgl5ccqhl9fH1mrp5ew=; b=14CO6Nd+zfasAVy0b4VO5bBtwc
	AZto4/Lzn4AoXYtM+8s9IAW27w2GWFKqkm7Y/AHFAQpIKtwnzwrmcHDZ2TAkTIr9OsaPuCql9GN8I
	aJPyqzRx5gwnqxlO8FOhj7t09tvnKx/USvnO2kEuYriIZMYgamIEdJo62DTIMHf+WBxbZvWkjFhsQ
	Fli+Sjf0DQdPdchzmLZufdTHsdD3Yeyj+7/sRCwsPMHNFjMlKtZg4j6X8M6kcfNovwe8VnINOT5C2
	P0wJk6W/hUtCItt6BYiWELc/n0boY93wnd9g9iTUqqNeEW1h+oVaOkv+ygu9O6aAM4FnjS6jwGMQp
	y7DT4EFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t19Nf-0000000Cm5M-49eV;
	Wed, 16 Oct 2024 19:08:23 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t19Nd-0000000Cm4q-01Qf
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Oct 2024 19:08:22 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso2935931fa.3
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Oct 2024 12:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729105698; x=1729710498; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfoPyOsmNKBpbW4UUVilRw1fzgl5ccqhl9fH1mrp5ew=;
        b=avDAYvMEiDAL6Tw3saRn0A1UPnJroW8yZlaU1th5TEGLng+Pk475/zCrRrolPm132y
         lSSmhdpIrmLlE1CTanfcA4U/djJMtqYaCYVDIaRWcILAO9Hyfgl4oJD38ouHvczdMc9M
         CKmvpeE+YUNOPSc66f3Tzq1iuhGciv1MUH5wRrH3U2HmaRBc9zIzajxZ884GTLqngEaC
         18gvid2mC5VJKvDX96HkJoekHmsqOy8ISUFIhTrXjBQM5Q62V+78eF1KtRbVdGYlLSdO
         gZoTb5rPWy+mc9Aykzh8gstSAfd+g1Jc0njUco/zz360SQ/yg6TfVGFtYarq7GH7lQw0
         hDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729105698; x=1729710498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfoPyOsmNKBpbW4UUVilRw1fzgl5ccqhl9fH1mrp5ew=;
        b=KER4VVs7zZDO5yg/nm9mTU4UV1ugJ14i4InaV7KiRbwoAR2UVGI15Ip+NiDyHXTGOc
         vH6+gPzgng0fc9LX2kNO9/kPrbdveDN0WNxv5QgB05K46nLSFz71hdrE5XCkR4CoMYrO
         yf6c79i2ZfGM8yrQrVh5kpnxKr9/qWQK3cY4Ys4MxlO0Icu3c9+aRNSM+/E1YWM/geAb
         qisvrMZosOuxuHriDYrjLIFaE3qxLI/+HS3go/1BoNjVR5qh/HeNGkYbz2kLqa6fCGnq
         pA3w68Q6MtDVcFHplTHotcvFmHe6CdHDt4DQFY5rDWLqZgGNBVgPaqZbTCDP52D8aQ5o
         ePxg==
X-Forwarded-Encrypted: i=1; AJvYcCXOyH3TBWFa8Y87YX+LP95vm/rgUVShsJw5RAb4ISPCC4u9dcg0lSl76RZC9hrpo+QtkiPJ/OLfOEfjWRXnWw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6q7rKfirSkZe2ccdN6xASk76Ji8dIIrYJ1hSQ65fhyYAsZMxk
	8dfwg1uga6+KVtk5rUJji8ytWRdficIJTVoWL2ONUsoRxtP02PHyhFgSO3HwzaYYtohZyyDtQtH
	uMk1YoxP5/IBoY5E+AxmgmA4MHXI=
X-Google-Smtp-Source: AGHT+IFpMThFFX120dLLOYTQhI9ofrhgYrUm3CaUjbVmWJRaHSuAFYnolyq+nLH/xIMlkYVB0yPbfcJXrZtV1Hw3l5g=
X-Received: by 2002:a2e:6101:0:b0:2fb:51a:d2a with SMTP id 38308e7fff4ca-2fb3f197c65mr92963161fa.12.1729105698221;
 Wed, 16 Oct 2024 12:08:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhaqxrW=0g9E2qWdEXTGkjv5cxZLAu-6UGDO5tGLxZDdQXvJg@mail.gmail.com>
 <CABBYNZKu465GRDOCGepyckgrk4CZF4tOwbzUN6HQyG8ZKfg=8w@mail.gmail.com>
In-Reply-To: <CABBYNZKu465GRDOCGepyckgrk4CZF4tOwbzUN6HQyG8ZKfg=8w@mail.gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 16 Oct 2024 15:08:05 -0400
Message-ID: <CABBYNZ+pYGDBUWg1=+X8JiHVeTHe4rZM20ckTixpGW6bLsnaBw@mail.gmail.com>
Subject: Re: Bluetooth not working on 13d3:3585 IMC Networks Wireless_Device
To: Grimoire April <aprilgrimoire@gmail.com>, Chris Lu <chris.lu@mediatek.com>
Cc: linux-bluetooth@vger.kernel.org, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_120821_072184_E1BA09C1 
X-CRM114-Status: GOOD (  16.86  )
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

Hi Chris,

On Wed, Oct 16, 2024 at 2:51=E2=80=AFPM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi Grimoire,
>
> On Wed, Oct 16, 2024 at 3:28=E2=80=AFAM Grimoire April <aprilgrimoire@gma=
il.com> wrote:
> >
> > Hi. I have a laptop with an integrated bluetooth adaptor recognized as
> > a usb device. However, it fails to initialize properly. Searching for
> > other instances on bugzilla, it seems others had success with
> > 13d3:3585 adaptors.
> >
> > (base) =E2=9E=9C  ~ sudo dmesg | grep Bluetooth
> > [    0.422244] Bluetooth: Core ver 2.22
> > [    0.422254] Bluetooth: HCI device and connection manager initialized
> > [    0.422257] Bluetooth: HCI socket layer initialized
> > [    0.422261] Bluetooth: L2CAP socket layer initialized
> > [    0.422265] Bluetooth: SCO socket layer initialized
> > [    0.530052] Bluetooth: HCI UART driver ver 2.3
> > [    0.535346] Bluetooth: HIDP (Human Interface Emulation) ver 1.2
> > [    0.535355] Bluetooth: HIDP socket layer initialized
> > [    3.556068] Bluetooth: hci0: Opcode 0x0c03 failed: -110
> >
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D218472
> >
> > I updated to 6.11.1 and the issue persists.
>
> Well it looks like the reset command is timing out, but the issue was
> originally the PID:VID was not supported in btusb so perhaps something
> else is happening, perhaps another manufacturer that don't support
> short-transfer which was introduced by 7b05933340f4 ("Bluetooth:
> btusb: Fix not handling ZPL/short-transfer") so try reverting that to
> see if it helps.

Seems this appears to be a Mediatek chip are you guys able to verify
the above change doesn't break with your controllers?

>
> > Thank you.
> >
>
>
> --
> Luiz Augusto von Dentz



--=20
Luiz Augusto von Dentz

