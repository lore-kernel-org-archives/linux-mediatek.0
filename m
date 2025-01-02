Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6993E77188
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jan 2025 18:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NQcau/BB7dj0sJpfDA0CTE7nGuqHtruxLb382JO6UGU=; b=FS4HZTu+v83XCQgkjZ/e2L1nm3
	lZEF04PZVSVN/TfKSPcpkXWusE1XWqxIBG06DpFaqhNXTsJTfSVKEGXkcHayJw8O5UTJBT1V0Kwy3
	Zkdw1JcTU5eEo7X308zj+K1tF0HylfZLD8g+Vk2EFZHudGqS9O3MXTX0F8Hut5QHJOvtwqAKd3G5T
	RrxegdVPI6luwdQ9HWshHzmpUh0o+f8VhBYOv2UMj2p6Vfa6ejVaZAt0A1XcdEy3Tn8ryKw/oCwp7
	THz9OPCMiIXplsUiR4igZxqnDVFV1626mWkXN8jKy/zaPAy11vXySiGa2+9uAL94eftXbbkFFTh/U
	bkaDxV3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTQAk-0000000BB2j-3qHY;
	Thu, 02 Jan 2025 18:43:54 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTQAi-0000000BB2A-3r3V
	for linux-mediatek@lists.infradead.org;
	Thu, 02 Jan 2025 18:43:54 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6d8f75b31bfso100858276d6.3
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Jan 2025 10:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=epc-instore.com; s=google; t=1735843431; x=1736448231; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQcau/BB7dj0sJpfDA0CTE7nGuqHtruxLb382JO6UGU=;
        b=bCleCzFbLUNUxx6U80T9f/OGXHgsUCCljaJcGBs/C/v0JOhZvTzYSucLbUI6i1h9tI
         /dAyNlFWt4BbOJRSx/wYej85P8MvdguucOcaR3+vp/ouAu/1ZXMbqMZoudbfomXCJjDB
         Fo62uc650CRHx83rNfQrYSIa4ltxSjhfrbdQBjERUjmM1eLPdZEYPPAjFnj5YekrowKr
         xfJDO2DrM9Sd5XRrJC4/sQeDG/olV+XMp7d0fZ3o999AalssCneMmLG1aZoK8vmEmsnr
         uxtrPVFQ9i2YSu/Riaw9Sq8g7lCMbja2xHaiGC/ZBP+O/RAi+MxByVs7Vm+O5JdCCCRR
         ugZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735843431; x=1736448231;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NQcau/BB7dj0sJpfDA0CTE7nGuqHtruxLb382JO6UGU=;
        b=m/1Fjp7mYBn/BZ5rSUz199+vmCGuNiW0Y/Is5jQI7RNSIQpJyYD/VwNOVeyESrovP+
         o2C0xWPVCGyuFPaEpZ8mzV0mCiK6avcW+7xxXx4AKpsEJuZw/6XdqfiJkPKlbn82ToTG
         suV5GseVh/Uh9pmaACOtstUmBr2GNqyObBAVxX/mE9KLyNfDRHsY6ennXOamPrur/fLy
         BNtvVosyxe5bpOp1S8YoCOQZ1rMOvPEV29Xe8f2ovYQHui0FTXFyFMd0bdcIwObPGtVC
         ce7zX3/JvN9mo2PBh7cUy2JCXK+rewVj//GQ0SKiQu0cSl5uV5oeS/7ATrYRySUFfoYG
         EjWA==
X-Gm-Message-State: AOJu0Yx2aVZwVS/5AjOWAevPc9HZODhllHH1nRR5BKKhDFC6CoSvkgIm
	fnLV3YqoKqU911JTwqIlLdxTuoXU84LCGrLZZsSEj6+ILPvAjq0+F4cDh0uxcgHv9fYaAoLnij0
	av/a+1YaywcdSrGr/+OO4AuGAn/mJxCLZzTZUQRCBQGRI0pPnnbE=
X-Gm-Gg: ASbGncsUgjcQCpJQvuFPcjwrrnC300xW4aCLQJqEiVpBASYunvoWENWOlEIjjPG9/hH
	h2ig1BkorDQYbiTWnSpeN6Ubjo4pAzhsmZ+xPTQ==
X-Google-Smtp-Source: AGHT+IENON8kTY141gi/0VqaTwBMFLWynKBhi3FggeiIZ3EduNNUGJesSl07sazVv1TUu4x/Z6XVEHR7v2/0KLDb+9o=
X-Received: by 2002:a05:6214:406:b0:6d8:861f:adca with SMTP id
 6a1803df08f44-6dd233b6db6mr744489536d6.42.1735843430957; Thu, 02 Jan 2025
 10:43:50 -0800 (PST)
MIME-Version: 1.0
References: <CAH+ZgJt8d0zzbroeLDqPkCr-2OOq9vvVShVoAiFiTGVH+Hwasw@mail.gmail.com>
 <CAH+ZgJuer+hc7FAQC81uZpnnWKuOoNushbkTJgSXMG87fbtzDA@mail.gmail.com>
In-Reply-To: <CAH+ZgJuer+hc7FAQC81uZpnnWKuOoNushbkTJgSXMG87fbtzDA@mail.gmail.com>
From: Brett Bergquist <bbergquist@epc-instore.com>
Date: Thu, 2 Jan 2025 13:43:40 -0500
Message-ID: <CAH+ZgJv7XUzc1XxVRtFi5Xb+=ZfpgSG111BnWsLzAXoWccbhbA@mail.gmail.com>
Subject: Re: Problem in Linux with Alfa AWUS036ACHM where the device appears
 not to be initialized correctly on a reboot
