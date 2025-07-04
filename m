Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6BBC83030
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Jul 2025 03:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FDt34RbEYo0vqpY00U9ijTPtHhHk6iMis9c9F4GmtsA=; b=2jmpHIGfzovsJ9UP4Ddg2hcvrW
	bsLNLyjFZEyOdh+oy0KcnQL0sWCcDS/LeNQoYPqC0Q74lcn26PPkXO4cKW8PM25Ayt84lcR5MvrIQ
	zCbdsRQxkJu7I/+BP2m3l1eVgEfKhEHHsCb1VcGYMhWzHjqoCBpBEDiAHLlZ+PhukjXZab2p67Y4h
	w5VIWHV6zgHiZWzBAZmenANxy8qLziBmBMzANkGAnkvZrxm7U1SA25BZJtMroSq0t9CA1uNzAqO6g
	HUMBJTOSXaM0BZWh4FJy4lDU4mnmPORhzMKDPu7E7TyolaNa4uGhnyG1QcbRpWaeGwal8Kac5NxrT
	2RA2OHZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXXGy-0000000DAIm-31Qe;
	Fri, 04 Jul 2025 03:39:36 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXXGw-0000000DAHm-23gl
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Jul 2025 03:39:35 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-70f94fe1e40so18991997b3.1
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Jul 2025 20:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751600372; x=1752205172; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDt34RbEYo0vqpY00U9ijTPtHhHk6iMis9c9F4GmtsA=;
        b=Pb7Ti/CH/+5sJoQXJgCAMoyveqV9F7pfWVveWMERAn87N+UY3YpbWFbh6DaFRf8Y5P
         Dy8M/fUuXrA4fYBKmWHGaClTMne+f1bPfJfzbRhcIQRuRdZGZJ5uxv664yFEaxCVSQL7
         5R+z3kWWVz0217NrdAx5yXS5vssSe7jp1se2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751600372; x=1752205172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDt34RbEYo0vqpY00U9ijTPtHhHk6iMis9c9F4GmtsA=;
        b=FrWYMtf9iY1k1zgaUuIUDM6SnQIWkDQ1eiDEfLQFAZKr7befT19e0Jw/s8rNh3ukEy
         H6T4wH9D1tVwkj2fKKVAfwfvfd3HAV9iYFWIR1J9Fvm15H5lwPkr8/5nb5ipy4OGta14
         h9V4h4kwOfXGrcHMNPkL6e+kxBrlT1QJJW3VRKz7K4zHw5jmigvTNssHUjKinF/GjPoB
         2tsunC1hSoIJmb3ItCC3P1jgcgY+k3HHg6jwPvJH2G+d8Ix0uWm0MciGwGUL5iP45qT8
         n87OYwI4hBnyVJ+OACYsUfeXXsPBmsQxXkJvGly+MN5IMa0QCwWuDCzmR8QyTk3ywRKY
         WPjA==
X-Forwarded-Encrypted: i=1; AJvYcCUEuC7bPY5+uDUkwdPnsQeBCKsZyJJz9l/LvZfnyu6gVl1Qqe2S1kWov0pIsyaJt8kTu2afFjqPkvrqIbwrPA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdBsALVAS7dF3RDMspxtitMGDkd6ACH7MT2oWY6adVHEF8lfOk
	jypsj0IYXgpVIWHZesZvoxpBxCBHETIkcrFRJQsP/PXbIfELJdPzLy1crhfggb4+n1+s5CHbHlL
	rkUXhXvg5ez6n9NjqhMANGl4D9ssyolhMtQ40AM5v
X-Gm-Gg: ASbGncu/JwmPX6JO8CLzz3Dg0W0IogPVu/cSUHZmLLgCmYFZepm6+13nOUIuy1SgHcb
	BNCU3tR+rbh1AznOXb+u2LyXKl6oAYtoQ3bCz83JDNKh52Ufop1DWcCzTp+uJ3Mb6+Zo+ru/WD6
	5gAZaEAZlfq8wDsRYA6LjpNjUVcHX+uz6Sq3BEUwmmXa5x
X-Google-Smtp-Source: AGHT+IEpv4/ABsyEPWBaSbnhDaxcTMMoASH0qOMAb1EUBzfvoB9Rs9KL0TsrqeATirMWAbb6GqIiVFu78+U/gU30DoM=
X-Received: by 2002:a05:690c:46c5:b0:712:cc11:aff with SMTP id
 00721157ae682-716672d3d02mr24980587b3.11.1751600372350; Thu, 03 Jul 2025
 20:39:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250703183523.2075276-1-robh@kernel.org> <aGdAmGGPDA71rDE3@google.com>
In-Reply-To: <aGdAmGGPDA71rDE3@google.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Fri, 4 Jul 2025 11:39:05 +0800
X-Gm-Features: Ac12FXx1clDJs40GrPtAnmhl7h9XO9sxxgXTs_ThD6wPGcXtPD9F4XTO-6ZiN-s
Message-ID: <CAFv8NwJcwD0wqJAoe99M+dQYA383n0g9U+5+Z77uuQ2d=Ac5pA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: Use of_reserved_mem_region_to_resource() for "memory-region"
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Benson Leung <bleung@chromium.org>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, chrome-platform@lists.linux.dev, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sound-open-firmware@alsa-project.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_203934_553688_3C1B86CC 
X-CRM114-Status: UNSURE (   9.13  )
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

On Fri, Jul 4, 2025 at 10:46=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Thu, Jul 03, 2025 at 01:35:21PM -0500, Rob Herring (Arm) wrote:
> > Use the newly added of_reserved_mem_region_to_resource() function to
> > handle "memory-region" properties.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

Thanks for the patch!

Reviewed-by: Cheng-Yi Chiang <cychiang@chromium.org>

