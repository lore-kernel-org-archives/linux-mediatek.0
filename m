Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A751C27C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jun 2024 10:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JwAP1G9giuBxZIYDDgssZp58aG4PdnOXL34MihZew24=; b=hFx8vg2rmfUe2B
	sretq8e5KGGds4TBbtD3Bpgg5zRyeGRLPZyWOk8LrLQ0PmaaRUznXDUw8fFE5imw3n2KPlS7XOBQ0
	XVC2lBYioxUhXTNuFV7ruwa8fEwpHQ7Z/UC84qCfGp0G0JDpxKuCBfRJb5S/EqSkJ8kw5wIo7S4T7
	uU4VCPreCCFu5ZwoS4HvuP1LWwqWwkgkaKU/5suxh4reiupOoWQO/veTQ33dBDAnOcf41oC059Vdm
	9pcyHRNPisXJpi7AaXgB/lPFjpQcqpHltOs/4Ze4K9eOZRw5Vww6SsnBUMcMIJ9aoPN0fHX48PQCu
	DmfCme2nXwMGY6es5eoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKEvS-00000004YZl-0XF8;
	Thu, 20 Jun 2024 10:21:54 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKEvP-00000004YZ1-2ggS
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jun 2024 10:21:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718878909;
	bh=nCk+s9gsu5b4yUK/EK+MBN5vgThELD1rn/D27UNOsIc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=w1lp5TpYcyof799ZyVr51hHtK12dhICJnFufQGfrbwCs/AS2yjmW7nW1FnEUtmrM4
	 OYUY9WKujoNltnDBlrB0ZrizZijHjPtxkDHrzbiZUQTR/8HbbGFp2qT9rlapmfjqks
	 D8yDrVjFxqGGDQxpwW3ZfGzJ6aEEENRs5ARM6OApuGtszpR/M/vM2lD+WQOK3OwO3h
	 8a2o4xxEwjIjEP6mA9b3lR3IZriQLcSnbQz52zPclKWNTRxqD5AVYhA5i2/tP3XRNd
	 AdJn3sqJwa+yhVrz67mycX3Po/Ove61XwWng5j6h7wGK6WNuWoa20JPV4DSASgRH/O
	 1V6ccWMC5JgeQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DE35E3780698;
	Thu, 20 Jun 2024 10:21:48 +0000 (UTC)
Message-ID: <8d83fa71-4230-404c-829a-8afca6db203e@collabora.com>
Date: Thu, 20 Jun 2024 12:21:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts_thermal: Provide default
 calibration data
To: Chen-Yu Tsai <wenst@chromium.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
References: <20240620092306.2352606-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240620092306.2352606-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_032151_845991_A5318548 
X-CRM114-Status: UNSURE (   8.00  )
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
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, linux-pm@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org, Nicolas Pitre <npitre@baylibre.com>, linux-mediatek@lists.infradead.org, Julien Panis <jpanis@baylibre.com>, Balsam CHIHI <bchihi@baylibre.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 20/06/24 11:23, Chen-Yu Tsai ha scritto:
> On some pre-production hardware, the SoCs do not contain calibration
> data for the thermal sensors. The downstream drivers provide default
> values that sort of work, instead of having the thermal sensors not
> work at all.
> 
> Port the default values to the upstream driver. These values are from
> the ChromeOS kernels, which sadly do not cover the MT7988.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



