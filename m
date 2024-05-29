Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8431C25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 07:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bBwx0BaHSsVNEUnMsd9n1ay0u8zPb5a85x6U4JpebKU=; b=huKwk6gXCcSXleP6fKHfFnaedj
	MfLsDXPsZ3J/NCJ9rTJfRpHGX3/cw9KJF0QFK8od0y1G5AmyQkRVdZly7rNimmTeE4FuCGXiVqSHk
	TNLhu9Og7ZgPeeixeo74zdkZLAsotA7czM1ccSiiSqnPL905EwOq1Dsl6qPFytwOrOahZzT0djgwX
	QY6JQsjN8sC6RKfRtH6d/EfJHQasBOXBGxsr0KGKd7PJ4nDGbeG+ssl5YYwWv7pGndPUZCyPpnkx2
	92DcJj+qFsWrlH2lmhOBGsUOvtEs32sfc6TyPIzkg8at6dSChG0l72qHozKUWP8bV/sz2+cyL5rG/
	KEXd1IQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCE6H-00000003EE9-1btL;
	Wed, 29 May 2024 07:51:57 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCE6C-00000003EC5-1iqL
	for linux-mediatek@lists.infradead.org;
	Wed, 29 May 2024 07:51:55 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-df79380ffceso520969276.1
        for <linux-mediatek@lists.infradead.org>; Wed, 29 May 2024 00:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716969111; x=1717573911; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBwx0BaHSsVNEUnMsd9n1ay0u8zPb5a85x6U4JpebKU=;
        b=cy7h227dGsCoW0py6dTSBqf0TW8nqCYaeHYlewdbwJU+G6G0kC8w6n+ObG6aBcm297
         GH/RqdG24vS0p3PGMLidR4Bs6dzvk3a5og8F/RDwWoks45KpRHB6zSumBPL0CJCdUgR0
         RH/tG6QvT9RMUg/A4GRb8xNB1pqAXB31H4e61vfQ2uadKRLmgq7SwWBcX8BzmIUmLsKr
         wDET9LzN27FzHfC2oTLf1lIRTKgc7WfpLE4OFuCvXX/Ae/vjhX8t3vyOgs9bkCaemdjT
         V7x/TTFgcxKmyyzPARnKnH9MtFngyoPketEbIU21MelAuhvdqovIDTgC7D3unU+ZKBGQ
         medQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716969111; x=1717573911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bBwx0BaHSsVNEUnMsd9n1ay0u8zPb5a85x6U4JpebKU=;
        b=D2Wr+Xtjec5R+Ar/FcTvmEGchyAHoXG3Oiaql+7fRKKpOaVMY+2BQABbDazEkc7AAv
         KdU1aTNZnK/AgQR1b28UnyUZfApPlDdz8pGWwsA2xBpjSvR7nA7sK058ErerpdjNarUr
         a17XY6mmOK7VCd5OBk17uH/3ObUKG6Se9bZapXFql7AIl4nuWYmbToswAfW+bX3Fssoy
         bZZoPKIOLY9ibeNKiWS+jnnJcIzuUZSNjsN+TCWI21FhFzPN6Clc8kv6fFT2w9ncEUY9
         00y3BEWii+mppY6MG3Wui7A4Wc3FBm0XPdGGy3yndkdoDN8tAsSpWxR/a/i1dPaC00eh
         uKTg==
X-Forwarded-Encrypted: i=1; AJvYcCUPDrzsrKEHuyPixIpjAueW6CjF1Du/7cvVYVJG5SznTSsK0oRNA0MVRKMFTXyr91oAC1ro/Wh6klB4ze+z8Hul4BSl5B1p70cjIQF0lqVRdirN
X-Gm-Message-State: AOJu0Yx8FDQj71WQsslFOUetcXlvtPwNXyn7ivwmiZsCXLIj6x18tj3B
	oszVRAaxqCHhbKwC1PFpsC7C5+yAkZnGBkpBS/LuHBYDBgEM1DNdCyFMRN/mFAhFkHVpzdFi/pn
	ZftgX951pykfy8RnJveiClKpL0B9MJ0I9kxqSvg==
X-Google-Smtp-Source: AGHT+IEdZVMS/LUVMN/7x2vVzkEALKqMfrjPKeS0kPwmIxnN+yi7ZZ35SOE+hRMN2bsbin3xxgQTYy3/oasEFiDvJ0M=
X-Received: by 2002:a25:900f:0:b0:df4:e089:d182 with SMTP id
 3f1490d57ef6-dfa464946c8mr913477276.19.1716969111210; Wed, 29 May 2024
 00:51:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240527115933.7396-1-zajec5@gmail.com> <20240527115933.7396-3-zajec5@gmail.com>
 <f3930034-0cc1-4bb5-894a-72c809211233@collabora.com>
In-Reply-To: <f3930034-0cc1-4bb5-894a-72c809211233@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 May 2024 09:51:40 +0200
Message-ID: <CACRpkdbh+5CMAD6_gxrMspJ+uFCs7R0HPe_SAWNvfvyxyA=U2A@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: arm64: dts: mediatek: Add OpenWrt One
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Heiko Stuebner <heiko.stuebner@cherry.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Chris Morgan <macromorgan@hotmail.com>, 
	Sebastian Reichel <sre@kernel.org>, Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	openwrt-devel@lists.openwrt.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_005152_812913_3A6E3B66 
X-CRM114-Status: UNSURE (   9.97  )
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

On Tue, May 28, 2024 at 12:32=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:

> Isn't the OpenWRT One made by BananaPi?
> In that case this would be bananapi,openwrt-one I guess?
>
> Is there any OpenWRT contact that can please help clarifying this?

Both Rafal and me are members of the OpenWrt project.

The legal responsibility and trademark of this product is handled
by OpenWrt, so they are legally the entity producing this board,
I think that is what matters for vendor strings.

Yours,
Linus Walleij

