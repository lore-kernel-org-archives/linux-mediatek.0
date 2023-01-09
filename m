Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADAEC54EBD
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 11:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Sp1TspWLtoWenH9GeK/jMvbb6wAZrxjtykfCo4AlRY=; b=uYV2dDRbALoKuNgmvLDJ5cq6v8
	oygoOqGgamwxmRz0UJvQiH6tL/f39auz3SccPOZfWVzzAPTcg/YZnuAiehDjuGH4Fv1LJnWslrq5s
	UyVINdFDCXlzl2DJIYRGCeLm+LSLnFhfv/GtpZ2Nw1QCX6BHnf+A6dtoGHEnlH/ipoQYqb44G3fVr
	Oa7+CGxKFyWA9Krm+NOqObUPeGe5dh4sib6Cqo8bxOnhKbYg/1WPaMlF+LTLig6kD78MS1DSsBkDD
	40R/FRlLYKYBus2EGeBCao0IY/72XKnyM8gLID7VgVZDT3m8oF9eUyJR6J40xW68l7ho+HpZyQ7KP
	njfKZLPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEqLn-0012tW-5J; Mon, 09 Jan 2023 11:29:59 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEqHq-0012Va-SA; Mon, 09 Jan 2023 11:25:57 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 75EE86602D06;
	Mon,  9 Jan 2023 11:25:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673263549;
	bh=AB2/l46Up7/+QV6Mp4GjW9e9vUcC9MMu+4KrzEQ5hvc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X2N7MMeXAIaiDJfLbW7ZS07CKJKqGLJgRcvEP1SSAhXdmJMejOBphb4aLMRv5EvHE
	 4MfRZ8Ud07gBDIBb3GTgTndnNaV66lrJTsGlgl/zjCdhZE42CVe+IQIgdnHFwp0oGs
	 nZpo9AuXyUwZexUyvyGSCFLFnsWxFBvKwHsvj0fVmRrWHAQiC699pIpBvjKMvluep8
	 1KW2j5fncfXIAUKk/4UtFnwbzEKsf5li3IdRzxfzYtsCMPruVs+EU1dg5TV6hf7Ec5
	 O0EqINTC1FsJe93O0GB/htqGqissi8GFqVwxYC/Bm6WUwqv3BDmD0axoG4cLm0R2KV
	 PMdtzUno7wQqw==
Message-ID: <778af306-ae24-4c49-5e93-7810fad7f8bb@collabora.com>
Date: Mon, 9 Jan 2023 12:25:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] drm/panel: boe-tv101wum-nl6: Reduce lcm_reset to send
 initial code time
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com,
 jitao.shi@mediatek.com, thierry.reding@gmail.com, sam@ravnborg.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1672974321-18947-1-git-send-email-xinlei.lee@mediatek.com>
 <1672974321-18947-3-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1672974321-18947-3-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_032555_245119_93931BB2 
X-CRM114-Status: GOOD (  17.57  )
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

Il 06/01/23 04:05, xinlei.lee@mediatek.com ha scritto:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Since the panel spec stipulates that the time from lcm_reset to DSI to
> send the initial code should be greater than 6ms and less than 40ms,
> so reduce the delay before sending the initial code and avoid panel
> exceptions.
> 
> Fixes: a869b9db7adf ("drm/panel: support for boe tv101wum-nl6 wuxga dsi video mode panel")
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> ---
>   drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> index 857a2f0420d7..f0093035f1ff 100644
> --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> @@ -780,7 +780,6 @@ static const struct panel_init_cmd inx_hj110iz_init_cmd[] = {
>   };
>   
>   static const struct panel_init_cmd boe_init_cmd[] = {
> -	_INIT_DELAY_CMD(24),

You said that should be greater than 6 and less than 40: perhaps on MediaTek
platforms removing this delay is fine but we don't know about others - and this
driver is for all platforms.

To stay on the safe side you should, at this point, replace this delay with

	_INIT_DELAY_CMD(7);

Regards,
Angelo


