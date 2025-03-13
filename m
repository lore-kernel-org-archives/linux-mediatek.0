Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3697C282DE
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Mar 2025 12:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=shP6uQ/m6R/CuHBF/4J2HjZg/M7mcC6vzmTj4rhEzdM=; b=tjmT8/i34nnF/DL7cLExm5fWuW
	Hgridq82w4WEu+mvvhIfTa0+zsAyZZytBW1Qypo/B3Bq2cmEGHpet/PMap0L7MeIzqfNgvuiBznmN
	v9Gy7NRYlhXwqVZ0B41NNS6yXouEumP1GRlHzWjFw9XKm//85K89+P1iSlExJCatL2ynr3M56r5v2
	BgK6UoXB3ex+0WLrp716ta+xbQUNCSDNR9iR++FPahhBltHcg6qSnB3Gxa1/Pxurbqwoz1ww2KxCm
	zs2qhDTmV1e3O5fQftWaY4UFhD0EsP6mBdDgkjRZa8w3Vn5k12YicvBUnAwX4K0EWklmTMzXlWAY1
	L9exfPKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsi3A-0000000BIHh-3ho4;
	Thu, 13 Mar 2025 12:52:36 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsi0F-0000000BHoU-2Drw;
	Thu, 13 Mar 2025 12:49:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741870172;
	bh=ldBDGgTkPPYuyTRF2v5+H50f0Ki5xayYC0ECnthlcf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hHjw2pigsG5DsBzm/jEYPomMS3pE9MEp3/MLzh/rHvopa2pA6QJsSXsqK/CqL2TTX
	 jwVZDNMymLABCy7ct0McWzze8s6ps5RQQKiCh3YgLnd59nvlAEqIEtT/g/qxsa5j7V
	 DTvSO2bH19OcPuM8BvagGbnDSMLF/Ld7gevIk/wq2s8cjRJW005pKFqCEKnv0+NwIi
	 qIrBOUwrWM0ziTER+j0hdkHznr0F6UaPA9tWzLGIdxxBDEqspB/2sUnlwIiUmauKSX
	 m+c5m3+R4Yj8HiPleDFrUdj5SSD0b1dPEkzZ+o9U633FnEI9UnUz8QCzk3msE9u3gG
	 P6l4pp4dTkwjA==
Received: from notapiano (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A653617E09AA;
	Thu, 13 Mar 2025 13:49:28 +0100 (CET)
Date: Thu, 13 Mar 2025 09:49:26 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: linux-mediatek@lists.infradead.org, chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com,
	krzk@kernel.org, daniels@collabora.com, airlied@gmail.com,
	simona.vetter@ffwll.ch, arnd@kernel.org, ck.hu@mediatek.com,
	laura.nao@collabora.com, matthias.bgg@gmail.com,
	tzimmermann@suse.de, mripard@kernel.org, lumag@kernel.org,
	ville.syrjala@linux.intel.com, jani.nikula@intel.com, arnd@arndb.de,
	geert+renesas@glider.be, wenst@chromium.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: defconfig: mediatek: enable PHY drivers
Message-ID: <986ad850-3e7c-43f4-84f0-cbce888676fe@notapiano>
References: <20250313040855.62259-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250313040855.62259-1-vignesh.raman@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_054935_745150_F065E36C 
X-CRM114-Status: UNSURE (   9.28  )
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

On Thu, Mar 13, 2025 at 09:38:24AM +0530, Vignesh Raman wrote:
> The mediatek display driver fails to probe on mt8173-elm-hana and
> mt8183-kukui-jacuzzi-juniper-sku16 in v6.14-rc4 due to missing PHY
> configurations.
> 
> Commit [1] stopped selecting the MediaTek PHY drivers, requiring them
> to be explicitly enabled in defconfig.
> 
> Enable the following PHY drivers for MediaTek platforms:
> - CONFIG_PHY_MTK_HDMI=m for HDMI display
> - CONFIG_PHY_MTK_MIPI_DSI=m for DSI display
> - CONFIG_PHY_MTK_DP=m for DP display
> 
> [1] commit 924d66011f24 ("drm/mediatek: stop selecting foreign drivers")

Usually this would go directly in the paragraph, like so:

  Commit 924d66011f24 ("drm/mediatek: stop selecting foreign drivers") stopped
  selecting the MediaTek PHY drivers, requiring them to be explicitly enabled in
  defconfig.

But that's just so you know in the future, you don't need to send a new version
just for that.

> 
> Fixes: 924d66011f24 ("drm/mediatek: stop selecting foreign drivers")
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

