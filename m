Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49682C64ED6
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Mar 2023 10:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pz4fNkX9jIjLAWtIRhRGwLjsoJLiUPF+Yn8yGDcu1b4=; b=wfBF08J9el/IWqdUKZ7kBDVe7/
	UnMn7UOT11yBx9+s/eYAZaXrST+LY409dwD/jzf8BwBVJMlIqWztwOTBWk305359WwnWz6aTKDVYS
	WxzXY935kv8hhRh6M6PAL0QdKYDRF0Bj3O8f0tR9eJiTP9c5Rqa8DBWGZrT3htDtGMa18DmYIOR6X
	YYiKZJ6OKQDhcv/oqM9Bq6mjYxdiZ3/6y37+Sk/htPrHXqdScO11ni6GIXz4x5+dlw5xBduVGaUsL
	pM6QpbdWFzo8FksvZoPzcLt8FG2gUkBR84wgnpBpEB3VneBgVW40mJxKv/GOS1NOYD3xScpf3pW5o
	5zDIopRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXJLJ-00FjLb-G6; Wed, 01 Mar 2023 10:05:49 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXJE7-00Ff9J-BF
	for linux-mediatek@lists.infradead.org; Wed, 01 Mar 2023 09:58:24 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 78F7D66020E0;
	Wed,  1 Mar 2023 09:58:21 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677664702;
	bh=8ndsZkKsreebHEGikuSigtJ8zQTHmJC5HspQV2Bo/rk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AiD+koqnGnT97mYujB5jOi3lxWhakT7ezL9D2aICxDP0RsZl4mEHO0XoDERpBphoj
	 7EtdnxQ6NcGtV8SZvsb/AX9KV3vbqD9+ldPLz4OH+zhepu2xvbxHag0z37m70P1sdN
	 pOXw5d9NWhVreFRPGlROANDOIH5iVfN83cyBpWJbxVrMZ3AoUPSkoh4JyAUP2SzbMT
	 Iy2thheD2P++lWPzCUtDxMtqbdxID036gN/PCNmjLLZb2T7Hskf+j0lO05ECe/a4qX
	 JmkqKToNgUHCQxfRkLdMi6Pafafmcah0djwT1tGg8m6od2Mz1NNoQnR2Pk32ojUuLd
	 +FCALBYCHFgpg==
Message-ID: <3bcf01ef-e9af-3216-6cd3-7cc08a5bfedd@collabora.com>
Date: Wed, 1 Mar 2023 10:58:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/mediatek: dsi: fix error codes in
 mtk_dsi_host_transfer()
Content-Language: en-US
To: Dan Carpenter <error27@gmail.com>, Julien STEPHAN <jstephan@baylibre.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 kernel-janitors@vger.kernel.org
References: <Y/yBC4yxTs+Po0TG@kili>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <Y/yBC4yxTs+Po0TG@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_015823_560269_F0B70C56 
X-CRM114-Status: GOOD (  10.95  )
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

Il 27/02/23 11:08, Dan Carpenter ha scritto:
> There is a type bug because the return statement:
> 
> 	return ret < 0 ? ret : recv_cnt;
> 
> will not return negatives on 64bit systems.  The problem is that the
> function returns ssize_t types, while "ret" is int and "recv_cnt" is a
> u32.  The negative values are type promoted to u32 and returned as
> positive values instead of negative error codes.
> 
> Fixes: 81cc7e51c4f1 ("drm/mediatek: Allow commands to be sent during video mode")
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



