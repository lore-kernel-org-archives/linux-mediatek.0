Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF1DE7E0D0
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Feb 2026 18:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xdy7gJsLYllkNO0/gdiw41aVS2auSaqMrEZolWNWaNw=; b=1HK7agWhaHlI1YgxME+EZjg3+Q
	Ug+8cqH020fEB+xiob1bwVL/sB7RBXZFOo2AHKkwarpgQkZoPOEgJlKMZhdKE3qW6Agkqv5iL9Dvj
	a95RVsZagRMa5IlTchApM0O6fUeAY8MWddkSAmW/xSHWWTv1IKN4vGINoHAxu90AxCMLjrdbhNclp
	QMVBOGcmeq1jlKgYfmuJasEdPtbewbGCMhMm6diSrE+cRRONjX7v91dVI78390LQ9R4YlSfq781aS
	ZW3OU32qGkuwzJc2tEaUWLkLm3ggXp/m+02vnNRw1Sfll/ndAsdRtQw3lGYhQKxy33I4HwPtp1rvn
	Ro/OYpzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpWHj-0000000Fsat-2Jjk;
	Mon, 09 Feb 2026 18:46:59 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpWHg-0000000Fsa7-1Uv2
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Feb 2026 18:46:58 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b8869cd7bb1so604389666b.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Feb 2026 10:46:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770662814; cv=none;
        d=google.com; s=arc-20240605;
        b=hnRHKXqL78Xob+1Z+c8dD3vwDhtelADWdMq95k5oS0Lg+RaIUyGZ8sYU7Fx1eITu0i
         OP4TTQXNrTmH1DgGeJ76xP+0sCZ5+flGMP2nU16WVfSJDxfFu5/C03eoWhpcvTCnKaUV
         gMBzd5cPrjzCScFYsINMWm1owevhed/QElp8mGxMppSkjWas6WsOL3detpqt+eFXOnry
         OepubizmUZeWpyRfLYOJkBue+hSP3p05Kh8tzb5gWVy/OMi1b9to+1y6Hy7XO6tsp9x5
         WuKiFV9/ZqZWYerkBRzcALb8cGHTW/N+83kJhVRY+EcNDBVZxWOpkX6DF5ESXaHS3vm9
         JMsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xdy7gJsLYllkNO0/gdiw41aVS2auSaqMrEZolWNWaNw=;
        fh=3zwK7/514ugrfCdxbbHVrTyeyaboCTJrUNfdbL4Oi4U=;
        b=UtUW3qlriJLBeKJSpBG3TQKxOjQLWiwBVKwsXMXhs3QwrzT8w/9VKiS1oC6ZDtN1cw
         SfAcwEw+ZxP38n241LbWzdOu905VeI5BTjklGieQhmXkUM6+16StaHLWm4Ez15GZuSEO
         TGk61FMBcqZMkZ9wtlTXX16Z6oRoabJk9MkynQZrXUtNS2H9oJ2efZryvCkUKHWbh/r2
         o6GIOO//7cvnvLNRpbm9JLhnzzUlYaqRa4Zm+9lwo9KZ9IPkZ4t9bcvBdw3DV18o+lM3
         zGdGJtFQAl9RDBLreO89t0lNWNobACUQOaDyqVWcHFKycjMwigB0Bbu5OaxSwcXOE5sX
         GG9Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770662814; x=1771267614; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xdy7gJsLYllkNO0/gdiw41aVS2auSaqMrEZolWNWaNw=;
        b=cINyfSgnlQ3TabvhLP7SiY1MzJdEsmvrAMbRB1sHUTSa3SYBasT9qNYV0OAzCvdYch
         brAus6gM5ma4OhJm853v9duO8/uqZuTtu4QeGs71BVyqiZks3Bt92q/dWH9rXmZhH5T1
         +eCHOWOt2CfcW/S9PCIylV8B310XiTWh0x6uu2ED3IHbL+yDpoGfACs9LNCI4vZMNnyF
         VZQXcEyqCsi92Q/cVFbkS0CbiybdpGOk/ws4/Xlgq4CiUJK1fQEY5/JdAolCYoHgKJNc
         IkphhbvR0xrdCq/E5fAqqMvZJPJcmxkuIAQiak8kHqwD8fB8avIEoGa1UUYEgWd+5Cs1
         xR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770662814; x=1771267614;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdy7gJsLYllkNO0/gdiw41aVS2auSaqMrEZolWNWaNw=;
        b=WgzyipMyPExEnTxUYlMNAlQhM+JR4eDciNH4IVKXFnDgw2Q7c9u9/vOjoTgZvQxHog
         0NiWnGnpRv60UNH7a4Zwcn4ZJyG9A3jgwyeQBmcvZ9itQgpzLnqEMgmix1RXQINB2h3K
         zgEELMa9Lgw2bnrT45QdgM9ZMtkPn5ErHAl6aUSAhxA8x351MMbk1d+5IMkhox6ZxvHm
         x6DkT4UB0NBoaSP9znf/3npmJivwV2Zqax63Zf+A6vkRueTnkFQMv9tprGuJHqK4itEl
         8UNciPL+N+XBFqyR78v8YuLPWmdHAJAfJt2d0FSafEx1C/+IHYquqX9MXUAV+3fTlVaE
         qv8g==
