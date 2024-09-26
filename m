Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7063CCF9E9
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 10:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U3BXOWLdZ3ZYTaPWPPVpqTruEaQT+RzavUhoQtzfsW8=; b=u2NfBPlMu6DAUcHZXImkbsrA3K
	PUZgOwXtzEMlbD+naFpfB9qVk6e19h8bF7UIkyve7GhZM4wdzK3pRlpX8humu+WWuXXw7r0s3y2aA
	RABPOs/1T6BEfcg1Mkor1HctfGKaR6camhJuLqvj4QWedbI7Dlfu9tL7QwbvmablHgg9TNgyegtyb
	kh3i+H1aKA5JUqVQimMrzPZhoUHaqmUpGALN1BaUFfd5clx7O0MglOOghJLKcVaeLx0nP/b08wheI
	zjq6LsCZIwuDpTC4pas6kd5Uw7sHSL2JWuYA1EjASCYls6DSlsppxTZtYhPJL1wmBDS/foCqx8LFm
	JTMbXMOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stlyC-000000086Qk-37MF;
	Thu, 26 Sep 2024 10:43:36 +0000
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stlxb-000000086Gs-2w49
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Sep 2024 10:43:01 +0000
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-84e8e8f1e9dso228989241.0
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Sep 2024 03:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727347378; x=1727952178; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3BXOWLdZ3ZYTaPWPPVpqTruEaQT+RzavUhoQtzfsW8=;
        b=PoiPNy4j1V/YSmCFq5xDkSiC5N2YgizddWtueHrN+FPSoOV4Hx/QchvF1rTyv0qFGG
         beQqOwh1fDnlZiyuuPV//FRGljOZXN05C77KQvZpNrZflv4x1wDuS0/xKCOJEjSiAuqd
         +vMNT/hMlZ79tl/kcxJEzf8IpU+jg6NF80Gjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727347378; x=1727952178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3BXOWLdZ3ZYTaPWPPVpqTruEaQT+RzavUhoQtzfsW8=;
        b=Ph4Tr7mpOUQ4CJwCE2J+nQaZmx6127WjAHay5zl3fqH95ktVverswP49N9KwS9k/Wh
         jRY1ggjm3N8tGmo+Dteglb4zMmd08+iQzXs2Z62HxqKweGxRgCpilG9Z+86G12IKhB0j
         2872ZYzyarZp7fmtC63b2BC0/Swp7ZXQDy1NKIEzy/4N4vzGgxDVfslTigI2+rDgVBz+
         vhIotOKJfKwBERJkhfd+eP+YUlRwR8wUCgjQxRPuKepU0lLRh93JKTkLJqipkbmdxanM
         RrrPhfG4aCHkIt7gn7hC98G3bksrPkVy4LQ0aeuqEdvJ1+SS7QDwMMUnRxFHMmAWC5Vw
         TJ7w==
X-Forwarded-Encrypted: i=1; AJvYcCW3lrTCrySUVluY/EhWZBFxZv8BwsRU7lQkiJHQ92vbtY/UTUorMINcMOef+2FqyNg4csLGrdSmihJ8HJgIwQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxWuMTsgqkaaBNucdG1LeRMUsX/FG4aagFa1WcvH5SifUrfyOBl
	NNuhCnxfq/iURL5v7ACjEvSL0T/01woH5AGraGlI5yBZhA90sBz47B6LtGf5nOkFUwLdaIXNEZF
	rKQ==
X-Google-Smtp-Source: AGHT+IEwrKn72ARxVoIbKMOCue/rtQBFcEeAI5Cme+6LpIQqcwHuAwxcjWyurinxVWK8dZxd4LLPZQ==
X-Received: by 2002:a05:6102:f0b:b0:493:bcbd:4633 with SMTP id ada2fe7eead31-4a15dc398e5mr4549948137.3.1727347377954;
        Thu, 26 Sep 2024 03:42:57 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4a1517c0e1asm3251754137.17.2024.09.26.03.42.57
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 03:42:57 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-502b8d7033cso263880e0c.0
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Sep 2024 03:42:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWAXKBgSIk3q9pTabDnGPyofMYpZaE0ZH3W6eBN8Ux/wDO8h/iOUj/+dO1toF6amqcxnDKw6mIj3SqwbI6dUw==@lists.infradead.org
X-Received: by 2002:a05:6122:1352:b0:4f6:aa3e:aa4c with SMTP id
 71dfb90a1353d-505c1d368ccmr5013070e0c.3.1727347376895; Thu, 26 Sep 2024
 03:42:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240925110044.3678055-1-fshao@chromium.org> <20240925110044.3678055-6-fshao@chromium.org>
 <b3842173-7074-4bcb-80f4-1f6f8cb38a52@collabora.com>
In-Reply-To: <b3842173-7074-4bcb-80f4-1f6f8cb38a52@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Sep 2024 18:42:21 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhs4EUR78HunNnz=Z-cG4GgAZ=7JFyJmj6he96Z=GuxOQ@mail.gmail.com>
Message-ID: <CAC=S1nhs4EUR78HunNnz=Z-cG4GgAZ=7JFyJmj6he96Z=GuxOQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: mediatek: mt8188: Move vdec1 power domain
 under vdec0
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_034259_764520_A81FC29D 
X-CRM114-Status: GOOD (  22.63  )
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

On Thu, Sep 26, 2024 at 4:33=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 25/09/24 12:57, Fei Shao ha scritto:
> > There are two hardware IP blocks in MT8188 video decoder pipeline:
> > vdec-lat and vdec-core, which are powered by vdec0 and vdec1 power
> > domains respectively.
> >
> > We noticed that vdec-core needs to be powered down before vdec-lat
> > during suspend to prevent failures. It's unclear if it's an intended
> > hardware design or due to power isolation glitch. But in any case, we
> > observed a power-off sequence here, and it can be considered as an
> > indirect dependency implication between the vdec0 and vdec1 domains.
> >
> > Given that, update vdec1 as a sub-domain of vdec0 to enforce the
> > sequence. Also, use more specific clock names for both power domains.
> >
>
> As far as I know, yes, there is a sequence:
>   - Cores (mtk-vcodec-core) gets suspended first
>   - Then the LATs gets suspended (mtk-vcodec-lat)
>   - Finally, the LAT SoC gets suspended (mtk-vcodec-lat-soc)
>
> ...but you checked that downstream, and your downstream misses the lat-so=
c HW
> instance, and only has the lat one.
>
> Are you sure that this is not the reason why you're getting this issue? :=
-)
>
> Otherwise, I feel like we must ask for some clarification from MediaTek, =
as
> I'm mostly sure that the two cores are independent from each other (but I
> might, of course, be wrong!).

Yes I think I should... this is actually based on a downstream patch of the=
irs.
My understanding is that LAT SoC is not always in the vdec pipeline
for every MediaTek SoCs. Although the MT8188 and MT8195 have much in
common, I have a vague impression that MT8188 doesn't have a LAT SoC
HW, so the downstream video decoding works smoothly without describing
that in DT... but still, I could be wrong, and things just happen to work.

Anyway, I'll find someone on the MediaTek side for clarification. The
datasheet I have doesn't seem to contain such information.

Regards,
Fei

>
> Cheers,
> Angelo

