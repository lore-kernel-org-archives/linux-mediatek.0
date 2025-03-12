Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C83C28B30
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Mar 2025 14:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tpuLCscWJ4qgGgaNgt9rKZJTdCZhl33TV3dP6EeCHWs=; b=qiw26UsNdTfrhR8/uVY60DMYQE
	bDJfmXP8nUqXm+Tqlujm8JEj9+mb6N197ZOKl6HscF+9MNZIzhiTMQFWdnM4imdMGQ0iF3ZI5t2+Q
	O/IBX6XMnFeK83n1VKT4lFJraGE4YbD/FjALQOHbEmvti6KUh9x3azrQ3dhTAQi6n80woZVCAivsU
	YfIhihecupQYwcNQnus6sJYgAqhnMABpZD2jo/JWieRWvY9PZFtjZpYrEZbp4GAE2aaEoIC8kUFuj
	PcLmEOHMIzQLChygvmduVxOCI7DOIPlAAYujhS55jAqH/PGMT2bnsbsDUcN40FaATgWJOkjg0M8eU
	iem7l40w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsN28-00000008gz9-116f;
	Wed, 12 Mar 2025 14:26:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsN27-00000008gyo-3AA7
	for linux-mediatek@bombadil.infradead.org;
	Wed, 12 Mar 2025 14:26:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=tpuLCscWJ4qgGgaNgt9rKZJTdCZhl33TV3dP6EeCHWs=; b=QKR1VuZhIbmLiOKUik1mYb8A8q
	o8A+7FkQJbFESQkONMN6CxYfLRsW1macd6yYlq+S4vqbr9bsdXYUPGkP97lriq8p/ZwK9TQoG8ZCa
	Wnb/PCwYJD+l4pBXQwpDBHEpg4E/iRg9kPcJ9OWI+JFs0KydWfJBfvEhgnlEl6hVrYABtgwjLiFt9
	rrhLd0tRRerCjHKoAt2fyzzU0+3lUQOvbIQUsZfI8pvEnvgjSIYLWZK/kQD3bwcgPmFCLbf6uBVzn
	rOs4pWmww5i05RbIGELwga4Rg4ZEhax+j8oHuCfg+dHZ+lMN54fA7XDPd+b1ENEa2LUQTowrNeCa9
	Kje8v1nw==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsN24-00000002PaP-1IEH
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Mar 2025 14:26:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741789559;
	bh=D30yYcLGzCKJP0xV33q/0S+ufxFtV0zBn7R8mUrRc9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tl3nEoNdxDokHqsqyV8dCb3k39ooik8vJ4denOVETXReAYKWE06x+vVqe32mEGkyM
	 /dnJqbP4i//hctFThaVzNPfIFYkRpQhWFaIeAI5izl173G5cPZu9QCFq9cPgmwXaPZ
	 WwXb+tH+xvAlia5PWDVFrKenP3JkcdafO5U4j3/7HRcAi0bHYfLD38zfiqpXXylWTf
	 sRzFBu6uOYskRDnQadlKCPhDsII0MsENDzj6AbhfeOLYGkw2G2u++8Jq1XCGlaEugP
	 Msl6PAhIu4WTkNN8nn2Yx9DsCrskwlLCttJc4S/p+BrGS9sonRFgt9Lvr3OStHraEY
	 YZywoGLxZ0/ng==
Received: from notapiano (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8F59517E1134;
	Wed, 12 Mar 2025 15:25:57 +0100 (CET)
Date: Wed, 12 Mar 2025 11:25:54 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: linux-mediatek@lists.infradead.org, chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com,
	krzk@kernel.org, daniels@collabora.com, airlied@gmail.com,
	simona.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: defconfig: mediatek: enable PHY drivers
Message-ID: <5706c76e-7558-4405-a4c6-cab9cb5ddf65@notapiano>
References: <20250312041943.25676-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250312041943.25676-1-vignesh.raman@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_142604_499572_38F99180 
X-CRM114-Status: GOOD (  16.22  )
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

On Wed, Mar 12, 2025 at 09:49:26AM +0530, Vignesh Raman wrote:
> The mediatek display driver fails to probe on mt8173-elm-hana and
> mt8183-kukui-jacuzzi-juniper-sku16 in v6.14-rc4 due to missing PHY
> configurations.
> 
> Enable the following PHY drivers for MediaTek platforms:
> - CONFIG_PHY_MTK_HDMI=m for HDMI display
> - CONFIG_PHY_MTK_MIPI_DSI=m for DSI display
> - CONFIG_PHY_MTK_XSPHY=m for USB
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v2:
>   - Include board details in the commit message.  
>   - Sort newly added PHY configs in defconfig.
> 
> ---
>  arch/arm64/configs/defconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 1f25423de383..87e8cbd3fd26 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1572,7 +1572,10 @@ CONFIG_PHY_HI6220_USB=y
>  CONFIG_PHY_HISTB_COMBPHY=y
>  CONFIG_PHY_HISI_INNO_USB2=y
>  CONFIG_PHY_MVEBU_CP110_COMPHY=y
> +CONFIG_PHY_MTK_HDMI=m
> +CONFIG_PHY_MTK_MIPI_DSI=m

This isn't the expected ordering. I imagine you manually added these configs in
the defconfig.

To get the right ordering, after you've added the configs anywhere in this
defconfig, do a 'make defconfig', then a 'make savedefconfig', and copy the
generated 'defconfig' file at the root to this location, then you can add just
this hunk to the commit, and it'll be in the correct order.

Thanks,
Nícolas

