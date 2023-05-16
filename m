Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B769C7EE25
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 May 2023 14:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Um1tUxrJi7GYgRkSCDyfBikS3Jewh3k7uhzREmBIwwY=; b=WSBKBhdydPG0Ky++/LS+SrQ0bI
	EFPHjZF/vzW7IeNj4LfNa4j43CnsbqnLgRlATfS1FGOOQ4v1Xkel82e9VUsPm4kjdHZgXu9DXUTO1
	K0d/TL2KwR6yZexVntb0B5Olz0qSriiZfQI7CkwgeI+OoO1ouhltdJukgSo3fcneom/3NdbYr046F
	iogH99b2jlmuIKY4w4izwT9QyhdLG2g5RRBfRhv7ELVQVKDZZAY04GSscbdcWHZinYC2jHy4DyESN
	rQjleEtF0/VYksq15eiotKiYyjAmNUCVRCCAR26NuMBXYffyp0F3t8IKjr2Jrqu5AcjpGBygJUOAa
	YCHq/Rrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyvX0-0063t6-27;
	Tue, 16 May 2023 14:20:02 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyvWy-0063rE-0V
	for linux-mediatek@lists.infradead.org;
	Tue, 16 May 2023 14:20:01 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-61cd6191a62so64293336d6.3
        for <linux-mediatek@lists.infradead.org>; Tue, 16 May 2023 07:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684246794; x=1686838794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Um1tUxrJi7GYgRkSCDyfBikS3Jewh3k7uhzREmBIwwY=;
        b=bKYcUS69LccZewQIm285XsFxqcHxjPnMAyTe6+PZxkVHZfh8oUU+Y/nvV4Sq+hC0Vr
         3We6vz1y71/VcUu8GF8/xcAsAK85EWAjXjYKVRTodpNKCgauHVQHFn7iMU6XwafImdgr
         ZVmMmyPV2muxmpUmQCzW02uDiCRrx1fx05+ZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684246794; x=1686838794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Um1tUxrJi7GYgRkSCDyfBikS3Jewh3k7uhzREmBIwwY=;
        b=joQlgcaKAvVsxDIbrFTtXK8s5O8Uip1xUIj51VXPvktt5sinARBZeJkhdKmZt7dkeu
         en4aCYgxAJjp4Fahw4bWRHfzwtTRwjefXHCxV6c0fx/sH8kkOBtL8RzYC/8QTJUNtXvn
         yYTgbsYCoU+v4OJ8SkA7nf4x1P9z5RYqx8mrdtetJ3MdoHCOIMGxyxu98rBJm/H/UCa5
         qnQQkScKwH3hkizBbYWPmpMhFJjO9WCogYjqZDXxpRm8JcLtXI1ij/2xUurEj1tSG0g3
         SKjUf5BsJ/qwnEOEJvU9AXla4jWV5Az9wvcWKms92nta0xX0QB/oKoH1eunHxnMWxDXW
         y9Uw==
X-Gm-Message-State: AC+VfDwUqWWxZmwhUAsWFKIVA7YpLRv92jiQWWsii0db0+tbY1Vw4mRS
	LqAtc8tFd9IWDiwAyh0LzYsQoj6FYQ9YE8EVfjU=
X-Google-Smtp-Source: ACHHUZ6Ob/spi7eIlQ+D1mgOLExmjkLox0ABEyKzUTcIMtnwzHMb5q67HbzhZCEwPQki/saX0liweQ==
X-Received: by 2002:a05:6214:5299:b0:61b:6fcd:34ab with SMTP id kj25-20020a056214529900b0061b6fcd34abmr56781195qvb.0.1684246794117;
        Tue, 16 May 2023 07:19:54 -0700 (PDT)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com. [209.85.160.181])
        by smtp.gmail.com with ESMTPSA id d11-20020a0cb2cb000000b006215cdc1966sm4177230qvf.2.2023.05.16.07.19.52
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 07:19:52 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-3f38824a025so1817201cf.0
        for <linux-mediatek@lists.infradead.org>; Tue, 16 May 2023 07:19:52 -0700 (PDT)
