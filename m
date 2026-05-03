Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8245FF885A
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 May 2026 08:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MI1A1UFPYZfvPV8oo35iianwafnkNQWOMiPqsUJkuBY=; b=wb7AHXxoEICevDDkhViAzCciBb
	iZsYQTpWQBhib8YEPEHiRb6QNXlVl5A0jGxKVjKHBs9JqID1aQFXwFUKoHlnwJqZt8h8LzxqE6RG2
	JogJx1VSK0YIoctbMgd56qo8H/R1UPIpGVCJDtW3pb56Xwzl6+WZa8ipuzKd2KTBqdc0UdTcpSXby
	wCOtSSLW5oR1W10A+39NzrFHShpOetGvwJA1Ywtii4rgMSGFCyKfG5RBazU9+44prKRgXnPkSvLap
	Lb4LvwAqbb9dJwgWeQiE69hi09egXdXND/Z1dII2opOotXujgKy+bpJVCj7w1UY3FxIBAzF4+tjYo
	bC4rcGhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJSQo-0000000AejI-0lhL;
	Sun, 03 May 2026 08:44:06 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJSQl-0000000Aeis-0zNs
	for linux-mediatek@lists.infradead.org;
	Sun, 03 May 2026 08:44:04 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-82f8b60e485so1476314b3a.0
        for <linux-mediatek@lists.infradead.org>; Sun, 03 May 2026 01:44:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777797842; cv=none;
        d=google.com; s=arc-20240605;
        b=SoJBYpr/VZWj7TSaS93V0uWb7CgDhbQr1NTF1AXxg+vvHnpGOhTJV3+CwvB2J2BpNF
         GrybaBlku1WrzrbhbprxWYeh0kboRF8b8cSNBuj4rFYXiqtUGhSANFZlpPWrh4yhKbJj
         UYXdBMkVaBRzzFlSZGsMOOWoAyFEbiHyH54WRIZz5Eyz/sbNwYoq2TGlLq/e2I/gQ3av
         VOU4YsmWzLt7BjoAOtxdUd2Y69eiXQqeeWYN0X3ieWfIwWpV3mwjlvMyGReE6e8yQEJ6
         /zOupUmi4EjlIINpNt8G/btR+4xkvygInbqnLRVWrr/kRIavNb5l2CqnBhs5aaDgVv4D
         XWug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MI1A1UFPYZfvPV8oo35iianwafnkNQWOMiPqsUJkuBY=;
        fh=p12Uv8i2JM5i6It3LBtCQxC/wf1oQA52u7lw2pxJ2e0=;
        b=Ddvo99Kxtd1Zvl0j0yqkdg3YHRG9El8q3W+Hvtsy826BXv+B4XihcUE8VsH6Pv8HsG
         sR6yjCU/YyEWhHnMZVfOMfM9/n6Fc8oZHseOveDNS9HEAO432aOmeCVMa3u2wyY5CMHz
         5B8CL3QUQo6z2lZpvZIxHjJJ/VUwf4FrnLiSJl65dodtsAWhSXQh4zWQCGHaxCSBqFa+
         rxYL8yiwhw7J3qrof20qhHFZgIKPjQHa9xtNUZWiQy0g4MGoJon60xJp4rKWupCYCe8y
         jlVkwQk2z/R0vXkB9gCQ9ZkDHOeuiVyDH4zalK4dKPtJelA2gO24vCDtjqwFZS1wMK3r
         n8gg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777797842; x=1778402642; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MI1A1UFPYZfvPV8oo35iianwafnkNQWOMiPqsUJkuBY=;
        b=H0QS0uXAfLKishSTIAYOX3KEHeU2SDXkVx/OfydQSWi4PQ9KygxzTiqW7w29i3gJRa
         aTM9FO9GbyD/rjlsbxz6EOUR+CGcsUi+epEHyUh5r0ghZvKCXZz7tFqRK4vudRFzdgLn
         arjLsQOG6SD4OuhLiRVYb0Kqt56IHg+TLHQ+AYvF/vhqDYviIe13LDE6JWc/kz90IRit
         z+ao/TXmGDWTAYh+YO0+UhgMLGhkdkvLyhlWY6Ug6jOLEyhW5LVAma7eZ5btaGXnoACU
         0Mskx4+jnnmslkcyallvWFUyyx/j/bjxfQWdVmxJZ4Z46DgqX3hUQnuFtEfcB4sa92bi
         W5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777797842; x=1778402642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MI1A1UFPYZfvPV8oo35iianwafnkNQWOMiPqsUJkuBY=;
        b=fc/5SHulinp7WlO+uHezXp/fTqhUzgv5amngVS+J6lPuMnM8sGi+KNgI9zSwTzsIjh
         7InA4mvNM1pyUbdngW+6fSiFUZwuzsZyEtOYY00+27mjQiYbiSNwADG6AXEpQOHdNS8e
         jjCC95nxv6MQZ+mlbtB1lueea5KBfemebHQ1BwG1qkYfpBdq/61Ivm/KTnTTQZjXtZYF
         PNuosFohrEDBhKnLfQaD9thsG3tbjFwXIikXB1E5RDgl97yqCi3/16E4q9of00K5Q0T4
         +7/QikRb3sztq2A+Ox4pC71kllly7jZo9NnCleZqSaaC0j2EzkLPu/FRmhgvTmpG00u5
         WWUQ==
