Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C466CD4F26
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Jun 2026 14:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yoAOMy3f2Itr67+DkmQlpGnqzcUNVVNmM/LFKYJbM+k=; b=g/Npw6pGIOhV6aVwfCQVNJBQbH
	J1bLvx4pJj63uFEH8pBJL3X8ouVw3t59tDxApGwnx3/PUP+4alPXDJl92LmVyBosys7HYNeNJ/sXe
	hBwUoB4bzd1ahIZ1wKKxWLiDDzoBIAsBKStopCnzKypi4txt9pPdS80Vyz2gd3eiS9STH4PvBefXL
	lTL++COuGkacQGz2Or5lAn7AWThLQC4NC97ERZTtro6JhcKzD9hi1e/1OGvuPK6/1JgNlbFqsqkA4
	5WJ0vD1zo0Zb/kla4iF77mL/E8tUhk4qM5cjeUu2dtMWWei/rLqB+3f/eSpK93din6GET/y8/Bj7l
	tbwXBpuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wawje-00000003PXx-0ErL;
	Sat, 20 Jun 2026 14:31:50 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wawjc-00000003PXL-0xw8
	for linux-mediatek@lists.infradead.org;
	Sat, 20 Jun 2026 14:31:49 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2c0aa420401so18016935ad.3
        for <linux-mediatek@lists.infradead.org>; Sat, 20 Jun 2026 07:31:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781965907; cv=none;
        d=google.com; s=arc-20240605;
        b=IPdWFl7TEgOyUyZ1fNCacOU3CXMyJqXr3SbRGFVCBb6m0qSXPZNj6MgGQIji3DaRr6
         Z/r5Ibuv/Tpg3YvmkmQSboiSFgubKcpVoHT2dx1W7NBOu0Hbefpu2gRw0VK6/3T/v5Ob
         uMB81Psy6xop2OAQVMVcZh2KZQ214Dr6dZELeqXORS/OZfVg06cwPAlRA/dspsD+iEdk
         dm1FsUpGc0bDqjrgv2Z8MV+UTYBLCvT6lEX9C4kL1H0yQzILv7Cvw7F7I94z3DqMKvfU
         5MyLhy1kPTtHyGMm5xUbzwo1D1Y0d2wWfN6Y9Dj86Frmb3lwZKaWkHnrZfrRY/HIeeh2
         vs0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yoAOMy3f2Itr67+DkmQlpGnqzcUNVVNmM/LFKYJbM+k=;
        fh=Pyzjz9nyHGdmHTnXdh25pMzTIr3b0O8fmtpR/eUICfQ=;
        b=gA7dvM1SnU3xDIpPkWcO9zn76F6s+L2+9bMCZVrNmOLOUuHlGY1GgtpIr7iaHOCOH+
         1k5gCu1bhauRGSo1QSKVnLbT6x8LCK+jBpujVQocOtZTULmkcj5Q5y4cCMfLHg2cXdMj
         cdk2CmTq5t5fbji0BLxI7bx1tXX6QjUYOLDi546fjUFx0dhidQrRyUnvB1nuXgliluuu
         BEKZ1sFBwDu/FjOit18EmsO1CJX18FCMjLMs7vnhqEPK9OVy90kJ2mSNyPQZfoGUC2hf
         vkw/swmDmErYnIAuhrXhM0N7DAr2JoeGFQ7RiM/k6Z2SPfnURlOIRSnwfRbi4JjrtBK4
         ol5w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781965907; x=1782570707; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yoAOMy3f2Itr67+DkmQlpGnqzcUNVVNmM/LFKYJbM+k=;
        b=Yg3/AkYUOM4lUZTqTkoWc6P749C+3aaOvWJkgyy5i50NlD3xKtIEHFAmBcPepJU7/4
         GCvSbReRH/AIoWK/H6S37hinzgV4utHsZhtAXBiK4FVBGLO/eXmynuQY5xh44vOsiONH
         3oOO6BrAS05Jjqr1x6iMVs6nO1R6QSHtLCcUc6jhghdG1176rSLxvheFjOSgP9s2eXAu
         MWWkpgqel8MVmXqJq1FtCUV2CBYuqJokk5SD7kQOp38lkd3BF+b9VT6Eg0D/FDMK6pBb
         0IL5DPswQ5jXIItKoYc6ZJeU1iRqyCN5a3/uHNQgJhBRCqZ41Pa30pXqqb+RwGvofGpJ
         ijKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781965907; x=1782570707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yoAOMy3f2Itr67+DkmQlpGnqzcUNVVNmM/LFKYJbM+k=;
        b=q7Rh2ZEIshUOiW5gvMh8DjS57wsDCrn3Y9w1+Lps1sjPXCZwbvp42wCsRpa/WZPxb0
         NqBwV8ASjW+8aB8P1g5y7/lToEIlsmjfe2BpkLx/6SymFGGKXriDEquJ1VT/TKpz+IWg
         Dz07vz+tCdWXGakF49Xw1NXkO5xGPTLYlxk6reed9FhiTCSBLX91Jmwy/B7FnS4PEV2Z
         oKCAaFx5kLJ2i9/SLUbjlDN+3PsERXqZr6uoPvBJPEsa2+RtNAGUgYv0Gmy3QHtxaIgw
         nSN3V297dFut+r+dvCAsqD8QDTuw+9t+soQJ/6sOtklgcrED7foImZaUQwS1bh8CwlC2
         b3HA==
