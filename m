Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B151C10FCAD2
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Apr 2026 22:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bh04i1AsLlmfPzJc4tfDUDKrG+zQUwrNren6a6q14IY=; b=KA9/A/eLHGEYMzloVwTJwKcO/j
	5gM72J72tcxaNva+6rR84hZcrHPv1J/kOs+ObXCgWMT6a/hWgafhWmI+xmSx9o9s+mqWDc/WfG0qL
	7xR3hW/LyFkEYCwwCrbKe6TmpELMeo0vdXgfy3ThAuQP9H3TSIKLGCYuVgq4dFHED18tlG5QPW2X6
	29r8UUJJbG9lIF3wmczEsucYFIugLhWUz0ycuynKlD2zvfQRQnluF0rWdNFO/IxrTteUaxvbtIT+R
	A+uohK74n/oAbYUdKd9p13nbgP65AH+9wsIJmnKh6fLHmpGoz2rfgMvLbvHUU9rrY/eQSeg1BROOR
	pnjH+a0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84Wl-0000000GLLc-2WI0;
	Wed, 01 Apr 2026 22:59:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84Wi-0000000GLLC-3wPj
	for linux-mediatek@lists.infradead.org;
	Wed, 01 Apr 2026 22:59:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D510A4055B
	for <linux-mediatek@lists.infradead.org>; Wed,  1 Apr 2026 22:59:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3619C116C6
	for <linux-mediatek@lists.infradead.org>; Wed,  1 Apr 2026 22:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084347;
	bh=Bh04i1AsLlmfPzJc4tfDUDKrG+zQUwrNren6a6q14IY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nr4mDDMpqOPxtogvY217Vr023niJV3H3X+OEMpaBiyygtUn+HYAlNrHa+1I0NxIN+
	 iMjn0jgFnRVud5+eAU0J6oMFx8hirsUMhRIb0Pr89kut46lMEpiIGHbhNUsFcjP+TK
	 bKyuXfQCvJX3izTSc6qxW5u5qKxC4BhkouI0c5lwoJ+AKfEGMuhG2Msm/ABCknL4De
	 oygKcNZO6KL4c18d8Sn89Fh9mwhpHFePpc2DW+928Unq3fBDlOVRtW9iKG79wMHTmW
	 +4tYRhV7PM0DiLMaYIm8CdR5zjrDJfQ/8XIWJbpirrSiD+N+56wF0gk/nx7GsupDq6
	 PMYs9ctGKU89g==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38ad26e3992so2728431fa.1
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Apr 2026 15:59:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWlZvu3S6euyJQ22foBq7sU6PzXK+/LH+JdmkmceNcOeB7dLF4a9wiRV9ZWdc2V+x1NYx8QGzCl/Na3Wkfong==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTXCkG+C6R1IA/W3Is4Qb1N/79qmQ7XHW9X67wYp+aadl1gTX7
	6Q4A3tlCFv0CqJ0LXFuVofhybsGnQas/s5xJNiE06yrhnEUpGZfEDyt8UyP9OYa8i72pmDRtTG3
	ERA421dSo8Ro6hDLy43i/7Etqei0b3ho=
X-Received: by 2002:a05:651c:324b:b0:37c:d689:7e1c with SMTP id
 38308e7fff4ca-38cc3072eeamr20758451fa.23.1775084346107; Wed, 01 Apr 2026
 15:59:06 -0700 (PDT)
MIME-Version: 1.0
References: <59f58f03-6dee-4380-80d6-7e2778b5f14b@altlinux.org> <f264b392-37bc-4b31-ac0e-768466f2b962@altlinux.org>
In-Reply-To: <f264b392-37bc-4b31-ac0e-768466f2b962@altlinux.org>
From: Sean Wang <sean.wang@kernel.org>
Date: Wed, 1 Apr 2026 17:58:54 -0500
X-Gmail-Original-Message-ID: <CAGp9LzrfD+a84ZVGjUnrv7KYCpgfe88NyrXos8wW8U7aKM8BZw@mail.gmail.com>
X-Gm-Features: AQROBzCRx5vmL5Svm5WZlkSZUDNKHT4mh-uraOryAXlhYNAIGQLo8xUpZway6ys
Message-ID: <CAGp9LzrfD+a84ZVGjUnrv7KYCpgfe88NyrXos8wW8U7aKM8BZw@mail.gmail.com>
Subject: Re: [BUG] mt7921e: Intermittent connection failure
To: silverducks@altlinux.org
Cc: linux-wireless@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org, 
	ryder.lee@mediatek.com, shayne.chen@mediatek.com, sean.wang@mediatek.com, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_155909_019548_9EC477F4 
X-CRM114-Status: GOOD (  15.15  )
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

On Tue, Mar 31, 2026 at 2:40=E2=80=AFAM silverducks <silverducks@altlinux.o=
rg> wrote:
>
> Greetings!
>
> I apologize for poor formatting in the previous email. I did not realize =
all
> plain text files' contents would be visible on the mailing list.
> I am attaching an archive containing the same files as in previous email =
for
> convenience.
> Given compression, I can also avoid using external hosting, which I
> presume is
> preferred, so I am including all relevant logs in the archive as well.
> I am also including original email text just in case.

I think the current test setup is still mixing too many variables, so
it is hard to tell what is actually triggering the issue.

In particular, if the goal is to test the NetworkManager path, the
script should not also manually manage wpa_supplicant, and iwd should
not be part of the same test either. NetworkManager normally manages
the Wi-Fi backend itself, so mixing manual wpa_supplicant handling,
iwd, and NetworkManager in one setup makes the result difficult to
interpret.

Could you first simplify the setup and test one path at a time?

If you want to test NetworkManager, use only NetworkManager, for
example by using nmcli to explicitly control the connection steps.
If you want to test plain wpa_supplicant, stop NetworkManager
completely and use only wpa_supplicant + wpa_cli. I would suggest
starting with this path, since that is also the setup I usually use
for testing.
If you want to test iwd, please test it separately as well.
Also suggest to avoid suspend/resume or hibernation for now.
The log you shared includes a clear S4 resume path (ACPI: PM: Waking
up from system sleep state S4 and pci_pm_restore returns -110), which
does not match a simple reconnect or module reload test.

