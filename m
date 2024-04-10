Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0CCCD11C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 09:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TcKpkhK7yC5OOsiI8Wt9Qnd+V1jtIodBWge1iHuZc1k=; b=saYb/7yYaSDVzh
	DQNUIZv0tH20FhpeaJwil17BxOIF/YNe4MtNTScL1dpcRQSUOAJM5RiY6mHah9FMSQud/5DmBqwX3
	3KC26AeL0hTa7o8hKithO83u+DVU3KNKRRZS/pKVwVCyRstAgXURuVshQpRNA+lC95j9msVZ68/B2
	ll1O7WIlGgHNyFOvQPDXCXcWNhTFRjxH9sT214BKAxB+RwuSXafGC66B3snVhQ78xugmQd7lyW2Wk
	gkTGFaaTP54BS+Dl1MOkMS1tcifK/3wxoNoe+vxWmUS4Lng3ea0gf4mpKHkvGues5AX0Ox2/kmY2Z
	cZFAl7p+/jtbFVtofq0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruUgH-00000006FoX-1pP2;
	Wed, 10 Apr 2024 09:55:49 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruUgE-00000006FnV-0nPv;
	Wed, 10 Apr 2024 09:55:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712742943;
	bh=vtMV+Q63GqmW7FHaxb//RVu//0rLNFnAcEs9bPdrm4I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=H+y0ra/c8fi8Dwjg9BpujJCQ3xxygBdVjA500qeuCeFzp+ZJCdVlH8vvyIyeB9HsR
	 DA5s1nO7qp99kI1dgRqnd1PTbpBFjs85i5qV3Hot/2ZAXB89CtB/5J2ArHtfxZIfc4
	 o/FWIUIdxtTElcmjbWlPUDCyyKR6tMyoviCKvabZV/v9HK5a7zrZqMjw0p3nHjnN3w
	 4zb7jFPSByx5cem0sGHo6y2Jk2hE3kOqoj2HdC2Zn2bOr9PjbduZgwf4kp6YPA3R7C
	 5aFuSh9WocJO85woaHW5vSI8fz2DgrmTJwQM0lPD7FsT9kfnHlBFDXjwU2o2Vs0Wny
	 qEFI8NSPXteGQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C1E25378000E;
	Wed, 10 Apr 2024 09:55:42 +0000 (UTC)
Message-ID: <9c5aa4fb-a83c-470e-acf8-dd31303e50c2@collabora.com>
Date: Wed, 10 Apr 2024 11:55:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts_thermal: Remove redundant
 code in lvts_ctrl_configure
To: Pin-yen Lin <treapking@chromium.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Pitre <nico@fluxnic.net>
References: <20240410000730.628043-1-treapking@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240410000730.628043-1-treapking@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_025546_404767_6A0354C3 
X-CRM114-Status: GOOD (  15.95  )
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
Cc: Minjie Du <duminjie@vivo.com>, =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>, Alexandre Mergnat <amergnat@baylibre.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Balsam CHIHI <bchihi@baylibre.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 10/04/24 02:07, Pin-yen Lin ha scritto:
> The removed variable assignment is never written to the register, so it
> has no effect on the device behavior.  Mediatek has confirmed that it
> is not required to initialize this register for current platforms, so
> remove this segment to avoid confusion.
> 
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> 

Added Nicolas Pitre to the loop;

Nicolas, since you're pushing support for those, can you please check if CALSCALE
is used/useful/necessary on MT8186/88 before I give a R-b to this commit?

P.S.: Can anyone from MediaTek please confirm if the 0x300 value is right for this
       register? I'd still like Linux to properly initialize the registers, even if
       this could technically be a default value.


> ---
> 
>   drivers/thermal/mediatek/lvts_thermal.c | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index fd4bd650c77a..48d2f8ba3f18 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -985,12 +985,6 @@ static int lvts_ctrl_configure(struct device *dev, struct lvts_ctrl *lvts_ctrl)
>   	value = LVTS_TSSEL_CONF;
>   	writel(value, LVTS_TSSEL(lvts_ctrl->base));
>   
> -	/*
> -	 * LVTS_CALSCALE : ADC voltage round
> -	 */
> -	value = 0x300;
> -	value = LVTS_CALSCALE_CONF;

As a side note, I believe that the original author wanted to write, instead...

	value = LVTS_CALSCALE_CONF;
	writel(value, LVTS_CALSCALE(lvts_ctrl->base);

Cheers,
Angelo

> -
>   	/*
>   	 * LVTS_MSRCTL0 : Sensor filtering strategy
>   	 *


