Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAFEC25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 07:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GDWpitdo2X2kcUTxZ9xqOzEm0DAjPIBjwveXgZ6qQhU=; b=TZSAu/zRRnhyhjK1NEAgtvPppZ
	4gIyUB19durqdvgBCJIFa1O2mrZvAzubdrQOrVuS5p72tI8+ni8b/O1CcNZBKpmRYMZVelK8oqOsh
	Mc5v82gW74WSTLhKCY7xkqHlyks953ASSUYTQwYBMavK8Q/x2wp4SiPE0Ync3/5pgT0GLrWwjImC2
	4QnV4MLHEEvj9G7Q4FM7PnBv9RVivrJMAosPC4jA2kyTvuyhk6zeEWjgRkAMomhVW/0RAi9+Qjngd
	4XMA+x8l8I4yRpbUKY5pGdi9eAd0UWGnXjuFfX5PSGLDIO0KjKME1Wgyi47B7Orm6gwUgOPYmXbV1
	D7IO/w3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCDtL-00000003AYO-0cQH;
	Wed, 29 May 2024 07:38:35 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCDtJ-00000003AWy-01ew
	for linux-mediatek@lists.infradead.org;
	Wed, 29 May 2024 07:38:34 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-df4d9b16348so1773738276.3
        for <linux-mediatek@lists.infradead.org>; Wed, 29 May 2024 00:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716968310; x=1717573110; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDWpitdo2X2kcUTxZ9xqOzEm0DAjPIBjwveXgZ6qQhU=;
        b=pVUAunmpgte2qeLLfLmVP7e7Dp9ITAhMreKDE0r3j/AGt+z1Dyx/0IIaXaZJ8G/Uh+
         320bP+WeyCdEbS9ZUmjOPynZWjpodRZSeo0akdjuMaHjOOSl/BA33CnPmv9PHywVnlma
         xXmbPJCazDQ7TD4U7L9Z06OuzaLW364fwzuQYroIcCqHfJl0TWfqt8jv+MBdeOTedBEQ
         5gVguzn4HIcPeO2ihU/EFqHpZv+MlFDN42KaUUVq99yYmGiTlUdOS0r9pOskWfte3Q8A
         sxUJlOcNj64QZLHi2fbwQLKiwlfjTj53dgTJ9r5GRK0IKguhk1GeHQU0yP7gtJerJwTA
         JArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716968310; x=1717573110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDWpitdo2X2kcUTxZ9xqOzEm0DAjPIBjwveXgZ6qQhU=;
        b=k0MZQrvHJkrF1Yk2C1L71nVTcCZKklosJ7omnJsfuhzMaoc6Pw2IfM3Q3f26fZGh0A
         ZK5M+fAw9GpxmFN0G2Pgr2Rt8nK5h3QGCH0V2DDN0byeXZ7YZATFB6njI9+PjjPJmLP1
         461795LOSUPXVCBoPPRTXoIy0sqhWRdKE6kzHCZLwx546I2W8t4/lqJG9YfssDXYYEUd
         GR/jRHDTsIYpxy4//cKS3GtyhzWmZFLS7+Fezid+9F2cCDWAYfRbt3R32ntF4/A3Pf17
         QaJhtTimhurAN+YxrJn2maf0/GkDHfbSUokKGyqoTzhSKkBuqcEBJEB2zKFsH3CxsITO
         3jRA==
X-Forwarded-Encrypted: i=1; AJvYcCXzVzehrfr8owA16rOy9340nkXnQ96XsbFYHswf5fCK8kIQy56Hkj4D1awQbrnz/bX0q+yJZeaYf15J5SbbUx/YR1R6ZQFsaaC98NszTUe5jlMW
X-Gm-Message-State: AOJu0YwoqhlD7wdjYKk4uR67m66ciDdnR66R3I/4X4/nybfl2e4CDHTx
	8UH9clixyUCNOqNerL8gk0vMMrfHOJJMJbyFZM+DiCNJs4xbkOCy6lkobzKVt0i2Ny0EIyGuilz
	wtjo6Pr5ARXw5huOr1eheNO0tj7DHQpCDFuywdQ==
X-Google-Smtp-Source: AGHT+IFIc0UDZH2rYBlciu6EgHe9SG0iWnIKv9l9LdqMVWwHt3lshTAxxaSapQH5k06xP+3gSAiJwASwUrqLK9mL1KY=
X-Received: by 2002:a25:dc87:0:b0:dfa:4730:ee8f with SMTP id
 3f1490d57ef6-dfa4730f680mr1288097276.61.1716968310297; Wed, 29 May 2024
 00:38:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240527115933.7396-1-zajec5@gmail.com> <20240527115933.7396-4-zajec5@gmail.com>
In-Reply-To: <20240527115933.7396-4-zajec5@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 May 2024 09:38:19 +0200
Message-ID: <CACRpkdY-2Q8H-fRP_EMWU7ugKHC7+kV-jPgiAcOPpsg94bHPbQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: mediatek: Add OpenWrt One
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
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
X-CRM114-CacheID: sfid-20240529_003833_087514_E33F02EF 
X-CRM114-Status: UNSURE (   9.81  )
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

On Mon, May 27, 2024 at 2:00=E2=80=AFPM Rafa=C5=82 Mi=C5=82ecki <zajec5@gma=
il.com> wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> OpenWrt One is the first ever OpenWrt product. It's based on MT7981B
> (AKA Filogic 820) and has 1 GiB or DDR4 RAM. The rest of peripherals
> remains to be added later.
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

