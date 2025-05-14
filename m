Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998FAC3ABCC
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 May 2025 14:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+pBX8JrrpRy58fZEbwLzKit2oPnAoSVq+q5SBTa3kX8=; b=YJ4Zg9ro2H9tYegnCsKlJfX9iY
	pwC3U07BCJhZhB7Logz640Kj20O4lE++c8ftCBfAwcMu0UscjARTv+nYIp0FE9qR+LT9iLDBNs5/A
	phTxdRaB8jyjxFczd9mKQn23OclIqH7Z/piwoWveN5xJAzl+1e2wuv8pIMBkCvNBJSOzQYg9JNCr9
	pEhHqKUqawrppRXqVukAee5PY5SefOPy1iXfOE5p+lMxEmtxyzKUT9pkliYI00bbceqqSwI91rr/c
	sMuK3QIyzGEgle6nFY7nNpnZvGJB8+289FazjKdI6/tgxlESMld+qgm5cG3m2QKV9gf1rKANoAx5d
	j2jbzWYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFD7s-0000000FQ0h-2iwF;
	Wed, 14 May 2025 14:30:28 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCS9-0000000FFSB-0mu3;
	Wed, 14 May 2025 13:47:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747230439;
	bh=TAI5mLJlWhLbo7cCFBPagCfirhUukvsVXETiU+P9guk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cUq51uMX3IhXkewKfUs4Xfj11uVh9M5qVYU5q6qQZ2eFcIyruQYj9TwJ8+kUphtxh
	 C9P/SkBSPukStCYQRxYpBOg826nKe6dnu1bf93wOpJT0UswPsEQfAMUGOq07q+hMWc
	 zkv8G3nG3Qj/g/byEQbUqI4eE/SygEmhTGdcX9rbjExU2Ct/o7IqmEkKjBZGUEs0Bg
	 LJwM2pdWJRKK/qAs6H5di1iHZ4rGAnjveM8yqHG/DJNmiy+z2lHlSGhhI4oPjV9S95
	 fMIX9TF7Gxx0HEcdXppXAI9k2u5cdq76XAhpaXcxoDV6klqwY7ezlHGbCeC05SAcrB
	 AWFMKUts3kC3w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 138B017E07F2;
	Wed, 14 May 2025 15:47:18 +0200 (CEST)
Message-ID: <8df2c0c4-600b-4410-b578-cd77170d5e37@collabora.com>
Date: Wed, 14 May 2025 15:47:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: defconfig: mediatek: enable PHY drivers
To: Vignesh Raman <vignesh.raman@collabora.com>,
 linux-mediatek@lists.infradead.org
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, nfraprado@collabora.com,
 krzk@kernel.org, daniels@collabora.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, arnd@kernel.org, ck.hu@mediatek.com,
 laura.nao@collabora.com, matthias.bgg@gmail.com, tzimmermann@suse.de,
 mripard@kernel.org, lumag@kernel.org, ville.syrjala@linux.intel.com,
 jani.nikula@intel.com, arnd@arndb.de, geert+renesas@glider.be,
 wenst@chromium.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250512131933.1247830-1-vignesh.raman@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250512131933.1247830-1-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_064721_366866_A297D46B 
X-CRM114-Status: UNSURE (   7.03  )
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

Il 12/05/25 15:19, Vignesh Raman ha scritto:
> The mediatek display driver fails to probe on mt8173-elm-hana and
> mt8183-kukui-jacuzzi-juniper-sku16 in v6.14-rc4 due to missing PHY
> configurations.
> 
> Commit 924d66011f24 ("drm/mediatek: stop selecting foreign drivers")
> stopped selecting the MediaTek PHY drivers, requiring them to be
> explicitly enabled in defconfig.
> 
> Enable the following PHY drivers for MediaTek platforms:
> CONFIG_PHY_MTK_HDMI=m for HDMI display
> CONFIG_PHY_MTK_MIPI_DSI=m for DSI display
> CONFIG_PHY_MTK_DP=m for DP display
> 
> Fixes: 924d66011f24 ("drm/mediatek: stop selecting foreign drivers")
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



