Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3FA8F8DFCE
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Apr 2026 21:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AlLMcUQhFasP1gpVZMHOUydAPyqbNw6g5fn1ghs9xQc=; b=SrZ1x40UnO9O1xw3iOnCrCPRd+
	zvA+IIYUtzdRDyoUB4WOqV2DTEVdKTtlZuHLW0kXK7gvquasLZm/aoNA6s8P1doOyrZxLYb0y/hhV
	/NDsBTShSWl7zWP6KKyBF1adUZ/R11zWCo+R9gENYYSox1YrM6zJQ3vT6fwU9x9h+6JC0/JQIjOcV
	jy5DASzANMM2sNGAVmVtBPN1fWgDjMqO5PQTWKSGeMvhs/yKz8KOjMA0QWhgY6H6qcSTAad+Wkv47
	ITcA3L1f8EoXbzTyAphBeTubMEjA/z6FVPKSmphMSRV88eioyJffMDlOjuhLlIlkOoPuYHoLg3GZG
	493dfPzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDUkP-000000037II-2BlA;
	Thu, 16 Apr 2026 21:59:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDUkO-000000037IB-1UaQ
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Apr 2026 21:59:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 241FC6012A
	for <linux-mediatek@lists.infradead.org>; Thu, 16 Apr 2026 21:59:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0A3EC2BCB4
	for <linux-mediatek@lists.infradead.org>; Thu, 16 Apr 2026 21:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776376778;
	bh=AlLMcUQhFasP1gpVZMHOUydAPyqbNw6g5fn1ghs9xQc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gg7/THy1+AX+5j9Nd6vMKO6fPOKg9HUVY5TkRex5a6XdEZRUppF6UqJ2uRBly4WCO
	 e9NbcmpJw9bmoZK7z0taLnegnx/b5/tcxZ9wghi4cqF1A+xZManOCZPW9sY/H18G0D
	 MwIyekkyH3F/qWMVuS7CGzFVqkNrlHNkexXtC1z8U6a2lnaW5epQcNniG/uy63mJmw
	 uWoFTGLiVdyDTPUovssflZdkU6dQdtCQfppVJHU55FTtm8X6ryBtqF7/I+ivRRvXv8
	 pO1fT8m1bJODZrM187RNX3nmlJuoHDj3EQesX5HusIQKmiFR9xh3T6LCCXmHXu2uyP
	 Rm5iGlkJR/FPg==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38e96a071c3so445581fa.0
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Apr 2026 14:59:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/GxX62ALECfCG1Emw3CS1ikGfT66eCzJfORf0ihiqShCyhl2TD5Px/PrvRAqDwdGlXpi+PJALw0nAPGEI2XA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJuN51TcxT4Kw2p4u7CkeTkvXHZrTak447B+nnjnayDq6W25AN
	dY0sTBnMgyhygz4kY4uqzvUQWONLLuqrWDwIwBg9l/GHopZKKeYhqNNVDUyIW4t+Lft1WK8oB70
	bzEs2AYsAV/mrB0vNEVzCTCn1V5GfcfA=
X-Received: by 2002:a05:651c:553:b0:383:5390:bc96 with SMTP id
 38308e7fff4ca-38ec7437420mr1136551fa.0.1776376777227; Thu, 16 Apr 2026
 14:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <59f58f03-6dee-4380-80d6-7e2778b5f14b@altlinux.org>
 <f264b392-37bc-4b31-ac0e-768466f2b962@altlinux.org> <CAGp9LzrfD+a84ZVGjUnrv7KYCpgfe88NyrXos8wW8U7aKM8BZw@mail.gmail.com>
 <651b9626-0c2c-4993-829a-3259141109dc@altlinux.org> <ddb70af0-b3b1-42c3-9459-ce41914c4d20@altlinux.org>
