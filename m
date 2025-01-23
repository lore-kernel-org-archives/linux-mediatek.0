Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D88C02182
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jan 2025 12:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TUhzrte0gn0xG2dMeihV0KQvJaVA5XBuzjXG7GGu8P4=; b=RxVP2WDL8/9Nvis1VaMzgnRWmM
	HGPW3HRiZp/SmSETxjD3SgGPJhN6zNoKqaTtJPPU4vaU++GrzDe9d+eqhKlMtO93TsvLYJipR1A5I
	B1FH+79u0zo7iGfcANlGycrq/but6ugTfhliKmeAUI/38XC+8dSpJKkbYWLzrQ5VJIgsPhSGhTwpc
	rb/l6KlRzbZtHFMluhKTkX2/yBBQIZ3agP3Bb7hINDArLBhHKUBeIGKe/6aGOk3niXGQLVeX+r386
	xQsEwuEQo8J7uMfpLTZJ1QiJPJjC+VpushPsXfgRHR2QpfQAxOFRatSw1Dg7gptwuRkYZUsTmKKVb
	mwxrYMcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tawQX-0000000CSdt-0jl8;
	Thu, 23 Jan 2025 12:35:17 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tawPD-0000000CSU7-2Jfo;
	Thu, 23 Jan 2025 12:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1737635632;
	bh=n+6IUxsW4H4bSYmqPQjoTK1FHxsbX9PDXmPVfDRcSqc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iKqC1TmGIEJd8D41d972RFZCbgfAmS39po+SUOviQ1ifkD3+wjyeNl9/FXkd6K3lB
	 YK/JeW6Kc6YGEO8cl/roK6l1s06TFVHeFMvOHcSq6tM3thdgifIRvByM3uEvrl/AV/
	 ZTHhN3bD15aa8ZZFrueQOE+HXL/lU4WkUDdDLfHpNcxaN45HNmMErGPShadqbIXopV
	 TgfO5wKw3j6cSCZB7iFzG+g+MH16Z1DN4dATwMc4E3/GaV6IXj7TFXmKteDxz0SccF
	 BzY0bcKsuAY56rIl3VHCMBEOvL7QqHt5Ji5d2ClaRZMucBC89MerMIN1LRLRodq1SX
	 deiz0N0Xq+/nQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C017517E0DD8;
	Thu, 23 Jan 2025 13:33:51 +0100 (CET)
Message-ID: <4455b317-aeea-42ff-be55-020d52330219@collabora.com>
Date: Thu, 23 Jan 2025 13:33:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mmc: mtk-sd: Fix register settings for hs400(es) mode
To: Andy-ld Lu <andy-ld.lu@mediatek.com>, ulf.hansson@linaro.org,
 matthias.bgg@gmail.com, wenbin.mei@mediatek.com
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250123092644.7359-1-andy-ld.lu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250123092644.7359-1-andy-ld.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_043355_783107_91720246 
X-CRM114-Status: GOOD (  11.31  )
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

Il 23/01/25 10:26, Andy-ld Lu ha scritto:
> For hs400(es) mode, the 'hs400-ds-delay' is typically configured in the
> dts. However, some projects may only define 'mediatek,hs400-ds-dly3',
> which can lead to initialization failures in hs400es mode. CMD13 reported
> response crc error in the mmc_switch_status() just after switching to
> hs400es mode.
> 
> [    1.914038][   T82] mmc0: mmc_select_hs400es failed, error -84
> [    1.914954][   T82] mmc0: error -84 whilst initialising MMC card
> 
> Currently, the hs400_ds_dly3 value is set within the tuning function. This
> means that the PAD_DS_DLY3 field is not configured before tuning process,
> which is the reason for the above-mentioned CMD13 response crc error.
> 
> Move the PAD_DS_DLY3 field configuration into msdc_prepare_hs400_tuning(),
> and add a value check of hs400_ds_delay to prevent overwriting by zero when
> the 'hs400-ds-delay' is not set in the dts. In addition, since hs400(es)
> only tune the PAD_DS_DLY1, the PAD_DS_DLY2_SEL bit should be cleared to
> bypass it.
> 
> Fixes: c4ac38c6539b ("mmc: mtk-sd: Add HS400 online tuning support")
> Signed-off-by: Andy-ld Lu <andy-ld.lu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



