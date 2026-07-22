Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD13C4453C
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2026 17:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPC3C1McKSdKHPGsEz7T2BULfXGeP3APrf619T65g/o=; b=syolvdvxorJSp6F+Y1Gdd7s9Ne
	HefVszK/uAgIZmzgJVjHibBb6U15xXHrU2Hn0ZNxfpLDIUNuRrA2QZf2e9dYVF73AGWooEINorDO7
	njJxaWl+fV++ZL4dOcL2o/X99OF9PeMoXZRf7otH+dAzJl3iYwl6l80F1RchAzV/Jw+x1YLQSWQ+0
	W/rVzWzUS5p114qjuEW+QhBbwpUQUtasy1i6nueyprnZ7JjR5e9sFpIz/Dn6XKeDFPPmvvpQ8T8jr
	PVE+xWr1L3s+bxz7+/64NgXICoIVeK1e+kS+IQe2waJ6TO3uWIpoxBd/TTj99PoqAg4sPauxnEqWR
	EzIKYiLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmb1t-0000000CVBw-1EYE;
	Wed, 22 Jul 2026 17:46:49 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmb1q-0000000CVB5-3oXi
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Jul 2026 17:46:48 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2cf452def93so34902665ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Jul 2026 10:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784742406; x=1785347206; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CPC3C1McKSdKHPGsEz7T2BULfXGeP3APrf619T65g/o=;
        b=VpHpr263V8+82GJJ1csTO0kapJLPNIjQRTKp8eiSDRQ0Na/aVVvurzvdqXUSbAfiRc
         8jr5TsTQKGCY75ayiJnQcX3rerr7WF/DysItdq4fsdVZXLAPvWPJ+Y4WGp5MeQpEfR52
         l3KFXrf6RMZQID1uBI/CuQMi3Wa60VhxDeHKAoJMeuZ8S5mgVxD6Lvgo7wxhY9ByOJPA
         2hPboIap7SoG6ic5yS6bTFrWcIhK4qNWYr57TD77N++XsEZnJu7RtdsB0DBWV78y3hlG
         jaDA+F5Wg4hSk1XZ6J4QHRh65ybsgCqgdOKquogSmxEtg2ENllk8lng4JJVnVG24D7cC
         eIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784742406; x=1785347206;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CPC3C1McKSdKHPGsEz7T2BULfXGeP3APrf619T65g/o=;
        b=HydEvryQGPC0OM0VVjZpA7O/NUOR6EoWBBfUV/Cug0sw2Vz6rBPK7cwEElpXA4Vr4H
         UTZcsiai5oMHunt9XDwAhiGuNyLOQCv04LM0VAW+XUEXaGqFzc9KFMDyDTplXMwMHiKm
         YEjQnrNoYWwTJr4wgpZbYrDoSNHZ2DW2zOvIei8uznAobSjZqghiIHUA3B8eSZ3H9H70
         71Um6pNCbcZLijElJKXoSB+leTPcEL9/WOXg8sVcZZ6W+8clYqF3McacqQncF2y8CTPm
         YsPBH8KQeKyRkT8rQ5Lnn6H1IuDRm2qkZiLwo471RiFJfkS2IvuZO3uAiRR2yAPbNL64
         gX1g==
X-Gm-Message-State: AOJu0YxoKhyfiDq0giQzqyPMMkQ78HG5tZKO2wM2EJvIZ9QrccU4k8T9
	NlBPdkhBus8ouT7uElm0EsvX7s0kPil3FP2ZgIzc0whOrcKkOKn2IM6w
X-Gm-Gg: AR+sD130gEfeSevht3ub/CZrSaaddVwvK6uyquJLlUZAC+2+dfNvhCaiI1lzOMsDRuB
	85+7nrKr+Wh55EJV53SK5PGVRRJuDAjoXsIIkXQQvBA4e/QrVJ1/06bltnAZq5lBakAyTnnM+nL
	diorfzKX5wvqmVizevyPADaPQ09AilYtrTQe1KO7I1Z9BNi92hLBC/7foEsEkQxb4xTXMv5pgJ7
	DlSIrMQqkwoYKpTe6idwwiOh1uyLhBIKWAfOZ/a1CAve6Cq4uQCvjoDbZc18Ah+dkKqEkJEzK6d
	6DYM885rKBUWaooI9DRJuK1+856odOaCxbJGtD94S6Z6A6dk7JZKrP5Ks7eF+PMdGFNHKLGRHkZ
	0jyEZ8aJ3wwR2qPBKQBUZU1dHFuQwScgO6kQkadhLFGnC21lAdPCZq4l2zI1ev1oTyeRy2hdql2
	kX8hgkSLDcnHt94nK/dkmF1nSViNuj22yzIg==
X-Received: by 2002:a17:902:f68f:b0:2ca:53f7:3c69 with SMTP id d9443c01a7336-2cf8dc9920emr53255485ad.9.1784742406067;
        Wed, 22 Jul 2026 10:46:46 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f386c68sm18445405ad.74.2026.07.22.10.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:46:45 -0700 (PDT)
Date: Thu, 23 Jul 2026 02:46:42 +0900
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/7] dt-bindings: reset: Add MT6589 toprgu reset IDs
Message-ID: <amEBgRmQktZ44jc1@buffalo-ssd>
References: <20260717151134.678839-1-l.scorcia@gmail.com>
 <20260717151134.678839-2-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717151134.678839-2-l.scorcia@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_104646_951912_BCB0D875 
X-CRM114-Status: GOOD (  15.07  )
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

On Fri, Jul 17, 2026 at 05:11:08PM +0200, Luca Leonardo Scorcia wrote:
> Add reset constants for the 12 MT6589 toprgu resets.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  .../reset/mediatek,mt6589-resets.h            | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 include/dt-bindings/reset/mediatek,mt6589-resets.h
> 
> diff --git a/include/dt-bindings/reset/mediatek,mt6589-resets.h b/include/dt-bindings/reset/mediatek,mt6589-resets.h
> new file mode 100644
> index 000000000000..ee08c39df513
> --- /dev/null
> +++ b/include/dt-bindings/reset/mediatek,mt6589-resets.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Author: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> + */
> +
> +#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT6589
> +#define _DT_BINDINGS_RESET_CONTROLLER_MT6589
> +
> +/* TOPRGU resets */
> +#define MT6589_TOPRGU_INFRA_SW_RST		0
> +#define MT6589_TOPRGU_MM_SW_RST			1
> +#define MT6589_TOPRGU_MFG_SW_RST		2
> +#define MT6589_TOPRGU_VENC_SW_RST		3
> +#define MT6589_TOPRGU_VDEC_SW_RST		4
> +#define MT6589_TOPRGU_IMG_SW_RST		5
> +#define MT6589_TOPRGU_DDRPHY_SW_RST		6
> +#define MT6589_TOPRGU_MD_SW_RST			7
> +#define MT6589_TOPRGU_INFRA_AO_SW_RST		8
> +#define MT6589_TOPRGU_MD_LITE_SW_RST		9
> +#define MT6589_TOPRGU_APMIXED_SW_RST		10
> +#define MT6589_TOPRGU_PWRAP_SPI_CTL_RST		11
> +#define MT6589_TOPRGU_SW_RST_NUM		12
> +
> +#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT6589 */
> -- 
> 2.43.0
> 
> 

Correctly compatible with MT6589.

Acked-by: Akari Tsuyukusa <akkun11.open@gmail.com>