X-Received: by 2002:ac8:4e86:0:b0:3f5:4eb4:414f with SMTP id
 6-20020ac84e86000000b003f54eb4414fmr3310qtp.13.1684246791898; Tue, 16 May
 2023 07:19:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230515131353.v2.cover@dianders> <20230515131353.v2.2.I88dc0a0eb1d9d537de61604cd8994ecc55c0cac1@changeid>
 <3cc683e7-28aa-7b6e-1499-3aca953294cc@collabora.com>
In-Reply-To: <3cc683e7-28aa-7b6e-1499-3aca953294cc@collabora.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 16 May 2023 07:19:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UKC9mDab4nYu7OFSOEpsm-CJ=dvcXzHOG-a74JeELQkw@mail.gmail.com>
Message-ID: <CAD=FV=UKC9mDab4nYu7OFSOEpsm-CJ=dvcXzHOG-a74JeELQkw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] irqchip/gic-v3: Disable pseudo NMIs on Mediatek
 devices w/ firmware issues
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>, linux-mediatek@lists.infradead.org, 
	Eddie Huang <eddie.huang@mediatek.com>, Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, 
	wenst@chromium.org, yidilin@chromium.org, 
	Tinghan Shen <tinghan.shen@mediatek.com>, jwerner@chromium.org, 
	Weiyi Lu <weiyi.lu@mediatek.com>, Ben Ho <Ben.Ho@mediatek.com>, 
	Seiya Wang <seiya.wang@mediatek.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_072000_192504_C3B829E8 
X-CRM114-Status: GOOD (  33.40  )
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

On Tue, May 16, 2023 at 6:23=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 15/05/23 22:13, Douglas Anderson ha scritto:
> > Some Chromebooks with Mediatek SoCs have a problem where the firmware
> > doesn't properly save/restore certain GICR registers. Newer
> > Chromebooks should fix this issue and we may be able to do firmware
> > updates for old Chromebooks. At the moment, the only known issue with
> > these Chromebooks is that we can't enable "pseudo NMIs" since the
> > priority register can be lost. Enabling "pseudo NMIs" on Chromebooks
> > with the problematic firmware causes crashes and freezes.
> >
> > Let's detect devices with this problem and then disable "pseudo NMIs"
> > on them. We'll detect the problem by looking for the presence of the
> > "mediatek,broken-save-restore-fw" property in the GIC device tree
> > node. Any devices with fixed firmware will not have this property.
> >
> > Our detection plan works because we never bake a Chromebook's device
> > tree into firmware. Instead, device trees are always bundled with the
> > kernel. We'll update the device trees of all affected Chromebooks and
> > then we'll never enable "pseudo NMI" on a kernel that is bundled with
> > old device trees. When a firmware update is shipped that fixes this
> > issue it will know to patch the device tree to remove the property.
> >
> > In order to make this work, the quick detection mechanism of the GICv3
> > code is extended to be able to look for properties in addition to
> > looking at "compatible".
> >
> > Reviewed-by: Julius Werner <jwerner@chromium.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> I don't like firmware removing properties from my devicetrees and I'd lik=
e this
> issue to get addressed in another way (use a scratch register? and check =
it in
> Linux drivers to determine if the issue is not present: if scratch contai=
ns BIT(x),
> do not parse the quirk) but that's a different discussion which is a bit =
out of
> context for this patch, so:

Any particular reason why? IMO it's actually a fair bit cleaner to
have firmware remove a property that's specifically documented for the
firmware to remove compared to having firmware adding properties to or
otherwise messing with the device tree. For the removal case, it's
easy from the device tree git history to find out about the property,
when it was added, and that it is expected that some versions of
firmware will remove it. IMO having firmware add properties can be a
little more mysterious, though that has its place too. In general,
though, firmware is expected to be able to be able to touch up the
device tree. It puts things in "chosen", adds bits describing the
firmware, can add things to the device tree to describe components it
is uniquely able to probe (like SDRAM), could enable/disable a
component if it has info about their presence, etc.

I'm happy to hear other opinions on it, but in my mind having a
sideband bit telling us to ignore the quirk is more confusing instead
of less confusing.


> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Thanks!

