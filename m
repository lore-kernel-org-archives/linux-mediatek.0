Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAFEC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 11:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xcl801rNi7Jh6Jo/hu/Jbz9lZkngLXNu9cMkPtXUrh8=; b=nZh0XIxsnzccI2tGO9q9dUPx7I
	ZOw3Jx9i6ZiTblUkt3AZ1AdU/ifSwhLeGphBhXguOdmi6GwsTZiqBS5CZ1c0OxOj3IAanCLZYoRA+
	Vu601PdA38Xc2qkku4BVk0F2DwhREHe1DVCZW5P1j+c+YPWNb9W7XR/gYC4Ag1NzbVQcU/FBktYzb
	dMTIJasEdfjfU+oTO57AdQzp2oxXdvMG5b7BAkXRYYDGsUADg4t6De50GN9gDkBV1JW75KS2TgxUk
	cbNXZ+ZtvH219Q2ry5g+w/9M4OXRev8OY/ZZP98iQ5RPy5/N1nG4q5wZ0skIx26H0UDUNB3Y4Wdx1
	NT6fcGjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osMUl-004mPI-GY; Tue, 08 Nov 2022 11:10:19 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osMUA-004m46-5z
	for linux-mediatek@lists.infradead.org; Tue, 08 Nov 2022 11:09:43 +0000
Received: by mail-ua1-x92a.google.com with SMTP id c31so4672557uae.10
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Nov 2022 03:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xcl801rNi7Jh6Jo/hu/Jbz9lZkngLXNu9cMkPtXUrh8=;
        b=ZHUwRUHMlsd+uune7sAXQUqlyoGj17Cph+iZZ0v3cRtb0ZZfwNsfvleGyTzasdKFXI
         QQ5BmiwQJoxP5/GrJF2+TxE0RkhKKX1mgOBOPP/3neMswl6d8ENmV8rZJebfekhajTuV
         xhwoyHRDFghPMry1bA8wATRGJyA8JkSuwUaNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xcl801rNi7Jh6Jo/hu/Jbz9lZkngLXNu9cMkPtXUrh8=;
        b=2YXGB+mv3C/4a2KLlJGvI/iRvykgeuPaB3UcTDJFHVJY8f5wRSjjWTdN52MTnliw4g
         7yT0dNCO6CBWj58q/fgHOBpIAWH55ml7xXzC0c9gbO7m0J+/ljWBg/8erlXRoXLBdHtL
         JWXBpvxcmKExqXO9MSctm/NFTw3fKaP5J9OcbOhXXGvkgrjbNvKhgh2A54+UKsdbykAP
         jh6pyznT5Rz0VPhYT36wO7cMjGZPzLLearFMb4tmklQz91Cc+U9dxnKHVMp10chIWkB+
         2t+xdVq+GXUL/XwannlF6EkaCJbRzzTe9avXxJSRFav0/E2J7/+jQtT5P++xSFFrzxvS
         sAVw==
X-Gm-Message-State: ACrzQf17TFxc57bI7hIuPdQJj7Gg4JW1/flnAAP5zzJeGAhcsVv+CaSE
	VXoiTX4633rLgAlwxiAOswBih8d+V5SqQmSqJUJndQ==
X-Google-Smtp-Source: AMsMyM6sjG+3Ik/dtstkJiPnbQ2Nxhh/biLDiEKU7uJHUe6uWGF9l33bHbxbqAeo3fH4zVwtXXQY39IBCfY5SWIe9D0=
X-Received: by 2002:ab0:a95:0:b0:3ad:bbe7:e134 with SMTP id
 d21-20020ab00a95000000b003adbbe7e134mr16528144uak.43.1667905779999; Tue, 08
 Nov 2022 03:09:39 -0800 (PST)
MIME-Version: 1.0
References: <20221107160437.740353-1-nfraprado@collabora.com>
 <20221107160437.740353-10-nfraprado@collabora.com> <2f2bdebf-8566-7740-733a-79c6e1938c84@collabora.com>
In-Reply-To: <2f2bdebf-8566-7740-733a-79c6e1938c84@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 8 Nov 2022 19:09:29 +0800
Message-ID: <CAGXv+5EE6OjKcki+40nKLs6wz6iRybpoxD1X4gJ+Z1CDHomtvg@mail.gmail.com>
Subject: Re: [PATCH 9/9] ASoC: mediatek: mt8195-mt6359: Register to module
 device table
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Mark Brown <broonie@kernel.org>, kernel@collabora.com, Jaroslav Kysela <perex@perex.cz>, 
	Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Takashi Iwai <tiwai@suse.com>, Trevor Wu <trevor.wu@mediatek.com>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, alsa-devel@alsa-project.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_030942_278913_480C0864 
X-CRM114-Status: GOOD (  10.97  )
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

On Tue, Nov 8, 2022 at 4:43 PM AngeloGioacchino Del Regno
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

The module was automatically loaded.

