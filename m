Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CBEE77182
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2024 13:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p7hnsHcH54Ur/vG2UoZuszFC6vhR9LuWCvvxRhtw/nw=; b=B9m6skE8W8swZGoFHRYzzLXgJ6
	e54A2soRLA/GI9Drr/DH1NMqlZfc+aOgi7qceukavbRQTByVoZw/12XXDKPtpHpDGVQkpZLLSaZIp
	7MirVWLOBE1mV+uXdcOZgNrTvmvaN+BiaOS/ZIvZ8voB5H6129BOpiJaEO+Rj6NmngpXCSESklYO4
	cplcsaw8gQ9LB4Gpz2nouAhxfnBI15s/zNl9DIT7OowtWSBiDxkzMQ1fDM3XxXWJXWeMeJyB/D1Y1
	elkTa3+HUhzSTILSHoAo/zJ0OmQ45zPaceUBnkOS3TVUwUhq2pOlly7vZqnOdyOPnMM6Ez55z03Cw
	Jx2MFetA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL05e-0000000BYaO-49Gs;
	Tue, 10 Dec 2024 13:15:50 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL05c-0000000BYZ3-3cHv
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Dec 2024 13:15:50 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6d884e8341bso39476936d6.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Dec 2024 05:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=epc-instore.com; s=google; t=1733836547; x=1734441347; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7hnsHcH54Ur/vG2UoZuszFC6vhR9LuWCvvxRhtw/nw=;
        b=jroc8lCjDINkaUJyjF0FLZpgtAzKWTg89s4fQoknTvYM8cuDQkwqJsoQgpRXQW0W4r
         H/3ZHAFdkpHPdEBiH0zEszw5j5V/vm/aQpIdgUSKWj4bNocOWx0crlTzeMV9AdtfccP0
         sinLQOtVBYD3vaQ+JLj9O1ApQtmhHyktOFnSiQ0gMhTiU9bHiVZhCCepj5ky47qDWV/n
         IIdqrHFdhZhNN8myvDvcEUQa8C8baYwGVaCZoUrKExOuOFWgU/p8UqEphy2RB+WuqaOu
         +4NWJ2te2a3MRATUoTNhE4/TutKbmnHmR+SRFgnD3itVVK6+Eox6tMPztB8p3t/TbI8+
         +/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733836547; x=1734441347;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p7hnsHcH54Ur/vG2UoZuszFC6vhR9LuWCvvxRhtw/nw=;
        b=hXInCwEl2VPJTxRb3zH2/FLG+SUMSNRHTTvkbA4kS8nfj7da0yM02nZjsHURiWw2iw
         z6Uw06MmA9+w89Ky1dwAZDE9RPMv6S+SKlQt3Fhv+MYv7vXNpGlI+tz8dAkCHuNRqVuA
         W9akYOzc4TNCDL5ppoO8NjE1THE7Wy7cOV2r5kkRixpEZ9vpzlUqDVXJpEH4MsF2IZYP
         mbFX0K9YtR/6wRjkW2g5aubHrzkddIYAwKDzyKLQetxxX+BV3nEa24DCmwH1TdBllX/B
         86UJFqmOKM5Bzz647BpBDasKDpeBbloVeOmsfIaAddWopZtL6swKCHPySZJRpcaEDan9
         msiQ==
X-Gm-Message-State: AOJu0YznurTepInboRbp/OHc/Lj84HhxRdhYSCUFvRQhlejpJolYmCNa
	EIseYaWNa5696Xlczkw+d0/4g3+C8TgZzEhUGtK8KBcLgg8D24599jWbTPrcyUnKdtLDjGw8L/6
	lKwPEPVMFUXrTabl7CN4GrNuPQUVledLibBrreo3Gz2CR51vX7UY=
X-Gm-Gg: ASbGncuIKHh2cw5Jh3kqDTmNJnWvsSCqUe3+0kWF3KBxWKAdaU0elTQ6IqWV7NkpbDW
	Fyi1qW+zLa6gVobHimJUFtYhX5K26VVHFzK0=
X-Google-Smtp-Source: AGHT+IFjVcTjAk1xJ1haydCG+nMYq/0dlBcfT8K03+AuzRkN9wpxPpdNagkAIfEO5KHxSEiJsWiDlJzt1mheiLSIPE0=
X-Received: by 2002:ad4:5ec9:0:b0:6d4:1e43:f3a5 with SMTP id
 6a1803df08f44-6d8e70ce8d3mr240774596d6.13.1733836546744; Tue, 10 Dec 2024
 05:15:46 -0800 (PST)