X-Forwarded-Encrypted: i=1; AFNElJ9EZrL+ZmYnjWiXmugnKdgaOSI+oyM/VT9OuOBCnKrsZBgjfozYrsis9sKWnxbgsccO4aDsGXBtVjRFU/OgJg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFcMhkKO9rSVHBlE2KIBiHci0D7bYTxaPeE8pQJTT5zTnUFHSa
	J+wwg+G9wrgMANv5jwp8gbbzOxKZunaHIvfOddfaHMU4YySmVzzhZmGs0HOAHR7UdOefDl0Ps1j
	h6UJtg4cQTCc/7dc5HvA1KWYyWblNiNw=
X-Gm-Gg: AfdE7cnLFBnUJONhr5KOEG1oijScKFaRXKVKFG+umTXT7trNjZtXK4Vs2pNuOl6S+0+
	62eHxI4nyl++KrD0N8EE10thIHXBXco8DCKhTg3up1/Zc9C1HhPl8jBCze/WDJGV1l8MZ13X7vs
	z0mHfJeTnMhSS0RL+VfN4CcojcMG08p02zaMNndBgZfiXaSglnxF03rxmJqoo+AkzTkcToUO+Lc
	I9I4YRKE8AMsz5qJtJxEs+rt9Qp5qUZMSeqY+Dfgpr0E8KoOo19iIiA2nesJiNysY2v4ma4ntgX
	RCCXSaO7jH/Orp7Ns8gXylI9dVfnbxX8PJ11ZXTn85a2PMy2kQGojiiU3GdokA==
X-Received: by 2002:a17:902:c40f:b0:2b2:4d36:7ba with SMTP id
 d9443c01a7336-2c7252a8057mr74037005ad.0.1781965906891; Sat, 20 Jun 2026
 07:31:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260617103235.449609-16-phucduc.bui@gmail.com> <ajJ9rbHTspXHo6Ou@opensource.cirrus.com>
 <20260617140209.3f89706c@pumpkin> <CAABR9nG+6gOj4KnWmTyykgGN93xy6jKQh+-_f8Xxn=Jkv28vBA@mail.gmail.com>
 <20260619101346.2ec49087@pumpkin> <ajUcTfG3vSGz3n3d@opensource.cirrus.com>
 <CAABR9nGRCZ1zv0cyBGc3yuM8MeFNqBB1MkGUL7bTbtC_LcKKzA@mail.gmail.com> <871pe2kcif.wl-tiwai@suse.de>