X-Forwarded-Encrypted: i=1; AFNElJ+qxVeKQWcwODMeEfwIyVrvPSaEjyTe4iPazrUiMXGAIQ1RDeIRLvQqby4pAOUQlZyKuBzqsPLtFtVlukHpdA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyH583BUp0K/bD+iVwXOfpFT9GhLIiiHla/NKPHSknQftcNhrur
	EBlZvXGg7LXM0ChG8Cr19MAkwMupG85Q3XiMC0ARnxCVKy3tkecnNH7bUrzbKCTDzmUG3K0cQ0B
	+zTYGA5YOPbyDJpGuEv7+gnHg20iPej8=
X-Gm-Gg: AeBDietmfdjGmZIUKchNRVZkbaxRntZ9qgwSVNLjD/sBidiBu44p7LK5fGy32m/PVmT
	xKB0zEhbr75kjUVeRHZgAQlUW4qUjC79baIljg6PQ820TB/tRj+truH0JZnOF0350ofNTDrNOuC
	ebxr0ExdeO89dwca2ReZw/W8RRHvigzpDe3yV5LxT7OCT4IiqBaMijtt+I6uu01kfPDiWSOyfx7
	WC9v8xDiFMo0w4y2moTo6LRi+PSwL35wbO2bk4U5pTXd2GmAusYlBEEZcWM4U4kyv/AkYGIJPq/
	N8QR5dL128ZUEW88eA==
X-Received: by 2002:a05:6a00:4487:b0:823:9b7:9c0e with SMTP id
 d2e1a72fcca58-8352d24ab51mr5238945b3a.34.1777797841666; Sun, 03 May 2026
 01:44:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAL2ecxgBeZNSSuwJROmuvGFsajjpxqV1+LYnoz5dYGUPA30HeA@mail.gmail.com>
 <CAGp9LzqXKwJf7=bFuv_gW9yFH7uBuXva398TC=XOrZkyd-ermQ@mail.gmail.com>
