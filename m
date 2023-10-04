Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE14BE8FDCF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Oct 2023 06:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rV98O++0wueY4Se3RDk4FS6DnLpx+AEq9azMKtwZP3M=; b=0ql2ojTHiZyXv+NBpx0sIftOhV
	X1GCBYXriv4WpkUP+PM4uJyGuzli2g3xT+/+zlGldv3suVdMGBxjwO+uQQKPcm0n/Fj92hycBzpFk
	D+yEMPv8i5yptfckQfSkBFQOTED+QpD+h9PFnRZciEYwpBtzYfseIDNUO8EIS3O7tWuoxDz0KmzkQ
	5nqflQC9DmyladTHrs0OW3Y9ng3xkhyc3Au+MjdnDDh3D34BR90Re+s4puauXei9adh2+IP/+ZUZZ
	HuvF8vpZMwx/zN7f764yOqD/uRPnnF27m30rPgcTgEB4V/6Xflwikdnn4TwB3lu2vKGJkGBNfvVCj
	U0WmJDrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnvU6-00GQhA-25;
	Wed, 04 Oct 2023 06:35:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnvU5-00GQgK-0Q;
	Wed, 04 Oct 2023 06:35:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rV98O++0wueY4Se3RDk4FS6DnLpx+AEq9azMKtwZP3M=; b=Fs44oDhwcxd9eyewHbOrQkbKzr
	e3Wtnz+oZrogmgFX8sWAd8QZ5ldXyv5V926SX/fYdOsSrn4c3Z3uAjVsXMerXTMvDl4j+qbVCW2PY
	st1bbdGocP1O9uTYNGuBmaKZvBvWCrT9nUldK1PTh3rfwejxhxmVFkqQae7Fpg+gTG2GGNVWGXOm9
	py/CNuAtv6XrxbkhOS6Irq97DHkhOpuJ5HDgsArnBPF08Dud6baJuhP7njc8vMcNEtJHhpmeFgEzi
	iuNAAvhyxrVtNWRO3WE6UX2Qmg5nQcLyEaxVSgniSAk/42JutS/9UEqokT4YBjqij99ZC9yeKWlle
	A6bIKUMg==;
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnvTt-00AY7h-25;
	Wed, 04 Oct 2023 06:35:45 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-d8195078f69so1816902276.3;
        Tue, 03 Oct 2023 23:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696401331; x=1697006131; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rV98O++0wueY4Se3RDk4FS6DnLpx+AEq9azMKtwZP3M=;
        b=VxguRD3RZ4vRYvercf0OtDGlATjNO8xG1idEtQYUPjB5yaJuXMhIBu8HS2JsTpd2l4
         Xtg/ycAPspzFkyo4VorAIyswuQIIxbuOi0kj6MGG4J/f//T+FH6QEyNa2kPncRMA0W9a
         TFzpN6nInKE0GlnkstCw9RoGgZtOf2Ya3NMmTNkD6EPNmDqcPOyUO4HKYu73JgS7Pr52
         jDejRNrxJMoo/nkja8m1to90YnNjp3HdHJluZaSWtwZmjTVzFTDkyFgxOeaJedLoI99G
         hWogPU5kFd/TZjuI8Us+VOyTnAgeSJ7r6XaWb667cJzsNIfmvT/ASQ6fychxSLkLyXF2
         y8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696401331; x=1697006131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rV98O++0wueY4Se3RDk4FS6DnLpx+AEq9azMKtwZP3M=;
        b=niRmTTD6o+1XgiVOkMJNpk0gYJf8GkCnmQKYI6D8UyK0ZzUpQmiHD3er+Dqtlzy+vP
         rlt1qmDHyDJjLgX4EF3giBBsAW4q4TBvjs3V0DHPR1S+FrfnlGGG6YcKRMI2hX+a3Gwl
         +uTGH4USiVUu4qXwsy+pcu7fKuqjYV0g2fzFDxnmcaA0DHzB1ahW5zIHXeM27ZyyPLhh
         ArQ0WGfypouTiE6f1xaNq10iZiUpgQOgDQBeks9LZRT0LxHlDI88t1sZnohjNpcGv1Vk
         eGK2NOU2Yj3MgJ2LgRMsz7JvoGZEBaa/hpOaP1l88E3Uo2TkBdaNWxM3F+s3ydghX2Ka
         O1hQ==
