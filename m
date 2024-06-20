Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7391C27C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jun 2024 09:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1C8Ju8XWmp5T/a5fTSJkVEbGY+u2Y8Oaw2wvJKVqwcw=; b=gXdpWuAarxbWwlBFdWyLoPm0Wr
	WXREpIPxLh2VymYtJpoo/ADMIR2EUIjBbTRK6MF3VAYgYkzQLFcGD/D10enpspOtiFBqv8Hnt0qvL
	uq9lxITUy+dkf99dTXk6QX7qxVDrdIjkKt2jy+nlp7Xnk7+R4IrWRG9gQg5h+R7NKR3ukUPkGYd/1
	ldtJ9W4Jm16t87pj4RTUtQm4vA9zEDTqkF9IT9mfWwd4bYESp0vmrPKSNk+Hs8Rmr1rSDFxIvLBsi
	hNSBJW2CToj3nczK6K0VykxBVBclgfTXGs5XReRYoSzthoX2o+5rj79J862ER/k5+z9mjK9NzzX0i
	MZ5np1Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKENO-00000004RZ7-25IA;
	Thu, 20 Jun 2024 09:46:42 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKENL-00000004RXq-3v9q
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jun 2024 09:46:41 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2e95a75a90eso6278021fa.2
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jun 2024 02:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718876798; x=1719481598; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1C8Ju8XWmp5T/a5fTSJkVEbGY+u2Y8Oaw2wvJKVqwcw=;
        b=k9HJB18pu8b2DNqWo1DxDXVWxhNO2IYZxKG77k3UQeNV4A+nurmGnhkurwkD/J00WQ
         1KK3vCnXhVkvlShMHhqjmnHCvy6O+LUMrsJ2/TveJO2jHh2RFYNbIcYrLUGZEsJP1id2
         vbS6fZrqS9nJ5BUK/mZyskTTH4bVnOHv3BezA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718876798; x=1719481598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1C8Ju8XWmp5T/a5fTSJkVEbGY+u2Y8Oaw2wvJKVqwcw=;
        b=YtcphN5PInrjTjUU7gQEq0h8FeCw4Z1H0CuUHRnKqXuOYvWrScOKcyR04GlIXKMbTm
         0rT41w+03v3Xt90tx3PNDmMyHd9ivWFdOlf2azqIbiqbcgKmTFm2RSLXKQgIr2Y4hBTG
         mlbY53MbnaSL3zJQJzrUedA+AmmFCMRttZnzoL5XGH1H2pKf9qeraymnZ4zgUnj9fWsT
         hTR3NcClebEnjGZEuQ345mKJFLf41F9EXgkwRagejwVeS3oUxXbzgLjl2xunL3R/lGP6
         /xsPxSIJNY9V5FVrM/z8B4wVrs3fwFpuGk1mHlg7ulhOZw/zTld9yoEgjGDgiGunBZRq
         C5bw==
X-Forwarded-Encrypted: i=1; AJvYcCXY0fJlXaOQ3u/kHx2s8VK8PQde1Z7yg/KiNpNAx+bXA+0v6vw4eocyShh26ZDusfmjA/0/2/ErpXRYAw/TnzP8iJwykDXa3au36p58G0ErF+hS
X-Gm-Message-State: AOJu0YyZxB5pkhrZVo5NcFVAYqeSJa/USkgBBFvJAOPGPQ5aKZkmS5X0
	ryx8KWWR/MEvA3e9X8JRQI8RK8Le9dya5gYAiaKfODqduYjDTDHoAnzsT+VMRWCIKL5Jq1748hV
	B0IBjUmogwo3Im9fnCOjiTSQdexVDsxuRvoKh
X-Google-Smtp-Source: AGHT+IEAch4d9DfYlt6svj7uQiDMS/kkFeiPt+x05ruz/JwQ3l7QJT/Zf3fr43/NzPnYxwZicSzj+aUa/F91bwpokys=
X-Received: by 2002:a2e:2281:0:b0:2ec:3f29:a0fe with SMTP id
 38308e7fff4ca-2ec3f29a240mr23325101fa.38.1718876797983; Thu, 20 Jun 2024
 02:46:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240529-mtk-thermal-mt818x-dtsi-v6-0-0c71478a9c37@baylibre.com>
 <20240529-mtk-thermal-mt818x-dtsi-v6-4-0c71478a9c37@baylibre.com>
 <75826085-fd59-466a-b1de-b4c323c801c1@collabora.com> <CAGXv+5FPG4ob3mTU0Utm8Wgk0_ZLw=NLPbfFerWh4OUeAz7UHw@mail.gmail.com>
 <808db317-4cee-426b-a840-013a5e03098d@baylibre.com> <ad047631-16b8-42ce-8a8d-1429e6af4517@collabora.com>
 <940eec49-91d8-4d38-a3d8-e1b7e090b905@baylibre.com>
In-Reply-To: <940eec49-91d8-4d38-a3d8-e1b7e090b905@baylibre.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 20 Jun 2024 17:46:26 +0800
Message-ID: <CAGXv+5HpRvsYz3ZJ_hNM=RhDHbnEZA73Xwm1YgjuWWPXhymT9w@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] arm64: dts: mediatek: mt8186: add default thermal zones
To: Julien Panis <jpanis@baylibre.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Nicolas Pitre <npitre@baylibre.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_024640_063752_4FDA2814 
X-CRM114-Status: GOOD (  36.71  )
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

