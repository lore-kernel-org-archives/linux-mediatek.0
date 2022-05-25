Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F3FC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 May 2022 10:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zXdEjFr1Q9VO/mLppG8m9OIGpao4CjkA5IeLohVZaV0=; b=jTot+ItlB5LwZT
	pWU7o3dUCtRR/82/ntFPTjbqwORZlRAt91mGCfO0psndBMx3JSbh9SqxQckmMN29tB5DAItEUvVBs
	VFZSeCwv0df9MpeTBrMJw9/QnN69+UL4rjFrmJsgHEe8rHP9FLU7ia1oz9KEMr5XhtI1gDbxBzclb
	806/4RXt4Afr/ZTtBcVFP9KwKYLUW7UwKUfKmCWl4cfAaXYOXEcIUqFTdAnfgQmapwDxFej0d68wI
	SwTz/KOu6aZVt7t1FRBrVzGXg2dWgYULY58iIIHagbiPUKri8wAdAmakSyVoV4wf0QN035ole84HM
	963yTClf8C/Zy1hfDfzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntoQj-00Ajbk-02; Wed, 25 May 2022 10:39:53 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntoQV-00AjX3-CW; Wed, 25 May 2022 10:39:41 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: kholk11)
	with ESMTPSA id 5C5B31F448AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1653475175;
	bh=JtMKudCPbVBC4fPSg8WPLsPO72lG8JrBwViYM6bNNoI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ei1cJvaBsJOHecaFd4fbRaXHd2+DhGLrvQgIZDAknuw5CZDoea0DCSET+jljl/Odc
	 I7defVnJskBOCTvNng734y1gn7qK9bQ+krN+2eGUQ44PbKqZhufzA65SgLvGbANq6o
	 c1vBwwjfAWIE88mkjwfvoSmw9b50vTyiXGb6mx7Aa1XVhXzNLfcZNYlgJN4+6KxFfN
	 n1fS6unEx/OgVs+kS/DWLlnj2gXcm//B4/ZSW1Nc+JsugNc2a2Z+jqS+pu/ZA3GQuH
	 UMU+IKDdmvEMx3F/ULu59eHH8po7X6n1OBmguD10pVD2UVqPdljaPqjFqRq6lrqWya
	 AxT5gFkChux2Q==
Message-ID: <54d6c0ff-d93c-0506-4db9-3852c69211ab@collabora.com>
Date: Wed, 25 May 2022 12:39:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v7 1/1] firmware: mediatek: add adsp ipc protocol
 interface
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, tzungbi@google.com,
 Chen-Yu Tsai <wenst@chromium.org>, cujomalainey@google.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sound-open-firmware@alsa-project.org
References: <20220407130338.28939-1-allen-kh.cheng@mediatek.com>
 <20220407130338.28939-2-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220407130338.28939-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_033939_798205_E6498B0A 
X-CRM114-Status: GOOD (  15.11  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 07/04/22 15:03, Allen-KH Cheng ha scritto:
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> 
> Some of mediatek processors contain
> the Tensilica HiFix DSP for audio processing.
> 
> The communication between Host CPU and DSP firmware is
> taking place using a shared memory area for message passing.
> 
> ADSP IPC protocol offers (send/recv) interfaces using
> mediatek-mailbox APIs.
> 
> We use two mbox channels to implement a request-reply protocol.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>
> Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> Reviewed-by: YC Hung <yc.hung@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/firmware/Kconfig                      |   1 +
>   drivers/firmware/Makefile                     |   1 +
>   drivers/firmware/mediatek/Kconfig             |   9 +
>   drivers/firmware/mediatek/Makefile            |   2 +
>   drivers/firmware/mediatek/mtk-adsp-ipc.c      | 161 ++++++++++++++++++
>   .../linux/firmware/mediatek/mtk-adsp-ipc.h    |  65 +++++++
>   6 files changed, 239 insertions(+)
>   create mode 100644 drivers/firmware/mediatek/Kconfig
>   create mode 100644 drivers/firmware/mediatek/Makefile
>   create mode 100644 drivers/firmware/mediatek/mtk-adsp-ipc.c
>   create mode 100644 include/linux/firmware/mediatek/mtk-adsp-ipc.h
> 

Gentle ping for this one, as it's getting stale... and it's ready.

To add context, this driver is *really* necessary, as support for it
is added in the MT8195 ASoC SOF driver as a platform device [1], and the
necessary memory regions are coming from the mediatek,mt8195-dsp [2] driver.

[1]: 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/sound/soc/sof/mediatek/mt8195/mt8195.c?h=next-20220525#n389

[2]: 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml?h=next-20220525#n61

Cheers,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
