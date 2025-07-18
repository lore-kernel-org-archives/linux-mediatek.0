Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34956C83F1A
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jul 2025 07:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4txmodoK38XRs/c/EmcvVo/+3dv9iengSTpUIkxzJeM=; b=GIJg3MJS93l98Q8L/QGwmZ6gJa
	L4e4E3T0AdDU5kuCCF3ghmfNzznXXVSlowVZgxuYW5K+i6difCXGUjp3RhWCRFJGz6SEVthUkRkxx
	+ooYcP2RrbeadGHC9FMQEnNsoPl9ln+ZbUEB3f0leKXthnMt6rpn2IWsCAdwj/mSyR8jxXAo0PLRg
	zyki+ZrVEm6JBFBtS1rbZl+wICpuJlmBNp1HMkU5zMZVo0bMIIjzjzZYZM9YcGLn7D2FGgz7pueUO
	RmExh78KeJeFYZCxO3sZdLtOoJMNPYZ2PvaYu49CJxONkmSHITwhy309u+GWFzQIH1KuSlRAcas04
	VYfMtBMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucfCR-0000000BqPG-0KrW;
	Fri, 18 Jul 2025 07:08:07 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucetu-0000000BoAR-3asi
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Jul 2025 06:49:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752821337;
	bh=Cam2JCWYE+AhdiTGpp3U6Crx7h/60ZtiTadCn/kFn8s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KRN/SmZOi39TtZ/lXASxxb5Qni6eSNNQPO3baDCiGypeZZJhKjzPGD3xtRQRYUkun
	 wmh4VOtikVfvOKzZa8FC9iG+lvMNS3Lrnp/HvgyPPyYFaYLNxjCVHmPv3rI7pl5KRm
	 zsZKoN6TlFNnbw/bpRYtLASV8tSD/xgqi5PLNbntJwJFXtJ57oa2ur18mAUVFdiIyn
	 S4ywV0fZuVkp8VRYa0Wz4RfWwhOKWY9wvNVyPKxkMDnXVapcsVt+lqZGOsXGuHlw1S
	 oORvkkFizQq+/g81sLuU9dakw6gUaQr7YulurCn6ynWoXRQYgPc3gurI3R4HTAD6+t
	 qN7GOGKlKQZdg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E818817E1544;
	Fri, 18 Jul 2025 08:48:56 +0200 (CEST)
Message-ID: <e9e60ce4-c8f4-45cf-9ac2-b147eabc3201@collabora.com>
Date: Fri, 18 Jul 2025 08:48:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] ASoC: mediatek: mt8365-dai-i2s: pass correct size to
 mt8365_dai_set_priv
To: Guoqing Jiang <guoqing.jiang@canonical.com>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com, amergnat@baylibre.com
Cc: zoran.zhan@mediatek.com, linux-sound@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250710011806.134507-1-guoqing.jiang@canonical.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250710011806.134507-1-guoqing.jiang@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_234859_044460_654103A3 
X-CRM114-Status: UNSURE (   6.93  )
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

Il 10/07/25 03:18, Guoqing Jiang ha scritto:
> Given mt8365_dai_set_priv allocate priv_size space to copy priv_data which
> means we should pass mt8365_i2s_priv[i] or "struct mtk_afe_i2s_priv"
> instead of afe_priv which has the size of "struct mt8365_afe_private".
> 
> Otherwise the KASAN complains about.
> 
> [   59.389765] BUG: KASAN: global-out-of-bounds in mt8365_dai_set_priv+0xc8/0x168 [snd_soc_mt8365_pcm]
> ...
> [   59.394789] Call trace:
> [   59.395167]  dump_backtrace+0xa0/0x128
> [   59.395733]  show_stack+0x20/0x38
> [   59.396238]  dump_stack_lvl+0xe8/0x148
> [   59.396806]  print_report+0x37c/0x5e0
> [   59.397358]  kasan_report+0xac/0xf8
> [   59.397885]  kasan_check_range+0xe8/0x190
> [   59.398485]  asan_memcpy+0x3c/0x98
> [   59.399022]  mt8365_dai_set_priv+0xc8/0x168 [snd_soc_mt8365_pcm]
> [   59.399928]  mt8365_dai_i2s_register+0x1e8/0x2b0 [snd_soc_mt8365_pcm]
> [   59.400893]  mt8365_afe_pcm_dev_probe+0x4d0/0xdf0 [snd_soc_mt8365_pcm]
> [   59.401873]  platform_probe+0xcc/0x228
> [   59.402442]  really_probe+0x340/0x9e8
> [   59.402992]  driver_probe_device+0x16c/0x3f8
> [   59.403638]  driver_probe_device+0x64/0x1d8
> [   59.404256]  driver_attach+0x1dc/0x4c8
> [   59.404840]  bus_for_each_dev+0x100/0x190
> [   59.405442]  driver_attach+0x44/0x68
> [   59.405980]  bus_add_driver+0x23c/0x500
> [   59.406550]  driver_register+0xf8/0x3d0
> [   59.407122]  platform_driver_register+0x68/0x98
> [   59.407810]  mt8365_afe_pcm_driver_init+0x2c/0xff8 [snd_soc_mt8365_pcm]
> 
> Fixes: 402bbb13a195 ("ASoC: mediatek: mt8365: Add I2S DAI support")
> Signed-off-by: Guoqing Jiang <guoqing.jiang@canonical.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