MIME-Version: 1.0
References: <CAH+ZgJt8d0zzbroeLDqPkCr-2OOq9vvVShVoAiFiTGVH+Hwasw@mail.gmail.com>
In-Reply-To: <CAH+ZgJt8d0zzbroeLDqPkCr-2OOq9vvVShVoAiFiTGVH+Hwasw@mail.gmail.com>
From: Brett Bergquist <bbergquist@epc-instore.com>
Date: Tue, 10 Dec 2024 08:15:35 -0500
Message-ID: <CAH+ZgJuer+hc7FAQC81uZpnnWKuOoNushbkTJgSXMG87fbtzDA@mail.gmail.com>
Subject: Re: Problem in Linux with Alfa AWUS036ACHM where the device appears
 not to be initialized correctly on a reboot
To: linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_051548_964367_D7FA3B72 
X-CRM114-Status: GOOD (  40.13  )
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

I am going to try to patch the driver.  My first cut will be to use
debugfs to see if I can do something that would reset the hardware as
if it was from a power on.   Anyone know of a datasheet or reference
manual for the Mediatek MT7610UN chip?  The chip is labeled

MEDIATEK
MT7610UN
2131-AMAL
FTPAR540


On Sat, Dec 7, 2024 at 1:59=E2=80=AFPM Brett Bergquist
<bbergquist@epc-instore.com> wrote:
>
> I have a product that is built using Yocto Kirkstone release (Kernel
> version 5.15) that uses the Alfa AWUS036ACHM product.  It is working
> most of the time but I have a strange situation.  If I reboot the
> system, there will come a time where the device is detected but it
> does not work.  This is using systemd-networkd for networking and
> using wpa_supplicant.
>
> To stress the system, I am externally logging into the system and
> rebooting.  This might be successful for a number of iterations, I
> have seen 30 reboots.  Eventually however the networking will fail
> with wpa_supplicant not progressing at all.  I connect a console cable
> to observe what I see.
>
> When in this state, the USB device is seen, the modules loaded look like
> >
> > root@9998:~# lsmod
> > Module                  Size  Used by
> > mt76x0u                16384  0
> > mt76x0_common          40960  1 mt76x0u
> > mt76x02_usb            20480  1 mt76x0u
> > mt76_usb               28672  2 mt76x02_usb,mt76x0u
> > mt76x02_lib            61440  3 mt76x02_usb,mt76x0_common,mt76x0u
> > mt76                   57344  5 mt76_usb,mt76x02_lib,mt76x02_usb,mt76x0=
_common,mt76x0u
>
> Everything looks normal.   However the wifi does not work.  Using "iw
> dev wlan0 station dump" and nothing is seen.  I have so far found
> nothing that I can do in software that will reliably get wifi out of
> this state.   I have tried
>
> delaying starting wpa_supplicant for a bit (30 seconds) after boot on
> the theory to let the USB bits in the kernel settle
> reset the USB port and restart the wpa_supplicant
> unbind and rebind the USB device and restart the wpa_supplicant
> unload the driver kernel module and reload the driver kernel module
> and restart the wpa_supplicant
>
> Even a reboot of the system will not recover once in this state.  I
> can recover by unplugging the wifi device USB connection and replug it
> back in and then restart wpa_supplicant and the networking comes right
> up.  A reboot likely does not cause loss of power to the wifi device.
>  I can also recover by a complete power off/power on of the system.
>
> It is as if the wifi device gets into some state that is not good and
> cannot be cleared in software.  I have also seen the device get into a
> state where it appears connected but only partially in that I can pass
> things such as ICMP ECHO to and from the system, but I cannot pass
> data, as an example SSH into our out of the system starts but hangs.
> Using Wireshark I can see the TCP connection being established with
> the SYN, SYN/ACK, ACK handshake but then start of the SSH setup fails
> and times out.   Again, simply unplug and replug the wifi device and
> it works.
>
> Note that this occurs on multiple wifi devices which I have used with
> the same system and also the same wifi device on a different system.
> After a number of reboots I can get into this state.
>
> So my question is if that type of thing has been seen and possibly
> corrected in a later kernel version.  I would then attempt to backport
> changes as needed.
>
>
> --
> Brett M. Bergquist
> Distinguished Member Technical Staff
> EntryPoint Communications LLC
> 30 Waterside Drive, Suite 100
> Farmington, CT 06032
>
> Phone: (203) 206 3542
> Email: bbergquist@epc-instore.com
>
> CONFIDENTIALITY NOTICE
> This message (including any attachments) contains information that may
> be confidential.  If you are the intended recipient, and the message
> is marked confidential, by opening the message, you accept
> responsibility for treating the message and information contained in
> the message as confidential, including not distributing or disclosing
> its contents to any third party without the express written consent of
> the sender.  If you are not the intended recipient, you may not read,
> print, retain, use, copy, distribute or disclose to anyone the message
> or any information contained in the message, and such conduct is
> prohibited.  If you have received this message in error, please advise
> the sender by reply e-mail, and destroy all copies of the original
> message (including any attachments).  Sender reserves all rights of
> confidentiality and privilege, and nothing regarding this e-mail or
> its transmission is intended to be a waiver thereof.

