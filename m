Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA5DC6FA86
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 08:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WjaQMvp4NYNXLmKC07XPePf5E52xIBgsOm+nSEUb1tI=; b=38oFsPFnRe9aL2/DbqvwaguDmZ
	yUH9mj4XzZVM9ah26v9vOHwzyWtYZosUL/XqgxYzGfHObGC7i7w7s9V1E87Nfx3x4d6xbj5OsfTcm
	PU65bwV6lr06oqP7Fnpem2US6+trHP2K8BYGrQz9EUQop2CO4/TqtyKnI4LB50MGYOh6CsX5Cr9/m
	9LtXSHiv6C+KR3wiD098gKrIDh/Lxpit3PxdvrnrYgxdXiRen4hcyQXtT6m5+K8xf5ca0r9RPyrEH
	G+HQfxI8XTmLbYuSnc5AIDJz+GrXP3yaSvTLNdpKuaVCwbSijFsgUqnQOvmRBphLlrH2B4SiYJ/Op
	sBpJAN2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obeWW-0037CD-Sd; Fri, 23 Sep 2022 08:59:04 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obeVf-0036kd-7U; Fri, 23 Sep 2022 08:58:13 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 50789660223D;
	Fri, 23 Sep 2022 09:58:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663923489;
	bh=8bO5EiEizz+7P8tBXn9XnCbdhabQw8P9DY/Ybtu5Zb8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f+MuX2YF0nczTug0TPbQ42ZOADH0YsYO2eS7e7OV1VDnoyN1n770BwfqCqGaGpSNM
	 1oP9k62EgXnkO1mEV5zCEFOW5ZHWo1DPulvZHN2Wr5jftfvp96xn9wUm4NFfnaRSUS
	 CQiBpVke+vvcQKTJkFEZKXMEm1M8VLtLpNjgkxs4p+B3KIYhHLvELPMayQXnywlYs9
	 YdeE4yPDIvi0AWeT0KRelVPOEj8RM6aKVt8PgysjA1fKfH0UYnk7oSPMZUklQZklIi
	 2donUeVIy0VTBm1cWDfocDWgrj51X+6MkqClAgSJaQDnKcqL2qW7dIUmaU+Xe6Zlsl
	 C+A+gyYzX0Y8g==
Message-ID: <09f02f77-2360-6215-6f57-96c9d5135d6a@collabora.com>
Date: Fri, 23 Sep 2022 10:58:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 4/6] ASoC: mediatek: mt8186-da7219: Expose individual
 headset jack pins
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>
Cc: kernel@collabora.com, Jaroslav Kysela <perex@perex.cz>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, "chunxu.li" <chunxu.li@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20220922235951.252532-1-nfraprado@collabora.com>
 <20220922235951.252532-5-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220922235951.252532-5-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_015811_422973_029D43CA 
X-CRM114-Status: GOOD (  10.36  )
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

Il 23/09/22 01:59, Nícolas F. R. A. Prado ha scritto:
> The da7219 codec is able to distinguish between two event types:
> headphone insertion/removal and headset microphone insertion/removal.
> However, currently, the mt8186-da7219 driver exposes a single kcontrol
> for the headset jack, so userspace isn't able to differentiate between
> the two events.
> 
> Add a definition for the headset jack pins, so that a separate jack
> kcontrol is created for each one, allowing userspace to track and handle
> them individually.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



