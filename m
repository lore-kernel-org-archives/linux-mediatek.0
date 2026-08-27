Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F57C61DC4
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2026 14:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H7NWHYQKU4joAJPyYxanKoDvZTJs0XozDUX3Hghfkuo=; b=EBqnVhHLUHHHoy9abKJHmHPq/8
	lJIBqKpK3ZS15aqaiOd95zIG7LxJIqo+rjTRJ4BLjxvE6bQxFzYJVrgOHcZWnnUFY+iRttbkA9mWz
	6/XmmgyxlLlGqR452OeuArjV1xDh70/a4awmPzd9AasVGdFzYY6mTglvTMizaDC8B2sseUDPzUc7f
	FHG+Fl/wEy+RYDxvw4BPtj7poW0v++fpvgLR8+o1oZiUw+N//E0y4RcvQ4rJxUAwtbLEMknRBAuTu
	JBuamGgPRv8ubY8PpiTFqNVBkHpD1VVeqAyL+lEiMaS32IUw39vZerBvpyFvfDZxKgCFoJmo5AGrH
	+2/RQ+nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzb64-00000004AS8-0RV5;
	Thu, 27 Aug 2026 14:28:52 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzb62-00000004ARC-1gNj
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Aug 2026 14:28:51 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-c2530cabcf4so249200366b.0
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Aug 2026 07:28:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787840929; cv=none;
        d=google.com; s=arc-20260327;
        b=gOa6hfq9IXHUr8g7+Prk8d1Lb1SimpI1Q7MOo3+/VnC+vzqoNIvYZxuXxvgtAFwpk5
         4hJKlA1b1v6H6rFBGIfj/0KO6rTPR7ctkoUBTyCLjJAjyYdvg3rUxqGo18xSLCi6eENp
         AzwRiFHHgXaCiQ/VIV9qlvZiuDvw2dmf1juuyPv+IRpg982AEdIqc2tv+FyNkN2oGH4Y
         ismlnyfle2lJm05rcGOoUqkkDH1P9A/gXxbWfsy2aJEEtBwCktC8Hy3AXPVmLl8SAvoF
         ek0zDAWG/JxqLlajHRaNzMZqGsFd2noH52+6boVInT02AovznQ+WX9pdUFzzDKAhWYcC
         mJWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=H7NWHYQKU4joAJPyYxanKoDvZTJs0XozDUX3Hghfkuo=;
        fh=FGCOzqW4oK7K8xS5EwKwlW8qFzyVhVsDXrbSpirq1u0=;
        b=HseZGw6KOFWW39NuFgiLBEGSMQTsaeBa9A5+Ta8Flhw05SsFeteao5tiT2aXg7Oy+n
         eM2AoaA69M68cXRMdhN/6G2OOL5C6pjw6WvcpGNEDQdlhyrax6+nw1FX2rJbpvfY9xxK
         s/j8j60xALaB7onZTzimEk1s1XelGKucloHZcGfC/g6S/aaaujcTLGwdivCZQD31rHAs
         HWMIJ62XwNRN4Vl+YmG0EdTdJB5hLHoYJs+gxOPi57gOz0sTMRDb6hq5hrEiUAICJjOP
         Ea01jR157erwoFdw65F2Atm0laXQk9QBYg/z5n7StOrhATNgvtfBN02E/WvNpPQ1ewSH
         EAOA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787840929; x=1788445729; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H7NWHYQKU4joAJPyYxanKoDvZTJs0XozDUX3Hghfkuo=;
        b=nQUmy+NUlB1zjUIFl7niiNr6lOMcga9QJY47CYQqOrkKFDSxc+sPpeBjE0gHS+Hrhw
         7s296KIdV3+XcAG2WbBe/kkUZOZIQmSXkQMSz5t0Q4UjYuFlur3WhvYCagh4pkes4XAV
         JyJ+ke9FyXT+GM1PHziYodfQZy3r/LA1ChcHjPak+3lzaiQTi3sv/Ykqh/deple+fhCr
         ajzyUz1iPSavMBVIM3FLz6lVKl2iGJIYoSSCv+wFkbTN2VMpMkG9GwZlUpzrSczmhGU+
         Z1zRdTQNbl8w+67eDhs6PVMiaRefW8DIo86nyYg27Qmb/PFUkCz7qPHeCi+2tlh9ke8y
         KUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787840929; x=1788445729;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H7NWHYQKU4joAJPyYxanKoDvZTJs0XozDUX3Hghfkuo=;
        b=aQ2vUVgd0IegXZ5ePtVJn6/ZcMG7/1IzYYS37Oz+QXbA6WdyYHJ+xr53EbrYOWNTMg
         48ssgzAnv0uKwhdlq40O3jfZ0A2C314kpHGhK4vxTVwwE/Mc3FGBJRwbGF7dUlQtAOb5
         SwYfYRPBcqDz1s4Cxj2dpadQNuzC6XkN9camps2TWhfVBTVpMcjieFTV4quRhxxrrpS0
         Uxcn1VKz4BaFU1I3kyjG9UD58D+bKphm/TFJlvvmo4LGUn8++yRxA96THaqRdELiXkqK
         4oyF+rb4jPKvOo85ONUi0AbcIXMBVpOJjSGz3K9bhCtLsLxR/2u52HZkirbQiATJX5yg
         RmwA==
