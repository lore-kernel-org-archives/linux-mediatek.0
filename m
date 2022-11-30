Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9E7C352A1
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Nov 2022 11:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CxNbVLSfNpWzIUpPVb9UPxVDyMVsByVITYiLdHXar9Y=; b=aGf2sR4nCwa2uq8FtpQltPjxTq
	wclaeDrXQOm5yaFrES8xZJ1f97CH0S+mA5k5lQzzI4ddOuGQRyiDHv9t+9KUwCW/K8qu9O4rouOfj
	qEk7W04ZY+mZSalDcaicGpxjzl6XZZEnXndZgdyYje5WG/E9ZOoovsmHi4VDj7u2q95uSNEbryeVw
	pL29LuV8SHxNOm5g/Pz4wUnPktc18nzLslLPV6Sqx1fua9zQducSZ0NJniKyzoJC4boLll4tU/9gG
	d+eH+pPTnIdFMAJBnPX75jTOpQG5Gc9y/RfZXKCg54dI7AXtLTvq7vvS9wBBfsjxCOo59PwQZHDMr
	AlfHh7ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Kv5-00Feg2-Ex; Wed, 30 Nov 2022 11:06:27 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Kus-00FebO-8e; Wed, 30 Nov 2022 11:06:15 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EC84F6602B30;
	Wed, 30 Nov 2022 11:06:11 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669806372;
	bh=Vjz1D7fPn+LzVWFAgAbnGfbzxs0NBWSFhZrWPMUaMg4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hzb39mNuGctzT/7k70YPp1QxYuB+wbssfrnCGJrdEACeyOXdM7cr0I6i+M4tpCkhu
	 3wpsWoiq2PBwE4XqBX6eM9kkrvZwY/FWTogxWcShwDX7TPwPw9LCkHbahD9V60p+4H
	 nUKw7F8JLfz8jSdqtxVOgfYHjVxOv090WgVtrl1cqYEDx4aGFYUCiKeNyIzbirR6o9
	 KKH/ovphqjoPyng3IQRPm+SwMW8qLqDfDsFIWlMMf62LSf1YCK4U/IQulKE2u8AQsU
	 7m3KVhrNO4/7kdmmbLMoBkd+LlHVmrhdAnyU8+gcqBhiHUqWkHK5cB1/2149/tTn00
	 1cgJwO13MMoSg==
Message-ID: <90661309-5947-38f2-e4c7-67066658f448@collabora.com>
Date: Wed, 30 Nov 2022 12:06:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] ASoC: SOF: mediatek: add shutdown callback
Content-Language: en-US
To: Ricardo Ribalda <ribalda@chromium.org>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sound-open-firmware@alsa-project.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20221127-mtk-snd-v1-0-b7886faa612b@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221127-mtk-snd-v1-0-b7886faa612b@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_030614_482344_695F91E0 
X-CRM114-Status: UNSURE (   8.45  )
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

Il 27/11/22 21:04, Ricardo Ribalda ha scritto:
> If we do not shutdown the peripheral properly at shutdown, the whole system
> crashes after kexec() on the first io access.
> 
> Let's implement the appropriate callback.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


