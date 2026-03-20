Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805451093194
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 09:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EpJrhuWuswpJjjZT2bxNEf6wqWDqs6fc5icO3pQK1is=; b=XCO1Hep3jU9XiRQJGN7zx/Lcwq
	7pDWrY9siIe+urkmWJiqAkIuj7PxcWKpgAej09mT2pl8ut6gWvewfLC2+fPfe/WmY4Al/73JAC61Z
	MP3qWwP6bQNUr+059WmnN/EXlDuZVSZPcSqsuvyzDKm2CMAqdABfphtcJvs1dPV+6mM9l03XilvuT
	AA4lHmqpns4MINYdVEHAT7kCEW+k72CLhZprjm5eLf9fXnUoMDrAlVedbGGwFFKPI3dFg9weYTFqo
	16Ykn7OUjI25egsD5BLRtx+YYJ5gvQacYxvDPm1uyCLBONE/MWWnYQ8BqLCll+vNOtqafuxBsHCJe
	nyG237Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VxX-0000000CRtZ-0A2p;
	Fri, 20 Mar 2026 09:15:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VxU-0000000CRsq-22P1;
	Fri, 20 Mar 2026 09:15:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 109474090C;
	Fri, 20 Mar 2026 09:15:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE40C4CEF7;
	Fri, 20 Mar 2026 09:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773998155;
	bh=cwr+cb2Z1L1v7mta4diXVk2hpldr2ucjqAXpkp/nQ/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cbe9x4CMwiXaK/8gUoTvsiA/tdAetsKT5mQm6fu8NHgQek55VpqB2fHzKkl05RkM3
	 01wdr5OBCkTTGve0XeMQ/yl1piXiuYftazulWhVSpgJ9WM4h/vQRaarsz0L/2ZAlzM
	 RXQc9j/CboX0G/rHddhZILMTVB3b5EsXGlCs55H/fxctJc0oIq7SpDEdybapR5kW7m
	 dDqgay73v+m/usSy3+4lD3V3TksNQZGose88aqcZUv6xGmFaA8nd9VislM1cCo2awt
	 8uzlXs9Uykj3+tlrJyW6zMSpQC0zYxYHjyFioZY8jGkZIvwVD4aCS4NQK2+ryEwSdV
	 tEntrp/JGtyeg==
Date: Fri, 20 Mar 2026 10:15:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	Hailong Fan <Hailong.Fan@mediatek.com>, Huayu Zong <huayu.Zong@mediatek.com>
Subject: Re: [PATCH v3 2/6] remoteproc: Mediatek: Add VCP remoteproc driver
Message-ID: <20260320-impetuous-cougar-of-typhoon-e2da23@quoll>
References: <20260320032014.13608-1-xiangzhi.tang@mediatek.com>
 <20260320032014.13608-3-xiangzhi.tang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260320032014.13608-3-xiangzhi.tang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_021556_571052_90ECADF3 
X-CRM114-Status: UNSURE (   8.41  )
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

On Fri, Mar 20, 2026 at 11:18:04AM +0800, Xiangzhi Tang wrote:
> +
> +static const struct of_device_id mtk_vcp_of_match[] = {
> +	{ .compatible = "mediatek,mt8196-vcp", .data = &mt8196_of_data},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, mtk_vcp_of_match);
> +
> +static struct platform_driver mtk_vcp_device = {
> +	.probe = vcp_device_probe,
> +	.remove_new = vcp_device_remove,

There is no such thing as remove_new (anymore) and it is a proof thar
you are using some obsolete kernel, so it cannot be taken upstream.
Please work on upstream/mainline kernel.

Best regards,
Krzysztof


