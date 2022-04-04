Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A3FC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Apr 2022 12:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H+X3Ujf42mtgpVPF8OFGsDPiLYA5yl5msN+UyY0HrfA=; b=YkppmzKy1QPU7aXqnDtDUvClWU
	TTDOgWvsP+XXVj8MUm6d0qIbJXFizMxMoJxCJseFzFplBniuocSV2srC52vEyjmk/zbTQ63yxCsfy
	zwqyXeUt46KLMAdfmV3hEy6fU+KkafIbA4xDBVCPjLyyuxlkSFtIzDHeedwG+PDBT2TdgerfuS5sy
	RsuTBl2w9dWl1ZgGOyOwpKZX6p80gG55eYFH7hw8j2i9HCwkSrwUQBwvJn/2plJr4lGVPerhGOwX8
	174BPudrSJqaXTy6CE9ukY9apkkFx8vCuRILtca1fIU6l2tRLXvPwrv3bJeOp3tzm+quGJkoklQg4
	jm7ZxS1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbLqV-00EsKF-1I; Mon, 04 Apr 2022 12:30:11 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbLqJ-00EsFK-GR; Mon, 04 Apr 2022 12:30:01 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id CCE9F1F44C81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649075395;
 bh=Z7ztsm3Md7Jvnfrh+eL9+Lf65aVRzhlpG24eO0rHEvA=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=ZII2WKTROH8jdnDAzt5U2pGxzVQKtQeF+d85nHqB5WvP26sBmU3HcY+ZgCSdalt/w
 MyE1oOQbTo6iJqLumvHZDDEHlrJNWLEIfxLp731qI2xtj3+KaUU1Oj1XHZv3lc3f90
 gKgvNpdpPQ6cc+nHoNygxlowKPXLsFwTSlTjlosRIFAlzG5K/MbJdBuDUUIL8IyJAH
 bijprzeZUBNtEcRVnwl7RWfNlFnVJxLR50su+PUPN1urxY3I3+mgf5jzho8UDRM2YE
 cQdF/iqxHw3p1GDHcSac7hp0nm8MNerucbcG8fWN21ORt0bQvQmZjWsgTjXZT15WRt
 kPoCuQtncnFPw==
Message-ID: <db1f701f-c2f6-bb89-635e-2871fc781140@collabora.com>
Date: Mon, 4 Apr 2022 14:29:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ASoC: mediatek: Fix error handling in
 mt8173_max98090_dev_probe
Content-Language: en-US
To: Miaoqian Lin <linmq006@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Koro Chen <koro.chen@mediatek.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220404092903.26725-1-linmq006@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220404092903.26725-1-linmq006@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_052959_809017_2DFF1FF8 
X-CRM114-Status: UNSURE (   7.11  )
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

Il 04/04/22 11:29, Miaoqian Lin ha scritto:
> Call of_node_put(platform_node) to avoid refcount leak in
> the error path.
> 
> Fixes: 94319ba10eca ("ASoC: mediatek: Use platform_of_node for machine drivers")
> Fixes: 493433785df0 ("ASoC: mediatek: mt8173: fix device_node leak")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
