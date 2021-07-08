Return-Path: <SRS0=ooiB=MA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F029C07E96
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 15:31:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 390C4616EA
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 15:31:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 390C4616EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=McnRKjpa+8vPKlczp53EQ+FZsjKh6aRwrlXryWyXXXU=; b=RLKqbTDQT3opZv
	0k/A29LkzvlDb7L58svWD2SyJ34ClfGJDOhNfKqhtkzp4izPVbC4uYNRyJqnrhdk/Vnb6Zremxu8A
	0VQofUDVxouWUVetvfBr9qf/n4z0ZYcUIIcCywsCp8GM8Y6/weQFpC0ECXD2BX+ld0U/n1DuOeoNy
	v/GJoqX1IX2snnL+yWCdtvpgHP62CliYM3rSAoJRm7q7d6XN+ygzK77brHS6WUB9awXmCkPdcfHdJ
	S0MM3p1Ch/Cw2I43MzJ1IibfNl3CjTDNRba7YbFM6YTP+OLp5H8Ws7hwNP1pPyIN6Sxv1BAPgCipl
	xFIua5JX2/pqKPLOlWog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1Vzi-00HHar-Rk; Thu, 08 Jul 2021 15:31:18 +0000
Received: from mout.gmx.net ([212.227.17.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1Vzf-00HHZi-NO
 for linux-mediatek@lists.infradead.org; Thu, 08 Jul 2021 15:31:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1625758260;
 bh=nG0rFzyWwxI3NQHIWUD7r321QKdUVY+N3Y6jzsdRrnA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=S5SAzrqyQJbsGmcURycPWr0syeS93jfLxJc3Tin/BtqK1DmT+5jFUv2whdu34S5B3
 3AZbIbQIxfBrasNI+NoZZfYi8Xv4hpB5qNT+8v7DSI0nieqBr2fav6G6aZ5VYuA1yd
 AgbWjeo+wPkfHw9SCLkfkTOWd+zrAEZcVM7NFL+0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.147.159] ([217.61.147.159]) by web-mail.gmx.net
 (3c-app-gmx-bap19.server.lan [172.19.172.89]) (via HTTP); Thu, 8 Jul 2021
 17:31:00 +0200
MIME-Version: 1.0
Message-ID: <trinity-3f4f4b55-7e39-4d80-8fc3-7d0e2b3026de-1625758259993@3c-app-gmx-bap19>
From: Frank Wunderlich <frank-w@public-files.de>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, Collabora Kernel ML <kernel@collabora.com>
Subject: Aw: Re: BUG: MTK DRM/HDMI broken on 5.13 (mt7623/bpi-r2)
Date: Thu, 8 Jul 2021 17:31:00 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <trinity-e6443313-a436-4e9d-a93c-1bef1cce135d-1625736911475@3c-app-gmx-bap19>
References: <trinity-cc8f5927-9aaf-43ae-a107-6a6229f1b481-1625565279264@3c-app-gmx-bs60>
 <25d61873-38ae-5648-faab-03431b74f777@collabora.com>
 <trinity-e6443313-a436-4e9d-a93c-1bef1cce135d-1625736911475@3c-app-gmx-bap19>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:wiHKJ4pZw+i4+wRHC9BOA/fmvr0HJrbs+S04dC9RHlZ/rQdWr6dVlmhEeNLG1lN7/H4GT
 mPhnuqZc9y1dxElbjPUNI7dfnsS4rf87tw1G1CpmS7ZdbSFmK57SjekTbtefPEVY9cxHBTvGLRbk
 3fB/KFrCxX+Ug0D0oJ06IN0ZT9I2yfEgtsiX6JVX5xiWIfVDi5eWxL9hYbCmnDgyJSCSw2BPVjFc
 GhITtzk/1X9uIssmMVja+Va0pQp6+ijeW/X3xULfbXJyklzULp+60CGtC4REKiUA/ZLuC4V86qhO
 qU=
X-UI-Out-Filterresults: notjunk:1;V03:K0:Vw9zW2hsmd4=:hnMCvQBqmELYzsYTSfnv6K
 esoWwP7uwrtKpHZ4GnnPSZGmZ2VmGCNBtQqc0QXaw7hkF6kFXrlBkgihXyqebUs38Wr4tpGFZ
 tmv30lpPfUeC7wlNV7EGAmY4vFbWBKE8LU+3IIA6JZSriijkOZLGl6614zXxskbazuK8NbnPK
 rIZ83b6dg3R57xDsGgAwRQWIzFxNj2usIgvTnEahaML8sbQ1v2oQZSbdd2B2LTY1ms3CloHzK
 HrmSrujpl43ivTNrxyhmnNvNLF4XxawW2N+nuV6YHOdb3oddICQZqS4cUSm6zfHi7QqAzgEBz
 MJ3jE+kRRbGsxLXG18l5x5hYk/ea+aYWdz8z7TOoqWOFisdNZUb3xxQOtQ+opUsboD0F/6NXq
 XQYQXGHWLSEWTn8WBRHwHUElW83dsbN1yrRtkd4uEiWj28icIBf+72jiZYG7fBZCnwZHCfC4P
 ruBhz5YE22r0UP9Ic8bv0L/1h89y3D2f9Yr5Ht59binUNP3aC4RzXIzuHEMfV2flOE2ODwFlb
 0Ho4A9fsy/9cw+rnLI6fl+H1fT4bDx8PON7aVW+mRrToQmpKbtZV04l3QFn548VEnkWEXiEyc
 mQK9oKa+D2lHd2WmPsa0JTVG49DbFezYOSyCmbGBFS4HlPAL9J1CaLPAHV0LacGLx4GspP3Hi
 LKLsbV026QLgOc2QzbYOe1ABqwBtsNo8O24PF1WUBguC3WZMWWN+ovDCRIj2RX+Inwy5bBKn7
 Qs+Ou7O3XfNRlGd2AHh+NznUlVlLgCa0trrWzQa5Nv5h1uTTzFfSEiNYufIHTurDSN5Aw2xb4
 rJt55pnWq52brszm5L3osPN9GOnQY3hG9Ez7Ekoq+hTc0fC13Y=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_083116_100726_C30C4F18 
X-CRM114-Status: UNSURE (   9.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> Gesendet: Donnerstag, 08. Juli 2021 um 11:35 Uhr
> Von: "Frank Wunderlich" <frank-w@public-files.de>
> i guess not, but is watchdog somehow involved? i ask because i see this on reboot/poweroff:
>
> "watchdog: watchdog0: watchdog did not stop!"
>
> i see this with my 5.13, 5.12-drm (5.12.0+mtk/core drm-patches) and 5.12.14 too (hdmi is working there), but not 5.12.0!
> that means something in drm-patches (mtk/core) breaks watchdog. maybe the recursion mentioned above?

have to correct me: 5.12.0 shows this error too, so error not caused by drm-patches, but i guess unrelated to the possible irq issue causing hdmi not working on 5.13 (wait-for-vblank/page_flip tracebacks)

i'm not aware who is also involved in the problem, so i want to avoid send people to the wrong way :)

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