X-Gm-Message-State: AOJu0Yz5gAbmZ4Kwf/ET0oJQ9JvnTazP9xV4N0vJ5LuaMnj1U6gpR2Se
	qroL/6k6AqA9ETOoX4kyxLnIt7aUZVIHYGVVfopdzYQwfCDYh1nIcs3B/wA2NJVlU+1X4khZcdX
	FaVo0QdXvdT0fyj1QocyMiXWHG6lNCLE=
X-Gm-Gg: AZuq6aIuPrTMQKKthF0tYWJJzg3xJSGIuPM5YCe0rw+QN8FybpYHgyw5B6KROHJVNyz
	KdflcesBTYlHm9emYLLIdN0yGS2uPLrumBEsFIL2ahoM7396N6pWYHXewNUnOuS+O8oXt6oqJvV
	NdqjqYo+sgiuTxMuAm0vwzPyRj0BrCiIc7Ph5zmPvQDifo29c7huiUnKTZ/nOzOCR/OlBNyQ+Fp
	QSvDYVMwNAO1njQX1H1/ZXMlvx0inDrP9sVpVSCwAYRdTrYU33RFTNFjoNCv/Wb7efgHQ==
X-Received: by 2002:a17:907:2d22:b0:b8e:64e:1ed with SMTP id
 a640c23a62f3a-b8edf34115emr746950966b.50.1770662814147; Mon, 09 Feb 2026
 10:46:54 -0800 (PST)
MIME-Version: 1.0
References: <20260209090516.14369-1-l.scorcia@gmail.com> <5535ac41-efb8-4bf5-91bb-9b6f63517e8f@collabora.com>
In-Reply-To: <5535ac41-efb8-4bf5-91bb-9b6f63517e8f@collabora.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Mon, 9 Feb 2026 19:46:42 +0100
X-Gm-Features: AZwV_QheTmAVmlDGudBbkamp8UbdQU6-uwWFc-1fInCP0BGz1DgvN8YwMPCQ4dI
Message-ID: <CAORyz2J=zEMgNS6n6ouVZ3QA1moYfP053Jr5vhcscR9nDmKOfA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: dsi: Store driver data before invoking mipi_dsi_host_register
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_104656_449713_EFBE2B8B 
X-CRM114-Status: GOOD (  24.65  )
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

Il giorno lun 9 feb 2026 alle ore 12:40 AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> ha scritto:
>
> Il 09/02/26 10:05, Luca Leonardo Scorcia ha scritto:
> > The call to mipi_dsi_host_register triggers a callback to mtk_dsi_bind,
> > which uses dev_get_drvdata to retrieve the mtk_dsi struct, so this
> > structure needs to be stored inside the driver data before invoking it.
> >
> > As drvdata is currently uninitialized it leads to a crash when
> > registering the DSI DRM encoder right after acquiring
> > the mode_config.idr_mutex, blocking all subsequent DRM operations.
> >
> > Fixes the following crash during mediatek-drm probe (tested on Xiaomi
> > Smart Clock x04g):
> >
> > Unable to handle kernel NULL pointer dereference at virtual address
> >   0000000000000040
> > [...]
> > ---[ end trace 0000000000000000 ]---
> >
> > Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>
> ... but wait, what have I just read? Xiaomi Smart Clock?! MT8167?
>
> Are you running upstream on this device?
> If so, why don't you also contribute a nice devicetree to get this device finally
> upstream?!?! :-)

That's correct! Most of the work had already been done by the
wonderful people at postmarketOS, I just had to connect the dots. Some
crucial patches (mt6392 regulator, mt8167 display nodes) were
submitted in the past but weren't merged for various reasons.

Just rebased on v6.19: https://pasteboard.co/6bXQeWlwUqmz.jpg

I am trying to get it working as much as I can, then cleanup and
submit. At the moment storage, usb networking, rtc, buttons, screen,
touch, backlight, light/presence sensors, drm and gce are all working;
still missing wifi/bt, audio and cpuidle.

> Cheers,
> Angelo
>
> > ---
> >   drivers/gpu/drm/mediatek/mtk_dsi.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index 4c2983852596..2358407b8a6b 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -1232,6 +1232,8 @@ static int mtk_dsi_probe(struct platform_device *pdev)
> >
> >       dsi->host.ops = &mtk_dsi_ops;
> >       dsi->host.dev = dev;
> > +     platform_set_drvdata(pdev, dsi);
> > +
> >       ret = mipi_dsi_host_register(&dsi->host);
> >       if (ret < 0)
> >               return dev_err_probe(dev, ret, "Failed to register DSI host\n");
> > @@ -1254,8 +1256,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
> >
> >       init_waitqueue_head(&dsi->irq_wait_queue);
> >
> > -     platform_set_drvdata(pdev, dsi);
> > -
> >       dsi->bridge.of_node = dev->of_node;
> >       dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
> >
>
>


-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

