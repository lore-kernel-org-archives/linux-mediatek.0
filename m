Return-Path: <SRS0=Yz5u=2N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57BF5C2D0C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Dec 2019 09:15:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C340A206CB
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Dec 2019 09:15:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qyaEJdJ2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JChcZAmP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C340A206CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kvGFLzJugra1HxUsvyStF933GzA7amuRHiv/tnl11oY=; b=qyaEJdJ2m9mriP
	aqOtW0qghEHVOGMEOgGfnHKyisOMPJSrn5WVkTi4bcAfsNgUZjVL1eD8zbaler+kRWkdLwcN/9Nr0
	jPtHOkyK6gKHJ5KsEhVtAgCSGDLBQ03vqohtQmfEg1+AxOL7GAAGQvu1UZcE0vay6B8E42V5RYL+6
	8qe1JpOjBOOMnb8zv8jCVz7O+57hA0lDamxkHWq9tZLwSPWi/NT9uHqOT8gNLdst/xDhNhqzHoFan
	wnaZ9/GiMWVU7DaaHOcLIn337m4JOXStYLnW2q1m6JLcw6hJE3S5IuKAblYLd1snRcaxw8AuNYiGX
	AJvo4mKOjI003EbFyGwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijJnk-0003S4-9D; Mon, 23 Dec 2019 09:14:56 +0000
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijJnh-0003Qw-QE
 for linux-mediatek@lists.infradead.org; Mon, 23 Dec 2019 09:14:55 +0000
Received: by mail-qv1-xf41.google.com with SMTP id o18so6137475qvf.1
 for <linux-mediatek@lists.infradead.org>; Mon, 23 Dec 2019 01:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gu/ztFiRQ3wq9XQZk4WFXx+978qv3TNkjDk+Rg1DcEQ=;
 b=JChcZAmP16y+mbW1Asq7N8aJZsXBv8p86qgVulBr2n85kEF6ZYqrML12yiQ0Jliii0
 Knr104cQRfUO4BGBfzSyzaSqSTy7iNiXrG2Pax060fVdsPFaMX5BYTNmR6Bk3WqDIm35
 0/RGy6FmY5hwcu3+ywUuX0yVkdqKLZKYFXpqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gu/ztFiRQ3wq9XQZk4WFXx+978qv3TNkjDk+Rg1DcEQ=;
 b=BGnEROTjzfQFKhWR92v+Am7VrIi6zfU6gflHFE2vE3b9f1IiW2w310xdzCYEyehUh/
 KPlJswoQ+CbM3SKN1uvpX18sWnZBladbL3dfCdXSLmEzSoCh15LmyNDTy2Nz8ux+G2BL
 9IcK2v5VN2nros+GbShy4K9gdmmV/nnh1pNOfr1HWKiY9uu3SRwE5klD59rnVDjtqrjR
 RSQdp4E8x6ssa8UWjsKhiU9Hef9lUe/7AaiETyFGRrXTyjM8PUze5TowTQtQ47a9gogd
 r3xxrgIHyKPz9dHai4U6gsblS20LKgyYGH5vq7Npp1sBjnZGINDwr9Wrksrs0C1kAGjs
 dCuw==
X-Gm-Message-State: APjAAAWnJGL3SYCoVBQjZVWfJesCd+a3LC83PhEDOWGyYa2Pu6YKV28e
 naB1ns+0r00JxADJ4rN81xI2fXffJVeZJFp2GkPaKg==
X-Google-Smtp-Source: APXvYqxSGh8tEsYM4HGrQMAIpi4RkLM4nlV0RIDeW/C6zkKppoWb1uEylH2teSbPYDtcvEwo1nKoLSIXM3xw4c24zSA=
X-Received: by 2002:ad4:4182:: with SMTP id e2mr23692671qvp.187.1577092492136; 
 Mon, 23 Dec 2019 01:14:52 -0800 (PST)
MIME-Version: 1.0
References: <20191220081738.1895-1-enric.balletbo@collabora.com>
 <20191220081738.1895-3-enric.balletbo@collabora.com>
 <CANMq1KBHsc8oqcjWnjLPCpRToyOm16X6EcQqmqPjZf=D7wA2-Q@mail.gmail.com>
 <05db638b-02a6-0e3a-43ed-44a0a1458d87@collabora.com>
In-Reply-To: <05db638b-02a6-0e3a-43ed-44a0a1458d87@collabora.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 23 Dec 2019 17:14:41 +0800
Message-ID: <CANMq1KA4mp648p1LicOzAyra6tdgN2qdDY=N0XyDYhgt6BP26w@mail.gmail.com>
Subject: Re: [PATCH v22 2/2] drm/bridge: Add I2C based driver for ps8640 bridge
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191223_011453_873411_C80438D4 
X-CRM114-Status: GOOD (  13.64  )
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
Cc: Ulrich Hecht <uli@fpond.eu>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jitao Shi <jitao.shi@mediatek.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 lkml <linux-kernel@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Dec 23, 2019 at 3:10 PM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> Hi Nicolas,
>
> Many thanks for you review. Just preparing a new version with your comments
> addressed.
>
> On 20/12/19 9:44, Nicolas Boichat wrote:
> > On Fri, Dec 20, 2019 at 4:17 PM Enric Balletbo i Serra
> > <enric.balletbo@collabora.com> wrote:
> >>
> >> From: Jitao Shi <jitao.shi@mediatek.com>
> >>
> >> This patch adds drm_bridge driver for parade DSI to eDP bridge chip.
> >>
> >> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> >> Reviewed-by: Daniel Kurtz <djkurtz@chromium.org>
> >> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> >> [uli: followed API changes, removed FW update feature]
> >> Signed-off-by: Ulrich Hecht <uli@fpond.eu>
> >> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> >> ---
> [snip]
> >> +       ret = i2c_smbus_write_byte_data(client, PAGE2_MCS_EN,
> >> +                                       status & ~MCS_EN);
> >> +       if (ret < 0) {
> >> +               DRM_ERROR("failed write PAGE2_MCS_EN: %d\n", ret);
> >> +               goto err_regulators_disable;
> >> +       }
> >> +
> >> +       ret = ps8640_bridge_unmute(ps_bridge);
> >> +       if (ret)
> >> +               DRM_ERROR("failed to enable unmutevideo: %d\n", ret);
> >
> > failed to unmute? Or failed to enable?
> >
>
> failed to unmute sound more clear to me.

I may be wrong, but I have the feeling that the functions
"mute/unmute" video/display, actually... And that the function naming
is strange...

You could just try to remove the calls, as there is no audio on the
board you have (elm), so if video still works, maybe this is actually
audio ,-)

Thanks,

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
