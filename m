Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FF2C2BB3F
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Nov 2023 19:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6X29YxgOJSekJMMYnxMuAiE4h71bPpKLkyOGCG+ZdDw=; b=SA5QRHHMDIMNtLd9PEtMTJzw46
	HJ8roZqN/q7GNsZ0yuZkEbtbUwRbHN+lSDZVs5Sg3yAExVtq97CaYpyCD/1WVnkpAU10Bk+kBiI1R
	kv0uqRJObndLLdoDz9pRaJTkcQs6CT/xsRJ7dGdpl+8jsVjDcDzFW7rQCUrrjCITYMw80Ld3kUFHI
	lHSq9vR2MPr5iOJiKyvNX2ruu7RojNjYIJXSMw4elw6G4/5KLOE09HJK2y+/WIcdw7IKlVW3gfPq5
	ng5NFdqaWijumx9F+qrqCihLiaVTZ8Y21v+9w0w7/S552NSxuyL6ytd5mO0opKv6Y2gMe0BECXN3s
	oH67Z9sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3LYv-001afA-0j;
	Wed, 15 Nov 2023 19:28:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3LYr-001adv-0m;
	Wed, 15 Nov 2023 19:28:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2D90E617C4;
	Wed, 15 Nov 2023 19:28:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BE89C43395;
	Wed, 15 Nov 2023 19:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700076507;
	bh=6X29YxgOJSekJMMYnxMuAiE4h71bPpKLkyOGCG+ZdDw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Or31r+GDQxBg0Kl8952bupTT20NKuDwPAAhds0bRUOCSZpFXveuXNiRPeMF9U4ZFC
	 AvZlT63J2FDw7+KmeblxmRPR4g5Vzt0k5NC4KfM41F7s7MjmEPfuSQ+P4J7ydI9oVD
	 RJiksoxrLz7lCCBhDKMXsqog4bhDw0xNI9zPLaN1G/e6lKLuBptX7qINXIZDokxuWt
	 WplEtsGC5+kLHE64Dvk+Anp0N+yInACzDd1UP7BuR52jRkPU6rnnE3t9i9qMr9smHu
	 4SU5hizO3uCkiFzud6h13enoHxr6HU1OvKZM8mdcDPdJqWAWQU2dfZcIq3tmPAasfy
	 JwiL2+5acw0qg==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-507cee17b00so9567217e87.2;
        Wed, 15 Nov 2023 11:28:27 -0800 (PST)
X-Gm-Message-State: AOJu0Yxn3ZN4PQcqKvvdAkX1CCeMAa6a80Zsy8P7KY13WscwXo+Q8suC
	6gDhkRQJxvdDyLyw9+fCNASDWlivHiZn5LNqIw==
X-Google-Smtp-Source: AGHT+IGtuiOaHigoe4PCchL0ez6WkPrADjlwvvM4lywCiYHOdKs1gl3YzfWtoBm3uafJe5HtghJLBMHgFaaktMSfqQo=
X-Received: by 2002:ac2:54b9:0:b0:500:d4d9:25b5 with SMTP id
 w25-20020ac254b9000000b00500d4d925b5mr9071774lfk.56.1700076505201; Wed, 15
 Nov 2023 11:28:25 -0800 (PST)
MIME-Version: 1.0
References: <20231109100606.1245545-1-wenst@chromium.org> <859ac058-c50a-4eb8-99b6-3011ef4e7529@collabora.com>
 <CAL_JsqK64w3+r_LJZoh50PzAUcsvH6ahSDCqgSiKrD3LBAXE9g@mail.gmail.com> <CAD=FV=VUZy9DaZgKafSpXXopD5k8ExGSR97BjAqC5tupPoxNfQ@mail.gmail.com>
In-Reply-To: <CAD=FV=VUZy9DaZgKafSpXXopD5k8ExGSR97BjAqC5tupPoxNfQ@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 15 Nov 2023 13:28:12 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+puq20EWkQg1RTs2zfmh4DGbqz1krp+19c=wPXnLT5dA@mail.gmail.com>
Message-ID: <CAL_Jsq+puq20EWkQg1RTs2zfmh4DGbqz1krp+19c=wPXnLT5dA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/7] of: Introduce hardware prober driver
To: Doug Anderson <dianders@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, andriy.shevchenko@linux.intel.com, 
	Jiri Kosina <jikos@kernel.org>, linus.walleij@linaro.org, broonie@kernel.org, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, james.clark@arm.com, 
	james@equiv.tech, keescook@chromium.org, petr.tesarik.ext@huawei.com, 
	rafael@kernel.org, tglx@linutronix.de, Jeff LaBundy <jeff@labundy.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_112829_381586_0F3DEC1D 
X-CRM114-Status: GOOD (  30.65  )
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

On Fri, Nov 10, 2023 at 6:12=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Thu, Nov 9, 2023 at 5:52=E2=80=AFAM Rob Herring <robh+dt@kernel.org> w=
rote:
> >
> > > > End of background from Doug's cover letter.
> > >
> > > I think that using "status" is not a good idea, I find that confusing=
.
> >
> > "status" is what defines a device's state in terms of enabled,
> > present, available. That's exactly what we're expressing here.
> >
> > Now, I do not think we should be mixing the device class (e.g.
> > touchscreen) into status. I said this on v1, but apparently that was
> > not listened to.
>
> Interesting. I must have missed the "don't mix device class into
> status" part. Do you have a link to your post about that? Maybe
> there's other stuff I missed... Having the device class stuck at the
> end there was at least part of my last post [1] which gathered no
> response.

https://lore.kernel.org/all/CAL_JsqKK0tjeXNv=3Da8L3k0AjhCa15XOq1tPWqVod9myc=
sKXJHg@mail.gmail.com/

"I would not combine the 2 things. Knowing the class/type of the device
may be useful independent of your problem."


> I think one of the reasons that I felt we needed to mux the device
> class into status was that it was going to make the code a lot less
> fragile. Everything I've seen indicates that you don't want us to
> create a "HW prober" node that could be used to provide relevant
> phandles for different classes of devices, so the "HW prober" code
> needs to either search through the whole device tree for a status of
> "failed-needs-probe" or needs to contain per-board, hardcoded,
> fully-qualified paths.
>
> I don't think we want to include hardcoded, fully-qualified paths in
> the code. That would mean that if someone changed a node name
> somewhere in the path to one of the devices that we're dealing with
> then it would break.

Right, nothing should depend on the full path. That's not an ABI just
like the device path in sysfs is not (despite what Android HALs do).

> So if we're searching the whole device tree for "failed-needs-probe"
> then we need to figure out which devices are related to each other. If
> a given board has second sources for MIPI panels, touchscreens, and
> trackpads then we need to know which of the "failed-needs-probe"
> devices are trackpads, which are touchscreens, and which are MIPI
> panels. Do you have any suggestions for how we should do that? Maybe
> it was in some other thread that I missed? I guess we could have a
> board-specific table mapping (compatible + node name + reg) to a
> class, but that feels awkward.

Node name is supposed to correspond to device class, so why not use
that (no path or unit-address.) and nothing else (well, besides
"status")?

Rob

