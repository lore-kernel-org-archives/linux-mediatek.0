Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1FAD3B7C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2024 09:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=da+etUPfK3UiVqwD20QOauQYQZhZSlQ9y584TZLpvQ4=; b=rY2+yslWDccp9MZSj0lwhAV7JS
	XETSsjHiWx6JRMpO3ev/bliIx6svcThpmAfJYJgYZlg5AIV9OU1jqbBLOhThIdK+a8LWJY+q8QMh4
	T5qmuBTYfDVPQI2kBPH6jRBpyI5cAzmCkZKjoDonGewflkavy6YpmqVE2TLaqVWXErSTmiIh4b2SX
	6fK1Oya0zahMPlDwGdMj3DLG+AMcXMzP+ifXyc+pRUYEoLVHUOiaaj6jGlhKctSUDDhGOEzMCUPVz
	EQdV1g7FWmDeGj0bLhMxik3YcoMIzkBYJcXAHiiqTopOtRkSof+AZTgbJRfYmGfWyYy7u4hw5Diku
	bydNjrOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFsBd-0000000ADMR-0f33;
	Tue, 26 Nov 2024 09:48:49 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFs6l-0000000ACNC-2WOE;
	Tue, 26 Nov 2024 09:43:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732614226;
	bh=hFWivGWFXV2zKkOhtrDzHW7UZpgq/HrqUay9ptzgzvQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AiMtB6v3MhCGjwobllJZh0jq45f2sY/xCLlf9fe7ebbZHaitpkBVLxG3FpkJcnYcM
	 6hhMWZcvXb1d8UHVkDa1jkuEatG5LMs+zYIh2Z4NWpstABoQtrnwCmhLFb+hNa/ve5
	 bMDcH0w17cU55tUPozah6QcY4JqE/QVtr0JXxNueP5vrtZRlyhx7xAYC1hts1MpPxn
	 XvBCgWfWH2afj+S042QQOA/rC+wqQVR0045mb/8ehqe4C5y51BDk+VDNUK0BEVNOHO
	 D9qZuV2jgZ5Zzu3waFj/LwkP3G84T0PZnrVgYmLN0ibzoWf+zQJxpUQQlsJssoWbfj
	 GJJRvCSrFHFbw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3F96E17E1524;
	Tue, 26 Nov 2024 10:43:45 +0100 (CET)
Message-ID: <890e4d95-bd73-4176-993a-fc922d72cdde@collabora.com>
Date: Tue, 26 Nov 2024 10:43:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] thermal/drivers/mediatek/lvts: Only update IRQ enable
 for valid sensors
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Alexandre Mergnat <amergnat@baylibre.com>,
 Balsam CHIHI <bchihi@baylibre.com>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Hsin-Te Yuan <yuanhsinte@chromium.org>,
 Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?=
 <bero@baylibre.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
References: <20241125-mt8192-lvts-filtered-suspend-fix-v1-0-42e3c0528c6c@collabora.com>
 <20241125-mt8192-lvts-filtered-suspend-fix-v1-5-42e3c0528c6c@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241125-mt8192-lvts-filtered-suspend-fix-v1-5-42e3c0528c6c@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_014347_802420_01912D18 
X-CRM114-Status: GOOD (  10.10  )
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

Il 25/11/24 22:20, Nícolas F. R. A. Prado ha scritto:
> Only sensors that are valid need to have their interrupts enable status
> updated based on their thresholds. Use the lvts_for_each_valid_sensor()
> helper in lvts_update_irq_mask() to ignore invalid sensors.
> 
> Currently, since the invalid sensors will always contain zeroed out
> thresholds (from kzalloc), they will always get their interrupts
> disabled on this loop. So this commit doesn't change the resulting
> interrupts configuration, but it slightly optimizes the loop by skipping
> the invalid sensors, avoids potential future surprises if at some point
> memory is no longer allocated for invalid sensors, as well as makes the
> code more obvious.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

That's lovely.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



