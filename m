Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C28C4167B
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Dec 2022 11:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cYPiH0H8hVoO8KCVfLxKBPm6L9FNsu/UgQULQecMrXE=; b=owj8xolZZ5Szsuzaa7XWMz+tY8
	/YTa44iyQWAyiu5v3S9x2ntxw+KO2QjMsQjehbSyAxFqb2UE4IhsfoKeyDS3TjpeRo8YYgguRrEG7
	qRWGHnZq8sdBdVlFsm6fFyiRQVnrMVs3gN1PwY2dgE0sGIIHESs7Yau/3Bp0at//Y5VCeItScu2gl
	fRGtSy4hWc2SA00ht3rL76qtCDNAQ17TXkrFVhCY3HDqpZ92w/hFbAEScPf+5tS7EGrs5ochfLM/A
	YXq249eJ1Hf4I1gCZUNqnD74B85SYQHgrcjtOcHmMuxk6X6rJLfIkBQ+0Poa7MWiWRrmqOzOlEaAX
	iajtfVyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8JUU-00Amsg-Fe; Thu, 22 Dec 2022 11:11:58 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8JT1-00AlYD-LF; Thu, 22 Dec 2022 11:10:29 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BFED46602C6F;
	Thu, 22 Dec 2022 11:10:24 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671707426;
	bh=1VV3PV4DFwuRhrgwzA5i8j7Y/8qd1/nPfWjZ1UySweY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=brtAnpPUwF6zMXLIly6NpwDVeLaqpY1nUMspH9wpP2b5aH/DRpc/xpmqOERRURK1e
	 k8SXkVbxWB8SfmEplU1ZYJM5CHJTcfCHu2OQ7aTO++IdmYUxMl0Xjwkwb1NAOQLx/7
	 dd6GpCjVv2/8sY1+BnVgeNGj4yZea4kg0r36qKPzl41/70cVdvhw+okDps11XnYHsu
	 XFqJY9Qilzo1/fDE+2wmoMAtQUDOb1iPOVlFTDj6DX4Hk53ypZ0i3Qu+xWfqQfwU3c
	 1nHpS9hnfnsG+XcY7eDwbdV17UgB3NUp2NqsTlw+XQ0j74L5rDfP4r7BgtlH17ewlz
	 2Txu37BAw2yOw==
Message-ID: <e42767f6-7374-3d68-b267-2683970055ee@collabora.com>
Date: Thu, 22 Dec 2022 12:10:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 1/3] dt-bindings: dsp: mediatek: Add mt8188 dsp
 compatible
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Chunxu Li <chunxu.li@mediatek.com>, Dan Carpenter <error27@gmail.com>,
 YC Hung <yc.hung@mediatek.com>, Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221222072150.10627-1-tinghan.shen@mediatek.com>
 <20221222072150.10627-2-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221222072150.10627-2-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_031027_926867_A183B34B 
X-CRM114-Status: UNSURE (   7.93  )
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

Il 22/12/22 08:21, Tinghan Shen ha scritto:
> Add support of the single-core HiFi5 audio DSP on MediaTek MT8188 SoC
> for pre- and post- audio processing.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



