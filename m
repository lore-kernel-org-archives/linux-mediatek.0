Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E363CD13DA
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 May 2026 23:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lP++FAphnGEVMYTuD5n34Rl8E/1MBjhqfPNK0rRBycI=; b=jkWTLhb3ZH+/AZLdUrqY0ZPIQ9
	Vtu8kq/TqDdNNIh3ww6qW03uGvgq0JT1DOEFaATFHa4GXi6Ufymtw/ffM9Z3uDOxjUFbam0wDniuP
	Kb9R5x0zJdjUaRq9gLlpXOPsgSbo2kJ3Y/+PsY+S/z9F+X/0JE+HeopemOaaq+t0KeM2ihMALEx9k
	PLQc1njK0rBv8F63iDEMLjro6WcJhm5Es7glNkHiDI6+VnWSxlAC+uB1GMFc1lbjMnABNGKwZe/p5
	G+K4tgWv/QrAqy5RKBzmH7tMhAGCmFCLL5Zou8z7RSNJPF4lc2QUF5mmbnu9KmE9ZrQhV3TlR1Zno
	zca4oarQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJJaf-00000009sL8-45DL;
	Sat, 02 May 2026 23:17:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJJae-00000009sKJ-02rk
	for linux-mediatek@lists.infradead.org;
	Sat, 02 May 2026 23:17:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 45D6444273
	for <linux-mediatek@lists.infradead.org>; Sat,  2 May 2026 23:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FD04C2BCB8
	for <linux-mediatek@lists.infradead.org>; Sat,  2 May 2026 23:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777763855;
	bh=rqEmI4p61btdIGegnhPECDvlCVi07iL5C2pXEDVQ/dk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=E/35L+o4l7R2pZfiYKWBaS6JdgVh7j8ocQWDhTP9Jz7LvlVZbILx2G450Stm3uMho
	 VQS5RWTAaKzxvmm8SrR/BcVnCt74TZ/Y6eSjLVYVv0JSSJKyYEGVCWq5I7H1nqcUuS
	 3aFL0mxY1dFUql0k4lvoEHAbF9voYfoW/1IhOaFphz1FeAmfOXzdJAm3nqad/gnaR3
	 TSq22I6KMtJOtuj5FzaOBSs/PCfbkTbUnSFQCo4v3yNidEvTBG3aPV+u0Ar7fkqcEg
	 Cn82kNzEeEwYiCEnfdlse1xerdjxuhH5OTMiXLRV0gMdO+f4GiYgyUaImNN2quK+9f
	 FP15eJtLo2Jpg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a74962749aso3186904e87.3
        for <linux-mediatek@lists.infradead.org>; Sat, 02 May 2026 16:17:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+d4bKUAoDIsp7Vfbp26HC45zHzN05Ym+IXlglPGyZZBDYZXZGLdQ9xygueVqWML2YMUgL3+F+a5zjpUYIMlA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMsGYEUtKCCzn7bvafnl1S4Cr4ghtmHnG3wNyrTndcqQ9QyxoG
	RB2tQxFDK1zQ4q80MTOFW4ixPYb0G5/WBv+h70xaVYcpz9n0fJcqt+93UU2DmTEWmhWl9OTbXLg
	c+4uIAVRqLtMRDoiq1weasvStF6CImiw=
X-Received: by 2002:a05:6512:3b9e:b0:5a7:46a1:a75d with SMTP id
 2adb3069b0e04-5a862ebb6f8mr1133987e87.2.1777763853436; Sat, 02 May 2026
 16:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAL2ecxgBeZNSSuwJROmuvGFsajjpxqV1+LYnoz5dYGUPA30HeA@mail.gmail.com>
In-Reply-To: <CAL2ecxgBeZNSSuwJROmuvGFsajjpxqV1+LYnoz5dYGUPA30HeA@mail.gmail.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Sat, 2 May 2026 18:17:21 -0500
X-Gmail-Original-Message-ID: <CAGp9LzqXKwJf7=bFuv_gW9yFH7uBuXva398TC=XOrZkyd-ermQ@mail.gmail.com>
X-Gm-Features: AVHnY4KbAJvnnGPJNB7tXzDuNnLELwzJYt9UpiSlf6wwEMLvAkJOT5cWmDvyqIc
Message-ID: <CAGp9LzqXKwJf7=bFuv_gW9yFH7uBuXva398TC=XOrZkyd-ermQ@mail.gmail.com>
Subject: Re: Bluetooth: btusb: Add VID/PID 0489:e156 for MediaTek MT7902
To: =?UTF-8?B?0JrQuNGA0LjQu9C7?= <kirill.kz.902@gmail.com>
Cc: sean.wang@mediatek.com, luiz.von.dentz@intel.com, 
	linux-bluetooth@vger.kernel.org, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_161740_090260_55479F0D 
X-CRM114-Status: GOOD (  12.15  )
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

Hi =D0=9A=D0=B8=D1=80=D0=B8=D0=BB=D0=BB,

Could you help get the USB device information from your test machine
as the following and reply to the mail?

The information in /sys/kernel/debug/usb/devices about the Bluetooth
device is listed as the below.

