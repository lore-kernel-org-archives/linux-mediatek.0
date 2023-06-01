Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D8AC7EE2A
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 10:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SsE3wVKRIDHr1lfgpC5EyGyhYwwCxEIWuqBkprDFd8I=; b=v60IOZPx/FZz8BQW9EZhI0AQ1j
	kMD34x9R4wQFJu6u5nuXuh/4hH8ikmt1kttrk6HFBxJwjsouenANqaVEUkGDGre6FM9QHI8li7bHk
	xCOzKim9R4rpOLWXSFKZTVmHvOM187BP/x2q+xQ5khja5x7ZkIfCu07Er6M4I5TbA8ajod+0lx/nE
	+bSlVCOBlwAeUuWAcNn62RUUZM3uyxUDmzjJ45fYNK844be1QrLiz9eUQVSDwxXUgahh/Va5Q4pq7
	HEuoaeQSLPy1sO0CWanugdv3aa4Qk8KdY7n/PJv4T6Ee277kEN7RFx40H58NaBLExw6qj7ul3zc7F
	swnfjcdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4f8s-002pWE-1o;
	Thu, 01 Jun 2023 10:02:50 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4f8p-002pUR-04;
	Thu, 01 Jun 2023 10:02:48 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 25F406606EBC;
	Thu,  1 Jun 2023 11:02:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685613765;
	bh=huazch6Zt+IHAcq/GNSQQgxY8jrr5NELWOKD4q8xUaE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ATNpvjzQe4zTjY8d+Fe0GtJpH9aKZB1O4xYWet9M9Aac9H/m1JsBYANT35Jj4/hJX
	 xPXttlFd17NVY1zYfVfqGFK8tkPuRwPXODazZXmQcClMXv10XPaC9/oYk153Mr4WBf
	 YquoYvs7smmxUFZCgF9VI//ro5f6tjFwMmsuqS11nIHEDwx2dfY3WGJopj+Jn8c6/c
	 UOJtK3QqiLw57xYQgdI/RPYHfEaSv8MNJtamhWyJD2UanyWHwJ4+cYeITE4CwcQ6/T
	 N4PhIjjuDa2sTYfSRg8LnDhTZsSalqwleac5w/vadk3wlQWIJe1M1dRGewqW5+weFZ
	 NM3BfJeiJC06w==
Message-ID: <b7864c7d-172e-9903-278c-63df45f6a0ff@collabora.com>
Date: Thu, 1 Jun 2023 12:02:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 2/2] ASoC: mediatek: mt8195: fix use-after-free in
 driver remove path
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, matthias.bgg@gmail.com
Cc: dianders@chromium.org, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230601033318.10408-1-trevor.wu@mediatek.com>
 <20230601033318.10408-3-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230601033318.10408-3-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_030247_185322_65FCF7AC 
X-CRM114-Status: GOOD (  12.51  )
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

Il 01/06/23 05:33, Trevor Wu ha scritto:
> During mt8195_afe_init_clock(), mt8195_audsys_clk_register() was called
> followed by several other devm functions. At mt8195_afe_deinit_clock()
> located at mt8195_afe_pcm_dev_remove(), mt8195_audsys_clk_unregister()
> was called.
> 
> However, there was an issue with the order in which these functions were
> called. Specifically, the remove callback of platform_driver was called
> before devres released the resource, resulting in a use-after-free issue
> during remove time.
> 
> At probe time, the order of calls was:
> 1. mt8195_audsys_clk_register
> 2. afe_priv->clk = devm_kcalloc
> 3. afe_priv->clk[i] = devm_clk_get
> 
> At remove time, the order of calls was:
> 1. mt8195_audsys_clk_unregister
> 3. free afe_priv->clk[i]
> 2. free afe_priv->clk
> 
> To resolve the problem, we can utilize devm_add_action_or_reset() in
> mt8195_audsys_clk_register() so that the remove order can be changed to
> 3->2->1.
> 
> Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



