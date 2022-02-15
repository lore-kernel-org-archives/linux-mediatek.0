Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 538D3C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 12:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lChLkALpk4+ehRd+v1bLvv3PQbZHdevfgoLHxCol8vw=; b=TWdI5SAC+iX9qO
	ipukceAdjbivO5GGKsomAoaEsnz8DaicAvgISYutdK2HgFhuQu7gFMVVlRw/M17Y5Ei1xKw4U/L7t
	lo9A5TT2c//LpfG+kFqClcx7MNG8ruSUgOueXyTSX6PVMroiH2zNxWr/x+Ew1VIrk8KTc3q2LsHNW
	kMKNf/CROC6GIOKWus9ycJD+gYiSWHeYjf+Ua2GhB/oodUVLavkbYD+2pGA1el5zV5CJLqAk1RvUX
	Q13zOAiBDRfuq5x8tiilsvr+5TDa3TDv5D+F5o0p+u4Hmv6+gHEZmBmU3nxV9Mxt8trUTgovpBx84
	jZCaL2XqasHjkKlP+N+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJwZj-002dnc-Hu; Tue, 15 Feb 2022 12:04:55 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJwZh-002dmS-28; Tue, 15 Feb 2022 12:04:54 +0000
Received: by mail-qk1-x72d.google.com with SMTP id c189so17019660qkg.11;
 Tue, 15 Feb 2022 04:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qbnM1QziU/XSffVJX+bwaVuJwYnLnX8GCs9DF4EaXsk=;
 b=GBMqnSHarXC8GjklagRkyGCCCF9Vo/+51OFuwdd5ApKg9dkW3pSkUxe1+Er9Afky6v
 Mh2HJsmInn/Y/1pqwHTcBVDt66gJ/n6NdvbagUwpaPDxAvKcWYOAGF9eJPUNFVcrRXtq
 xCSE7P90lHDA1hG1rhBhFZGiFUdEZBw1BFNdSm6I9ARqcXxZutmsu9NurMbQf2X083rl
 9+kUZoxTiRxt6xCjAn7+Jb0RJO2hrZ27eujcuFSoIqQOhf4xU+BWknVKr1J/HQwRZh/a
 e5YQ7kDjPYvpT1sVr1H0+hd9UeSzNdxElh2nZKmTnlIU4cYZGHUOmV3CekLD9/CDG7mk
 a3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qbnM1QziU/XSffVJX+bwaVuJwYnLnX8GCs9DF4EaXsk=;
 b=TEL7p7Q+VpmVg5RpyN9W4A0msr81BJBTf7CVMkfZ7lhDi0UjaoJGe8au3+nPaXJgUp
 fZgPljafKhEVNBk3BFc+SRkOcLw/x48Kj5QntcROg9Pygt+eTGKifwuKDLrosRRQ5XIt
 zdq/m3AUXY1+S+F0tRFOJTOAa+PClHVgDUpnKtUawu7EQa3wCXNlrX44iajOM8xjPnf4
 UxJDGoYKN+IwsGyB1LGvxBeof4+luw9u0uUP/KdZrg01AD7Ow7D3SaYq5Nb6Jm1sLCbt
 F5nyrD6D2AgSBdJt+5uFQFEbvhgh8J6z73z7YQTxmXVPWHzaAVD6L8dqs+1bGNkbmh2t
 33Kg==
X-Gm-Message-State: AOAM533ovfERruzfKhNhmuUyPUS/pNSfABvXnPbPu3t8aV39kWXuiwxY
 dBiHDDAI3+yrVLqSdCusplxA72Ezr5/oeOZHD+4=
X-Google-Smtp-Source: ABdhPJxFzThI9yJ6WQ5YwMfuHeghHCKy7MGmGIpj5Bk2cqTfQYGSL/bhIOpU56LzBlNjDXYJ7jFaFlTkyTg9FfzELMc=
X-Received: by 2002:a05:620a:4048:: with SMTP id
 i8mr1689174qko.482.1644926690999; 
 Tue, 15 Feb 2022 04:04:50 -0800 (PST)
MIME-Version: 1.0
References: <20220208084234.1684930-1-hsinyi@chromium.org>
In-Reply-To: <20220208084234.1684930-1-hsinyi@chromium.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 15 Feb 2022 12:04:39 +0000
Message-ID: <CACvgo53u01BK_D0ZssV+gCepjxSz23Nr5Dy1qXeaAoJuu6VCFQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v8 1/3] gpu: drm: separate panel orientation
 property creating and value setting
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 devicetree <devicetree@vger.kernel.org>, Simon Ser <contact@emersion.fr>, 
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, 
 Alex Deucher <alexander.deucher@amd.com>, Rob Herring <robh+dt@kernel.org>, 
 linux-mediatek@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>, 
 Harry Wentland <harry.wentland@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 LAKML <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_040453_125019_D6F735CC 
X-CRM114-Status: GOOD (  17.34  )
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

Greetings everyone,

Padron for joining in so late o/

On Tue, 8 Feb 2022 at 08:42, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> drm_dev_register() sets connector->registration_state to
> DRM_CONNECTOR_REGISTERED and dev->registered to true. If
> drm_connector_set_panel_orientation() is first called after
> drm_dev_register(), it will fail several checks and results in following
> warning.
>
> Add a function to create panel orientation property and set default value
> to UNKNOWN, so drivers can call this function to init the property earlier
> , and let the panel set the real value later.
>

The warning illustrates a genuine race condition, where userspace will
read the old/invalid property value/state. So this patch masks away
the WARNING without addressing the actual issue.
Instead can we fix the respective drivers, so that no properties are
created after drm_dev_register()?

Longer version:
As we look into drm_dev_register() it's in charge of creating the
dev/sysfs nodes (et al). Note that connectors cannot disappear at
runtime.
For panel orientation, we are creating an immutable connector
properly, meaning that as soon as drm_dev_register() is called we must
ensure that the property is available (if applicable) and set to the
correct value.

For illustration, consider the following scenario:
 - DRM modules are loaded late - are not built-in and not part of
initrd (or there's no initrd)
 - kernel boots
 - plymouth/similar user-space component kicks in before the
driver/module is loaded
 - module gets loaded, drm_dev_register() kicks in populating /dev/dri/card0
 - plymouth opens the dev node and reads DRM_MODE_PANEL_ORIENTATION_UNKNOWN
 - module updates the orientation property

Thanks
Emil

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
