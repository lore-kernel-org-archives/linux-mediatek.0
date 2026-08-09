Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC327C5AD4E
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2026 17:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8l7N5DEp4BhX7FXyEm1h5RGW0uDs9b178Mc0RCItNl4=; b=aKApaxgEO9hgP6gxJVz1w0kExU
	gxPKpWHBiWQKwoGL7In9czaD7Rl2fHw2MMRiB09sU0XoH7UOPiDCZeOCThWDihTst/LZFOa+eosp8
	LDF3tdUiCcF5fq97jSfYI8AchHCd+mypGamv5NdExuJQAyTaopWettObjcN4NpVjDOdXDlziEDDCj
	zHweBQUHCdIYgrS1v/DHVZJJr1IuFg72ON+AMB3vrn8/AHhH9lSdn42q2zfIpmdTiq+tx8eMpBfY5
	XyeuvMP7uaQ1hdx7SFl9GE7bJaGImiVL6e2O0TzNYtblBMHs7bfw49OyGqL7YViJAiwT8X4P8NsbJ
	O+yZc2nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt70V-0000000AWeH-1rdS;
	Sun, 09 Aug 2026 17:08:19 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt70S-0000000AWda-3PX8
	for linux-mediatek@lists.infradead.org;
	Sun, 09 Aug 2026 17:08:18 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-69c600f76ccso1304532a12.0
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Aug 2026 10:08:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786295294; cv=none;
        d=google.com; s=arc-20260327;
        b=Hk8RuVFbyaEbA0TQAVHe1gxhQg7Dkzeu340nqFWaFbCAjlbl2h4b7ugPH8SyIxWUrx
         p5U17KAqWlnTs4itjTaGvYvrLY3d9LYpfNoHqdsSlQx8a4zjMxdZEaK7bRfbXuPh9emU
         McaXF23vRm2dJTzqq/09oM7eDLDxStw8QmpnpC7M47GcGztdtYhBJwfi7djh3pXbwpU0
         D8UuQswmaVam0k7EFyLOIK2gzfP0gJONKQI7s2iBsP6qZureJ/73gxXqz4Eec1sTdwLR
         HA/4IxeZl1G/vYBZeyl/lyaS5B3jIey+sXoe0HtDl7e3NCIV5bskTIIUT3RH7YSt8fQi
         SY4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8l7N5DEp4BhX7FXyEm1h5RGW0uDs9b178Mc0RCItNl4=;
        fh=4RcNdqh1bqasO4dfc5aPAtMd0wkDyGXkP+HO3RTg5rM=;
        b=XR6I3J6SHLS/XdRCnb7W7tLoxcPf6mjUrx141L0RJJktglItz/CyXM9mz0Fqh5LUFi
         2KsNxjaXRXAb8rqfSq5IeE5tRyzYaUvs/GeRZCAQ0pumAhSGbGktLwdCUikfG8LDtXFl
         F96HzaCxcnb9+vBIPTneRhihyuQHP9ZAk+Ri2njrgMnX0F9YbPxoUMGDQBNqH/M0V5Vl
         toJnbbGWXeS8VRDA/cb6LAvyUvo5+mr08NWuSqClvOsNVsfgFn2IT/pD90Zv0mkbCGp1
         RX0k3vpP+pAON4o3ukgTnq3CiWSNcrJ8z7U92n5UTEDBiLyu0BU9ZHwjaoqKf+Wxg/cO
         N/6A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786295294; x=1786900094; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8l7N5DEp4BhX7FXyEm1h5RGW0uDs9b178Mc0RCItNl4=;
        b=kv0iVtakt3giXNd2jWnYyu3DkGnIM+gbd0mIsjAumdhJFYevQNKRZQ3ZjwqgHcu7oi
         ARfo1omPCYeIHwwbp5F+bnpcNME5kQLbx2sDEAHHIUChm/dVoqrcOEyxj8PSdDnQHNtV
         SOZNZxvzCTmVLa2ja3t5iihybHBo0anWQTqQNaRvQzhfKfcUnMYgZX+NbREJzgRIMyJw
         uTs5Jt2/UEv3xpkgTfUjFcuTQnJ3UFlH3qXRfKcqQpWL36f6wI3pw3XG8MiXw/M31JvA
         7n6kARkNdcJGtj9mZ2RhK39SwGJJlNArsqDNHg7m5Btq6dNDFHg1pZpd0JtgYBmGQzdr
         TWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786295294; x=1786900094;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8l7N5DEp4BhX7FXyEm1h5RGW0uDs9b178Mc0RCItNl4=;
        b=IkBMQbfOfeid6gGT9TBo+KQI+W1Px14zpzSX+DzE/keFgn/XuP6f73bSoadiJQ3tcl
         F/rFBM79lFGpD2HJVvokvtoNUWqVIyXpRN0YcVSOOazZbovYBasQRVTV5PvIRy4lxHhY
         dlgAsw8eotwgNr/NJOVDmVR8+vGj9/i3Ze6tq2sH9SDRJ4a2JcSTOKi1R5kE78W0PxH5
         Q7zY3GavX2JaQvQZhbaGwphV9YFP4zLPPOo+6x/1RY4dNdOviXPuQ5rk/AgKCi3SFDIp
         /dbjimjvIQuX72bsVHobyjW7pXk1OizWlgMvmh+Eruhc5VEJOr6lb2P05yH9bkGcyaYp
         8ycg==
