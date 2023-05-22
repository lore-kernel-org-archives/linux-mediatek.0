Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F64C7EE23
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 14:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WrJg/wNkBONGN0Wx1dEOSdok8QAk/Ae/CmqoO/cnmRg=; b=ne8SxdKhVKJOl5h2qHnusxZhSb
	mFp1WO51oAGRHolL8D0dS76eDFQkBZl9zhVTpEYAbOjtTcyJWP74V6ArGiBEbJNND74L1QEF+uhop
	k0b7RsswGD0NARm3V/hlxO9Hjip5XN4jaIA5sOv41p8W9ND0c4dlGxQa4vrxw0+c5JLRkF3vVFcbQ
	DxZtU2w1yp/5OUFoSHjiuQ9AR6LTHbGDysm3/xFGlEig3VpRniiXGre7i+XcIdNlyK0p0OIZnhpb7
	xhu1v0S+/MlCodX7kEW/oIIxVmiU2MsXjt8035RwrNLvEjX6u8usR2KHB14hRYIJxnOKpznBKNuGL
	lIN12gYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q16T1-006pC8-1T;
	Mon, 22 May 2023 14:24:55 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q16Sy-006pAB-02
	for linux-mediatek@lists.infradead.org;
	Mon, 22 May 2023 14:24:53 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-561bcd35117so76256447b3.3
        for <linux-mediatek@lists.infradead.org>; Mon, 22 May 2023 07:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684765488; x=1687357488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WrJg/wNkBONGN0Wx1dEOSdok8QAk/Ae/CmqoO/cnmRg=;
        b=KfDZbj4bXwGaUp3a1Su4IZrFtYHv2dtXLahIW9sCcxP9YN0ThpZq8HEOpYzpclRob8
         hZS/s1cASzGh/Dmn55krIAiwAtGbd1wUC6UJY7LePypeU5bVuPokqQIyrcOrqElE4uow
         7Z/zbXq0TKy62Lnmmr0A5Ncpnrnkni6C1qiSeMb8ROQjmmkLQ1U+kXozgmJ9NvgVRccc
         rjl/zPsZ4SLnPKUqrLKFKqPEpXWt7jWazLooFH4UUQxdzrs7ajW6KxGgrFU3W1wB0KdU
         dmbzbpqcbDewfPM5VrF1u1R9Us8zKbvADTBCNbGeEDAq5nw98nfu4rEuIn92My3vljsX
         PZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684765488; x=1687357488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WrJg/wNkBONGN0Wx1dEOSdok8QAk/Ae/CmqoO/cnmRg=;
        b=N2U0LACdz7A6ryLf23HWLDdKQI047N/UDHYd/ZHgrgZxcfohHqR8y4OjEeSy1ltCV1
         6WiZf7hyKC1gJdiTJeCO6xAWLBX5irwyhGlHP0p+9ivali7riI0fVGJLL1FuM6VHMX3d
         WCiIo9av7ftkxTgskVuzOe3GhcDy83NxZL1iYzt1+yDo9m+wVo1GZC3KzSj6QJdCArPp
         cpDE53QVNY79jd3w1Bh0NKQaiCyswUDj+1kqzr2cK350fRd6kC8Vt1YfOdAFjL9XGXt6
         DHy+984wQQvRJLcdijjSBDvXBCyvzovCaat6NkOMq3xlOObvC8lJH0Jv5VA+/IFq6d8d
         GEpA==
X-Gm-Message-State: AC+VfDyr2SH2/5+Ciu8aZOH4jUjXJlUoPFrst38VTD5ZA2ZcBc1xM7Df
	WHmW9V5+2WvNUahbJ61B32DFjeg57JE/r82wKoZCUQ==
X-Google-Smtp-Source: ACHHUZ691OZMM8jUjpb+3dxigP6SFjRM6SysuXo4etlxvNSPTofI3FdW6TA1O5XrhguCoPsbsO0RAEKa8KEvnldXcig=
X-Received: by 2002:a0d:df4c:0:b0:561:18c6:528c with SMTP id
 i73-20020a0ddf4c000000b0056118c6528cmr11601341ywe.30.1684765488684; Mon, 22
 May 2023 07:24:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230203-evk-board-support-v7-0-98cbdfac656e@baylibre.com>
 <20230203-evk-board-support-v7-6-98cbdfac656e@baylibre.com> <ff7292f0-9055-1787-2543-e219fe30dddf@collabora.com>
In-Reply-To: <ff7292f0-9055-1787-2543-e219fe30dddf@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 22 May 2023 16:24:37 +0200
Message-ID: <CAFGrd9owtGmE7xPVRG7VwN5vrKtnq42q6ydSgex+Xocz-Oc16w@mail.gmail.com>
Subject: Re: [PATCH v7 06/11] arm64: dts: mediatek: set vmc regulator as
 always on
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_072452_056679_5C23B529 
X-CRM114-Status: GOOD (  11.47  )
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

Hi Angelo

Le lun. 15 mai 2023 =C3=A0 13:44, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> a =C3=A9crit :
>
> Il 11/05/23 18:29, amergnat@baylibre.com ha scritto:
> > From: Fabien Parent <fparent@baylibre.com>
> >
> > On downstream, we observe that the MSDC IP (used by the emmc, the micro
> > SD card and the WiFi) isn't working properly if the VMC regulator is
> > shutdown.
> >
> > Make sure it is always on.
>
> I don't understand the power tree of this board: if your VQMMC is VIO18 a=
nd
> *not* VMC, why is that required?

I don't have the full history of the downstream, but I think there is
a schematic
issue or HW conception issue because I see an extra pin "MSDC1_INSI" (which
isn't part of MSDC IP) with VIO18 pull-up. That's why, I guess, VQMMC =3D V=
IO18
for MMC1. But since DVDD28_MSDC1 =3D VMC, VQMMC should be equal
to VMC.

The always-on will be removed.

Regards,
Alexandre