X-Gm-Message-State: AFuF++kknk9a/lVdlwrgzAxldAuUk5qTgZS/QVFeKgneIFXjQIyWr08k
	4O+svHaWhiMfbdA6BtgupIYvIUpapqmTpLB7DxkCS+2MdveuCbp/oCplCowHVrQChpn6ZHZ7C9h
	J386fCAvsr5tNm9sy09/5j+78TWCbhbA=
X-Gm-Gg: AR+sD111BBjcr8AE/alaf6WA/AQvtwr0hAj4pYvY+gqj1FgFWBDAwDgtBMgWc4P2vKA
	qokIgcTIy/KUsQxb3h6LiJ40YCq3tr4/ne5xbtEoOijA+Nq6AtGMy5c8xJOUWpD6wupFSG+14Wg
	6nZ9y5nIpkfWOd+pIi+i12Geio4vY+WYJDBz40ylKnozlasueGazQj8cqk2QkWA7QQH2A4hAv3a
	UvY9lrSyVv9nZRFe7uvhbWoYcKge8NMNvMmXMW6T103MBi9LJvTe31NRF9pmSsXuv+B/vrxxzlw
	MUmhMP1okEkCYUCWzytjupLpXTPC7sQbJOaUCqb3lEc=
X-Received: by 2002:a17:907:e98b:b0:c15:ee0d:9a32 with SMTP id
 a640c23a62f3a-c250c2e545amr1440724266b.21.1787840928409; Thu, 27 Aug 2026
 07:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260819101853.44681-1-l.scorcia@gmail.com> <20260819101853.44681-3-l.scorcia@gmail.com>
 <20260827-clever-cherry-zebu-6a98f1@quoll>
In-Reply-To: <20260827-clever-cherry-zebu-6a98f1@quoll>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 27 Aug 2026 16:28:36 +0200
X-Gm-Features: AcwNN1WwMj244ofyHxGC6S8z0K_T3xrDTw62tkx0k_I8FGnpAKJxs0-SepEND74
Message-ID: <CAORyz2KCAzEEsCifDF4+_wKmi=M6t4EKVVqys-H5wOQqzBeVzw@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] watchdog: mediatek: Add wdt/toprgu resets for mt6589
To: Krzysztof Kozlowski <krzk@kernel.org>
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
X-CRM114-CacheID: sfid-20260827_072850_458234_6F76721F 
X-CRM114-Status: GOOD (  16.24  )
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

> >  drivers/watchdog/mtk_wdt.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> > index 91d110646e16..f8208fb0f723 100644
> > --- a/drivers/watchdog/mtk_wdt.c
> > +++ b/drivers/watchdog/mtk_wdt.c
> > @@ -10,6 +10,7 @@
> >   */
> >
> >  #include <dt-bindings/reset/mt2712-resets.h>
> > +#include <dt-bindings/reset/mediatek,mt6589-wdt.h>
>
> I do not see how you use the bindings here, so my previous comments
> stay. You just ignored it and never replied. In such case:
>
> NAK

The mtk_wdt driver requires the total number of available resets to
register the reset controller. This was defined as
MT6589_TOPRGU_SW_RST_NUM in the binding header, therefore the need for
including it.
In your review for patch v4 1/7 [1] you mentioned that that define
should be dropped as it's not really a binding, so for the next
revision I'll drop that define from the binding header and move it
directly inside the driver. The include won't then be necessary.

Thank you for your help!

[1] https://lists.infradead.org/pipermail/linux-mediatek/2026-August/112272.html
--
Luca Leonardo Scorcia
l.scorcia@gmail.com