X-Gm-Message-State: AOJu0YxGJyI+ihZMuKqGFp03knxydJUg9TOIhX3HRpORA/fjQ8ebSJpL
	QLxB2rVBMGJqYj2VmgwNNjfu1p0AilZod8Z1AWAfC8owW6MjMTFCiynhjrGS2wOb10XymzYqtdh
	RgWxPhGir1h2906js8zcM4lo3sdjQqA8=
X-Gm-Gg: AR+sD11leCDVS/V2uQgSFnL76U15uP88Wle3+Xc/x+myrUasTlldx1iBHoXGWpEmre8
	w/9M4U1HlbwRUbl4JPiovKkjDzZH3vFwHmrBkMa0nG0fXhx17/MX/+W1k1W8Fqe+RcLpfi4tZUS
	saSSX1D2yt5dh044jPMGypiXt9QFElJHxe3OqxzcUzh4re4jen90ddeGdJ1N+uv+K8hiTsXCwbf
	Shc3iTiGtzQ3589c3ixQ2YPWEC0IQLwoW2uJLznhUQBpagGWfzjzi0z6VgeftxgSIfprZtRRwgq
	nt2oXDAZYTQ79sHJQKxYVlfT6zza6KBVVktG/gTScskGBK6mT97utQvPUHB0OdJvJHPwNLGx4Tw
	=
X-Received: by 2002:a05:6402:52cc:b0:69f:cb2f:7a9f with SMTP id
 4fb4d7f45d1cf-6a1f24a6398mr5908345a12.0.1786295294390; Sun, 09 Aug 2026
 10:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260809160643.33991-1-l.scorcia@gmail.com> <20260809160643.33991-4-l.scorcia@gmail.com>
 <aniv5B4jz07mI70D@buffalo-ssd>
In-Reply-To: <aniv5B4jz07mI70D@buffalo-ssd>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Sun, 9 Aug 2026 19:08:02 +0200
X-Gm-Features: AUfX_myTNLmmUZQ4XLSt8EOVRxvsoxIzUMQsNPl9nlvxlnEuIvs9heC-YuaZVok
Message-ID: <CAORyz2KJMY6OvFQEB2GU0P7CkxothuXOCXgCcRvtiUhhPaK1ig@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] arm: dts: mediatek: mt6589: Enable toprgu reset controller
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_100816_891784_2AE1795C 
X-CRM114-Status: GOOD (  14.79  )
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

I apologize for the mistake - if a new revision will be necessary I'll
correct it with the Acked-by tag.
Thank you!

Il giorno dom 9 ago 2026 alle ore 19:04 Akari Tsuyukusa
<akkun11.open@gmail.com> ha scritto:
>
> On Sun, Aug 09, 2026 at 06:03:27PM +0200, Luca Leonardo Scorcia wrote:
> > Enable the toprgu reset controller feature for the mt6589 SoC. This
> > allows generating reset signals for the 12 subsystems managed by its
> > top reset generation unit.
> >
> > Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> > Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> > ---
> >  arch/arm/boot/dts/mediatek/mt6589.dtsi | 2 ++
> >  1 file changed, 2 insertions(+)
>
> I provided "Acked-by", not "Signed-off-by"...
> https://lore.kernel.org/linux-mediatek/amEBgRmQktZ44jc1@buffalo-ssd/
>
> PS: I am also fine with this patch carrying my Signed-off-by.
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
>
> Best Regards,
> Akari



-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

