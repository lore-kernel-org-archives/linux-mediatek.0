Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAC6C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 07:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BnTu3TngMoROOYmoGzyJtpfC6OZnTmZGcT1KHtM2FFA=; b=fKbAPbnDVvNAHU6nZSe/jBEUeo
	WgAlDXBOO4Ottti+RECKTSuC9MWZ/D2RH21RGoZz7y4j7HiaM6RXPk2pmo8rWgv1+l31z7ezXaCN8
	JXXXcEryGcddgtHkfJW8jSXGtffZlUOJV51D2TgG7VZWD1Vr4QzpVaTP08o/cB9CP9BClD3Wpw2HG
	20htb0sI0EtwFhc4APDnnQOvE/qMLJ17eFJp2OakooLSYo/mzrQkh9WFOzI/gdcRlXfKW2Qw5tCnk
	XJ2S6MqupYDTdMG1OyPMTSG2ppazyA5Dm4fTnnIrlywUVkYZdOgkI/ZG2ta7wEDk+aLNE64kVHkfe
	yfIVt1AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh2UY-0000000BvAr-0pr8;
	Thu, 22 Aug 2024 07:44:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh2To-0000000Bv41-1Tt4;
	Thu, 22 Aug 2024 07:43:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BF4A0A4252C;
	Thu, 22 Aug 2024 07:43:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17364C4AF09;
	Thu, 22 Aug 2024 07:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724312615;
	bh=AK/xKIzO4LquYSa3Q1oE65b0txD/L+ZJgcTFxpFcUSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FUkg6gapQxxX6quXXXFRUKJOZt+8KjY6nZJXyF1prQnI+xXGfwNK/SyqUE4FNGVNH
	 jB6NbeNeIJkhNoPP0hWb13ZBzxtbUfzqV3sskk6QavLqidPOYb70hbFU/nFBOhP8rP
	 0oQb+ZtvvM/k1tsVS8RdrccthUgsaIAtMZvOGIyVJ1qi3cKtYKeAMiKebMTgYXvAib
	 YhmHnQzN912Q7ZFH0SexObsRX/7Bp68DxY9j/l/qrVFJ4N7MCZf8ni3nGYCfh0ZR+w
	 0e0kunKAtMKKGSjtsOfAEs9RpMt/42pY9gFWadHx8w2vtydKiYt5TOGmZjVqOFhwgn
	 bZTUK4n6FOtHQ==
Date: Thu, 22 Aug 2024 09:43:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rohit Agarwal <rohiagar@chromium.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com, 
	jitao.shi@mediatek.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: display: mediatek: dpi: Add power
 domains
Message-ID: <uabbapstxrkfwlntifdoowcsifb5ywfhxubaycfyhwkkykfpev@4hdqcxdov3er>
References: <20240822064650.1473930-1-rohiagar@chromium.org>
 <20240822064650.1473930-2-rohiagar@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240822064650.1473930-2-rohiagar@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_004336_476152_BF724EE0 
X-CRM114-Status: UNSURE (   8.70  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Aug 22, 2024 at 06:46:48AM +0000, Rohit Agarwal wrote:
> Add power domain binding to the mediatek DPI controller
> for MT8186.
> Also, add power domain binding for other SoCs like
> MT6795 and MT8173 that already had power domain property.
> 
> Signed-off-by: Rohit Agarwal <rohiagar@chromium.org>
> ---
>  .../bindings/display/mediatek/mediatek,dpi.yaml | 17 +++++++++++++++++

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


