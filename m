Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D89EC54EBE
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Jan 2023 09:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Qy869W4WJA/COGhfUULrKlao20qUQGGtrJz6931E7w=; b=tlxyJLlPCP7eTpX8fs+65NB+1I
	UbjhJEChOi82y+5IvclktTg5sjsRZ5ORvRLP5DmGkv4DpI1VrwiVCEbe3lO9na6LyKYnaz45Naf9U
	YyhKo6EJXHaqyNjWDQ7HAzz/kbum/snBn7zoKXUAPzS/mgFqzkVRqRt9rruy2x6le0OM20WYNUDCv
	YfGe1H0BiyG0v732xrXIJXkFOIHZTSZ1Dug+gP7amy9TCKO/Q9mbxXIaHz/Qaq5QoOVOhmOEShlZ4
	SJJwi2U68ayKKwfZrnkfy7SQq/goG1c2qU8zSEt9YePBkFm7nOvu4f1PISDzEQc5exa30D2vI3i3J
	D2V2ZkfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFAtF-0065Xl-4b; Tue, 10 Jan 2023 09:25:53 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFAt4-0065U3-Fw; Tue, 10 Jan 2023 09:25:43 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id ACF636602D72;
	Tue, 10 Jan 2023 09:25:39 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673342740;
	bh=UO/47Pe7uv3EMf4vDnz2gYTwAoNr+ErQMvPz7A28Qro=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VMh/LVWlQDpZIehojvWLiTiuVARsqOLpghrySs8Xusy9wQ9h/aDe1042fpaEuCbGx
	 BPKM2r7wR+BKb5Ada4Pbz8msKEgDQeKWCXMdQN5UWvJbgq/ccE5zqnQfqR5pl6S5wJ
	 Y0ZLm0vcXcTdh2nOYe8qrJx+kBqkQPHgAkcfxUAQFp/WrhGCMdlz2D+07bWB6I5Qac
	 s1Yw6/MO1LkC3jRwkURMuWirpVNbjEx5xYQWxFYYr5fB/BIJcjel8o+OMZ63wfxnMP
	 aEWnvm0hEEzl0M2Un2/k0Xn3ybdhdQns3o/E4oDF/lk9nH1CBnYqehnGilEM5zJZTo
	 91UckWqMKkZqg==
Message-ID: <e71a66ca-553b-3d8c-cbc1-3c2a8f4a22c2@collabora.com>
Date: Tue, 10 Jan 2023 10:25:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 2/3] ASoC: SOF: mediatek: Support mt8188 platform
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
 YC Hung <yc.hung@mediatek.com>, Wan Jiabing <wanjiabing@vivo.com>,
 Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230110084312.12953-1-tinghan.shen@mediatek.com>
 <20230110084312.12953-3-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230110084312.12953-3-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_012542_679757_FF9CDE6C 
X-CRM114-Status: GOOD (  14.87  )
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

Il 10/01/23 09:43, Tinghan Shen ha scritto:
> Add support of SOF on MediaTek MT8188 SoC.
> MT8188 ADSP integrates with a single core Cadence HiFi-5 DSP.
> The IPC communication between AP and DSP is based on shared DRAM and
> mailbox interrupt.
> 
> The change in the mt8186.h is compatible on both mt8186 and
> mt8188. The register controls booting the DSP core with the
> default address or the user specified address. Both mt8186
> and mt8188 should boot with the user specified boot in the driver.
> The usage of the register is the same on both SoC, but the
> control bit is different on mt8186 and mt8188, which is bit 1 on mt8186
> and bit 0 on mt8188. Configure the redundant bit has noside effect
> on both SoCs.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