In-Reply-To: <ddb70af0-b3b1-42c3-9459-ce41914c4d20@altlinux.org>
From: Sean Wang <sean.wang@kernel.org>
Date: Thu, 16 Apr 2026 16:59:25 -0500
X-Gmail-Original-Message-ID: <CAGp9LzoEaNuQf7+2i5QZi8f44zQfxpWGJiW0WgYrAZhT2a9D+Q@mail.gmail.com>
X-Gm-Features: AQROBzAF8JmAS5EwGdBo41HZ0lpUNVOogRqOVGSfwXTacaEkYFE9SKdGuf0rLfo
Message-ID: <CAGp9LzoEaNuQf7+2i5QZi8f44zQfxpWGJiW0WgYrAZhT2a9D+Q@mail.gmail.com>
Subject: Re: [BUG] mt7921e: Intermittent connection failure
To: silverducks@altlinux.org
Cc: linux-wireless@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org, 
	ryder.lee@mediatek.com, shayne.chen@mediatek.com, sean.wang@mediatek.com, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Thanks for the update and for sharing the revised script and rerun logs.
I tried to reproduce the issue with your script on an mt7921u, but I
could not reproduce the timeout on my side.
In my run, I got 398 reload cycles and 398 successful reconnects:
grep Reloading test_log.txt | wc -l
388
grep Connection test_log.txt | wc -l
398
The log is consistently like this after module reload [1]
If this were a generic race in the common MCU command layer, I would
expect it to reproduce on mt7921u as well.
Also, could you record and save the "iw event" log when you run the
test? That would help show what userspace-triggered
activities are happening. we can mimic the same sequence using wpa_cli

[1]
Starting WiFi mt7921u reset loop (using NetworkManager)
Making sure network services are down...
----------------------------------------
Reloading module mt7921u...
Starting network services...
Checking for connection...
Checking for connection...
Connected.
Connection succeeded. Cleaning up.
----------------------------------------
Reloading module mt7921u...
Starting network services...
Checking for connection...
Checking for connection...
Connected.
Connection succeeded. Cleaning up.
----------------------------------------
Reloading module mt7921u...
Starting network services...
Checking for connection...
Checking for connection...
Connected.
Connection succeeded. Cleaning up.
----------------------------------------
Reloading module mt7921u...
Starting network services...
Checking for connection...
Checking for connection...
Status: Connecting
Checking for connection...
Connected.
Connection succeeded. Cleaning up.
----------------------------------------
Reloading module mt7921u...
Starting network services...
Checking for connection...
Checking for connection...
Connected.
Connection succeeded. Cleaning up.
----------------------------------------
Reloading module mt7921u...
Starting network services...
Checking for connection...
Checking for connection...
Status: Connecting
Checking for connection...
Connected.
Connection succeeded. Cleaning up.
----------------------------------------
Reloading module mt7921u...
Starting network services...
Checking for connection...
Checking for connection...
Connected.
Connection succeeded. Cleaning up.
----------------------------------------
Reloading module mt7921u...
Starting network services...
Checking for connection...
Checking for connection...
Connected.
Connection succeeded. Cleaning up.
----------------------------------------
Reloading module mt7921u...
Starting network services...
Checking for connection...
Checking for connection...
Connected.
Connection succeeded. Cleaning up.
----------------------------------------
Reloading module mt7921u...
Starting network services...
Checking for connection...
Checking for connection...
Connected.
Connection succeeded. Cleaning up.
----------------------------------------
...
and so on

On Tue, Apr 14, 2026 at 1:22=E2=80=AFAM silverducks <silverducks@altlinux.o=
rg> wrote:
>
> Greetings!
>
> Update:
> New version of the script is less consistent at reproducing the bug.
> I've also noticed that on patched kernel it triggers timeout way
> more often than older script. I've rolled back to the older one,
> which relies on the NM autoconnect feature, though retained cleanup
> changes.
> I'm guessing direct nmcli command is often preventing NM from doing
> whatever it is usually doing that triggers the error.
> Script and reruns with it attached.

