Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA94EE7717B
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Dec 2024 18:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OplHiEsz7wL2RuVihxOLWutLYQRf3hsMBwQ+zxviNdc=; b=CG5tSiYECSaKOGMbYN/UO4g4HX
	XXs4teU4PD464Kp5Qx5ZXA8IosFGQ0obtS/Qr1s51YMwITawrSqR0vhYrWgSDX6RtGX+ZAOL4QIHo
	O6NseVp95DkDoRVq/9cY9HzLzE6WOQ/0Qi5kcpK2cUOJK/afsq+o7VtsQh0QaknW/gLmYDmNHp/5l
	G5Ff3VOT+LvIScvWMPNP7Ufg3AoxG8CIhy+zE14yHLn5nsKUmL/64eeW+xp7WwE4NKWYACPXKpMm/
	+YRj+rWRhepMX4ZcuOzNSe+ekcWcHEQP8DuJ4N/ZhM6CECqk30LcFZVJlU9tXpHUONORzbpm3P0u8
	A7jz7q6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tK01e-00000004Hv0-2dpU;
	Sat, 07 Dec 2024 18:59:34 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tK01b-00000004Hua-3rt6
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Dec 2024 18:59:33 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6d842280932so46242116d6.2
        for <linux-mediatek@lists.infradead.org>; Sat, 07 Dec 2024 10:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=epc-instore.com; s=google; t=1733597970; x=1734202770; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OplHiEsz7wL2RuVihxOLWutLYQRf3hsMBwQ+zxviNdc=;
        b=Hb+OqLaoocxpT3WLF1idu5zcSh9qwAZOAuPfwSjjdstRs57Nj+sujDX4uINIaz+jRk
         rwggqNGjAgZZxcnzc7+TJktKaHb+DHosFbkjPPDEBYAsRZCk8SqwmPljN4VnWMFnQbhW
         +K4AvXeOQ4yeXDytEouEnQL06WQTExAiBW0zaOSI2Skhl66UDIx3v6dLF1P/rvhuHClS
         AbUh/EAiuuZBvdMO2mtzuEU7LncuYwSkO9u0QSN18wQHdhic/WKOn/vL3Y5F9FIyYxGg
         YGBtzVwNciyt/b/bcguzp2LsVeGf7P+OHl9oNpvxFHlkFdRWU6I0y/3GvLLOme1MsshW
         NUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733597970; x=1734202770;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OplHiEsz7wL2RuVihxOLWutLYQRf3hsMBwQ+zxviNdc=;
        b=cajgRhM3UI2HOYhPAZkHVW1PT8AHjEJxnfaJqNyTGgcAFk99Bdci+Ifk6UaodVjNvd
         Cmvuze29izRDwiudlgJryo1GouZxhZufBTli4ThElcS6TZ0tY1zJc8J/cZvaBJxsbKph
         6VGNacbngMh3pCq+KOp9k/1mRkU0u8hCFE2yX2eZYttmUnzI95Kuz5LHhRbGmvPNDcE8
         Q/wMo4Hc5llhC719ig8rbYOgUTaVLzPwfl0JL1I2TpjX04//82SHKY82Y3RNSjbq8hvR
         hVEPnjNBsimS5bbVsw7p03J6M25oy0dGqlJDHSQx5No/CuopnNYwfCLAtLWsgEden03G
         ygaQ==
X-Gm-Message-State: AOJu0YypEdhvvqyVzZQaOwLtxBo8NgxXxZodwuXO98rTohTdEfS5b/Ae
	X08V3KAAfEtzLxEXLUl2TU8sitZw2WFbNt8PIE9nS0URIXT6lL8ronjt/2MQ94fpXdO5vHEj189
	yxQrfSpXWFpo7xm8QiByAOCPlhh86aT+PvVUfugtzptaHR+htHzH/Dw==
X-Gm-Gg: ASbGncugwzE+NH0xT9qlWmbmLKT8z9HncXa+TI8K1y6m5occsH0CJUmK2XF3UNctddw
	kYuXneNps9YniqyGoG0RXUppS1lLofMQ=
X-Google-Smtp-Source: AGHT+IHkxWVsCwi4sQ95tcr8rmpAfIgQD87YYALVlMP01kc9Nn2g97f+tAxih7utJz8A3W1CEX0Tv3xzaCMbjvB12WY=
X-Received: by 2002:ad4:5fcb:0:b0:6d8:7c82:e542 with SMTP id
 6a1803df08f44-6d8e707e5a8mr122225046d6.4.1733597970556; Sat, 07 Dec 2024
 10:59:30 -0800 (PST)
