Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A49E95A97
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Oct 2023 08:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/2HL89Byjt+wBjXFyWeaSyGCSPsfx0tEywIlI4H6swA=; b=cW5aP4UuiZ+YLg9hZTju3IxcWL
	s2kWj91OG4k5nRPvRacD0Nq3sITkH2fBJD36o3v72UntVgJ93Bxi6gHEIcr1pJCnisxM7JUnb4Vzi
	Ito+rS0YntNK+1il/PILYgd5i7zU/E1cteejcauTU/uUCsmh3xA4LPFZbM478JgC9qswzcqHZ8pOD
	PONnRSel6G76JcZ8BWrggwGoaxHzNbO83Rn5Pez4qKzsesFRufAN3NY8VmkHYdBMRiU2BvR0AuRMe
	fAypdJWrRdvgWX6ifgEaqLZLcnzUXx8zUVIcyUi/XMoMDOg4kaXO+Q+XWKtET79LooSJtU4epBArO
	kGGIaiVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qplzJ-00A19p-1Q;
	Mon, 09 Oct 2023 08:51:41 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qplz7-00A10O-2O;
	Mon, 09 Oct 2023 08:51:32 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E9D1D66072A7;
	Mon,  9 Oct 2023 09:51:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696841488;
	bh=MPdLVb/pvOTZLkwQXRDilr3q3ShdQdO9Sr5gzkHwXDs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jJ/dDJsKYGIO7JPg7gDYbl5cO1tGQ54DIuLQSnO2Gbza9F0vf5+Y3eDd8SIlg1kNn
	 HRT18v12JJTvSgBz77n9QcIzmp1Sxt/CliQXn4bAZg90Zodi5C0W3qA89BmWJDp/F7
	 b04d59JxjEqe48xEqBAMvjvg8A/NbEetEREK22AfsIzPyoG7AWnGLEajMk9mK+l1dz
	 Gxi+NVU7QhhqH4Jn4Ogf/IirSSHrUFIcNRAaMzs/cZl4CVGiMUidhe2LkQ30cg5D3k
	 A7JdL9/1XI/1ZLCJeNHYBA13x1hNfNCMkDLlX/WQ1XAFNhJANxbAaAfmOggRTFSLq6
	 mAFp6pdpwn68Q==
Message-ID: <d8fd9384-4db2-014c-c0fe-5cb150cb20ac@collabora.com>
Date: Mon, 9 Oct 2023 10:51:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 7/8] ASoC: mt8186-mt6366-rt1019-rt5682s: Drop unused
 include
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 alsa-devel@alsa-project.org
References: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org>
 <20231006-descriptors-asoc-mediatek-v1-7-07fe79f337f5@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231006-descriptors-asoc-mediatek-v1-7-07fe79f337f5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_015129_906063_F48AD340 
X-CRM114-Status: GOOD (  12.08  )
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

Il 06/10/23 15:46, Linus Walleij ha scritto:
> This driver includes the legacy GPIO header <linux/gpio.h> but
> is not using any symbols from it. AFE has a custom GPIO
> implementation that is not using the kernel GPIO framework,
> so it need not include it either.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


