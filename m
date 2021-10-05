Return-Path: <SRS0=zM/7=OZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77D5C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Oct 2021 07:20:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A7D461506
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Oct 2021 07:20:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A7D461506
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DDAeOyW916+v/alAfIhwThXJA2R8/U8YtJxzHdePBy8=; b=Vr3rouqdjGUhpr
	6hEc17rNxC9QSspygizvTWK3Vj9/4tPaSeFfNjSKqXMnOSinJZ60qv6iKJonTUFWVNqIvD2+g6G1f
	huv+8+eEhndcOrlwUooRmEvzeVf8XjfS7g2ptcOrJiouCyRa3dsQ2s7IYFAvpgOkqMGhM3Tar9XvT
	1YuMbDkENRnJLN2GVqZllls7OO9bdYjg+PD5mxdtJHrBVMnMXqumglplyN2yFaRpMgYoPQPmv7Q9b
	SA89W6u2qWX8Dg7JgQm3nUT4mhgpLRrC9CcKjFhG0W01jxUMljh+Ewj6HLU1gyChNn041C/tNUP/K
	fl1O5r8BFkd++qSP2fDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXeke-009KTP-QL; Tue, 05 Oct 2021 07:20:36 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXegn-009IPf-4n
 for linux-mediatek@lists.infradead.org; Tue, 05 Oct 2021 07:16:39 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 g193-20020a1c20ca000000b0030d55f1d984so2035815wmg.3
 for <linux-mediatek@lists.infradead.org>; Tue, 05 Oct 2021 00:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CXY/HEJbVlXKwfPIEz9oTXRR73+zLVHYdLUDT3KYBYI=;
 b=mgu2vwTmGuRsaMFialQpSYafE/THN5LhwWwrUIgB6VIOzqMDcfTSTE47Cqcx5ShySG
 +vTs3z+SNhUUIKt9da009SoNWw4514ifoiFlMLHfEpUYwDXVILBCJnelP1WX0WD71bWN
 wlh/QdWLnejFp5Q4o+2JwUHIkJTWcPgeE8ZLwrEWx6zW2ZGTIIjF0ybqw6yv0kcgiR51
 7aqjkc3Ke51QmFAnBQXivl/w5tEo1LVeAtrKnhea2GjjPuhGzbnA2Ou6sfNYpDx0fko1
 BEXYum/1h7KP7s2mZXJF+4KfRXTaOnABMw7sm7PzA6uVoa5/dPAgVa/2n2ha4EJkkR7e
 fyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CXY/HEJbVlXKwfPIEz9oTXRR73+zLVHYdLUDT3KYBYI=;
 b=EAybZDG7Sgbk5qawgKPT6/na6AFKKRO0trOCGTAE3p9BeO1GcEaq3BFD6SbDexb7G5
 B1R9KrhuMbDHCX+BLf5Ho5hT6hjrr/uVJdG2ZFy9LK+ZetD3EgmePvx4VVKq29tzxLeZ
 erb0lfcjcr8g9E13U07SH7b9thef2SepuYR91uqqQ9kzUdLxk3Ghlj6UZv/7r2WKp7hn
 rp0EC7lQ1qXY8d/20A9MlCSKXdulmFfOxfGKzb9oAGck6C/oC7lOB0znPwJlrL+ABAzC
 bdyubfh6vWE6Ph15sBmcI8D7CcD3CGYEHHPif6C0vzlzDkkSz3eSGNjUYJN/a1J5HlUP
 uKzw==
X-Gm-Message-State: AOAM531v/J+vtTnC0gVCd2+u9WtaQ5fDJkV3GMIAbKzhm5vowBV07jY+
 3QV8Y/q+SqHYshP9o6aAQl4aRC7GwINz5Q==
X-Google-Smtp-Source: ABdhPJzaUsAGcej6QzdUPEhfKWYYSe1/l0cFZEWN/ELzTVU1K5vN2jMbP58homcEWk4eLuwawKN0Kg==
X-Received: by 2002:a1c:ac86:: with SMTP id v128mr1683990wme.3.1633418194608; 
 Tue, 05 Oct 2021 00:16:34 -0700 (PDT)
Received: from blmsp (dynamic-046-114-035-189.46.114.pool.telefonica.de.
 [46.114.35.189])
 by smtp.gmail.com with ESMTPSA id q18sm892688wmc.7.2021.10.05.00.16.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 00:16:34 -0700 (PDT)
Date: Tue, 5 Oct 2021 09:16:32 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 6/6] drm/mediatek: Add mt8195 DisplayPort driver
Message-ID: <20211005071632.impnpix5f26xxxii@blmsp>
References: <20211001094443.2770169-1-msp@baylibre.com>
 <20211001094443.2770169-7-msp@baylibre.com>
 <CAAOTY_-+T-wRCH2yw2XSm=ZbaBbqBQ4EqpU2P0TF90gAWQeRsg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAOTY_-+T-wRCH2yw2XSm=ZbaBbqBQ4EqpU2P0TF90gAWQeRsg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_001637_289017_A57CF81E 
X-CRM114-Status: UNSURE (   9.48  )
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

Hi Chun-Kuang,

On Sat, Oct 02, 2021 at 12:16:26AM +0800, Chun-Kuang Hu wrote:
> Hi, Markus:
> [...]
> >
> >  drivers/gpu/drm/mediatek/Kconfig       |    7 +
> >  drivers/gpu/drm/mediatek/Makefile      |    2 +
> >  drivers/gpu/drm/mediatek/mtk_dp.c      | 2825 ++++++++++++++++++++++++
> >  drivers/gpu/drm/mediatek/mtk_dp_reg.h  |  535 +++++
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c |    1 +
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.h |    1 +
> >  drivers/phy/mediatek/Kconfig           |    8 +
> >  drivers/phy/mediatek/Makefile          |    1 +
> >  drivers/phy/mediatek/phy-mtk-dp.c      |  218 ++
> 
> Separate the phy driver to another patch because phy driver would go
> into different maintainer's tree.

Oh of course. Thank you. I fixed it for the next version.

Best,
Markus

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
