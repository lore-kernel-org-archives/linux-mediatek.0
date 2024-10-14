Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C33CF2576
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 10:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vGJpjQ49w8gK06HPVUKE6WRHK8KhkaqN4tjSHC1kO/U=; b=k18es8qVDp1VupW+TebQFJNoZl
	wQT7A22tynRAwwrgM18P8uF/vRPnZ3xXyrIlAynPbGEqDzMftzV3bE2pPbi6obT1bYstSmHlWOyKU
	ju7oc6AvCKPT1BfLTuryb2cJnq/WZRNnUdsg9fXnWOmN0yfD6XuC50fr3VnUvc6ut07SipO3s0mQK
	BDkjN8VN/PXy8NVrCruYI0zBGJq7aMy+2LZ/7jUSm5sn0XWr1b6DoUVVfxCej+ribgFOxAUkURbTp
	p992t4qagHAXYrul/cxSZVy/bBP4tA8sy3siDqZqbfqTVcuCZrcVFfk4ekEigecsehxCQhzmmQHEz
	LDfpPG7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0IVZ-00000004imW-2zrB;
	Mon, 14 Oct 2024 10:41:01 +0000
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0IUA-00000004idJ-0pDg
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Oct 2024 10:39:35 +0000
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-50d3365c29cso1244805e0c.0
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Oct 2024 03:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728902371; x=1729507171; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGJpjQ49w8gK06HPVUKE6WRHK8KhkaqN4tjSHC1kO/U=;
        b=kJWq+3ustY/neYMC/vLxsAOUw1SEJ642S9AZvQj3cxWbX458Yg1iJzspl8UXgNrimI
         MzwN7IOW+yPsi+VhWQrmOtsuoa08BrH4Ux1fdW+PNtleHWLGQOpuSRCGiS3n/nU4xUgF
         IpwY6qfPfyhA3+SZwbTlfTQvkO/Js/Fdl8KT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728902371; x=1729507171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vGJpjQ49w8gK06HPVUKE6WRHK8KhkaqN4tjSHC1kO/U=;
        b=SZPOg9654PPmBLFeacJlRsl88arNSAJeacHbGFj3kjR5vCU9UhIpEEw2O8Gnz9VEmA
         FEXURgBksOU4kP9VS+bqUU50XkBcFEk23NDbYqKHhz9TaHVNakJLmG+wan4H/VrqzEX9
         +k7QWSh0OAdBmJL0rDa7uCu5c9JS+oXH93UjU0e0XKgbCJr+wjkH5OrL894rH0t7SA8k
         ts+YoMe5Vy5XXz0WWiGokBvyDICvjuPoYVtRfM0sZ9baZ/nb/Zj6O0DUzy10Qmmd6VHs
         j1AD9ih4didCr43HtXFN7tY5amVDup+y6DBXV1Zse4V3EgcWZdkBPIS96qY421DKQ7Ka
         dt0A==
X-Forwarded-Encrypted: i=1; AJvYcCWGP01TJZhaa8XYsvQYYN/ghNj1J9Vz9IBoXfoPs2m+cDmaHElmath8bRdMoOTmUreFgOoRjueptSbIu5iBww==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDfwwd3MhprAjFcnY8BR1UDUxhu0hONbuMbqTEum6r+J0mFbXl
	qK4VjJ1C46Rk/C5Ngd4FoS4v3fxKULa0lMbcqRaST4MZhZwcVoVoMbXqHAaxlr8UX/k6Iam8rAZ
	H/g==
X-Google-Smtp-Source: AGHT+IGrJytyrGMiPq53tH3BpyJF5nDeG9g2wfPvLLg7XXpbiQfw3anC3GNrNG1cnH2NF7uIVPrwMg==
X-Received: by 2002:ac5:cce5:0:b0:50d:45e1:f32c with SMTP id 71dfb90a1353d-50d45e1f5e9mr2420594e0c.2.1728902371314;
        Mon, 14 Oct 2024 03:39:31 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-84fd352e49csm1488250241.30.2024.10.14.03.39.29
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 03:39:29 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-84fed1ff217so1318648241.1
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Oct 2024 03:39:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4QeOCD6oISJ8DALs1Isms7WIf1afFmWHoL1QVpCdeHI9u/SeIryzS8p8EzDhHWNdi1NmIdTLiBvzkd0x1mw==@lists.infradead.org
X-Received: by 2002:a05:6102:2f5:b0:4a4:8502:491f with SMTP id
 ada2fe7eead31-4a4850251d6mr1181599137.7.1728902369150; Mon, 14 Oct 2024
 03:39:29 -0700 (PDT)
MIME-Version: 1.0
References: <20241014094622.1720289-1-fshao@chromium.org> <40ce7287-7fed-4670-b16b-695c36535661@collabora.com>
In-Reply-To: <40ce7287-7fed-4670-b16b-695c36535661@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 14 Oct 2024 18:38:51 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhwn_ec4-ATNkEzUOpfUtZPEOb0niXpr202U5ysytsNxw@mail.gmail.com>
Message-ID: <CAC=S1nhwn_ec4-ATNkEzUOpfUtZPEOb0niXpr202U5ysytsNxw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8188: Fix MERGE's alias IDs
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_033934_447319_E624C692 
X-CRM114-Status: GOOD (  13.88  )
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

On Mon, Oct 14, 2024 at 6:34=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 14/10/24 11:45, Fei Shao ha scritto:
> > MediaTek's ovl_adaptor driver requires the alias IDs of the MERGE
> > components to be indexed from 1 to 5 to construct the MT8188 vdosys1
> > routing path, since merge0 is particularly reserved for vdosys0
> > according to the mmsys routing tables.
> >
> > Update the alias IDs to ensure that ovl_adaptor can find the correct
> > MERGE components, allowing DRM to initialize without issues.
> >
> > Fixes: b13ecb7c6f67 ("arm64: dts: mediatek: mt8188: Add display nodes f=
or vdosys1")
> > Signed-off-by: Fei Shao <fshao@chromium.org>
>
> I prefer that you resend the original series with this fix squashed into
> the right commit instead, as I can still replace the series that I picked=
.
>
> That makes things cleaner, so please do that.

I see, I'll resend that later, thanks!

Fei

>
> Thanks,
> Angelo
>

