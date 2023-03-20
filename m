Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A9FC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 08:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFE7vegsuenD5KLekv0LMsJcVehYHDT+ZcVcG2ABN80=; b=UTBDtr6H65zisMI7Ei0nqkJ1n6
	gklFLezaDp4rlW146Ileohp8w203ZuG5rfCvs//zU2jwmOCgQg1W6Oawtet6FcpV9oUVCZW4gZtcR
	6q8ryJyaDRl16H04aQ9/Jq3rrJSw25AYdhptQEFzjFBxe6i2/CCNwJyZNIknjAit6tlF4nbfD+6oj
	IWfGzuUcs/GypIU8PJU5i4RmnCyLroEUWiXUIhpHr2DPFES1zNP2wj93QukNPTtcpNg3va+T3T/A4
	FLhQSFI9IDBOsODYfX5hFQjfRn7vrRp4X/SnUwNiyImvOMSDy5CyfbyRoxYsdLMF/UlGO00rWvhLc
	fP/Fm93w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peAmi-008MwI-2L;
	Mon, 20 Mar 2023 08:22:28 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peAmf-008MvR-2P;
	Mon, 20 Mar 2023 08:22:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 43482B80D7D;
	Mon, 20 Mar 2023 08:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B6EC433D2;
	Mon, 20 Mar 2023 08:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679300543;
	bh=Doe1j/uXAracamn2Mysv5svXt7LOcVO7jSrIu0ukLWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WmMbgKxhrvLdrQUMb3RD/I0nM4GvhQVW1byr/VWg0euMi9rxIqLW3Qycuvn6IZ3UV
	 JY52pcJkVJATODOjATOqsFAT20TpQOrsWDw9B/nnRUJkSRTJ0Ce96DZjF3rwTJ9cRY
	 tcfYSBRQVR6GMsW5oym8He1ypbx7l0MKYPtvutvATIcmjyRdxZIeOXdVS2sfmP4y9h
	 9eX5P22Ti3vmMUEDfHvpHFoPznkdmNZfIrUr7ue1clJfZjNcFsdNCQVxuq7W5PNbA9
	 UYjoY/Jzb8k3my7QeCfJG4nZa2LH5IlO32zxH3RsaRKpJ47YXULfXV2LtrjRStQUk4
	 rWJhVEGfnk8kw==
Date: Mon, 20 Mar 2023 08:22:17 +0000
From: Lee Jones <lee@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 07/37] drm/mediatek/mtk_disp_aal: Remove half completed
 incorrect struct header
Message-ID: <20230320082217.GK9667@google.com>
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-8-lee@kernel.org>
 <5dbee8ef-a5eb-b73d-5336-8b5c879a0d2a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5dbee8ef-a5eb-b73d-5336-8b5c879a0d2a@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_012225_925526_D336A689 
X-CRM114-Status: GOOD (  11.67  )
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

On Fri, 17 Mar 2023, AngeloGioacchino Del Regno wrote:

> Il 17/03/23 09:16, Lee Jones ha scritto:
> > Fixes the following W=1 kernel build warning(s):
> >
> >   drivers/gpu/drm/mediatek/mtk_disp_aal.c:39: warning: Function parameter or member 'clk' not described in 'mtk_disp_aal'
> >   drivers/gpu/drm/mediatek/mtk_disp_aal.c:39: warning: Function parameter or member 'regs' not described in 'mtk_disp_aal'
> >   drivers/gpu/drm/mediatek/mtk_disp_aal.c:39: warning: Function parameter or member 'cmdq_reg' not described in 'mtk_disp_aal'
> >   drivers/gpu/drm/mediatek/mtk_disp_aal.c:39: warning: Function parameter or member 'data' not described in 'mtk_disp_aal'
> >
> > Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-mediatek@lists.infradead.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Signed-off-by: Lee Jones <lee@kernel.org>
>
> I'd add the missing documentation instead.
>
> Please give some time, either me or someone else will do that ASAP.

Even better.  Thank you.

--
Lee Jones [李琼斯]

