Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA0CC77B61
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 07:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uGl5U27dIAVcoPRAhAw7M++MtUvlNkzHHP3i/+uz8BM=; b=f0Fc3lfFnVEz9N0F1aLG3jLVNT
	WYdOEGX1jHkn3I16Qiz8xQNQi5bV1PE8UsAkp+LufrhLkIvx1SoTE0CQtxXrH/QNGAQzWa05jtpxp
	zZ9LPY3fMGFxi8lGtJaRKivFtl1wgXP7jKGviVnwp8a+fztl1ObTZm7mqTbIdfVSjjXjnFMWqDwVq
	Xnu9HEsGShRmWdiHupchq8y2nUsW55lsAdrtpS5ezjDthkxtABvS2cUjKkAFB9savH9XyUCGYCMY8
	o9vIbzFsEVpzm0tmh4dm+zg56MqQePYOco873hBo68XDIMftA7IwGERA38bfmXlygmc5miakxGd/e
	+svFC+Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prD5x-000NuV-1t;
	Tue, 25 Apr 2023 07:28:13 +0000
Received: from mail-yw1-f180.google.com ([209.85.128.180])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prD5s-000NtF-2a;
	Tue, 25 Apr 2023 07:28:10 +0000
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-54fe2e39156so63556147b3.2;
        Tue, 25 Apr 2023 00:28:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682407686; x=1684999686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uGl5U27dIAVcoPRAhAw7M++MtUvlNkzHHP3i/+uz8BM=;
        b=A2pNvavAaAs0DI43TmdCe3LwOC4nDXrDBQpKoByDTxgjj60d+iq5mnSjsdSrZ68mc3
         E6Zruq1+YSB5C1sB54g6kyOPiwI+O/Way3r8aLERt+hqYFNiAPUqJQkiN0Dfim05O6J+
         rNv72UtX3HgWL4hsiko7TiUJmjJRNCUgImQJ9CRaNnO7qqNk9d2OcMhH49jj35SHkTC3
         R/3dsGvP/4SSThdUY1VIywYeWCuD9wa0we5UrXjJr72QNyrsXMbqk0DrAcc/v1auPL0l
         PYn/uVq1nW7GPK+tS6ygZUBo9BUel++uyLH0FruL0rrjo3prz2APJdopFgDe1w0NqSvt
         70fA==
X-Gm-Message-State: AAQBX9caQgx8ylscaTt4rbznVpIgShrHp2YCCrj8pyqETuVi0AmNXDui
	l2wAS+NRzV37/Yb030bCDXVJb8ER79Yqhg==
X-Google-Smtp-Source: AKy350ah2fN0BlaUn6+C+7CsBHSa8QxQelNPG1/gwY8+RCMXQFFGWpGuTCoke3uBIuyJhcHFvD1f/Q==
X-Received: by 2002:a0d:ea48:0:b0:54f:8d75:372c with SMTP id t69-20020a0dea48000000b0054f8d75372cmr9269724ywe.33.1682407685771;
        Tue, 25 Apr 2023 00:28:05 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id t142-20020a0dea94000000b0054fa99bed5asm3402293ywe.129.2023.04.25.00.28.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 00:28:04 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-54fe2e39156so63555737b3.2;
        Tue, 25 Apr 2023 00:28:04 -0700 (PDT)
X-Received: by 2002:a81:4e4a:0:b0:54c:9c2:d1be with SMTP id
 c71-20020a814e4a000000b0054c09c2d1bemr10102189ywb.13.1682407684508; Tue, 25
 Apr 2023 00:28:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com> <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain> <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
In-Reply-To: <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Apr 2023 09:27:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
Message-ID: <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
To: Rob Herring <robh+dt@kernel.org>
Cc: Ansuel Smith <ansuelsmth@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-actions@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@axis.com, linux-aspeed@lists.ozlabs.org, 
	linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-tegra@vger.kernel.org, linux-oxnas@groups.io, 
	linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-realtek-soc@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_002808_838541_55C00FCE 
X-CRM114-Status: GOOD (  18.12  )
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

Hi Rob,

On Tue, Apr 25, 2023 at 12:16=E2=80=AFAM Rob Herring <robh+dt@kernel.org> w=
rote:
> I have a script[1] that does the conversion written the last time this
> came up. Just have to agree on directory names. I think the easiest
> would be for Arnd/Olof to run it at the end of a merge window before
> rc1.

"emev2" and "sh7" are missing for renesas.

Does your script also cater for .dts files not matching any pattern,
but including a .dtsi file that does match a pattern?

> I'm very much in favor of this happening especially before *any*
> overlays are added to add to the mess (it's probably already
> happened).

;-)

> [1] https://lore.kernel.org/all/20181204183649.GA5716@bogus/

Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

