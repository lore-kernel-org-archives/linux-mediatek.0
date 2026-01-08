Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83150D1D480
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jan 2026 16:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dc6ScawRFQFrQUqCDUjRRKZdfrcmCO8h2beLP6+ws/E=; b=OSLtckZfm5dW1hsbowaPYTD6td
	KqwnEZ9QdbHs8esUOfgQheHgpm0sgYHG/1iOk7A5bklXGXqsSOpmmyHeJpn8I2f2R18wiRcsuTOiG
	cUk4AKMrPkzFxVi4lHlF7SsoTA1FgmFHeJQxwxsYqfdhKN/76rtCwJGw+cIQ8OcgC+PiAX0oIYCXl
	kboYZ3vHJ2fSiStoyxaxroPF+cbDC6tGVt5goTKC3xVM4XaJZBmuxao9R9gui7UgMan/q++fnU6xq
	EUfsGPN0QlXlAb4LsSmHIjhIja9is0esMxK8FUyqAipBMfaG/MxoQlWc3BeG1l36bFyIvIDuBN1pf
	JuOS66mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdstz-000000008ow-48j6;
	Thu, 08 Jan 2026 16:30:23 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdstw-000000008mo-1nZF
	for linux-mediatek@lists.infradead.org;
	Thu, 08 Jan 2026 16:30:23 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa4so2487589f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Jan 2026 08:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767889818; x=1768494618; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dc6ScawRFQFrQUqCDUjRRKZdfrcmCO8h2beLP6+ws/E=;
        b=e/ADq6IOfJ7g9L5yrCELRjaNRUyLACK6GEnJAgOJn7t73x2Xn7M/Puu5KJOoLs0YRt
         ziKhCn8gejW4/98tqy7AcycsqQ4M4aIcp3/koxrXcL08V7lyy7d39cOlFcmsrb7N8qUL
         0mg5tcHk7ZToUUNsCZLqVTPUfl0gnN8T8QHYJ3Icx8Jyhp+xuT2+VGY3zDeFCSxZmcXU
         kLUYQhK7VKqBLcHZMUMCTk5K7c5mC/omWTLrquxfwz9KrGD7Y9dQY5uWhNxcVbiYlhl0
         bU0rfIbELBIumLzB910ZUW6yWNHQLzMmC99eSfgtvASBmlR9R2mVEnc4EUVS4cswVeVb
         2SRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767889818; x=1768494618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dc6ScawRFQFrQUqCDUjRRKZdfrcmCO8h2beLP6+ws/E=;
        b=e9WfwiRVBKnvcmMtTtjdR6SlBdbD5p8P/O/cH2OdYgaYybDjlIFR0Xx1qiSqburHcu
         LJ592u2gREWg+pG/a8Ik3gW9mgU8J8xvAbI1IBe9UORUShA4/VdJg0vIu+vDdpj/yqjS
         OGkvM07TtBWUYCItusUxULVsrcaz+3Z8Ze4ML90182m9ipkeGwfXqeNGtaCTWSFZAQvd
         MZNLiT0MHefh/eVYRYWh4Ay9UVLZQphOy6O2pSVuIl/BHj1cE6hBSXsl7dLxuQMAlEM9
         JFRk92kN3CN9FsqVurPs3Ao9DP8NV/2/6OXM3mQ87Hr6XNzhMgEuWdcyVa8qEX0APazu
         yQxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiJm73Fe37WwOTFsuO02xK8VQzEFdbyHZ/3YYoF9SYNUvbYKp6dsT1fF+4YGnO7ViJEtjtm5UNz59UrT94AQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1fatiLhCFxyyRHHej4vRJjw7t5LV+6eRAAQmfkHzSqFv42wVo
	fn3pMg49OdGuFG4mQeIAW+zY/wNSLNovWDqXYiY12hIuFXlhyYOjFHm7
X-Gm-Gg: AY/fxX5oY1DEEqvncGrKUGWrg6d4+casaU3j7iNTYZOEFIWc/HQmYsC2wudHbCG6552
	i0sA8NlPRxokjd1nzlvlXTy6N47rjvR4/pyjLtt7b89VBlVe2Rf1EahBpZJco3ZeppgSdS1uTsB
	ElEXQNQIwZJ2b/WkjLtK6GLwZPBk2Ks1mBl2WxA/ylBEnQUO3NatIyrMrcusppDxl47gcVoI0p/
	0hRd33sBek5OPR23mN3pavOR14iEuhU2MiG7xmRTXHnsGQbynLLR8g6n780FxrDp7qbv8eL0h3p
	JBXk1K0pqAeRH+C5UpqRjP+jLpVBp0YrSLowXvkUMnE8eSPNy944gAjXtM/A8F2jHfxKyUkGvst
	SaeoC//53moWPB3oRR2Y+NLkijlLSk9/kBERuk8NkU1hzjIhI1OKN5yZu0SvMqyzC4r5rTgVlDa
	E/xXlCPjNIvMwXMpE=
X-Google-Smtp-Source: AGHT+IE4SajyDnRk2hr30qLnG3Fcgl62hbDw/YtWLnVk7GBUPLY+eK+cM4NcwzeY7S/EvSNq+LiWyA==
X-Received: by 2002:a05:6000:1844:b0:430:f7bc:4cf1 with SMTP id ffacd0b85a97d-432c377422amr9188459f8f.26.1767889817727;
        Thu, 08 Jan 2026 08:30:17 -0800 (PST)
Received: from owl5 ([2001:861:3201:3d10:f038:1f4:4b8b:647c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee5eesm17365651f8f.34.2026.01.08.08.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 08:30:17 -0800 (PST)
Date: Thu, 8 Jan 2026 17:30:15 +0100
From: Gary Bisson <bisson.gary@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
	simona@ffwll.ch, matthias.bgg@gmail.com,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: Add support for High Speed (HS)
 mode
Message-ID: <aV_bl8c3tMpih9s_@owl5>
References: <20260108101959.14872-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108101959.14872-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_083020_471206_378E623B 
X-CRM114-Status: GOOD (  12.17  )
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

On Thu, Jan 08, 2026 at 11:19:59AM +0100, AngeloGioacchino Del Regno wrote:
> Up until now, the MediaTek DSI Controller has always been working
> in Low Power Mode (LPM), as this driver has always ignored the
> MIPI_DSI_MSG_USE_LPM flag hence never setting HS mode.
> 
> In the current state of the driver the only thing that is needed
> to add support for DSI High Speed (HS) transmit is to simply set
> the "HSTX" config bit in the configuration register.
> 
> Check if flag MIPI_DSI_MSG_USE_LPM is set and, if not, set HSTX.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Tested-by: Gary Bisson <bisson.gary@gmail.com>

This patch was needed for the TI SN65DSI83 DSI to LVDS bridge to work as
it requires HS mode.

Regards,
Gary

