Return-Path: <SRS0=P2Dl=2D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D36D4C2D0CC
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2019 08:08:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAB2C22527
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2019 08:08:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HiI4UWLO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAB2C22527
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KawifYWZzDynCZcZ1WzScsVKJ4Io7XREJmLE2ATRHUo=; b=HiI4UWLOeYe2MR
	9WnGE5nzpwnTZuFaAS+k/cT43DGFbH8Cp8Soq1/GAS7ZiX39O4yGfUMbu1eXkowCH1IoE44ssEwzT
	nIBe6BJmI1wapGPp5mmHx3RwRdYfOrpzAn8JgqCStiK9LbwjIsQ0pN0z1BgnAFEfnm0gD4MaFqa/q
	jqcCbKuLQe7apaU+SziwNoLPnciUB2dyIo/gLEsymFTzenaIptKYVpE5Vr19LSv7PiDL+8yoifpc1
	KaS1masXFwLNqoCGnG6T+AUl+lTc8x5ynDxE7m2ZdD8TczY2p2lkRDW9NW2xb0UDdNrkA2/phvDnV
	WDD7P5BW/6O127Ix8LBw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifg00-0006NW-Rp; Fri, 13 Dec 2019 08:08:32 +0000
Received: from mail-ed1-f66.google.com ([209.85.208.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iffzx-0006Mo-RV; Fri, 13 Dec 2019 08:08:31 +0000
Received: by mail-ed1-f66.google.com with SMTP id l8so232839edw.1;
 Fri, 13 Dec 2019 00:08:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8Sb7h+Syw20vysdh92QJjNk/PaKzOiYC6n/84DQf0IY=;
 b=ZU5tzfqZeMwwO1Ryz0zz/Zpygc5LfScKEOO9JoxelknaPpXKi2niwPQTOSfj9E/dSJ
 08Yd946ONWOoZeIOllgC4iniADLXpENV6fGd/991OrN700J1BqFUEL+6EY1sFhORbCbD
 ecOEhgHAyoA9PQ/C8rllWX5880hpxAUZFBvVosTpJj+CUoH8AnHd8nbCsVrGPVe64Qq7
 RVyHsgE/3zecbFVpTevhtIxz8HexftkRNmZTNCqqcuPm3rifb470amNW32LDG5vwG8B0
 rA2qEKb5VW4sQrGL/9Hn+aT4x5pOCY9MvDiwV1FTi2KbfuYBcGsKjja3yxHubgVZYmou
 tfaw==
X-Gm-Message-State: APjAAAXptM+zNDYDoWx3MKeaZrZvcaVM1sOt5LmtexzaRguhwBvvJXHW
 HqLd8djI7iTsm9O8f5yRKItzmwn8D8hBHQ==
X-Google-Smtp-Source: APXvYqwoxO/NnUXTnJR351KOA37RUdqEdnPvfbKkb159ydBCADF0BDc+AUoqVxisr3P4uARKjlZOsg==
X-Received: by 2002:a50:f784:: with SMTP id h4mr14663755edn.172.1576224506151; 
 Fri, 13 Dec 2019 00:08:26 -0800 (PST)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com.
 [209.85.128.42])
 by smtp.gmail.com with ESMTPSA id p5sm346072ejj.61.2019.12.13.00.08.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2019 00:08:25 -0800 (PST)
Received: by mail-wm1-f42.google.com with SMTP id b19so1071309wmj.4;
 Fri, 13 Dec 2019 00:08:25 -0800 (PST)
X-Received: by 2002:a1c:6a05:: with SMTP id f5mr11357678wmc.2.1576224505305;
 Fri, 13 Dec 2019 00:08:25 -0800 (PST)
MIME-Version: 1.0
References: <CGME20191211145222eucas1p1d761af59e04017ddadbdbd1cceb59b1f@eucas1p1.samsung.com>
 <20191211145054.24835-1-m.szyprowski@samsung.com>
 <20191211145217.25025-1-m.szyprowski@samsung.com>
In-Reply-To: <20191211145217.25025-1-m.szyprowski@samsung.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 13 Dec 2019 16:08:12 +0800
X-Gmail-Original-Message-ID: <CAGb2v65EBb-qvb6XVzvZgqKUbzJJgkXgB5y2uA8Aa1__n9v+qw@mail.gmail.com>
Message-ID: <CAGb2v65EBb-qvb6XVzvZgqKUbzJJgkXgB5y2uA8Aa1__n9v+qw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] ARM: dts: sun8i: a83t: Correct USB3503 GPIOs
 polarity
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Maxime Ripard <mripard@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191213_000829_889835_7864862D 
X-CRM114-Status: GOOD (  11.57  )
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
Cc: "moderated list:ARM/SAMSUNG EXYNO..." <linux-samsung-soc@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-usb <linux-usb@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Andy Gross <agross@kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Stefan Agner <stefan@agner.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Dec 11, 2019 at 10:52 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Current USB3503 driver ignores GPIO polarity and always operates as if the
> GPIO lines were flagged as ACTIVE_HIGH. Fix the polarity for the existing
> USB3503 chip applications to match the chip specification and common
> convention for naming the pins. The only pin, which has to be ACTIVE_LOW
> is the reset pin. The remaining are ACTIVE_HIGH. This change allows later
> to fix the USB3503 driver to properly use generic GPIO bindings and read
> polarity from DT.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>

I assume the dts patch has to go in before or at the same time as the driver
patch?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
