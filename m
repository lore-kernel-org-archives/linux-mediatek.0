Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1BAC9EC97
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jan 2026 15:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g3qVMOf4h7r5oPNNYlK3bIOu73r1qNBGBIVfGAnDN44=; b=3928m8OPvXCqOpDX/C/o/J2GhA
	ExF7pMNQDeKAh6PEuwACristL+I4XAlgUouKA4rrinOLXYEVkntsPg1eXB51i7kP119vl1YSof5RP
	B5euEepxxcqqWx0f+d1MRU/d3Ng7sT1SVr300RWLx8VGShw5dmByM9vPPwWpGj3bv64etmVJnEkMP
	vC/s6GS9ao3rC3dWq3y2X+KtP7L0b0Km1S0RNi8wBw8KtfqGvZ9TCp+P3440voyVznIjd209guiyO
	nrZuSAHql9hahm6quIPaxaGKOIgN+q1LS8+uZXg2RskxhbuI4SdMw0YPG8pn7Mwe2ysTH0Ay16pHh
	rfFu8Eeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKAL-00000005fCL-47ON;
	Mon, 12 Jan 2026 15:49:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKAL-00000005fBu-0cG9
	for linux-mediatek@lists.infradead.org;
	Mon, 12 Jan 2026 15:49:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 967696001D
	for <linux-mediatek@lists.infradead.org>; Mon, 12 Jan 2026 15:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B93DC2BC87
	for <linux-mediatek@lists.infradead.org>; Mon, 12 Jan 2026 15:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768232952;
	bh=g3qVMOf4h7r5oPNNYlK3bIOu73r1qNBGBIVfGAnDN44=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DundEaS1NAS3+LPc/kxdJ2yGGomCc9xbKC9k1YG6fs0A1ILvlzTAtzITL4qvI3l7f
	 p9JgbJHFAiC26fKfk22rPFMWLzp9CQxUPcJZIBpXL7U4pvINJfJX/NHfcOsaf9yX6T
	 y1Un4vS/kayDeU4qkHi2UwVzBuNtTfOaFmilKeHzR7DY0ihKWyt3hwY8VZwrq2wW5o
	 GA+VJ1nDezZ9AoHIP8+sdbfpsgSYX4asdKCLOXj7F0WfKpESQGJ6nslcTlu63g7mko
	 bUa7JW1pwUW74dbDbb6TJErhuDbrjFrex4rdk38C8JNZmDbNarsi0ruW4erNk0EU3t
	 0wgDmSevaugEQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59b6c89d302so5398044e87.1
        for <linux-mediatek@lists.infradead.org>; Mon, 12 Jan 2026 07:49:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWs2XKJrQR6nj1kx16RpvEru/9QIEgMhkOQBWvfdeqx4ncW4GV3JTfzdoTrdm+Or7GF6SOnbBFY0Ea7vVtS6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5Gfjkn9oDvsthPGwUI5P1KS+MAdcYFE7/oliNd7A7mO/zcYZP
	kXxN8FjUMAOJokRQKcT79ZD1LVQabzVwtfyI9SrUBIydkO8c/ClOf41h2ieXio9tzqQhEfKO1UC
	VvI6Rk/OcckMlFXcw5kYWOPaAJregajE=
X-Google-Smtp-Source: AGHT+IGrmhpZ8nXRdgojkHsyjUv61lqeNWnDH4LALSgozKK/V99agmF5Af5tLfoDGn/rKgr4N6cPGy0VL/XBPqOTq/E=
X-Received: by 2002:a05:6512:2312:b0:59b:67b9:3989 with SMTP id
 2adb3069b0e04-59b6f01c67emr6662469e87.16.1768232950905; Mon, 12 Jan 2026
 07:49:10 -0800 (PST)
MIME-Version: 1.0
References: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com> <20260112134900.4142954-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260112134900.4142954-2-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 12 Jan 2026 16:48:58 +0100
X-Gmail-Original-Message-ID: <CAD++jLkQo_1HM2=FM8uw5FLdGo_dyNi7mq55O+Ea62am8nk-uw@mail.gmail.com>
X-Gm-Features: AZwV_QiRK9ToY_JI65YTXBjF0MrmuQc7bAxxJwuy2RaXI4VD3YSpEG_xcWGIoX0
Message-ID: <CAD++jLkQo_1HM2=FM8uw5FLdGo_dyNi7mq55O+Ea62am8nk-uw@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] units: Add HZ_PER_GHZ
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andi Shyti <andi@smida.it>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Qii Wang <qii.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Heiko Stuebner <heiko@sntech.de>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Jan 12, 2026 at 2:49=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The is going to be a new user of the HZ_PER_GHZ definition besides
> possibly existing ones. Add that one to the header.
>
> While at it, split Hz and kHz groups of the multipliers for better
> maintenance and readability.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This looks right to me:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

