Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49408C19F2B
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 09:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yj4LnoCipKdQooHDqQkSzfPq9k+SbXM64sol04d/ofU=; b=p+xH+QfTfTTUDmXDOdEXpv0xOX
	lTV8Ls+lRNktDdRqUCy4kH2ZNj9bhZhvyc7Kr8cG7dg273dHWbBeDxEcbjovP28dLx3/3gjzW6s6y
	AxYdp+bxZ2tNZN2O0SxZy+5xcAdBRkGLNgcd85lWUYJSnQF2LIVCu17ItDTjrhSftGYGMPOdqeiSb
	RgzLWgkp5EskoYYuLoQHKVc13fXwVBTCtJyV/vrxf4oxHbpHfkGzrJjVCyPmK9EIiibiJkVXCu4Y8
	IFOFjarZPIipMsU0DXO5sZVx2LB+EbuYsacT0sd+fWzEm1J9O3+Dv9SJP6DzEGyM5KCizLCFI6JQv
	e0Yxmygg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJXY5-0050Mi-C1; Thu, 04 Aug 2022 09:53:49 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJXXs-0050H9-PR; Thu, 04 Aug 2022 09:53:37 +0000
Received: by mail-pf1-x42f.google.com with SMTP id u133so12232472pfc.10;
        Thu, 04 Aug 2022 02:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=Yj4LnoCipKdQooHDqQkSzfPq9k+SbXM64sol04d/ofU=;
        b=qVUuazv80uczwDUpa1W45XFLKQkv6E85jaluDS0qPCqx5UqLWXVRj7NNS3iB1u5yMk
         BpAyrdAWbjN4xan/ozEhpBngVBm4vusnJrSXS6B5BtALu4Q7w0WkatMFosToCwAp0pxw
         peyWEmojG15dUtIHplxLrARzYTKP87+hpzEs+qJ1Skx6IUC8ArRBWfpqh5foE/L0KuT3
         5dl0vT47WvE/YFBfLMbib+8Ia4pPLthO02aty10gTq/7cMx0IUzGT+JIGnvuHvmlqhSG
         +z4BOs0ydQYyC+O9uk363r+pOvEqCbU9PsjpybnRv4n2q2RjbjTJIV3fBXw17xudaCYj
         TyKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=Yj4LnoCipKdQooHDqQkSzfPq9k+SbXM64sol04d/ofU=;
        b=XaUfBx8yZfr/1fS5z7+44ReJE+wh4OqqZFDzWzmD4UNY49vl3Ui6UIvDg2bqoFLgcX
         aPHn8ZubQi0Iu+fJ0QEnpfDyIGKNEQaCbjMaZz0O+W5PtOVbJux27cLrqogP22s4fPCu
         krh0vxINm+aYe3j3yzxG174iuFgfbI7feBbjPJlWYkmxzxJPjlnuCk3AxQkn/w1bqxtD
         N2pxH79psp2A4O4jp8+Gc46vuuWQNyymTKMBoJSyMs8UcLWsSyhB8vpWaQabk67TzYhM
         1lLWfiuJhhPaWkoSUYTiymKY/n87bdOZcFP3qLg4uC5WXiabC7qjpJVIlPgDhVgBjs3x
         n/Jg==
X-Gm-Message-State: ACgBeo2339PynMXa3ewy7TMuWCgYlvwi4HiLkYeoynnwl7Epn9AxuO9m
	7U4ejwrjWL/h4jX/WeGFbTi2wvfJM5gkjm8llu8=
X-Google-Smtp-Source: AA6agR6qwy7xIi0BGj0KdaE31bzJZvJiNHMC9+UQ+P/hml7eIyhBore8DXxCh12e0tZqDO9pfcvT3sY1+E56wep5ub0=
X-Received: by 2002:a65:694f:0:b0:41c:cc1f:4440 with SMTP id
 w15-20020a65694f000000b0041ccc1f4440mr1024346pgq.318.1659606814308; Thu, 04
 Aug 2022 02:53:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com> <20220722102407.2205-13-peterwu.pub@gmail.com>
 <20220730214205.GK23307@duo.ucw.cz>
In-Reply-To: <20220730214205.GK23307@duo.ucw.cz>
From: Alice Chen <szunichen@gmail.com>
Date: Thu, 4 Aug 2022 17:53:22 +0800
Message-ID: <CA+hk2fbEvU2yJbowqKoozb2M0aQc9TFCaxAn++YrmEx+eWt_4w@mail.gmail.com>
Subject: Re: [PATCH v6 12/13] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
To: Pavel Machek <pavel@ucw.cz>
Cc: ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org, daniel.thompson@linaro.org, 
	jingoohan1@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com, 
	gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de, 
	lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net, 
	heikki.krogerus@linux.intel.com, deller@gmx.de, andy.shevchenko@gmail.com, 
	chiaen_wu@richtek.com, alice_chen@richtek.com, cy_huang@richtek.com, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_025336_842617_F0A1D0E2 
X-CRM114-Status: GOOD (  10.44  )
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

Pavel Machek <pavel@ucw.cz> =E6=96=BC 2022=E5=B9=B47=E6=9C=8831=E6=97=A5 =
=E9=80=B1=E6=97=A5 =E6=B8=85=E6=99=A85:42=E5=AF=AB=E9=81=93=EF=BC=9A

> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2022 Richtek Technology Corp.
> > + *
> > + * Author: Alice Chen <alice_chen@richtek.com
>
> Add ">" at end of line.
>
> The series is quite big, would it be possible to submit LED changes
> in separate series?
>
Hi Pavel,

Our mfd dt-bindings depends on flash and LED dt-bindings,
but our flash and LED config depend on mfd config.
For the dependency consideration,
we think submitting them in a patch series is better.

Best Regards,
Alice

