Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA8EC00A94
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 10:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QuIFUiYUsBi/qT0z8ZMOx5eGVXDk0IPZMen/FE9GmPU=; b=q8MfOQFBTY+NjqoXsyvD7oWpKd
	V8W+FoujwK/1nOi75lDoSsMIx4MisxT3+ei/pPrv2xwhbuYwDavxRW5/OQuQL+AMVZ0LzDlLhIWLR
	kaLRaYYAUj//9Ts3BI8WWGZeqC9qeGdUUMvmeqsCr96wbCFMTifmZradP412FTnq1aEwP4GsBz2B6
	BjMrCgWKlMKiNk9CQoXbtZM9qifBnlfFW/W4C1wjdXL+uQVexsri8LydXN7NNkYvly+5D33Xme23z
	7T1tf8sJV22a1mo4zvMkywRRF7z0C8ppaXPqdTouyd0013n/NwkkkZS0MTmTvhxKNoHJ9aEnp6kmC
	H9cZrFpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwJtv-00000007vZF-0Fih;
	Mon, 15 Apr 2024 10:49:27 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwJtm-00000007vVi-1qD6;
	Mon, 15 Apr 2024 10:49:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713178157;
	bh=VkoLIjMfNZTvr+tRbMnom1duDqUONl1TjFQKiVbF0Lc=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=HArTBWPxAA1OrcKymipiXN8qbO9S5Bxwi1bJlVkM8V8CEkZnDLCO94fzTJ0dBEGNY
	 QlZMhM3fFb70b7JfPkGeAQ3jSbFJ6ciXk/8T6RY59xgdsfEJvukShzBr/7ANPuZKb7
	 Aa5jtJqJ5HqhIEcdHKWzetM2tg1esivxIAgdL0P0ZKOIdPsFZuMSVEe5MFET2v1sQ0
	 1+bSPuq60FLiKHuKRSC0VjDMptnQZoHH2f4TqNuaCTkvzqISqtyqK6IxOZeTEWbLR0
	 hhWFaOmsae1RfucFStqX8jcnICLgbORycGbAKGQQ3V48kXcMP9Alik/fdTjtlRj+5O
	 dNRYZD8SDmzsQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D278037820AB;
	Mon, 15 Apr 2024 10:49:15 +0000 (UTC)
Message-ID: <47348f40-0902-4a52-8ec7-79b202916486@collabora.com>
Date: Mon, 15 Apr 2024 12:49:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 13/14] ASoC: SOF: mediatek: mt8186: Constify
 snd_sof_dsp_ops
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240414-n-const-ops-var-v1-0-8f53ee5d981c@kernel.org>
 <20240414-n-const-ops-var-v1-13-8f53ee5d981c@kernel.org>
Content-Language: en-US
In-Reply-To: <20240414-n-const-ops-var-v1-13-8f53ee5d981c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_034918_676189_671837F5 
X-CRM114-Status: UNSURE (   5.89  )
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

Il 14/04/24 20:47, Krzysztof Kozlowski ha scritto:
> 'struct snd_sof_dsp_ops' is not modified by core code, so it can be made
> const for increased code safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


