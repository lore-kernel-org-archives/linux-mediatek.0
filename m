Return-Path: <SRS0=7Wwy=ZY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B6AC432C0
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 20:52:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BB6C2070B
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 20:52:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RDGksdgu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jn5nPOdz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BB6C2070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WV3MMFlm2ucnOfEUaQfZbPhDfcdSumcE7TQlLHDIST4=; b=RDGksdgu3F2hXA
	gxWcMTfy26vEzc10znEtHFgwN6KV16bYNvNG5Z9rA0dJ859gfiSEONO5UAc+XMpB8dl3jbkY4VstO
	NgktnippCHfhSxPUzby7fWc97M31KcXb8EeV72nzhfcO6nC3cwRIJKBwUUJc9FSmn/TT+sN6XsY1h
	F4yhAYCQ+GyXZX5BeM9sDMCX5b0RmVuMdFMwqbal/kIoVwd25DMhdgFX/mQp5mtZMf9m1OagS96nS
	o5OSzyDXyPvjJqqU+2sMw1pxb7PcCGoIN9ObRc6COJ5vDg/Iwx8ULytK5Rk161fWDCJ010dsiZsxO
	qncD5u1Q0tK7Xvm6660w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ibsfx-0006Hc-8z; Mon, 02 Dec 2019 20:52:09 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibsft-0006F5-DV; Mon, 02 Dec 2019 20:52:07 +0000
Received: by mail-io1-xd42.google.com with SMTP id i11so927791iol.13;
 Mon, 02 Dec 2019 12:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yKoJSkDsfIMrRW3jw85HKe2BQZ9NViBue+DgpdqXPJk=;
 b=jn5nPOdzEW+w5jzVGwuZ5oFeYEJf8WBlojzcbzo0FpQpz8lU3xlwetOymXe33RV0vU
 rZIUB8uzWSed5dAOZ1mQV8JCVBog+b8KG4/DzRaXJXK6jqkoWbOhqSlwP5HgyP7tpA1F
 sZOxbnADrE1RzNLnPdosncLvIUYhSNdiY5DzW7oxY59mP20Eg/u0Prwm4gBh32Q/n4J9
 GV8x5s3ajEkkySKLDzpqU3t0idoZb/hk/zqyucuqOWZLmopIcohvyGZ0mCdu/5Fjm4V6
 91n5ODv3rGa/fc60puo1AB0cc1S+Tf15xJgp0UInowtD9CGErLbGPkAFEeLQiB55Jmxs
 HKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yKoJSkDsfIMrRW3jw85HKe2BQZ9NViBue+DgpdqXPJk=;
 b=UfjDp/BTmkm29hldXeYlwfy49yOR7ntcqd0xU1SaFj7X0tMGsFKWvqWNvwLKMpWYGJ
 O3xFNSaUUYmvh11NqsgspL1hpHyeT6eh4X7s7l/aX8lwnTQ5oVxyZtjUfc28ndFqHHgM
 fxszwGCcXyY6zBkMCZwgJSjVy4+mierCTKmvGpXE13tsYpjqx+x1VhQCZcefQSEsQ0Xu
 2wei1ryJBPBlGtuKQEfJvXRs5NwDfLG7n13IcYSQzXC1Ltu9IJC/FICBk+ZlWkeBnL0B
 UOnd8GbsoPdZd0Bb0uigHJA9+t+dRcH93V/4aiWqa6yyhhqrqRxG60EX8nmdLcMWLof1
 3QUw==
X-Gm-Message-State: APjAAAVnAHOqJcpRl6Ds2iH4wA+aasGDYQNJii4csL15WHCqtMqmCdH/
 p/hIjrRd2XrmK0FGuUS+C8+ipcNf/ZDs5llqxRg=
X-Google-Smtp-Source: APXvYqzWJF+0Ki7M75FXoNw5UEUbhPWmgMVsemvAdnlzFn4gnf/vkOuGYX8u/xhrshBT2ODP7R8nZZfzmzkVwC/iQMQ=
X-Received: by 2002:a6b:5914:: with SMTP id n20mr744400iob.42.1575319924442;
 Mon, 02 Dec 2019 12:52:04 -0800 (PST)
MIME-Version: 1.0
References: <20191202193230.21310-1-sam@ravnborg.org>
 <CAOCk7NoKPoxcETLYQ4CyAtYGnPwvYapdSavZM=aRdswDydTLEA@mail.gmail.com>
 <20191202204802.GA23600@ravnborg.org>
In-Reply-To: <20191202204802.GA23600@ravnborg.org>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Mon, 2 Dec 2019 13:51:53 -0700
Message-ID: <CAOCk7NogV39X2QMabv1naso4r7T_EkdzajcbtoPzQnJQ5T7WoQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/26] drm/panel infrastructure + backlight update
To: Sam Ravnborg <sam@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_125205_482176_413851FE 
X-CRM114-Status: GOOD (  11.45  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Linus Walleij <linus.walleij@linaro.org>, Stefan Agner <stefan@agner.ch>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 linux-rockchip@lists.infradead.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 NXP Linux Team <linux-imx@nxp.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-tegra@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Purism Kernel Team <kernel@puri.sm>, linux-renesas-soc@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Dec 2, 2019 at 1:48 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Jeffrey.
>
> > >  drivers/gpu/drm/msm/dsi/dsi_manager.c              |   2 +-
> >
> > How come the diff stat in the cover letter here indicates a change to
> > this file, yet I cannot find a change to this file in any of the
> > patches?  What am I missing?
>
> This file is patched in "[PATCH v1 06/26] drm/panel: decouple connector
> from drm_panel"
>
> See: https://lists.freedesktop.org/archives/dri-devel/2019-December/247186.html
>
> The above patch touches a lot of files/drivers so it was cc: to
> a lot of people. Maybe is was considered as spam?

Interesting.  I missed that I didn't have patch 6 in the series in my
inbox.  Its also not in my spam box.  I wonder where it went.

Thanks for the direct link to the patch.  I saw no concerns.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
