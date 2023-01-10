Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47351C46467
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Jan 2023 09:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EOf6ONcI/V7x449Him0l7Gy8Z1+yB3ukF7G+JOuUtmo=; b=hNcTxG73YM9D9AAzs6cJtSLvIV
	ab3wqW8I0de7MJr1pid3aCaT0MZuf9WlcwMioxgotTkUCEracXNx/4hkGQq0b1lakxzp6mkrLYIF8
	wKdK7wlkAeHzTCQlk+14beSp70OpadR45PxP+fO5gXoDiSWeqUrspSDFm13GKQNMlQZcKKRwCvYyM
	PzRBs7PFQaNYN0mA3F6cP8uUbZRnRPkvkXVu7uh2KU0i0CzpkEoDPjNB2Q5llgbvaXOVuy3VDBnjD
	Q0H+gbceYAi9l+UojJbnI59qdP2xKLthAQI4ppK60A0tZvQAU0afvkjhlhO/L00bN9iLGIZ4CRDJ8
	kCkBrZhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFB42-0069CD-I5; Tue, 10 Jan 2023 09:37:02 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFB3g-006936-TX; Tue, 10 Jan 2023 09:36:42 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EC0986602D6F;
	Tue, 10 Jan 2023 09:36:38 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673343399;
	bh=uSowM5jqFDNQiGdft8YboLtHI+wKc4mcCdsfgeYisSY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LVkIcqgcg4cglsYzP+u74GgzDzaOe8wq3tX8+hd3U8QPP+D/XCbKeHSAqyyMnCLRH
	 kTjXiq4ucJcsbm+ax/Ym+2q6LWzmZNxdCVudO4709SoRzj64KInpgPQD+JCOprzEuL
	 BlVTSb27mqnRCc5my75L49XZq3sX03RrY8QuBU4ZBVQTACqW/Bw+w1R1M6UwR0rlM8
	 7Su62ObHNChFHgVx42DFQ0chsdkaNPSIOs0Bgs3lxjQuzPk/i+Vt8bIILiU6E8FP0/
	 AcHRtiqnU5G6sNHHGYJ6UKH6p7JC2pmEX/hwdFgMmqnSbDR32sDSLmLxZ9DYupDp8B
	 uHfgBbYVP9M5w==
Message-ID: <7cc4fe44-55b9-a80f-27a5-197070759760@collabora.com>
Date: Tue, 10 Jan 2023 10:36:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/mediatek: stop using 0 as NULL pointer
Content-Language: en-US
To: Miles Chen <miles.chen@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20230110031223.4820-1-miles.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230110031223.4820-1-miles.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_013641_119842_15FF82E9 
X-CRM114-Status: UNSURE (   7.73  )
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

Il 10/01/23 04:12, Miles Chen ha scritto:
> Use NULL for NULL pointer to fix the following sparse warning:
> drivers/gpu/drm/mediatek/mtk_drm_gem.c:265:27: sparse: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>

Please add the appropriate tag...

Fixes: 3df64d7b0a4f ("drm/mediatek: Implement gem prime vmap/vunmap function")

after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



