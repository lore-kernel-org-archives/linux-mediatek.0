Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A788A606A319
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2026 15:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1/Sd2pDz;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=aKzvdfuh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2T7x52CfJh7PTM89ij+e5+OFtjfOrYsnGcRAlxn/5p0=; b=1/Sd2pDzUh6oWrLxMNHkNJblGH
	9geQtmUL3xGUc9cDo9ehzkmYXnHFn4HgVLBjRo+S5+mk0iZYuTfRhyTunRtq4ZkOF/rdC79y1E5UU
	dqkX1RIqPDI12aFXIvurgaXbntGYwguzp6j9Gc75Wp1KdMbGWMzM+x/O8bLJ2yuypf+yMmj1QuBTe
	qekeyfCao0M7ugFxdzCIol3vrr9hBtFyUgWkyYaNMGBXziJCGVomO+UWaL58L281UdE30wE+DZO+u
	P5xcKycwCbl2gyhtM99okFFOoXIBYKIedgKSwQUtld3oxJnRe6d9CB+gDU/GgdziEgrjV0JQ1ijW8
	9F/hQMcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJYJa-0000000CGrk-2HsX;
	Wed, 21 Oct 2026 15:33:18 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJYJV-0000000CGpu-3JOu
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Oct 2026 15:33:17 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso11639655e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Oct 2026 08:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792596791; x=1793201591; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2T7x52CfJh7PTM89ij+e5+OFtjfOrYsnGcRAlxn/5p0=;
        b=aKzvdfuh4Dz2Qc8fSMb5+oObIzLB9ydGQe5WtaAJHx8XkRnTMp9CryG1L3QatFdB7X
         hMRBYP1+OCyLvSayeO8jH91e7OQpuB8XYwPhQ+/qyR22FgcQyOE4ZTWw4nRiRq6YHrbY
         rlDJ3Hdcymo2CckYIuCv/wzR3+yxOurTVr9c2DM8naotCX1twwM7Zf20Qhlch5VZTWFZ
         hODkJwW2WLadMwr866crBhUlRHyc4rIsIZmrjBXfCvqa4edug+3GhjhHXKo6+Jm7jYlM
         1F1OyzUMvg9Eo2Sid5LQwNwBCbf1uKd58uqTx5VENw46GDrRwsV8wQQ7Ww6IF27uInM/
         qKyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792596791; x=1793201591;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2T7x52CfJh7PTM89ij+e5+OFtjfOrYsnGcRAlxn/5p0=;
        b=VntHtZEFYBxaIlroXthc634K3seSTYXUkhRn395gTVzI5ASX4nmqmJewx8nfo4M5Hf
         m+ikKHiMY8EX8O68c7bJGgbzfDSlud42Jehlsb9TonI+/91/P1v+jVU41yzJM2y+Kv9H
         W5r3Mb7PSQh5w8H1G2crGw+f/etbW8pYt6jyOXv1TuosA0ky+HYtlXfSZjLdwH8q9+Nn
         Uvcx3SV/7kwG1DFCh8fwZhkJ8xVl7fqG43UBulI+jTitXBjbQYF4ZidoGu9flTDp3Qvu
         /wLQ9FuZOg1RP2O48DmSlFU8JF9cwC9VA8mhAsy8FKHr3U819nxNw2W9XDAbX5mZ+cYh
         V9AA==
X-Forwarded-Encrypted: i=1; AKwUvBxQBmbivwbNl1hou06Z6El9LYvnoFzJNRX4I0ELqXTL5Xis6Pk61+yBr+zntVewyQ3qZqVZe/phpNfXTC+AKg==@lists.infradead.org
X-Gm-Message-State: AFq9FYL/GmRu/kFde5SrezAWL7wNCclM4gNz8lh0igJ0PTerGLaxJvgv
	lqQUuipBdP+IHhmz5kkIWpoV5jfsQk9NjOcTCtYTlJgxOI0pa5+WextkXPPYSSSoPaQ=
X-Gm-Gg: AYBFou0hTkl5iBnXxb212htZ5D6J4Ewip0jq2BV1lkYs96IfUNsvD19OdzasBBcfiMN
	ghcm+aGsA/FsIh/Dnpx76N/t3/YcmAN2WrXHvAeCNCV+m61w6OD3qxCYSYr+mUtRueGFh+2gfbq
	XcdvvRiEgWVXn523Rymu/dhXJHGHxcCTLDRMAVIUERmCRRAV0nmj9JnMajlWBrhcUUG24U84EPo
	Th+rBv/WFEkkHbnpANT/0Clmg2U/fY+zvE/Y0dNxZMsnwxiPeNMfdujPC73Nk3r3dXLeS/zLAVj
	mlr0btwTQVvfgkJ/MDKagiG9W+2RS5Y9aUPqS5tsDuN2nZFi0KGVw9KBEQ1woAptPnXKZqLWHwW
	djgnubmtzE7FLaD0bSHbvyOsQ/muUl/13tLg3emC7GOzkZql/HZAKfR2oeaviENiGh5lBTpUAxk
	sT/1Bhi48WihRhVJu4m+rYXUBFG2pCtnlSf54HMS6XqRdrQqKUsEVxRJCfxtxn5f8hO3RLG+d/8
	pIR2FVqBIMkzA1UzJhq07qAX28ZBwHltp0HWGAvgJ30922FQLobKauMUPoUMlOQb44rx3T5n7Nk
	u1rhXnaGoztvK+h9VkhSN9gTA7uZtB3ZFTN8lvHVECkBEpgm9FkGEAdEvNM5bD36Ww4kaA==
X-Received: by 2002:a05:600c:3b17:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-4a1fdd31aebmr56977285e9.16.1792596791483;
        Wed, 21 Oct 2026 08:33:11 -0700 (PDT)
Received: from macbook.homenet.telecomitalia.it (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc0b42bdsm59333825e9.0.2026.10.21.08.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:33:10 -0700 (PDT)
Date: Wed, 21 Oct 2026 17:33:08 +0200
From: Carlo Caione <ccaione@baylibre.com>
To: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	David Lechner <dlechner@baylibre.com>, Julien Stephan <jstephan@baylibre.com>
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8390-genio-common: add boot
 phase tags
Message-ID: <atjbCWF1OU1c-Vtt@macbook.homenet.telecomitalia.it>
References: <20260730-ccaione-upstream-mt8390-bootph-v2-1-82f67feadf7a@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730-ccaione-upstream-mt8390-bootph-v2-1-82f67feadf7a@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_083313_830256_885C9399 
X-CRM114-Status: GOOD (  10.32  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Jul 30, 2026 at 10:04:41 +0100, Carlo Caione wrote:
> U-Boot SPL runs after the platform DDR loader has initialized DRAM on
> the Genio 510 and Genio 700 EVKs. It needs the debug UART and eMMC
> controller, together with their clock, syscon, pinctrl, interrupt and
> watchdog providers, to load the firmware FIT.
> 
> Mark the nodes consumed by the current SPL configuration with
> 'bootph-pre-ram' so that the canonical devicetree carries the boot-phase
> information and bootloaders do not need local overrides.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>

Gentle ping on this once more.

thanks,

--
Carlo Caione

