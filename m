Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C0AD4979B
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2024 03:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9bTlnjRzF2JRQH5FoLyAwJy6PscFmIMIE7nVuxtFSPk=; b=0wpMD2Bmb/2eYBfAdY+LWlSDyO
	U33TqMEn/aRXU6UzV86kOKG95fgoitHWCnjOWFgrldhjVzjGWOCUIWxe6xIX7t1fEvM0dqYrUSvqj
	x1dwyoYLYBenSD7MHW0rv4J7SJ2A2Woor09uqy8//G2XKeUAjoH4Iz+JucKHsDD3mmxAc3B/sXfXs
	h6VHUfoG/7No6y5oRFh6Q0b4HgxvEurRiNY5yJtXAgTq6xvtCIjJr4e8LhVVChY0bo1n0C5swNS3w
	3laSAnXobTDtvraN0oHIh8WeOp/b/L7g06oyArWLwvBL3PjOfXG6hLlD8ml8VlNw6L/b+ZbpXrCvz
	gJrEMRUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHxJb-00000004ymJ-0qh6;
	Mon, 02 Dec 2024 03:41:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHxJa-00000004ym7-0I0r
	for linux-mediatek@bombadil.infradead.org;
	Mon, 02 Dec 2024 03:41:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9bTlnjRzF2JRQH5FoLyAwJy6PscFmIMIE7nVuxtFSPk=; b=SUpHT6nbBx9W3RzGkMBaC4pgLB
	iCd0Xm/aBAo0WypgOF/hQnuM7ECu/QWRGQ0gqf2VFZUWbkypcXibDaanQRMID7b2CCfc/gItBFUl0
	LkW0dU6NJmFaIW2oKE1xugoR+0eQLLUgUULA96QqVxlpAQOQfBxu/8y7nlAsI+H3XKx9xcm0Wt5Vm
	QTT/6q5JCP0gJiPbsfy7cCAWFwwkioLInS2aToHOMk11iILyEMUBbV27ZY5s0VoBmYlYbFNdK/5T3
	BWFk/F4UuEuAJsU09eYOWA3KeqBMl2rAeBy08TNiogHtXWUVRuhnoABUDFvy+veDxLd3dWX7qvHle
	PWRG+9Rw==;
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHxJW-0000000272f-36Fm
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Dec 2024 03:41:36 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-53de6b7da14so3760266e87.0
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Dec 2024 19:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733110891; x=1733715691; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bTlnjRzF2JRQH5FoLyAwJy6PscFmIMIE7nVuxtFSPk=;
        b=ThyDklY2pmEo5BZTZBtd0zi4MvPBfqngm9m0DfOPZ9UOc5N9cp8S0LtSBq61UBepJR
         +WUcdufo0Ehuz3U5UpC7vUyOdaGqNtoq7emGul5tI59PzjueMgDhD7+yKzo05lZrs4ty
         xHDv+LlWRPbbwpNcxeA1HIGHJbEReNWbqNsNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733110891; x=1733715691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9bTlnjRzF2JRQH5FoLyAwJy6PscFmIMIE7nVuxtFSPk=;
        b=VmqLB1r+qOsu1ZQCq66EzfDlaWXtmZnDhhzfB8/Z9pnQCvGuX/BjveogTaqRjlS1fl
         14Jza144+xm+4xEXgzN/lFHOTAzJhbEmvuy5x/D0Talxqgj3/7vBXNHBNGOvycKnn/WT
         Irnn3Wca/5lspywl9n2v9da10m3+XFRwXsT6jZEXsyM0VqAwUbgNtcWJNuQ+ISyFVDu0
         g+gkcQPxT6YPKEB6uoZh/YtgSio6fEWjCW/dZf5wMP8N46ZPHd6vXEcw6gm044x934kn
         wLoozSKU1oXDv6zBIkLY8Zj/6cBBRSgnPLN6bUDzu7vTPvLgq9+A+KgJqAh3U3L8Gr98
         BlzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpgddIvDIpjpKasCvA6/w91Q2i/Yyd65PSSHlGSFJ5BtY42TFU9U50X6V8bGjqRXvAHsQUWaGwkWhkw7RwzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7J5KADRtxyXiNq61Sd2JyxHMhchdSExi3DcSk5h3VUu2x1MWd
	Ou5RB8iAhdI5PCnzv1fJD94CnaWMWiDUJXH7uz3p77NRVpX/89RkVZn+WULWcoAg8WBMgaQkQCj
	IBQtj1ppGI/TidaAtgICUgg4WaAGn1BXbo3zicwlRNU6bfJA=
