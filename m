Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A94C001DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jul 2023 07:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ikHJ80QHJ1+1eg/aMRSdmfO7Fo9j+Wx0A0t69cPy/0=; b=OF/ntajIlF+EutUUS24MNmo9he
	PDIm3+itD3HufuzGcRs/uaPEFPDIYwG4PSnOz3sYC3Qjd8LLfhq17XoyvQOCOoIivW63Q447wHkId
	U2pH+3QuXlnMTNlw8l7c8X5ObvnuJ4u5XniV1jbW0OgQCfHPhrPRBOW9bmK8ODhCdZ2P5GB1TCaXC
	Lm3wdH7Osqn1dlcCkhxjPHP1W8SvxlgIwYaebWJfZqQTWJkKJjnMW7l8ogyg+0i/o47Omq9yfyl/e
	qTIo0Zz+eF48BQJGXmnXn+6T+gSoJbNhyZlfHHe9chZouaw1NhwnObKqi4hgo/qQ02OhDdUFKzFUz
	86GI8ESg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOYWf-009LHx-18;
	Wed, 26 Jul 2023 07:01:37 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOYWb-009LF9-1o;
	Wed, 26 Jul 2023 07:01:35 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D32EA6606FCD;
	Wed, 26 Jul 2023 08:01:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690354890;
	bh=b3275iZpeVMp7nlokph744oUHdv+Z9l5geLiebs0KXw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AGGIjrK1AuhE4G3/2REeqPS4TJ2FRl25j8vVbcMqiVq2MlrPCIAd55MPFSwbMpPD8
	 n8InzWlzbUkEAItf9kNquzNKvx1c796WVHHlA/WGUNCBaje9GqkcfiT90/gWDP+C5K
	 yxxfXeQVYk0CgcH7WEKRbnJJvxCWtBkB6ERJe1VJUOZqmSC13hQFNiEQnrayjJpnec
	 JYX7BwUEUM9BOg/9byTpO+hoLfnmVyfnpPfHBe7v4QzHYgnPtgQmrr+4HfmxZ490eC
	 B5a/ANfAO28MTYS7rSsygVd4A4qn11nZL18pYrhEZlL10tlWTJ+/NdInrxhqP3HnxY
	 FgXWhaSfnxyDg==
Message-ID: <5a7c6b24-03f1-dd33-5911-ce046ee140f1@collabora.com>
Date: Wed, 26 Jul 2023 09:01:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: mediatek: vcodec: Consider vdecsys presence in reg
 range check
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: kernel@collabora.com, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230725204043.569799-1-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230725204043.569799-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_000133_745881_F6BDDAF7 
X-CRM114-Status: GOOD (  20.36  )
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

Il 25/07/23 22:40, Nícolas F. R. A. Prado ha scritto:
> Commit fe8a33978383 ("media: mediatek: vcodec: Read HW active status
> from syscon") allowed the driver to read the VDEC_SYS io space from a
> syscon instead of from the reg property when reg-names are supplied.
> However as part of that change, a smatch warning was introduced:
> 
> drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c:142 mtk_vcodec_get_reg_bases() error: buffer overflow 'mtk_dec_reg_names' 11 <= 11
> 
> With a correct Devicetree, that is, one that follows the dt-binding, it
> wouldn't be possible to trigger such a buffer overflow. Even so, update
> the range validation of the reg property, so that the smatch warning is
> fixed and if an incorrect Devicetree is ever supplied the code errors
> out instead of causing memory corruption.
> 
> Reported-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Closes: https://lore.kernel.org/all/b5fd2dff-14a5-3ad8-9698-d1a50f4516fa@xs4all.nl
> Fixes: fe8a33978383 ("media: mediatek: vcodec: Read HW active status from syscon")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> ---
> 
>   drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
> index 742b6903d030..cd62b3f68072 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
> @@ -124,7 +124,8 @@ static int mtk_vcodec_get_reg_bases(struct mtk_vcodec_dev *dev)
>   	/* Sizeof(u32) * 4 bytes for each register base. */
>   	reg_num = of_property_count_elems_of_size(pdev->dev.of_node, "reg",
>   						  sizeof(u32) * 4);
> -	if (reg_num <= 0 || reg_num > NUM_MAX_VDEC_REG_BASE) {
> +	if (reg_num <= 0 || reg_num > NUM_MAX_VDEC_REG_BASE ||

You could also simplify this like

int num_max_vdec_regs;

....

num_max_vdec_regs = no_vdecsys_reg ?
		    ARRAY_SIZE(mtk_dec_reg_names) : NUM_MAX_VDEC_REG_BASE;

if (reg_num <= 0 || reg_num > num_max_vdec_regs) ....

I'd go for the proposed solution, as it looks better in my eyes, but it's
ultimately your choice and probably just a personal preference.

That said, if you want to keep this commit as it is, you still get my

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> +	    (!has_vdecsys_reg && reg_num > NUM_MAX_VDEC_REG_BASE - 1)) {
>   		dev_err(&pdev->dev, "Invalid register property size: %d\n", reg_num);
>   		return -EINVAL;
>   	}


