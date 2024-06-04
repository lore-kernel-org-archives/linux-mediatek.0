Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A342C25B78
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 16:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aF6qe+ILjODiUYSeHUsR005/NVmQKpPQARU8udWrXt4=; b=1rsENG8s+kQp3LmJ5M6Lf36Olh
	ofpQW/saPHHQmWTr5bvQz1XlkreE1Ka6jpYu75ThfMFagk1QyCdtqoI675qE3GE7Ck61nwNBc1ZgY
	UlQeoMOgurDtKjAgS60qt6IpHGzLgRLXwx3Zk9+LbrF14pPUZNX0ZGXVhNzVm85rKj+1L/IeV4wRA
	LD3GAa1xIow6SB2pS0qkVFQWVVdPD5H9SAjrpZFcgMWSwVujzzXzj8X3e2JAoEn9nJ5y3WXFFdqBg
	IakY/7OliaB1LcP/GWqU1EL1XDB2qRj9x/6fveoPmpKbvfPc7bbK2vm9vfeyJuAHZ23BywpVCE4SJ
	YVolHd3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEX31-000000038Ij-1bzV;
	Tue, 04 Jun 2024 16:30:07 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEX2x-000000038FI-2AXR;
	Tue, 04 Jun 2024 16:30:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717518599;
	bh=zzYkFvKYex68lFbcEumkWIRNilyKlRoCRjm2QfKYCYI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LuTfpSvx77y3cFBgUuKy6/VtKdGfhRAFnKnsdpuSRjSysWrElI548NJjDUA986Qxu
	 /hHklctq0p9l2AQ6nTkiDLwJOCmQTZMNgndn7d2mFNa+OQ6zqjRXK4tKUXiwH38Um2
	 pRG8oHEIhekBwVmM6RE3xY9AHb++2L/XWywja7g9ZeigtEE3oPG/HcRmPBSZzFV4HW
	 w5HDMUsmi14ZC7D/zkgH4V2Qno9h/wQkBNoAvnC4eeR+v28s+tEjuxVz7iTAZH614b
	 H6KhWVhZYy57O0ZvyFCGxyqsMxnHttLifoSe4aeW9TwsCxdxRzvifIHJZjwKcyFEDU
	 Nn3k6Yk/ogwTg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 63A7B3781104;
	Tue,  4 Jun 2024 16:29:58 +0000 (UTC)
Message-ID: <af024ad1-93f6-4d7a-b139-7eb2fa12eb81@collabora.com>
Date: Tue, 4 Jun 2024 18:29:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts_thermal: Return error in
 case of invalid efuse data
To: Julien Panis <jpanis@baylibre.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Pitre <npitre@baylibre.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240603-mtk-thermal-calib-check-v1-1-5d6bf040414c@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240603-mtk-thermal-calib-check-v1-1-5d6bf040414c@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_093003_748227_5C5DFB47 
X-CRM114-Status: GOOD (  16.00  )
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

Il 03/06/24 14:06, Julien Panis ha scritto:
> This patch prevents from registering thermal entries and letting the
> driver misbehave if efuse data is invalid. A device is not properly
> calibrated if the golden temperature is zero.
> 
> Signed-off-by: Julien Panis <jpanis@baylibre.com>

Fixes tag, please.

Regards,
Angelo

> ---
> Guard against invalid calibration data, following this discussion:
> https://lore.kernel.org/all/ad047631-16b8-42ce-8a8d-1429e6af4517@collabora.com/
> ---
>   drivers/thermal/mediatek/lvts_thermal.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index 0bb3a495b56e..185d5a32711f 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -769,7 +769,11 @@ static int lvts_golden_temp_init(struct device *dev, u8 *calib,
>   	 */
>   	gt = (((u32 *)calib)[0] >> lvts_data->gt_calib_bit_offset) & 0xff;
>   
> -	if (gt && gt < LVTS_GOLDEN_TEMP_MAX)
> +	/* A zero value for gt means that device has invalid efuse data */
> +	if (!gt)
> +		return -ENODATA;
> +
> +	if (gt < LVTS_GOLDEN_TEMP_MAX)
>   		golden_temp = gt;
>   
>   	golden_temp_offset = golden_temp * 500 + lvts_data->temp_offset;
> 
> ---
> base-commit: 632483ea8004edfadd035de36e1ab2c7c4f53158
> change-id: 20240603-mtk-thermal-calib-check-ba2ec24a1c32
> 
> Best regards,



