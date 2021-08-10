Return-Path: <SRS0=C/QR=NB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F94C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 11:39:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AAE560EC0
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 11:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6AAE560EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TXaiVYIbFkWsw7LLvonwG2iRJnkljUeedu3O/vw/a9o=; b=caCd+sYiYOw6UJ
	cFStmJJiolFv+uGfwqw7ovUyoC7g3ySnFQ4aeyTn0vFs5CVk6QLbfJDPxSughvEvGT/Gn3tlcHYke
	lQh80Rhor5ma/A3TS/ifYrsQGUlM8evdwhObk2YTiQn/QzbU4kQEDMgWm4EWRvZoB74I74iFfV3ay
	f7iJswlDLdjZxrlBDTl70koI22Y22KxM3UJtfiQWu3qC9Rx7hZNG/+D/G0ZBciZadBc00P4pwvzlp
	GHHsaQfqbp4kdc8lSXlSVOFM0/KJQ3UdsCA4WI4pW5D3A3M9cISJWuqZ0Nxpn2B//Rp0lqB/9prFO
	y3u/XyY8/G5SdU2NUtGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDQ63-003eZa-Qu; Tue, 10 Aug 2021 11:39:03 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDQ5y-003eXq-1n
 for linux-mediatek@lists.infradead.org; Tue, 10 Aug 2021 11:39:02 +0000
Received: by mail-io1-xd31.google.com with SMTP id n19so31848355ioz.0
 for <linux-mediatek@lists.infradead.org>; Tue, 10 Aug 2021 04:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kUwXDTn/nEQtIoTdsB5jMGa7v/7U/IC/RlJbSIvkA1c=;
 b=HQZMelUdqTZxUf3JkxmmsVTFmC1Mdz68Keh3lO5z0POpnpnucoqqg7rkVnDLJEDQ6d
 IrWRH/zoUzNO2TcjqvLRRagTN37zva1aLLs8hJw7RE/EuZuteefOiZKVnIsvShS7ng9D
 iDwqDIak8IyzBAFWDd6vDqEHQ0XNZYlAH4qWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kUwXDTn/nEQtIoTdsB5jMGa7v/7U/IC/RlJbSIvkA1c=;
 b=GkAz5lHM9nE7jPrid/x5or0dUIhBVGYFAmi7oP1Cx65oaSG6uSD6MPs98Occ3ArzIw
 yapNok6A7hKXkiiB+blog2kvtMIa/+4VOZ3DcqTF7DuZgVNMMwGPa0h9msY7X+OcJJd8
 6BDYZgGJN0f17ByMMjIKeTjXWMqz+whwaplra8b+W7Hhq+m4zKYQGcw4Lq6uI6VbVGdW
 +VtINixFe6Pi0w1js0FhQC5kBXsWSXe1tD0UCgZBWntiMsdAbQnw45Lr3FsJ1Q6ZzX18
 SCCJBKGGxKHqNe5QqawA56HpGRtKQRlB6qC4658iuF4egyvGslkbd/luEJqmQ/8bjTxB
 m1rQ==
X-Gm-Message-State: AOAM533lc46G4oiIdDmd4whkwHtdTBySdQdu0BzxnnqxCvnLJ2XUPJMU
 JUdhQRj3ns/OM+bp1ZF2V8SR0AtmYNxYrWfyPiabaA==
X-Google-Smtp-Source: ABdhPJyWjNvIInY7E8yPGRGtVh57QG1QSVK8P+R3j/fA9L2Xby5Bs4c9n+zM0z8jClvd941GJvNiXO8tquBwf6KQReE=
X-Received: by 2002:a02:cc21:: with SMTP id o1mr27001854jap.114.1628595536700; 
 Tue, 10 Aug 2021 04:38:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210810111124.247838-1-allen.chen@ite.com.tw>
In-Reply-To: <20210810111124.247838-1-allen.chen@ite.com.tw>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 10 Aug 2021 19:38:30 +0800
Message-ID: <CAJMQK-g9=7o750t4ZAyND7nqrRvx=tMqUs+-=1--M1CqGXvAdw@mail.gmail.com>
Subject: Re: [PATCH v8] drm/bridge: add it6505 driver
To: allen <allen.chen@ite.com.tw>
Cc: Hsin-Yi Wang <hsinyi@google.com>, Kenneth Hung <Kenneth.Hung@ite.com.tw>, 
 Hermes Wu <Hermes.Wu@ite.com.tw>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>, 
 Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, 
 Robert Foss <robert.foss@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 open list <linux-kernel@vger.kernel.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_043858_154264_3D9D3AB3 
X-CRM114-Status: GOOD (  22.46  )
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

On Tue, Aug 10, 2021 at 7:31 PM allen <allen.chen@ite.com.tw> wrote:
>
> This adds support for the iTE IT6505.
> This device can convert DPI signal to DP output.
>
> From: Allen Chen <allen.chen@ite.com.tw>
> Tested-by: Hsin-yi Wang <hsinyi@chromium.org>
> Signed-off-by: Hermes Wu <hermes.wu@ite.com.tw>
> Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
>
---  <-- Add this line next time.
Add the change logs below this line so that they're not mixed with
commit messages.

> v7->v8:
> fixed "checkpatch --strict" error
> remove unused variable *edid
> remove mode_set() callback
> Documenting the individual bits of the interrupt mask values
> change it6505_dpcd_write parameter from unsigned long to u8
>
> This patch depends on https://patchwork.kernel.org/project/linux-mediatek/patch/20210722062246.2512666-4-sam@ravnborg.org/
> ---
>  drivers/gpu/drm/bridge/Kconfig      |    8 +
>  drivers/gpu/drm/bridge/Makefile     |    1 +
>  drivers/gpu/drm/bridge/ite-it6505.c | 3333 +++++++++++++++++++++++++++
>  3 files changed, 3342 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/ite-it6505.c
>
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 431b6e12a81fe..e1afe171075f5 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -74,6 +74,14 @@ config DRM_DISPLAY_CONNECTOR
>           on ARM-based platforms. Saying Y here when this driver is not needed
>           will not cause any issue.
>
<snip>

> +
> +       /* Register aux channel */
> +       it6505->aux.name = "DP-AUX";
> +       it6505->aux.dev = dev;
> +       it6505->aux.transfer = it6505_aux_transfer;
> +
> +       err = drm_dp_aux_register(&it6505->aux);

drm_dp_aux_register() checks if aux->drm_dev is null. Assign this
otherwise you'll see warnings.

> +       if (err < 0) {
> +               dev_err(dev, "Failed to register aux: %d", err);
> +               return err;
> +       }
<snip>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
