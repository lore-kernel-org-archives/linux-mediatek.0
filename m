Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F11C54EBE
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Jan 2023 09:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m725rkYEEiccUL27dDPRd/8hpGKmByP0NZt9BFsoyt4=; b=fvQqy4zeIFEE1d6wi4W500SrAF
	27IKyTVsgChVGPUvhoKmHHI90jXT+8OV6Q9UOzhmEU8R5aK3uOXV04oO4aoXxVhV7h4vdX2PWRZOs
	Fd8euJ3bpwjVGplSkx9PeYJF+rRdQOBrC0Ay17kzJOGovKmpd50iwuAEl1+FoaWsud/nIHTc6D1HI
	i9wtvgAnysj97hJ3FLl6KIYxV64tok9j1JUk+c8ezY0HjKYpGJOIHespWfcMP0PMHFNOeBQUtBw5i
	OWW3LTkkzv52cD++TweDIGcPJxvG62l3U/ar86y3GBiYBfH1m4GkLxYgU9TAutodp4Ey7KUNPLx6Q
	dAltqc2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFAqT-0064ac-Nw; Tue, 10 Jan 2023 09:23:01 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFAqG-0064Ue-S9; Tue, 10 Jan 2023 09:22:50 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E34A56602D72;
	Tue, 10 Jan 2023 09:22:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673342567;
	bh=I2gJPlcF+jyW1J551Fuqu3z1Wg3HeLzZXwOmprSzWkg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Srm7lmvX2lAUDnh8Y6LXq9YXq72EXOwU5zwlPc90QrJuH51Pko1MOj2SWwvFd/wwJ
	 KPygbI+Pu4+s27nftvJetY7YDydh8fmzzizysqDvnB9TFEtOSJn0zOMclRbaTB9sfV
	 d5Q4/YdrOr1JWMY+ZQhbdIJGCc4RRiqahOGeMTCxelyYPAZB1skcJoE9CdhBCbJ6Vl
	 11MeGdnX4vD48PVqs3mbZxE658TP5exOrYFVajotf9tfLX7zdT/SaBuRQR+tpjjDvg
	 jB0jXC+O8s9UtnsrqVs635Sam1mlO1W0Vyf4csB/23bQVClPkSp6JgR+pa1LlInjXF
	 sJWTIh0RRVh0A==
Message-ID: <21efdb3e-3c4d-0bc9-bbde-34ec3e04bfad@collabora.com>
Date: Tue, 10 Jan 2023 10:22:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 3/3] drm/panel: boe-tv101wum-nl6: Fine tune the panel
 power sequence
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com,
 jitao.shi@mediatek.com, thierry.reding@gmail.com, sam@ravnborg.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1673330093-6771-1-git-send-email-xinlei.lee@mediatek.com>
 <1673330093-6771-4-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1673330093-6771-4-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_012249_067667_FA45B0CA 
X-CRM114-Status: GOOD (  18.89  )
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

Il 10/01/23 06:54, xinlei.lee@mediatek.com ha scritto:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> For "boe,tv105wum-nw0" this special panel, it is stipulated in the
> panel spec that MIPI needs to keep the LP11 state before the
> lcm_reset pin is pulled high.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> ---
>   drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> index f0093035f1ff..67df61de64ae 100644
> --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> @@ -36,6 +36,7 @@ struct panel_desc {
>   	const struct panel_init_cmd *init_cmds;
>   	unsigned int lanes;
>   	bool discharge_on_disable;
> +	bool lp11_before_reset;
>   };
>   
>   struct boe_panel {
> @@ -1261,6 +1262,10 @@ static int boe_panel_prepare(struct drm_panel *panel)
>   
>   	usleep_range(10000, 11000);
>   
> +	if (boe->desc->lp11_before_reset) {
> +		mipi_dsi_dcs_nop(boe->dsi);

NOP will never reach the driveric if it is in reset, which should apparently be
the state of it at that point in code.

I guess that you wanted to do that after LCM reset and before sending init cmds.

Regards,
Angelo


