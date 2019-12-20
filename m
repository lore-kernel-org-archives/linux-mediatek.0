Return-Path: <SRS0=AkNb=2K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E080C43603
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2019 08:55:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10BB324679
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2019 08:55:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j86uaKjD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W0dWNacy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10BB324679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NvxyhfPanFudhdFFFv7CELhyLzx2FvDvyilALUGtiAM=; b=j86uaKjDrbjij/
	H9w0UB+I9Vh3yR0HswIV/4zXd2DnTPjfSYGK9tLONRbry44xayupZpY8sy79UmoDJ206FckASIfrJ
	AekrJeZvgkN3NfhhdnDb94aCCYIwifV7PMkOJDW3NPAGlZDsD/cT9eDzJGF9OG0CVgEJi8ypvUSej
	yNxpeiCc4iPUOVUk2ehtaO36GAkZ3IaSr68X9L8FPcnknuDoJWVSXL2jXVu/78gyFNHPL923ZOuZ+
	LJR1b8FnpePMyC4/YKNe2kJnsCF9tCaj/wx8miD+iqnse9fazYtvcbELESUfgTchJTWgzWX9f7VYU
	e1mXg5H8Csg/cCD00mpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iiE4b-0001bn-LD; Fri, 20 Dec 2019 08:55:49 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iiE4R-0001Sy-VU
 for linux-mediatek@lists.infradead.org; Fri, 20 Dec 2019 08:55:41 +0000
Received: by mail-io1-xd43.google.com with SMTP id b10so8619431iof.11
 for <linux-mediatek@lists.infradead.org>; Fri, 20 Dec 2019 00:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hFyk6wfDM3uJNZM3XmVJRb6zXEf3/dZ+tc8Bv4YB2yY=;
 b=W0dWNacy+Z08VU2VNyW6cLKarj2vQSvC7GwIrBrk5kAeHpY8LUCugVbH17i6+PQmyA
 lzshmpaK75tqkDiY8MXYJFy40HtHbIraPO0UNF/SdTr1T0MrZjg9bMNdnlBgv7STNqf6
 AcP0G+MibU3+k6+ra+ZS/fYB+z7mO6Z7OA5uI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hFyk6wfDM3uJNZM3XmVJRb6zXEf3/dZ+tc8Bv4YB2yY=;
 b=XLixN4wuLTQFTFjragBaJdwx04J1+iSO8cQmi0DgEY4x0+6U+Yf3XRVRKvHSolTyI8
 ISwdeiUM+ZDLiXdvUxU/DXMC4r8fasGOXcDGd5W1z1Pct8TBjqgWCgGpa9DraXTYVceN
 afXYwiJy/9kMHUHj1l7IbjC4gdvBKeyZa0GWig4pyqBZ4VOaFfvcWO6E2cwQARLE25r6
 s2w04mBaM5J4sAXx2KULkcBlJMgTREmOGB/2817bA5eboQzEiE4qw//OmMe8PS9cYKw8
 b25VCBAhMq9TOzyWiAJzlAJ+1Y+ng4sQk3XN0jxvq3yKWqBmWCMeCh1Ad+oaGM12JkoV
 Mc/A==
X-Gm-Message-State: APjAAAVSVAOYci7ZH52gGSB6fj/AY2jV5erzbSgGU9ghqaMYssL1V9YS
 RMbVyDAk7QfmjpI8A2DQ6OE6kbi8RK3/g/IarG2zCA==
X-Google-Smtp-Source: APXvYqx6jNS3ruJSqRukqpBfv5nCziRlHY3HFBeibFf5MWoadOk37sDVbGh863vc8QU+b1jTv0rGaDTo6tv6CoaEyJc=
X-Received: by 2002:a6b:3845:: with SMTP id f66mr9807832ioa.102.1576832138346; 
 Fri, 20 Dec 2019 00:55:38 -0800 (PST)
MIME-Version: 1.0
References: <20191220081738.1895-1-enric.balletbo@collabora.com>
 <20191220081738.1895-3-enric.balletbo@collabora.com>
In-Reply-To: <20191220081738.1895-3-enric.balletbo@collabora.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 20 Dec 2019 16:55:12 +0800
Message-ID: <CAJMQK-h9w5a1CKyTqdBsmz6TYbcGMzhPLNwU7kYBYp56EV0PZA@mail.gmail.com>
Subject: Re: [PATCH v22 2/2] drm/bridge: Add I2C based driver for ps8640 bridge
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191220_005540_041516_C380812C 
X-CRM114-Status: UNSURE (   6.10  )
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
Cc: Ulrich Hecht <uli@fpond.eu>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, lkml <linux-kernel@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, linux-mediatek@lists.infradead.org,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Dec 20, 2019 at 4:17 PM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> From: Jitao Shi <jitao.shi@mediatek.com>
>
> This patch adds drm_bridge driver for parade DSI to eDP bridge chip.
>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Reviewed-by: Daniel Kurtz <djkurtz@chromium.org>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> [uli: followed API changes, removed FW update feature]
> Signed-off-by: Ulrich Hecht <uli@fpond.eu>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
tested on mt8173 chromebook

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
