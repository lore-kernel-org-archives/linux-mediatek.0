Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11FFDC433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 15:42:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0DF320639
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 15:42:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gNhtpKWC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="vyFC/q8s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0DF320639
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MMaE8VpI7pv8meWBnrtg5551cV8UItkZ3xfpXuqL6VM=; b=gNhtpKWCtYpDAdYR/B3hKJqPi
	bLumCbl5lYIVqC3mnN+KxvfUWbULlR9MkECOAaMVaG19Msbvp9KOyFlhUg9k2I+r2b9qTnEyu+tMP
	0Q/mYbhdZlVNWOHPn5Li4v+lv9XET+q0Yp+5zyr7acKYv6DiKu3e5SklrDtpuHRm2RwaQjNtHWijg
	i6ljYamJgfhobkMByMUxLemSJQ7KkPz0t4VD8JNctZ++alpieGsmrXiOEAyRd1bo5bSZ4m/OGaFJm
	CqZxtrFQCWplyveVJtSRY1AhKoi/cbjiC7cT49B6WiOTuJdLUbNjAI7gwfCC5UtMTbqsfFM1aRbCR
	wsy1mSKuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8QEf-0008Hx-TY; Wed, 19 Aug 2020 15:42:45 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8QEc-0008GB-Re
 for linux-mediatek@lists.infradead.org; Wed, 19 Aug 2020 15:42:44 +0000
Received: by mail-io1-xd42.google.com with SMTP id s189so25210706iod.2
 for <linux-mediatek@lists.infradead.org>; Wed, 19 Aug 2020 08:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ueFYm1qfrvuVokkg4cIykC1xT41ucWkogT7CDyG2LEU=;
 b=vyFC/q8s7Zxi5luvZu57+hMwrLU8LK8+zh8k/3QGJnwNPklGHQVFn2JSh/YLamJcLL
 dVyeG61lKntoHmN6060nH0IO4HWaUJX0LqqBgWtxW8WyLrtmgssiU5sjKlg4yhOX/q1t
 fdGs7fiCQ+sU2oEF/hOCkMLAqsZwGnmJHj4OpaUMI9oUOu7iL/SI8A5yu3wC5+GerAdd
 pl3GHIdx7erT7nBPzRnndZ08iGPoyojlCOo4MiTJ7ZXnz6wULYITEeIaKSor5wagiy/M
 mgDddCeDdC1Kn1z3f/ICNgJ4KaVFxiCrb1r/cqyLXk1krv+su7Z571TImb/kFrQFwsY7
 OjAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ueFYm1qfrvuVokkg4cIykC1xT41ucWkogT7CDyG2LEU=;
 b=kvQQXoQ9DQGILyi3dtDB21Yf5A0Morn4cPRm25L0b/7MUZkxBzsQiWwCKODuKaAGgU
 g61SIROd1DP3MznqQO0Q4D7OGf8wRSmYlId3K7RhneccblzQTb/7Wf2e1AtKDX9vNgM0
 qdYAkKm8fMj4mWYzeEPSCqysa4N+Z+WM2VFfdlBbzxh2w8CYQKVQiNrYsboSh9Z01sKf
 /a8Cun41/ZujLsorWzX4S8jHVs3Yz8EmOwvFb8WJcFQUBX1BfbR3Ah/++Is7J18/LsCL
 hfF/zqc4+h8uI6np+gmr/O16ZaIbyEM72TU4Ys4kvZwNR0kEliNDTvsLyaWizd+N2XPJ
 yr1w==
X-Gm-Message-State: AOAM530B7eHvu1xHMIoSptJAk72QHSqscQd0Sw8L1/FAmw6OxEy5GFK2
 Sl644eTu9zSjrkwWL1tFUGG55CX3C7LU92f1E7VVvg==
X-Google-Smtp-Source: ABdhPJwRnmRf3OMplQbhMziRPhYyjn2uBddwGEzf/xhJv6+J11j8DMc8iwUkJYiK9rDVOAjuTBdAroFLZAE/nvkCCKE=
X-Received: by 2002:a02:a584:: with SMTP id b4mr23503993jam.68.1597851758905; 
 Wed, 19 Aug 2020 08:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <1597644455-8216-1-git-send-email-jiaxin.yu@mediatek.com>
 <1597644455-8216-3-git-send-email-jiaxin.yu@mediatek.com>
 <CA+Px+wXSbGLb+AZnF8ETRycRUVjqk4xacm5DH6MzuMw0vh6Wzg@mail.gmail.com>
 <CA+Px+wUMXoSL6w0wBduE7obJRWgCteeT8=_=U=8LR34JKTTGZA@mail.gmail.com>
 <20200819103730.GB5441@sirena.org.uk>
In-Reply-To: <20200819103730.GB5441@sirena.org.uk>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 19 Aug 2020 23:42:27 +0800
Message-ID: <CA+Px+wUV89KO8JJd3+HpOrgFRSc7sdg-DBW44C31262Qx9NzVg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] dt-bindings: mediatek: mt6359: add codec document
To: Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_114242_993019_91847B9E 
X-CRM114-Status: GOOD (  13.74  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: ALSA development <alsa-devel@alsa-project.org>, howie.huang@mediatek.com,
 Takashi Iwai <tiwai@suse.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 shane.chien@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, eason.yen@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, bicycle.tsai@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Aug 19, 2020 at 6:38 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Aug 17, 2020 at 04:11:03PM +0800, Tzung-Bi Shih wrote:
> > I misunderstood.  It still needs the compatible string to match the
> > corresponding driver.
>
> No, it doesn't.  The MFD should be registering the platform device.

I guess I see.  It lists the mfd_cell when calling
devm_mfd_add_devices() in drivers/mfd/mt6397-core.c.  It falls back to
use driver name and device name to match.  As long as the name
provided in mfd_cell matches the platform driver name, it works.

But I found struct mfd_cell also contains member .of_compatible.  What
is the difference if we use compatible string (as is) for this device
instead of falling back to use device name to match?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
