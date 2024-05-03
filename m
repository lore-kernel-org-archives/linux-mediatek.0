Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C97C10F16
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 May 2024 07:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QjYwEtJ1fyGpU1Q0AkTDhWNCUjMhqqmY75kEGCHLUKE=; b=He3oNnZVrmkQkKbZGdelACo31m
	FDZVeZ3rYY7Ul3c5Rb0jo3DXNC5vTuUdw9L65ZFBVP/IwCnU5x4e405qLf6x+JYadcYKM5Xfd+u5p
	mYZjXaB9ljZC1eSBPKLrcZOCv7mVyfev61dKL2FDr+jKU1bf0eGOyJh7cfJ7WWYZBde4du5ZeoCx7
	1yBYCOSF8SlkAHk5k9fbtFBsAvAuC7pW8bV9fymPk+O+ml4iE2fgYgD7ZOIMU5PTU8q2Z43LTRiX9
	bsy8h37YAnPm83yKFdDektLvSlHK+9sxIw0HCdzaRBcu0at+5aBUuu4QfpoR0hgidpXkhbTnhva/u
	63XrD54Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2nFQ-0000000FS0D-1lRD;
	Fri, 03 May 2024 07:22:24 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2nFM-0000000FRx6-2VQg
	for linux-mediatek@lists.infradead.org;
	Fri, 03 May 2024 07:22:22 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-dc236729a2bso8849062276.0
        for <linux-mediatek@lists.infradead.org>; Fri, 03 May 2024 00:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714720938; x=1715325738; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjYwEtJ1fyGpU1Q0AkTDhWNCUjMhqqmY75kEGCHLUKE=;
        b=EI6QdMU6HUNoc/OMLIjyOLi1Bjs3GGmYyZ75XHiP6znX389Q3nwvjhI19+BwiVhzdu
         zwGla2bkxjaFc3zWZRrzAK93zBUuZblby/VetafTlAcnDKZVtL+ThEfU7aIzQhHO21uZ
         zDUJX/0zgPNQt8t3h9EcRZGcwl6JEI0EB8TxHZ9pmxJ7pcWNvQkIW3chNoqUl2gVxiOj
         VDprW6i1+cSza76xLYRen9P/2GaCyTEeesScdKovBTLjSmSRtzxG/VjwZNSg+8xNbjNR
         Ee+E8r3LNZ2yN1zXsvlNOa13VbxjKty7QX3CgZ0AuJEZVgNP+zAA3qwFQvFXf+1pQPfH
         /obA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714720938; x=1715325738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QjYwEtJ1fyGpU1Q0AkTDhWNCUjMhqqmY75kEGCHLUKE=;
        b=W8E1foqmEwrAc+GV7gMHyB/Mru0bElyq7QrqB/4DB76hIbgn0uYQFaJGIP/qEwFm0R
         MZc8yUqNyLf/hB3KHbWUmsSyWaofKnYBgRd8yrrwgBCGLhnLULhS69iSG+mDs+SshQJr
         UPfaVgPc/Gqnb4/OMJjZFXlrEFBNgqxs3o2WFX0XwxWrXZN5KaJYG0GsWYcaSWwpHnh6
         LOZLT3EbVkxevK6suR2X+/tFcKi4hzbe0B0JYHjU+j+ksbraGSrOtl6dQmD/h+UGXpFi
         mlR3DiHZJRPX4B2OPY+ITUIb/nwZCtR5be3Y2yU0kgZ8hUfntW3AgjvlJP+xnj7T1MK5
         jx3w==
X-Forwarded-Encrypted: i=1; AJvYcCXoUXm6xpOXLchPOOmvzkTn7RMBueNO2OXHtNU6udGL0rM9jGhKGIBRDqq6CHiG5EVLBI/JuzIw47IG65QEoSJV3aRCLfPwBZptN9fsfBsTUTiu
X-Gm-Message-State: AOJu0YzzMnrm0qNnkBDa+rWm0lWTvflcb43hutFr1laD1RGX+fHPS81U
	ipfP+eJczVGi0/7JlkNPs+uYS9xrcxIU7aerNG3GIuB7DXUWDsw0YIUJ08osBrMF7mL/Zkwk0h7
	XPhLnfI3XPngeqIKe13Zo4sT5ovoxCNKompLdlQ==
X-Google-Smtp-Source: AGHT+IEwW4AqX12ZZ5C8KcpzwxYuei77aV5JW6Vq3YoW7W8skkJw1c8IJyzuU+sc7rWvnkzCPhPiiByxYTX8tbg2iQI=
X-Received: by 2002:a25:6642:0:b0:de5:5575:99b5 with SMTP id
 z2-20020a256642000000b00de5557599b5mr1952112ybm.0.1714720938551; Fri, 03 May
 2024 00:22:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240423045502.7778-1-zajec5@gmail.com>
In-Reply-To: <20240423045502.7778-1-zajec5@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 3 May 2024 09:22:07 +0200
Message-ID: <CACRpkdb7PZugREmg_kbh3sx0riZiTu0AtyFgE8btP9Se7W27JQ@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/2] dt-bindings: pinctrl: mediatek: mt7622: fix
 array properties
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_002220_644885_9F17C2F4 
X-CRM114-Status: UNSURE (   8.24  )
X-CRM114-Notice: Please train this message.
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

On Tue, Apr 23, 2024 at 6:55=E2=80=AFAM Rafa=C5=82 Mi=C5=82ecki <zajec5@gma=
il.com> wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> Some properties (function groups & pins) are meant to be arrays and
> should allow multiple entries out of enum sets. Use "items" for those.
>
> Mistake was noticed during validation of in-kernel DTS files.
>
> Fixes: b9ffc18c6388 ("dt-bindings: mediatek: convert pinctrl to yaml")
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> Acked-by: Rob Herring <robh@kernel.org>

Patch applied!

Yours,
Linus Walleij

