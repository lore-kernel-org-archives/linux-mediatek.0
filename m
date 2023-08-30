Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67DEEC83F15
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Aug 2023 11:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/AQEHLa/Aly5DLb32igO9KBiEnGtH1dGOL5qR0wyj4E=; b=FIUDyShvV9hciDJQCHmvVlczaS
	joRYCW9oro5zSVmuxECftqHo+2VbJvtc9DEb7lkD+j3imFjQHrLB0gj8vanDfNUNj8rWalDh+KjES
	NUFUioV2kQjd2Auxiha/OSUsgjD+tojKX+J+bLDBegfnKfCYiI/r1S1YX5lwidG40u3gKrYZQY7tz
	6EdGf8PNuIpxsiFt2hyxl/V9saaa5yTuOn7oTQaTLJeuy6jQCGNzaSWrwU8AWOLqfMzN9y2oSFcgr
	5Fm0pUJfdSxx74coMutBQnIX8KPz57WdVMj8o00CMhVJmPBMz/5jujps64TZspaa3QYiP5Jb7Bxsv
	Cne42vPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbJ6v-00DMo6-1B;
	Wed, 30 Aug 2023 11:11:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbJ6s-00DMmS-0N;
	Wed, 30 Aug 2023 11:11:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 91C7362810;
	Wed, 30 Aug 2023 11:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 231EFC433C8;
	Wed, 30 Aug 2023 11:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693393901;
	bh=nR6xHB0OPWpcCVXuSRAMzthW2HNyxf0866+qn6RsY28=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=T00wI/D3mUZ5Hy+fNHHsyZ1OoaFWiEE3c2uEdk25JgoHeL2s6E3AmQC89hL0tqZlw
	 DhU58ttbRkdisHUNDl2l92hvnuNDaR86ghAzu9PfG8FMxNnhQFgif/rwAvOZa5dr6H
	 6p6m3dGGOrTsiSuh29o0ca8Bdt1y0pOjHW1NP3/mh8EeRnmjqY4C7cL3jKCuIZrxl6
	 OB5xsRFJPR6SjAyrAD+1xC6Yai3sUt9vJl+VWBMZP7y0O+9pOzJr7ozF3rus/Z3cme
	 1gpMkhJBt95o+V3zwkD6ppYwwQWI4oxyLHGn1pqv0qRBY76YDrHKSALtGpnFLNd4d9
	 8ttlSW+BCtKsA==
MIME-Version: 1.0
Date: Wed, 30 Aug 2023 13:11:35 +0200
From: Michael Walle <mwalle@kernel.org>
To: =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: angelogioacchino.delregno@collabora.com, airlied@gmail.com,
 amergnat@baylibre.com, chunkuang.hu@kernel.org, ck.hu@mediatek.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, ehristev@collabora.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, p.zabel@pengutronix.de, wenst@chromium.org
Subject: Re: [PATCH v7 09/11] drm/mediatek: dp: Add support for embedded
 DisplayPort aux-bus
In-Reply-To: <cce6f9c2-e0b6-47e4-ae1c-9a3d8a4e4b02@notapiano>
References: <20230725073234.55892-10-angelogioacchino.delregno@collabora.com>
 <20230825120109.3132209-1-mwalle@kernel.org>
 <5b438dba-9b85-4448-bc89-08a11ddb822a@notapiano>
 <fc6c054941420ac2d016496ccbeecad4@kernel.org>
 <00f65d49-497c-4ade-a2f3-7a5b7ad803b6@notapiano>
 <18bfffdd7ce3bd7693c8362b28651b49@kernel.org>
 <cce6f9c2-e0b6-47e4-ae1c-9a3d8a4e4b02@notapiano>
Message-ID: <7a3257dddac78c46408341253a3286f4@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_041142_197923_00668D68 
X-CRM114-Status: GOOD (  19.62  )
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

>> While digging through the code I realized that all the outputs and 
>> pipelines
>> are harcoded. Doh. For all the mediatek SoCs. Looks like major 
>> restriction
>> to
>> me. E.g. there is also DSI and HDMI output on the mt8195. I looked at 
>> the
>> downstream linux and there, the output is not part of the pipeline. 
>> Are you
>> aware of any work in that direction?
> 
> I'm not sure I get what output and pipelines are hardcoded that you're 
> referring
> to (besides the one in the mtk-dsi/dpi driver that you already sent the 
> patch
> fixing).

Have a look at [1]. That main path ends with the DP_INTF0 which is the
eDP output. But from what I understand that path can also use the DSI
output. But that is a pattern for all the paths in that file. Looks like
all supported boards in the kernel will have the output type for a given
SoC/path (or maybe the mt8195 is the first one which supports different
output interfaces).

If you have a look at the mediatek kernel instead [2], there the last
part of the path is not fixed, but there is also a .conn_routes property
by which you seem to be able to choose the actual output interface.

I was just curious if you know of any development for that (or similar)
in the kernel.

-michael

> And I'm not familiar with the DSI and HDMI output support on MT8195, so 
> I can't
> help with that.
> 
> Thanks,
> Nícolas

[1] 
https://elixir.bootlin.com/linux/v6.5/source/drivers/gpu/drm/mediatek/mtk_drm_drv.c#L210
[2] 
https://gitlab.com/mediatek/aiot/bsp/linux/-/blob/mtk-v5.15-dev/drivers/gpu/drm/mediatek/mtk_drm_drv.c?ref_type=heads#L425

