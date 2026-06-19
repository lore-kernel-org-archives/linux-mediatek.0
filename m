Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FFACD4F26
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2026 10:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UyoRbyY1ikZAKjLVrYosObC+OJksg/6It/AyYwr3648=; b=UWmjqSHnEGvGMzQV1NWt8q6AG9
	hIm+pE3HADYNktz6/i80l6BKkoZQa1z0W5C00WYv7YE3nAzlod4MR7QgwDW4TBkHXaYAjAljpOllp
	IcIp3kU2SIHWgD4Swlqiyn/Ha0BRkEdA8qr59h6/i6BXhQABr1UgJVRutPMtQ0sySCUpgfiDARb4E
	9dWuF87DBUu9Gor0g4s8zYC+zmeasS4iL1oyJQ6gCJi5dJTOPxkhmVH7+gsrw02Qb8PZxkNDV3Npt
	BsOuyiZpYlR5uKUJ4NNoFS08/qZj3s3nT4GaKxIdMes+Q4j1LPZoUggrAjW8YOP3wgGjqzY8jIuMA
	NokQLb6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waWvL-00000002JkB-1W9w;
	Fri, 19 Jun 2026 10:58:11 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waWvJ-00000002JjQ-0Tnr
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Jun 2026 10:58:10 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-36d98b68d68so1178566a91.2
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Jun 2026 03:58:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781866688; cv=none;
        d=google.com; s=arc-20240605;
        b=fHBahbxodL4nKa37VTjzJLAUIOWcqmh6X47JIVj0qujcWjuu5RQ38u96HnK5iBC0k4
         WH3FOqqVXfo1BgunRWZR8gZyduo16VZMILlbXv9XhQZKH7T7hiyimgwe9pVdp7vNTPaO
         95e6BE1dmJPG057TVohdRzvqNmORWkDJpy7o7xEmxrkVBsjbONU6kcWmJFJqEPCT5dFo
         MiqP9imtkcJQrQ/KfNsP+d7xgPO21egvXF6ZRGu0A80sXff+UKpJ7RY21zj672LkhWFD
         4AwVLhmc0+SApjnepzVbzeMhMTwKe+Bv+Aez+WTbEHVKHOMTKywQyxjrVJ5+JiEOXwpd
         bSRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UyoRbyY1ikZAKjLVrYosObC+OJksg/6It/AyYwr3648=;
        fh=OA1v2er5ohfEKuy0BmFrQSdbF6GKadVQtIrhUxXgdts=;
        b=Lt8M9uHx8F5xSCDz0gDMOju1yW5h3jC91ouj+kUF522cPMIaTy62OfQ7MEiJZVoh2v
         tR2Mzc0zNXR8jBd9tNQoMZsbG6NN9kcrN/3jivmM/xXP8OD1mBlxcLjkv1rAPnR0ndPM
         qbv5ugm9xk6Wlk6QKRlE7F0ViwapSBti2l7K2g1+ScpV4k+V0UNueZulfSOIMRLKz/r4
         xsLjy6kESlZKl2uyiEpvl0mq6CFd/FCWCoND0A+kIoK/aFr3q11XfJy+ufIlKWT5YXlr
         UzruGxJDV/skCuJfHftuvjDWzrhfsbrXlaq+VlASLYkm2n28YfpBOVKzF+EyYdKr6lz+
         9yaw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781866688; x=1782471488; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UyoRbyY1ikZAKjLVrYosObC+OJksg/6It/AyYwr3648=;
        b=T8dMj19W8XswmIpSCao1uuwArP4k9OTSnBfAUVsypivw34fUq06IbdmiUxjLfpz+yV
         cLiEDsI8dZRgQOq+SuIF5wbYw1MnliVYx9PALB0YVJM6YNk7MLy367c2kRjIlYWVdLI/
         cEvTrjcj3Ixh/TQi5EgipdEHfhaXDSU2t93y1To3OzGPEpJlKEOc7Si3BW/wAeoyxoRA
         UiU/n+crTeZba3XJvTfhbVnzwrc5AaMWhzJaRJSO39iTU3IJkCqAziphwUWqymFLsMyU
         cBRFhuU6NFy0x8wv9wAo1iazKGWwq07QztIm4mzkucoLizYxg/Coi0lDbnEzGr4hK2yz
         iFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781866688; x=1782471488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UyoRbyY1ikZAKjLVrYosObC+OJksg/6It/AyYwr3648=;
        b=KUHK/nYV7y7GPV3mbOIvHBZbVxYU9I4V/kKb+fcWcBnxyA+ecgA5czC4IKVzE4urQo
         d2h6YsV+ZE/J1+4+7UQmz3z7tO5ogX0Gq4Xg/6KvUS7c4JGf5KTjwMGFKHXLO8o10aGk
         O4YsPqHu2LQwdanw5EMj2I99zhEAJRqtlQVd1qjRMYhwreppkIiTRUJhmasKIz5TH6kO
         WEm2QS7ci5+jzJluQ/VxfDbzWR4tPumU9IbCO0qTj9F8W25Y58gp8MhVTrRQXgzJzICM
         LjMmS0Tq+Ngae37rUHGn9MgpbNAGjafJnFe4dVle4NaxpqpHCwxRAMcas1cPwkXq5rEB
         lR7Q==