MIME-Version: 1.0
From: Brett Bergquist <bbergquist@epc-instore.com>
Date: Sat, 7 Dec 2024 13:59:20 -0500
Message-ID: <CAH+ZgJt8d0zzbroeLDqPkCr-2OOq9vvVShVoAiFiTGVH+Hwasw@mail.gmail.com>
Subject: Problem in Linux with Alfa AWUS036ACHM where the device appears not
 to be initialized correctly on a reboot
To: linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_105931_960587_51FBD0B0 
X-CRM114-Status: GOOD (  21.08  )
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

I have a product that is built using Yocto Kirkstone release (Kernel
version 5.15) that uses the Alfa AWUS036ACHM product.  It is working
most of the time but I have a strange situation.  If I reboot the
system, there will come a time where the device is detected but it
does not work.  This is using systemd-networkd for networking and
using wpa_supplicant.

To stress the system, I am externally logging into the system and
rebooting.  This might be successful for a number of iterations, I
have seen 30 reboots.  Eventually however the networking will fail
with wpa_supplicant not progressing at all.  I connect a console cable
to observe what I see.

When in this state, the USB device is seen, the modules loaded look like
>
> root@9998:~# lsmod
> Module                  Size  Used by
> mt76x0u                16384  0
> mt76x0_common          40960  1 mt76x0u
> mt76x02_usb            20480  1 mt76x0u
> mt76_usb               28672  2 mt76x02_usb,mt76x0u
> mt76x02_lib            61440  3 mt76x02_usb,mt76x0_common,mt76x0u
> mt76                   57344  5 mt76_usb,mt76x02_lib,mt76x02_usb,mt76x0_common,mt76x0u

Everything looks normal.   However the wifi does not work.  Using "iw
dev wlan0 station dump" and nothing is seen.  I have so far found
nothing that I can do in software that will reliably get wifi out of
this state.   I have tried

delaying starting wpa_supplicant for a bit (30 seconds) after boot on
the theory to let the USB bits in the kernel settle
reset the USB port and restart the wpa_supplicant
unbind and rebind the USB device and restart the wpa_supplicant
unload the driver kernel module and reload the driver kernel module
and restart the wpa_supplicant

Even a reboot of the system will not recover once in this state.  I
can recover by unplugging the wifi device USB connection and replug it
back in and then restart wpa_supplicant and the networking comes right
up.  A reboot likely does not cause loss of power to the wifi device.
 I can also recover by a complete power off/power on of the system.

It is as if the wifi device gets into some state that is not good and
cannot be cleared in software.  I have also seen the device get into a
state where it appears connected but only partially in that I can pass
things such as ICMP ECHO to and from the system, but I cannot pass
data, as an example SSH into our out of the system starts but hangs.
Using Wireshark I can see the TCP connection being established with
the SYN, SYN/ACK, ACK handshake but then start of the SSH setup fails
and times out.   Again, simply unplug and replug the wifi device and
it works.

Note that this occurs on multiple wifi devices which I have used with
the same system and also the same wifi device on a different system.
After a number of reboots I can get into this state.

So my question is if that type of thing has been seen and possibly
corrected in a later kernel version.  I would then attempt to backport
changes as needed.


-- 
Brett M. Bergquist
Distinguished Member Technical Staff
EntryPoint Communications LLC
30 Waterside Drive, Suite 100
Farmington, CT 06032

Phone: (203) 206 3542
Email: bbergquist@epc-instore.com

CONFIDENTIALITY NOTICE
This message (including any attachments) contains information that may
be confidential.  If you are the intended recipient, and the message
is marked confidential, by opening the message, you accept
responsibility for treating the message and information contained in
the message as confidential, including not distributing or disclosing
its contents to any third party without the express written consent of
the sender.  If you are not the intended recipient, you may not read,
print, retain, use, copy, distribute or disclose to anyone the message
or any information contained in the message, and such conduct is
prohibited.  If you have received this message in error, please advise
the sender by reply e-mail, and destroy all copies of the original
message (including any attachments).  Sender reserves all rights of
confidentiality and privilege, and nothing regarding this e-mail or
its transmission is intended to be a waiver thereof.

