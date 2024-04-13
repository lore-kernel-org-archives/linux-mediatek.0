Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BEAC4345F
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Apr 2024 10:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ZBciApKLMvjxOVZYXzIoJbnqbwzjS65kVqw40ak0hE=; b=xPTwn6leSLW71TM41zbNVGCfBZ
	6HniKurhOHGwm6uoDPcCuEG2+ujxhhkoPbh9NnB1HPVM7cTQfBh3Mx7gixJACXUwsK+1O5mLgGb+g
	W52r4bxu7TvQFwbQv9kE6G5OJMh0JNfJi8MDMrjAmOCUJjMpKpR5ZYjLuCGXTm5mZDwKKsQeK4wdu
	woAY3J10qJLcjSBq2iUetnagFW/VTayEwx5PQcM80mLhUjYFpKrNgO+CJfsMO4PyxFcCsidgK37QM
	s8ez/HqE/i7sbatPCNkOgwZp5Lc2E17upwUnYD6qw7nChGfv6wPI5yLK5lWiUwvfTT2YNMfBDUKJL
	26pEOceg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvaLl-00000002uxx-0O9o;
	Sat, 13 Apr 2024 10:11:09 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvaLh-00000002uwW-3EH4
	for linux-mediatek@lists.infradead.org;
	Sat, 13 Apr 2024 10:11:07 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-221e6bf537dso1053280fac.1
        for <linux-mediatek@lists.infradead.org>; Sat, 13 Apr 2024 03:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713003063; x=1713607863; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ZBciApKLMvjxOVZYXzIoJbnqbwzjS65kVqw40ak0hE=;
        b=E9NzVrIlhT7dT5hHniuZDy2ue2L4h3l3rfVITnLxXeVbVhbGFr1C4w7WBhSgZLJ0Ce
         A/IcweLYu3xnT/zp5vGROJfpdvB7tywDmxcDOtJJsr+Bxquv1vBOanBcdW3U1AZP3nKp
         qmLUPcDUGzAdF9QgYGyd1OjpLNIHAiTqdcoCzzJL5JMxNOH9THtgUTFS9t5dFMdZgt1J
         AMERk6vOwPZ4NweCDfbliXkrYBwH+gIcwXEtcBISRHux1dANza1gcknTDYvfdXWI0fHa
         Ev0Rh+/wD5GrlzI0jMV8fpV5VateAuNWJ6i4HGeWzY+GPUjSIShIYEOZvF4M0L8Cr3p7
         2pow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713003063; x=1713607863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ZBciApKLMvjxOVZYXzIoJbnqbwzjS65kVqw40ak0hE=;
        b=hlVEnEwXcasGB8qURTa07TF5J3JHgGQP23sbq9Z+4xhouFBO/XvhkwdkfiIMj5UrJE
         j04gmu8sngqW32kApx1lNW8vWRbm5/gEf41F/nNjK9hj6+LkZX4YchLU6dNyu4+Hzklr
         kLxSlHs+/nL1wnRMwSrg6PwvCRDZwFgSJ713YOKx0vK8EpUhp3bPt4yyKlonCAlxViuA
         BWPgQUI8JB3y7CYh0Kmlu/EW5m46xfDkZL1GBCC01m5jMZuEIBpd8U8nTSxhOUp6Enxd
         xDYqIJm60sRsCQ8AkyiiOQOJvxNk4XnQZ46V2XnXFZjz4Ofjmsf1k3SIZTJSplVOpk0Z
         2awQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5WrQr5fTNvZ7vO8jsS73ENbHS6vGgmty5pZpXtp7r57zC2jU6V+LHcIT+Q73+O1J0hoFH4uup46+5fH/MPmssQpGDl7FvNgXYp38DKw9xyIXv
X-Gm-Message-State: AOJu0YyymWpJFO70wI6R8hrgspvwQrH+3lEgjmBG4sLMnSRCLHHtURHs
	Y7jAtYGQWl+vURvn8AnrSMk25eNq0qOxw4VjKDnTXOayPqDW70aM1cHkcJCcCHBK70gartQPuT7
	SVC239PEUvq2AhZ6bx1w3TSlAt3M=
X-Google-Smtp-Source: AGHT+IF6froqlMKKHPZGGxDZaZCd9+PLuvrqkLxfrrlHTkfygyF32u4tsaPghUAiwCTEKYeeEXNjwrVbcox5him7Ktc=
X-Received: by 2002:a05:6870:f10f:b0:21f:d2a0:60f with SMTP id
 k15-20020a056870f10f00b0021fd2a0060fmr5876813oac.51.1713003062633; Sat, 13
 Apr 2024 03:11:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240111082704.2259450-1-sergio.paracuellos@gmail.com> <20240412213328.GA19361@bhelgaas>
In-Reply-To: <20240412213328.GA19361@bhelgaas>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Sat, 13 Apr 2024 12:10:51 +0200
Message-ID: <CAMhs-H-OWe3WRQb1iBj2oSy1s5wzazSo4ce9Hd+wxKUivy+3aQ@mail.gmail.com>
Subject: Re: [PATCH] PCI: mt7621: Fix possible string truncation in snprintf
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, bhelgaas@google.com, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240413_031105_844979_61119949 
X-CRM114-Status: GOOD (  12.71  )
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

On Fri, Apr 12, 2024 at 11:33=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org>=
 wrote:
>
> On Thu, Jan 11, 2024 at 09:27:04AM +0100, Sergio Paracuellos wrote:
> > The following warning appears when driver is compiled with W=3D1.
> >
> > CC      drivers/pci/controller/pcie-mt7621.o
> > drivers/pci/controller/pcie-mt7621.c: In function =E2=80=98mt7621_pcie_=
probe=E2=80=99:
> > drivers/pci/controller/pcie-mt7621.c:228:49: error: =E2=80=98snprintf=
=E2=80=99 output may
> > be truncated before the last format character [-Werror=3Dformat-truncat=
ion=3D]
> > 228 |         snprintf(name, sizeof(name), "pcie-phy%d", slot);
> >     |                                                 ^
> > drivers/pci/controller/pcie-mt7621.c:228:9: note: =E2=80=98snprintf=E2=
=80=99 output between
> > 10 and 11 bytes into a destination of size 10
> > 228 |         snprintf(name, sizeof(name), "pcie-phy%d", slot);
> >     |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > Clean this up increasing destination buffer one byte.
> >
> > Reported-by: Bjorn Helgaas <helgaas@kernel.org>
> > Closes: https://lore.kernel.org/linux-pci/20240110212302.GA2123146@bhel=
gaas/T/#t
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
>
> Krzysztof applied this to pci/controller/mt7621 for v6.10, thanks!  I
> just pulled that branch into "next", so it should appear in the next
> linux-next.

Awesome. Thanks for letting me know.

Best regards,
    Sergio Paracuellos

