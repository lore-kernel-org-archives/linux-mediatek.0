Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C12C6FA81
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 09:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8msG1rhXgtOMRDJjBUQ5BnFmaz6xpHqQiiGZ/GDgUNQ=; b=pj62V2N+7kl+QcHGVl6blSrQLF
	EGntRxqvSmOx7CMsr6h7Fgeuvz9v9+vdE8UK0EOoIaZYM/+TXV6p7aL0aUGZCS2CwrM6ED61fYJZt
	x38YOao8fhaCJNJ7Fpx6TqcJVsvh3sfZojCQugH78PNG+9vn8pTlFhlrpKCiK+c1jbwVNRBCexUxf
	0uyrgdhQ9prYoey0sy/2Tbxdv45m+lFTf+SSVReimcX173MXJxNJ/vxElNHYEy+T5mNObWCVmoHSc
	PzRsrtX0kiZfPR1KlIfxGhVMHhgN0tLetKP1/cK+31yCqQ/loKUNB3AN2URFUdNzI2lpMCJMW8iPM
	OxoyCRSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU2hi-002Ma2-T8; Fri, 02 Sep 2022 09:11:10 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU2hN-002MJN-GA; Fri, 02 Sep 2022 09:10:51 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6D44A6601F04;
	Fri,  2 Sep 2022 10:10:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662109848;
	bh=lDJ9dZRK9MgMljtZl2+U/+k0zbMoLNgyT3MdX+UUElE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RYKJ4rmIkBKJ2y0peq0CDqlputlhNbpNUSAKuCxM7tyuMEXWz+AGEpEBpoM5phane
	 QFy/faz1o2AOPz1NFQUJ5SoEniZizj5rdVd4mKszXzBVyfTp8Ii66PaGz+PLitkYbq
	 qepVJTYeMLNzmt9du+amJeji8HPfRRbqxzmBUyCCAmIXlMKn2Xu5Rshk5jWrL0u/UM
	 KL7gmOO3ZBvBWW6BAdDXffcWb2QYrftkEsVFwUBlw1t6vNzgm1o8OeJCHIG0dg6Yjn
	 GMlZP7KHhyQwUuggnacXvBLtUqtv5j2Gqsv1sMhPMqQQHazBF9+HqrNfplYNLr1hUS
	 qtbyY6gdjJCNA==
Message-ID: <ee6221e1-8ce6-9fe0-6094-1cd156fdaae3@collabora.com>
Date: Fri, 2 Sep 2022 11:10:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 3/3] media: platform: mtk-mdp3: fix error return code in
 mdp_vpu_dev_init()
Content-Language: en-US
To: Sun Ke <sunke32@huawei.com>, mchehab@kernel.org, matthias.bgg@gmail.com,
 hverkuil-cisco@xs4all.nl, ping-hsun.wu@mediatek.com,
 daoyuan.huang@mediatek.com, moudy.ho@mediatek.com
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
References: <20220902085820.3777360-1-sunke32@huawei.com>
 <20220902085820.3777360-4-sunke32@huawei.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220902085820.3777360-4-sunke32@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_021049_722659_6B27C714 
X-CRM114-Status: GOOD (  14.70  )
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

Il 02/09/22 10:58, Sun Ke ha scritto:
> If mdp_vpu_shared_mem_alloc failed, mdp_vpu_dev_init should return -ENOMEM.
> 
> Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
> Signed-off-by: Sun Ke <sunke32@huawei.com>

Hello Sun,
thanks for the patch! However, someone else already sent the same fix and it's
in a better shape. Please look at [1].

Thanks,
Angelo

[1]: https://patchwork.kernel.org/project/linux-mediatek/patch/YxDGFMwyeNXFPaig@kili/

> ---
>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
> index 9f5844385c8f..078040b7f65e 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
> @@ -175,6 +175,7 @@ int mdp_vpu_dev_init(struct mdp_vpu_dev *vpu, struct mtk_scp *scp,
>   	mem_size = vpu_alloc_size;
>   	if (mdp_vpu_shared_mem_alloc(vpu)) {
>   		dev_err(&mdp->pdev->dev, "VPU memory alloc fail!");
> +		err = -ENOMEM;
>   		goto err_mem_alloc;
>   	}
>   
> 



