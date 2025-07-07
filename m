Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8F4C83F07
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jul 2025 10:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lCuaMhEg+e2hu2m3KuJ/Sm1C6CpyUapr9vos6fnOjdk=; b=mXXyzxGibBg/mN9Q160+SnN5+Y
	WJRkJ6PG94eqQd+qZZkvi6G/2HtM0ub03IZlSutCuBqo7X5t98GV1li+9pc5bstzkVO9H6cWgezp+
	wJUv84CLqcS237Cr0JZjAnoTcKikM3qlA4ofhzf1YhbKyPtI66CAr5CtHe9hy7ZL+7Toj2cfcAmKK
	ZGLMhGp+Tfr34/yKQ/NNpGw6kz4kHuVrrItwGbPI0FEFj6nOL2pjGhB7dmOMpurOLXaD8uR/SXWb4
	8SuvNk7nSCA6W2xN0NxGjomJMkJpW7ufzXLiIbXRMOrt+IqXV5p2KizXMmSN687ggWmE78w6bCtPx
	fsV9vUmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYilT-000000025zz-32BK;
	Mon, 07 Jul 2025 10:07:59 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYiHs-000000020PO-28XV;
	Mon, 07 Jul 2025 09:37:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751881042;
	bh=+HST+oI1csepHuidMdAGM1zRVBg04v+JMM5to57Ig68=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z1P6IgIo/+1evlnaLwfZqWS+jqcAJed+atKLO6Ei1hkuFdreiBTqnfQ1dAIlnIJst
	 IYMc6ANZ7W7EWKqOh2xRv+HpkoqDDLKRNQN6lT68oFAwnVIsDf415vVBe6S/FIhyrs
	 lBD4CbtluH+YkKDhmnTNiI7mOepa+PCKysVGEYsjli5quGyQ4mgFvel4pR14jKOGxy
	 ot0v8H8oUlb8NwwFvtPGjKKtGlzlF3DxhqdyJYla/0NFsVSMOPKazgRgoaBUqX7fZB
	 AuxKOCS6NE7+e9qBwIcaDU8YgaDe10YOndP0u9KML9TyNIdfyh9Jc8+LZu8uSfF/Dd
	 Cpdyd1E97ArjQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5E45717E07C9;
	Mon,  7 Jul 2025 11:37:21 +0200 (CEST)
Message-ID: <d79e0e46-87ae-4d9d-ba67-41e3055c809c@collabora.com>
Date: Mon, 7 Jul 2025 11:37:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: Use of_reserved_mem_region_to_resource() for
 "memory-region"
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Benson Leung <bleung@chromium.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: chrome-platform@lists.linux.dev, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250703183523.2075276-1-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250703183523.2075276-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_023724_724084_8C012015 
X-CRM114-Status: UNSURE (   5.91  )
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

Il 03/07/25 20:35, Rob Herring (Arm) ha scritto:
> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

For MediaTek:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



