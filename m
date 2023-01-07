Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24365C46467
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Jan 2023 21:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rLc3YOYbPb9xwmyzxI6Lpp2PYUZ9uu8/nbksT8vM0m4=; b=TAjc0Aop8zNe8o7VYs9mRxPBa6
	ZDHpzLdsgWONr21XBvum96aH/iANz22KSLxC5IjdXEweznoTvYtvwc8HaQeFUuodQ+FaISRyjyLtB
	+KpKznmb+mv1OgJWO6OrDD7U4fO7F/SzoUCO60hwOWhRWf6E2D6cJ+b+tYFerohhvV7xejmY3F+NZ
	cUXVTt68iYRJrKFGwhR4i40ORl4/lx//eGhMmS30+MB/nBlFiaJUXzWp5pLOGFBSHjocT8ybNr74E
	+aDKQEk8iVN9zyCyV1YiPQObNoZj9pH6z/iqD67E7e/XlHzU0VTFBBt7u+GfHBw2PvpaTZCovB3x8
	yAkvb5qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEH12-008Vwk-8e; Sat, 07 Jan 2023 21:46:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEH0p-008Vpi-A2
	for linux-mediatek@bombadil.infradead.org; Sat, 07 Jan 2023 21:46:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rLc3YOYbPb9xwmyzxI6Lpp2PYUZ9uu8/nbksT8vM0m4=; b=hS8Lg7/uW1eLVfy5SUKuCbxjCU
	2oCeK1IrxmJ9v5WJqrxbIkouvr4phHF2qJqywnl/uvq267zokP1aVKZLYx6WhRogg8EtJsg8dY676
	ZtXc0yQaKSMzkbKzx/VJvdTQ7hFoJ/ckS+q869qr/sitK1sa8tRZxQgktAZmA9aYE2GSJKOFhTI1O
	PrD/Pb4cOHb04zGfzYkMgPNJ25nWxPYc8T6zD+iLScvHDD7B7ffnfNz0HYG0jf8nZH7AXXAI8exRf
	+0p/mujL4XD6B5wEykn08FKx5VSQjZm/S05X/ah9H3iniVGIX9bPWO72tLoORvMmhupemwaG+5h3Q
	fe4BQoiw==;
Received: from mailrelay4-1.pub.mailoutpod2-cph3.one.com ([46.30.211.179])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pEH0b-002DjQ-00
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Jan 2023 21:45:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=rLc3YOYbPb9xwmyzxI6Lpp2PYUZ9uu8/nbksT8vM0m4=;
	b=wV1bp9q9M9mWhrbjGKzzHREqP2xOnbX74ksjXsaLvEXewl2gCQHp2fpPRKdtvosNVstynBeW05VDI
	 vL8aj2fKWtXR3etkNT6gVUeujgnN9DPXKS+ou1sukMlzERzI/8uszKIpimZOsBi//koZCR1AGZAi6T
	 BVyQpARfE77gLhbcmuzbshuHmHlw1FHGzVuIdwFdEgmxysHwdCDipepnYLXQ319OL6j1OQaZYPYoKn
	 wB9JcWZtiCooC278G3CuFJMHFIj9mb3Y615H4Af4QUR+Jfcj0foCcKpR/jUpDNiXc+7CIcz5vVePwn
	 NPA4yrsm2tHjbcVQ/UaZJT0jBJeYOoA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=rLc3YOYbPb9xwmyzxI6Lpp2PYUZ9uu8/nbksT8vM0m4=;
	b=xr2GmnEO+b/JkiuLoADgRCNiswL18k4T0RfjpdzgokXtktLQVOjcPBMNfhD/w4BhyzamBF3viUlpL
	 eh/wIqlBg==
X-HalOne-ID: fc4bdb3e-8ec9-11ed-91a0-87783a957ad9
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay4 (Halon) with ESMTPSA
	id fc4bdb3e-8ec9-11ed-91a0-87783a957ad9;
	Sat, 07 Jan 2023 20:29:31 +0000 (UTC)
Date: Sat, 7 Jan 2023 21:29:29 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: xinlei.lee@mediatek.com
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
	daniel@ffwll.ch, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, jitao.shi@mediatek.com,
	thierry.reding@gmail.com, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 1/2] drm/mediatek: dsi: Reduce the time of dsi from LP11
 to sending cmd
Message-ID: <Y7nWKRHQr9vumv0V@ravnborg.org>
References: <1672974321-18947-1-git-send-email-xinlei.lee@mediatek.com>
 <1672974321-18947-2-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1672974321-18947-2-git-send-email-xinlei.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230107_214545_447013_58027BE0 
X-CRM114-Status: GOOD (  19.94  )
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

On Fri, Jan 06, 2023 at 11:05:20AM +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> According to Figure 16 Turnaround Procedure on page 36 in [1], you
> can see the status of LP-00 -> LP10 -> LP11. This state can correspond
> to the state of DSI from LP00 -> LP11 in mtk_dsi_lane_ready function
> in mtk_dsi.c.
> 
> LP-00 -> LP10 -> LP11 takes about 2*TLPX time (refer to [1] page 51
> to see that TLPX is 50ns).
> 
> The delay at the end of the mtk_dsi_lane_ready function should be
> greater than the 2*TLPX specified by the DSI spec, and less than
> the time specified by the DSI_RX (generally 6ms to 40ms), to avoid
> problems caused by the RX specification.
> 
> [1]:mipi_D-PHY_specification_v1-1
> 
> Fixes: 39e8d062b03c ("drm/mediatek: Keep dsi as LP00 before dcs cmds transfer")
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>

Seems OK.
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 3b7d13028fb6..9e1363c9fcdb 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -721,7 +721,7 @@ static void mtk_dsi_lane_ready(struct mtk_dsi *dsi)
>  		mtk_dsi_clk_ulp_mode_leave(dsi);
>  		mtk_dsi_lane0_ulp_mode_leave(dsi);
>  		mtk_dsi_clk_hs_mode(dsi, 0);
> -		msleep(20);
> +		usleep_range(1000, 3000);
>  		/* The reaction time after pulling up the mipi signal for dsi_rx */
>  	}
>  }
> -- 
> 2.18.0

