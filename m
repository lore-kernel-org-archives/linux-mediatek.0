Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A579C54E94
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 15:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hZ+XWT7x3GIrVuC5smdu5kaGnAEgwF0jVXjRtih1Jog=; b=njVxIAj7Ji6nR9pThtj3hWGylU
	7e7lMMUbQuumdNJsI6ZaMX5ItOoxUsCn1Wh02laONArEekGN2jH8pmKen0+1POizfwyxTVyMRgGP1
	owRPbj81hl9qai64FncquWr1grOdnvDwTfBpXPa4vZ82ibvoXavigxdx4OqvfU2jbqt3KXFGIfreW
	5cKd13FdVBo30nEnBEK9zk+1M+N+5GGImO8XPhGP9XpP+1u7vw1m8Fd3C9aZmzDz3cx9Uz/9VpEcp
	Rby0PAvZEtbZYu01+GB7BDjZ6k+wg1GR6f2OTU6T56Zmb+652WgDgTFfsVn3lxbj3QSvD0oGyLHSa
	EZZZdtMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKhMJ-007ib1-Si; Wed, 25 Jan 2023 15:06:43 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKhMH-007iYq-Ce
	for linux-mediatek@lists.infradead.org; Wed, 25 Jan 2023 15:06:42 +0000
Received: by mail-ej1-x62f.google.com with SMTP id az20so48507369ejc.1
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Jan 2023 07:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hZ+XWT7x3GIrVuC5smdu5kaGnAEgwF0jVXjRtih1Jog=;
        b=cH3hA1DNTFYYXcYv2dYsdfs/F0a4Fo0x393HAZwW7sg2/ZjfnFAD1GtMUOqjWL6CnP
         ZvzRjkIG0subDN66xQFmo5RPvHMO3JcQFlvxD4ONkyFtfwzAB0ttmle/4y/TihRmks2S
         QXEXCp8Wf6YgFDGr3UNW6Zg1acdhVDLA6TZFsp2afNANCN/FBWcfLjqRBqIzEzy0hs2+
         Iu7AQIKZKCjwH1r3tr76JeJWLqDPeFtDwhkwh4CwUKs4fBH3dkJgQS9oXUFzIuRCTvAV
         wz10ylaivnJCsis/1BoziUFwpkgIXGHitA8M5eSFjzZ2tVIZ5zMWatWzwaCmwmELkutj
         aVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hZ+XWT7x3GIrVuC5smdu5kaGnAEgwF0jVXjRtih1Jog=;
        b=L0YUelUABC3ysMi9YTMAgQjmqyOFq/+xnP5iw6edE0Ydvl/4xU+4gyCalck2ibfqXr
         1RxPvCdyQ6tqSEbNKeeUatjnSvrJTKoeglaPpOPM9HSjStc8ZyVPZFBSbOKyf9WIIZnQ
         3zpQDBTbaIgJtv3NpKRL8WP9KsrgB7gzksR8yIRLW8WfYAD4pMepVq75Bn8915u3I+U5
         QF19W5kCqHXtdvO9da2EbPxPfBOS/S7BqpYmFqRAmiX0Uscd/Gaa914V+c5V/CorJlKY
         ULsquKUkR5yL3z3/8rlgYn6sXHbaMMeGQ6v1s9u7rrhdc/ZWJYWCu/ewPVTtp7ohTGMf
         l+9w==
X-Gm-Message-State: AFqh2kqNJ5nmtd2DnxWjPr9+g6y/HdPJqV5W4AhQN7Ng1C1z8JeMVdLo
	u/4nJV0K5djMbSKFXrkmOTgfcCxC2lj6lMULt+Al4A==
X-Google-Smtp-Source: AMrXdXvqJOlDJST3w87/gr/ZwRFOMtImwLKSDqGCZTr2eYhDs7UWmBPmEUcE54nfAXRo5cLYHmUUvd9VLSwpRS2TOrc=
X-Received: by 2002:a17:907:c243:b0:7c0:e391:c548 with SMTP id
 tj3-20020a170907c24300b007c0e391c548mr5314680ejc.18.1674659200062; Wed, 25
 Jan 2023 07:06:40 -0800 (PST)
MIME-Version: 1.0
References: <20230124131717.128660-1-bchihi@baylibre.com> <20230124131717.128660-5-bchihi@baylibre.com>
 <5dd5c795-5e67-146d-7132-30fc90171d4c@collabora.com>
In-Reply-To: <5dd5c795-5e67-146d-7132-30fc90171d4c@collabora.com>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Wed, 25 Jan 2023 16:06:04 +0100
Message-ID: <CAGuA+oo6dV=Vs69PMPSpBSdqDa2ESHjiTzrH_ZYAyUgVmq9HJw@mail.gmail.com>
Subject: Re: [PATCH v11 4/6] thermal/drivers/mediatek: Add the Low Voltage
 Thermal Sensor driver
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: daniel.lezcano@linaro.org, rafael@kernel.org, amitk@kernel.org, 
	rui.zhang@intel.com, matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org, 
	ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	khilman@baylibre.com, james.lo@mediatek.com, rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_070641_464088_C061FAC4 
X-CRM114-Status: GOOD (  15.13  )
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

On Tue, Jan 24, 2023 at 4:31 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 24/01/23 14:17, bchihi@baylibre.com ha scritto:
> > From: Balsam CHIHI <bchihi@baylibre.com>
> >
> > The Low Voltage Thermal Sensor (LVTS) is a multiple sensors, multi
> > controllers contained in a thermal domain.
> >
> > A thermal domains can be the MCU or the AP.
> >
> > Each thermal domains contain up to seven controllers, each thermal
> > controller handle up to four thermal sensors.
> >
> > The LVTS has two Finite State Machines (FSM), one to handle the
> > functionin temperatures range like hot or cold temperature and another
> > one to handle monitoring trip point. The FSM notifies via interrupts
> > when a trip point is crossed.
> >
> > The interrupt is managed at the thermal controller level, so when an
> > interrupt occurs, the driver has to find out which sensor triggered
> > such an interrupt.
> >
> > The sampling of the thermal can be filtered or immediate. For the
> > former, the LVTS measures several points and applies a low pass
> > filter.
> >
> > Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>
> On MT8195 Tomato Chromebook:
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Hi Angelo,

Thank you for reviewing and testing it.

Best regards,
Balsam

