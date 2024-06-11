Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BB7C25B76
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jun 2024 08:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=or+4NmGXTUe0vxNapTWhccRz5KiVpXdBi26BBe10Eio=; b=iyyeFkvNrf7wneVagCPouuoTfO
	szHQvFtRwLIRfU/V+WfX6CUJbzN/yPZQtXrWxXg+8OB6BeFkqo5vIuIwQ/TFh5Ayn8TWIL87TmiEN
	ZL1BKAdybkqEJAxyB37fg08QIduN39mldGanfG7PaFb3oAh7lM7l+7YdgzeBmMmAB272d6WsThVkh
	OTqCgSk64nHEQypYN+CIN5I1DJhEFzYYqBG36Ybh28Er36XQVQ0OOVEMLm1QfXovJop84MH1AXTZk
	6WjKPcQL3PFri5ptWNG2rSYvbk/mug3s6RCb+bNfDPz1bVXc+9ydwlkMddSJlpUCA8U5zwRniXhtl
	2BFD2VPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGwTl-00000007yGO-1trL;
	Tue, 11 Jun 2024 08:03:41 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGwSy-00000007xfu-2A3F
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Jun 2024 08:02:56 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a6f1c4800easo227323266b.3
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Jun 2024 01:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718092966; x=1718697766; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=or+4NmGXTUe0vxNapTWhccRz5KiVpXdBi26BBe10Eio=;
        b=caga2t7WcxGZqbqvNbGRAZPiAts3hhdq/U36H9omg82jLSVvTtjoNNkMB+hDiK5Yc3
         Xq8+FXj8g+nE2aLfbAey5qN3voUAUhgwqG1WNO/IABYGC0lHmvGBGfrqyytolFbTgsIv
         YUpMOKyICYvjfvKTKVxf2DoKrzbCi7o5t2G0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718092966; x=1718697766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=or+4NmGXTUe0vxNapTWhccRz5KiVpXdBi26BBe10Eio=;
        b=YB4vo8/0fooxXnUImi7pFF1LKC+kLg3bwQZOpHoJhz6QZfWLMKQrmA0ItCA/m3Z6CS
         Em1ptJ3F1D+s1EAxK0jNbih4D1DnjzuODFDPTV1chACwtUB5kZvZPb93osw4SorBzmoS
         kfAwTF4Ac9E+y/nbQLBeD5JgQL0AmHvYRIeKSgZCkD+jaFCcZgdXzgXN6Wj1n9Zfmhrq
         flKsBhtc/+5F2TbZBQF3n+n/gw1kr3aWCb9AsgXUQB+7gsKe4/wBKnfHJ/zKXXuUonDt
         loWNiRKtQcJH7JRRIRu6MmPIxge8s0HNlDdFAeavnJX4QsERNMa/a3tbHEGDezIco4b/
         Arsw==
X-Forwarded-Encrypted: i=1; AJvYcCWMgCvgQLXpaP4T866vV8TqSXPn5GfhDECeAkknYESq5TSd7vIbc5cA+iwdnMxQPnkdfWL4JJdSiL6pw0PGUnihB9QXPYxa8QY3oQAeT0sclQu7
X-Gm-Message-State: AOJu0Yw0tgEoi+/6TvnM5YI9pVKKEzA+12smnyyt9KJiFqr9/z1cb2Dr
	T/nOIoADBZgpVJSbkedDHOwHij22TY4om23M8U9E/oEB6zoeGQdOwDBuZqWxG2B+r9CXcyN+FMg
	=
X-Google-Smtp-Source: AGHT+IFPBtWtzjrV3+X975xDbEFhWA1ne3IZRbN8gmS3ZAQW+XJTBwOAHgmqT4mOH4WlKWYQiHK66Q==
X-Received: by 2002:a17:906:f212:b0:a6f:390e:2e15 with SMTP id a640c23a62f3a-a6f390e30c1mr57332866b.60.1718092966397;
        Tue, 11 Jun 2024 01:02:46 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f0f71a312sm379731066b.8.2024.06.11.01.02.45
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 01:02:45 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a6efae34c83so341081366b.0
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Jun 2024 01:02:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV1QLkCKRafqLChXP4lSzzkg548izKmDhDtkpScZ6YiDwdg8nZyao0wgQvszEWnS0FdxXAEXrb1PNDLOI14onOE8QucZl3KiuJA9+cQYMDHHQBi
X-Received: by 2002:a17:906:39ca:b0:a6f:309d:ec23 with SMTP id
 a640c23a62f3a-a6f309df3f9mr177781666b.72.1718092965211; Tue, 11 Jun 2024
 01:02:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240531-da7219-v1-1-ac3343f3ae6a@chromium.org> <171762153256.557520.12011428649748199502.b4-ty@kernel.org>
In-Reply-To: <171762153256.557520.12011428649748199502.b4-ty@kernel.org>
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Tue, 11 Jun 2024 16:02:08 +0800
X-Gmail-Original-Message-ID: <CAHc4DNJ3q=a8Wts_q12=R34eMbMq+d4PSEFe7YR+DDs=C_Og9g@mail.gmail.com>
Message-ID: <CAHc4DNJ3q=a8Wts_q12=R34eMbMq+d4PSEFe7YR+DDs=C_Og9g@mail.gmail.com>
Subject: Re: [PATCH RFT] ASoC: mediatek: mt8183-da7219-max98357: Fix kcontrol
 name collision
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alper Nebi Yasak <alpernebiyasak@gmail.com>, Hsin-Te Yuan <yuanhsinte@chromium.org>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_010253_184355_365AC44C 
X-CRM114-Status: GOOD (  21.47  )
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

On Thu, Jun 6, 2024 at 5:05=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Fri, 31 May 2024 08:37:54 +0000, Hsin-Te Yuan wrote:
> > Since "Headphone Switch" kcontrol name has already been used by da7219,
> > rename the control name from "Headphone" to "Headphones" to prevent the
> > colision. Also, this change makes kcontrol name align with the one in
> > mt8186-mt6366-da7219-max98357.c.
> >
> >
>
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-=
next
>
> Thanks!
>
> [1/1] ASoC: mediatek: mt8183-da7219-max98357: Fix kcontrol name collision
>       commit: 97d8613679eb53bd0c07d0fbd3d8471e46ba46c1
>
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
>
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
>
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
>
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
>
> Thanks,
> Mark
>

Hi Mark,

I accidentally added a Change-Id field in the commit message. Can you
help remove it before sending it to Linus?

Thanks,
Hsin-Te

