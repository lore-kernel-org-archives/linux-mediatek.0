Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C34BFD0651
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2026 14:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sO3jV6gBx2iyLR6FADtgaq9h689hgQk2ixb5+fy1jGE=; b=zEJwnSLuD2Jt2IgBVE2es9APtV
	owx6x9PpN2bHb8IkFIiCMVKS03wSO+k/dLyKnc6HwwXM6ecepcUhZAvzuqaXHjsSmqfqwS+SCfNXx
	i0pfhnxyTknOgUC84M/SItLW9RrnXlcU9w+vlps6LJWAkVLjGAfSb+240vwbOS7j5S4sTCekqLboF
	YBhIKFRPFrrRIyANi5tXYbPlS2MCnyVHczdOTVf2k18hUODRn2d2uZuDl39umkREo6+LGfzFcx/pu
	e2s+hjjGVLGpKJknLiqC0rPeMGnTPtHVYRgUQQUQBn2KqhzV/BL8Ng1rDBGwPP7TzriMT2N/+U1Vm
	3Eiwfs+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Kjq-0000000Bj8U-1oCa;
	Wed, 11 Mar 2026 14:40:42 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Kjk-0000000Bj2N-0eGe;
	Wed, 11 Mar 2026 14:40:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773240033;
	bh=q5ScAZDEKF2VEyUynEqfPeutGbzwz5gnnQbsnc+Tk30=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bU7krmzx5llznTGLf+9qLLITgGJVOK/Kk/xFq1ONmp8RI8P2aQk9OP2mdUkUD04HZ
	 AqF4MlOKAXKRAWcim76VH5CrcMy+/vt6ywj1DOhFVqHXDdLPy64lSKm314/s9Y31wn
	 DBotw3nfaUIysFHS32T/7djBu+3BqLaFXhemwY4SttgHJuP7DXQICCf0TfIKQjC+cZ
	 wIfRX5Dy84X6J+hkZ2kPyxfL5hjKXBODNR7Gtm19uh3cbwbIZGKIhd87muP6zkyQ28
	 mV2UEq83BJutaH8+aZOXFFyrctP1P15HZ+dMM7sZFIm61hS6gY3Q/SG6FqgyFWuk1q
	 rJVgK9Eq4dwgw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B1D5617E1005;
	Wed, 11 Mar 2026 15:40:32 +0100 (CET)
Message-ID: <6d8d846b-f140-4294-aa2f-8fda230e0e18@collabora.com>
Date: Wed, 11 Mar 2026 15:40:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm/prime: Limit scatter list size with dedicated
 DMA device
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: linux-sunxi@lists.linux.dev, Paul Kocialkowski <paulk@sys-base.io>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260311094929.3393338-1-wenst@chromium.org>
 <20260311094929.3393338-2-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260311094929.3393338-2-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_074036_341491_F1464B36 
X-CRM114-Status: GOOD (  10.25  )
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

Il 11/03/26 10:49, Chen-Yu Tsai ha scritto:
> If a dedicated DMA device is specified for the DRM device, then the
> scatter list size limit should pertain to the DMA device.
> 
> Use the dedicated DMA device, if given, to limit the scatter list size.
> This only applies to drivers that have called drm_dev_set_dma_dev() and
> are using drm_prime_pages_to_sg() either directly or through the SHMEM
> helpers. At the time of this writing, the former case only includes the
> Rockchip DRM driver, while the latter case includes the gud, udl, and
> the tiny appletbdrm and gm12u320 drivers.
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