Hi,

On Mon, Jun 3, 2024 at 3:58=E2=80=AFPM Julien Panis <jpanis@baylibre.com> w=
rote:
>
> On 5/29/24 14:06, AngeloGioacchino Del Regno wrote:
> > Il 29/05/24 11:12, Julien Panis ha scritto:
> >> On 5/29/24 10:33, Chen-Yu Tsai wrote:
> >>> On Wed, May 29, 2024 at 4:17=E2=80=AFPM AngeloGioacchino Del Regno
> >>> <angelogioacchino.delregno@collabora.com> wrote:
> >>>> Il 29/05/24 07:57, Julien Panis ha scritto:
> >>>>> From: Nicolas Pitre <npitre@baylibre.com>
> >>>>>
> >>>>> Inspired by the vendor kernel but adapted to the upstream thermal
> >>>>> driver version.
> >>>>>
> >>>>> Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
> >>>>> Signed-off-by: Julien Panis <jpanis@baylibre.com>
> >>>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@c=
ollabora.com>
> >>> I'm getting some crazy readings which would cause the machine to
> >>> immediately shutdown during boot. Anyone else see this? Or maybe
> >>> my device has bad calibration data?
> >>>
> >>> gpu_thermal-virtual-0
> >>> Adapter: Virtual device
> >>> temp1:       +229.7 C
> >>>
> >>> nna_thermal-virtual-0
> >>> Adapter: Virtual device
> >>> temp1:       +229.7 C
> >>>
> >>> cpu_big0_thermal-virtual-0
> >>> Adapter: Virtual device
> >>> temp1:         -7.2 C
> >>>
> >>> cpu_little2_thermal-virtual-0
> >>> Adapter: Virtual device
> >>> temp1:       +157.2 C
> >>>
> >>> cpu_little0_thermal-virtual-0
> >>> Adapter: Virtual device
> >>> temp1:       -277.1 C
> >>>
> >>> adsp_thermal-virtual-0
> >>> Adapter: Virtual device
> >>> temp1:       +229.7 C
> >>>
> >>> cpu_big1_thermal-virtual-0
> >>> Adapter: Virtual device
> >>> temp1:       +229.7 C
> >>>
> >>> cam_thermal-virtual-0
> >>> Adapter: Virtual device
> >>> temp1:        +45.4 C
> >>>
> >>> cpu_little1_thermal-virtual-0
> >>> Adapter: Virtual device
> >>> temp1:       -241.8 C
> >>
> >> It's likely that your device has bad calibration data indeed. We obser=
ved the same
> >> behavior on the mt8186 device we used (a Corsola) and finally realized=
 that the
> >> golden temperature was 0 (device not properly calibrated).
> >>
> >> To make a comparison, we run chromiumos v5.15 and dmesg output was:
> >> 'This sample is not calibrated, fake !!'
> >> Additional debugging revealed that the golden temp was actually 0. As =
a result,
> >> chromiumos v5.15 does not use the calibration data. It uses some defau=
lt values
> >> instead. That's why you can observe good temperatures with chromiumos =
v5.15
> >> even with a device that is not calibrated.
> >>
> >> This feature is not implemented in the driver upstream, so you need a =
device
> >> properly calibrated to get good temperatures with it. When we forced t=
his
> >> driver using the default values used by chromiumos v5.15 instead of re=
al calib
> >> data (temporarily, just for testing), the temperatures were good.
> >>
> >> Please make sure your device is properly calibrated: 0 < golden temp <=
 62.
> >>
> >
> > Wait wait wait wait.
> >
> > What's up with that calibration data stuff?
> >
> > If there's any device that cannot use the calibration data, we need a w=
ay to
> > recognize whether the provided data (read from efuse, of course) is val=
id,
> > otherwise we're creating an important regression here.
> >
> > "This device is unlucky" is not a good reason to have this kind of regr=
ession.
> >
> > Since - as far as I understand - downstream can recognize that, upstrea=
m should
> > do the same.
> > I'd be okay with refusing to even probe this driver on such devices for=
 the
> > moment being, as those are things that could be eventually handled on a=
 second
> > part series, even though I would prefer a kind of on-the-fly calibratio=
n or
> > anyway something that would still make the unlucky ones to actually hav=
e good
> > readings *right now*.
> >
> > Though, the fact that you assert that you observed this behavior on one=
 of your
> > devices and *still decided to send that upstream* is, in my opinion, un=
acceptable.
> >
> > Regards,
> > Angelo
>
> I've been trying to find some more information about the criteria
> "device calibrated VS device not calibrated" because there's a
> confusing comment in downstream code (the comment does not
> match what I observe on my device). I'll send a separate patch
> to add this feature over the next few days, when I get additional
> information from MTK about this criteria.

I couldn't wait and sent a patch to provide default calibration data,
based on the values and code from the ChromeOS kernels. It seems to
work OK-ish. I get 4x degrees C on my MT8186 device.

Also, your previous patch blocking invalid efuse data has landed. So
I think this series can be relanded. What do you think, Angelo?

ChenYu

