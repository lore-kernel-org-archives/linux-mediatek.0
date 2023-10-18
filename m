Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD43CDB483
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Oct 2023 10:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Dm0o4Tr6aEJVKz85+S8x2v6S9l+axtPVfgmmi/2Byo=; b=lfN5/fRY6Sf5g9Tk/Vgz7egiZH
	o2JDTDA+PQHB+lmEQp26Jpl23F43leD7pKNY+T9ak+0Y3ywwbq5B41qzqPmJA9QAxlBzwWdfTox+/
	88wTyVX0Pu4qrTMJRzZwKnuOvw0CqTdUstuqUbJ5S6KN+4cyMsWFj/U4/2e7xWsZm5SEP5B27E38r
	wKmJ93/Eg0wPG5lOdSOr5Cbfv36H7oMac5J6dw1BbBxrQ6alkjORiFo7L30Tv8iZ+HTWl3qG7IOWO
	zhooabmAOBZbZ39eFrMXAXU0iXdzxd022Dv3GchoJfxTGGibDRMsZVIhdCZ0l5pk/iQwlWyEo9tsU
	ej+diiIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt3j3-00EQvt-2K;
	Wed, 18 Oct 2023 10:24:29 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt3j0-00EQvC-2x;
	Wed, 18 Oct 2023 10:24:28 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B32BF66072F7;
	Wed, 18 Oct 2023 11:24:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697624665;
	bh=uHLAE7NLmQVbBRFl49l71ZZ0a4YX4vaL+aj4ZDekqUg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FYiWQKGYS6VICc8IcmuQq3Q4mMEoZyCIlkCfVc9mBT+AMMX0CvXg2eY5Cy/jE5Tyd
	 ADtS+aWoVPTKR3FnhcL54PTL9rV1RdgeTwWF480HaZQNvkwxAFT1MGB4F6v1LTgvVQ
	 uPfLqJjGhpKdU0tT+Bx89aK2th25X3F64TXR2OwTU02vt4cCbBPdEUV6Egd0x2C/BZ
	 fE54WJFpx2T1ctFqOGWzkFq89Hbs0onoNRKA7UInio6E7eipnUOqIinOSeFQT9PjKe
	 OpooGiiAOt6Yh3AmOzqhZriVK+VZkFYG+3D85+auNAtVNeXt5CKZKXUFxIqo7JOR85
	 hQKbXsaGlCmLw==
Message-ID: <85277960-8c6a-485d-8dd4-9c1eb37f5818@collabora.com>
Date: Wed, 18 Oct 2023 12:24:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] MediaTek DRM - DSI driver cleanups
Content-Language: en-US
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 Alexandre Mergnat <amergnat@baylibre.com>
References: <20230524093412.92211-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230524093412.92211-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_032427_083376_8F8E8388 
X-CRM114-Status: GOOD (  10.05  )
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

Il 24/05/23 11:34, AngeloGioacchino Del Regno ha scritto:
> This series performs some cleanups for mtk_dsi, enhancing human
> readability, using kernel provided macros where possible and
> also reducing code size.
> 
> Tested on MT8173 and MT8192 Chromebooks (using a DSI<->DP bridge)
> and on MT6795 Sony Xperia M5 (DSI video mode panel).
> 
> Please note:
> This series depends and can be applied only on top of [1].
> 
> [1]: https://lore.kernel.org/lkml/20230523104234.7849-1-angelogioacchino.delregno@collabora.com/
> 
> AngeloGioacchino Del Regno (4):
>    drm/mediatek: dsi: Use GENMASK() for register mask definitions
>    drm/mediatek: dsi: Cleanup functions mtk_dsi_ps_control{_vact}()
>    drm/mediatek: dsi: Use bitfield macros where useful
>    drm/mediatek: dsi: Replace open-coded instance of HZ_PER_MHZ
> 
>   drivers/gpu/drm/mediatek/mtk_dsi.c | 198 +++++++++++++----------------
>   1 file changed, 88 insertions(+), 110 deletions(-)
> 

Hello CK,

this series still applies and it's a nice cleanup.

Is there anything wrong with this? Can you please check it out?

Thanks,
Angelo

