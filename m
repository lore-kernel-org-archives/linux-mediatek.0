Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873AFC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 13:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cLW9UqZ3huNHz58Vq+trpaeBdfg6OYq23RDpbPWybbw=; b=bwYMuG9WhUGDgFKM0dnh6zhZgV
	eARwtn00aCta/UcBZzU13xzR/I19AK8bP3+jkEPKOzb9EI501MaijE5V3jwx5XJgomOCe0Q2j6UnM
	HyUXiluZSoAZHCA/oPSW8t1x1Uwa5CFY4dbGBU8fXEDqvsDFafKoMOJQ+V7Q05VSqoH5bCyv6M+IA
	64Z90lYffJAFZENpUSdVgTvp9u0TvvkTmak7Fb/bXgIWG8goVj9XVKtA26IJnAQPe1qblPUJzyRBf
	jZZAy870vf1qHn0bWqRfNPgTfff77V/6DgdQh0qCBRmo2KqchgxVvbfI4en17S5bsd96Opb2/ym4i
	mX5hfSgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o40aP-00AdYm-5m; Wed, 22 Jun 2022 13:40:01 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o40Sb-00Aa7Z-5r; Wed, 22 Jun 2022 13:32:01 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5A94566017B3;
	Wed, 22 Jun 2022 14:31:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655904714;
	bh=GXPW8eVZucPlabvBsj1O4A8AjaBWiHsVboTbgSoHxTA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JLPoC68GILDBMexQ17xPftwnfPgsXyisoN95ynJ5FFvZ+KnXtDVl1tkBCMu3nCIBo
	 P6SL0TVSKYV4VXFrD0QpYfYby2tCFSYtk/UiqurbS6d7G0WyJs25/jfhx+8MJ4EkN8
	 qKOLW/e6wDmsD1bfuViqWlt74K6dddUmyNxHdn+k5ORYLSZ4ZgJreaFdXtN/sU3oOA
	 ZAqyNQk08cdyUHIlbc6XOJwe8KbGEjjo8mZey708+TwvoFmLh64g2N0qDY4iZJ3dwV
	 TMC3FHkgOpsxy1NXG94K46X00EEHmc8P6HqnE3pzwBBbINCy80z5931SXOm8I4Vyfa
	 Eo71nviG5ZSXQ==
Message-ID: <26854a9b-09c2-c14e-eabe-cfc574d6012e@collabora.com>
Date: Wed, 22 Jun 2022 15:31:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] soc: mediatek: mutex: add suffix 0 to
 DDP_COMPONENT_DITHER for mt8395
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Fabien Parent <fparent@baylibre.com>
Cc: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220622131952.29583-1-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220622131952.29583-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_063157_439166_1884F243 
X-CRM114-Status: GOOD (  15.52  )
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

Il 22/06/22 15:19, Jason-JH.Lin ha scritto:
> Add suffix 0 to DDP_COMPONENT_DITHER for mt8395.
> 
> Fixes: 141311b856d8 ("soc: mediatek: mutex: add MT8365 support")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>


Hello Jason-JH,

you must've missed my commit, sent two days ago, which is doing the same:

https://lore.kernel.org/lkml/20220620102454.131417-1-angelogioacchino.delregno@collabora.com/T/#u

Anyway, I have avoided to rename the definition, as from what I understand
MT8365 has only one dither mod and that's called "DITHER", not "DITHER0"...
...but I've added the suffix to the array assignment, as that's what we have
in the enumeration.

I think that #define MT8365_MUTEX_MOD_DISP_DITHER should be kept as-is.

Also... this commit is not fixing anything, as it was already working before,
so the Fixes tag shouldn't be present.

Regards,
Angelo

> ---
>   drivers/soc/mediatek/mtk-mutex.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
> index fa8e0ba38803..3b25fd6b91aa 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -130,7 +130,7 @@
>   #define MT8365_MUTEX_MOD_DISP_CCORR		13
>   #define MT8365_MUTEX_MOD_DISP_AAL		14
>   #define MT8365_MUTEX_MOD_DISP_GAMMA		15
> -#define MT8365_MUTEX_MOD_DISP_DITHER		16
> +#define MT8365_MUTEX_MOD_DISP_DITHER0		16
>   #define MT8365_MUTEX_MOD_DISP_DSI0		17
>   #define MT8365_MUTEX_MOD_DISP_PWM0		20
>   #define MT8365_MUTEX_MOD_DISP_DPI0		22
> @@ -358,7 +358,7 @@ static const unsigned int mt8365_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>   	[DDP_COMPONENT_AAL0] = MT8365_MUTEX_MOD_DISP_AAL,
>   	[DDP_COMPONENT_CCORR] = MT8365_MUTEX_MOD_DISP_CCORR,
>   	[DDP_COMPONENT_COLOR0] = MT8365_MUTEX_MOD_DISP_COLOR0,
> -	[DDP_COMPONENT_DITHER] = MT8365_MUTEX_MOD_DISP_DITHER,
> +	[DDP_COMPONENT_DITHER0] = MT8365_MUTEX_MOD_DISP_DITHER0,
>   	[DDP_COMPONENT_DPI0] = MT8365_MUTEX_MOD_DISP_DPI0,
>   	[DDP_COMPONENT_DSI0] = MT8365_MUTEX_MOD_DISP_DSI0,
>   	[DDP_COMPONENT_GAMMA] = MT8365_MUTEX_MOD_DISP_GAMMA,



