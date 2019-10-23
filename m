Return-Path: <SRS0=HtVu=YQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C0D1CA9EB6
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Oct 2019 17:43:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1309721872
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Oct 2019 17:43:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O4tkSVTJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="eh7HMESx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1309721872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jTI1u7OfzrXHGu+OetW9VAHzWz14kZxpFRxQdKPTHjk=; b=O4tkSVTJXCfmrM
	CObThlnup33Z1Za/ttM3ZyYxTmXFaRNbFu4gxGRANb6/8PH49OPbGzYoY7sSInQSE/UJi3iRpbDs1
	Oxv3uOETJY7UkaGlvLOPhK4rbm2LyCIhz1DLv5WJDT0dVS5EVFKIieuxuWra9moYC4Waqxkke5waM
	eZNyVVF5Y6kwiQyRbT11QmB1pdW4R0a+nWlNPxJi8Q5PlnWUpfTXotwSiDl2LJxqEkrMNbtvsrhJa
	6oybhI1EgYxHg++QZObgwQ0EtHMP4z6iGNL3EiuKKpz7OsBYYM0iR3oJ6hzNJyKQWq3D4RhTx1uLl
	is0M/fF6FmlaszpUGTtA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNKf6-0007TE-NP; Wed, 23 Oct 2019 17:43:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNKet-0007H9-J6; Wed, 23 Oct 2019 17:42:57 +0000
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0AC5621872;
 Wed, 23 Oct 2019 17:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571852575;
 bh=Zdd+bgen4VCdF1TuKnoa4pMTs+dOffO7IeAg+rc9+gE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eh7HMESxDN1m3ndZNJdg5HSRI8CkYBB2carSLn+avNAW9l1F1Bkv9veylygmjsFoN
 SHNlKpRIbd9x6tBOMS/IvKXbwDlDV5yoQITMR30rNGV2cHjeaZA/N0JoN/FQ9Of8Yb
 b3u8sJE9FFjhWMQdh+HlR4zQ7M7XDGqgjqg7E2vI=
Received: by mail-qk1-f178.google.com with SMTP id p4so20564999qkf.5;
 Wed, 23 Oct 2019 10:42:55 -0700 (PDT)
X-Gm-Message-State: APjAAAVqg9lh9ysvZf9dQdMs08sIP96tSyLjPmp2mJLF3/C6StgJ6WA9
 fIU5B7qEh4tEz6d9d7bhVL0VgB1c/qbN0b4LmA==
X-Google-Smtp-Source: APXvYqyuh/XWFNyrpsa1JhFwoa2PiHMb3DrmJcjTiQicDd2Twa2DKVtOZdwWw/pNA4z2JJqXpQHFweiKQz+jhiRVtUU=
X-Received: by 2002:a37:9847:: with SMTP id a68mr9887831qke.223.1571852574174; 
 Wed, 23 Oct 2019 10:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20191021214550.1461-1-robh@kernel.org>
 <20191021214550.1461-6-robh@kernel.org>
 <1cbca96c-19dd-1d15-949c-7fbcc15369b4@gmail.com>
In-Reply-To: <1cbca96c-19dd-1d15-949c-7fbcc15369b4@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 23 Oct 2019 12:42:43 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL6G=F45G+-QXF6T1269f9YquXfYtjoUkCpAoNartxM=Q@mail.gmail.com>
Message-ID: <CAL_JsqL6G=F45G+-QXF6T1269f9YquXfYtjoUkCpAoNartxM=Q@mail.gmail.com>
Subject: Re: [PATCH 5/6] drm/mediatek: Convert to use CMA helpers
To: Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191023_104255_671263_9B75830C 
X-CRM114-Status: GOOD (  17.70  )
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
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, Sandy Huang <hjc@rock-chips.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Yannick Fertre <yannick.fertre@st.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Kevin Hilman <khilman@baylibre.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Chen-Yu Tsai <wens@csie.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Ulrich Hecht <uli@fpond.eu>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Chen Feng <puck.chen@hisilicon.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Philippe Cornu <philippe.cornu@st.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rongrong Zou <zourongrong@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Oct 22, 2019 at 12:07 PM Matthias Brugger
<matthias.bgg@gmail.com> wrote:
>
> Hi Rob,
>
> On 21/10/2019 23:45, Rob Herring wrote:
> > The only reason the Mediatek driver doesn't use the CMA helpers is it
> > sets DMA_ATTR_NO_KERNEL_MAPPING and does a vmap() on demand. Using
> > vmap() is not even guaranteed to work as DMA buffers may not have a
> > struct page. Now that the CMA helpers support setting
> > DMA_ATTR_NO_KERNEL_MAPPING as needed or not, convert Mediatek driver to
> > use CMA helpers.
> >
> > Cc: CK Hu <ck.hu@mediatek.com>
> > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-mediatek@lists.infradead.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
>
> I tested this on my Chromebook with some patches on top of v5.4-rc1 [1], which
> work. If I add your patches on top of that, the system does not boot up.
> Unfortunately I don't have a serial console, so I wasn't able to see if there is
> any error message.

Thanks for testing. I'm based on drm-misc-next, but don't see anything
obvious there that would matter. There are some mmap changes, but I
think they shouldn't matter.

Did you have fbcon enabled? That may give more clues about where the problem is.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
