Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A369C001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jul 2023 13:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rkC9DRWcNXlB4Sx+heRDQHWcnY9DvSUU05ANlOgPUwE=; b=x1FA6FVOZ4VFCqcs+HMedtBCqU
	xCWj3I8cGHaXQBZxCafAkgQPtuHw73B47Q4W2rEaS3b0fXsqI0PEjFgvZiSGRlTCrL2S5g6/+W59Z
	5cHZie7QTNtoLtUvGqB9rDER56iy7NtWJfaJp9ZVfav/V8hFJcnvnQajOZhX39CpWKH08j3WDuF04
	3EfaRGMC8aCVANra+0EZOyQusjRX19FmycNJ3yfoQdl7nlW9l/O17YKOT1c3ujB2q6TVUv78egsBp
	vhkFYZqu4yZVkU7Ezb/dLNOlT+UERF63rSOdX4xLlzs2+8akLTdzY32nzrdI+XGUIXXVGHr76ymb2
	iEdPu69Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQT3T-00FpFQ-35;
	Mon, 31 Jul 2023 13:35:23 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQT3Q-00FpE4-2B;
	Mon, 31 Jul 2023 13:35:22 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E56EC6606FD9;
	Mon, 31 Jul 2023 14:35:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690810517;
	bh=vXYdwuWWssmuPwqUqCNDUS6WYl7HIDaFQxEbS2ZYzH0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jO2JHy7n1CCI+MkmkIVqAgz4PNh61jcXkFQb66KzT/xDlFGZ+LU1DyoikiYVWjU/I
	 Eml2fnnNVguX7xXwEW3i+en8wZq86SeJSqZato8HOMB5H3wjnrUW9ev3hnmiRYaJOy
	 b4TfWAYgkYmNYuCoYbZhTLLjzxSx0ImX3A8+53m5W7jIGbBBHfHVVhaSynQXjgrxGt
	 /gNrXOzu6J1yj7GhWAS1bDsVSn+eSAFI/IdWtJwY9FSem1/jE3sWaWbtYAdCs+bzEp
	 bFwlVNYC1q/ZUWmwAfaCSD+R9wZRsGsRTDX2bHd73DM4789qG/Wvkb3KE5MLl2QJIm
	 djbkgGr70V4fg==
Message-ID: <3c6f6ca4-c563-525e-e773-3539678956ae@collabora.com>
Date: Mon, 31 Jul 2023 15:35:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] ASoC: mediatek: mt8188-mt6359: support dynamic
 pinctrl
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, matthias.bgg@gmail.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230725035304.2864-1-trevor.wu@mediatek.com>
 <20230725035304.2864-2-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230725035304.2864-2-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_063520_899711_6C34CC34 
X-CRM114-Status: UNSURE (   9.51  )
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

Il 25/07/23 05:53, Trevor Wu ha scritto:
> To avoid power leakage, it is recommended to replace the default pinctrl
> state with dynamic pinctrl since certain audio pinmux functions can
> remain in a HIGH state even when audio is disabled. Linking pinctrl with
> DAPM using SND_SOC_DAPM_PINCTRL will ensure that audio pins remain in
> GPIO mode by default and only switch to an audio function when necessary.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



