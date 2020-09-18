Return-Path: <SRS0=3MyJ=C3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81138C43463
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 20:26:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C134C208C3
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 20:26:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lemY8+zJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="aHphpi0l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C134C208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A8beTWi5cN9t/2kfOFtvC4F6nbTRwxoGQK4rXd+8mHQ=; b=lemY8+zJCieuxFrrpgXk11Drr
	VR5bqd98l0hxfr0X9Sz7+eG93Ktqz9cEgxKp9DW5HJ2o90vtOsFEdkcQBtUAb6CaAvUmwp5H5KTtL
	W+y+D4nsu0SLi5xiWPGzqvu+HvMSdnBAHPwVzXmSDX867Nj0DnqDf59YzS7NVm8sihsC+t7oorDsm
	u7HkDHoYP/uiWq/dv74e/1EAVznDI8tx1ATPSAicM7TbeoR8CCXnOCpyegd0M0A2ly8yOj4IGJKg1
	b4qlqQLimYDwGinTmmv6ALbYiHxs//MNpIQseMGemMevZENS17Qsfd999NMMJxaqESljvKvPgXmZH
	p5XQVEEGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJMxJ-0004Xg-5U; Fri, 18 Sep 2020 20:26:05 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJMsS-0002Fw-Mp
 for linux-mediatek@lists.infradead.org; Fri, 18 Sep 2020 20:21:08 +0000
Received: by mail-io1-xd43.google.com with SMTP id y74so8313392iof.12
 for <linux-mediatek@lists.infradead.org>; Fri, 18 Sep 2020 13:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gfig0mzAlJaPnbwPG2ndnN/ke6uDHaqhq3zr7HC85pA=;
 b=aHphpi0lYBZrG5SwR3zA6j47tjwA3IFz/1lv9Q1YzAeZJ0ruLVOoCGhj6r3uLlfyqk
 FSkVnYTGFg5Hj6zdj1ADRrOlOu6JbrwDGaDOZ6YW0URo8rk6IwRUjLPk7HBmufZSo4CU
 Id0j0JXSxKXuLwW9rJ7svN+ezFPoLvXprwegQ1YamMTC4P0WfiAeBadCGBWUPq1sTmBx
 zrbGIjbWS89Aup+3l08sli8yjOfyOwK0trSuEJIZnFBY1XxsRRURJI5L3drECod7VhzZ
 iOsL5vxRAxHs1APjlqlFgd56Mn5kq8aFhFFFtA4ShJF4moO34nP4ncUpX+tRyjfGlZGB
 7sZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gfig0mzAlJaPnbwPG2ndnN/ke6uDHaqhq3zr7HC85pA=;
 b=rEzNdegM6TGxyM7IDhibsQsJmbeQOcGUSSG9EGFimeCJZSEiFd5HJJuhbBp97hw1/8
 tQdp1bOJ/J7+EcFgPEfRCMJt2E/w6kv0annxhWubXviMQG0fLsRDm1/jfk+MhSXA0U5C
 YeiaMg0TGuX7XJhPq1j9KSOq+IUTRS3YjCr/RFFeb3FupisXKUhkpzvy7ET5EGnf1gll
 GWjKiksp6Agi8LlLDN6uu7gXsqCzcPzL3vgVktz55Hl8JFVBtu8fbPLtWCRAugoYWoXp
 qq6ALE2md7z8go6kFwhZAXU95sxiZnxDQdZzyF5tF94TQ24SVlEXUWnMzjSw/cAmEh+v
 NhDA==
X-Gm-Message-State: AOAM533ryXBdHfD4knZJ+LBmMH8utY5p+kB+HbDzU6fbuOceGplF2OFc
 fuKGK23DWMrATYJVHQOOPk/gcC6cGWOlFEPk3GmWlA==
X-Google-Smtp-Source: ABdhPJznCrMerWd7RxXkanBXIr5zeV+S2EftTdo5ViYZNZHe4okH4/3nmpXzWouRHQDNJgGYo2EjlwzLLu5qx4yl9LI=
X-Received: by 2002:a02:c60b:: with SMTP id i11mr2041563jan.82.1600460461816; 
 Fri, 18 Sep 2020 13:21:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200910172826.3074357-1-enric.balletbo@collabora.com>
 <20200910172826.3074357-4-enric.balletbo@collabora.com>
In-Reply-To: <20200910172826.3074357-4-enric.balletbo@collabora.com>
From: Fabien Parent <fparent@baylibre.com>
Date: Fri, 18 Sep 2020 22:20:50 +0200
Message-ID: <CAOwMV_z9OBpNqStCH+HEcwAK-TwPVeMH4LwJbp78T1P=t9bEKg@mail.gmail.com>
Subject: Re: [PATCH 03/12] arm64: dts: mediatek: Add mt8173 power domain
 controller
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_162104_958698_17FC5134 
X-CRM114-Status: UNSURE (   7.13  )
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
Cc: DTML <devicetree@vger.kernel.org>, drinkcat@chromium.org,
 weiyi.lu@mediatek.com, linux-kernel <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Enric,

> -               scpsys: power-controller@10006000 {
> -                       compatible = "mediatek,mt8173-scpsys";
> -                       #power-domain-cells = <1>;

This change generates a lot of warning when compiling the MT8173 device-trees.

Warning (power_domains_property): /soc/mutex@14020000: Missing
property '#power-domain-cells' in node /soc/syscon@10006000 or bad
phandle (referred from power-domains[0])

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
