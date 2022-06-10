Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7876FC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 11:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zaYgF+r6CJLlhuaxRPTzzTam8jENqDUKweO1eOihe7U=; b=JmL02stdV+XvcH
	ekb0+DIGoxH5+lheXXFhfrXJJYTyceg9ArzGFhD3s3z6NTunVZ/vNXE5xIFn7zxuTR/1EGr9iIfFA
	uen/Wq9vwE0/OLMszHL52Q7OPPemd7mgXfTy4CVA7YJvbD2G/DnhImKNrlf27g3TGW2x/B2oG2dDM
	lMxQJjozPH0tmUQxtjr2VNKUgmN7zArIr2jETd7FR4WWlDeytnZ0lch3f/NhdE6TPA4bQ6K6AlMIN
	FeC3fhJoSbQxGJa/GkjwvO1HTgtlcicx3Sbw3N7bnWo7vz1FfIXmh69EOCbaSq9Hhg+bsVxLWMTCL
	iRyYAfj+5rM/dru6K7jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzcfn-007rAk-Cr; Fri, 10 Jun 2022 11:19:27 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzcfX-007r3u-87; Fri, 10 Jun 2022 11:19:12 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EB978660168F;
	Fri, 10 Jun 2022 12:19:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654859947;
	bh=Ck+aYJKkUbyZ3UmbDm/L1PWoLd3XeECCKHIxgTNarSM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XQiNd351At0P50R0TJzHHgKeVENhyQeIDbJ3qjfyPsPUESyv/aO8V4EB7q9WVCdX7
	 9uxiYwada4ZenUvSAyDO74A4AZZt+he2ZKDswZBch9Z+TFWAQ0Ym232nsFalFycVwG
	 IfK3a/bqGEodtFio4z1xjM8e27J5CtlRYbdBOBvb9qprurjsEVu5WCcT49b+DsZIM5
	 k4XtBLlGXdMpjySf5Eb0csLDTj23HQY79jkWZa42kPdv+bL4/6WJKKmVo2UYY6h8JW
	 t6o/LzNcPU1YyLqtC5aHnCEl0HHvHt8uHAxCgRbYLhfnHCnHJchMgetLB81HcQf8IJ
	 NpTL8QtCXiCuA==
Message-ID: <3228e9af-02a6-5814-b76d-463214cf76e4@collabora.com>
Date: Fri, 10 Jun 2022 13:19:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/2] pinctrl: mediatek: common: add quirk for broken
 set/clr modes
Content-Language: en-US
To: Fabien Parent <fparent@baylibre.com>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220530123425.689459-1-fparent@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220530123425.689459-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_041911_565281_522C2720 
X-CRM114-Status: GOOD (  20.16  )
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

Il 30/05/22 14:34, Fabien Parent ha scritto:
> On MT8365, the SET/CLR of the mode is broken and some pin modes won't
> be set correctly. Add a quirk for such SoCs, so that instead of using
> the SET/CLR register use the main R/W register
> to read/update/write the modes.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>   drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 46 ++++++++++++-------
>   drivers/pinctrl/mediatek/pinctrl-mtk-common.h |  3 ++
>   2 files changed, 33 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> index f25b3e09386b..156627d9c552 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> @@ -330,23 +330,37 @@ static int mtk_pconf_set_pull_select(struct mtk_pinctrl *pctl,
>   		return -EINVAL;
>   	}
>   

That's not the right way of doing that, unless there are other SoCs that are
actually affected by this issue (and besides, any *new* pinctrl driver should
be using pinctrl-mtk-common-v2, which accounts for this quirk already).

Since MT8365 seems to be the only SoC that is affected by this issue, there's
a spec_pull_set() callback that you can use and you can indeed define your own
function in mt8365-pinctrl.c instead... but this, only if I got it right (and
I think I did, but please recheck!):

In this function, the call to spec_pull_set assigns 'arg' if 'enable == true',
else, MTK_PUPD_SET_R1R0_00...
...for "generic pull config", as stated in a comment in this function, 'arg' will
always be either 0 or 1, so you will get passed either:
     - 1, if pull-enable; or
     - MTK_PUPD_SET_R1R0_00 (100) if pull-disable.

Though, if I got the '1' part wrong, it's still doable because you care only about
one value in your case, so, if you get a MTK_PUPD_SET_R1R0_00, this means that you
have to do pull-disable.

The other args are passed as they are, so that's golden.

Regards,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
