Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CAFC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Nov 2022 09:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+xnXIoiWTSwBrwNmbJWLnpmPz4Db09gWBmu9XYMDJTs=; b=ZHFsYTHdNAP2SqRj63p+JKvqsS
	OqS63q5zK0IXSg6DtKQzjXgJ2Sez7REdOAeEGIdCZxs3C22uuOs0eWyQAIE42OPAAZypGwez4L7hH
	fpmoqEsQBDvCDdz97iABrvDyH1vIrjs3skut62Wp6AbHWp8tYtOXYZyKkdFpDnVpljAnFv7zxhvhy
	MIYFQUt3ibOP+Vre5cQ4HJTjqJ0SV9ke0RQ92fDhCckeQN/Zg8fs92iu7C00yEt36x9OkBPw66APD
	vyrmrZoTxeANi1mRWLz7/vAC5lsYE+9nEt5aeEWiIpnLkkjYROUnfdWTqG3fU3WEXaAnNZO4NqhlI
	IGJp/0ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0JeA-00FBSj-Fo; Wed, 30 Nov 2022 09:44:54 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0JdO-00FB4a-H9; Wed, 30 Nov 2022 09:44:09 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 020AF6602B56;
	Wed, 30 Nov 2022 09:44:03 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669801444;
	bh=iSy5K/9Oym2Y4hj48BtEydq7EQhDRhCIlMJ13ol2HcQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O6HbZJ0E3KV/fMjZlggLp/zWf0hhywnQr/KM/2tOStuGzLOyhKWV5AxnP6gkUVUeH
	 artscZj5VJihiL/Yk4882Rd3ljZCUKKLvTK04oZIAxyE75d7NBrdhO1KIHz2f76xRM
	 InuLBBqjLTmNPvEXMebONWzupbO8F50Y3BMzMXy+BPlYM15GzhOYvwHRi61YUkRLgh
	 1akurVnLaTFDtmVqTwHDXzUQovTunZ/1vEdGTp8vCBkWZX6SoEUbPgdY1URigKTWd9
	 lP5NPuYc1Ppt5ZUtlGYRDxSV+leTN+BNnx9Meu2Ya0YcW5VHIyZkQ7MCvWdbEz/7CT
	 dieCBt3MtTXXA==
Message-ID: <fc7ac761-eb81-347b-1c51-cdc9c786ee5b@collabora.com>
Date: Wed, 30 Nov 2022 10:44:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] media: platform: mtk-mdp3: Fix return value check in
 mdp_probe()
Content-Language: en-US
To: Qiheng Lin <linqiheng@huawei.com>, mchehab@kernel.org,
 matthias.bgg@gmail.com
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221130081312.35523-1-linqiheng@huawei.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221130081312.35523-1-linqiheng@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_014406_833090_187DCA99 
X-CRM114-Status: GOOD (  19.38  )
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

Il 30/11/22 09:13, Qiheng Lin ha scritto:
> In case of error, the function mtk_mutex_get()
> returns ERR_PTR() and never returns NULL. The NULL test in the
> return value check should be replaced with IS_ERR().
> 
> Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
> Signed-off-by: Qiheng Lin <linqiheng@huawei.com>
> ---
>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> index c413e59d4286..7a2d992dd842 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> @@ -207,8 +207,8 @@ static int mdp_probe(struct platform_device *pdev)
>   	}
>   	for (i = 0; i < MDP_PIPE_MAX; i++) {
>   		mdp->mdp_mutex[i] = mtk_mutex_get(&mm_pdev->dev);
> -		if (!mdp->mdp_mutex[i]) {
> -			ret = -ENODEV;
> +		if (IS_ERR(mdp->mdp_mutex[i])) {
> +			ret = PTR_ERR(mdp->mdp_mutex[i]);
>   			goto err_return;
>   		}
>   	}
> 

That's true, and I fully agree.
While you're at it, can you also fix the err_return case?

if (mdp)
	for ...
		if (!IS_ERR_OR_NULL(mdp->mdp_mutex[i]))
			mtk_mutex_put(...)


Thanks,
Angelo

