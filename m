Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E16FC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 11:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XaBdxRjUZjWiYi/UU6XdULmnAXVS96JTxTikA1au8DU=; b=k5RrTCWwtm/QpGJeTeOK/Vr9wV
	ieHSv4o22b1dDSJQeQSVcs94SkuJ1KhSxuNHfxOGmLiXUPhO1UFcbqBuTSHo8l85F3d7wgPiPIsJP
	3AUD+Q6ae5wFOtPYF+Xpw7LB0CZaq1hMP3Tfy12FEO2yZHuNzucIL7ZIrDRIdtiMwTeBvwqiHM+pl
	pSUeX8+8SjQHDeOX3Sex5wOLGcqT95/pSTl+4DR/Xy21oq6vO7TUDwNjCtJMrJk0XByUhy6IHTxg7
	RMqfr0fmP+4gNZndDmxjk2okv8Xw5v2fSALXLk5QS40J1bH10aNbeHCnHv+/pokjr4pKVuM4q8EJ3
	3LqjnPLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osMOk-004jb5-Qx; Tue, 08 Nov 2022 11:04:06 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osMOi-004jZv-CY
	for linux-mediatek@lists.infradead.org; Tue, 08 Nov 2022 11:04:05 +0000
Received: by mail-vs1-xe32.google.com with SMTP id t5so13299583vsh.8
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Nov 2022 03:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XaBdxRjUZjWiYi/UU6XdULmnAXVS96JTxTikA1au8DU=;
        b=ZkzY5ETtu0PETYIEUH10nOly3VcuJtkSlDZS4QtrJ3TMoZG09BAH7UKvNhtr6bh4EI
         KgjB+YXYUVdVddL2B+f84CKvmXVF8qoy/AF5DZ8jppLG+33w9qiiQBCNQkLY2IoGfkiV
         BkKz2ggOccQfHZpvxNc4nAQm22PLy6uKIt+SA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XaBdxRjUZjWiYi/UU6XdULmnAXVS96JTxTikA1au8DU=;
        b=6Tdok6IpQjHoYxcOxhoSYYxFd4gVus4ZCFreGg9uqhx7jJDMZp8+svv3SAdv0eigXo
         fCNF4+bgqGQXbdA/rskPt1YuEuEkrxePPAOFJR9mSJ4s81N/6ur8HGfpXUslPaDAsD5O
         EwG7GmuN/xBHHoGnMF1N3iTWB7EMqDhYvotXNwE0mMw2ucGDQnktTkCAmXO0ifuL+w4B
         dEE187k0K1xm6kjqqg6O8zV/V6YcQPEBDawV4nvxHx0OUtRV10bv4CNcKEAE5GjiE89z
         J/ISjD6ZWAp32XZRe4kIF8T6k4Gem+6EDwdXYeCF37SP2uYOLfBHUcEtAxbjWd5YlDY7
         4ZXw==
X-Gm-Message-State: ACrzQf1DGqMeqhWs7R3DHOlpEJCGNcIYrB5jX644D7FHpHNKvEHHJknk
	zjnZguX5osdbyHJ5IdY5c0Ax8zquZ20M8hG9+CDf/Q==
X-Google-Smtp-Source: AMsMyM6t0mPbG4ToZz5l/tO1gDfCULSYa4MknrJDh9MS6I1IEkQHqfasxxjvZuxONegx0VxazFgJwfSXzMjsEheapQg=
X-Received: by 2002:a05:6102:3c83:b0:3ac:7ce4:1bc0 with SMTP id
 c3-20020a0561023c8300b003ac7ce41bc0mr27621104vsv.65.1667905441651; Tue, 08
 Nov 2022 03:04:01 -0800 (PST)
MIME-Version: 1.0
References: <20221107160437.740353-1-nfraprado@collabora.com>
 <20221107160437.740353-9-nfraprado@collabora.com> <b5b61326-298c-9845-eec0-15542f096225@collabora.com>
In-Reply-To: <b5b61326-298c-9845-eec0-15542f096225@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 8 Nov 2022 19:03:50 +0800
Message-ID: <CAGXv+5EwsqE+npF4QYpwWMLb55JMGaXANxo87dyDpYwBxD-E4g@mail.gmail.com>
Subject: Re: [PATCH 8/9] ASoC: mediatek: mt8192-mt6359: Register to module
 device table
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Mark Brown <broonie@kernel.org>, kernel@collabora.com, 
	Akihiko Odaki <akihiko.odaki@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Jiaxin Yu <jiaxin.yu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Miaoqian Lin <linmq006@gmail.com>, 
	Takashi Iwai <tiwai@suse.com>, Tzung-Bi Shih <tzungbi@kernel.org>, alsa-devel@alsa-project.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_030404_444193_4F6753FE 
X-CRM114-Status: GOOD (  10.74  )
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

On Tue, Nov 8, 2022 at 4:44 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 07/11/22 17:04, N=C3=ADcolas F. R. A. Prado ha scritto:
> > Register the compatibles for this module on the module device table so
> > it can be automatically loaded when a matching device is found on the
> > system.
> >
> > Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