T:  Bus=3D07 Lev=3D01 Prnt=3D01 Port=3D00 Cnt=3D01 Dev#=3D  2 Spd=3D480  Mx=
Ch=3D 0
D:  Ver=3D 2.10 Cls=3Def(misc ) Sub=3D02 Prot=3D01 MxPS=3D64 #Cfgs=3D  1
P:  Vendor=3D13d3 ProdID=3D3596 Rev=3D 1.00
S:  Manufacturer=3DMediaTek Inc.
S:  Product=3DWireless_Device
S:  SerialNumber=3D000000000
C:* #Ifs=3D 3 Cfg#=3D 1 Atr=3De0 MxPwr=3D100mA
A:  FirstIf#=3D 0 IfCount=3D 3 Cls=3De0(wlcon) Sub=3D01 Prot=3D01
I:* If#=3D 0 Alt=3D 0 #EPs=3D 3 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3Dbtusb
E:  Ad=3D81(I) Atr=3D03(Int.) MxPS=3D  16 Ivl=3D125us
E:  Ad=3D82(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
E:  Ad=3D02(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
I:* If#=3D 1 Alt=3D 0 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3Dbtusb
E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D   0 Ivl=3D1ms
E:  Ad=3D03(O) Atr=3D01(Isoc) MxPS=3D   0 Ivl=3D1ms
I:  If#=3D 1 Alt=3D 1 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3Dbtusb
E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D   9 Ivl=3D1ms
E:  Ad=3D03(O) Atr=3D01(Isoc) MxPS=3D   9 Ivl=3D1ms
I:  If#=3D 1 Alt=3D 2 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3Dbtusb
E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D  17 Ivl=3D1ms
E:  Ad=3D03(O) Atr=3D01(Isoc) MxPS=3D  17 Ivl=3D1ms
I:  If#=3D 1 Alt=3D 3 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3Dbtusb
E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D  25 Ivl=3D1ms
E:  Ad=3D03(O) Atr=3D01(Isoc) MxPS=3D  25 Ivl=3D1ms
I:  If#=3D 1 Alt=3D 4 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3Dbtusb
E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D  33 Ivl=3D1ms
E:  Ad=3D03(O) Atr=3D01(Isoc) MxPS=3D  33 Ivl=3D1ms
I:  If#=3D 1 Alt=3D 5 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3Dbtusb
E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D  49 Ivl=3D1ms
E:  Ad=3D03(O) Atr=3D01(Isoc) MxPS=3D  49 Ivl=3D1ms
I:  If#=3D 1 Alt=3D 6 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3Dbtusb
E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D  63 Ivl=3D1ms
E:  Ad=3D03(O) Atr=3D01(Isoc) MxPS=3D  63 Ivl=3D1ms
I:* If#=3D 2 Alt=3D 0 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3D(none)
E:  Ad=3D8a(I) Atr=3D03(Int.) MxPS=3D  64 Ivl=3D125us
E:  Ad=3D0a(O) Atr=3D03(Int.) MxPS=3D  64 Ivl=3D125us
I:  If#=3D 2 Alt=3D 1 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3D(none)
E:  Ad=3D8a(I) Atr=3D03(Int.) MxPS=3D 512 Ivl=3D125us
E:  Ad=3D0a(O) Atr=3D03(Int.) MxPS=3D 512 Ivl=3D125us

I will send the patch including the VID/PID
thanks

On Sat, May 2, 2026 at 12:20=E2=80=AFPM =D0=9A=D0=B8=D1=80=D0=B8=D0=BB=D0=
=BB <kirill.kz.902@gmail.com> wrote:
>
> Hi Sean,
>
> Following your MT7902 series, here is one more VID/PID variant
> that is currently not recognized by btusb: 0489:e156 (Foxconn).
>
> Adding the entry below makes Bluetooth work on v7.1-rc1:
>
>   /* Additional MediaTek MT7902 Bluetooth devices */
>   { USB_DEVICE(0x0489, 0xe156), .driver_info =3D BTUSB_MEDIATEK |
>                                                BTUSB_WIDEBAND_SPEECH },
>
> dmesg after loading the patched module:
>
>   Bluetooth: hci0: HW/SW Version: 0x008a008a,
>                    Build Time: 20250826211444
>
> /sys/kernel/debug/usb/devices:
>
>   T:  Bus=3D01 Lev=3D01 Prnt=3D01 Port=3D09 Cnt=3D05 Dev#=3D6 Spd=3D480 M=
xCh=3D0
>   D:  Ver=3D 2.10 Cls=3Def(misc ) Sub=3D02 Prot=3D01 MxPS=3D64 #Cfgs=3D1
>   P:  Vendor=3D0489 ProdID=3De156 Rev=3D 1.00
>   S:  Manufacturer=3DMediaTek Inc.
>   S:  Product=3DWireless_Device
>   C:* #Ifs=3D 3 Cfg#=3D 1 Atr=3De0 MxPwr=3D100mA
>
> Could you include this VID/PID in the next MT7902 round?
>
> Tested-by: Kirill Shubin <kirill.kz.902@gmail.com>
>
> Thanks,
> Kirill
>