In-Reply-To: <871pe2kcif.wl-tiwai@suse.de>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 20 Jun 2026 21:31:34 +0700
X-Gm-Features: AVVi8CdmzIZOlmsJ02kZGuh_kzjdhPUos4g5dG2tFnwGhCYx2Sp6G_przK0DiY8
Message-ID: <CAABR9nEdHwXpg8+6J5L9Af1PvybGt3KSfRy=LnMHXSQSHnd25w@mail.gmail.com>
Subject: Re: [PATCH 15/78] ASoC: codecs: cs42l43: Use guard() for mutex locks
To: Takashi Iwai <tiwai@suse.de>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, 
	David Laight <david.laight.linux@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cheng-Yi Chiang <cychiang@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	povik+lin@cutebit.org, Support Opensource <support.opensource@diasemi.com>, 
	Nick Li <nick.li@foursemi.com>, Herve Codina <herve.codina@bootlin.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com, 
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>, patches@opensource.cirrus.com, 
	chrome-platform@lists.linux.dev, asahi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_073148_284596_AFEDFF3A 
X-CRM114-Status: GOOD (  41.55  )
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

On Fri, Jun 19, 2026 at 6:14=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Fri, 19 Jun 2026 12:57:57 +0200,
> Bui Duc Phuc wrote:
> >
> > Hi Charles, David,
> >
> >
> >
> > > > > > > I believe you have to use scoped_guard here, as there is a re=
turn
> > > > > > > from the function above, if memory serves it attempts to rele=
ase
> > > > > > > the mutex on that path despite it being above the guard.
> > > > > >
> > > > > > Indeed.
> > > > > > I believe clang will complain.
> > > > > > That makes these mechanical conversions of existing code danger=
ous churn.
> > > > > >
> > > > > > While using guard() (etc) can make it easier to ensure the lock=
 is released
> > > > > > when functions have multiple error exits, I'm not convinced it =
makes the
> > > > > > code any easier to read (other people may disagree).
> > > > >
> > > > > I built the code with both GCC and Clang and didn't see any warni=
ngs.
> > > > >
> > > > > My understanding was that the early return exits the function bef=
ore
> > > > > the guard is instantiated, so it should not affect the guard's cl=
eanup
> > > > > handling.
> > > >
> > > > When a variable is defined (and initialised) part way down a block =
the
> > > > compiler moves the definition to the top of the block but doesn't i=
nitialise
> > > > it at all, the first assignment happens where the code contains the
> > > > definition.
> > > >
> > > > However the destructor is always called at the end of the block.
> > > > So if you return from a function before the definition the destruct=
or
> > > > is called with an uninitialised argument.
> > >
> > > My understanding was exactly as your David, but it seems that isn't
> > > the whole story and indeed I had to fix a bug in our SDCA code
> > > that hit this.  However testing this out, results in some things I
> > > find very hard to explain.
> > >
> > > It seems as far as I have managed to test, the code below works
> > > fine as Phuc suggests. It does not appear to run the mutex_unlock
> > > on the error path.
> > >
> > > int function()
> > > {
> > >         if (error)
> > >                 return;
> > >
> > >         guard(mutex)(&mutex);
> > >
> > >         stuff();
> > >
> > >         return;
> > > }
> > >
> >
> > Thanks both for the clarification.
> >
> > > The situation I hit this in before that doesn't work was actually
> > > this:
> > >
> > > int function()
> > > {
> > >         if (error)
> > >                 goto error_label;
> > >
> > >         guard(mutex)(&mutex);
> > >
> > >         stuff();
> > >
> > > error_label;
> > >         return;
> > > }
> > >
> > > Which in this case it does run the mutex_unlock and NULL pointer.
> > > Will try to find sometime to look at the generated assembly, but
> > > this basically totally blows my mind. Very unclear as to if this
> > > is supposed to work this way or just does by pure luck.
> > >
> >
> > As stated in cleanup.h, mixing goto-based cleanup and scope-based
> > cleanup helpers in the same function is not expected, so I think
> > we should keep a consistent approach here.
>
> Right, and IIRC, clang would complain the mixed goto case at least
> with W=3D1.
>
>
> Takashi

Thank you all.

In fact, I have only been using GCC for building and testing. It was
only after David mentioned Clang that I decided to give it a try, and
this is actually the first time I have used it.

Also, thanks to Takashi-san for adding the W=3D1 build option. It helped
me catch and address warnings more easily.

I will send a v2 to address a few remaining goto cases that slipped through=
.
In addition, I will switch to using guards for PM runtime to reduce
indentation and improve code readability.

Best regards,
Phuc

