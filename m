Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D092FC001DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 06:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=79kLUvgjaFzQrWOgx008zsF/7GOXg8shTx0H5AGYDQw=; b=127VS4WypUp+e78LvkdW5Ck0z/
	hOXoeWUbkpZfeA1giu8gzXBvgT74F5BWh9pMAnTT8nf7jlYjuW8oralJQ1xhd4592sAupHiBaJyir
	MpiLQZ2cxON/P/YNPe7mwdKnaEz0xxnkjxgFr+TyofvTaDzpCFjMKqNvCmR3VAVUiRlJaOMa7Ek3D
	NilQV2RF/a5TlG+52UTxl/DKFbcjtIXcBGU/oygQL24vfQdxNj8YS/FHovRhHiKlZqe9p8/jd14LY
	2u6PsFMQUHz/YIp9YxcKqCFlK9eV279zC2RlyTj8wuc8grf+6dhtfw5fenzC6qzBS1OuCMzGptgKY
	ju5rmnMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0R6-005baQ-28;
	Wed, 19 Jul 2023 06:13:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0R4-005bXq-1P;
	Wed, 19 Jul 2023 06:13:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=79kLUvgjaFzQrWOgx008zsF/7GOXg8shTx0H5AGYDQw=; b=Nw2JVBouDQJ1zqHx14zjPDabO/
	ejfXZsrJQOYFzxnS74Evn160klTMEP8P4FE+QeyQPk0oWr6Y0Vx6nZ5UBDlUT3LH/bh++ZqG9n8Af
	Wija7DxvoD3K895AM3U0E1I1GMTAD2RElggSZy3RzTR3Wmlt6dsZdYBmHNz+Vut1XB/inmbL1aqSP
	KVK8Y6kNTEVzyy0ll4xgnvPZ9GPjDHhxjw30EhEP9KLdIs3cLv2eGXobhfxIYpurGIGMxpZQmkSsH
	TCpU0eu4Jf2XaRpbL2yhh9PdXQUh9RW23KdC1/tfpXQf+PAPNhH96tM9QBC2hLx5xqW3RRm1FHbB0
	GYXUvzuQ==;
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLkEE-00BWkW-0X;
	Tue, 18 Jul 2023 12:54:59 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9936b3d0286so802452266b.0;
        Tue, 18 Jul 2023 05:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689684826; x=1692276826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79kLUvgjaFzQrWOgx008zsF/7GOXg8shTx0H5AGYDQw=;
        b=Tks5q0JcRPcKf7Kf/5sMNv0WyprOQ5QOCm+wFinM49VOX0OPVPh+czO3QBSvYJlbZs
         99Dqxi9UZ0XzbWLIpQssTKSRP/ibR01+OZ6gPO8G735PMobOMqBZMJ7ItLKFDJGq4mVE
         L6Gp/kXJT7E60Vbz13h+JeVrhe9nq31SBP6WJDXk2r0HxYjdmtAFAR1q+X0fPT1ysJ1n
         U0CKU/xFTsOavOkaJci2k1okA1j1f+aPXviX7pPeDadhzYYPlWWG65eFqNiNGRDyv3yU
         WK2LkwXO09tPOZ/uycvS/9DAn9g1M57tOccnl5zRlWN8fD6udXDPzl//1L/4NA4OHolo
         Lb2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689684826; x=1692276826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79kLUvgjaFzQrWOgx008zsF/7GOXg8shTx0H5AGYDQw=;
        b=AeNgijiABnG01qkdzUxACVHjj/+lhYppYPSl33ilk+ibEDUK+H2UwvCkIWt4zS/2pC
         f6Uls8cwMawGXlyIg/KC5HxqQgTzDwe3IJP2EkGgE3OVVE3ncpHtG4a7HPgogbkrdEpW
         x+PPgdvd6FQN9zAlGluE/3UIKF7HUv1D8mIreM5CcBNbTminA7JKQHA9RclSVi0kMpwd
         TG4upTM2H7g9S6YCcr+V8Lm9FiMN6NYIQbkUZgI6m4f4WtAzAF5HraioR70IFFUxRTI3
         Wng0OAHf6L7l1KiJwtt3fmFDbD4itGgpkxzR3hzrOQy5nGJRaU0v7Ja6iMuBXcOXBY0C
         gFtw==
X-Gm-Message-State: ABy/qLZUOdbKfdX2P58B5+F+jOZ2+OeyfmCxPnYB4+oPjtNw4OrkY0Uo
	6z2RcmhgYa24Mz6PjHCPICHOiijC2dJANos3n5U=
X-Google-Smtp-Source: APBJJlEiNMwdGUgpHIKMmnEgRY+QNSS28oQH2q/Czd9HAANojvR1sxg1GKNIsNiHyHioOrvxRuwFkor+DKPaLczWNdQ=
X-Received: by 2002:a17:906:109:b0:967:e015:f542 with SMTP id
 9-20020a170906010900b00967e015f542mr12775335eje.44.1689684826263; Tue, 18 Jul
 2023 05:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
 <20230717172821.62827-11-andriy.shevchenko@linux.intel.com>
 <13f7153786cfcdc3c6185a3a674686f7fbf480dc.camel@crapouillou.net>
 <ZLZDL27zzDpY4q8E@orome> <5e4b5bc23f3edb3ed30cb465420a51ffceceb53d.camel@crapouillou.net>
In-Reply-To: <5e4b5bc23f3edb3ed30cb465420a51ffceceb53d.camel@crapouillou.net>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 18 Jul 2023 15:53:10 +0300
Message-ID: <CAHp75Vf3mijhiS6JNhD4Dq4EpbKmok5m8MYNaguUgpUBak9hTA@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] pinctrl: tegra: Switch to use
 DEFINE_NOIRQ_DEV_PM_OPS() helper
To: Paul Cercueil <paul@crapouillou.net>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Balsam CHIHI <bchihi@baylibre.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-pm@vger.kernel.org, Andy Shevchenko <andy@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_135458_292731_0323816F 
X-CRM114-Status: UNSURE (   8.06  )
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

On Tue, Jul 18, 2023 at 11:43=E2=80=AFAM Paul Cercueil <paul@crapouillou.ne=
t> wrote:
> Le mardi 18 juillet 2023 =C3=A0 09:45 +0200, Thierry Reding a =C3=A9crit =
:

...

> (or better, the namespaced version)

I am all for consistency, I agree on this whenever the driver is
_already_ using namespaces. Having one macro with namespace and
disrupting tons of the drivers (MediaTek case?) is not an option in my
opinion.

--=20
With Best Regards,
Andy Shevchenko