To: linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_104353_036424_4D2DDBA3 
X-CRM114-Status: GOOD (  54.70  )
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

Trying to poke this again if possible and an update.

I have been able to replicate the same issue on straight Ubuntu 24.04
and with multiple units so the problem is real.  Basically the problem
seems to be that the USB unit does not get completely reset at start
up.

For example, right now, I have a unit in my lab that after a reboot,
the unit has limited network connectivity.  For example, ICMP echo can
work, but SSH does not.  On a hunch I turned down the MTU size on my
laptop trying to access the system with the Alfa unit to 256 bytes,
and I am actually then able to access through the network.  This
further indicates an internal issue with something not being reset on
the Alfa unit when the drive was loaded.

If there is any register map, programmer guide, anything for the chip
that is being used would be useful.  I think I did find the datasheet
with the pin out, but not much else.

On Tue, Dec 10, 2024 at 8:15=E2=80=AFAM Brett Bergquist
<bbergquist@epc-instore.com> wrote:
>
> I am going to try to patch the driver.  My first cut will be to use
> debugfs to see if I can do something that would reset the hardware as
> if it was from a power on.   Anyone know of a datasheet or reference
> manual for the Mediatek MT7610UN chip?  The chip is labeled
>
> MEDIATEK
> MT7610UN
> 2131-AMAL
> FTPAR540
>
>
> On Sat, Dec 7, 2024 at 1:59=E2=80=AFPM Brett Bergquist
> <bbergquist@epc-instore.com> wrote:
> >
> > I have a product that is built using Yocto Kirkstone release (Kernel
> > version 5.15) that uses the Alfa AWUS036ACHM product.  It is working
> > most of the time but I have a strange situation.  If I reboot the
> > system, there will come a time where the device is detected but it
> > does not work.  This is using systemd-networkd for networking and
> > using wpa_supplicant.
> >
> > To stress the system, I am externally logging into the system and
> > rebooting.  This might be successful for a number of iterations, I
> > have seen 30 reboots.  Eventually however the networking will fail
> > with wpa_supplicant not progressing at all.  I connect a console cable
> > to observe what I see.
> >
> > When in this state, the USB device is seen, the modules loaded look lik=
e
> > >
> > > root@9998:~# lsmod
> > > Module                  Size  Used by
> > > mt76x0u                16384  0
> > > mt76x0_common          40960  1 mt76x0u
> > > mt76x02_usb            20480  1 mt76x0u
> > > mt76_usb               28672  2 mt76x02_usb,mt76x0u
> > > mt76x02_lib            61440  3 mt76x02_usb,mt76x0_common,mt76x0u
> > > mt76                   57344  5 mt76_usb,mt76x02_lib,mt76x02_usb,mt76=
x0_common,mt76x0u
> >
> > Everything looks normal.   However the wifi does not work.  Using "iw
> > dev wlan0 station dump" and nothing is seen.  I have so far found
> > nothing that I can do in software that will reliably get wifi out of
> > this state.   I have tried
> >
> > delaying starting wpa_supplicant for a bit (30 seconds) after boot on
> > the theory to let the USB bits in the kernel settle
> > reset the USB port and restart the wpa_supplicant
> > unbind and rebind the USB device and restart the wpa_supplicant
> > unload the driver kernel module and reload the driver kernel module
> > and restart the wpa_supplicant
> >
> > Even a reboot of the system will not recover once in this state.  I
> > can recover by unplugging the wifi device USB connection and replug it
> > back in and then restart wpa_supplicant and the networking comes right
> > up.  A reboot likely does not cause loss of power to the wifi device.
> >  I can also recover by a complete power off/power on of the system.
> >
> > It is as if the wifi device gets into some state that is not good and
> > cannot be cleared in software.  I have also seen the device get into a
> > state where it appears connected but only partially in that I can pass
> > things such as ICMP ECHO to and from the system, but I cannot pass
> > data, as an example SSH into our out of the system starts but hangs.
> > Using Wireshark I can see the TCP connection being established with
> > the SYN, SYN/ACK, ACK handshake but then start of the SSH setup fails
> > and times out.   Again, simply unplug and replug the wifi device and
> > it works.
> >
> > Note that this occurs on multiple wifi devices which I have used with
> > the same system and also the same wifi device on a different system.
> > After a number of reboots I can get into this state.
> >
> > So my question is if that type of thing has been seen and possibly
> > corrected in a later kernel version.  I would then attempt to backport
> > changes as needed.
> >
> >
> > --
> > Brett M. Bergquist
> > Distinguished Member Technical Staff
> > EntryPoint Communications LLC
> > 30 Waterside Drive, Suite 100
> > Farmington, CT 06032
> >
> > Phone: (203) 206 3542
> > Email: bbergquist@epc-instore.com
> >
> > CONFIDENTIALITY NOTICE
> > This message (including any attachments) contains information that may
> > be confidential.  If you are the intended recipient, and the message
> > is marked confidential, by opening the message, you accept
> > responsibility for treating the message and information contained in
> > the message as confidential, including not distributing or disclosing
> > its contents to any third party without the express written consent of
> > the sender.  If you are not the intended recipient, you may not read,
> > print, retain, use, copy, distribute or disclose to anyone the message
> > or any information contained in the message, and such conduct is
> > prohibited.  If you have received this message in error, please advise
> > the sender by reply e-mail, and destroy all copies of the original
> > message (including any attachments).  Sender reserves all rights of
> > confidentiality and privilege, and nothing regarding this e-mail or
> > its transmission is intended to be a waiver thereof.