In-Reply-To: <CAGp9LzqXKwJf7=bFuv_gW9yFH7uBuXva398TC=XOrZkyd-ermQ@mail.gmail.com>
From: Kirill Shubin <kirill.kz.902@gmail.com>
Date: Sun, 3 May 2026 11:43:50 +0300
X-Gm-Features: AVHnY4JiNrQcMhNqrTmLQXqOeUArDUsHBNXUmogxuJicF9bAQHuGZvVpYQt98lA
Message-ID: <CAL2ecxgVHBOF2Na-xen4yRCjt7+x1YYtZSp8XLw8m7a0ZJspJA@mail.gmail.com>
Subject: Re: Bluetooth: btusb: Add VID/PID 0489:e156 for MediaTek MT7902
To: Sean Wang <sean.wang@kernel.org>
Cc: sean.wang@mediatek.com, luiz.von.dentz@intel.com, 
	linux-bluetooth@vger.kernel.org, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_014403_286672_23607876 
X-CRM114-Status: GOOD (  16.25  )
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

Hi Sean,

On Sat, May 2, 2026, Sean Wang wrote:
> Could you help get the USB device information from your test machine
> as the following and reply to the mail?

Sure, here is the full information for 0489:e156 from
/sys/kernel/debug/usb/devices:

T:  Bus=3D01 Lev=3D01 Prnt=3D01 Port=3D09 Cnt=3D05 Dev#=3D  6 Spd=3D480  Mx=
Ch=3D 0
D:  Ver=3D 2.10 Cls=3Def(misc ) Sub=3D02 Prot=3D01 MxPS=3D64 #Cfgs=3D  1
P:  Vendor=3D0489 ProdID=3De156 Rev=3D 1.00
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
I:  If#=3D 2 Alt=3D 0 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3Dbtusb
E:  Ad=3D8a(I) Atr=3D03(Int.) MxPS=3D  64 Ivl=3D125us
E:  Ad=3D0a(O) Atr=3D03(Int.) MxPS=3D  64 Ivl=3D125us
I:* If#=3D 2 Alt=3D 1 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3Dbtusb
E:  Ad=3D8a(I) Atr=3D03(Int.) MxPS=3D 512 Ivl=3D125us
E:  Ad=3D0a(O) Atr=3D03(Int.) MxPS=3D 512 Ivl=3D125us

> I will send the patch including the VID/PID
> thanks

Thanks for your help!

Best regards,
Kirill Shubin


