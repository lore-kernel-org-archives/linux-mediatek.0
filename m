Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B60C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 09:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pvak8vXpsDRjOHTXooC25SFXlSSfbACSqePH2JW+Esk=; b=UYmYSewg6PVg+dmp43yd/UBvoR
	7as5S3GD9leJZtBDC11KjA5fKg0Qx7Ta6Pq+LHKK+6gAE3IBQpj9BAAnbyutcKs+B/dSX1YiT7SSs
	jnyoLXLje65ZOzlkaFrAOIM/gaWxm0BHs45oIWvLm31vK0VU8iCXZhX3f57BKUqt5KxrfQL5nsIi6
	MK17cYhXw8q4C8t8+U65lVb97Tce0nEm/F3Usi32rbo8Smp2b0DfN+rvyGBosGQCMKpNSp0QDf5VS
	NY6yM5nwdA9tMXhOvs0Uapx/6dO6JCqLyPcjtGFMgZ4awjlROyMB1C+zli49d4mzAmXnx0Ol8rKQT
	l36jUyaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4J04-00EIqG-Pr; Thu, 23 Jun 2022 09:19:44 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Izt-00EImA-5A; Thu, 23 Jun 2022 09:19:34 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2FF226601752;
	Thu, 23 Jun 2022 10:19:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655975969;
	bh=jvTSpUApFuNR+zry7deDGr045Bs+SsvwvHOVl8kQWBE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HtlXJ6FpjazjmbTMa4K2OgCwmcUvIgnEBsNkestc/XFp/KcB1WYvMxf57uDyTjU79
	 +UmT84cZ5l7aebBlizcY3SvC9cSANEU7MooekayQBaJAEImjOp+g7A8BYnJgcNLPtM
	 HKogcZk+1CnKeTDKJYkek4EsPkyAtW+kBdvfFMnolf26yDoAHWwi+DbDHc2S9OGX3B
	 9JpOCV8Q9ApJstpZHhUJRjKjRG9H3rJdInA/HmgqlkLwwUpCd+L6QlezzR6rLy7otL
	 aKC3KUaagtPTXQDtZkzncR+c/SlrbTVmiLf5z396DxfIBcDp7IExBd4oSehUKKvTDC
	 hcOy74FkPmOpg==
Message-ID: <0b065a56-5ab1-9be4-d92c-f7bfec629a3e@collabora.com>
Date: Thu, 23 Jun 2022 11:19:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 0/4] Add MT8186 ADSP dt-binding
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
 YC Hung <yc.hung@mediatek.com>, Curtis Malainey <cujomalainey@chromium.org>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220622062245.21021-1-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220622062245.21021-1-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_021933_468638_C269DFF9 
X-CRM114-Status: GOOD (  11.74  )
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


For the entire series:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

> v3 -> v4:
> 1. Update commit message of patch 1/4
> 2. Add review tag to path 3/4
> 
> v2 -> v3:
> 1. Change mbox-names to rx/tx for both mt8186 and mt8195.
> 2. Update description of mbox-names
> 3. Use static string array instead of kasprintf
> 4. Align clock names in dsp driver with dt-bindings
> 
> v1 -> v2:
> 1. Change mbox-names from mbox0/mbox1 to rep/req for both mt8186 and mt8195.
> 2. rename clock-names and remove unused headers
> 
> Tinghan Shen (4):
>    dt-bindings: dsp: mediatek: Use meaningful names for mbox
>    firmware: mediatek: Use meaningful names for mbox
>    dt-bindings: dsp: mediatek: Add mt8186 dsp document
>    ASoC: SOF: mediatek: Align mt8186 clock names with dt-bindings
> 
>   .../bindings/dsp/mediatek,mt8186-dsp.yaml     | 91 +++++++++++++++++++
>   .../bindings/dsp/mediatek,mt8195-dsp.yaml     | 10 +-
>   drivers/firmware/mtk-adsp-ipc.c               | 36 +++-----
>   sound/soc/sof/mediatek/mt8186/mt8186-clk.c    |  4 +-
>   4 files changed, 110 insertions(+), 31 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
> 


