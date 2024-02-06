Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4498EC48297
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Feb 2024 14:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vXiKICFUMp4cupYFDlAs4KtUHT8wkU7NDkai+RaSVpk=; b=p3PavP0zEJygpg
	uVNsWmamT2CMXGcg5KhYFU1ML4h4MM0wSz3V2EdYBjK3LsGnccxuKur6Sacz52eHzCpG4vjoMAcar
	fQ01uXMmNMAHhPAzTgnROntFrd1WpP0xIp00TIdnEDkS/d7OZpwlm/Xr+v+arDNLxokz001A0upp6
	rVQznm2YHyq5WmGVjS62zTQEmRGYPQCqTopmJu1yaugLZrW0uXPYq1Nb6BqeHZr5moefDkkgqv6SN
	D3e7XahtqvQBTrY16S6UQMMJE9SP3eqzw7AHSisqDTrQwrs1LRtkdAhKJSIBC0NLKRzSlXWB+OuCr
	kDwgMTSAqTRcDgqgVnjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXMnc-00000007w4y-3BYC;
	Tue, 06 Feb 2024 14:51:48 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXMnZ-00000007w3U-1whS
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Feb 2024 14:51:47 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a26fa294e56so117019066b.0
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Feb 2024 06:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707231100; x=1707835900; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vXiKICFUMp4cupYFDlAs4KtUHT8wkU7NDkai+RaSVpk=;
        b=ff9QIu3TDQFbyw1Ma4qBtzdoKMAYF+dhQyHl8IuUahrIJWzsgsBiq9wk4NJil/QRpY
         dyI7QOcNT1bL9JXbWef/54NHKgHdPLVxKm3QWqg3o4/wPckuqqc6sbLN8C3tH7O0G64P
         4ycxApuWe/OXs5FUOXyZsQzeGTZLLOXPbVP7VnC2qqRtcZaFosBlofK7A3GSRQsBtAuy
         b0TqwgkEbNglstEC25/Z7eJJHauQOnMs3774LYQIH3SyheDJk2DMN7mR3Bbf0h3IkP7D
         hzor6rjqHOx52ds2zSVpot1vT7Xf3xcvz++6gtn4lvEvWTYcd6wXt2DRC2P8BL0XSwff
         QtPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707231100; x=1707835900;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vXiKICFUMp4cupYFDlAs4KtUHT8wkU7NDkai+RaSVpk=;
        b=A7JUMZbyeC6fqsdVgXBjY0CNWvhgHXobRr63oLItV9Sd/bMhFYZi682ebyEX7D/1s5
         dnz813pllNFtq5uRWnhuOovbu70U7nmZOJK7GOY1Do4Zbx4ctI7HXFENeC5bor1U/8yP
         TRhsN7wFYTnkcmLPNUDHuerqHPsGVC5UVVLE2erB8szBj2b9fmgSp/KDgJK9IhdXj20h
         7jHToDD/FgWB9QFddf9QjLDguaC5KZLa2+Un3zRcZhl6yM8YDt19wFq/MQTjljdm9Ia8
         QLHBK/gU9AP86TIxOTlu7qvEI+ZXocS0YIUX362O89MN6baMtCIlH1J3G7rrj3Hrx29D
         lgvg==
X-Gm-Message-State: AOJu0Yxk1rxfcCLFPSk863ejUXy7X0tANzO6Kl+IZFVL8ep5hOX3IhAJ
	4m8RdR5R7JbUfxCT7gYnwUM3NDly3MoWQhL69xMabgakp/8IyRh+yiZh2RKQJI4=
X-Google-Smtp-Source: AGHT+IGk/qAzmQdexrg//Spd63iGrgIA/GzcXA+iMKVhkBJiYtjxKIuf/ZU7NrSaSJk3CzFARyyORA==
X-Received: by 2002:a17:906:b30b:b0:a37:28e9:bfdc with SMTP id n11-20020a170906b30b00b00a3728e9bfdcmr2112593ejz.27.1707231100398;
        Tue, 06 Feb 2024 06:51:40 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWTqHSLrCXjFvE9Ul/QpJL+/GDuRyHitBIP/6fB8Teb21BawmrIMsaAkLtWbVD/1fuSeIp4tnlbj1FlEtNcsDjBZBuuCxRpdqv4Rbw1/0BlH1POEjjfMjbqqmc8pZcg5l1hc8E3Y0DpZ3vMXowY0gRoW0vRDePzr22Bty2PWPDkN64BgBK3OMnWBmVknsdGSzEGWt+mpapQ2N17qgZ7G3cNyo2+dEAHJ6Mwd5OAsWe/leT2nGe2b1wabbjziFMgWfjCwtt3GvX01vw69jTZwI1k0Z9gBLQcK4flOn3WgSObajdEcI+/de7T99EmBurySdMF9gt+e9F5hChjCaVGU5FHGgcqhp9MjWxHSnc35kUR9mKHW8UZg85Vyvx70N1RZdzt5/buyVJnjycYl1OTgtZ/SC83U1f4QQ2bSA==
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id d20-20020a1709061f5400b00a3785efe1c4sm1231091ejk.85.2024.02.06.06.51.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 06:51:39 -0800 (PST)
Message-ID: <06d0f56f-c27f-4d6a-9a88-e2932de29bf3@baylibre.com>
Date: Tue, 6 Feb 2024 15:51:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] drm/mediatek: dsi: Fix DSI RGB666 formats and
 definitions
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20240206120748.136610-1-angelogioacchino.delregno@collabora.com>
 <20240206120748.136610-3-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240206120748.136610-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_065145_534272_374E22B6 
X-CRM114-Status: GOOD (  11.74  )
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
Cc: p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, daniel@ffwll.ch, matthias.bgg@gmail.com, kernel@collabora.com, airlied@gmail.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 06/02/2024 13:07, AngeloGioacchino Del Regno wrote:
> The register bits definitions for RGB666 formats are wrong in multiple
> ways: first, in the DSI_PS_SEL bits region, the Packed 18-bits RGB666
> format is selected with bit 1, while the Loosely Packed one is bit 2,
> and second - the definition name "LOOSELY_PS_18BIT_RGB666" is wrong
> because the loosely packed format is 24 bits instead!
> 
> Either way, functions mtk_dsi_ps_control_vact() and mtk_dsi_ps_control()
> do not even agree on the DSI_PS_SEL bit to set in DSI_PSCTRL: one sets
> loosely packed (24) on RGB666, the other sets packed (18), and the other
> way around for RGB666_PACKED.
> 
> Fixing this entire stack of issues is done in one go:
>   - Use the correct bit for the Loosely Packed RGB666 definition
>   - Rename LOOSELY_PS_18BIT_RGB666 to LOOSELY_PS_24BIT_RGB666
>   - Change ps_bpp_mode in mtk_dsi_ps_control_vact() to set:
>      - Loosely Packed, 24-bits for MIPI_DSI_FMT_RGB666
>      - Packed, 18-bits for MIPI_DSI_FMT_RGB666_PACKED

-- 
Regards,
Alexandre

