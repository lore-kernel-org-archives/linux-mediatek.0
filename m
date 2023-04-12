Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F7FC7619A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 20:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T38IV4yiax4pKI3AX1/0/LsjaEassFQljjvo2C7r+pU=; b=HAEAdtqPcFBHZ3yVtWshZnZzt8
	nYqKxYC9sFOnnD4/P5azB93iqxpxVFxIXt1TlMrYb60jZ3eNzBJW0lkgFc19cPuKG0SwtT4h/oKHD
	jUmcQ+a6g8DTn70LWcIz5TPZCTIOmCS6VbdAZ/DVUSUoGhYr149MEuICI9UDVzAfJ+XLyfKuxKYPx
	WPIJ6toBvMys7dDDPuV/kS0tx0+byrPy9JDB5JeRsOwuuthzAM/GgNokOKA+hsJ4P/0/GkIjeoIYj
	zULaIK2iKA/gdv8adlkkscUJaD5CMrF3PWVmrP5ewUmsuhva5A8SXCutDtJND1YYxjEWKriUzBZ13
	vX5AJx+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmhD1-004HHq-1q;
	Wed, 12 Apr 2023 20:36:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmhCx-004HHK-2m;
	Wed, 12 Apr 2023 20:36:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B13AC61276;
	Wed, 12 Apr 2023 20:36:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04DD6C433D2;
	Wed, 12 Apr 2023 20:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681331806;
	bh=6+kQhpng0nN6oNxM8W0ozh1qx0TTG9sI2fAC3uykaQA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=N+ilccIF+2JKkBMkhXT6bhJMOi1nFeyXHZ9AsiNDTNvXNDcq8tRaiVItvncPjyTnr
	 jBEz/6Lu4JALOCGVUGYk1l90Zzz8LU2Z8OGYLuiGrb1e4b3dnSwgbQx4reQX3CdJs3
	 pFl/gOz+N14EM1sv73QIHCC+8Yr1tyPCEV0bJN0YW26/0f3QISfcOrXrvLRQueevg9
	 WNGQ+qV6TQzQObk7HSBREvCDtksRVzqt5cFcAEVBRoGaDckyATMagU46fgiEiIYPbv
	 dGR9aViRJnQgaL/Wx7mxxv93n2MhIUjaVYyEavbS91af5Y1WYCC5muKvWIV34qPM1U
	 yegzg/YHU63jg==
Date: Wed, 12 Apr 2023 21:36:42 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: ChiaEn Wu <chiaen_wu@richtek.com>, lars@metafoo.de,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 peterwu.pub@gmail.com, cy_huang@richtek.com
Subject: Re: [PATCH v3] iio: adc: mt6370: Fix ibus and ibat scaling value of
 some specific vendor ID chips
Message-ID: <20230412213642.1a942f64@jic23-huawei>
In-Reply-To: <d2667a9d-20bf-bda2-9d69-4f5000db1633@baylibre.com>
References: <1681122862-1994-1-git-send-email-chiaen_wu@richtek.com>
	<d2667a9d-20bf-bda2-9d69-4f5000db1633@baylibre.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_133647_963543_FB90BAA8 
X-CRM114-Status: GOOD (  13.98  )
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

On Wed, 12 Apr 2023 13:31:06 +0200
Alexandre Mergnat <amergnat@baylibre.com> wrote:

> On 10/04/2023 12:34, ChiaEn Wu wrote:
> > The scale value of ibus and ibat on the datasheet is incorrect due to the
> > customer report after the experimentation with some specific vendor ID
> > chips.
> > 
> > Fixes: c1404d1b659f ("iio: adc: mt6370: Add MediaTek MT6370 support")
> > Signed-off-by: ChiaEn Wu<chiaen_wu@richtek.com>  
> 
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> 

Applied to the fixes-togreg branch of iio.git and marked for stable.
As we are very late in this cycle I may well drag this into the
queue for the coming merge window as it will land upstream slightly
quicker that way. If not it will go upstream early in next cycle.
As it's been broken for a while I'm not going to rush this upstream.

Jonathan

