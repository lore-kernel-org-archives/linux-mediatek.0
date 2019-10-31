Return-Path: <SRS0=DTTl=YY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E805CA9EC7
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Oct 2019 00:50:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D799F20873
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Oct 2019 00:50:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hOrIAAh5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iSsXAz2h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D799F20873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3cHdExFoApn8EG3Pu08FBY23qbetgZqw5DRHrfFmEcA=; b=hOrIAAh5QBYt9o
	1oPzKOwB3CI69Sseh9bs8tZbISMlw0wYtue0SFH7SIXvrlRnnxcqHI9fimNW8qFbhwQV/af7XRAnc
	TxDMo5QJokrcJ73lIfyKzoQYoAFIiJLqPo6neF1+D8l6qOmCO24BmZoLjY9z6tDLdkSciFO1TrdMR
	itHL9W7M7c51p8GQTCG2gXf9n1+8DlXTQ/WTPTcdnw46aWz5e2xAuVj3IP2dswBedMoVl7rmljW9h
	abyI4XHMzv+XZRNy2u4Lq168K4ZDB9RWDB1PGS6wG9dzBuHWHMvrjM4wjClLZKfzOdprbbO8cClDY
	F7EyAqmsNuDTS3oW5IPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPyfH-0006lG-VR; Thu, 31 Oct 2019 00:50:15 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPyf2-0005QB-H2
 for linux-mediatek@lists.infradead.org; Thu, 31 Oct 2019 00:50:03 +0000
Received: by mail-lj1-x244.google.com with SMTP id u22so4749295lji.7
 for <linux-mediatek@lists.infradead.org>; Wed, 30 Oct 2019 17:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2ANRS5wbwl/qhMyqDjpLwYIen+6o/RnmGm7reuX+RDc=;
 b=iSsXAz2h6lI4/+bDAgo3ame/BZgVRj1aE4CRhVp1rkjDm5vlU5S7NBZHxBEgHg/wEo
 LHjrlUjzfObyMjWplPS4iUm9RjAgF5qeticJqVKdiQIoBq9hkhZrryXIwlO/lC3rF9zI
 RUGDn7MhN1RZ4aziEd7tokbiKmLKGtqN1oh1/Bkjo66ARSTwDEhXLfli2ZXzr+qUE27g
 ego3mqJPqzkvZTa4lU2SYZa52RhXEJMi+KQRYiuHajDJTdUR2yAdoa+b3h4qMUN8tIfP
 QZ6T99SeDihkZKnIxQBn1vOcNEJvsNSn6so+SKVs83W44KBmKnvrJIpsFergM970YDYy
 jX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2ANRS5wbwl/qhMyqDjpLwYIen+6o/RnmGm7reuX+RDc=;
 b=e8RGKpX8Wti7FZBUWCsvl0Fbzeijn9+6cCj4wlhxPzYsZndL5jV1YJlZd3mARGohaP
 PrmNaSxp44dayIq5iGLfLwP9zH760057UbL158GgbEyyJA0xSY2YCHr6dxbN52mWgnF9
 BkuBRyu+nl/iDeNg801kN0c30eIgrFIZNu/FCDJQmWgmcs4ns0hcDob1zU76UvBY5lEg
 NAnRTwPukR037imoetbdpSj3Lb044Khtr/ws8kc2xWJS+6Juf0p33DPnGtV6T2aM13uv
 HIyzv1ypJWJiVC+wfxGfMTbCvSi0VY+CUEMZ8Ps9Ur02FReAKclAxVhqLzPSIOoEjRBG
 8+GA==
X-Gm-Message-State: APjAAAW5SWgcnxRwhOCd37Ln1uIPfcgYvd1tuvJWDmif7ipqURikfp2h
 hjvu78sjjLd2/fESbc3c9gORCGV45FA3nmfU9vMAkQ==
X-Google-Smtp-Source: APXvYqwM7PCCU+3fgkz+ysEB76Izdi4UnxQslU0hMR9roPFMeD2kCgFi2OfvADVGoZLpFkAT3ZECdzLcVTd/EaP9GRk=
X-Received: by 2002:a2e:90b:: with SMTP id 11mr1671387ljj.233.1572482995258;
 Wed, 30 Oct 2019 17:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <20191028224909.1069-1-rentao.bupt@gmail.com>
In-Reply-To: <20191028224909.1069-1-rentao.bupt@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 31 Oct 2019 01:49:43 +0100
Message-ID: <CACRpkdbOPq4AYt9CLoganV_Ck9bYS9+_U3bggGKAukaQ=FHXkA@mail.gmail.com>
Subject: Re: [PATCH] ARM: ASPEED: update default ARCH_NR_GPIO for ARCH_ASPEED
To: rentao.bupt@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191030_175000_628914_1464A763 
X-CRM114-Status: UNSURE (   9.05  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Arnd Bergmann <arnd@arndb.de>, Paul Burton <paulburton@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Joel Stanley <joel@jms.id.au>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, Tao Ren <taoren@fb.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Doug Anderson <armlinux@m.disordat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Oct 28, 2019 at 11:49 PM <rentao.bupt@gmail.com> wrote:

> From: Tao Ren <rentao.bupt@gmail.com>
>
> Increase the max number of GPIOs from default 512 to 1024 for ASPEED
> platforms, because Facebook Yamp (AST2500) BMC platform has total 594
> GPIO pins (232 provided by ASPEED SoC, and 362 by I/O Expanders).
>
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Please send this patch to the ARM SoC and SoC maintainers:
arm@kernel.org
soc@kernel.org

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
