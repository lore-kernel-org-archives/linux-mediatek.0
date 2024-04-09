Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8466CD1296
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 15:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wtt9U27FyEOGR2UTmgVGfK4xgQEk5CAqsjVixP3DF/w=; b=0uU8PWxX7nkuFzMcXJ7EBnq+7q
	tlGWrb1z1MLZhzeQup3FOxkBbL1Hnoi+lwFQaih1+jrf600AlzdDKHTsOzQLVFOmyB+be8VcXbeBr
	pGkp8tQSk/kZy2aaahROGUpyaMKqwA0Y1TJkfth+BHvPU0VvMru/VIyUn0HGOLuFtE/j3rYP34XS3
	PqrEBIObi7PLzc5lh1uMNfMaUM9c3S4WLyq/+aKs3seTOM54rZqsIvtS1EsH7yndPcrJtuID9Uqz7
	uic4f+bFzXEZzmpVq0fXnadebQ4e55qUmLDTID/CcQVDw0V9GqrbjB20PirvcZA+dpI083+5PaDm2
	tF69zWRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruDGm-00000002ftt-3ZqR;
	Tue, 09 Apr 2024 15:20:20 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruDGh-00000002fqK-0Wxa
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Apr 2024 15:20:17 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-516c97ddcd1so6688047e87.2
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Apr 2024 08:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712676013; x=1713280813; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wtt9U27FyEOGR2UTmgVGfK4xgQEk5CAqsjVixP3DF/w=;
        b=a9sepSMfGx7qEYnSz+W/D9fKjohQf6d+W2G/gA8hUYCsk5v3YZ5ABx55HZ7w/DlA78
         DmgWblcLysMKjjVuPv8ERlP2/S8GiR7IKx61nsAmvvgcYlLHHdKjCA2gmGwS6fDadmZg
         xZfx3vmDwPES8rI85Vzel1hqR8gZGsEypP9f4O/trdNfbL1VmdurfukdI8LqItfFhvse
         GZ+HCRPQGh2x2KaKJqnxPxlNi7tYpuBIJ2/OF5bZtHgIU8IIIN5b2D6NKUXp7p11gjxt
         TJbaqpMuSQ+MZgSiIajrsc9fLKIRuC3PtK0QZyIknLT+lveNQszfkVAPtqrn2LsyQ0c/
         deZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712676013; x=1713280813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtt9U27FyEOGR2UTmgVGfK4xgQEk5CAqsjVixP3DF/w=;
        b=odu7XFXvlv51OcfVr5Lzyr0TBlhXl23PpG/PtB6rgKiM600IZPO0f6tEEB/2rqC195
         JWtdYxP0xtkX1lL9mYqM5Y28WnbX6T7iPdsxYLeP1431zRNfUW8XqFq+4YrsqOJwrsdG
         ci+b4NSaQYcamHJl2Kb32dc045TqYNthZCVfjiDYotZeQdGUm4lfAKSsGgf26FDnzzAb
         D7rvFpUXw2lmAgHfmh55RBPgE5cnye75ypaXNiNl8d1vzvtKYZdD7WI6RqoR/5VQLqxu
         vdOtcohDkWFZx+quQOSYIyNOA7qSRevBi+OOXC+Kh2o7bFYfRIyjTkYsV46utwbn9pXx
         GSDg==
X-Forwarded-Encrypted: i=1; AJvYcCUxTCoaFXleBt2FxlUhtPu//PUiplRoEOrLKDCBkQoxK1dmd1G8FFGW0+7uQQvdNFWcndHg9eba5fl7Cci2SyVZW1OcStIwGU1RxSsCKF7gqq8V
X-Gm-Message-State: AOJu0Yw6Ud4aw3ulSRQtlsaitUVK75Fud4rZuwKk2VVuipXgb2hz8X1z
	J+L6pZl90iQU7RYbyurZ78O/Kucljo7H5UTjuCnnEJtlEJX+8tq9Sj3T+r/Dbc4=
X-Google-Smtp-Source: AGHT+IEbgIn2OIRwkwITVjmw6EZrqXvH3olaMg8+cdnia4vD5koE/fQGisCSUgSYQbVCEURGO7OVmQ==
X-Received: by 2002:a05:6512:459:b0:513:c60a:5fc0 with SMTP id y25-20020a056512045900b00513c60a5fc0mr7405646lfk.0.1712676012907;
        Tue, 09 Apr 2024 08:20:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
        by smtp.gmail.com with ESMTPSA id d4-20020a196b04000000b00516c247fc40sm1560288lfa.222.2024.04.09.08.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 08:20:12 -0700 (PDT)
Date: Tue, 9 Apr 2024 18:20:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, matthias.bgg@gmail.com, shawn.sung@mediatek.com, 
	yu-chang.lee@mediatek.com, ck.hu@mediatek.com, jitao.shi@mediatek.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, wenst@chromium.org, 
	kernel@collabora.com
Subject: Re: [PATCH v2 1/3] dt-bindings: display: mediatek: Add OF graph
 support for board path
Message-ID: <oe75tx35rd27r2a24ofdxfaqwr53tylfp5fwz3nrwc2uz6nmrs@vwc2krbpy3fh>
References: <20240409120211.321153-1-angelogioacchino.delregno@collabora.com>
 <20240409120211.321153-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240409120211.321153-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_082015_473435_A013E0A0 
X-CRM114-Status: GOOD (  16.08  )
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

On Tue, Apr 09, 2024 at 02:02:09PM +0200, AngeloGioacchino Del Regno wrote:
> The display IPs in MediaTek SoCs support being interconnected with
> different instances of DDP IPs (for example, merge0 or merge1) and/or
> with different DDP IPs (for example, rdma can be connected with either
> color, dpi, dsi, merge, etc), forming a full Display Data Path that
> ends with an actual display.
> 
> The final display pipeline is effectively board specific, as it does
> depend on the display that is attached to it, and eventually on the
> sensors supported by the board (for example, Adaptive Ambient Light
> would need an Ambient Light Sensor, otherwise it's pointless!), other
> than the output type.

With the color and gamma being in play, should the configuration be
board-driver or rather use-case driven with the driver being able to
reroute some of the blocks at runtime?

> 
> Add support for OF graphs to most of the MediaTek DDP (display) bindings
> to add flexibility to build custom hardware paths, hence enabling board
> specific configuration of the display pipeline and allowing to finally
> migrate away from using hardcoded paths.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

-- 
With best wishes
Dmitry

