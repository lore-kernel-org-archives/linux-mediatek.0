Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F3CC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 10:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XIwMGfWyNQ7s5l6wql3uvlBpgJdlvAeJW6d0366qQQs=; b=rpKf56DUnVoRiAdT7rvU6pUJQ/
	gTZLG+q2mVWgvF/KsHDhJc5/dLE9Hhqfse+CDAyOq5FiMzvtjt641HqfH0JMwn9L/FCqB+o5LtWAH
	eM6zcVI6ybP9a+uv2lAbePUavtQyfBBFpoI/2lpOSg8BDPQ+7wmrWm1Qgce0kEclj5uGGLAuuiVJN
	COKIaHnfoVDHNdPvWo/rwzFCqCRBV5FNVSNgQ3XEieKQmB1Bf2dKu7Q6ZwPF+XNz1qxdjJjp1a3tZ
	3TvSdN0Abao/Ydb4Absp+kBpYH7kiX8ySsxGz1LvP6zq7JWeoWaVJp8XbXJb4a3enuduOey4JGiQd
	4/kKsOhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osLxi-004Tk0-Di; Tue, 08 Nov 2022 10:36:10 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osLxe-004Thw-DL
	for linux-mediatek@lists.infradead.org; Tue, 08 Nov 2022 10:36:09 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id p4so13196159vsa.11
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Nov 2022 02:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIwMGfWyNQ7s5l6wql3uvlBpgJdlvAeJW6d0366qQQs=;
        b=c/tDJvrT2wHv4vJWmTx3PQDFAb+Y/XJPBG2EIptwqdCWhYX5CAktQnHNOx40Ot5Hmj
         YVogdQ9uwLEYZlZs9fS18niOIAsddaAjWEtKbbTiy4+k+7WbFQWRqOa+z0XprQfI2pTy
         embv6SCWU66djSMx502aQWrD5bB8ckF5PZvik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XIwMGfWyNQ7s5l6wql3uvlBpgJdlvAeJW6d0366qQQs=;
        b=6E2kzIVRPjleHFXwlQP1zkNTkFDSqlEpD+14nY0F2tJYZbu9DtbpnDKAsihpPy1l0A
         s8VpMipXkeK1m3rycnLdDs7Wlx3V0mccLPBxhLeb4nnECReYWl6kp5lQv2ddyv6jq3xi
         0pDZmqdORAnjZT+yVAsJyC6ujBWaPzki9RRD0m70vQRYP1LVLkmJgJK3YiZabv9Zc8Bd
         2hrTjonU9LtQ1jHDh1/DqtL4pNTML1eeuILaoYWUJxw9KawQqWBSwcNT5zsBhUGe2STD
         kSflamFXpFrlagH+Le8Wmr6xdO3t8kuWl6vttcCIIWaLOklAG76yp3jrtju4EuKC5f4d
         e1Ug==
X-Gm-Message-State: ACrzQf1FSUUpds7YaxB+/GR8Xf+t5afV8sTK0sv9KpnTrDvUDX8HQabn
	UtHF7vfH/5W2UbFCjJ698O2bGF0YAGYYfyYdB0C0kQ==
X-Google-Smtp-Source: AMsMyM5jLCmjiXZ4jvSVXS8J/qTXmQOOIgSjI3NrNmXTmWAuW0AmzL7SRcukaw4oeCm789X2QNm3ZTTOWYDLc8Q7zvc=
X-Received: by 2002:a05:6102:3c83:b0:3ac:7ce4:1bc0 with SMTP id
 c3-20020a0561023c8300b003ac7ce41bc0mr27570121vsv.65.1667903761637; Tue, 08
 Nov 2022 02:36:01 -0800 (PST)
MIME-Version: 1.0
References: <20221107160437.740353-1-nfraprado@collabora.com>
In-Reply-To: <20221107160437.740353-1-nfraprado@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 8 Nov 2022 18:35:50 +0800
Message-ID: <CAGXv+5FRdA+OaA-tEE6Aa1avb1YtacqcE5e=A6ZpBFsCaLQRJw@mail.gmail.com>
Subject: Re: [PATCH 0/9] ASoC: mediatek: Register machine drivers to module
 device table
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kernel@collabora.com, 
	Ajye Huang <ajye_huang@compal.corp-partner.google.com>, 
	Akihiko Odaki <akihiko.odaki@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Jiaxin Yu <jiaxin.yu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Miaoqian Lin <linmq006@gmail.com>, 
	Takashi Iwai <tiwai@suse.com>, Trevor Wu <trevor.wu@mediatek.com>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, alsa-devel@alsa-project.org, 
	"chunxu.li" <chunxu.li@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_023606_474614_698507E7 
X-CRM114-Status: GOOD (  10.46  )
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

On Tue, Nov 8, 2022 at 12:05 AM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
>
> Some ASoC machine drivers for MediaTek platforms were not being
> registered to the module device table, preventing them to be
> automatically loaded when built as modules. This series adds the missing
> registration to the drivers.
>
>
> N=C3=ADcolas F. R. A. Prado (9):
>   ASoC: mediatek: mt2701-cs42448: Register to module device table
>   ASoC: mediatek: mt2701-wm8960: Register to module device table
>   ASoC: mediatek: mt6797-mt6351: Register to module device table
>   ASoC: mediatek: mt8183-da7219: Register to module device table
>   ASoC: mediatek: mt8183-mt6358: Register to module device table
>   ASoC: mediatek: mt8186-da7219: Register to module device table
>   ASoC: mediatek: mt8186-rt5682: Register to module device table
>   ASoC: mediatek: mt8192-mt6359: Register to module device table
>   ASoC: mediatek: mt8195-mt6359: Register to module device table

Thanks! This was on my TODO list. Whole series is

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

