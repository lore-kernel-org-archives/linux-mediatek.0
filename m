Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43C5C64ED8
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 08:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fd57ANd4c1nyXg5ucKFK3CMi2edvfLOIyAX2DuG6HUk=; b=3NiuhlZ9KibXy9n03Kq6z5vMnS
	IOJrW4vYV5qLbZU3OfF70K9xhJrG9Cskdz+HVZtMRFU92tp1slmfEu6lYYUxAt9qGg7rJPh8QN8co
	GIeeKzSbwRX7ZrgKWTLSpBjKM32F2Sm5k0fvbMZsGJga/4npsmir4sjewoQkXt7qAOkyjO2GV2fX9
	r+KbWPVA+bc2+jR733HrAhaB4MgTwb2tgiXjrKao/94lf4whIn3MBSJIXuKZIbHGwRyCRjFaHdLyx
	IUiAvA2MP6DK83Dr/INQiskJw+ZRwfnIEt8ivV9mMhv2PpI1ORysYqpnDd5wrHn5EAmwWwbgO8EuN
	fuSxHPjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWZFc-008uta-LQ; Mon, 27 Feb 2023 08:52:52 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWZF8-008ukb-Fz; Mon, 27 Feb 2023 08:52:24 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 378FD6602E18;
	Mon, 27 Feb 2023 08:52:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677487939;
	bh=iEJK2js/QFKtD1YBikNmsiO1EV/a4sU1Z5jrwed3io0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nXIw6c9uepzxTtSl0nQDclZZXaC9DCFuuldSYTHEf0h67pgRSdtiV/qfdUbljhGVm
	 DhjyeRK5DFNP3Vm3HpG7VssLeohHBMa2gF/KbP6sZUDAA23zeXq39PyQdKmSS7MZKH
	 c1FZPyM9wQYjFDyMK3yduGIkw2lvgrMdDL1tyS2ksFuyTuFoAeo8gQzrRD/8BTae9c
	 UktRx12LOLfLBwJIdzsANnXb6p722Uk++TFxotni6nCh65fFLrmSiZ9TUOWqttwBcf
	 IlrN219DYistwEets45mAoJcObeKRLVTFaWGs1GXOYTOyH3JVWXQIzxMg+xoewVm41
	 FE0taioDTwuuQ==
Message-ID: <6fed4310-f6fb-b1cd-b337-38ac0db1db8b@collabora.com>
Date: Mon, 27 Feb 2023 09:52:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/4] ASoC: mt8192: Fix event generation for controls
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
 <20230223-asoc-mt8192-quick-fixes-v1-2-9a85f90368e1@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223-asoc-mt8192-quick-fixes-v1-2-9a85f90368e1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_005222_707634_18683C71 
X-CRM114-Status: UNSURE (   8.75  )
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

Il 24/02/23 15:03, Mark Brown ha scritto:
> ALSA controls put() operations should return 1 if the value changed and 0
> if it remains the same, fix the mt8192 driver to do so.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