X-Forwarded-Encrypted: i=1; AFNElJ8CdMKXktMrnJ8FsYVjPt+C6zUmRBOKHajRXK6qgWG/Qb2gLFwIUQIwGc46mCJkTmP0l9ZtdL4huKvvkGZwtQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwN43ParlfI7prNpZ5nmdv6PWjPiceNLL6jnhJoYcA5JidyYuf4
	bSvHIOTsr2FKf0+HaaQGVIilezxXss+m86R0qZS5ASrLWJHKS7/+VGQX8Hi+alxNI38p3GcaUw0
	TtQ+riSFnQ75oBVnT0KsLJmIJveI992k=
X-Gm-Gg: AfdE7cmnd7lx5YnaXBRpcyVqfJBOCjuGCCdTi51gZgtI9iiwHXKFb5SUNif48KWCpJj
	CNi33h5vQ+TqiHpFSegR/5qJgbMX7rDg5iQ0STFGnoRWpkDX9+kYgAWWCAymdmdC3xm7cJBlt2/
	yyC2DCU6/RnpHWyV9xglHXN63oWmYwJqOa+O//kXwD2WlGwXtzts4j0o+l1L3XRlD83WU/+sz6v
	GFE6MIsCrE/72annKq+T//jilFxn193n7EkUeRtKeYhJNFZH29GzcGm7Wo56gkwGnd+c3SwTG3Q
	Omn/WBuYgZPJfGVgSMWhbViuN08=
X-Received: by 2002:a17:90b:3847:b0:37c:7090:821b with SMTP id
 98e67ed59e1d1-37d15cb4614mr3550684a91.10.1781866688090; Fri, 19 Jun 2026
 03:58:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260617103235.449609-16-phucduc.bui@gmail.com> <ajJ9rbHTspXHo6Ou@opensource.cirrus.com>
 <20260617140209.3f89706c@pumpkin> <CAABR9nG+6gOj4KnWmTyykgGN93xy6jKQh+-_f8Xxn=Jkv28vBA@mail.gmail.com>
 <20260619101346.2ec49087@pumpkin> <ajUcTfG3vSGz3n3d@opensource.cirrus.com>
In-Reply-To: <ajUcTfG3vSGz3n3d@opensource.cirrus.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 19 Jun 2026 17:57:57 +0700
X-Gm-Features: AVVi8Cd_NlwUbIL4avZasgAe7DuOI7f8OOig9UU05BKU2wbfQ972D9fz9PREhwc
Message-ID: <CAABR9nGRCZ1zv0cyBGc3yuM8MeFNqBB1MkGUL7bTbtC_LcKKzA@mail.gmail.com>
Subject: Re: [PATCH 15/78] ASoC: codecs: cs42l43: Use guard() for mutex locks
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: David Laight <david.laight.linux@gmail.com>, Mark Brown <broonie@kernel.org>, 
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_035809_154865_E5866637 
X-CRM114-Status: GOOD (  33.16  )
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

Hi Charles, David,



> > > > > I believe you have to use scoped_guard here, as there is a return
> > > > > from the function above, if memory serves it attempts to release
> > > > > the mutex on that path despite it being above the guard.
> > > >
> > > > Indeed.
> > > > I believe clang will complain.
> > > > That makes these mechanical conversions of existing code dangerous churn.
> > > >
> > > > While using guard() (etc) can make it easier to ensure the lock is released
> > > > when functions have multiple error exits, I'm not convinced it makes the
> > > > code any easier to read (other people may disagree).
> > >
> > > I built the code with both GCC and Clang and didn't see any warnings.
> > >
> > > My understanding was that the early return exits the function before
> > > the guard is instantiated, so it should not affect the guard's cleanup
> > > handling.
> >
> > When a variable is defined (and initialised) part way down a block the
> > compiler moves the definition to the top of the block but doesn't initialise
> > it at all, the first assignment happens where the code contains the
> > definition.
> >
> > However the destructor is always called at the end of the block.
> > So if you return from a function before the definition the destructor
> > is called with an uninitialised argument.
>
> My understanding was exactly as your David, but it seems that isn't
> the whole story and indeed I had to fix a bug in our SDCA code
> that hit this.  However testing this out, results in some things I
> find very hard to explain.
>
> It seems as far as I have managed to test, the code below works
> fine as Phuc suggests. It does not appear to run the mutex_unlock
> on the error path.
>
> int function()
> {
>         if (error)
>                 return;
>
>         guard(mutex)(&mutex);
>
>         stuff();
>
>         return;
> }
>

Thanks both for the clarification.

> The situation I hit this in before that doesn't work was actually
> this:
>
> int function()
> {
>         if (error)
>                 goto error_label;
>
>         guard(mutex)(&mutex);
>
>         stuff();
>
> error_label;
>         return;
> }
>
> Which in this case it does run the mutex_unlock and NULL pointer.
> Will try to find sometime to look at the generated assembly, but
> this basically totally blows my mind. Very unclear as to if this
> is supposed to work this way or just does by pure luck.
>

As stated in cleanup.h, mixing goto-based cleanup and scope-based
cleanup helpers in the same function is not expected, so I think
we should keep a consistent approach here.

Best regards,
Phuc

