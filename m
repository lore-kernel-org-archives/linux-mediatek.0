Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F7EC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Dec 2022 10:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K7Y4U5iOrLfq0u1zh5LNXDaE8O6B8PGafj30P5tUVC4=; b=bWCTIE7Qg5VPq6GNaa7Kgh15PC
	rXcXa8cBCHSqj6pRzOhGbVWhDSNwvRJbE9AwI0fSgklpLJv/dMy7cBhQk1w4fr1I176yMvpKk+l5j
	ZfDHoctfCkReLfWJ0CrcimMzC8zX5UUzFejLBoSE/87uXM6mhPDxIhQ35TQ9z9IEcdL0y82/keZvo
	LFyZlh+7cLPX2SaG9/Depxc0p2xmFMYJp+57F1zFeGOCr2ZBEKOIqemJzBP/z2CVwRGw7zKWngakY
	lVANx7inWipuOnsWZwyhsbJL+PdscF4ufhPPB6hlVP0SW2b6havl5K24TWwoKMSe/PjeAxHzKI3mh
	9txrvwRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5lWV-008mUl-7t; Thu, 15 Dec 2022 10:31:31 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5lWK-008mQS-0j; Thu, 15 Dec 2022 10:31:21 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 689146602C5F;
	Thu, 15 Dec 2022 10:31:13 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671100274;
	bh=WIDaz+drK8oF/b9fCu9/41JRPOIXp254wSJ84sWVcpo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GtPBVrT9VvU5Nf3Fdnb3oE7wiZTu+ZLYId5RN1LJmUrey5rm8QajhLVbf0Z38uf90
	 B2b4hDi8Xje+fO3bI86h+8/hGSeGrnNh3jGocVQw+MTAu2wTLDVhktrCS8UKLhIg/j
	 L92zjN95nh15jDys2iegzxct6Jz+nHv5cc5iKMD9xs4FD2fFPu6JDuBDn42qxvaVh9
	 ooXV3i2nIUFqrUBnXacnYDOxtRsCI3ZzbRT2kfD2uOYB6Xa0sPrC/6eXmuZ73MvNww
	 4leYuWdo1YbTervvIs0+KgdF/UQVrmvAO3nr1EDhyIXsI9ebdnD2IUIJg/fQjIYyB5
	 NfG5hvkMkT1Ng==
Message-ID: <7e8edf6f-9971-c704-4299-be9f7098d1cd@collabora.com>
Date: Thu, 15 Dec 2022 11:31:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] ASoC: SOF: mediatek: mt8195: remove a redundant
 comparison of sram
Content-Language: en-US
To: YC Hung <yc.hung@mediatek.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chunxu Li
 <chunxu.li@mediatek.com>, Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Curtis Malainey <cujomalainey@chromium.org>
References: <20221215061046.16934-1-yc.hung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221215061046.16934-1-yc.hung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_023120_217895_398F5D80 
X-CRM114-Status: UNSURE (   7.65  )
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

Il 15/12/22 07:10, YC Hung ha scritto:
> DSP SRAM is not used for audio shared buffer between host and DSP so
> TOTAL_SIZE_SHARED_SRAM_FROM_TAIL is zero. Remove the definition and
> redundant comparison to fix coverity "unsigned compared against 0".
> 
> Signed-off-by: YC Hung <yc.hung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angeloigoacchino.delregno@collabora.com>



