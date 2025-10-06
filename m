Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7F9CCA471
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Oct 2025 10:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SwugmiS1wbowyVcAs8Cv/jWGLxlROgr8rZbaG2BV6Bo=; b=s3D5K2JaKflyiYVQa6Pmyrc8aM
	YVT7iY+hCBO5sTA99bV9RjpvMi+ACZn1de5fJ4Vy/BYt6TFHR6pTUrgwPiLVCiUj1Y4BI2e009VAS
	4vk5Cdygl9D5/76ozbWpj4amRyJT1k02F40lMOhwcXJzTLoru5LzFZaI4tPSFucpbs1wdPQIE1ETj
	0RGsmx8Q+hBdI65/fwm/iGIcJVgyBYEkA5ikNAogMvtxK+lUIJ95GWDUsINhAfsY7HL0nIrCTuw5h
	AwvATjM9eiybOcFUcLrqxRsY+mbqJ3zK3s2yXFZvSCIX8eNAu+suWyi/pCmSXG6QOIMKhHqAaFBkW
	x/Rji+Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5iK1-0000000HLzG-24uD;
	Mon, 06 Oct 2025 10:20:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5iJy-0000000HLxy-21Mn
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Oct 2025 10:20:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759745996;
	bh=FGngKFGUOoQ67NlKMtIhMKfRHDJUydjDXUVwZnGvaXE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kZQHbgFEVkqzqny8xB1KGVW+PH0YijNBjcE5e/BG2gLnrJwsAbtVTFxphRzMbryFJ
	 BqpJ9mDYcX46oFqbPoitbFPWL8KYRytLQ21LSOgY0t9h8Hww4ElKdfbNyDt65icNaO
	 xWWy9DGhjKnoV5GxnD3QBlfu1lzTqKNFoeJqJBPp806DegVfMZPCJroc/fQHYbGtCq
	 Mf699NiE0gIytJMSE6ZAICcdvlexlf/H251cE7N3PbNS0fT27oB1mu6N+FUQWeI3dV
	 5IMnatuhl62PG4GmRoc98tuaMHDUQZds/PMtwV8Z6NMg1zkGZSQs3onk0qM78Lfoze
	 knPNyxmoN4elA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6A34A17E038B;
	Mon,  6 Oct 2025 12:19:55 +0200 (CEST)
Message-ID: <e03fb71c-5d50-40c6-b6f8-965319f472c9@collabora.com>
Date: Mon, 6 Oct 2025 12:19:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: fix device use-after-free on unbind
To: Johan Hovold <johan@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 Ma Ke <make24@iscas.ac.cn>, Sjoerd Simons <sjoerd@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20251006093937.27869-1-johan@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251006093937.27869-1-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_031958_703710_B9C380A6 
X-CRM114-Status: GOOD (  11.62  )
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

Il 06/10/25 11:39, Johan Hovold ha scritto:
> A recent change fixed device reference leaks when looking up drm
> platform device driver data during bind() but failed to remove a partial
> fix which had been added by commit 80805b62ea5b ("drm/mediatek: Fix
> kobject put for component sub-drivers").
> 
> This results in a reference imbalance on component bind() failures and
> on unbind() which could lead to a user-after-free.
> 
> Make sure to only drop the references after retrieving the driver data
> by effectively reverting the previous partial fix.
> 
> Note that holding a reference to a device does not prevent its driver
> data from going away so there is no point in keeping the reference.
> 
> Fixes: 1f403699c40f ("drm/mediatek: Fix device/node reference count leaks in mtk_drm_get_all_drm_priv")
> Reported-by: Sjoerd Simons <sjoerd@collabora.com>
> Link: https://lore.kernel.org/r/20251003-mtk-drm-refcount-v1-1-3b3f2813b0db@collabora.com
> Cc: stable@vger.kernel.org
> Cc: Ma Ke <make24@iscas.ac.cn>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Heh, nice!

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



