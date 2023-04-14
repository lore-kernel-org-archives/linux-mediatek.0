Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9D4C77B6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 10:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MXBrPctTUPFI4+fMCv2nEuHAz0Kkq0AxwEe8bvR//ro=; b=Qhy9ftATlQP9c68HB8Bhw0HtOD
	13zOX64t+UYAxy3zVz9CEDyRlQQJtByk0YG/mBmzxNYYjFBxFp/WwVfVl616CkueTw8Dw2SA//hAK
	jABlfnhsQac5ou+V+M6GfXd8KGytK8RJ0MrObXCWr7Hhc5BxOS3YgAB2Rrp6kvIg88r4YpnvnIN6w
	gyhBWt/JReHAapX9If9uqRuNfkQIlPnRxcuX2YhFWlh6Es3sKMQFN6R5rfR4XYx+pzkoNPuX2edAY
	AZl1gkOaXRWypNkepx5q+dLjTCPm1GnCbAPTcy8Mla8ckRRO5rTjA2sSd67n5u1f4rwlgtCjPndgx
	rk9i1eRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnGlS-009AYO-2I;
	Fri, 14 Apr 2023 10:34:46 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnGlO-009AVu-2N;
	Fri, 14 Apr 2023 10:34:44 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8BE516603222;
	Fri, 14 Apr 2023 11:34:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681468479;
	bh=Wv3E9PUWrZb1LypVjlRkJKgongoVuhTGI7YvkuT0r4E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ym8z5pIXYeL+KxgD1J/F6kLUdC8NENeAzIH6DimNp3bWQPI7DtYYqhnEEfjXzR+lg
	 EKsap0k2N7IrlsgxkT1X1o+GswaNAwhC6gVQ+X2q3vBIBVR+7oW9lCUmLU8glTKtZ9
	 ddf+0HVpsMl+o32s1J+cp/q/Zjbzq/lnNxH59SsTbOGtS4WbjJdRU77q33eS8YvD4B
	 ad2qUc9E3vYPmAefMvBL9BkD+HUrWQus4t9zve069FCYXxN/0ON9nb0n4v1IwvEWA3
	 3CYrEedDnt/9nNDbF3/iV/VoIGc9TSjhSsYw+eHpY+3xQWOOKTs9yttvjj7NRaiPB0
	 bDrMCafVaienw==
Message-ID: <52440231-bbcc-48f6-fe47-a554cade8d73@collabora.com>
Date: Fri, 14 Apr 2023 12:34:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/2] phy: mediatek: hdmi: mt8195: fix wrong pll calculus
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230413-fixes-for-mt8195-hdmi-phy-v1-0-b8482458df0d@baylibre.com>
 <20230413-fixes-for-mt8195-hdmi-phy-v1-2-b8482458df0d@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230413-fixes-for-mt8195-hdmi-phy-v1-2-b8482458df0d@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_033442_919123_B8FE4E8E 
X-CRM114-Status: GOOD (  15.08  )
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

Il 13/04/23 14:46, Guillaume Ranquet ha scritto:
> The clock rate calculus in mtk_hdmi_pll_calc() was wrong when it has
> been replaced by 'div_u64'.
> 
> Fix the issue by multiplying the values in the denominator instead of
> dividing them.
> 
> Fixes: 45810d486bb44 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> index e10da6c4147e..5e84b294a43e 100644
> --- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> @@ -271,7 +271,7 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
>   	 * [32,24] 9bit integer, [23,0]:24bit fraction
>   	 */
>   	pcw = div_u64(((u64)ns_hdmipll_ck) << PCW_DECIMAL_WIDTH,
> -		      da_hdmitx21_ref_ck / PLL_FBKDIV_HS3);
> +		      da_hdmitx21_ref_ck * PLL_FBKDIV_HS3);

How did that even work?!?!?!? Because ... it worked, I did test it. Bah!
Luck was on your side :-P

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