X-Gm-Gg: ASbGncsE9QwKirgo0bOuGiibO3WzlAF/ci0IRpBaW7z4mbPbFa07Lxzz+Bln2RAUbCz
	N6oWCYQHmCDOGCzW+glGSaA+HxGG9WVkoK5rrN6vcd5YDlvR/tiUXRmvyuk0=
X-Google-Smtp-Source: AGHT+IFBGoFOaRz+qRuU+qOg6hWpwu/Z+nHG5cJ1fZ9YkpTnT8oQX9A4GdCR+xRN4nrprMU5eqtqFpCUbyCnVLzassA=
X-Received: by 2002:a05:6512:2356:b0:53d:ab10:c273 with SMTP id
 2adb3069b0e04-53df0104928mr6377365e87.40.1733110891515; Sun, 01 Dec 2024
 19:41:31 -0800 (PST)
MIME-Version: 1.0
References: <20241112052211.3087348-1-nico@fluxnic.net> <20d3a0be-ba5f-439f-80ff-2e2bda3bb144@linaro.org>
In-Reply-To: <20d3a0be-ba5f-439f-80ff-2e2bda3bb144@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 2 Dec 2024 11:41:20 +0800
Message-ID: <CAGXv+5H0ocBWxGseoRXWyBo48+5-F-FRLZZcywcM-_vwu4=jVg@mail.gmail.com>
Subject: Re: [PATCH 0/5] thermal: multi-sensor aggregation support
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Nicolas Pitre <nico@fluxnic.net>, "Rafael J . Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nicolas Pitre <npitre@baylibre.com>, 
	Alexandre Bailon <abailon@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_034134_982318_71F28CCE 
X-CRM114-Status: GOOD (  16.04  )
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

On Sat, Nov 30, 2024 at 4:00=E2=80=AFAM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> On 12/11/2024 06:19, Nicolas Pitre wrote:
> > This series provides support for thermal aggregation of multiple sensor=
s.
> > The "one sensor per zone" model is preserved for all its advantages.
> > Aggregation is performed via the creation of a special zone whose purpo=
se
> > consists in aggregating its associated primary zones using a weighted
> > average.
> >
> > Motivation for this work stems from use cases where multiple sensors ar=
e
> > contained within the same performance domain. In such case it is prefer=
able
> > to apply thermal mitigation while considering all such sensors as a who=
le.
>
> Do we have a real use case where we can compare the per sensor vs
> aggregated sensors approach ?

The MediaTek platforms have one sensor per CPU core, but the cores are
grouped into two clusters, and DVFS is tied together for all the cores
in each cluster, as is commonly seen on ARM systems.

Furthermore, there is a hardware block that does minute OPP voltage
tweaking based on thermal readings, and AFAIK that block wants the
per-cluster aggregate temperature.

ChenYu

> > Previous incarnation by Alexandre Bailon can be found here:
> > https://patchwork.kernel.org/project/linux-pm/cover/20240613132410.1616=
63-1-abailon@baylibre.com/
> >
> > diffstat:
> >   .../bindings/thermal/thermal-zones.yaml       |   5 +-
> >   arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 210 +-----
> >   drivers/thermal/Kconfig                       |  27 +
> >   drivers/thermal/thermal_core.c                | 643 +++++++++++++++++=
+
> >   drivers/thermal/thermal_core.h                |  14 +
> >   drivers/thermal/thermal_of.c                  |  86 ++-
> >   6 files changed, 780 insertions(+), 205 deletions(-)
>
>
> --
> <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for AR=
M SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
>

