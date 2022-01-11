Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3990AC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 13:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iwzN2cbRg1akxX6MRAOPwT+p01FAfZjVXtt4x/+V0qM=; b=Rlwur3ISaieduJuM6+RyYDsT9d
	X/gsGXLlMLE9QX/eN+IkJ0XgFzP+CwAiO6Me0MJK4Sgh8iVsXi2TQ8yXKl883j6Vtr1ymCSJ7AI5i
	MePs+WdLDPH0d2Eo3DV0ifFhY9X/nNaDJHm0C1HTqQJvZjinj8o9uk0ma9jNS9r/bZX03TvQHAqUZ
	HZQrmdGx4oXmVRj660XM80070ULfeEBY/whAn+YJHduToKJDZhWMtqMbJs/qhuWbXvgvnQsg7ra0m
	KwxJy+1KhQJhvPBeiHqDRWDiaAY3j3tKhpX+MSH2RhAOnucrm07InIyrWqglt7b4ctLjK2hGvuYPZ
	E7Ea03cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7HQ8-00GR2Q-3x; Tue, 11 Jan 2022 13:42:40 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7HPp-00GQrJ-Vg; Tue, 11 Jan 2022 13:42:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 4DB811F41337
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641908540;
 bh=lDIG2k9eO2sPUSgI8LCCCH2mTrm9xRp/KzzWiMNNXf0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=SfFOkBYkK2fg5l+m5qJdXlftvPEmqYa4m+zRVveFr01WmlrICnNry3gsvZm9p08Zs
 /U/GWOrAHBEkGcZsvm8g3WZrLJVbzh7CLtq6qtwo/pse/YEVjoDLFjMaHCn3Yy10Oo
 OUrJOEbHIwpMRoLJ+nVsZ4qlJRwM8Glu+HyPV/1LvHVSbExGiqD8RSCO0jIuKL1dUl
 /oVJS7aPSrhid5G9fU9EXoyi83XpGByDm2vfE1czjjgcTlW0uYOPhwdYnZ8vd5zqy9
 Nhap0hmwxuqJo0pyeZQ1xGIMVa7qLqTwx9JU9FWLElWD3WOCBtayQFuH2wHDJVxLT4
 hq/DwkmduIIoQ==
Subject: Re: [PATCH 2/7] pinctrl: mediatek: paris: Fix PIN_CONFIG_BIAS_DISABLE
 readback
To: Chen-Yu Tsai <wenst@chromium.org>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Guodong Liu <guodong.liu@mediatek.com>
References: <20220111112244.1483783-1-wenst@chromium.org>
 <20220111112244.1483783-3-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <8ca8dd15-30c3-a89e-9a18-c8b8788e0904@collabora.com>
Date: Tue, 11 Jan 2022 14:42:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220111112244.1483783-3-wenst@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_054222_194517_76A17219 
X-CRM114-Status: GOOD (  20.38  )
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

Il 11/01/22 12:22, Chen-Yu Tsai ha scritto:
> When reading back pin bias settings, if the pin is not in a
> bias-disabled state, the function should return -EINVAL.
> 
> Fix this in the mediatek-paris pinctrl library so that the read back
> state is not littered with bogus a "input bias disabled" combined with
> "pull up" or "pull down" states.
> 
> Fixes: 805250982bb5 ("pinctrl: mediatek: add pinctrl-paris that implements the vendor dt-bindings")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/pinctrl/mediatek/pinctrl-paris.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index f9f9110f2107..1ca598ea7ba7 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -97,8 +97,8 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
>   			if (err)
>   				goto out;
>   			if (param == PIN_CONFIG_BIAS_DISABLE) {
> -				if (ret == MTK_PUPD_SET_R1R0_00)
> -					ret = MTK_DISABLE;
> +				if (ret != MTK_PUPD_SET_R1R0_00)
> +					err = -EINVAL;
>   			} else if (param == PIN_CONFIG_BIAS_PULL_UP) {
>   				/* When desire to get pull-up value, return
>   				 *  error if current setting is pull-down
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
