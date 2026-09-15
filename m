Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0C2C88E77
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2026 10:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3n8Dt8JvPMMO8BuW7lqztk2z8qFFdCmvnz/BIiU4i4=; b=CF4bzgi7eHWLL5dL5TXPQSOY46
	Hftwwlig00zW6jhaLZKqFaQcYrDkrZl5ElFQ3iwGCWPi6q+VFCdR741QzXWTIrICCLgIp8Jv5JaZx
	v7rMlpWDwCoq1YlovklILisP629pzOKKaWFYVDXYnKHXn0s46s4mWHsyv+WTY9f2JNduejkoMqRND
	dPky77e2RRqFYC3B0UQt0FOtmDp+yXDHizT6OFtGBihnNWa1VO3cnYfcI0bbLoWtLPGYab99N0wuu
	2Pb6IYbVPFw/y0b6GXLa5ZqXgEQX81MUTaIuYUiqPo/XPh+pOHCY4Y0VV5OE5or6UvypOajgT63yK
	zEOWgppg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Qbd-00000005x9N-0Z4l;
	Tue, 15 Sep 2026 10:41:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Qbb-00000005x8s-1WgI;
	Tue, 15 Sep 2026 10:41:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A088D6025F;
	Tue, 15 Sep 2026 10:41:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E0341F000FF;
	Tue, 15 Sep 2026 10:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789468898;
	bh=Z3n8Dt8JvPMMO8BuW7lqztk2z8qFFdCmvnz/BIiU4i4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iU6AAjkPFj9Hj++Naq1Vg/Iw8Lq0NmiMSmqpadRnNFRqDno/tlBiPYKNOi6mQZUKF
	 7sc+8uED3EnNp5wG1Fjn1tgFv6dVwfhqA8TJUqTSh2XVViQlfsnH9rVTYuiFx4uIE6
	 CBzEIt+hSSsEGhZmHVinPX1QbgTqvxKFBKbnNDgCwejNbO5zEbjiFSYXLCeIBx3/6s
	 CsU+T9SsU6C9iogqZ53Fjlb842ByauU7ePGPT0OdagNK6mCPFEbU+bRFeNgKmZDiD0
	 c92vmfgMn/IMVRknXNXzN8DXVl25iAOO9t93mWY++KsrfKlNGUFXpF466DWAGjvQ0h
	 nrLic9XxcCmnw==
Date: Tue, 15 Sep 2026 12:41:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nickolay Goppen <setotau@mainlining.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>, 
	Alexey Minnekhanov <alexeymin@minlexx.ru>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: display: panel: Add Novatek NT51021
Message-ID: <20260915-determined-nondescript-hedgehog-fcda08@quoll>
References: <20260913-qcom-novatek-nt51021-panels-v3-0-266bc5d7e8c9@mainlining.org>
 <20260913-qcom-novatek-nt51021-panels-v3-1-266bc5d7e8c9@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260913-qcom-novatek-nt51021-panels-v3-1-266bc5d7e8c9@mainlining.org>
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

On Sun, Sep 13, 2026 at 05:50:16PM +0300, Nickolay Goppen wrote:
> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply
> +  - avdd-supply
> +  - havdd-supply
> +  - reset-gpios
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |+

Drop +, not needed.

With this fixed and without fake tag applied here and to maintainers
update:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


