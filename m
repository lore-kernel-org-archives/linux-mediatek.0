Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79EE5C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 13:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5sLfh+LsSYAIBjBj6AFMTS6PkcZwhNcRZmc7ZwFZPow=; b=ijI2KUiZJSnujI
	eqs3KyQqUyVhqPGggEIOhviqUVYdTUtRTeQIL7Fjw7tgRQAhGxAbOgKJB1RixFKikJRdcfq3wO77G
	qzcyFAHGM8DDGs0AVVK17X1VfrMI5wF4OGe0ZWBGy8yqbku/YP3JjsPLTzS8BQOeiIhVsIBq7RZQu
	+SpoYw2fs5wqBDGfCENCsgLRF+0FFdazOdgcXrN/trNqud0Rl741w16ILe/u/9ymag/k83V2fx3lr
	tiNcGXFa+byrhBTeDaz8ZB7awQRia3zv30IRCUEq6L2D0vxXON9Z0pEoZW1CVXTqY6yDIQQkWaerV
	U4cr9rSTmf7KeDdb52FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJyEQ-002uB9-IR; Tue, 15 Feb 2022 13:51:02 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJyE7-002u60-Me; Tue, 15 Feb 2022 13:50:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 9B8BA1F448B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644933041;
 bh=JEcDT8iPPVtEnaL6xs6DtX0CKuxeUOZEe9hsBxgR2z4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OQa27yycZygiqlg97jFpe1s1CT+O65NkTKyAR1mNpRKZzCFu5feVvNmKiPkykjyk9
 /oCrPmjmmC2NtUxouPoNojQmfP/hItZ2ymEGFwBffcUVK95PnCj8rmqHrHVT0BTXkX
 XXHBBWb8HsMLF0KKcF8R3Fa75aEBhxK3//NjM0b/8LIpBeRTTEyaLpwZUAE68Eb57p
 QNeAggHo1x/ILYPniE9atM+/LJPZUhWuWlpiDrYPRFzhB2fQuvzDSZldwoDIGW2Xea
 0VGRrJymNHQgaxZLxe764OTGEl2dXmY1AW7VkI/q0eLEQe1cf61CgMct4Bq/hDwdV6
 Pw01HFV4aPYtw==
Message-ID: <8b728682-55f1-60a1-b41d-23ccac2a4e99@collabora.com>
Date: Tue, 15 Feb 2022 14:50:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v17 2/2] mailbox: mediatek: add support for adsp mailbox
 controller
Content-Language: en-US
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, tzungbi@google.com,
 cujomalainey@google.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Kevin Hilman <khilman@baylibre.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sound-open-firmware@alsa-project.org
References: <20220128110829.17202-1-allen-kh.cheng@mediatek.com>
 <20220128110829.17202-3-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220128110829.17202-3-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_055043_905466_241B22AB 
X-CRM114-Status: UNSURE (   9.45  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 28/01/22 12:08, allen-kh.cheng ha scritto:
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> 
> This patch is to for MediaTek ADSP IPC mailbox controller driver
> It is used to send short messages between processors with adsp
> 
> Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> Reviewed-by: YC Hung <yc.hung@mediatek.com>
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