X-Gm-Message-State: AOJu0Yx2ySWHWILDR91y8QKFEz+t2RhMvf/vllBsfE+MQDJQkEzAstMC
	dp7UJWuULjyaEfSkyx9R6n3SyHELiAhAyIXOZM8=
X-Google-Smtp-Source: AGHT+IG7t8/D8MEUEDHRVj12H+fsSO3OXBRZh3THZje73nXUbViNRQLJzuIsSOZ8BZVwVH1m0A8ACfq2fRgIxM82ZRU=
X-Received: by 2002:a25:d18a:0:b0:d84:b0f8:90e with SMTP id
 i132-20020a25d18a000000b00d84b0f8090emr1303793ybg.5.1696401331543; Tue, 03
 Oct 2023 23:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAH7-e5sb+kT_LRb1_y-c5JaFN0=KrrRT97otUPKzTCgzGsVdrQ@mail.gmail.com>
 <ZRtWcgiH5JhD5NU2@debian.me> <CAH7-e5uspavg_VBJxKLOKJfU3nAq-OrPqzihF2opffY-ReiC-w@mail.gmail.com>
 <834062302e6a98e773dc4b03d7ed568a0f1c44fc.camel@nordicsemi.no>
 <CAH7-e5uZzmnFJAJrG664G6_JbK--DfbKC50aeVN5gMMxDJ51UA@mail.gmail.com>
 <ba7aaaed859ea2c4f5aac597deb382cceab33d65.camel@nordicsemi.no>
 <CAH7-e5unq6ggNjVkSsriUAmpvk4s7-NCYJrZnLK_3BjFO_Dceg@mail.gmail.com> <3e86e69c-64bc-4776-9ee8-75b98be1bf3e@leemhuis.info>
In-Reply-To: <3e86e69c-64bc-4776-9ee8-75b98be1bf3e@leemhuis.info>
From: =?UTF-8?Q?Erik_Dob=C3=A1k?= <erik.dobak@gmail.com>
Date: Wed, 4 Oct 2023 08:35:20 +0200
Message-ID: <CAH7-e5vfhcsPiM4qqFdTxv4C=1An=y0uk1o44ryPc+FZ5wa=cw@mail.gmail.com>
Subject: Re: bluetooth issues since kernel 6.4 - not discovering other bt
 devices - /linux/drivers/bluetooth/btusb.c
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: =?UTF-8?Q?Tomasz_Mo=C5=84?= <tomasz.mon@nordicsemi.no>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Linux Stable <stable@vger.kernel.org>, 
	Linux Bluetooth <linux-bluetooth@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Mediatek <linux-mediatek@lists.infradead.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_073539_486187_B2FD1749 
X-CRM114-Status: GOOD (  16.42  )
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

On Wed, 4 Oct 2023 at 07:20, Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> On 03.10.23 18:10, Erik Dob=C3=A1k wrote:
> > Sorry Tomasz,
> >
> > that must have been a reality glitch with your commit (cant find the
> > page refering to your commit now). But yes it is probably a kernel bug
> > as it manifests kernels 6.4 and not in the 6.1 LTS version.
>
> Could you then please try a bisection to get us closer to the problem?
> You might want to try mainline (e.g. 6.6-rc4) first, with a bit of luck
> the problem is fixed there already; FWIW, a few BT fixes that might or
> might not be relevant for your case are heading that way and will most
> likely be in 6.6-rc5.
>
> Ciao, Thorsten
Hi Thorsten,

i was able to compile vanila kernel 6.6-rc4 yesterday and the issue
was still there. as it takes ages to compile i will try the
precompiled artix kernel 6.3.4 next to see if the issue disapears.

Regards

E

