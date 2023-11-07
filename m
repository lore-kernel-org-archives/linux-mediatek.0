Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A85C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Nov 2023 17:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tqd7PZ/B96UGfoG3Q8m8TyivOw1/h/kSnp+uMatk3Wc=; b=C4DDBX/ss2hVF7XrC/W8n+496L
	zcsxXWqG/PdHMChon8jYr5Ikwp1yqLtZh520vuwLLtlwXYr+Pq06IaVLleiLJjZV9VhnR+B+EIvuT
	z8H24qF6rVj1Y2FqWtEBvTx+V1YDICIwzMmAacvarzoiECd1v8vuDvRM/RjehcFAPFEw/Xmc/Ywep
	mg3TSs5EaXCibY6puuTVY4FufWPzEefuqMoi/09I1yS7ACNrVKNKAtQzzhL6BIaWsj5YFYRcuN/VI
	Iy/HaPuBonNYkOAumYFcCEtG97bkP/dIDY9pHOrGKz3ns1oPzRtwXkrG8YIz6hZZqrgYA1uZ5bUXg
	RI3gSYWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Q8I-0026tP-1k;
	Tue, 07 Nov 2023 17:44:58 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Q8G-0026rs-0e
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Nov 2023 17:44:57 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9d10972e63eso889581166b.2
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Nov 2023 09:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699379093; x=1699983893; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tqd7PZ/B96UGfoG3Q8m8TyivOw1/h/kSnp+uMatk3Wc=;
        b=M/XG8O4eKX/bsmc93Dd12JoT2Gr6DXeSVE3o6qdzE7snDfvcnfpJjIo3CVUSh/TiBX
         KffvZ/rjT06qjPiq0D7FYM6pEO67CdFJh7nubVkcNzhvdhg1oPpdxnfrCAYMM5QXpKZC
         4QWJkUG/X1+oOagYKEAVthtIy1FWV/p9yfq88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699379093; x=1699983893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tqd7PZ/B96UGfoG3Q8m8TyivOw1/h/kSnp+uMatk3Wc=;
        b=uD8uN6K0vkCuPbjP91GGulHLhjZh/aMx7bQed8MfxPNKGjm14pErxqvT7QV9c/kB1j
         S5Wuf5LtNuf4vCvZQGaLfN+QDU65FFo5qYBypUD3XjGsU/RHyJ0fuVVSOsEUOO8EBuRN
         u6bwhiKonBSVpdA2sJzYBqYEbe+/1ukmXPE4gf15ixZHqUYQJb4v5SdX70t642CjED8+
         1Nph8jdCQd90/0nZPx+3AoABM6NaBWXIp/ew/7UQGvf+VwXLxJ7NBR1VrckELBqd+ynt
         IrH4KIeMSRITTnrZwWH2yUj7n61cnxYMgmbH3kwlAmnHk4KGxY9KNS+xAhu30xOVuZ8X
         VkLA==
X-Gm-Message-State: AOJu0YyUXN/Hk6h6Wu210pAt3qXX0zME4nI/KgHtWcTd1Vxf2iN5l/Zf
	5RHQmV8jNvvsoY+NfZQr9Tg6s/0kMHO5s5B69x++NSoJ
X-Google-Smtp-Source: AGHT+IGf986Ka0U+dTHMWZqtOTIBT3KEGIVVqjor72DJEc1kQ8ZaJF5GbEX7hGKYYmqfCFHCd9+5nA==
X-Received: by 2002:a17:906:6a09:b0:9d8:78f2:7e9a with SMTP id qw9-20020a1709066a0900b009d878f27e9amr14526466ejc.14.1699379093712;
        Tue, 07 Nov 2023 09:44:53 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id e16-20020a170906249000b009cd1fca4d68sm1290891ejb.5.2023.11.07.09.44.53
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 09:44:53 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-54366bb1c02so186a12.1
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Nov 2023 09:44:53 -0800 (PST)
X-Received: by 2002:a7b:c8c1:0:b0:408:3725:b96a with SMTP id
 f1-20020a7bc8c1000000b004083725b96amr142833wml.0.1699378679435; Tue, 07 Nov
 2023 09:37:59 -0800 (PST)
MIME-Version: 1.0
References: <20231107072651.v2.1.Ide945748593cffd8ff0feb9ae22b795935b944d6@changeid>
 <9b2e37a0-32ee-4aa4-99e8-d37103674847@collabora.com>
In-Reply-To: <9b2e37a0-32ee-4aa4-99e8-d37103674847@collabora.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 7 Nov 2023 09:37:43 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xv7XKvePTZ6LKT97EViG81d8hqk+T68B5eXamKTU407A@mail.gmail.com>
Message-ID: <CAD=FV=Xv7XKvePTZ6LKT97EViG81d8hqk+T68B5eXamKTU407A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: Move Mediatek GIC quirk handling from
 irqchip to core
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Amit Daniel Kachhap <amit.kachhap@arm.com>, 
	James Morse <james.morse@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_094456_253888_C819A526 
X-CRM114-Status: GOOD (  12.36  )
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

On Tue, Nov 7, 2023 at 8:30=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> > +static __init void detect_system_supports_pseudo_nmi(void)
> > +{
> > +     struct device_node *np;
> > +
> > +     if (!enable_pseudo_nmi)
> > +             return;
> > +
> > +     /*
> > +      * Detect broken Mediatek firmware that doesn't properly save and
>
> s/Mediatek/MediaTek/g
>
> Apart from that,
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
>
> On MT8195, MT8192, MT8186:
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabor=
a.com>

Thanks! Unless someone wants me to spin it more quickly, I'll plan to
send a V3 with the Mediatek=3D>MediaTek change tomorrow.

-Doug