=D0=B2=D1=81, 3 =D0=BC=D0=B0=D1=8F 2026=E2=80=AF=D0=B3. =D0=B2 02:17, Sean =
Wang <sean.wang@kernel.org>:
>
> Hi =D0=9A=D0=B8=D1=80=D0=B8=D0=BB=D0=BB,
>
> Could you help get the USB device information from your test machine
> as the following and reply to the mail?
>
> The information in /sys/kernel/debug/usb/devices about the Bluetooth
> device is listed as the below.
>
> T:  Bus=3D07 Lev=3D01 Prnt=3D01 Port=3D00 Cnt=3D01 Dev#=3D  2 Spd=3D480  =
MxCh=3D 0
> D:  Ver=3D 2.10 Cls=3Def(misc ) Sub=3D02 Prot=3D01 MxPS=3D64 #Cfgs=3D  1
> P:  Vendor=3D13d3 ProdID=3D3596 Rev=3D 1.00
> S:  Manufacturer=3DMediaTek Inc.
> S:  Product=3DWireless_Device
> S:  SerialNumber=3D000000000
> C:* #Ifs=3D 3 Cfg#=3D 1 Atr=3De0 MxPwr=3D100mA
> A:  FirstIf#=3D 0 IfCount=3D 3 Cls=3De0(wlcon) Sub=3D01 Prot=3D01
> I:* If#=3D 0 Alt=3D 0 #EPs=3D 3 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3Dbtusb
> E:  Ad=3D81(I) Atr=3D03(Int.) MxPS=3D  16 Ivl=3D125us
> E:  Ad=3D82(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> E:  Ad=3D02(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> I:* If#=3D 1 Alt=3D 0 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3Dbtusb
> E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D   0 Ivl=3D1ms
> E:  Ad=3D03(O) Atr=3D01(Isoc) MxPS=3D   0 Ivl=3D1ms
> I:  If#=3D 1 Alt=3D 1 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3Dbtusb
> E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D   9 Ivl=3D1ms
> E:  Ad=3D03(O) Atr=3D01(Isoc) MxPS=3D   9 Ivl=3D1ms
> I:  If#=3D 1 Alt=3D 2 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3Dbtusb
> E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D  17 Ivl=3D1ms
> E:  Ad=3D03(O) Atr=3D01(Isoc) MxPS=3D  17 Ivl=3D1ms
> I:  If#=3D 1 Alt=3D 3 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3Dbtusb
> E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D  25 Ivl=3D1ms
> E:  Ad=3D03(O) Atr=3D01(Isoc) MxPS=3D  25 Ivl=3D1ms
> I:  If#=3D 1 Alt=3D 4 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3Dbtusb
> E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D  33 Ivl=3D1ms
> E:  Ad=3D03(O) Atr=3D01(Isoc) MxPS=3D  33 Ivl=3D1ms
> I:  If#=3D 1 Alt=3D 5 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3Dbtusb
> E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D  49 Ivl=3D1ms
> E:  Ad=3D03(O) Atr=3D01(Isoc) MxPS=3D  49 Ivl=3D1ms
> I:  If#=3D 1 Alt=3D 6 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3Dbtusb
> E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D  63 Ivl=3D1ms
> E:  Ad=3D03(O) Atr=3D01(Isoc) MxPS=3D  63 Ivl=3D1ms
> I:* If#=3D 2 Alt=3D 0 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3D(none)
> E:  Ad=3D8a(I) Atr=3D03(Int.) MxPS=3D  64 Ivl=3D125us
> E:  Ad=3D0a(O) Atr=3D03(Int.) MxPS=3D  64 Ivl=3D125us
> I:  If#=3D 2 Alt=3D 1 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3D(none)
> E:  Ad=3D8a(I) Atr=3D03(Int.) MxPS=3D 512 Ivl=3D125us
> E:  Ad=3D0a(O) Atr=3D03(Int.) MxPS=3D 512 Ivl=3D125us
>
> I will send the patch including the VID/PID
> thanks
>
> On Sat, May 2, 2026 at 12:20=E2=80=AFPM =D0=9A=D0=B8=D1=80=D0=B8=D0=BB=D0=
=BB <kirill.kz.902@gmail.com> wrote:
> >
> > Hi Sean,
> >
> > Following your MT7902 series, here is one more VID/PID variant
> > that is currently not recognized by btusb: 0489:e156 (Foxconn).
> >
> > Adding the entry below makes Bluetooth work on v7.1-rc1:
> >
> >   /* Additional MediaTek MT7902 Bluetooth devices */
> >   { USB_DEVICE(0x0489, 0xe156), .driver_info =3D BTUSB_MEDIATEK |
> >                                                BTUSB_WIDEBAND_SPEECH },
> >
> > dmesg after loading the patched module:
> >
> >   Bluetooth: hci0: HW/SW Version: 0x008a008a,
> >                    Build Time: 20250826211444
> >
> > /sys/kernel/debug/usb/devices:
> >
> >   T:  Bus=3D01 Lev=3D01 Prnt=3D01 Port=3D09 Cnt=3D05 Dev#=3D6 Spd=3D480=
 MxCh=3D0
> >   D:  Ver=3D 2.10 Cls=3Def(misc ) Sub=3D02 Prot=3D01 MxPS=3D64 #Cfgs=3D=
1
> >   P:  Vendor=3D0489 ProdID=3De156 Rev=3D 1.00
> >   S:  Manufacturer=3DMediaTek Inc.
> >   S:  Product=3DWireless_Device
> >   C:* #Ifs=3D 3 Cfg#=3D 1 Atr=3De0 MxPwr=3D100mA
> >
> > Could you include this VID/PID in the next MT7902 round?
> >
> > Tested-by: Kirill Shubin <kirill.kz.902@gmail.com>
> >
> > Thanks,
> > Kirill
> >

